#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_common

. ../set_parameters_value.sh

set_parameters_value /etc/audit/auditd.conf "num_logs" "1"
