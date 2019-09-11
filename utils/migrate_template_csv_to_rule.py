import argparse
import csv
from collections import defaultdict
import os
import pprint
import re

from ssg.constants import product_directories


def escape_path(path):
    return re.sub('[-\./]', '_', path)

def accounts_password_csv_to_dict(csv_line, csv_data):
    accounts_password = {}
    data_accounts_password = {}
    accounts_password["name"] = "package_installed"

    variable = csv_line[0]
    rule_id = f"accounts_password_pam_{variable}"

    operation = csv_line[1]

    data_accounts_password["VARIABLE"] = variable
    data_accounts_password["OPERATION"] = operation
    accounts_password["vars"] = data_accounts_password
    csv_data[rule_id] = accounts_password
    return accounts_password

def audit_rules_execution_csv_to_dict(csv_line, csv_data):
    audit_rules_execution = {}
    data_audit_rules_execution = {}
    audit_rules_execution["name"] = "audit_rules_privileged_commands"

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_execution_{name}"

    # create_audit_rules_execution.py escapes the '/' when generating the OVAL
    # This is not actually necessary
    data_audit_rules_execution["PATH"] = path
    audit_rules_execution["vars"] = data_audit_rules_execution

    csv_data[rule_id] = audit_rules_execution
    return audit_rules_execution

def audit_rules_privileged_commands_csv_to_dict(csv_line, csv_data):
    audit_rules_privileged_commands = {}
    data_audit_rules_privileged_commands = {}
    audit_rules_privileged_commands["name"] = "audit_rules_privileged_commands"

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_privileged_commands_{name}"

    # create_audit_rules_privileged_commands.py escapes the '/' when generating the OVAL
    # This is not actually necessary
    data_audit_rules_privileged_commands["PATH"] = path
    audit_rules_privileged_commands["vars"] = data_audit_rules_privileged_commands

    csv_data[rule_id] = audit_rules_privileged_commands
    return audit_rules_privileged_commands

def audit_rules_dac_modification_csv_to_dict(csv_line, csv_data):
    audit_rules_dac_modification = {}
    data_audit_rules_dac_modification = {}
    audit_rules_dac_modification["name"] = "audit_rules_dac_modification"

    attr = csv_line[0]
    rule_id = f"audit_rules_dac_modification_{attr}"

    data_audit_rules_dac_modification["ATTR"] = attr
    audit_rules_dac_modification["vars"] = data_audit_rules_dac_modification

    csv_data[rule_id] = audit_rules_dac_modification
    return audit_rules_dac_modification

def audit_rules_file_deletion_events_csv_to_dict(csv_line, csv_data):
    audit_rules_file_deletion_events = {}
    data_audit_rules_file_deletion_events = {}
    audit_rules_file_deletion_events["name"] = "audit_rules_file_deletion_events"

    name = csv_line[0]
    rule_id = f"audit_rules_file_deletion_events_{name}"

    data_audit_rules_file_deletion_events["NAME"] = name
    audit_rules_file_deletion_events["vars"] = data_audit_rules_file_deletion_events

    csv_data[rule_id] = audit_rules_file_deletion_events
    return audit_rules_file_deletion_events

def audit_rules_login_events_csv_to_dict(csv_line, csv_data):
    audit_rules_login_events = {}
    data_audit_rules_login_events = {}
    audit_rules_login_events["name"] = "audit_rules_login_events"

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_login_events_{name}"

    data_audit_rules_login_events["PATH"] = path
    audit_rules_login_events["vars"] = data_audit_rules_login_events

    csv_data[rule_id] = audit_rules_login_events
    return audit_rules_login_events

def audit_rules_path_syscall_csv_to_dict(csv_line, csv_data):
    audit_rules_path_syscall = {}
    data_audit_rules_path_syscall = {}
    audit_rules_path_syscall["name"] = "audit_rules_path_syscall"

    path = csv_line[0]
    syscall = csv_line[1]
    arg_pos = csv_line[2]
    # remove root slash made into '_'
    path_id = escape_path(path)[1:]
    rule_id = f"audit_rules_{path_id}_{syscall}"

    data_audit_rules_path_syscall["PATH"] = path
    data_audit_rules_path_syscall["SYSCALL"] = syscall
    data_audit_rules_path_syscall["POS"] = arg_pos
    audit_rules_path_syscall["vars"] = data_audit_rules_path_syscall

    csv_data[rule_id] = audit_rules_path_syscall
    return audit_rules_path_syscall

