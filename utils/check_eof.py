#!/usr/bin/python3
import argparse
import os
import pathlib

EXTENSIONS = ['yml', 'yaml', 'md', 'py', 'rst', 'adoc']


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Print and fix the files that don't end "
                                                 "in a new line")
    parser.add_argument("paths", type=str, nargs="+")
    parser.add_argument("--fix", action="store_true",
                        help='If set the program will add a new file to end of files that are '
                             'missing it.')
    return parser.parse_args()


def get_files(path: pathlib.Path) -> list:
    files = list()
    for ext in EXTENSIONS:
        files.extend(list(path.glob(f"**/*.{ext}")))
    return files


def get_all_files(paths: list) -> list:
    files = list()
    for path in paths:
        files.extend(get_files(pathlib.Path(path)))
    return files


def get_files_with_no_newline(files: list) -> list:
    bad_files = list()
    for file in files:
        with open(file.absolute(), 'rb') as f:
            if not f.seekable() or file.stat().st_size < 2:
                continue
            f.seek(-1, os.SEEK_END)
            data = f.read(1)
            if data != b'\n':
                bad_files.append(file)
    return bad_files


def fix_file(file: pathlib.Path):
    with open(file.absolute(), 'a') as f:
        f.write('\n')


def main():
    args = parse_args()
    files = get_all_files(args.paths)
    print(len(files))
    bad_files = get_files_with_no_newline(files)
    count = len(bad_files)
    for bad_file in bad_files:
        print(bad_file.absolute())
        if args.fix:
            fix_file(bad_file)

    print(f"{count} files do not have the correct ending.")
    if count != 0:
        exit(1)


if __name__ == "__main__":
    main()
