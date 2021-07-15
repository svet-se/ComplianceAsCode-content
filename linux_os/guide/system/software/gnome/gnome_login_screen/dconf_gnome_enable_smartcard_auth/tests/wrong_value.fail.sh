#!/bin/bash
# packages = dconf,gdm

{{% set dconf_db = "distro.d" %}}
{{% if product not in ("fedora", "rhel9") %}}
{{% set dconf_db = "gdm.d" %}}
{{% endif %}}

. $SHARED/dconf_test_functions.sh

install_dconf_and_gdm_if_needed

clean_dconf_settings
add_dconf_setting "org/gnome/login-screen" "enable-smartcard-authentication" "false" "{{{ dconf_db }}}" "00-security-settings"
add_dconf_lock "org/gnome/login-screen" "enable-smartcard-authentication" "{{{ dconf_db }}}" "00-security-settings-lock"

dconf update
