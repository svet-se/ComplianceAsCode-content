#!/bin/bash
# packages = audit
# remediation = bash

{{% if product in ["rhel8", "rhel9"] %}}
{{% set faillock_path="/var/log/faillock" %}}
{{% else %}}
{{% set faillock_path="{{{ faillock_path }}}" %}}
{{% endif %}}


echo "-w {{{ faillock_path }}} -p wa -k logins" >> /etc/audit/rules.d/logins.rules
echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/rules.d/logins.rules
echo "-w /var/log/tallylog -p wa -k logins" >> /etc/audit/rules.d/logins.rules
