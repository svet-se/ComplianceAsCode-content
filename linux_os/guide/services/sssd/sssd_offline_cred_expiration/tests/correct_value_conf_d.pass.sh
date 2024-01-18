#!/bin/bash

source common.sh

SSSD_CONF_D_FILE="/etc/sssd/conf.d/unused.conf"

echo -e "[pam]\noffline_credentials_expiration = 1" >> $SSSD_CONF_D_FILE

echo -e "[domain/EXAMPLE]\ncache_credentials = true" >> $SSSD_CONF
