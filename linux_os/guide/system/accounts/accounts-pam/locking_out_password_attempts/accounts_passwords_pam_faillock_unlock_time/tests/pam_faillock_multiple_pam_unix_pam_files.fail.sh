#!/bin/bash
# packages = authconfig
# platform = multi_platform_fedora,Red Hat Enterprise Linux 7
# remediation = none
# variables = var_accounts_passwords_pam_faillock_unlock_time=600

authconfig --enablefaillock --faillockargs="unlock_time=600" --update

# Multiple instances of pam_unix.so in auth section may, intentionally or not, interfere
# in the expected behaviour of pam_faillock.so. Remediation does not solve this automatically
# in order to preserve intentional changes.
echo "auth        sufficient       pam_unix.so" >> /etc/pam.d/password-auth
