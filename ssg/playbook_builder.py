#!/usr/bin/python3

import os
import re
import sys

from collections import OrderedDict

import ssg.rules
import ssg.utils
import ssg.yaml
import ssg.build_yaml
import ssg.build_remediations

COMMENTS_TO_PARSE = ["strategy", "complexity", "disruption"]


class PlaybookBuilder():
    def __init__(self, product_yaml_path, input_dir, output_dir):
        self.input_dir = input_dir
        self.output_dir = output_dir
        product_yaml = ssg.yaml.open_raw(product_yaml_path)
        product_dir = os.path.dirname(product_yaml_path)
        relative_guide_dir = ssg.utils.required_key(product_yaml,
                                                    "benchmark_root")
        self.guide_dir = os.path.abspath(os.path.join(product_dir,
                                                      relative_guide_dir))
        relative_profiles_dir = ssg.utils.required_key(product_yaml,
                                                       "profiles_root")
        self.profiles_dir = os.path.abspath(
            os.path.join(product_dir, relative_profiles_dir))

    def get_profile_selections(self, profile):
        """
        Provides a tuple (rules, variables) where rules is a list of rules
        selected in the profile and variables is a dictionary of
        variables and their values in the profile. The method can handle
        profiles which extend other profiles.
        """
        rules = []
        variables = dict()
        if profile.extends:
            extended_profile_path = os.path.join(
                self.profiles_dir, profile.extends + ".profile")
            extended_profile = ssg.build_yaml.Profile.from_yaml(
                extended_profile_path)
            if not profile:
                sys.stderr.write(
                    "Could not parse profile %s.\n" % extended_profile_path)
                return None
            rules, variables = self.get_profile_selections(extended_profile)
        rules.extend(profile.get_rule_selectors())
        variables.update(profile.get_variable_selectors())
        return rules, variables

    def choose_variable_value(self, var_id, variables, refinements):
        """
        Determine value of variable based on profile refinements.
        """
        if var_id in refinements:
            selector = refinements[var_id]
        else:
            selector = "default"
        try:
            options = variables[var_id]
        except KeyError:
            raise ValueError("Variable '%s' doesn't exist." % var_id)
        try:
            value = options[selector]
        except KeyError:
            if len(options.keys()) == 1:
                # We will assume that if there is just one option that it could
                # be selected as a default option.
                value = list(options.values())[0]
            else:
                raise ValueError(
                    "Selector '%s' doesn't exist in variable '%s'. "
                    "Available selectors: %s." %
                    (selector, var_id, ", ".join(options.keys()))
                )
        return value

    def get_data_from_snippet(self, snippet_yaml, variables, refinements):
        """
        Extracts and resolves tasks and variables from Ansible snippet.
        """
        xccdf_var_pattern = re.compile(r"\(xccdf-var\s+(\S+)\)")
        tasks = []
        values = dict()
        for item in snippet_yaml:
            if isinstance(item, str):
                match = xccdf_var_pattern.match(item)
                if match:
                    var_id = match.group(1)
                    value = self.choose_variable_value(var_id, variables,
                                                       refinements)
                    values[var_id] = value
                else:
                    raise ValueError("Found unknown item '%s'" % item)
            else:
                tasks.append(item)
        return tasks, values

    def get_benchmark_variables(self):
        """
        Get all variables, their selectors and values used in a given
        benchmark. Returns a dictionary where keys are variable IDs and
        values are dictionaries where keys are selectors and values are
        variable values.
        """
        variables = dict()
        for dirpath, dirnames, filenames in os.walk(self.guide_dir):
            for filename in filenames:
                root, ext = os.path.splitext(filename)
                if ext == ".var":
                    full_path = os.path.join(dirpath, filename)
                    xccdf_value = ssg.build_yaml.Value.from_yaml(full_path)
                    # Make sure that selectors and values are strings
                    options = dict()
                    for k, v in xccdf_value.options.items():
                        options[str(k)] = str(v)
                    variables[xccdf_value.id_] = options
        return variables

    def create_playbook(self, snippet_path, rule_id, variables,
                        refinements, output_dir):
        """
        Creates a Playbook from Ansible snippet for the given rule specified
        by rule ID, fills in the profile values and saves it into output_dir.
        """

        with open(snippet_path, "r") as snippet_file:
            snippet_str = snippet_file.read()
        snippet_yaml = ssg.yaml.ordered_load(snippet_str)

        play_tasks, play_vars = self.get_data_from_snippet(
            snippet_yaml, variables, refinements
        )

        if len(play_tasks) == 0:
            raise ValueError(
                "Ansible remediation for rule '%s' in '%s' "
                "doesn't contain any task." %
                (rule_id, snippet_path)
            )

        tags = set()
        for task in play_tasks:
            tags |= set(task.pop("tags", []))

        # play should be a dictionary, but to keep a logical order of elements
        # we create the play as a list of tuples and later we convert it to
        # an OrderedDict
        play = [
            ("name", rule_id),
            ("hosts", "@@HOSTS@@"),
            ("become", True),
        ]
        if len(play_vars) > 0:
            play.append(("vars", play_vars))
        if len(tags) > 0:
            play.append(("tags", list(tags)))
        play.append(("tasks", play_tasks))
        play_ordered_dict = OrderedDict(play)

        playbook = [play_ordered_dict]
        playbook_path = os.path.join(output_dir, rule_id + ".yml")
        with open(playbook_path, "w") as playbook_file:
            ssg.yaml.ordered_dump(
                playbook, playbook_file, default_flow_style=False
            )

    def open_profile(self, profile_path):
        """
        Opens and parses profile at the given profile_path.
        """
        if not os.path.isfile(profile_path):
            raise RuntimeError("'%s' is not a file!\n" % profile_path)
        profile_id, ext = os.path.splitext(os.path.basename(profile_path))
        if ext != ".profile":
            raise RuntimeError(
                "Encountered file '%s' while looking for profiles, "
                "extension '%s' is unknown. Skipping..\n"
                % (profile_path, ext)
            )

        profile = ssg.build_yaml.Profile.from_yaml(profile_path)
        if not profile:
            raise RuntimeError("Could not parse profile %s.\n" % profile_path)
        return profile

    def create_playbooks_for_all_rules(self, profile, variables):
        """
        Creates a Playbook for each rule selected in a profile from tasks
        extracted from snippets. Created Playbooks are parametrized by
        variables according to profile selection. Playbooks are written into
        a new subdirectory in output_dir.
        """
        profile_rules, profile_refines = self.get_profile_selections(profile)

        profile_playbooks_dir = os.path.join(self.output_dir, profile.id_)
        os.makedirs(profile_playbooks_dir)

        for rule_id in profile_rules:
            snippet_path = os.path.join(self.input_dir, rule_id + ".yml")
            if os.path.exists(snippet_path):
                self.create_playbook(
                    snippet_path, rule_id, variables,
                    profile_refines, profile_playbooks_dir
                )

    def create_playbook_for_single_rule(self, profile, rule_id, variables):
        """
        Creates a Playbook for given rule specified by a rule_id. Created
        Playbooks are parametrized by variables according to profile selection.
        Playbooks are written into a new subdirectory in output_dir.
        """
        profile_rules, profile_refines = self.get_profile_selections(profile)
        profile_playbooks_dir = os.path.join(self.output_dir, profile.id_)
        os.makedirs(profile_playbooks_dir)
        snippet_path = os.path.join(self.input_dir, rule_id + ".yml")
        if rule_id in profile_rules:
            self.create_playbook(
                snippet_path, rule_id, variables,
                profile_refines, profile_playbooks_dir
            )
        else:
            raise ValueError("Rule '%s' isn't part of profile '%s'" %
                             (rule_id, profile.id_))

    def build(self, profile_id=None, rule_id=None):
        """
        Creates Playbooks for a specified profile.
        If profile is not given, creates playbooks for all profiles
        in the product.
        If the rule_id is not given, Playbooks are created for every rule.
        """
        variables = self.get_benchmark_variables()
        if profile_id:
            profile_path = os.path.join(
                self.profiles_dir, profile_id + ".profile")
            profile = self.open_profile(profile_path)
            if rule_id:
                self.create_playbook_for_single_rule(profile, rule_id,
                                                     variables)
            else:
                self.create_playbooks_for_all_rules(profile, variables)
        else:
            # run for all profiles
            for profile_file in os.listdir(self.profiles_dir):
                profile_path = os.path.join(self.profiles_dir, profile_file)
                try:
                    profile = self.open_profile(profile_path)
                except RuntimeError as e:
                    sys.stderr.write("%s. Skipping %s." % (str(e), profile_id))
                    continue
                if rule_id:
                    self.create_playbook_for_single_rule(profile, rule_id,
                                                         variables)
                else:
                    self.create_playbooks_for_all_rules(profile, variables)
