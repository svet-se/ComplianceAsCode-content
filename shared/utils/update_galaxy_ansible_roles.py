#!/usr/bin/env python2

from github import Github
from os import listdir
from os import system
from os import chdir
from os import getcwd
from tempfile import mkdtemp
import shutil
import sys
import re
import argparse
import getpass


def create_empty_repositories(github_new_repos):
    for github_new_repo in github_new_repos:
        print "Creating new Github repository: " + github_new_repo
        github_org.create_repo(
            github_new_repo,
            description="Role generated by OpenSCAP SSG",
            homepage="https://www.open-scap.org/",
            private=False,
            has_issues=False,
            has_wiki=False,
            has_downloads=False)


def clone_and_init_repositories(repositories_to_create):
    for repo in repositories_to_create:
        system(
            "git clone git@github.com:OpenSCAP-Ansible-Roles/%s.git" % repo)
        system("ansible-galaxy init " + repo + " --force")
        chdir(repo)
        system('git add .')
        system('git commit -a -m "Initial commit"')
        system('git push origin master')
        chdir("..")


def update_repository(repository, local_file_path, meta_template_path):
    try:
        f = open(local_file_path, 'r')
    except (IOError, OSError):
        print "Ansible role " + repository.name + " not found!"
        return

    filedata = f.read()
    f.close()

    local_file_content = filedata.replace("   tasks:", "#   tasks:")
    remote_file = repository.get_file_contents("/tasks/main.yml")

    if (local_file_content != remote_file.decoded_content):
        repository.update_file(
            "/tasks/main.yml",
            "Updates tasks/main.yml",
            local_file_content,
            remote_file.sha)
        print "Updating tasks/main.yml in " + repository.name

    separator = "###############################################################################"
    header = filedata[filedata.find(
        separator) + len(separator) + 3:filedata.rfind(separator) - 3]
    header = header.replace('# ', '')
    header = header.replace('#', '')
    title = re.search('Profile Title:\s+(.+)$', header, re.MULTILINE).group(1)
    header = header.replace('\n', '  \n')

    local_readme_content = title + '\n=========\n\n' + header
    remote_readme_file = repository.get_file_contents("/README.md")

    if (local_readme_content != remote_readme_file.decoded_content):
        print "Updating README.md in " + repository.name
        repository.update_file(
            "/README.md",
            "Updates README.md",
            local_readme_content,
            remote_readme_file.sha)

    if meta_template_path:
        f = open(meta_template_path, 'r')
        meta_template = f.read()
        f.close()

        local_meta_content = meta_template.replace("@DESCRIPTION@", title)
        remote_meta_file = repository.get_file_contents("/meta/main.yml")

        if (local_meta_content != remote_meta_file.decoded_content):
            print "Updating meta/main.yml in " + repository.name
            repository.update_file(
                "/meta/main.yml",
                "Updates meta/main.yml",
                local_meta_content,
                remote_meta_file.sha)

    print "Finished processing " + repository.name


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Updates SSG Galaxy Ansible Roles')
    parser.add_argument(
        "--ssg-build-roles-directory",
        help="Path to directory containing the ssg generated roles",
        dest="ssg_build_roles_directory")
    parser.add_argument(
        "--meta-template-path",
        help="Path to metadata file template",
        dest="meta_template_path")
    args = parser.parse_args()

    ssg_build_roles_directory = args.ssg_build_roles_directory
    meta_template_path = args.meta_template_path
    organization_name = "OpenSCAP-Ansible-Roles"

    roles = [f[:-4]
             for f in listdir(ssg_build_roles_directory) if f.endswith(".yml")]

    print "Input your GitHub credentials:"
    username = raw_input("USER: ")
    password = getpass.getpass("PASS: ")

    github = Github(username, password)
    github_org = github.get_organization(organization_name)
    github_repositories = [repo.name for repo in github_org.get_repos()]

    # Create empty repositories
    github_new_repos = list(set(roles) - set(github_repositories))
    if github_new_repos:
        create_empty_repositories(github_new_repos)
        github_repositories = [repo.name for repo in github_org.get_repos()]

        # Locally clone and init repositories
        current_dir = getcwd()
        temp_dir = mkdtemp()
        chdir(temp_dir)
        clone_and_init_repositories(github_new_repos)
        chdir(current_dir)
        shutil.rmtree(temp_dir)

    # Update repositories
    for repo in github_org.get_repos():
        update_repository(repo, ssg_build_roles_directory +
                          repo.name + ".yml", meta_template_path)
