description: 'Payment Card Industry - Data Security Standard (PCI-DSS) is a set of

    security standards designed to ensure the secure handling of payment card

    data, with the goal of preventing data breaches and protecting sensitive

    financial information.


    This profile ensures Red Hat Enterprise Linux 9 is configured in alignment

    with PCI-DSS v4.0 requirements.'
extends: null
hidden: ''
metadata:
    version: '4.0'
    SMEs:
    - marcusburghardt
    - mab879
    - vojtapolasek
reference: https://docs-prv.pcisecuritystandards.org/PCI%20DSS/Standard/PCI-DSS-v4_0.pdf
selections:
- audit_rules_dac_modification_fchown
- audit_rules_media_export
- audit_rules_usergroup_modification_shadow
- file_at_deny_not_exist
- package_libselinux_installed
- package_tftp_removed
- sshd_disable_empty_passwords
- file_owner_cron_allow
- dconf_gnome_screensaver_idle_delay
- audit_rules_dac_modification_fsetxattr
- accounts_password_pam_dcredit
- file_groupowner_cron_allow
- ensure_gpgcheck_never_disabled
- audit_rules_file_deletion_events_unlink
- file_owner_cron_hourly
- audit_rules_dac_modification_removexattr
- file_groupowner_backup_etc_shadow
- file_groupowner_cron_daily
- auditd_data_retention_space_left_action
- file_permissions_backup_etc_group
- file_permissions_at_allow
- file_groupowner_cron_monthly
- service_rsyncd_disabled
- file_permissions_sshd_pub_key
- directory_access_var_log_audit
- file_permissions_user_cfg
- service_rpcbind_disabled
- accounts_tmout
- file_owner_cron_weekly
- security_patches_up_to_date
- file_permissions_backup_etc_shadow
- selinux_confinement_of_daemons
- accounts_no_uid_except_zero
- file_permissions_backup_etc_passwd
- grub2_enable_selinux
- file_cron_deny_not_exist
- securetty_root_login_console_only
- dconf_gnome_screensaver_mode_blank
- file_permissions_var_log_audit
- chronyd_specify_remote_server
- file_groupowner_etc_passwd
- accounts_password_pam_lcredit
- file_groupowner_cron_hourly
- use_pam_wheel_group_for_su
- no_files_unowned_by_user
- set_ip6tables_default_rule
- audit_rules_usergroup_modification_opasswd
- file_groupowner_user_cfg
- file_owner_crontab
- dconf_gnome_disable_automount_open
- sshd_limit_user_access
- chronyd_run_as_chrony_user
- file_owner_cron_monthly
- rsyslog_files_groupownership
- audit_rules_usergroup_modification_gshadow
- aide_periodic_cron_checking
- audit_rules_networkconfig_modification
- audit_rules_file_deletion_events_unlinkat
- sshd_disable_root_login
- accounts_password_pam_pwhistory_remember_password_auth
- sysctl_net_ipv4_conf_all_send_redirects
- file_groupowner_etc_group
- ensure_root_password_configured
- selinux_policytype
- file_owner_etc_shadow
- audit_rules_login_events_tallylog
- file_permissions_cron_allow
- account_unique_name
- sshd_do_not_permit_user_env
- file_owner_cron_daily
- gid_passwd_group_same
- file_groupowner_backup_etc_group
- dconf_db_up_to_date
- kernel_module_usb-storage_disabled
- accounts_passwords_pam_faillock_unlock_time
- package_ftp_removed
- accounts_maximum_age_login_defs
- audit_rules_time_stime
- dconf_gnome_screensaver_lock_enabled
- accounts_password_pam_unix_remember
- sysctl_net_ipv4_ip_forward
- ensure_pam_wheel_group_empty
- wireless_disable_interfaces
- audit_rules_file_deletion_events_rmdir
- audit_rules_time_settimeofday
- file_group_ownership_var_log_audit
- audit_rules_usergroup_modification_passwd
- accounts_password_set_warn_age_existing
- auditd_data_retention_admin_space_left_action
- audit_rules_sysadmin_actions
- service_firewalld_enabled
- network_sniffer_disabled
- sudo_require_reauthentication
- file_groupowner_etc_shadow
- set_password_hashing_algorithm_libuserconf
- accounts_passwords_pam_faillock_deny
- file_owner_etc_passwd
- auditd_name_format
- accounts_password_set_max_life_existing
- accounts_set_post_pw_existing
- file_groupowner_crontab
- audit_sudo_log_events
- package_nftables_installed
- set_password_hashing_algorithm_systemauth
- sshd_disable_tcp_forwarding
- display_login_attempts
- file_owner_etc_group
- enable_authselect
- group_unique_id
- disable_users_coredumps
- firewalld_loopback_traffic_trusted
- sudo_custom_logfile
- audit_rules_usergroup_modification_group
- file_owner_backup_etc_passwd
- package_audispd-plugins_installed
- sysctl_net_ipv4_conf_default_send_redirects
- firewalld_loopback_traffic_restricted
- sysctl_net_ipv4_conf_all_secure_redirects
- audit_rules_dac_modification_lsetxattr
- no_empty_passwords_etc_shadow
- audit_rules_mac_modification
- dconf_gnome_disable_automount
- sshd_set_login_grace_time
- audit_rules_dac_modification_chown
- grub2_audit_backlog_limit_argument
- file_owner_backup_etc_group
- sysctl_net_ipv6_conf_default_accept_source_route
- accounts_password_pam_minlen
- auditd_data_retention_space_left
- package_sudo_installed
- sshd_set_maxstartups
- audit_rules_login_events_lastlog
- grub2_audit_argument
- sysctl_kernel_randomize_va_space
- file_permissions_cron_weekly
- file_owner_etc_issue_net
- no_direct_root_logins
- sysctl_kernel_core_pattern
- kernel_module_sctp_disabled
- package_firewalld_installed
- file_permissions_etc_group
- audit_rules_file_deletion_events_renameat
- sshd_set_max_sessions
- accounts_password_all_shadowed
- file_permissions_sshd_config
- sshd_set_loglevel_verbose
- audit_rules_time_adjtimex
- package_logrotate_installed
- file_owner_user_cfg
- package_telnet-server_removed
- package_cryptsetup-luks_installed
- sudo_add_use_pty
- dconf_gnome_screensaver_idle_activation_enabled
- package_net-snmp_removed
- file_ownership_var_log_audit
- service_avahi-daemon_disabled
- sysctl_net_ipv4_conf_all_rp_filter
- audit_rules_dac_modification_fremovexattr
- file_permissions_etc_passwd
- rpm_verify_hashes
- aide_build_database
- file_groupowner_cron_d
- audit_rules_immutable
- sysctl_net_ipv4_icmp_ignore_bogus_error_responses
- ensure_redhat_gpgkey_installed
- rpm_verify_ownership
- service_nftables_disabled
- no_shelllogin_for_systemaccounts
- dconf_gnome_screensaver_lock_delay
- accounts_root_gid_zero
- coredump_disable_backtraces
- sysctl_net_ipv4_conf_default_accept_redirects
- configure_ssh_crypto_policy
- audit_rules_dac_modification_fchmod
- file_groupowner_cron_weekly
- sshd_set_max_auth_tries
- account_unique_id
- file_owner_backup_etc_shadow
- file_permissions_sshd_private_key
- set_password_hashing_algorithm_logindefs
- file_owner_cron_d
- service_auditd_enabled
- sshd_enable_pam
- sysctl_net_ipv4_tcp_syncookies
- package_dhcp_removed
- audit_rules_session_events
- coredump_disable_storage
- no_empty_passwords
- package_audit_installed
- accounts_password_last_change_is_in_past
- timer_logrotate_enabled
- accounts_password_pam_pwhistory_remember_system_auth
- file_permissions_cron_monthly
- package_chrony_installed
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- audit_rules_dac_modification_lremovexattr
- audit_rules_dac_modification_lchown
- audit_rules_dac_modification_chmod
- dconf_gnome_session_idle_user_locks
- auditd_audispd_syslog_plugin_activated
- gnome_gdm_disable_automatic_login
- rsyslog_files_ownership
- accounts_password_warn_age_login_defs
- sshd_disable_rhosts
- package_tftp-server_removed
- kernel_module_dccp_disabled
- disable_host_auth
- account_disable_post_pw_expiration
- no_password_auth_for_systemaccounts
- file_groupowner_at_allow
- file_groupowner_backup_etc_passwd
- file_permissions_unauthorized_world_writable
- configure_firewalld_ports
- audit_rules_dac_modification_fchownat
- file_groupowner_etc_issue_net
- audit_rules_file_deletion_events_rename
- sysctl_fs_suid_dumpable
- audit_rules_dac_modification_fchmodat
- sshd_disable_x11_forwarding
- bios_enable_execution_restrictions
- configure_crypto_policy
- file_permissions_grub2_cfg
- sshd_set_idle_timeout
- ensure_gpgcheck_globally_activated
- file_permissions_cron_hourly
- selinux_state
- file_permissions_crontab
- file_permissions_ungroupowned
- rsyslog_files_permissions
- sudo_require_authentication
- postfix_network_listening_disabled
- audit_rules_login_events_faillock
- dir_perms_world_writable_sticky_bits
- file_owner_grub2_cfg
- audit_rules_time_clock_settime
- file_permissions_cron_d
- audit_rules_dac_modification_setxattr
- audit_rules_suid_privilege_function
- package_aide_installed
- file_permissions_etc_issue_net
- file_permissions_cron_daily
- sshd_set_keepalive
- file_permissions_etc_shadow
- package_telnet_removed
- set_firewalld_default_zone
- file_groupowner_grub2_cfg
- network_nmcli_permissions
- audit_rules_time_watch_localtime
- var_multiple_time_servers=generic
- var_auditd_admin_space_left_action=single
- var_auditd_space_left=100MB
- var_auditd_space_left_action=email
- var_auditd_name_format=fqd
- var_accounts_maximum_age_login_defs=90
- var_accounts_password_warn_age_login_defs=7
- var_password_pam_unix_remember=4
- var_password_pam_remember=4
- var_password_pam_remember_control_flag=requisite_or_required
- var_password_pam_dcredit=1
- var_password_pam_lcredit=1
- var_password_pam_minlen=12
- var_accounts_passwords_pam_faillock_deny=10
- var_accounts_passwords_pam_faillock_unlock_time=1800
- var_password_pam_tally2=10
- var_accounts_passwords_pam_tally2_unlock_time=1800
- var_password_hashing_algorithm=SHA512
- inactivity_timeout_value=15_minutes
- var_screensaver_lock_delay=10_seconds
- sshd_idle_timeout_value=15_minutes
- var_sshd_set_keepalive=1
- var_account_disable_post_pw_expiration=90
- var_system_crypto_policy=default_policy
- var_sshd_set_login_grace_time=60
- var_postfix_inet_interfaces=loopback-only
- var_selinux_policy_name=targeted
- var_selinux_state=enforcing
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies:
- pcidss_4
title: PCI-DSS v4.0 Control Baseline for Red Hat Enterprise Linux 9
documentation_complete: true
