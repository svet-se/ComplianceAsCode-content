#!/bin/bash
# packages = audit
# platform = Red Hat Enterprise Linux 8,multi_platform_fedora

. $SHARED/auditd_utils.sh
prepare_auditd_test_enviroment
set_parameters_value {{{ audisp_conf_path }}}/audisp-remote.conf "remote_server" "logcollector"
