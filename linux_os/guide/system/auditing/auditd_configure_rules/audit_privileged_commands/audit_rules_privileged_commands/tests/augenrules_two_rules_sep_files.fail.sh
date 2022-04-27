#!/bin/bash
# packages = audit
# remediation = bash
# platform = Fedora,Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8

mkdir -p /etc/audit/rules.d
echo "-a always,exit -F path=/usr/bin/newgrp -F auid>=1000 -F auid!=unset -F key=privileged" >> /etc/audit/rules.d/priv.rules
echo "-a always,exit -F path=/usr/bin/passwd -F auid>=1000 -F auid!=unset -F key=privileged" >> /etc/audit/rules.d/privileged.rules
