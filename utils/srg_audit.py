#!/usr/bin/env python3
import argparse
import csv
import enum
import os.path
import sys

from utils.create_srg_export import DisaStatus

try:
    import ssg.constants
except (ModuleNotFoundError, ImportError):
    sys.stderr.write("Unable to load ssg python modules.\n")
    sys.stderr.write("Hint: run source ./.pyenv.sh\n")
    exit(3)


class Problems(enum.Enum):
    MISSING_REQUIREMENT = "Missing requirement"
    REQUIREMENT_HAS_INVALID_CHARS = "Requirement contains \", &, ', <, or > and is invalid."
    CHECK_BADWORDS = "Check contains should, shall, or please."
    FIX_BADWORDS = "Fix contains should, shall, or please."
    CHECK_BAD_START = "Check starts with ensure or interview"
    FIX_BAD_START = "Fix starts with ensure or interview"
    CHECK_IS_A_FIND = "Check doesn't contain ', this is a finding'"
    INVALID_STATUS = "The status is not valid"
    INVALID_SEVERITY = "Severity is not CAT I, CAT II, or CAT III"


def has_element(search: list, target: str) -> bool:
    return len([elem for elem in search if (elem in target)]) != 0


def has_startswith(search: list, target: str) -> bool:
    return len([elem for elem in search if (target.startswith(elem))]) != 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Audits a csv from utils/create_srg_export.py",
                                     epilog="example: ./utils/srg_audit.py build/1642443529_stig_"
                                            "export.csv")
    parser.add_argument('file', type=str, help="A CSV file created by utils/create_srg_export.py")
    return parser.parse_args()


def main():
    args = parse_args()
    if not os.path.exists(args.file):
        sys.stderr.write(f"Unable to perform audit.\n")
        sys.stderr.write(f"File not found: {args.file}\n")
        exit(1)
    if not os.path.isfile(args.file):
        sys.stderr.write(f"Unable to perform audit.\n")
        sys.stderr.write(f"Input must be a file: {args.file}\n")
        exit(2)
    # The goal these dictionaries is to reduce all values the dictionary to zero,
    # save optional values.
    #
    # Optional values should reduce to 2 if defined or if not defined should remain 3.
    config_dict = {'Requirement': 1,
                   'VulDiscussion': 1,
                   'Status': 1,
                   'Check': 1,
                   'Fix': 1,
                   'Severity': 1,
                   'Mitigation': 0,
                   'Artifact Description': 0,
                   'Status Justification': 3,
                   'CCI': 1,
                   'SRGID': 1}
    meets_dict = {'Requirement': 1,
                  'VulDiscussion': 1,
                  'Status': 1,
                  'Check': 0,
                  'Fix': 0,
                  'Severity': 1,
                  'Mitigation': 0,
                  'Artifact Description': 1,
                  'Status Justification': 1,
                  'CCI': 1,
                  'SRGID': 1}
    does_not_meet = {'Requirement': 1,
                     'VulDiscussion': 1,
                     'Status': 1,
                     'Check': 0,
                     'Fix': 0,
                     'Severity': 1,
                     'Mitigation': 1,
                     'Artifact Description': 0,
                     'Status Justification': 1,
                     'CCI': 1,
                     'SRGID': 1}

    not_applicable = {'Requirement': 1,
                      'VulDiscussion': 0,
                      'Status': 1,
                      'Check': 0,
                      'Fix': 0,
                      'Severity': 1,
                      'Mitigation': 1,
                      'Artifact Description': 0,
                      'Status Justification': 1,
                      'CCI': 1,
                      'SRGID': 1}
    with open(args.file, 'r') as f:
        reader = csv.DictReader(f)
        errors = dict()
        for row in reader:
            if row['SRGID'] not in errors:
                errors[row['SRGID']] = list()
            if not row['Requirement']:
                errors[row['SRGID']].append(Problems.MISSING_REQUIREMENT.value)
            req_bad_chars = ['\"', "&", "'", "<", ">"]
            if has_element(req_bad_chars, row['Requirement']):
                errors[row['SRGID']].append(Problems.REQUIREMENT_HAS_INVALID_CHARS.value)
            if row['Status'] == DisaStatus.AUTOMATED:
                results = config_dict.copy()
                validate_check_fix(errors, row, row['SRGID'])
            elif row['Status'] == DisaStatus.INHERENTLY_MET:
                results = meets_dict.copy()
            elif row['Status'] == DisaStatus.DOES_NOT_MEET:
                results = does_not_meet.copy()
            elif row['Status'] == DisaStatus.NOT_APPLICABLE:
                results = not_applicable.copy()
            else:
                errors[row['SRGID']].append(Problems.INVALID_STATUS.value)
                continue
            for col in row:
                col_value = row[col].strip()
                if col_value != '' and col in results:
                    results[col] -= 1
            for result in results:
                if results[result] == 1:
                    errors[row["SRGID"]].append(f'Field {result} is not defined.')
                elif results[result] == -1:
                    errors[row["SRGID"]].append(f'Field {result} is defined and should not be.')
                elif results[result] not in [0, 2, 3]:
                    raise AttributeError(f"Config data is not defined correctly. "
                                         f"Result = {result}, {results[result]}")
        for result in errors:
            print(result)
            for error in errors[str(result)]:
                print(f'\t{error}')


def validate_check_fix(results, row, row_id):
    check_invalid = ['shall', 'should', 'please']
    check_invalid_start = ['ensure', 'interview']
    if has_element(check_invalid, row['Fix']):
        results[row_id].append(Problems.FIX_BADWORDS.value)
    if has_element(check_invalid, row['Check']):
        results[row_id].append(Problems.CHECK_BADWORDS.value)
    if has_startswith(check_invalid_start, row['Check']):
        results[row_id].append(Problems.CHECK_BAD_START.value)
    if has_startswith(check_invalid_start, row['Fix']):
        results[row_id].append(Problems.FIX_BAD_START.value)
    if 'this is a finding.' not in row['Check']:
        results[row_id].append(Problems.CHECK_IS_A_FIND.value)


if __name__ == '__main__':
    main()
