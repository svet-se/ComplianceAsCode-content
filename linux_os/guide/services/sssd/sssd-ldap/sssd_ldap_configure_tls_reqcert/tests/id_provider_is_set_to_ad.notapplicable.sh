#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_stig

. $SHARED/setup_config_files.sh
setup_correct_sssd_config
sed -i 's/id_provider = ldap/id_provider = ad/' /etc/sssd/sssd.conf
