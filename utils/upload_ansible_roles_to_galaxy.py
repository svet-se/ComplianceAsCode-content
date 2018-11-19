#!/usr/bin/env python2
# -*- coding: utf-8 -*-

from __future__ import print_function

from tempfile import mkdtemp
import io
import os
import os.path
import sys
import shutil
import re
import argparse
import getpass
import yaml
import collections

try:
    from github import Github, InputGitAuthor
except ImportError:
    sys.stderr.write("Please install PyGithub, on Fedora it's in the "
                     "python-PyGithub package.\n")
    sys.exit(1)


import ssg.ansible

# The following code preserves ansible yaml order
# code from arcaduf's gist
# https://gist.github.com/arcaduf/8edbe5900372f0dd30aa037272dfe826
_mapping_tag = yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG


def dict_representer(dumper, data):
    return dumper.represent_mapping(_mapping_tag, data.iteritems())


def dict_constructor(loader, node):
    return collections.OrderedDict(loader.construct_pairs(node))


yaml.add_representer(collections.OrderedDict, dict_representer)
yaml.add_constructor(_mapping_tag, dict_constructor)
# End arcaduf gist

ORGANIZATION_NAME = "RedHatOfficial"
GIT_COMMIT_AUTHOR_NAME = "Red Hat Security Automation development team"
GIT_COMMIT_AUTHOR_EMAIL = "scap-security-guide@lists.fedorahosted.org"
META_TEMPLATE_PATH = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "ansible_galaxy_meta_template.yml"
)
README_TEMPLATE_PATH = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "ansible_galaxy_readme_template.md"
)


def create_empty_repositories(github_new_repos, github_org):
    for github_new_repo in github_new_repos:
        print("Creating new Github repository: %s" % github_new_repo)
        github_org.create_repo(
            github_new_repo,
            description="Role generated from ComplianceAsCode Project",
            homepage="https://github.com/ComplianceAsCode/content/",
            private=False,
            has_issues=False,
            has_wiki=False,
            has_downloads=False)


def clone_and_init_repository(parent_dir, organization, repo):
    os.system(
        "git clone git@github.com:%s/%s.git" % (organization, repo))
    os.system("ansible-galaxy init " + repo + " --force")
    os.chdir(repo)
    try:
        os.system('git add .')
        os.system('git commit -a -m "Initial commit" --author "%s <%s>"'
                  % (GIT_COMMIT_AUTHOR_NAME, GIT_COMMIT_AUTHOR_EMAIL))
        os.system('git push origin master')
    finally:
        os.chdir("..")


class Repository(object):
    def __init__(self, repo, local_filename):
        self.repository = repo
        self.local_filename = local_filename

        self.role_data = None
        self.vars_data = []
        self.tasks_data = []
        self.pre_tasks_data = []

        self.tasks_local_content = None

        self.description = None
        self.title = None

    def gather_data(self):
        with io.open(self.local_filename, 'r', encoding="utf-8") as f:
            filedata = f.read()

        self.role_data = yaml.load(filedata)
        if "vars" in self.role_data[0]:
            self.vars_data = self.role_data[0]["vars"]

        if "tasks" in self.role_data[0]:
            self.tasks_data = self.role_data[0]["tasks"]

        # ansible language doesn't allow pre_tasks for roles, if the only pre task
        # is the ansible version check we can ignore it because the minimal version
        # is in role metadata
        if "pre_tasks" in self.role_data[0]:
            pre_tasks_data = self.role_data[0]["pre_tasks"]
            if len(pre_tasks_data) == 1 and \
                    pre_tasks_data[0]["name"] == \
                    ssg.ansible.ansible_version_requirement_pre_task_name:
                pass
            else:
                sys.stderr.write(
                    "%s contains pre_tasks other than the version check. "
                    "pre_tasks are not supported for ansible roles and "
                    "will be skipped!.\n")

        self.tasks_local_content = yaml.dump(
            self.tasks_data, width=120, indent=4, default_flow_style=False)

        description = self.get_description_from_filedata(filedata)
        self.description = description

    def _reformat_local_content(self):
        # Add \n in between tasks to increase readability
        self.tasks_local_content = self.tasks_local_content.replace('\n- ', '\n\n- ')

        self.description = self.description.replace('# ', '')
        self.description = self.description.replace('#', '')

    def get_description_from_filedata(self, filedata):
        separator = "#" * 79
        offset_from_separator = 3

        first_separator_pos = filedata.find(
            separator)
        second_separator_pos = filedata.find(
            separator, first_separator_pos + len(separator))

        description_start = first_separator_pos + len(separator) + offset_from_separator
        description_stop = second_separator_pos - offset_from_separator
        description = filedata[description_start:description_stop]

        return description

    def _update_tasks_content_if_needed(self):
        tasks_remote_content = self.repository.get_file_contents("/tasks/main.yml")

        if self.tasks_local_content != tasks_remote_content.decoded_content:
            self.repository.update_file(
                "/tasks/main.yml",
                "Updates tasks/main.yml",
                self.tasks_local_content,
                tasks_remote_content.sha,
                author=InputGitAuthor(
                    GIT_COMMIT_AUTHOR_NAME, GIT_COMMIT_AUTHOR_EMAIL)
            )
            print("Updating tasks/main.yml in %s" % self.repository.name)

    def _update_vars_content_if_needed(self):
        vars_remote_content = self.repository.get_file_contents("/vars/main.yml")
        vars_local_content = yaml.dump(self.vars_data, width=120, indent=4,
                                       default_flow_style=False)

        if vars_local_content != vars_remote_content.decoded_content:
            self.repository.update_file(
                "/vars/main.yml",
                "Updates vars/main.yml",
                vars_local_content,
                vars_remote_content.sha,
                author=InputGitAuthor(
                    GIT_COMMIT_AUTHOR_NAME, GIT_COMMIT_AUTHOR_EMAIL)
            )

            print("Updating vars/main.yml in %s" % self.repository.name)

    def _generate_readme_content(self):
        with io.open(README_TEMPLATE_PATH, 'r',  encoding="utf-8") as f:
            readme_template = f.read()

        local_readme_content = readme_template.replace(
            "@DESCRIPTION@", self.description)
        local_readme_content = local_readme_content.replace(
            "@TITLE@", self.title)
        local_readme_content = local_readme_content.replace(
            "@MIN_ANSIBLE_VERSION@", ssg.ansible.min_ansible_version)
        local_readme_content = local_readme_content.replace(
            "@ROLE_NAME@", self.repository.name)
        return local_readme_content

    def _update_readme_content_if_needed(self):
        local_readme_content = self._generate_readme_content()
        remote_readme_file = self.repository.get_file_contents("/README.md")

        if local_readme_content != remote_readme_file.decoded_content.decode("utf-8"):
            print("Updating README.md in %s" % self.repository.name)

            self.repository.update_file(
                "/README.md",
                "Updates README.md",
                local_readme_content,
                remote_readme_file.sha,
                author=InputGitAuthor(
                    GIT_COMMIT_AUTHOR_NAME, GIT_COMMIT_AUTHOR_EMAIL)
            )

    def _update_meta_content_if_needed(self):
        with open(META_TEMPLATE_PATH, 'r') as f:
            meta_template = f.read()

        local_meta_content = meta_template.replace("@DESCRIPTION@", self.title)
        local_meta_content = local_meta_content.replace(
            "@MIN_ANSIBLE_VERSION@", ssg.ansible.min_ansible_version)
        remote_meta_file = self.repository.get_file_contents("/meta/main.yml")

        if local_meta_content != remote_meta_file.decoded_content:
            print("Updating meta/main.yml in %s" % self.repository.name)
            self.repository.update_file(
                "/meta/main.yml",
                "Updates meta/main.yml",
                local_meta_content,
                remote_meta_file.sha,
                author=InputGitAuthor(
                    GIT_COMMIT_AUTHOR_NAME, GIT_COMMIT_AUTHOR_EMAIL)
            )

    def update(self):
        print("Processing %s..." % self.repository.name)

        self.gather_data()
        self._reformat_local_content()
        self.title = re.search(
            r'Profile Title:\s+(.+)$', self.description, re.MULTILINE).group(1)
        # Why so?
        self.description = self.description.replace('\n', '  \n')

        self._update_tasks_content_if_needed()
        self._update_vars_content_if_needed()
        self._update_readme_content_if_needed()
        self._update_meta_content_if_needed()

        repo_description = (
            "{title} - Ansible role generated from the SCAP Security Guide project"
            .format(title=self.title))
        self.repository.edit(
            self.repository.name,
            description=repo_description,
            homepage="https://www.open-scap.org/",
        )


