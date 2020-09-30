#!/bin/bash

. $SHARED/dconf_test_functions.sh

yum -y install dconf
clean_dconf_settings
add_dconf_setting "org/gnome/desktop/screensaver" "lock-enabled" "true" "local.d" "00-security-settings"
