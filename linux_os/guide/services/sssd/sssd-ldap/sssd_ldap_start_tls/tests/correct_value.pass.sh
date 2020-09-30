#!/bin/bash

. $SHARED/setup_config_files.sh
setup_correct_sssd_config

yum -y install /usr/lib/systemd/system/sssd.service
systemctl enable sssd
