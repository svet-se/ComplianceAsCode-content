#!/bin/bash
# packages = audit
# variables = var_auditd_space_left_percentage=25

. $SHARED/auditd_utils.sh
prepare_auditd_test_enviroment
set_parameters_value /etc/audit/auditd.conf "space_left" "35%"
