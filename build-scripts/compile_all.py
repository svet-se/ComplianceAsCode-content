from __future__ import print_function

import argparse
import logging
import sys
import os.path
from glob import glob

import ssg.build_profile
import ssg.build_yaml
import ssg.utils
import ssg.controls
import ssg.products
import ssg.environment

def create_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("profile_file", nargs="*")
    parser.add_argument(
        "--build-config-yaml",
        help="YAML file with information about the build configuration. "
        "e.g.: ~/scap-security-guide/build/build_config.yml "
        "needed for autodetection of profile root"
    )
    parser.add_argument(
        "--product-yaml",
        help="YAML file with information about the product we are building. "
        "e.g.: ~/scap-security-guide/rhel7/product.yml "
        "needed for autodetection of profile root"
    )
    parser.add_argument(
        "--output", "-o", default="{name}.profile",
        help="The template for saving processed profile files."
    )
    parser.add_argument(
        "--resolved-base",
        help="To which directory to put processed rule/group/value YAMLs.")
    parser.add_argument(
        "--controls-dir",
        help="Directory that contains control files with policy controls. "
        "e.g.: ~/scap-security-guide/controls",
    )
    parser.add_argument(
        "--sce-metadata",
        help="Combined SCE metadata to read."
    )
    return parser


def get_env_yaml(build_config_yaml, product_yaml):
    if build_config_yaml is None or product_yaml is None:
        return None

    env_yaml = ssg.environment.open_environment(build_config_yaml, product_yaml)
    return env_yaml


def main():
    parser = create_parser()
    args = parser.parse_args()
    env_yaml = get_env_yaml(args.build_config_yaml, args.product_yaml)

    build_root = os.path.dirname(args.build_config_yaml)

    logfile = "{build_root}/{product}/control_profiles.log".format(
            build_root=build_root,
            product=env_yaml["product"])
    logging.basicConfig(filename=logfile, level=logging.INFO)

    if args.controls_dir:
        controls_manager = ssg.controls.ControlsManager(args.controls_dir, env_yaml)
        controls_manager.load()

    profile_files = ssg.products.get_profile_files_from_root(env_yaml, args.product_yaml)
    profile_files.extend(args.profile_file)

    resolved_rules_dir = os.path.join(args.resolved_base, "rules")
    loader = ssg.build_yaml.BuildLoader(
        None, env_yaml,
        resolved_rules_dir, args.sce_metadata)

    profiles_by_id = ssg.build_profile.make_name_to_profile_mapping(profile_files, env_yaml)

    loader.profiles = profiles_by_id

    benchmark_root = ssg.utils.required_key(env_yaml, "benchmark_root")
    additional_content_directories = env_yaml.get("additional_content_directories", [])
    add_content_dirs = [os.path.join(base_dir, er_root) for er_root in additional_content_directories if not os.path.isabs(er_root)]
    loader.process_directory_tree(benchmark_root, add_content_dirs)

    all_rules_by_id = {r.id_: r for r in loader.all_rules}
    for p in profiles_by_id.values():
        p.resolve(profiles_by_id, all_rules_by_id, controls_manager)

        p.validate_variables(loader.all_values)
        p.validate_rules(loader.all_rules, loader.all_groups)
        p.validate_refine_rules(loader.all_rules)

    loader.save_all_entities(args.resolved_base)
    for name, p in profiles_by_id.items():
        p.dump_yaml(args.output.format(name=name))


if __name__ == "__main__":
    main()
