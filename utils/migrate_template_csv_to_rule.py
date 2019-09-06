import argparse
import csv
import os
import pprint
import re

from ssg.constants import product_directories


def escape_path(path):
    return re.sub('[-\./]', '_', path)

def accounts_password_csv_to_dict(csv_line):
    accounts_password = {}

    variable = csv_line[0]
    rule_id = f"accounts_password_pam_{variable}"

    operation = csv_line[1]

    # Only credit related variables allow negative values
    sign = "-?" if variable.endswith("credit") else ""

    accounts_password["VARIABLE"] = variable
    accounts_password["OPERATION"] = operation
    accounts_password["SIGN"] = sign
    return [rule_id], accounts_password

def audit_rules_execution_csv_to_dict(csv_line):
    audit_rules_execution = {}

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_execution_{name}"

    # create_audit_rules_execution.py escapes the '/' when generating the OVAL
    # This is not actually necessary
    audit_rules_execution["PATH"] = path
    audit_rules_execution["NAME"] = name

    audit_rules_execution["ID"] = f"audit_rules_execution_{name}"
    audit_rules_execution["TITLE"] = f"Record Any Attempts to Run {name}"
    return [rule_id], audit_rules_execution

def audit_rules_privileged_commands_csv_to_dict(csv_line):
    audit_rules_privileged_commands = {}

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_privileged_commands_{name}"

    # create_audit_rules_privileged_commands.py escapes the '/' when generating the OVAL
    # This is not actually necessary
    audit_rules_privileged_commands["PATH"] = path
    audit_rules_privileged_commands["NAME"] = name

    audit_rules_privileged_commands["ID"] = f"audit_rules_privileged_commands_{name}"
    audit_rules_privileged_commands["TITLE"] = f"Ensure auditd Collects Information on the Use of Privileged Commands - {name}"
    return [rule_id], audit_rules_privileged_commands

def audit_rules_dac_modification_csv_to_dict(csv_line):
    audit_rules_dac_modification = {}

    attr = csv_line[0]
    rule_id = f"audit_rules_dac_modification_{attr}"

    audit_rules_dac_modification["ATTR"] = attr
    return [rule_id], audit_rules_dac_modification

def audit_rules_file_deletion_events_csv_to_dict(csv_line):
    audit_rules_file_deletion_events = {}

    name = csv_line[0]
    rule_id = f"audit_rules_file_deletion_events_{name}"

    audit_rules_file_deletion_events["NAME"] = name
    return [rule_id], audit_rules_file_deletion_events

def audit_rules_login_events_csv_to_dict(csv_line):
    audit_rules_login_events = {}

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_login_events_{name}"

    audit_rules_login_events["PATH"] = path
    audit_rules_login_events["NAME"] = name
    return [rule_id], audit_rules_login_events

def audit_rules_path_syscall_csv_to_dict(csv_line):
    audit_rules_path_syscall = {}

    path = csv_line[0]
    syscall = csv_line[1]
    arg_pos = csv_line[2]
    # remove root slash made into '_'
    path_id = escape_path(path)[1:]
    rule_id = f"audit_rules_{path_id}_{syscall}"

    audit_rules_path_syscall["PATH"] = path
    audit_rules_path_syscall["PATHID"] = path_id
    audit_rules_path_syscall["SYSCALL"] = syscall
    audit_rules_path_syscall["POS"] = arg_pos
    return [rule_id], audit_rules_path_syscall

def audit_rules_unsuccessful_file_modification_csv_to_dict(csv_line):
    audit_rules_unsuccessful_file_modification  = {}

    name = csv_line[0]
    rule_id = f"audit_rules_unsuccessful_file_modification_{name}"

    audit_rules_unsuccessful_file_modification ["NAME"] = name
    return [rule_id], audit_rules_unsuccessful_file_modification

def audit_rules_unsuccessful_file_modification_detailed_csv_to_dict(csv_line):
    audit_rules_unsuccessful_file_modification_detailed = {}

    syscall = csv_line[0]
    arg_pos = csv_line[1]

    rule_ids = [f"audit_rules_unsuccessful_file_modification_{syscall}_o_creat",
                f"audit_rules_unsuccessful_file_modification_{syscall}_o_trunc_write",
                f"audit_rules_unsuccessful_file_modification_{syscall}_rule_order",
                ]
    audit_rules_unsuccessful_file_modification_detailed["SYSCALL"] = syscall
    audit_rules_unsuccessful_file_modification_detailed["POS"] = arg_pos

    return rule_ids, audit_rules_unsuccessful_file_modification_detailed

def audit_rules_usergroup_modification_csv_to_dict(csv_line):
    user_group_modification = {}

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_usergroup_modification_{name}"

    user_group_modification["NAME"] = name
    user_group_modification["PATH"] = path
    return [rule_id], user_group_modification

def grub2_bootloader_argument_csv_to_dict(csv_line):
    grub2_bootloader_argument = {}

    arg_name= csv_line[0]
    arg_value = csv_line[1]
    rule_id = f"grub2_{arg_name}_argument"

    arg_name_value = f"{arg_name}={arg_value}"
    grub2_bootloader_argument["ARG_NAME"] = arg_name
    grub2_bootloader_argument["ARG_NAME_VALUE"] = arg_name_value
    return [rule_id], grub2_bootloader_argument

