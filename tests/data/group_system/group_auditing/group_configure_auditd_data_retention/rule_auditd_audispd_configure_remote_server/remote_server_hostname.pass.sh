#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_ospp

. ../../auditd_utils.sh
prepare_auditd_test_enviroment
set_parameters_value /etc/audisp/audisp-remote.conf "remote_server" "myhost.mydomain.com"
