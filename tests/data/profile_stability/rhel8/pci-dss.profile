description: Ensures PCI-DSS v3.2.1 security configuration settings are applied.
documentation_complete: true
reference: https://www.hhs.gov/hipaa/for-professionals/index.html
selections:
- account_disable_post_pw_expiration
- account_unique_name
- accounts_maximum_age_login_defs
- accounts_password_all_shadowed
- accounts_password_pam_dcredit
- accounts_password_pam_lcredit
- accounts_password_pam_minlen
- accounts_password_pam_ucredit
- accounts_password_pam_unix_remember
- accounts_passwords_pam_faillock_deny
- accounts_passwords_pam_faillock_unlock_time
- aide_build_database
- aide_periodic_cron_checking
- audit_rules_dac_modification_chmod
- audit_rules_dac_modification_chown
- audit_rules_dac_modification_fchmod
- audit_rules_dac_modification_fchmodat
- audit_rules_dac_modification_fchown
- audit_rules_dac_modification_fchownat
- audit_rules_dac_modification_fremovexattr
- audit_rules_dac_modification_fsetxattr
- audit_rules_dac_modification_lchown
- audit_rules_dac_modification_lremovexattr
- audit_rules_dac_modification_lsetxattr
- audit_rules_dac_modification_removexattr
- audit_rules_dac_modification_setxattr
- audit_rules_file_deletion_events_rename
- audit_rules_file_deletion_events_renameat
- audit_rules_file_deletion_events_rmdir
- audit_rules_file_deletion_events_unlink
- audit_rules_file_deletion_events_unlinkat
- audit_rules_immutable
- audit_rules_kernel_module_loading_delete
- audit_rules_kernel_module_loading_finit
- audit_rules_kernel_module_loading_init
- audit_rules_login_events
- audit_rules_mac_modification
- audit_rules_media_export
- audit_rules_networkconfig_modification
- audit_rules_privileged_commands
- audit_rules_session_events
- audit_rules_sysadmin_actions
- audit_rules_time_adjtimex
- audit_rules_time_clock_settime
- audit_rules_time_settimeofday
- audit_rules_time_stime
- audit_rules_time_watch_localtime
- audit_rules_unsuccessful_file_modification_creat
- audit_rules_unsuccessful_file_modification_ftruncate
- audit_rules_unsuccessful_file_modification_open
- audit_rules_unsuccessful_file_modification_open_by_handle_at
- audit_rules_unsuccessful_file_modification_openat
- audit_rules_unsuccessful_file_modification_truncate
- audit_rules_usergroup_modification_group
- audit_rules_usergroup_modification_gshadow
- audit_rules_usergroup_modification_opasswd
- audit_rules_usergroup_modification_passwd
- audit_rules_usergroup_modification_shadow
- auditd_audispd_syslog_plugin_activated
- auditd_data_retention_action_mail_acct
- auditd_data_retention_admin_space_left_action
- auditd_data_retention_max_log_file
- auditd_data_retention_max_log_file_action
- auditd_data_retention_num_logs
- auditd_data_retention_space_left_action
- chronyd_or_ntpd_specify_multiple_servers
- chronyd_or_ntpd_specify_remote_server
- configure_bind_crypto_policy
- configure_crypto_policy
- configure_kerberos_crypto_policy
- configure_libreswan_crypto_policy
- configure_opensc_card_drivers
- configure_openssl_crypto_policy
- configure_ssh_crypto_policy
- dconf_db_up_to_date
- dconf_gnome_screensaver_idle_activation_enabled
- dconf_gnome_screensaver_idle_delay
- dconf_gnome_screensaver_lock_enabled
- dconf_gnome_screensaver_mode_blank
- display_login_attempts
- ensure_gpgcheck_globally_activated
- ensure_gpgcheck_never_disabled
- ensure_logrotate_activated
- ensure_redhat_gpgkey_installed
- file_groupowner_etc_group
- file_groupowner_etc_passwd
- file_groupowner_etc_shadow
- file_groupowner_grub2_cfg
- file_owner_etc_group
- file_owner_etc_passwd
- file_owner_etc_shadow
- file_owner_grub2_cfg
- file_ownership_var_log_audit
- file_permissions_etc_group
- file_permissions_etc_passwd
- file_permissions_etc_shadow
- file_permissions_var_log_audit
- force_opensc_card_drivers
- gid_passwd_group_same
- grub2_audit_argument
- install_hids
- no_empty_passwords
- package_aide_installed
- package_audispd-plugins_installed
- package_libreswan_installed
- package_opensc_installed
- package_pcsc-lite_installed
- rpm_verify_hashes
- rpm_verify_permissions
- rsyslog_files_groupownership
- rsyslog_files_ownership
- rsyslog_files_permissions
- security_patches_up_to_date
- service_auditd_enabled
- service_chronyd_or_ntpd_enabled
- service_pcscd_enabled
- set_password_hashing_algorithm_libuserconf
- set_password_hashing_algorithm_logindefs
- set_password_hashing_algorithm_systemauth
- sshd_set_idle_timeout
- sshd_set_keepalive
- sssd_enable_smartcards
- var_password_pam_unix_remember=4
- var_account_disable_post_pw_expiration=90
- var_accounts_passwords_pam_faillock_deny=6
- var_accounts_passwords_pam_faillock_unlock_time=1800
- sshd_idle_timeout_value=15_minutes
- var_password_pam_minlen=7
- var_password_pam_minclass=2
- var_accounts_maximum_age_login_defs=90
- var_auditd_num_logs=5
- var_multiple_time_servers=rhel
- var_smartcard_drivers=cac
title: PCI-DSS v3.2.1 Control Baseline for Red Hat Enterprise Linux 8
