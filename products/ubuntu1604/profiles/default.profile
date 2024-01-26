documentation_complete: true

hidden: true

title: Default Profile for Ubuntu 16.04

description: |-
    This profile contains all the rules that once belonged to the
    ubuntu1604 product via 'prodtype'. This profile won't
    be rendered into an XCCDF Profile entity, nor it will select any
    of these rules by default. The only purpose of this profile
    is to keep a rule in the product's XCCDF Benchmark.

selections:
    - file_permissions_backup_etc_passwd
    - accounts_umask_etc_login_defs
    - kernel_config_module_sig_key
    - gid_passwd_group_same
    - auditd_data_disk_full_action
    - grub2_rng_core_default_quality_argument
    - kernel_config_debug_list
    - audit_rules_sysadmin_actions
    - audit_rules_dac_modification_chown
    - gnome_gdm_disable_xdmcp
    - grub2_nosmep_argument_absent
    - configure_user_data_backups
    - package_MFEhiplsm_installed
    - accounts_polyinstantiated_var_tmp
    - audit_rules_session_events
    - kernel_config_module_sig_sha512
    - kernel_config_page_table_isolation
    - accounts_password_warn_age_login_defs
    - kernel_config_page_poisoning_no_sanity
    - audit_rules_dac_modification_fchownat
    - audit_rules_media_export
    - kernel_config_slub_debug
    - dir_ownership_binary_dirs
    - rsyslog_encrypt_offload_defaultnetstreamdriver
    - file_permissions_library_dirs
    - file_ownership_library_dirs
    - coredump_disable_storage
    - kernel_config_seccomp
    - auditd_data_retention_max_log_file_action_stig
    - sysctl_net_ipv6_conf_default_disable_ipv6
    - audit_rules_usergroup_modification
    - sshd_set_keepalive
    - kernel_config_security_yama
    - sshd_set_loglevel_verbose
    - file_owner_backup_etc_group
    - audit_rules_dac_modification_umount
    - no_empty_passwords
    - kernel_module_uvcvideo_disabled
    - accounts_maximum_age_login_defs
    - audit_rules_file_deletion_events_rename
    - sshd_disable_user_known_hosts
    - file_groupowner_backup_etc_gshadow
    - sudoers_no_command_negation
    - restrict_serial_port_logins
    - sysctl_net_ipv4_conf_all_arp_filter
    - auditd_local_events
    - kernel_config_default_mmap_min_addr
    - kernel_config_hibernation
    - set_iptables_default_rule_forward
    - set_ip6tables_default_rule
    - account_use_centralized_automated_auth
    - display_login_attempts
    - audit_rules_dac_modification_chmod
    - kernel_config_seccomp_filter
    - sshd_rekey_limit
    - file_owner_backup_etc_shadow
    - audit_rules_dac_modification_lremovexattr
    - kernel_config_security
    - sysctl_net_ipv6_conf_all_disable_ipv6
    - sudo_require_authentication
    - sudo_vdsm_nopasswd
    - auditd_data_retention_space_left_action
    - kernel_config_security_writable_hooks
    - partition_for_dev_shm
    - fapolicyd_prevent_home_folder_access
    - kernel_config_binfmt_misc
    - sshd_enable_warning_banner
    - audit_rules_dac_modification_umount2
    - kernel_config_security_dmesg_restrict
    - package_postfix_installed
    - sysctl_net_ipv4_conf_all_accept_local
    - audit_privileged_commands_poweroff
    - sysctl_kernel_kptr_restrict
    - accounts_umask_etc_profile
    - audit_rules_file_deletion_events_unlink
    - sshd_set_max_sessions
    - sudoers_no_root_target
    - auditd_write_logs
    - grub2_mce_argument
    - audit_rules_time_stime
    - disable_host_auth
    - dir_perms_world_writable_sticky_bits
    - coredump_disable_backtraces
    - file_owner_backup_etc_gshadow
    - auditd_data_retention_action_mail_acct
    - sshd_do_not_permit_user_env
    - kernel_config_kexec
    - accounts_polyinstantiated_tmp
    - file_owner_backup_etc_passwd
    - rsyslog_remote_loghost
    - kernel_disable_entropy_contribution_for_solid_state_drives
    - package_openldap-servers_removed
    - avahi_disable_publishing
    - package_chrony_installed
    - sudo_custom_logfile
    - sshd_use_priv_separation
    - audit_rules_time_settimeofday
    - kernel_module_rds_disabled
    - audit_privileged_commands_shutdown
    - file_groupownership_sshd_pub_key
    - account_passwords_pam_faillock_dir
    - audit_rules_dac_modification_lsetxattr
    - directory_permissions_var_log_audit
    - kernel_config_devkmem
    - kernel_config_debug_credentials
    - kernel_config_panic_timeout
    - file_permissions_backup_etc_gshadow
    - file_ownership_var_log_audit
    - dir_permissions_library_dirs
    - file_permissions_var_log
    - kernel_config_legacy_ptys
    - file_ownership_sshd_private_key
    - sshd_enable_warning_banner_net
    - kernel_config_panic_on_oops
    - audit_rules_dac_modification_fchmod
    - file_groupowner_var_log_syslog
    - grub2_systemd_debug-shell_argument_absent
    - service_netfs_disabled
    - ftp_limit_users
    - file_groupownership_sshd_private_key
    - kernel_module_ipv6_option_disabled
    - file_groupownership_audit_configuration
    - rsyslog_accept_remote_messages_tcp
    - audit_rules_privileged_commands
    - auditd_data_disk_full_action_stig
    - file_ownership_sshd_pub_key
    - kernel_config_randomize_memory
    - file_permissions_unauthorized_world_writable
    - sudo_add_requiretty
    - sshd_disable_compression
    - sshd_disable_gssapi_auth
    - sshd_enable_gssapi_auth
    - kernel_config_debug_sg
    - sshd_print_last_log
    - kernel_config_module_sig_hash
    - grub2_nosmap_argument_absent
    - dir_ownership_library_dirs
    - file_groupowner_backup_etc_shadow
    - kernel_config_randomize_base
    - sshd_set_loglevel_info
    - audit_rules_dac_modification_fremovexattr
    - sysctl_net_ipv4_conf_default_shared_media
    - grub2_l1tf_argument
    - file_groupowner_var_log
    - ftp_configure_firewall
    - audit_rules_file_deletion_events_unlinkat
    - audit_rules_immutable
    - audit_rules_dac_modification_removexattr
    - auditd_data_disk_error_action
    - kernel_config_x86_vsyscall_emulation
    - auditd_data_retention_admin_space_left_action
    - mount_option_dev_shm_nodev
    - sshd_disable_tcp_forwarding
    - kernel_config_debug_notifiers
    - kernel_config_proc_kcore
    - audit_rules_file_deletion_events_rmdir
    - auditd_overflow_action
    - service_systemd-journald_enabled
    - auditd_data_retention_max_log_file_action
    - audit_rules_networkconfig_modification
    - grub2_spectre_v2_argument
    - kernel_config_ipv6
    - sysctl_net_ipv4_conf_all_arp_ignore
    - file_permissions_home_dirs
    - file_ownership_binary_dirs
    - grub2_disable_recovery
    - no_netrc_files
    - postfix_client_configure_mail_alias_postmaster
    - securetty_root_login_console_only
    - file_permissions_var_log_messages
    - no_direct_root_logins
    - accounts_password_minlen_login_defs
    - account_unique_name
    - selinux_not_disabled
    - sudo_add_use_pty
    - package_nss-tools_installed
    - accounts_root_path_dirs_no_write
    - sysctl_net_ipv4_conf_all_shared_media
    - sshd_enable_strictmodes
    - root_path_no_dot
    - kernel_config_bug
    - sshd_set_login_grace_time
    - kernel_config_page_poisoning_zero
    - package_logrotate_installed
    - no_rsh_trust_files
    - audit_rules_dac_modification_lchown
    - audit_rules_dac_modification_fchmodat
    - sshd_enable_pubkey_auth
    - kernel_config_compat_vdso
    - postfix_client_configure_mail_alias
    - no_empty_passwords_etc_shadow
    - service_iptables_enabled
    - postfix_client_configure_relayhost
    - audit_privileged_commands_init
    - file_permissions_backup_etc_group
    - iptables_sshd_disabled
    - chronyd_server_directive
    - kernel_config_compat_brk
    - auditd_data_retention_max_log_file
    - sshd_enable_pam
    - accounts_no_uid_except_zero
    - audit_rules_time_clock_settime
    - grub2_spec_store_bypass_disable_argument
    - kernel_config_unmap_kernel_at_el0
    - audit_rules_time_adjtimex
    - package_openssh-server_removed
    - partition_for_srv
    - sudo_add_noexec
    - sysctl_net_ipv4_conf_all_route_localnet
    - auditd_log_format
    - service_syslogng_enabled
    - accounts_minimum_age_login_defs
    - kernel_config_retpoline
    - kernel_config_debug_fs
    - account_passwords_pam_faillock_audit
    - disallow_bypass_password_sudo
    - security_patches_up_to_date
    - audit_rules_dac_modification_fchown
    - sudoers_explicit_command_args
    - sshd_set_maxstartups
    - accounts_root_gid_zero
    - accounts_max_concurrent_login_sessions
    - auditd_data_retention_num_logs
    - audit_rules_dac_modification_setxattr
    - file_owner_var_log
    - package_openldap-clients_removed
    - prefer_64bit_os
    - file_permissions_sshd_private_key
    - sshd_disable_x11_forwarding
    - mount_option_dev_shm_nosuid
    - sshd_enable_x11_forwarding
    - service_sshd_disabled
    - sshd_disable_rhosts_rsa
    - sysctl_kernel_panic_on_oops
    - file_permissions_audit_configuration
    - harden_ssh_client_crypto_policy
    - dhcp_server_minimize_served_info
    - no_all_squash_exports
    - sshd_set_max_auth_tries
    - sshd_disable_kerb_auth
    - sshd_disable_rhosts
    - file_permissions_backup_etc_shadow
    - service_ufw_enabled
    - audit_rules_file_deletion_events_renameat
    - package_openssh-server_installed
    - accounts_logon_fail_delay
    - selinux_state
    - audit_rules_dac_modification_fsetxattr
    - file_groupowner_backup_etc_passwd
    - file_groupowner_var_log_messages
    - auditd_audispd_syslog_plugin_activated
    - set_iptables_default_rule
    - kernel_config_acpi_custom_method
    - dir_permissions_binary_dirs
    - file_groupowner_backup_etc_group
    - sshd_disable_pubkey_auth
    - package_gnutls-utils_installed
    - dhcp_client_restrict_options
    - audit_privileged_commands_reboot
    - file_permissions_binary_dirs
    - auditd_freq
    - kernel_module_tipc_disabled
    - accounts_passwords_pam_faillock_audit
    - rsyslog_encrypt_offload_actionsendstreamdrivermode
    - kernel_config_module_sig_all
    - rsyslog_encrypt_offload_actionsendstreamdriverauthmode
    - kernel_config_syn_cookies
    - package_syslogng_installed
    - accounts_password_last_change_is_in_past
    - auditd_data_disk_error_action_stig
    - accounts_password_all_shadowed
    - kernel_config_ia32_emulation
    - rsyslog_accept_remote_messages_udp
    - file_permissions_sshd_pub_key
    - file_owner_var_log_messages
    - file_permissions_var_log_syslog
    - installed_OS_is_FIPS_certified
    - chronyd_specify_remote_server
    - grub2_slab_nomerge_argument
    - kernel_config_module_sig
    - sshd_disable_root_password_login
    - file_ownership_audit_configuration
    - audit_rules_mac_modification_usr_share
    - kernel_config_module_sig_force
    - service_chronyd_enabled
    - file_owner_var_log_syslog
    - sshd_limit_user_access
    - audit_rules_mac_modification
    - service_ip6tables_enabled
    - audit_rules_time_watch_localtime
