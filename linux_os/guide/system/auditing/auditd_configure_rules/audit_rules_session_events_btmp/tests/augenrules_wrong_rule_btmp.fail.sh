#!/bin/bash
# packages = audit


mkdir -p /etc/audit/rules.d
echo "-w /var/log/something -p wa -k logins" >> /etc/audit/rules.d/login.rules
