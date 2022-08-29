#!/bin/bash
# packages = authselect
# platform = Red Hat Enterprise Linux 8,Red Hat Enterprise Linux 9,multi_platform_fedora
# variables = var_password_pam_unix_rounds=65536

ROUNDS=4000
authselect create-profile hardening -b sssd
CUSTOM_PROFILE="custom/hardening"
authselect select $CUSTOM_PROFILE --force
CUSTOM_PASSWORD_AUTH="/etc/authselect/$CUSTOM_PROFILE/password-auth"
if ! $(grep -q "^\s*password.*pam_unix\.so.*rounds=" $CUSTOM_PASSWORD_AUTH); then
	sed -i --follow-symlinks "/^\s*password.*pam_unix\.so/ s/$/ rounds=$ROUNDS/" $CUSTOM_PASSWORD_AUTH
else
	sed -r -i --follow-symlinks "s/(^\s*password.*pam_unix\.so.*)(rounds=[[:digit:]]+)(.*)/\1rounds=$ROUNDS \3/g" $CUSTOM_PASSWORD_AUTH
fi
authselect apply-changes -b
