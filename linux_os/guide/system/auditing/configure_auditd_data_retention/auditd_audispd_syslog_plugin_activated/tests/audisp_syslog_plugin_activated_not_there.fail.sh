#!/bin/bash
# platform = Red Hat Enterprise Linux 7
# remediation = bash

. $SHARED/auditd_utils.sh
prepare_auditd_test_enviroment
delete_parameter {{{ audisp_conf_path }}}/plugins.d/syslog.conf "active"
