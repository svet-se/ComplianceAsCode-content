#!/bin/bash
# packages = authconfig
# platform = Oracle Linux 7,multi_platform_fedora
# variables = var_accounts_passwords_pam_faillock_deny=3

authconfig --enablefaillock --faillockargs="deny=3" --update
