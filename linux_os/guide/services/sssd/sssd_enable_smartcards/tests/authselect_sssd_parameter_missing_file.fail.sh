#!/bin/bash
# packages = authselect,sssd
# platform = multi_platform_fedora,Oracle Linux 8,Oracle Linux 9,Red Hat Enterprise Linux 8,Red Hat Enterprise Linux 9

SSSD_FILE="/etc/sssd/sssd.conf"
rm -f $SSSD_FILE

authselect select sssd --force
authselect enable-feature with-smartcard
authselect apply-changes
