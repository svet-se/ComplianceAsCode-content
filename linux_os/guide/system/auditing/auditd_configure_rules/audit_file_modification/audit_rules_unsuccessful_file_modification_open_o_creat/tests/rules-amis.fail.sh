#!/bin/bash
# packages = audit

# remediation = none

sed '3,4d' $SHARED/audit_open_o_creat.rules > /etc/audit/rules.d/open-o_creat.rules
