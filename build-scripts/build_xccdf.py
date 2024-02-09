#!/usr/bin/python3

from __future__ import print_function

import argparse
import os
import os.path

import ssg.build_yaml
import ssg.utils
import ssg.environment
import ssg.id_translate
import ssg.build_renumber
import ssg.products


def parse_args():
    parser = argparse.ArgumentParser(
        description="Converts SCAP Security Guide YAML benchmark data "
        "(benchmark, rules, groups) to XCCDF Shorthand Format"
    )
    parser.add_argument(
        "--build-config-yaml", required=True,
        help="YAML file with information about the build configuration. "
        "e.g.: ~/scap-security-guide/build/build_config.yml"
    )
    parser.add_argument(
        "--product-yaml", required=True,
        help="YAML file with information about the product we are building. "
        "e.g.: ~/scap-security-guide/rhel7/product.yml"
    )
    parser.add_argument(
        "--xccdf", required=True,
        help="Output XCCDF file. "
        "e.g.:  ~/scap-security-guide/build/rhel7/ssg-rhel7-xccdf.xml"
    )
    parser.add_argument(
        "--ocil", required=True,
        help="Output OCIL file. "
        "e.g.:  ~/scap-security-guide/build/rhel7/ssg-rhel7-ocil.xml"
    )
    parser.add_argument(
        "--oval", required=True,
        help="Output OVAL file. "
        "e.g.:  ~/scap-security-guide/build/rhel7/ssg-rhel7-oval.xml"
    )
    parser.add_argument(
        "--build-ovals-dir",
        dest="build_ovals_dir",
        help="Directory to store OVAL document for each rule.",
    )
    parser.add_argument(
        "--resolved-base",
        help="To which directory to put processed rule/group/value YAMLs."
    )
    return parser.parse_args()


def link_oval(xccdftree, checks, output_file_name, build_ovals_dir):
    translator = ssg.id_translate.IDTranslator("ssg")
    oval_linker = ssg.build_renumber.OVALFileLinker(
        translator, xccdftree, checks, output_file_name
    )
    oval_linker.build_ovals_dir = build_ovals_dir
    oval_linker.link()
    oval_linker.save_linked_tree()
    oval_linker.link_xccdf()


def link_ocil(xccdftree, checks, output_file_name, ocil):
    translator = ssg.id_translate.IDTranslator("ssg")
    ocil_linker = ssg.build_renumber.OCILFileLinker(
        translator, xccdftree, checks, output_file_name
    )
    ocil_linker.link(ocil)
    ocil_linker.save_linked_tree()
    ocil_linker.link_xccdf()


def link_benchmark(loader, xccdftree, paths, benchmark=None):
    if benchmark is None:
        benchmark = loader.benchmark

    checks = xccdftree.findall(".//{%s}check" % ssg.constants.XCCDF12_NS)

    link_oval(xccdftree, checks, paths.oval, paths.build_ovals_dir)

    ocil = loader.export_ocil_to_xml()
    link_ocil(xccdftree, checks, paths.ocil, ocil)

    ssg.xml.ElementTree.ElementTree(xccdftree).write(paths.xccdf)


def main():
    args = parse_args()

    env_yaml = ssg.environment.open_environment(
        args.build_config_yaml, args.product_yaml)
    product_yaml = ssg.products.Product(args.product_yaml)
    base_dir = product_yaml["product_dir"]
    benchmark_root = ssg.utils.required_key(env_yaml, "benchmark_root")

    # we have to "absolutize" the paths the right way, relative to the
    # product_yaml path
    if not os.path.isabs(benchmark_root):
        benchmark_root = os.path.join(base_dir, benchmark_root)

    loader = ssg.build_yaml.LinearLoader(
        env_yaml, args.resolved_base)
    loader.load_compiled_content()
    loader.load_benchmark(benchmark_root)

    loader.add_fixes_to_rules()

    xccdftree = loader.export_benchmark_to_xml()
    link_benchmark(loader, xccdftree, args)


if __name__ == "__main__":
    main()
