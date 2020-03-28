documentation_complete: true

title: 'Standard System Security Profile for SUSE Linux Enterprise 15'

description: |-
    This profile contains rules to ensure standard security baseline
    of a SUSE Linux Enterprise 15 system based off of the SUSE
    Hardening Guide. Regardless of your system's workload all of
    these checks should pass.

selections:
    - partition_for_tmp
    - partition_for_var
    - partition_for_var_log
    - partition_for_var_log_audit
    - partition_for_home
    - package_audit_installed
    - package_cron_installed
    - package_ntp_installed
    - package_rsyslog_installed
    - package_telnetd_removed
    - package_inetutils-telnetd_removed
    - package_telnetd-ssl_removed
    - package_nis_removed
    - package_ntpdate_removed
    - service_auditd_enabled
    - service_cron_enabled
    - service_ntp_enabled
    - service_rsyslog_enabled
    - file_owner_logfiles_value=adm
    - rsyslog_files_ownership
    - file_groupowner_logfiles_value=adm
    - rsyslog_files_groupownership
    - rsyslog_files_permissions
    - ensure_logrotate_activated
    - file_permissions_systemmap
    - file_permissions_etc_shadow
    - file_owner_etc_shadow
    - file_groupowner_etc_shadow
    - file_permissions_etc_gshadow
    - file_owner_etc_gshadow
    - file_groupowner_etc_gshadow
    - file_permissions_etc_passwd
    - file_owner_etc_passwd
    - file_groupowner_etc_passwd
    - file_permissions_etc_group
    - file_owner_etc_group
    - file_groupowner_etc_group
    - sysctl_fs_protected_symlinks
    - sysctl_fs_protected_hardlinks
    - sysctl_fs_suid_dumpable
    - sysctl_kernel_randomize_va_space
    - sysctl_net_ipv4_conf_all_accept_redirects
    - sysctl_net_ipv4_conf_all_accept_source_route
    - sysctl_net_ipv4_conf_all_log_martians
    - sysctl_net_ipv4_conf_all_rp_filter
    - sysctl_net_ipv4_conf_all_secure_redirects
    - sysctl_net_ipv4_conf_default_accept_redirects
    - sysctl_net_ipv4_conf_default_accept_source_route
    - sysctl_net_ipv4_conf_default_log_martians
    - sysctl_net_ipv4_conf_default_rp_filter
    - sysctl_net_ipv4_conf_default_secure_redirects
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts
    - sysctl_net_ipv4_icmp_ignore_bogus_error_responses
    - sysctl_net_ipv4_tcp_invalid_ratelimit
    - sysctl_net_ipv4_tcp_syncookies
    - sysctl_net_ipv4_conf_all_send_redirects
    - sysctl_net_ipv4_conf_default_send_redirects
    - sysctl_net_ipv4_ip_forward
    - sysctl_fs_protected_symlinks
    - sysctl_fs_protected_hardlinks
    - sysctl_kernel_dmesg_restrict
    - accounts_have_homedir_login_defs
    - accounts_logon_fail_delay
    - accounts_max_concurrent_login_sessions
    - accounts_tmout
    - display_login_attempts
    - inactivity_timeout_value=15_minutes
    - var_password_pam_minlen=8
    - accounts_password_pam_minlen
    - accounts_password_minlen_login_defs
    - var_password_pam_ocredit=1
    - accounts_password_pam_ocredit
    - var_password_pam_dcredit=1
    - accounts_password_pam_dcredit
    - var_password_pam_ucredit=1
    - accounts_password_pam_ucredit
    - var_password_pam_lcredit=1
    - accounts_password_pam_lcredit
    - var_accounts_fail_delay=4
    - var_accounts_passwords_pam_faillock_deny=3
    - var_accounts_passwords_pam_faillock_fail_interval=900
    - var_accounts_passwords_pam_faillock_unlock_time=never
    - var_password_pam_retry=3
    - accounts_logon_fail_delay
    - accounts_password_pam_retry
    - accounts_passwords_pam_faillock_deny_root
    - accounts_passwords_pam_faillock_deny
    - accounts_passwords_pam_faillock_interval
    - accounts_passwords_pam_faillock_unlock_time
    - service_httpd_disabled
    - package_httpd_removed
    - package_firewalld_installed
    - package_openssh_installed
    - service_sshd_enabled
    - sshd_enable_x11_forwarding
    - sshd_allow_only_protocol2
    - sshd_idle_timeout_value=5_minutes
    - sshd_set_idle_timeout
    - sshd_disable_root_login
    - sshd_disable_empty_passwords
    - sshd_set_keepalive
    - audit_rules_time_adjtimex
    - audit_rules_time_settimeofday
    - audit_rules_time_stime
    - audit_rules_time_clock_settime
    - audit_rules_time_watch_localtime
    - audit_rules_usergroup_modification
    - audit_rules_networkconfig_modification
    - audit_rules_mac_modification
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
    - audit_rules_unsuccessful_file_modification
    - audit_rules_privileged_commands
    - audit_rules_media_export
    - audit_rules_file_deletion_events
    - audit_rules_sysadmin_actions
    - audit_rules_kernel_module_loading_finit
    - audit_rules_kernel_module_loading_init
    - audit_rules_successful_file_modification_chmod
