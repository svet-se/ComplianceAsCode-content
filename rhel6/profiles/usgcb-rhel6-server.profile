documentation_complete: true

title: 'United States Government Configuration Baseline (USGCB)'

description: |-
    This profile is a working draft for a USGCB submission against
    RHEL6 Server.

selections:
    - kernel_disable_entropy_contribution_for_solid_state_drives
    - partition_for_tmp
    - partition_for_var
    - partition_for_var_log
    - partition_for_var_log_audit
    - partition_for_home
    - ensure_redhat_gpgkey_installed
    - service_rhnsd_disabled
    - security_patches_up_to_date
    - ensure_gpgcheck_globally_activated
    - ensure_gpgcheck_never_disabled
    - package_aide_installed
    - rpm_verify_permissions
    - rpm_verify_hashes
    - mount_option_nodev_nonroot_local_partitions
    - mount_option_nodev_removable_partitions
    - mount_option_noexec_removable_partitions
    - mount_option_nosuid_removable_partitions
    - mount_option_tmp_nodev
    - mount_option_tmp_nosuid
    - mount_option_tmp_noexec
    - mount_option_dev_shm_nodev
    - mount_option_dev_shm_nosuid
    - mount_option_dev_shm_noexec
    - mount_option_var_tmp_bind
    - kernel_module_cramfs_disabled
    - kernel_module_freevxfs_disabled
    - kernel_module_hfs_disabled
    - kernel_module_hfsplus_disabled
    - kernel_module_jffs2_disabled
    - kernel_module_squashfs_disabled
    - kernel_module_udf_disabled
    - file_permissions_etc_gshadow
    - file_owner_etc_gshadow
    - file_groupowner_etc_gshadow
    - file_permissions_etc_shadow
    - userowner_shadow_file
    - groupowner_shadow_file
    - file_permissions_etc_group
    - file_owner_etc_group
    - file_groupowner_etc_group
    - file_permissions_etc_passwd
    - file_owner_etc_passwd
    - file_groupowner_etc_passwd
    - dir_perms_world_writable_sticky_bits
    - file_permissions_unauthorized_world_writable
    - file_permissions_unauthorized_sgid
    - file_permissions_unauthorized_suid
    - no_files_unowned_by_user
    - file_permissions_ungroupowned
    - dir_perms_world_writable_system_owned
    - var_umask_for_daemons=027
    - umask_for_daemons
    - sysctl_fs_suid_dumpable
    - disable_users_coredumps
    - sysctl_kernel_randomize_va_space
    - sysctl_kernel_exec_shield
    - install_PAE_kernel_on_x86-32
    - securetty_root_login_console_only
    - restrict_serial_port_logins
    - no_empty_passwords
    - accounts_password_all_shadowed
    - accounts_no_uid_except_zero
    - var_accounts_password_warn_age_login_defs=14
    - accounts_password_warn_age_login_defs
    - var_accounts_maximum_age_login_defs=60
    - accounts_maximum_age_login_defs
    - var_accounts_password_minlen_login_defs=12
    - accounts_password_minlen_login_defs
    - var_password_pam_retry=3
    - accounts_password_pam_retry
    - var_password_pam_dcredit=1
    - accounts_password_pam_dcredit
    - var_password_pam_ucredit=1
    - accounts_password_pam_ucredit
    - var_password_pam_lcredit=1
    - accounts_password_pam_lcredit
    - var_password_pam_ocredit=1
    - accounts_password_pam_ocredit
    - var_password_pam_difok=3
    - accounts_password_pam_difok
    - var_accounts_passwords_pam_faillock_deny=5
    - accounts_passwords_pam_faillock_deny
    - set_password_hashing_algorithm_systemauth
    - set_password_hashing_algorithm_logindefs
    - var_password_pam_unix_remember=24
    - accounts_password_pam_unix_remember
    - root_path_no_dot
    - accounts_root_path_dirs_no_write
    - file_permissions_home_dirs
    - var_accounts_user_umask=077
    - accounts_umask_etc_bashrc
    - accounts_umask_etc_csh_cshrc
    - accounts_umask_etc_profile
    - accounts_umask_etc_login_defs
    - file_user_owner_grub_conf
    - file_group_owner_grub_conf
    - file_permissions_grub_conf
    - bootloader_password
    - disable_interactive_boot
    - inactivity_timeout_value=15_minutes
    - gconf_gnome_screensaver_idle_delay
    - gconf_gnome_screensaver_idle_activation_enabled
    - gconf_gnome_screensaver_lock_enabled
    - gconf_gnome_screensaver_mode_blank
    - login_banner_text=usgcb_default
    - banner_etc_issue
    - var_selinux_state=enforcing
    - selinux_state
    - var_selinux_policy_name=targeted
    - selinux_policytype
    - enable_selinux_bootloader
    - selinux_confinement_of_daemons
    - selinux_all_devicefiles_labeled
    - sysctl_net_ipv4_ip_forward
    - sysctl_net_ipv4_conf_all_send_redirects
    - sysctl_net_ipv4_conf_default_send_redirects
    - sysctl_net_ipv4_conf_all_secure_redirects_value=disabled
    - sysctl_net_ipv4_conf_all_secure_redirects
    - sysctl_net_ipv4_conf_all_accept_redirects_value=disabled
    - sysctl_net_ipv4_conf_all_accept_redirects
    - sysctl_net_ipv4_conf_all_accept_source_route_value=disabled
    - sysctl_net_ipv4_conf_default_accept_source_route
    - sysctl_net_ipv4_conf_default_secure_redirects_value=disabled
    - sysctl_net_ipv4_conf_default_secure_redirects
    - sysctl_net_ipv4_conf_default_accept_redirects_value=disabled
    - sysctl_net_ipv4_conf_default_accept_redirects
    - sysctl_net_ipv4_conf_default_accept_source_route_value=disabled
    - sysctl_net_ipv4_icmp_ignore_bogus_error_responses_value=enabled
    - sysctl_net_ipv4_icmp_ignore_bogus_error_responses
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts_value=enabled
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts
    - sysctl_net_ipv4_conf_all_log_martians_value=enabled
    - sysctl_net_ipv4_conf_all_log_martians
    - sysctl_net_ipv4_conf_all_rp_filter_value=enabled
    - sysctl_net_ipv4_conf_all_rp_filter
    - sysctl_net_ipv4_tcp_syncookies_value=enabled
    - sysctl_net_ipv4_tcp_syncookies
    - sysctl_net_ipv4_conf_default_rp_filter_value=enabled
    - sysctl_net_ipv4_conf_default_rp_filter
    - wireless_disable_in_bios
    - service_bluetooth_disabled
    - network_ipv6_disable_rpc
    - sysctl_net_ipv6_conf_default_accept_ra_value=disabled
    - sysctl_net_ipv6_conf_default_accept_ra
    - sysctl_net_ipv6_conf_default_accept_redirects
    - service_ip6tables_enabled
    - service_iptables_enabled
    - set_iptables_default_rule
    - set_iptables_default_rule_forward
    - kernel_module_dccp_disabled
    - kernel_module_sctp_disabled
    - kernel_module_rds_disabled
    - kernel_module_tipc_disabled
    - package_rsyslog_installed
    - service_rsyslog_enabled
    - rsyslog_files_permissions
    - rsyslog_files_groupownership
    - rsyslog_files_ownership
    - rsyslog_remote_loghost
    - rsyslog_nolisten
    - ensure_logrotate_activated
    - service_auditd_enabled
    - bootloader_audit_argument
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
    - audit_rules_kernel_module_loading
    - audit_rules_immutable
    - service_xinetd_disabled
    - package_xinetd_removed
    - service_telnetd_disabled
    - package_telnet-server_removed
    - package_rsh-server_removed
    - service_ypbind_disabled
    - package_ypserv_removed
    - service_tftp_disabled
    - package_tftp-server_removed
    - wireless_disable_interfaces
    - kernel_module_bluetooth_disabled
    - service_kdump_disabled
    - network_disable_zeroconf
    - service_crond_enabled
    - sshd_allow_only_protocol2
    - service_atd_disabled
    - sshd_set_keepalive
    - sshd_set_idle_timeout
    - sshd_disable_rhosts
    - disable_host_auth
    - sshd_disable_root_login
    - sshd_disable_empty_passwords
    - sshd_enable_warning_banner
    - sshd_do_not_permit_user_env
    - sshd_use_approved_ciphers
    - gconf_gdm_enable_warning_gui_banner
    - service_avahi-daemon_disabled
    - service_dhcpd_disabled
    - package_dhcp_removed
    - service_ntpd_enabled
    - ntpd_specify_remote_server
    - package_sendmail_removed
    - postfix_network_listening_disabled
    - ldap_client_start_tls
    - ldap_client_tls_cacertpath
    - package_openldap-servers_removed
    - service_nfslock_disabled
    - service_rpcgssd_disabled
    - service_rpcidmapd_disabled
    - service_netfs_disabled
    - service_portreserve_disabled
    - service_rpcsvcgssd_disabled
    - mount_option_nodev_remote_filesystems
    - mount_option_nosuid_remote_filesystems
    - service_named_disabled
    - package_bind_removed
    - service_vsftpd_disabled
    - package_vsftpd_removed
    - service_httpd_disabled
    - package_httpd_removed
    - service_dovecot_disabled
    - package_dovecot_removed
    - service_smb_disabled
    - require_smb_client_signing
    - mount_option_smb_client_signing
    - service_squid_disabled
    - package_squid_removed
    - service_snmpd_disabled
    - package_net-snmp_removed
    - service_autofs_disabled
    - var_account_disable_post_pw_expiration=30
    - account_disable_post_pw_expiration
