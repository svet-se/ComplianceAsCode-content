from __future__ import print_function

import argparse
import os.path
import sys

import ssg.xml
from ssg.constants import cce_uri, OSCAP_RULE, XCCDF12_NS


def match_profile(needle, haystack):
    start_string = "xccdf_org.ssgproject.content_profile_%s" % needle
    if haystack.startswith(start_string):
        return True
    return False


def good_profile(profile_id, filter_profiles):
    if len(filter_profiles) == 0:
        return True
    if len(list(filter(lambda x: match_profile(x, profile_id), filter_profiles))) == 0:
        return False
    return True


def get_selected_rules(benchmark, filter_profiles):
    rules = set()
    for profile in benchmark.findall(".//{%s}Profile" % (XCCDF12_NS)):
        if not good_profile(profile.get('id'), filter_profiles):
            continue
        for selection in profile.findall(".//{%s}select" % (XCCDF12_NS)):
            idref = selection.get("idref")
            selected = selection.get("selected")
            if idref.startswith(OSCAP_RULE) and selected == "true":
                rules.add(idref)
    return rules


def check_all_rules(root, filter_profiles):
    rules_missing_cce = []
    root = ssg.xml.parse_file(args.datastream_path)
    for benchmark in root.findall(".//{%s}Benchmark" % (XCCDF12_NS)):
        selected_rules = get_selected_rules(benchmark, filter_profiles)
        for rule in benchmark.findall(".//{%s}Rule" % (XCCDF12_NS)):
            rule_id = rule.get("id")
            if rule_id not in selected_rules:
                continue
            match = False
            for ident in rule.findall("{%s}ident" % (XCCDF12_NS)):
                if ident.get("system") == cce_uri:
                    match = True
                    break
            if not match:
                rules_missing_cce.append(rule_id)
    return rules_missing_cce


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Checks the all rules that are part of at least one "
        "profile have a CCE assigned. "
        "Optionally with -p/--profiles provide comma-separated profile list to check against.")
    parser.add_argument(
        "datastream_path", help="Path to a SCAP source datastream")
    parser.add_argument(
        "-p", "--profiles", help="Comma-separated list to check for missing CCEs",
        default='', required=False)
    args = parser.parse_args()
    print(args)
    root = ssg.xml.parse_file(args.datastream_path)
    rules_missing_cce = check_all_rules(root, args.profiles.split(","))
    ds = os.path.basename(args.datastream_path)
    if len(rules_missing_cce) > 0:
        print("The following rules in %s are missing CCEs:" % (ds))
        for rule in rules_missing_cce:
            print(rule)
        sys.exit(1)
    else:
        print("%s is OK" % (ds))