def audit_rules_unsuccessful_file_modification_csv_to_dict(csv_line, csv_data):
    audit_rules_unsuccessful_file_modification  = {}
    data_audit_rules_unsuccessful_file_modification  = {}
    audit_rules_unsuccessful_file_modification["name"] = "audit_rules_unsuccessful_file_modification"

    name = csv_line[0]
    rule_id = f"audit_rules_unsuccessful_file_modification_{name}"

    data_audit_rules_unsuccessful_file_modification ["NAME"] = name
    audit_rules_unsuccessful_file_modification ["vars"] = data_audit_rules_unsuccessful_file_modification

    csv_data[rule_id] = audit_rules_unsuccessful_file_modification
    return audit_rules_unsuccessful_file_modification

def audit_rules_unsuccessful_file_modification_detailed_csv_to_dict(csv_line, csv_data):
    audit_rules_unsuccessful_file_modification_detailed = {}
    data_audit_rules_unsuccessful_file_modification_detailed = {}

    syscall = csv_line[0]
    arg_pos = csv_line[1]

    template_base = "audit_rules_unsuccessful_file_modification_"
    template_suffixes = ["o_creat",
                "o_trunc_write",
                "rule_order",
                ]

    data_audit_rules_unsuccessful_file_modification_detailed["SYSCALL"] = syscall
    data_audit_rules_unsuccessful_file_modification_detailed["POS"] = arg_pos
    audit_rules_unsuccessful_file_modification_detailed["vars"] = data_audit_rules_unsuccessful_file_modification_detailed

    for suffix in template_suffixes:
        audit_rules_unsuccessful_file_modification_detailed["name"] = f"{template_base}{suffix}"
        rule_id = f"{template_base}{syscall}_{suffix}"
        # If a csv line has except-for, it won't be handled correctly
        csv_data[rule_id] = audit_rules_unsuccessful_file_modification_detailed.copy()

    return audit_rules_unsuccessful_file_modification_detailed

def audit_rules_usergroup_modification_csv_to_dict(csv_line, csv_data):
    user_group_modification = {}
    data_user_group_modification = {}
    user_group_modification["name"] = "audit_rules_usergroup_modification"

    path = csv_line[0]
    name = escape_path(os.path.basename(path))
    rule_id = f"audit_rules_usergroup_modification_{name}"

    data_user_group_modification["PATH"] = path
    user_group_modification["vars"] = data_user_group_modification

    csv_data[rule_id] = user_group_modification
    return user_group_modification

def grub2_bootloader_argument_csv_to_dict(csv_line, csv_data):
    grub2_bootloader_argument = {}
    data_grub2_bootloader_argument = {}
    grub2_bootloader_argument["name"] = "grub2_bootloader_argument"

    arg_name= csv_line[0]
    arg_value = csv_line[1]
    rule_id = f"grub2_{arg_name}_argument"

    arg_name_value = f"{arg_name}={arg_value}"
    data_grub2_bootloader_argument["ARG_NAME"] = arg_name
    data_grub2_bootloader_argument["ARG_VALUE"] = arg_value
    grub2_bootloader_argument["vars"] = data_grub2_bootloader_argument

    csv_data[rule_id] = grub2_bootloader_argument
    return grub2_bootloader_argument

def kernel_modules_disabled_csv_to_dict(csv_line, csv_data):
    kernel_modules_disabled = {}
    data_kernel_modules_disabled = {}
    kernel_modules_disabled["name"] = "kernel_module_disabled"

    kernmod = csv_line[0]
    rule_id = f"kernel_module_{kernmod}_disabled"

    data_kernel_modules_disabled["KERNMODULE"] = kernmod
    kernel_modules_disabled["vars"] = data_kernel_modules_disabled

    csv_data[rule_id] = kernel_modules_disabled
    return kernel_modules_disabled

