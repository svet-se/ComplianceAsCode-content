#!/bin/bash

# profiles = xccdf_org.ssgproject.content_profile_ospp
# remediation = none

echo "-a always,exit -F arch=b32 -S openat -F a2&03 -F path=/etc/passwd -F auid&gt;=1000 -F auid!=unset -F key=user-modify" >> /etc/audit/rules.d/var_log_audit.rules
echo "-a always,exit -F arch=b64 -S openat -F a2&03 -F path=/etc/passwd -F auid&gt;=1000 -F auid!=unset -F key=user-modify" >> /etc/audit/rules.d/var_log_audit.rules
