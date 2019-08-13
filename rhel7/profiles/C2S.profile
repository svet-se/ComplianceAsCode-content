documentation_complete: true

title: 'C2S for Red Hat Enterprise Linux 7'

description: |-
    This profile demonstrates compliance against the
    U.S. Government Commercial Cloud Services (C2S) baseline.

    This baseline was inspired by the Center for Internet Security
    (CIS) Red Hat Enterprise Linux 7 Benchmark, v2.1.1 - 01-31-2017.

    For the SCAP Security Guide project to remain in compliance with
    CIS' terms and conditions, specifically Restrictions(8), note
    there is no representation or claim that the C2S profile will
    ensure a system is in compliance or consistency with the CIS
    baseline.

selections:
    - kernel_module_cramfs_disabled
    - kernel_module_freevxfs_disabled
    - kernel_module_jffs2_disabled
    - kernel_module_hfs_disabled
    - kernel_module_hfsplus_disabled
    - kernel_module_squashfs_disabled
    - kernel_module_udf_disabled
    - partition_for_tmp
    - mount_option_tmp_nodev
    - mount_option_tmp_nosuid
    - mount_option_tmp_noexec
    - partition_for_var
    - partition_for_var_tmp
    - mount_option_var_tmp_nodev
    - mount_option_var_tmp_nosuid
    - mount_option_var_tmp_noexec
    - partition_for_var_log
    - partition_for_var_log_audit
    - partition_for_home
    - mount_option_home_nodev
    - mount_option_dev_shm_nodev
    - mount_option_dev_shm_nosuid
    - mount_option_dev_shm_noexec
    - mount_option_nodev_removable_partitions
    - mount_option_nosuid_removable_partitions
    - mount_option_noexec_removable_partitions
    - dir_perms_world_writable_sticky_bits
    - service_autofs_disabled
    - ensure_gpgcheck_globally_activated
    - ensure_redhat_gpgkey_installed
    - service_rhnsd_disabled
    - package_aide_installed
    - aide_periodic_cron_checking
    - file_owner_grub2_cfg
    - file_groupowner_grub2_cfg
    - file_permissions_grub2_cfg
    - grub2_password
    - grub2_uefi_password
    - require_singleuser_auth
    - disable_users_coredumps
    - sysctl_fs_suid_dumpable
    - sysctl_kernel_exec_shield
    - sysctl_kernel_randomize_va_space
    - disable_prelink
    - grub2_enable_selinux
    - var_selinux_state=enforcing
    - selinux_state
    - var_selinux_policy_name=targeted
    - selinux_policytype
    - package_setroubleshoot_removed
    - package_mcstrans_removed
    - selinux_confinement_of_daemons
    - banner_etc_issue
    - login_banner_text=usgcb_default
    - dconf_db_up_to_date
    - dconf_gnome_login_banner_text
    - dconf_gnome_banner_enabled
    - security_patches_up_to_date
    - service_tftp_disabled
    - service_xinetd_disabled
    - service_chronyd_or_ntpd_enabled
    - package_xorg-x11-server-common_removed
    - service_avahi-daemon_disabled
    - service_cups_disabled
    - service_dhcpd_disabled
    - package_openldap-servers_removed
    - service_rpcbind_disabled
    - service_nfs_disabled
    - service_named_disabled
    - service_vsftpd_disabled
    - service_httpd_disabled
    - service_dovecot_disabled
    - service_smb_disabled
    - service_squid_disabled
    - service_snmpd_disabled
    - postfix_network_listening_disabled
    - package_ypserv_removed
    - service_rexec_disabled
    - service_rsh_disabled
    - service_rlogin_disabled
    - service_telnet_disabled
    - package_talk-server_removed
    - package_ypbind_removed
    - package_rsh_removed
    - package_talk_removed
    - package_telnet_removed
    - sysctl_net_ipv4_ip_forward
    - sysctl_net_ipv4_conf_all_send_redirects
    - sysctl_net_ipv4_conf_default_send_redirects
    - sysctl_net_ipv4_conf_all_accept_source_route
    - sysctl_net_ipv4_conf_default_accept_source_route
    - sysctl_net_ipv4_conf_all_accept_redirects
    - sysctl_net_ipv4_conf_default_accept_redirects
    - sysctl_net_ipv4_conf_all_secure_redirects
    - sysctl_net_ipv4_conf_default_secure_redirects
    - sysctl_net_ipv4_conf_all_log_martians
    - sysctl_net_ipv4_conf_default_log_martians
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts
    - sysctl_net_ipv4_icmp_ignore_bogus_error_responses
    - sysctl_net_ipv4_conf_all_rp_filter
    - sysctl_net_ipv4_conf_default_rp_filter
    - sysctl_net_ipv4_tcp_syncookies
    - sysctl_net_ipv6_conf_all_accept_ra
    - sysctl_net_ipv6_conf_default_accept_ra
    - sysctl_net_ipv6_conf_all_accept_redirects
    - sysctl_net_ipv6_conf_default_accept_redirects
    - sysctl_net_ipv6_conf_all_disable_ipv6
    - package_tcp_wrappers_installed
    - kernel_module_dccp_disabled
    - kernel_module_sctp_disabled
    - var_auditd_max_log_file=6
    - auditd_data_retention_max_log_file
    - var_auditd_action_mail_acct=root
    - var_auditd_admin_space_left_action=single
    - auditd_data_retention_action_mail_acct
    - auditd_data_retention_admin_space_left_action
    - auditd_data_retention_max_log_file_action
    - service_auditd_enabled
    - grub2_audit_argument
    - audit_rules_time_adjtimex
    - audit_rules_time_settimeofday
    - audit_rules_time_stime
    - audit_rules_time_clock_settime
    - audit_rules_time_watch_localtime
    - audit_rules_usergroup_modification_passwd
    - audit_rules_usergroup_modification_group
    - audit_rules_usergroup_modification_gshadow
    - audit_rules_usergroup_modification_shadow
    - audit_rules_usergroup_modification_opasswd
    - audit_rules_networkconfig_modification
    - audit_rules_mac_modification
    - audit_rules_login_events
    - audit_rules_session_events
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
    - audit_rules_unsuccessful_file_modification_creat
    - audit_rules_unsuccessful_file_modification_open
    - audit_rules_unsuccessful_file_modification_openat
    - audit_rules_unsuccessful_file_modification_open_by_handle_at
    - audit_rules_unsuccessful_file_modification_truncate
    - audit_rules_unsuccessful_file_modification_ftruncate
    - audit_rules_privileged_commands
    - audit_rules_media_export
    - audit_rules_file_deletion_events_rename
    - audit_rules_file_deletion_events_renameat
    - audit_rules_file_deletion_events_rmdir
    - audit_rules_file_deletion_events_unlink
    - audit_rules_file_deletion_events_unlinkat
    - audit_rules_sysadmin_actions
    - audit_rules_kernel_module_loading
    - audit_rules_immutable
    - service_rsyslog_enabled
    - rsyslog_files_permissions
    - rsyslog_remote_loghost
    - rsyslog_accept_remote_messages_tcp
    - rsyslog_accept_remote_messages_udp
    - package_rsyslog_installed
    - ensure_logrotate_activated
    - service_crond_enabled
    - sshd_allow_only_protocol2
    - sshd_set_loglevel_info
    - sshd_enable_x11_forwarding
    - sshd_set_max_auth_tries
    - disable_host_auth
    - sshd_disable_root_login
    - sshd_disable_empty_passwords
    - sshd_do_not_permit_user_env
    - sshd_use_approved_ciphers
    - sshd_use_approved_macs
    - sshd_set_idle_timeout
    - sshd_set_keepalive
    - sshd_enable_warning_banner
    - var_password_pam_minlen=14
    - accounts_password_pam_minlen
    - accounts_password_pam_dcredit
    - accounts_password_pam_ucredit
    - accounts_password_pam_lcredit
    - accounts_password_pam_retry
    - var_accounts_passwords_pam_faillock_unlock_time=900
    - var_accounts_passwords_pam_faillock_deny=5
    - accounts_passwords_pam_faillock_unlock_time
    - accounts_passwords_pam_faillock_deny
    - var_password_pam_unix_remember=5
    - accounts_password_pam_unix_remember
    - set_password_hashing_algorithm_systemauth
    - var_accounts_maximum_age_login_defs=90
    - accounts_maximum_age_login_defs
    - var_accounts_minimum_age_login_defs=7
    - accounts_minimum_age_login_defs
    - var_accounts_password_warn_age_login_defs=7
    - accounts_password_warn_age_login_defs
    - var_account_disable_post_pw_expiration=30
    - account_disable_post_pw_expiration
    - no_shelllogin_for_systemaccounts
    - accounts_umask_etc_bashrc
    - accounts_umask_etc_profile
    - no_direct_root_logins
    - file_owner_etc_passwd
    - file_groupowner_etc_passwd
    - file_permissions_etc_passwd
    - file_owner_etc_shadow
    - file_groupowner_etc_shadow
    - file_permissions_etc_shadow
    - file_owner_etc_group
    - file_groupowner_etc_group
    - file_permissions_etc_group
    - file_owner_etc_gshadow
    - file_groupowner_etc_gshadow
    - file_permissions_etc_gshadow
    - file_permissions_unauthorized_world_writable
    - no_files_unowned_by_user
    - file_permissions_ungroupowned
    - file_permissions_unauthorized_suid
    - file_permissions_unauthorized_sgid
    - accounts_no_uid_except_zero
    - no_rsh_trust_files
