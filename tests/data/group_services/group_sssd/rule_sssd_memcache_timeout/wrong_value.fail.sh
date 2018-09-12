#!/bin/bash

# profiles = xccdf_org.ssgproject.content_profile_ospp

SSSD_CONF="/etc/sssd/sssd.conf"

# The rule sssd_memcache_timeout requires memcache_timeout = 86400
# Let's put there a different value to fail
TIMEOUT="99999"

dnf -y install sssd
systemctl enable sssd
mkdir -p /etc/sssd
touch $SSSD_CONF
echo -e "[nss]\nmemcache_timeout = $TIMEOUT" >> $SSSD_CONF
