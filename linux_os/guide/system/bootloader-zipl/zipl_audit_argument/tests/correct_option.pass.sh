#!/bin/bash
# platform = Red Hat Enterprise Linux 8
# remediation = none

# Make sure boot loader entries contain audit=1
for file in /boot/loader/entries/*.conf
do
    if ! grep -q '^options.*audit=1.*$' "$file" ; then
        sed -i '/^options / s/$/ audit=1/' "$file"
    fi
done

# Make sure /etc/kernel/cmdline contains audit=1
if ! grep -q '^(.*\s)?audit=1(\s.*)?$' /etc/kernel/cmdline ; then
    echo "audit=1" >> /etc/kernel/cmdline
fi
