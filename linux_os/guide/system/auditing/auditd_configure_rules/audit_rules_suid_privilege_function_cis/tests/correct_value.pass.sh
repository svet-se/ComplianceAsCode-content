#!/bin/bash
# packages = audit

OTHER_FILTERS=" -C euid!=uid -F auid!=unset"

echo "-a always,exit -F arch=b32${OTHER_FILTERS} -S execve -k user_emulation" >> /etc/audit/rules.d/privileged.rules
echo "-a always,exit -F arch=b64${OTHER_FILTERS} -S execve -k user_emulation" >> /etc/audit/rules.d/privileged.rules
