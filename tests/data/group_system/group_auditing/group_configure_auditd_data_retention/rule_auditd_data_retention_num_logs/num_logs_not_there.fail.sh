#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_cui
# remediation = bash

. ../../auditd_utils.sh
prepare_auditd_test_enviroment
delete_parameter /etc/audit/auditd.conf "num_logs"
