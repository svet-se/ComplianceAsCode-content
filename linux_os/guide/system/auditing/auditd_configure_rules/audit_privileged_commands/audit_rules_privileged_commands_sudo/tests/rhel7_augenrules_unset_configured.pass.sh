#!/bin/bash
# packages = audit
# remediation = bash
# platform = Red Hat Enterprise Linux 7,Fedora

mkdir -p /etc/audit/rules.d
echo "-a always,exit -F path=/usr/bin/sudo -F auid>=1000 -F auid!=unset -k privileged" >> /etc/audit/rules.d/privileged.rules
