#!/bin/bash

. $SHARED/dconf_test_functions.sh

install_dconf_and_gdm_if_needed

clean_dconf_settings
add_dconf_setting "org/gnome/login-screen" "allowed-failures" "99" "distro.d" "00-security-settings"
add_dconf_lock "org/gnome/login-screen" "allowed-failures" "distro.d" "00-security-settings-lock"

dconf update