def lineinfile_csv_to_dict(csv_line, csv_data, _type):
    lineinfile = {}
    data_lineinfile = {}
    lineinfile["name"] = "{_type}_lineinfile"

    rule_id = csv_line[0]
    parameter = csv_line[1]
    value = csv_line[2]
    if len(csv_line) == 4:
        missing_parameter_pass = csv_line[3]
    else:
        missing_paramteter_pass = "false"

    data_lineinfile["rule_id"] = rule_id
    data_lineinfile["PARAMETER"] = parameter
    data_lineinfile["VALUE"] = value
    data_lineinfile["MISSING_PARAMETER_PASS"] = missing_parameter_pass
    lineinfile["vars"] = data_lineinfile

    csv_data[rule_id] = lineinfile
    return lineinfile

def auditd_lineinfile_csv_to_dict(csv_line, csv_data):
    return lineinfile_csv_to_dict(csv_line, csv_data, "auditd")

def sshd_lineinfile_csv_to_dict(csv_line, csv_data):
    return lineinfile_csv_to_dict(csv_line, csv_data, "sshd")

def mount_options_csv_to_dict(csv_line, csv_data):
    mount_options = {}
    data_mount_options = {}

    mount_point = csv_line[0]
    mount_option = csv_line[1].strip()

    template_base = "mount_option"
    mount_has_to_exist = "yes"
    filesystem = ""
    mount_point_type = ""
    if len(csv_line) > 2:
        # When create_fstab_entry_if_needed is in CSV file, load next two values
        mount_has_to_exist = "no"
        filesystem = csv_line[3]
        mount_point_type = csv_line[4]

    point_id = f"{mount_point}"
    if mount_point.startswith("var_"):
        # var_removable_partition -> removable_partitions
        point_id = re.sub(r"^var_(.*)", r"\1s", mount_point)
        rule_id = f"mount_option_{mount_option}_{point_id}"
        mount_options["name"] = f"{template_base}_{point_id}"
    elif mount_point.startswith("/"):
        point_id = escape_path(mount_point)[1:]
        rule_id = f"mount_option_{point_id}_{mount_option}"
        mount_options["name"] = template_base
    else:
        point_id = mount_point
        rule_id = f"mount_option_{mount_option}_{point_id}"
        mount_options["name"] = f"{template_base}_{point_id}"

    # Not all fields will be used by all templates, this is fine,
    # they will just be ignored
    data_mount_options["MOUNT_HAS_TO_EXIST"] = mount_has_to_exist
    data_mount_options["FILESYSTEM"] = filesystem
    data_mount_options["TYPE"] = mount_point_type
    data_mount_options["MOUNTPOINT"] = mount_point
    data_mount_options["MOUNTOPTION"] = mount_option
    mount_options["vars"] = data_mount_options

    csv_data[rule_id] = mount_options
    return mount_options

def mounts_csv_to_dict(csv_line, csv_data):
    mounts = {}
    data_mounts = {}
    mounts["name"] = "mount"

    mountpoint = csv_line[0]
    point_id = escape_path(mountpoint)
    rule_id = f"partition_for{point_id}"

    data_mounts["MOUNTPOINT"] = mountpoint
    mounts["vars"] = data_mounts

    csv_data[rule_id] = mounts
    return mounts

# It seems there are no rules for these templated content
def ocp_service_runtime_config_csv_to_dict(csv_line, csv_data):
    ocp_service = {}
    data_ocp_service = {}
    ocp_service["name"] = "ocp_service_config"

    process_cmd = csv_line[0]
    process_cmd_option = csv_line[1]
    process_cmd_val = csv_line[2]

    ocp_proc_id = re.sub(r'[-._]', '_', process_cmd_option.strip("--="))
    if len(csv_line) == 4:
        ocp_proc_id = csv_line[3]

    rule_id = f"ocp_service_runtime_config_{ocp_proc_id}"

    data_ocp_service["OCPCMDOPTIONID"] = process_cmd
    data_ocp_service["OCPPROCESS"] = process_cmd
    data_ocp_service["OCPCMDOPTION"] = process_cmd_option
    data_ocp_service["OCPCMDVAL"] = process_cmd_val
    ocp_service["vars"] = data_ocp_service

    csv_data[rule_id] = ocp_service
    return ocp_service

