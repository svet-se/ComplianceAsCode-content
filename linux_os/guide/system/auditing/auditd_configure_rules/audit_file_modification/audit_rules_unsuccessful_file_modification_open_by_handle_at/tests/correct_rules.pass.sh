#!/bin/bash
#

rm -f /etc/audit/rules.d/*
> /etc/audit/audit.rules
echo "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=access" >> /etc/audit/rules.d/access.rules
echo "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=access" >> /etc/audit/rules.d/access.rules
echo "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=access" >> /etc/audit/rules.d/access.rules
echo "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=access" >> /etc/audit/rules.d/access.rules