def parse_args():
    parser = argparse.ArgumentParser(
        description='Updates Galaxy Ansible Roles')
    parser.add_argument(
        "--build-roles-dir", required=True,
        help="Path to directory containing the generated roles. Most "
        "likely this is going to be ./build/roles",
        dest="build_roles_dir")
    parser.add_argument(
        "--organization", "-o", default=ORGANIZATION_NAME,
        help="Name of the Github organization")
    parser.add_argument(
        "--profile", "-p", default=[], nargs="*",
        help="What profiles to build, if not specified, build all.")
    return parser.parse_args()


def locally_clone_and_init_repositories(organization, repo_list):
    temp_dir = mkdtemp()
    current_dir = os.getcwd()
    os.chdir(temp_dir)
    try:
        for repo in repo_list:
            clone_and_init_repository(temp_dir, organization, repo)
    finally:
        os.chdir(current_dir)
        shutil.rmtree(temp_dir)


def main():
    args = parse_args()

    role_whitelist = set([
        "rhel7-role-C2S",
        "rhel7-role-hipaa",
        "rhel7-role-nist-800-171-cui",
        "rhel7-role-ospp",
        "rhel7-role-pci-dss",
        "rhel7-role-rht-ccp",
        "rhel7-role-stig-rhel7-disa"
    ])
    if args.profile:
        selected_roles = {"rhel7-role-%s" % p for p in args.profile}
        role_whitelist.intersection_update(selected_roles)

    # the first 4 cut chars are for "ssg-"
    # the last 4 cut chars are for ".yml"
    available_roles = set(
        [f[4:-4]
         for f in os.listdir(args.build_roles_dir) if f.endswith(".yml")]
    )
    # print(available_roles)
    roles = available_roles.intersection(role_whitelist)

    print("Input your GitHub credentials:")
    username = raw_input("username or token: ")
    password = getpass.getpass("password (or empty for token): ")

    github = Github(username, password)
    github_org = github.get_organization(args.organization)
    github_repositories = [repo.name for repo in github_org.get_repos()]

    # Create empty repositories
    github_new_repos = sorted(list(set(roles) - set(github_repositories)))
    if github_new_repos:
        create_empty_repositories(github_new_repos, github_org)

        locally_clone_and_init_repositories(args.organization, github_repositories)

    # Update repositories
    for repo in sorted(github_org.get_repos(), key=lambda repo: repo.name):
        if repo.name in roles:
            corresponding_filename = os.path.join(
                args.build_roles_dir, "ssg-" + repo.name + ".yml")
            Repository(repo, corresponding_filename).update()
        else:
            print("Repo %s should be deleted, please verify and do that "
                  "manually!" % repo.name)


if __name__ == "__main__":
    main()
