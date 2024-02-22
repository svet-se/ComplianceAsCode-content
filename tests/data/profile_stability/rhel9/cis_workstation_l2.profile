description: "This profile defines a baseline that aligns to the \"Level 2 - Workstation\"\nconfiguration
    from the Center for Internet Security\xAE Red Hat Enterprise\nLinux 9 Benchmark\u2122,
    v1.0.0, released 2022-11-28.\n\nThis profile includes Center for Internet Security\xAE\nRed
    Hat Enterprise Linux 9 CIS Benchmarks\u2122 content."
extends: null
hidden: ''
metadata:
    version: 1.0.0
    SMEs:
    - marcusburghardt
    - vojtapolasek
    - yuumasato
reference: https://www.cisecurity.org/benchmark/red_hat_linux/
selections:
- sysctl_net_ipv4_conf_all_accept_redirects
- auditd_data_retention_max_log_file
- audit_rules_session_events
- sysctl_net_ipv6_conf_all_accept_redirects
- audit_rules_login_events_lastlog
- file_owner_cron_daily
- ensure_root_password_configured
- file_owner_backup_etc_shadow
- audit_rules_dac_modification_lsetxattr
- audit_rules_networkconfig_modification
- sysctl_net_ipv4_conf_default_log_martians
- audit_rules_unsuccessful_file_modification_truncate
- auditd_data_retention_space_left_action
- audit_sudo_log_events
- grub2_audit_backlog_limit_argument
- audit_rules_file_deletion_events_unlinkat
- file_permissions_home_directories
- file_permissions_crontab
- audit_rules_kernel_module_loading_finit
- sudo_require_reauthentication
- file_cron_deny_not_exist
- accounts_no_uid_except_zero
- disable_host_auth
- package_tftp-server_removed
- file_groupowner_backup_etc_gshadow
- account_unique_id
- file_groupowner_etc_motd
- grub2_password
- accounts_maximum_age_login_defs
- file_owner_etc_group
- audit_rules_execution_setfacl
- service_crond_enabled
- file_permissions_backup_etc_gshadow
- file_owner_crontab
- sysctl_net_ipv4_tcp_syncookies
- file_owner_etc_issue_net
- sshd_set_keepalive
- set_firewalld_default_zone
- accounts_umask_etc_bashrc
- mount_option_var_log_audit_nodev
- service_auditd_enabled
- file_permissions_grub2_cfg
- audit_rules_kernel_module_loading_delete
- dconf_gnome_screensaver_user_locks
- no_empty_passwords
- audit_rules_time_adjtimex
- accounts_password_pam_minlen
- audit_rules_dac_modification_fchmodat
- grub2_audit_argument
- sysctl_net_ipv4_conf_all_secure_redirects
- file_groupowner_sshd_config
- audit_rules_time_clock_settime
- dir_perms_world_writable_sticky_bits
- mount_option_var_log_audit_nosuid
- kernel_module_squashfs_disabled
- accounts_user_dot_no_world_writable_programs
- sshd_set_max_auth_tries
- package_telnet-server_removed
- audit_rules_time_settimeofday
- file_groupownership_home_directories
- sysctl_net_ipv6_conf_default_accept_source_route
- audit_rules_dac_modification_fsetxattr
- package_cyrus-imapd_removed
- file_permissions_sshd_config
- no_netrc_files
- audit_rules_immutable
- mount_option_dev_shm_nodev
- file_permissions_cron_monthly
- dconf_gnome_login_banner_text
- chronyd_specify_remote_server
- sysctl_net_ipv4_conf_default_send_redirects
- file_permissions_backup_etc_group
- audit_rules_dac_modification_fchownat
- kernel_module_usb-storage_disabled
- mount_option_tmp_nodev
- audit_rules_usergroup_modification_gshadow
- gid_passwd_group_same
- sysctl_net_ipv6_conf_default_accept_redirects
- set_password_hashing_algorithm_passwordauth
- dconf_gnome_session_idle_user_locks
- sudo_require_authentication
- accounts_password_set_min_life_existing
- kernel_module_tipc_disabled
- dconf_gnome_banner_enabled
- sysctl_net_ipv4_conf_default_secure_redirects
- file_groupowner_cron_d
- audit_rules_usergroup_modification_opasswd
- audit_rules_mac_modification_usr_share
- accounts_passwords_pam_faillock_unlock_time
- file_owner_grub2_cfg
- audit_rules_kernel_module_loading_query
- no_shelllogin_for_systemaccounts
- file_owner_cron_allow
- dconf_gnome_screensaver_idle_delay
- directory_permissions_var_log_audit
- package_samba_removed
- sshd_set_loglevel_verbose
- audit_rules_time_stime
- accounts_user_interactive_home_directory_exists
- accounts_tmout
- file_groupowner_backup_etc_shadow
- file_owner_etc_passwd
- mount_option_var_tmp_nodev
- partition_for_home
- audit_rules_file_deletion_events_rename
- package_rsync_removed
- accounts_password_pam_retry
- chronyd_run_as_chrony_user
- file_permissions_cron_weekly
- file_permissions_etc_group
- file_permissions_ungroupowned
- aide_build_database
- accounts_password_all_shadowed
- set_nftables_table
- file_permissions_etc_motd
- set_password_hashing_algorithm_logindefs
- mount_option_tmp_nosuid
- service_firewalld_enabled
- rsyslog_nolisten
- accounts_password_pam_pwhistory_remember_password_auth
- package_net-snmp_removed
- coredump_disable_backtraces
- partition_for_dev_shm
- auditd_data_retention_admin_space_left_action
- configure_ssh_crypto_policy
- ensure_pam_wheel_group_empty
- package_vsftpd_removed
- auditd_data_retention_max_log_file_action
- sshd_disable_x11_forwarding
- sshd_enable_pam
- audit_rules_kernel_module_loading_init
- audit_rules_time_watch_localtime
- package_dnsmasq_removed
- sshd_enable_warning_banner_net
- file_permissions_sshd_pub_key
- file_permissions_cron_allow
- file_owner_etc_motd
- rsyslog_filecreatemode
- file_owner_cron_d
- audit_rules_unsuccessful_file_modification_open
- accounts_umask_etc_login_defs
- mount_option_home_nodev
- mount_option_dev_shm_noexec
- audit_rules_usergroup_modification_group
- audit_rules_dac_modification_removexattr
- audit_rules_dac_modification_setxattr
- journald_forward_to_syslog
- audit_rules_execution_chcon
- audit_rules_dac_modification_lremovexattr
- package_ftp_removed
- accounts_password_last_change_is_in_past
- sysctl_net_ipv4_conf_default_rp_filter
- sysctl_net_ipv4_conf_all_log_martians
- file_groupowner_etc_group
- package_libselinux_installed
- file_owner_cron_weekly
- mount_option_var_nosuid
- file_owner_etc_shadow
- account_unique_name
- sshd_set_idle_timeout
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- audit_rules_dac_modification_chown
- has_nonlocal_mta
- accounts_password_warn_age_login_defs
- mount_option_var_log_nosuid
- file_groupowner_etc_shadow
- file_permissions_cron_hourly
- coredump_disable_storage
- auditd_data_retention_action_mail_acct
- file_groupowner_etc_gshadow
- audit_rules_unsuccessful_file_modification_ftruncate
- no_rsh_trust_files
- rsyslog_files_permissions
- account_password_pam_faillock_system_auth
- mount_option_var_tmp_noexec
- mount_option_var_nodev
- audit_rules_privileged_commands_kmod
- audit_rules_sysadmin_actions
- file_groupowner_etc_issue
- file_owner_backup_etc_group
- file_permissions_cron_daily
- file_groupowner_backup_etc_passwd
- set_password_hashing_algorithm_systemauth
- sshd_set_max_sessions
- journald_compress
- package_sudo_installed
- file_owner_backup_etc_passwd
- audit_rules_login_events_faillock
- file_groupowner_etc_passwd
- package_firewalld_installed
- file_permissions_unauthorized_world_writable
- sysctl_net_ipv4_conf_all_accept_source_route
- audit_rules_dac_modification_fchown
- file_at_deny_not_exist
- mount_option_home_nosuid
- file_permissions_var_log_audit
- mount_option_dev_shm_nosuid
- file_owner_user_cfg
- sysctl_net_ipv6_conf_all_forwarding
- audit_rules_mac_modification
- file_permissions_cron_d
- dconf_db_up_to_date
- sysctl_net_ipv4_ip_forward
- audit_rules_usergroup_modification_passwd
- accounts_password_pam_minclass
- service_rsyslog_enabled
- sshd_set_maxstartups
- file_groupowner_cron_allow
- sudo_add_use_pty
- sysctl_net_ipv6_conf_all_accept_ra
- package_httpd_removed
- audit_rules_dac_modification_lchown
- audit_rules_kernel_module_loading_create
- group_unique_id
- file_cron_allow_exists
- file_groupowner_user_cfg
- dconf_gnome_disable_automount
- package_bind_removed
- file_groupowner_cron_weekly
- socket_systemd-journal-remote_disabled
- enable_authselect
- kernel_module_udf_disabled
- file_groupowner_etc_issue_net
- sysctl_net_ipv6_conf_default_accept_ra
- sysctl_net_ipv4_conf_all_send_redirects
- account_password_pam_faillock_password_auth
- banner_etc_motd
- file_permissions_backup_etc_shadow
- journald_storage
- sudo_custom_logfile
- audit_rules_dac_modification_fchmod
- account_disable_post_pw_expiration
- aide_check_audit_tools
- file_ownership_audit_configuration
- selinux_state
- service_nfs_disabled
- partition_for_var_tmp
- grub2_enable_selinux
- service_nftables_disabled
- use_pam_wheel_group_for_su
- file_permissions_audit_configuration
- package_nginx_removed
- accounts_password_pam_pwhistory_remember_system_auth
- file_permissions_etc_issue_net
- file_ownership_sshd_pub_key
- file_ownership_audit_binaries
- sysctl_net_ipv4_conf_all_rp_filter
- sysctl_net_ipv4_conf_default_accept_redirects
- file_permissions_backup_etc_passwd
- file_ownership_var_log_audit_stig
- package_tftp_removed
- file_groupownership_audit_binaries
- no_empty_passwords_etc_shadow
- package_dhcp_removed
- file_groupowner_at_allow
- package_aide_installed
- mount_option_tmp_noexec
- sshd_disable_rhosts
- file_permissions_audit_binaries
- service_rpcbind_disabled
- accounts_umask_etc_profile
- file_owner_etc_issue
- sysctl_net_ipv4_icmp_ignore_bogus_error_responses
- accounts_root_path_dirs_no_write
- package_squid_removed
- file_groupowner_cron_daily
- package_openldap-clients_removed
- partition_for_var_log
- audit_rules_suid_auid_privilege_function
- file_groupowner_cron_monthly
- ensure_gpgcheck_globally_activated
- configure_crypto_policy
- aide_periodic_cron_checking
- file_permissions_etc_passwd
- file_groupownership_sshd_private_key
- package_dovecot_removed
- firewalld_loopback_traffic_restricted
- mount_option_var_log_nodev
- mount_option_var_log_audit_noexec
- sshd_set_login_grace_time
- file_owner_cron_hourly
- dconf_gnome_disable_automount_open
- selinux_not_disabled
- service_systemd-journald_enabled
- package_nftables_installed
- mount_option_var_log_noexec
- partition_for_var
- package_mcstrans_removed
- sshd_limit_user_access
- root_path_no_dot
- file_permissions_at_allow
- file_permissions_etc_shadow
- mount_option_var_tmp_nosuid
- package_telnet_removed
- file_groupowner_crontab
- selinux_confinement_of_daemons
- dconf_gnome_disable_autorun
- accounts_password_set_max_life_existing
- package_audit_installed
- sshd_disable_empty_passwords
- audit_rules_execution_chacl
- audit_rules_file_deletion_events_renameat
- audit_rules_privileged_commands_usermod
- accounts_set_post_pw_existing
- file_groupowner_cron_hourly
- file_owner_sshd_config
- file_owner_cron_monthly
- no_password_auth_for_systemaccounts
- audit_rules_privileged_commands
- file_permissions_etc_issue
- no_forward_files
- selinux_policytype
- file_permissions_user_cfg
- dconf_gnome_screensaver_lock_delay
- audit_rules_usergroup_modification_shadow
- sshd_disable_tcp_forwarding
- file_groupownership_sshd_pub_key
- audit_rules_file_deletion_events_unlink
- postfix_network_listening_disabled
- rsyslog_files_groupownership
- accounts_minimum_age_login_defs
- file_permissions_etc_gshadow
- file_ownership_sshd_private_key
- file_permissions_sshd_private_key
- sysctl_net_ipv6_conf_all_accept_source_route
- file_owner_etc_gshadow
- package_rsyslog_installed
- sysctl_kernel_randomize_va_space
- audit_rules_dac_modification_chmod
- gnome_gdm_disable_xdmcp
- sshd_disable_root_login
- file_groupownership_audit_configuration
- file_group_ownership_var_log_audit
- audit_rules_unsuccessful_file_modification_openat
- banner_etc_issue_net
- audit_rules_media_export
- sysctl_net_ipv4_conf_default_accept_source_route
- rsyslog_files_ownership
- file_groupowner_backup_etc_group
- file_groupowner_grub2_cfg
- banner_etc_issue
- dconf_gnome_disable_user_list
- partition_for_tmp
- sshd_do_not_permit_user_env
- file_owner_backup_etc_gshadow
- accounts_passwords_pam_faillock_deny
- no_files_unowned_by_user
- audit_rules_dac_modification_fremovexattr
- firewalld_loopback_traffic_trusted
- partition_for_var_log_audit
- accounts_root_gid_zero
- audit_rules_unsuccessful_file_modification_creat
- accounts_password_set_warn_age_existing
- var_accounts_user_umask=027
- var_accounts_tmout=15_min
- var_account_disable_post_pw_expiration=30
- var_accounts_password_warn_age_login_defs=7
- var_accounts_minimum_age_login_defs=1
- var_accounts_maximum_age_login_defs=365
- var_password_hashing_algorithm=SHA512
- var_password_pam_remember_control_flag=requisite_or_required
- var_password_pam_remember=5
- var_accounts_passwords_pam_faillock_deny=3
- var_accounts_passwords_pam_faillock_unlock_time=900
- var_password_pam_minclass=4
- var_password_pam_minlen=14
- var_pam_wheel_group_for_su=cis
- sshd_idle_timeout_value=15_minutes
- var_sshd_set_keepalive=0
- var_sshd_set_login_grace_time=60
- var_sshd_max_sessions=10
- var_sshd_set_maxstartups=10:30:60
- sshd_max_auth_tries_value=4
- var_nftables_family=inet
- var_nftables_table=firewalld
- sysctl_net_ipv6_conf_all_accept_ra_value=disabled
- sysctl_net_ipv6_conf_default_accept_ra_value=disabled
- sysctl_net_ipv4_tcp_syncookies_value=enabled
- sysctl_net_ipv4_conf_all_rp_filter_value=enabled
- sysctl_net_ipv4_conf_default_rp_filter_value=enabled
- sysctl_net_ipv4_icmp_ignore_bogus_error_responses_value=enabled
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts_value=enabled
- sysctl_net_ipv4_conf_all_log_martians_value=enabled
- sysctl_net_ipv4_conf_default_log_martians_value=enabled
- sysctl_net_ipv4_conf_all_secure_redirects_value=disabled
- sysctl_net_ipv4_conf_default_secure_redirects_value=disabled
- sysctl_net_ipv4_conf_all_accept_redirects_value=disabled
- sysctl_net_ipv4_conf_default_accept_redirects_value=disabled
- sysctl_net_ipv6_conf_all_accept_redirects_value=disabled
- sysctl_net_ipv6_conf_default_accept_redirects_value=disabled
- sysctl_net_ipv4_conf_all_accept_source_route_value=disabled
- sysctl_net_ipv4_conf_default_accept_source_route_value=disabled
- sysctl_net_ipv6_conf_all_accept_source_route_value=disabled
- sysctl_net_ipv6_conf_default_accept_source_route_value=disabled
- sysctl_net_ipv6_conf_all_forwarding_value=disabled
- var_postfix_inet_interfaces=loopback-only
- var_multiple_time_servers=rhel
- var_system_crypto_policy=default_policy
- inactivity_timeout_value=15_minutes
- var_screensaver_lock_delay=5_seconds
- remote_login_banner_text=cis_banners
- login_banner_text=cis_banners
- motd_banner_text=cis_banners
- var_selinux_policy_name=targeted
- var_authselect_profile=sssd
- var_accounts_passwords_pam_faillock_dir=run
- var_auditd_action_mail_acct=root
- var_auditd_admin_space_left_action=halt
- var_auditd_space_left_action=email
- var_auditd_max_log_file_action=keep_logs
- var_auditd_max_log_file=6
- var_selinux_state=enforcing
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies:
- cis_rhel9
title: CIS Red Hat Enterprise Linux 9 Benchmark for Level 2 - Workstation
definition_location: /home/jcerny/work/git/content/products/rhel9/profiles/cis_workstation_l2.profile
documentation_complete: true
