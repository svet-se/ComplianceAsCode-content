#!/bin/bash
# packages = audit
# platform = multi_platform_fedora,multi_platform_rhel,Oracle Linux 7,Oracle Linux 8

./generate_privileged_commands_rule.sh 1000 privileged /etc/audit/rules.d/privileged.rules
 sed -i '/newgrp/d' /etc/audit/rules.d/privileged.rules