def packages_installed_csv_to_dict(csv_line, csv_data):
    package_installed = {}
    data_package_installed = {}
    package_installed["name"] = "package_installed"

    pkgname = csv_line[0]
    rule_id = f"package_{pkgname}_installed"

    if len(csv_line) == 2:
        evr = csv_line[1]
    else:
        evr = ""

    data_package_installed["PKGNAME"] = pkgname
    data_package_installed["EVR"] = evr
    package_installed["vars"] = data_package_installed

    csv_data[rule_id] = package_installed
    return package_installed

def packages_removed_csv_to_dict(csv_line, csv_data):
    package_removed = {}
    data_package_removed = {}
    package_removed["name"] = "package_removed"

    pkgname = csv_line[0]
    rule_id = f"package_{pkgname}_removed"

    # Some CSVs have two fields for packages_removed, but
    # create_package_removed.py doesn't use the second field.
    # So just ignore it as well

    data_package_removed["PKGNAME"] = pkgname
    package_removed["vars"] = data_package_removed

    csv_data[rule_id] = package_removed
    return package_removed

def permissions_csv_to_dict(csv_line, csv_data):
    permissions = {}
    data_permissions = {}
    owner = {}
    data_owner = {}
    groupowner= {}
    data_groupowner= {}
    file_permissions = {}
    data_file_permissions = {}

    dir_path = csv_line[0]
    file_name = csv_line[1]
    uid = csv_line[2]
    gid = csv_line[3]
    mode = csv_line[4]

    template_list = []

    # The following few lines were extracted from create_permissions.py
    if len(csv_line) == 6:
        path_id = f"_{csv_line[5]}"
    elif file_name == '[NULL]':
        path_id = re.sub('[-\./]', '_', dir_path)
    elif re.match(r'\^.*\$', file_name, 0):
        path_id = re.sub('[-\./]', '_', dir_path) + '_' + re.sub('[-\\\./^$*(){}|]',
                                                                 '_', file_name)
        # cleaning trailing end multiple underscores, make sure id is lowercase
        path_id = re.sub(r'_+', '_', path_id)
        path_id = re.sub(r'_$', '', path_id)
        path_id = path_id.lower()
    else:
        path_id = re.sub('[-\./]', '_', dir_path) + '_' + re.sub('[-\./]',
                                                                 '_', file_name)
        path_id = path_id.lower()

    # build a string that contains the full path to the file
    # full_path maps to FILEPATH in the template
    if file_name == '[NULL]' or file_name == '':
        full_path = dir_path
    else:
        full_path = dir_path + '/' + file_name

    if not re.match(r'\^.*\$', file_name, 0):
        if mode:
            rule_id = f"file_permissions{path_id}"
            file_permissions["name"] = f"file_permissions"
            data_file_permissions["FILEPATH"] = full_path
            data_file_permissions["FILEMODE"] = mode
            file_permissions["vars"] = data_file_permissions
            csv_data[rule_id] = file_permissions
        if uid:
            rule_id = f"file_owner{path_id}"
            owner["name"] = f"file_owner"
            data_owner["FILEPATH"] = full_path
            data_owner["FILEUID"] = uid
            owner["vars"] = data_owner
            csv_data[rule_id] = owner
        if gid:
            rule_id = f"file_groupowner{path_id}"
            groupowner["name"] = f"file_groupowner"
            data_groupowner["FILEPATH"] = full_path
            data_groupowner["FILEGID"] = gid
            groupowner["vars"] = data_groupowner
            csv_data[rule_id] = groupowner

        rule_id = f"permissions{path_id}"
        permissions["name"] = f"permissions"
        data_permissions["FILEPATH"] = full_path
        data_permissions["FILEMODE"] = mode
        data_permissions["FILEUID"] = uid
        data_permissions["FILEGID"] = gid
        permissions["vars"] = data_permissions
        csv_data[rule_id] = permissions
    else:
        rule_id = f"file_permissions{path_id}"
        file_permissions["name"] = f"file_regex_permissions"
        data_file_permissions["FILENAME"] = file_name
        data_file_permissions["FILEPATH"] = dir_path
        data_file_permissions["FILEMODE"] = mode
        file_permissions["vars"] = data_file_permissions
        csv_data[rule_id] = file_permissions

    # Fields FILEID, STATEMODE, UNIX_DIR, UNIX_FILENAME will be translated into rule.yml
    # They will be generated from data above during templated content generation

    return permissions


