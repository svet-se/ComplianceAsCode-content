#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_pci-dss
# remediation = bash

sed -i "s%^ExecStartPost=.*%ExecStartPost=-/sbin/auditctl%" /usr/lib/systemd/system/auditd.service
cp rhel7_privileged.rules /etc/audit/rules.d/privileged.rules
cp rhel7_privileged.rules /etc/audit/audit.rules
