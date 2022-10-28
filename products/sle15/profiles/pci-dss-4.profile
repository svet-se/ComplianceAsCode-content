documentation_complete: true

metadata:
    SMEs:
        - abergmann

reference: https://docs-prv.pcisecuritystandards.org/PCI%20DSS/Standard/PCI-DSS-v4_0.pdf

title: 'PCI-DSS v4 Control Baseline for SUSE Linux enterprise 15'

description: |-
    Ensures PCI-DSS v4 security configuration settings are applied.

selections:
    -  pcidss_3:all:base
    -  account_unique_id
    -  accounts_minimum_age_login_defs
    -  accounts_no_uid_except_zero
    -  accounts_password_warn_age_login_defs
    -  accounts_tmout
    -  accounts_umask_etc_bashrc
    -  accounts_umask_etc_login_defs
    -  accounts_umask_etc_profile
    -  coredump_disable_backtraces
    -  coredump_disable_storage
    -  cracklib_accounts_password_pam_dcredit
    -  cracklib_accounts_password_pam_lcredit
    -  cracklib_accounts_password_pam_minlen
    -  cracklib_accounts_password_pam_ocredit
    -  cracklib_accounts_password_pam_retry
    -  cracklib_accounts_password_pam_ucredit
    -  disable_host_auth
    -  disable_users_coredumps
    -  file_at_deny_not_exist
    -  file_cron_deny_not_exist
    -  file_groupowner_at_allow
    -  file_groupowner_backup_etc_passwd
    -  file_groupowner_backup_etc_shadow
    -  file_groupowner_cron_allow
    -  file_owner_at_allow
    -  file_owner_backup_etc_passwd
    -  file_owner_backup_etc_shadow
    -  file_owner_cron_allow
    -  file_permissions_at_allow
    -  file_permissions_backup_etc_passwd
    -  file_permissions_backup_etc_shadow
    -  file_permissions_cron_allow
    -  file_permissions_cron_d
    -  file_permissions_cron_daily
    -  file_permissions_cron_hourly
    -  file_permissions_cron_monthly
    -  file_permissions_cron_weekly
    -  file_permissions_crontab
    -  file_permissions_etc_group
    -  file_permissions_etc_shadow
    -  file_permissions_sshd_config
    -  file_permissions_sshd_private_key
    -  file_permissions_sshd_pub_key
    -  file_permissions_unauthorized_world_writable
    -  file_permissions_ungroupowned
    -  group_unique_id
    -  group_unique_name
    -  no_direct_root_logins
    -  no_files_unowned_by_user
    -  package_audit_installed
    -  package_bind_removed
    -  package_chrony_installed
    -  package_dhcp_removed
    -  package_httpd_removed
    -  package_net-snmp_removed
    -  package_nfs-utils_removed
    -  package_openldap-servers_removed
    -  package_openldapclients_removed
    -  package_rsh_removed
    -  package_samba_removed
    -  package_sudo_installed
    -  package_talk_removed
    -  package_telnet_removed
    -  package_telnetserver_removed
    -  package_vsftpd_removed
    -  package_xinetd_removed
    -  package_ypbind_removed
    -  package_ypserv_removed
    -  postfix_network_listening_disabled
    -  securetty_root_login_console_only
    -  service_avahi-daemon_disabled
    -  service_cron_enabled
    -  service_cups_disabled
    -  service_rpcbind_disabled
    -  service_rsyncd_disabled
    -  sshd_disable_empty_passwords
    -  sshd_disable_rhosts
    -  sshd_disable_root_login
    -  sshd_disable_tcp_forwarding
    -  sshd_disable_x11_forwarding
    -  sshd_do_not_permit_user_env
    -  sshd_enable_pam
    -  sshd_enable_warning_banner
    -  sshd_set_loglevel_verbose
    -  sshd_set_max_auth_tries
    -  sshd_set_max_sessions
    -  sshd_set_maxstartups
    -  sshd_use_approved_ciphers
    -  sshd_use_approved_macs
    -  sudo_add_use_pty
    -  sudo_custom_logfile
    -  sysctl_fs_suid_dumpable
