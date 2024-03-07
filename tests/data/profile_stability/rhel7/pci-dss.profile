description: 'Payment Card Industry - Data Security Standard (PCI-DSS) is a set of

    security standards designed to ensure the secure handling of payment card

    data, with the goal of preventing data breaches and protecting sensitive

    financial information.


    This profile ensures Red Hat Enterprise Linux 7 is configured in alignment

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
- accounts_password_set_max_life_existing
- audit_rules_file_deletion_events_rename
- audit_rules_file_deletion_events_unlink
- no_files_unowned_by_user
- dconf_gnome_screensaver_idle_delay
- file_owner_cron_d
- audit_rules_dac_modification_lchown
- file_permissions_cron_hourly
- accounts_root_gid_zero
- audit_rules_usergroup_modification_passwd
- audit_rules_dac_modification_chmod
- rpm_verify_ownership
- accounts_tmout
- file_groupowner_cron_allow
- file_owner_backup_etc_shadow
- nftables_ensure_default_deny_policy
- file_groupowner_crontab
- dconf_db_up_to_date
- sysctl_net_ipv4_conf_all_secure_redirects
- accounts_no_uid_except_zero
- file_groupowner_cron_d
- kernel_module_usb-storage_disabled
- file_groupowner_backup_etc_group
- audit_rules_dac_modification_removexattr
- file_groupowner_backup_etc_shadow
- package_telnet-server_removed
- package_rsh_removed
- service_auditd_enabled
- sshd_set_max_sessions
- sshd_use_strong_kex
- security_patches_up_to_date
- sysctl_net_ipv4_conf_default_accept_redirects
- file_groupowner_cron_monthly
- file_owner_grub2_cfg
- audit_rules_dac_modification_fchmod
- ensure_root_password_configured
- sshd_disable_rhosts
- sudo_custom_logfile
- no_empty_passwords
- package_tftp_removed
- file_owner_etc_shadow
- accounts_passwords_pam_faillock_unlock_time
- accounts_passwords_pam_faillock_deny
- rsyslog_files_ownership
- account_disable_post_pw_expiration
- sysctl_net_ipv6_conf_default_accept_source_route
- audit_rules_dac_modification_fremovexattr
- sysctl_net_ipv4_icmp_ignore_bogus_error_responses
- wireless_disable_interfaces
- coredump_disable_backtraces
- service_chronyd_or_ntpd_enabled
- dconf_gnome_disable_automount_open
- chronyd_specify_remote_server
- dconf_gnome_screensaver_idle_activation_enabled
- file_groupowner_etc_group
- no_direct_root_logins
- sshd_set_idle_timeout
- accounts_password_all_shadowed
- audit_rules_dac_modification_setxattr
- auditd_data_retention_admin_space_left_action
- file_permissions_etc_passwd
- file_permissions_grub2_cfg
- package_cryptsetup-luks_installed
- rsyslog_files_permissions
- gid_passwd_group_same
- file_owner_cron_weekly
- chronyd_run_as_chrony_user
- file_permissions_backup_etc_shadow
- coredump_disable_storage
- audit_rules_sysadmin_actions
- grub2_audit_argument
- account_unique_id
- package_firewalld_installed
- file_groupowner_etc_issue_net
- file_permissions_user_cfg
- auditd_audispd_syslog_plugin_activated
- sudo_add_use_pty
- ensure_gpgcheck_never_disabled
- use_pam_wheel_group_for_su
- bios_enable_execution_restrictions
- audit_rules_session_events
- audit_rules_media_export
- no_password_auth_for_systemaccounts
- auditd_data_retention_space_left
- audit_rules_login_events_faillock
- rpm_verify_hashes
- accounts_set_post_pw_existing
- service_nftables_disabled
- accounts_password_set_warn_age_existing
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- audit_rules_mac_modification
- ntpd_specify_multiple_servers
- audit_rules_time_settimeofday
- sshd_use_approved_macs
- sysctl_fs_suid_dumpable
- sysctl_net_ipv4_ip_forward
- audit_rules_dac_modification_lsetxattr
- accounts_password_pam_dcredit
- accounts_password_pam_unix_remember
- file_permissions_sshd_config
- no_empty_passwords_etc_shadow
- audit_rules_file_deletion_events_unlinkat
- file_permissions_backup_etc_group
- file_groupowner_user_cfg
- sshd_use_approved_ciphers
- audit_rules_immutable
- audit_rules_file_deletion_events_renameat
- file_group_ownership_var_log_audit
- package_aide_installed
- file_permissions_etc_group
- ensure_shadow_group_empty
- accounts_password_pam_minlen
- configure_firewalld_ports
- file_groupowner_etc_passwd
- audit_rules_usergroup_modification_gshadow
- audit_rules_suid_privilege_function
- group_unique_id
- sshd_do_not_permit_user_env
- file_permissions_cron_weekly
- dconf_gnome_disable_automount
- audit_rules_time_clock_settime
- file_permissions_cron_d
- selinux_confinement_of_daemons
- ensure_pam_wheel_group_empty
- ensure_gpgcheck_globally_activated
- file_permissions_backup_etc_passwd
- no_shelllogin_for_systemaccounts
- sshd_disable_empty_passwords
- file_owner_etc_issue_net
- sshd_disable_x11_forwarding
- audit_rules_usergroup_modification_group
- audit_rules_dac_modification_fchownat
- auditd_data_retention_space_left_action
- group_unique_name
- dir_perms_world_writable_sticky_bits
- package_ypserv_removed
- set_ip6tables_default_rule
- sshd_set_login_grace_time
- file_owner_etc_passwd
- accounts_password_warn_age_login_defs
- network_nmcli_permissions
- package_sudo_installed
- file_groupowner_cron_weekly
- selinux_state
- file_permissions_var_log_audit
- file_owner_user_cfg
- file_groupowner_cron_daily
- sysctl_net_ipv4_tcp_syncookies
- file_owner_crontab
- package_talk_removed
- package_chrony_installed
- audit_rules_login_events_lastlog
- audit_rules_time_watch_localtime
- dconf_gnome_screensaver_mode_blank
- file_owner_cron_hourly
- package_libselinux_installed
- file_groupowner_backup_etc_passwd
- sshd_set_loglevel_verbose
- audit_rules_dac_modification_fchown
- file_permissions_etc_shadow
- kernel_module_dccp_disabled
- package_ftp_removed
- package_telnet_removed
- service_avahi-daemon_disabled
- package_audispd-plugins_installed
- file_permissions_cron_monthly
- file_permissions_cron_allow
- sudo_require_authentication
- audit_rules_dac_modification_fchmodat
- securetty_root_login_console_only
- audit_rules_dac_modification_fsetxattr
- set_password_hashing_algorithm_libuserconf
- service_rsyncd_disabled
- set_firewalld_default_zone
- audit_rules_networkconfig_modification
- file_permissions_sshd_private_key
- rsyslog_files_groupownership
- service_rpcbind_disabled
- sysctl_kernel_randomize_va_space
- package_tftp-server_removed
- file_owner_backup_etc_group
- file_ownership_var_log_audit
- file_permissions_ungroupowned
- audit_rules_time_adjtimex
- sysctl_net_ipv4_conf_all_send_redirects
- accounts_password_pam_lcredit
- audit_rules_login_events_tallylog
- install_PAE_kernel_on_x86-32
- file_permissions_unauthorized_world_writable
- ensure_redhat_gpgkey_installed
- auditd_name_format
- grub2_enable_selinux
- accounts_maximum_age_login_defs
- kernel_module_sctp_disabled
- file_permissions_cron_daily
- set_password_hashing_algorithm_logindefs
- sudo_require_reauthentication
- directory_access_var_log_audit
- dconf_gnome_session_idle_user_locks
- ntpd_specify_remote_server
- aide_periodic_cron_checking
- gnome_gdm_disable_guest_login
- dconf_gnome_screensaver_lock_delay
- grub2_audit_backlog_limit_argument
- sysctl_net_ipv4_conf_default_send_redirects
- sshd_enable_pam
- sshd_disable_tcp_forwarding
- dconf_gnome_screensaver_lock_enabled
- package_nftables_installed
- disable_users_coredumps
- audit_rules_usergroup_modification_shadow
- file_permissions_sshd_pub_key
- accounts_password_pam_pwhistory_remember_password_auth
- display_login_attempts
- file_cron_deny_not_exist
- file_groupowner_grub2_cfg
- package_xinetd_removed
- audit_rules_time_stime
- selinux_policytype
- sysctl_net_ipv4_conf_all_rp_filter
- package_ypbind_removed
- package_audit_installed
- service_ntpd_enabled
- file_owner_cron_allow
- sshd_disable_root_login
- account_unique_name
- package_talk-server_removed
- audit_rules_dac_modification_lremovexattr
- audit_rules_file_deletion_events_rmdir
- file_owner_cron_monthly
- package_dhcp_removed
- sshd_set_keepalive
- file_groupowner_etc_shadow
- accounts_password_last_change_is_in_past
- file_permissions_etc_issue_net
- file_at_deny_not_exist
- aide_build_database
- set_password_hashing_algorithm_systemauth
- file_permissions_crontab
- disable_host_auth
- file_owner_cron_daily
- package_logrotate_installed
- postfix_network_listening_disabled
- gnome_gdm_disable_automatic_login
- file_owner_etc_group
- package_rsh-server_removed
- file_owner_backup_etc_passwd
- service_firewalld_enabled
- audit_rules_dac_modification_chown
- accounts_password_pam_pwhistory_remember_system_auth
- package_net-snmp_removed
- sshd_limit_user_access
- audit_sudo_log_events
- network_sniffer_disabled
- sshd_set_max_auth_tries
- sshd_set_maxstartups
- file_groupowner_cron_hourly
- audit_rules_usergroup_modification_opasswd
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
- var_sshd_set_keepalive=0
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
title: PCI-DSS v4.0 Control Baseline for Red Hat Enterprise Linux 7
documentation_complete: true
