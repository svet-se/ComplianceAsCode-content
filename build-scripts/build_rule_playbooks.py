#!/usr/bin/python3

import argparse
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
    def __init__(self, build_config_yaml, product_yaml, input_dir, output_dir):
        self.input_dir = input_dir
        self.output_dir = output_dir
        self.env_yaml = ssg.yaml.open_environment(build_config_yaml,
                                                  product_yaml)
        product_dir = os.path.dirname(product_yaml)
        relative_guide_dir = ssg.utils.required_key(self.env_yaml,
                                                    "benchmark_root")
        self.guide_dir = os.path.abspath(os.path.join(product_dir,
                                                      relative_guide_dir))
        relative_profiles_dir = ssg.utils.required_key(self.env_yaml,
                                                       "profiles_root")
        self.profiles_dir = os.path.abspath(
            os.path.join(product_dir, relative_profiles_dir))

    def get_variable_selectors_from_profile(self, profile):
        variables = dict()
        if profile.extends:
            extended_profile_path = os.path.join(
                self.profiles_dir, profile.extends + ".profile")
            extended_profile = ssg.build_yaml.Profile.from_yaml(
                extended_profile_path, self.env_yaml)
            if not profile:
                sys.stderr.write(
                    "Could not parse profile %s.\n" % extended_profile_path)
                return None
            variables = self.get_variable_selectors_from_profile(
                extended_profile)
        if not profile.selections:
            return variables
        for var_selection in filter(lambda x: "=" in x, profile.selections):
            k, v = var_selection.split("=")
            variables[k] = v
        return variables

    def get_rules_from_profile(self, profile):
        return list(filter(lambda x: not x.startswith("var_"),
                           profile.selections))

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

    def get_tags_from_comments(self, snippet_path):
        tags = []
        remediation = ssg.build_remediations.parse_from_file_without_jinja(
            snippet_path
        )
        config = remediation.config
        for k, v in config.items():
            if k in COMMENTS_TO_PARSE:
                tags.append("%s_%s" % (v, k))
        return tags

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

    def create_playbook_for_rule(self, snippet_path, rule_id, variables,
                                 refinements, output_dir):
        tags = self.get_tags_from_comments(snippet_path)

        # TODO: Remove this temporary workaround
        # TODO: Breaks tags and platforms !!!!!!
        with open(snippet_path, "r") as snippet_file:
            snippet_str = snippet_file.read()
        snippet_str = snippet_str.replace("@ANSIBLE_TAGS@", "- dummy_tag")
        snippet_str = snippet_str.replace("@ANSIBLE_ENSURE_PLATFORM@", "")
        snippet_str = snippet_str.replace("@ANSIBLE_PLATFORM_CONDITION@",
                                          "true")
        snippet_str = snippet_str.replace("@RULE_ID@", "rule_id")
        snippet_yaml = ssg.yaml.ordered_load(snippet_str)
        # end of workaround

        tasks, vars = self.get_data_from_snippet(snippet_yaml, variables,
                                                 refinements)

        if len(tasks) == 0:
            raise ValueError(
                "Ansible remediation for rule '%s' in '%s' "
                "doesn't contain any task." %
                (rule_id, snippet_path)
            )

        # play should be a dictionary, but to keep a logical order of elements
        # we create the play as a list of tuples and later we convert it to
        # an OrderedDict
        play = [
            ("name", rule_id),
            ("hosts", "@@HOSTS@@"),
            ("become", True),
        ]
        if len(vars) > 0:
            play.append(("vars", vars))
        if len(tags) > 0:
            play.append(("tags", tags))
        play.append(("tasks", tasks))
        play_ordered_dict = OrderedDict(play)

        playbook = [play_ordered_dict]
        playbook_path = os.path.join(output_dir, rule_id + ".yml")
        with open(playbook_path, "w") as playbook_file:
            ssg.yaml.ordered_dump(
                playbook, playbook_file, default_flow_style=False
            )

    def create_playbooks_for_profile(self, profile_path, variables):
        """
        Creates playbooks for profile from tasks from snippets.
        Created playbooks are parametrized by variables according
        to profile definition. Playbooks are written into a new subdirectory
        in output_dir.
        """
        if not os.path.isfile(profile_path):
            sys.stderr.write("'%s' is not a file! Skippping." % profile_path)
            return None
        profile_id, ext = os.path.splitext(os.path.basename(profile_path))
        if ext != ".profile":
            sys.stderr.write(
                "Encountered file '%s' while looking for profiles, "
                "extension '%s' is unknown. Skipping..\n"
                % (profile_path, ext)
            )
            return None

        profile = ssg.build_yaml.Profile.from_yaml(profile_path, self.env_yaml)
        if not profile:
            sys.stderr.write("Could not parse profile %s.\n" % profile_path)
            return None
        profile_refines = self.get_variable_selectors_from_profile(profile)
        profile_rules = self.get_rules_from_profile(profile)

        profile_playbooks_dir = os.path.join(self.output_dir, profile_id)
        os.makedirs(profile_playbooks_dir)

        for snippet in os.listdir(self.input_dir):
            snippet_path = os.path.join(self.input_dir, snippet)
            rule_id, ext = os.path.splitext(os.path.basename(snippet_path))
            if ext != ".yml":
                sys.stderr.write(
                    "Found file '%s' while looking for Ansible snippets, "
                    "extension '%s' is unknown. Skipping...\n"
                    % (snippet_path, ext)
                )
            if rule_id in profile_rules:
                self.create_playbook_for_rule(
                    snippet_path, rule_id, variables,
                    profile_refines, profile_playbooks_dir
                )

    def build_all_playbooks(self):
        variables = self.get_benchmark_variables()
        for profile_file in os.listdir(self.profiles_dir):
            profile_path = os.path.join(self.profiles_dir, profile_file)
            self.create_playbooks_for_profile(profile_path, variables)


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument(
        "--input-dir", required=True, dest="input_dir",
        help="Input directory that contains all Ansible remediations"
        "snippets for the product we are building. "
        "e.g. ~/scap-security-guide/build/fedora/fixes/ansible"
    )
    p.add_argument(
        "--output-dir", required=True, dest="output_dir",
        help="Output directory to which the rule-based Ansible playbooks "
        "will be generated. "
        "e.g. ~/scap-security-guide/build/fedora/playbooks"
    )
    p.add_argument(
        "--build-config-yaml", required=True, dest="build_config_yaml",
        help="YAML file with information about the build configuration. "
        "e.g.: ~/scap-security-guide/build/build_config.yml"
    )
    p.add_argument(
        "--product-yaml", required=True, dest="product_yaml",
        help="YAML file with information about the product we are building. "
        "e.g.: ~/scap-security-guide/rhel7/product.yml"
    )
    return p.parse_args()


def main():
    args = parse_args()
    playbook_builder = PlaybookBuilder(
        args.build_config_yaml, args.product_yaml,
        args.input_dir, args.output_dir
    )
    playbook_builder.build_all_playbooks()


if __name__ == "__main__":
    main()
