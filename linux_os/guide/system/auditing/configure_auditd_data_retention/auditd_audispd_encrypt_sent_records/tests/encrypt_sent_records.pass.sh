#!/bin/bash
# platform = Red Hat Enterprise Linux 7

. $SHARED/auditd_utils.sh
prepare_auditd_test_enviroment
set_parameters_value {{{ audisp_conf_path }}}/audisp-remote.conf "enable_krb5" "yes"