def selinux_booleans_csv_to_dict(csv_line, csv_data):
    selinux_boolean = {}
    data_selinux_boolean = {}

    sebool_name = csv_line[0]
    sebool_id = escape_path(sebool_name)
    rule_id = f"sebool_{sebool_id}"

    sebool_state = csv_line[1]
    if sebool_state == "on" or sebool_state == "enable":
        sebool_bool = "true"
    elif sebool_state == "off" or sebool_state == "disable":
        sebool_bool = "false"

    data_selinux_boolean["SEBOOLID"] = sebool_id
    if sebool_state == "use_var":
        selinux_boolean["name"] = "sebool_var"
    else:
        selinux_boolean["name"] = "sebool"
        data_selinux_boolean["SEBOOL_BOOL"] = sebool_bool
    selinux_boolean["vars"] = data_selinux_boolean

    csv_data[rule_id] = selinux_boolean
    return selinux_boolean


def services_disabled_csv_to_dict(csv_line, csv_data):
    service_disabled = {}
    data_service_disabled = {}
    service_disabled["name"] = "service_disabled"

    service_name = csv_line[0]
    package_name = csv_line[1]
    daemon_name = csv_line[2]
    mask_service = "true"
    if len(csv_line) == 4:
        mask_service = csv_line[3]

    rule_id = f"service_{service_name}_disabled"

    data_service_disabled["SERVICENAME"] = service_name
    data_service_disabled["PACKAGENAME"] = package_name
    data_service_disabled["DAEMONNAME"] = daemon_name
    data_service_disabled["MASK_SERVICE"] = mask_service
    service_disabled["vars"] = data_service_disabled

    csv_data[rule_id] = service_disabled
    return service_disabled


def services_enabled_csv_to_dict(csv_line, csv_data):
    service_enabled = {}
    data_service_enabled = {}
    service_enabled["name"] = "service_enabled"

    service_name = csv_line[0]
    package_name = csv_line[1]
    if not package_name:
        package_name = service_name
    daemon_name = csv_line[2]
    if not daemon_name:
        daemon_name = service_name

    rule_id = f"service_{service_name}_enabled"

    data_service_enabled["SERVICENAME"] = service_name
    data_service_enabled["PACKAGENAME"] = package_name
    data_service_enabled["DAEMONNAME"] = daemon_name
    service_enabled["vars"] = data_service_enabled

    csv_data[rule_id] = service_enabled
    return service_enabled


def sysctl_values_csv_to_dict(csv_line, csv_data):
    sysctl_value = {}
    data_sysctl_value = {}

    sysctl_var = csv_line[0]
    sysctl_val = csv_line[1]
    # Default data type for sysctl is int
    data_type = "int"
    if len(csv_line) == 3:
        data_type = csv_line[2]
    sysctl_var_id = escape_path(sysctl_var)
    rule_id = f"sysctl_{sysctl_var_id}"

    if not sysctl_val.strip():
        sysctl_value["name"] = "sysctl_var"
    else:
        sysctl_value["name"] = "sysctl"

    data_sysctl_value["SYSCTLVAR"] = sysctl_var
    data_sysctl_value["SYSCTLVAL"] = sysctl_val
    data_sysctl_value["DATATYPE"] = data_type
    sysctl_value["vars"] = data_sysctl_value

    csv_data[rule_id] = sysctl_value
    return sysctl_value