def kernel_modules_disabled_csv_to_dict(csv_line):
    kernel_modules_disabled = {}

    kernmod = csv_line[0]
    rule_id = f"kernel_module_{kernmod}_disabled"

    kernel_modules_disabled["KERNMODULE"] = kernmod
    return [rule_id], kernel_modules_disabled

def packages_installed_csv_to_dict(csv_line):
    package_installed = {}

    pkgname = csv_line[0]
    rule_id = f"package_{pkgname}_installed"

    if len(csv_line) == 2:
        evr = csv_line[1]
    else:
        evr = ""

    package_installed["PKGNAME"] = pkgname
    package_installed["EVR"] = evr
    return [rule_id], package_installed

def packages_removed_csv_to_dict(csv_line):
    package_removed = {}

    pkgname = csv_line[0]
    rule_id = f"package_{pkgname}_removed"

    # Some CSVs have two fields for packages_removed, but
    # create_package_removed.py doesn't use the second field.
    # So just ignore it as well

    package_removed["PKGNAME"] = pkgname
    return [rule_id], package_removed

class ProductCSVData(object):
    TEMPLATE_TO_CSV_FORMAT_MAP = {
            "accounts_password": accounts_password_csv_to_dict,
            "audit_rules_execution": audit_rules_execution_csv_to_dict,
            "audit_rules_privileged_commands": audit_rules_privileged_commands_csv_to_dict,
            "audit_rules_dac_modification": audit_rules_dac_modification_csv_to_dict,
            "audit_rules_file_deletion_events": audit_rules_file_deletion_events_csv_to_dict,
            "audit_rules_login_events": audit_rules_login_events_csv_to_dict,
            "audit_rules_path_syscall": audit_rules_path_syscall_csv_to_dict,
            "audit_rules_unsuccessful_file_modification": audit_rules_unsuccessful_file_modification_csv_to_dict,
            "audit_rules_unsuccessful_file_modification_detailed": audit_rules_unsuccessful_file_modification_detailed_csv_to_dict,
            "audit_rules_usergroup_modification": audit_rules_usergroup_modification_csv_to_dict,
            "grub2_bootloader_argument": grub2_bootloader_argument_csv_to_dict,
            "kernel_modules_disabled": kernel_modules_disabled_csv_to_dict,
            "packages_installed": packages_installed_csv_to_dict,
            "packages_removed": packages_removed_csv_to_dict,
            }

    def __init__(self, product, ssg_root):
        self.product = product
        self.ssg_root = ssg_root  # Needed?

        self.csv_dir = os.path.join(ssg_root, product, "templates/csv")
        self.csv_files = self._identify_csv_files(self.csv_dir)

        self.csv_data = self._load_csv_files(self.csv_files)

    def _identify_csv_files(self, csv_dir):
        try:
            # get all CSV files
            product_csvs = [csv_filename for csv_filename in os.listdir(csv_dir)
                            if csv_filename.endswith(".csv")]
        except FileNotFoundError as not_found:
            product_csvs = []
            # double check that exception is on templates/csv directory
            if not_found.filename != csv_dir:
                raise not_found
        return product_csvs

    def _load_csv_files(self, csv_files):
        csv_data = {}
        for csv_filename in csv_files:
            template_name = csv_filename.replace(".csv", "")

            # Only load CSV for which we know the format
            if template_name not in self.TEMPLATE_TO_CSV_FORMAT_MAP:
                continue

            with open(os.path.join(self.csv_dir, csv_filename), "r") as csv_f:
                csv_data[template_name] = self._load_csv(template_name, csv_f)
        return csv_data

    def _load_csv(self, template_name, csv_f):
        template_data = {}
        template_csv_parser = self.TEMPLATE_TO_CSV_FORMAT_MAP[template_name]

        for line in csv.reader(csv_f):
            # Skip empty lines
            if len(line) == 0:
                continue

            # Skip all comment lines
            if len(line) >= 1 and line[0].startswith('#'):
                continue

            rule_ids, line_data_dict = template_csv_parser(line)
            for rule_id in rule_ids:
                template_data[rule_id] = line_data_dict
        return template_data


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("ssg_root", help="Path to root of ssg git directory")

    return p.parse_args()


def main():
    args = parse_args()

    show_data = {}
    templated_content = {}

    # Load all product's CSV data
    for product_name in product_directories:
        product = ProductCSVData(product_name, args.ssg_root)
        templated_content[product_name] = product.csv_data
        show_data[product_name] = product.csv_data

    # Load shared CSV Data as if it were a Product
    product_name = "shared"
    product = ProductCSVData(product_name, args.ssg_root)
    templated_content[product_name] = product.csv_data
    show_data[product_name] = product.csv_data

    # Ilustrate DataStructure
    pprint.pprint(show_data)

    # Normalize loaded CSV Data

    # Walk through benchmark and add data into rule.yml


if __name__ == "__main__":
    main()
