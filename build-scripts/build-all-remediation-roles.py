#!/usr/bin/env python2

from __future__ import print_function

"""
Takes given XCCDF or DataStream and for every profile in it it generates one
ansible and bash remediation roles.

Author: Martin Preisler <mpreisle@redhat.com>
"""

import os.path
import argparse

import threading
import sys

import ssg
ElementTree = ssg.xml.ElementTree

def parse_args():
    p = argparse.ArgumentParser()

    sp = p.add_subparsers(help="actions")

    make_sp = sp.add_parser("build", help="Build all the remediation roles")
    make_sp.set_defaults(cmd="build")

    input_sp = sp.add_parser("list-inputs", help="Generate input list")
    input_sp.set_defaults(cmd="list_inputs")

    output_sp = sp.add_parser("list-outputs", help="Generate output list")
    output_sp.set_defaults(cmd="list_outputs")

    p.add_argument("-j", "--jobs", type=int, action="store",
                   default=ssg.utils.get_cpu_count(),
                   help="how many jobs should be processed in parallel")

    p.add_argument("-t", "--template", action="store", required=True,
                   help="the remediation template")
    p.add_argument("-e", "--extension", action="store", required=True,
                   help="the extension of the roles")
    p.add_argument("-i", "--input", action="store", required=True,
                   help="input file, can be XCCDF or Source DataStream")
    p.add_argument("-o", "--output", action="store", required=True,
                   help="output directory")

    args, unknown = p.parse_known_args()
    if unknown:
        sys.stderr.write(
            "Unknown positional arguments " + ",".join(unknown) + ".\n"
        )
        sys.exit(1)

    return args


def main():
    args = parse_args()

    input_path, input_basename, path_base, output_dir = \
        ssg.build_guides.get_path_args(args)
    extension = args.extension
    template = args.template

    if args.cmd == "list_inputs":
        print(input_path)
        sys.exit(0)

    input_tree = ElementTree.parse(input_path)
    benchmarks = ssg.xccdf.get_benchmark_ids_titles_for_input(input_tree)
    if len(benchmarks) == 0:
        raise RuntimeError(
            "Expected input file '%s' to contain at least 1 xccdf:Benchmark. "
            "No Benchmarks were found!" %
            (input_path)
        )

    benchmark_profile_pairs = ssg.build_guides.get_benchmark_profile_pairs(
        input_tree, benchmarks)

    if args.cmd == "list_outputs":
        role_paths = ssg.build_roles.get_output_paths(benchmarks, benchmark_profile_pairs,
                                                      path_base, extension, output_dir)

        for role_path in role_paths:
            print(role_path)

        sys.exit(0)

    queue = ssg.build_roles.fill_queue(benchmarks, benchmark_profile_pairs, input_path,
                                       path_base, extension, output_dir, template)

    workers = []
    for worker_id in range(args.jobs):
        worker = threading.Thread(
            name="Role generate worker #%i" % (worker_id),
            target=lambda queue=queue: ssg.build_roles.builder(queue)
        )
        workers.append(worker)
        worker.daemon = True
        worker.start()

    queue.join()


if __name__ == "__main__":
    main()