def timers_enabled_csv_to_dict(csv_line, csv_data):
    timer_enabled = {}
    data_timer_enabled = {}
    timer_enabled["name"] = "timer_enabled"

    timer_name = csv_line[0]
    package_name = csv_line[1]
    if not package_name:
        package_name = timer_name
    rule_id = f"timer_{timer_name}_enabled"

    data_timer_enabled["TIMERNAME"] = timer_name
    data_timer_enabled["PACKAGE_NAME"] = package_name
    timer_enabled["vars"] = data_timer_enabled

    csv_data[rule_id] = timer_enabled
    return timer_enabled

class ProductCSVData(object):
    TEMPLATE_TO_CSV_FORMAT_MAP = {
            "accounts_password.csv": accounts_password_csv_to_dict,
            "audit_rules_execution.csv": audit_rules_execution_csv_to_dict,
            "audit_rules_privileged_commands.csv": audit_rules_privileged_commands_csv_to_dict,
            "audit_rules_dac_modification.csv": audit_rules_dac_modification_csv_to_dict,
            "audit_rules_file_deletion_events.csv": audit_rules_file_deletion_events_csv_to_dict,
            "audit_rules_login_events.csv": audit_rules_login_events_csv_to_dict,
            "audit_rules_path_syscall.csv": audit_rules_path_syscall_csv_to_dict,
            "audit_rules_unsuccessful_file_modification.csv": audit_rules_unsuccessful_file_modification_csv_to_dict,
            "audit_rules_unsuccessful_file_modification_detailed.csv": audit_rules_unsuccessful_file_modification_detailed_csv_to_dict,
            "audit_rules_usergroup_modification.csv": audit_rules_usergroup_modification_csv_to_dict,
            "grub2_bootloader_argument.csv": grub2_bootloader_argument_csv_to_dict,
            "kernel_modules_disabled.csv": kernel_modules_disabled_csv_to_dict,
            "auditd_lineinfile.csv": sshd_lineinfile_csv_to_dict,
            "sshd_lineinfile.csv": auditd_lineinfile_csv_to_dict,
            "mount_options.csv": mount_options_csv_to_dict,
            "mounts.csv": mounts_csv_to_dict,
            "ocp_service_runtime_config.csv": ocp_service_runtime_config_csv_to_dict,
            "packages_installed.csv": packages_installed_csv_to_dict,
            "packages_removed.csv": packages_removed_csv_to_dict,
            "file_dir_permissions.csv": permissions_csv_to_dict,
            "selinux_booleans.csv": selinux_booleans_csv_to_dict,
            "services_disabled.csv": services_disabled_csv_to_dict,
            "services_enabled.csv": services_enabled_csv_to_dict,
            "sysctl_values.csv": sysctl_values_csv_to_dict,
            "timers_enabled.csv": timers_enabled_csv_to_dict,
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
            self._load_csv(csv_filename, csv_data)
        return csv_data

    def _load_csv(self, csv_filename, csv_data):
        # Only load CSV for which we know the format
        csv_parser = self.TEMPLATE_TO_CSV_FORMAT_MAP.get(csv_filename, None)
        if not csv_parser:
            return

        with open(os.path.join(self.csv_dir, csv_filename), "r") as csv_f:
            for line in csv.reader(csv_f):
                # Skip empty lines
                if len(line) == 0:
                    continue

                # Skip all comment lines
                if len(line) >= 1 and line[0].startswith('#'):
                    continue

                except_for_language = None
                if "#except-for:" in line[-1]:
                    line[-1], except_for_clause = line[-1].split('#')
                    # There are no cases of except-for for multiple languagues
                    _, except_for_language = except_for_clause.split(':')

                try:
                    # Each CSV file is particular to its template, as a single CSV line can:
                    # - contain data for multiple rules in diferent templates
                    #   (audit_rules_unsuccessful_file_modification_detailed);
                    # A single CSV file can:
                    # - contain data for varying templates (mount_options).
                    # We let the CSV specific parser add the data
                    line_data_dict = csv_parser(line, csv_data)

                    if except_for_language:
                        line_data_dict[except_for_language] = "off"
                except IndexError as e:
                    print(f"line:{line} in file: {csv_f}")
                    raise e


    def merge_product_csv_data(self, product):
        """
        Each rule present in 'product' is incorporated into own csv_data.

        The added rule's CSV values, are changed from string to a dictionary of lists.
        The dictionary counts the occurences of a value, while keeping track of the
        products that use the value.
        """

        # Readability variables
        product_b = product.product
        data_a = self.csv_data
        data_b = product.csv_data

        for rule_id in data_b:
            rule_b = data_b[rule_id]
            rule_b_vars = rule_b["vars"]

            if rule_id in data_a:
                rule_a = data_a[rule_id]
                rule_a_vars = rule_a["vars"]
                for var in rule_b_vars:
                    new_value = rule_b_vars[var]
                    if type(rule_a_vars[var]) == defaultdict:
                        value_counter = rule_a_vars[var]
                        value_counter[new_value].append(product_b)
                    else:
                        # We substitute the string value for a dict where
                        # each 'key' is the template value, and
                        # each 'value' is a list of products that have it
                        value_counter = defaultdict(list)
                        value_counter[new_value].append(product_b)
                        rule_a_vars[var] = value_counter
            else:
                # Rule is new in the product
                # Add the rule with its values already in dictionary
                data_a[rule_id] = {"name": rule_b["name"]}
                data_a[rule_id]["vars"] = {}
                for var in rule_b_vars:
                    value_counter = defaultdict(list)
                    new_value = rule_b_vars[var]
                    value_counter[new_value].append(product_b)
                    data_a[rule_id]["vars"][var] = value_counter


    def resolve_csv_data(self):
        """
        Go over its own rules, resolving the rules CSV data.

        For each rule that has a dictionary instead of a string as the value of a
        template parameter, it counts the most popular value, and makes it the shared one.
        The other values are made product specific with 'param@product' notation.
        """
        for rule_id in self.csv_data:
            rule = self.csv_data[rule_id]
            rule_vars = rule["vars"]
            # We need a list to be able to iterate over the keys and change the dictionary
            for var in list(rule_vars):
                value_counter = rule_vars[var]
                if type(value_counter) == defaultdict:
                    if len(value_counter) == 1:
                        # there was only one value
                        rule_vars[var] = list(value_counter.keys())[0]
                    else:

                        # Determine which value has most products backing it
                        most_popular = 0
                        most_popular_value = ""
                        for value in value_counter.keys():
                            count = len(value_counter[value])
                            if count > most_popular:
                                most_popular = count
                                most_popular_value = value

                        for value in value_counter.keys():
                            if value == most_popular_value:
                                # The value with more products will be the shared one
                                rule_vars[var] = most_popular_value
                            else:
                                # other values are added with @product
                                for product in value_counter[value]:
                                    product_var = f"{var}@{product}"
                                    rule_vars[product_var] = value

def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("ssg_root", help="Path to root of ssg git directory")
    p.add_argument("--dump", help="Directory to dump collected CSV data")

    return p.parse_args()


def main():
    args = parse_args()

    if args.dump:
        try:
            os.mkdir(args.dump)
        except FileExistsError:
            pass

    show_data = {}
    templated_content = {}

    # Load all product's CSV data
    for product_name in product_directories:
        product = ProductCSVData(product_name, args.ssg_root)
        if args.dump:
            with open(os.path.join(args.dump, f"{product_name}.dump"), "w") as dump_f:
                pprint.pprint(product.csv_data, dump_f)
        templated_content[product_name] = product

    # Load shared CSV Data as if it were a Product
    product_name = "shared"
    shared_product = ProductCSVData(product_name, args.ssg_root)
    if args.dump:
        with open(os.path.join(args.dump, f"shared.dump"), "w") as dump_f:
            pprint.pprint(shared_product.csv_data, dump_f)

    # Resolve loaded CSV Data
    # Use shared "product" as the base reference
    for product in templated_content:
        shared_product.merge_product_csv_data(templated_content[product])

    shared_product.resolve_csv_data()
    if args.dump:
        with open(os.path.join(args.dump, f"shared_resolved.dump"), "w") as dump_f:
            pprint.pprint(shared_product.csv_data, dump_f)

    # Walk through benchmark and add data into rule.yml


if __name__ == "__main__":
    main()
