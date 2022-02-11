#!/bin/bash
# packages = chrony
# platform = multi_platform_fedora,multi_platform_rhel
# remediation = none

sed -i "^server.*" /etc/chrony.conf
if ! grep "^pool.*" /etc/chrony.conf; then
    echo "pool 0.pool.ntp.org" > /etc/chrony.conf
fi
