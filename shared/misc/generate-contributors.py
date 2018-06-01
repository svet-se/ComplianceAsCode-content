#!/usr/bin/env python2

import subprocess
import re
import os.path
import codecs
import datetime

import collections


MANUAL_EDIT_WARNING = \
"""
This file is generated using the %s script. DO NOT MANUALLY EDIT!!!!
Last Modified: %s
""" % (os.path.basename(__file__), datetime.datetime.now().strftime("%Y-%m-%d %H:%M"))

email_mappings = {
    # Dave / David Smith
    "dsmith@secure-innovations.net": "dsmith@eclipse.ncsc.mil",
    "dsmith@fornax.eclipse.ncsc.mil": "dsmith@eclipse.ncsc.mil",
    # Firas AlShafei
    "firas.alshafei@gmail.com": "firas.alshafei@us.abb.com",
    # Frank Caviggia
    "fcaviggia@users.noreply.github.com": "fcaviggi@ra.iad.redhat.com",
    # Greg Elin
    "greg@fotonotes.net": "gregelin@gitmachines.com",
    # Jean-Baptiste Donnette
    "donnet_j@epita.fr": "jean-baptiste.donnette@epita.fr",
    # Marek Haicman
    "dahaic@users.noreply.github.com": "mhaicman@redhat.com",
    # Martin Preisler
    "martin@preisler.me": "mpreisle@redhat.com",
    # Nathan Peters
    "nathan@nathanpeters.com": "Nathaniel.Peters@ca.com",
    "petna01@ca.com": "Nathaniel.Peters@ca.com",
    # Philippe Thierry
    "phil@internal.reseau-libre.net": "phil@reseau-libre.net",
    "philippe.thierry@reseau-libre.net": "phil@reseau-libre.net",
    "philippe.thierry@thalesgroup.com": "phil@reseau-libre.net",
    # Robin Price II
    "rprice@users.noreply.github.com": "robin@redhat.com",
    "rprice@redhat.com": "robin@redhat.com",
    # Zbynek Moravec
    "ybznek@users.noreply.github.com": "zmoravec@redhat.com",
    "moraveczbynek@gmail.com": "zmoravec@redhat.com",
    # Jeff Blank
    "jeff@t440.local": "blank@eclipse.ncsc.mil",
    # Shawn Wells
    "shawn@localhost.localdomain": "shawn@redhat.com",
    "shawnw@localhost.localdomain": "shawn@redhat.com",
    # Simon Lukasik
    "isimluk@fedoraproject.org": "slukasik@redhat.com",
    # Andrew Gilmore
    "agilmore@ecahdb2.bor.doi.net": "agilmore2@gmail.com",

    # No idea / ignore
    "lyd@chippy.(none)": "",
    "nick@null.net": "",
    "root@localhost.localdomain": "",
    "root@rhel6.(none)": "",
}

name_mappings = {
    "Gabe": "Gabe Alford",
    "Olivier": "Olivier Bonhomme",
    "OnceUponALoop": "Firas AlShafei",
}


def _get_contributions_by_email(output):
    contributions_by_email = collections.defaultdict(list)
    for line in output.split("\n"):
        match = re.match(r"[\s]*([0-9]+)[\s+](.+)[\s]+\<(.+)\>", line)
        if match is None:
            continue

        commits, name, email = match.groups()

        if email in email_mappings:
            email = email_mappings[email]

        if email == "":
            continue  # ignored

        contributions_by_email[email].append((int(commits), name))
    return contributions_by_email


def _get_name_used_most_in_contributions(contribution_sets):
    _, name_used_most = sorted(contribution_sets, reverse=True)[0]
    return name_used_most


def _get_contributor_email_mapping(contributions_by_email):
    contributors = {}
    # We will use the most used full name
    for email in contributions_by_email:
        name_used_most = _get_name_used_most_in_contributions(contributions_by_email[email])
        if name_used_most in name_mappings:
            name_used_most = name_mappings[name_used_most]

        contributors[name_used_most] = email
    return contributors


def _names_sorted_by_last_name(names):
    return sorted(names, key=lambda x: x.split(" ")[-1].upper())


def main():
    output = subprocess.check_output(["git", "shortlog", "-se"]).decode("utf-8")
    contributions_by_email = _get_contributions_by_email(output)
    contributors = _get_contributor_email_mapping(contributions_by_email)

    contributors_md = "<!---%s--->\n\n" % MANUAL_EDIT_WARNING
    contributors_md += \
        "The following people have contributed to the SCAP Security Guide project\n"
    contributors_md += "(listed in alphabetical order):\n\n"

    contributors_xml = "<!--%s-->\n\n" % MANUAL_EDIT_WARNING
    contributors_xml += "<text>\n"

    for name in _names_sorted_by_last_name(list(contributors.keys())):
        email = contributors[name]
        contributors_md += "* %s <%s>\n" % (name, email)
        contributors_xml += "<contributor>%s &lt;%s&gt;</contributor>\n" % (name, email)

    contributors_xml += "</text>\n"

    root_dir = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
    with codecs.open(os.path.join(root_dir, "Contributors.md"),
                     mode="w", encoding="utf-8") as f:
        f.write(contributors_md)

    with codecs.open(os.path.join(root_dir, "Contributors.xml"),
                     mode="w", encoding="utf-8") as f:
        f.write(contributors_xml)

    print("Don't forget to commit Contributors.md and Contributors.xml!")


if __name__ == "__main__":
    main()
