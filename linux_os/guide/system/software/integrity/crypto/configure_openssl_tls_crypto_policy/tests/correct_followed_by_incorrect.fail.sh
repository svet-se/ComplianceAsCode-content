#!/bin/bash
# platform = multi_platform_fedora,Red Hat Enterprise Linux 8

configfile=/etc/crypto-policies/back-ends/opensslcnf.config

echo "MinProtocol = TLSv1.2" > "$configfile"
echo "MinProtocol = TLSv1.0" >> "$configfile"
