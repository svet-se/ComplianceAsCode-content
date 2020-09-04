#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_stig

yum -y install /usr/lib/systemd/system/sssd.service
systemctl enable sssd

. $SHARED/setup_config_files.sh
setup_correct_sssd_config
