#!/bin/bash
# packages = audit


echo "-w /etc/passwd -p w -k audit_rules_usergroup_modification" >> /etc/audit/rules.d/login.rules
