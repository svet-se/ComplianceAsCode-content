documentation_complete: true

hidden: true

title: Default Profile for Fedora

description: |-
    This profile contains all the rules that once belonged to the
    fedora product via 'prodtype'. This profile won't
    be rendered into an XCCDF Profile entity, nor it will select any
    of these rules by default. The only purpose of this profile
    is to keep a rule in the product's XCCDF Benchmark.

selections:
    - grub2_enable_iommu_force
    - sysctl_net_ipv6_conf_all_autoconf
    - audit_rules_successful_file_modification_open_by_handle_at_o_trunc_write
    - auditd_data_disk_full_action
    - kernel_config_debug_list
    - mount_option_var_tmp_bind
    - configure_usbguard_auditbackend
    - kernel_config_gcc_plugin_structleak
    - kernel_config_stackprotector
    - rsyslog_encrypt_offload_defaultnetstreamdriver
    - mount_option_home_grpquota
    - kernel_config_seccomp
    - auditd_data_retention_max_log_file_action_stig
    - service_usbguard_enabled
    - service_autofs_disabled
    - disable_anacron
    - kernel_module_vfat_disabled
    - grub2_uefi_admin_username
    - accounts_have_homedir_login_defs
    - audit_rules_successful_file_modification_lsetxattr
    - sudoers_no_command_negation
    - kernel_config_legacy_vsyscall_emulate
    - file_groupowner_var_log
    - set_ip6tables_default_rule
    - package_krb5-workstation_removed
    - kernel_config_bug_on_data_corruption
    - kernel_config_security
    - ntpd_configure_restrictions
    - configure_tmux_lock_command
    - audit_rules_dac_modification_umount2
    - dir_perms_world_writable_system_owned
    - kernel_config_security_dmesg_restrict
    - accounts_password_pam_unix_rounds_password_auth
    - sudoers_no_root_target
    - package_rsyslog-gnutls_installed
    - file_permissions_unauthorized_suid
    - kernel_config_modify_ldt_syscall
    - aide_check_audit_tools
    - kernel_config_kexec
    - auditd_data_retention_flush
    - dconf_gnome_screensaver_lock_locked
    - package_chrony_installed
    - package_ntpdate_removed
    - mount_option_nodev_nonroot_local_partitions
    - ntpd_specify_multiple_servers
    - require_emergency_target_auth
    - file_groupownership_sshd_pub_key
    - directory_permissions_var_log_audit
    - package_abrt-plugin-rhtsupport_removed
    - package_abrt-addon-ccpp_removed
    - file_groupowner_var_log_syslog
    - sysctl_net_ipv6_conf_all_max_addresses
    - service_netfs_disabled
    - sysctl_net_ipv4_ip_local_port_range
    - file_groupownership_audit_configuration
    - file_ownership_sshd_pub_key
    - kernel_config_gcc_plugin_stackleak
    - package_ntp_installed
    - package_policycoreutils_installed
    - sshd_disable_compression
    - package_setroubleshoot-plugins_removed
    - audit_rules_privileged_commands_rmmod
    - package_cron_installed
    - file_groupowner_etc_issue
    - kernel_config_gcc_plugin_latent_entropy
    - dconf_gnome_screensaver_idle_activation_locked
    - audit_rules_successful_file_modification_unlinkat
    - sshd_print_last_log
    - kernel_config_module_sig_hash
    - package_audit-audispd-plugins_installed
    - grub2_nosmap_argument_absent
    - service_rpcidmapd_disabled
    - dconf_gnome_remote_access_encryption
    - install_smartcard_packages
    - kernel_config_debug_notifiers
    - sysctl_net_ipv4_ip_forward
    - auditd_overflow_action
    - sshd_allow_only_protocol2
    - package_openscap-scanner_installed
    - dconf_gnome_disable_automount_open
    - file_permissions_home_dirs
    - sysctl_fs_protected_fifos
    - file_groupownership_system_commands_dirs
    - package_libcap-ng-utils_installed
    - postfix_client_configure_mail_alias_postmaster
    - root_permissions_syslibrary_files
    - accounts_password_minlen_login_defs
    - ftp_restrict_to_anon
    - package_rear_installed
    - encrypt_partitions
    - snmpd_use_newer_protocol
    - kernel_config_bug
    - file_groupowner_etc_issue_net
    - dconf_gnome_disable_user_admin
    - no_tmux_in_shells
    - package_xorg-x11-server-common_removed
    - service_iptables_enabled
    - partition_for_home
    - chronyd_server_directive
    - account_temp_expire_date
    - package_binutils_installed
    - partition_for_var_log_audit
    - kernel_config_unmap_kernel_at_el0
    - partition_for_srv
    - disable_ctrlaltdel_reboot
    - rsyslog_remote_tls
    - accounts_password_pam_enforce_root
    - configure_bashrc_exec_tmux
    - logwatch_configured_splithosts
    - partition_for_var_log
    - mount_option_nosuid_removable_partitions
    - audit_rules_successful_file_modification_open_o_trunc_write
    - mount_option_srv_nosuid
    - service_sshd_disabled
    - sysctl_kernel_panic_on_oops
    - file_permissions_audit_configuration
    - audit_rules_successful_file_modification_openat_o_trunc_write
    - audit_rules_successful_file_modification_removexattr
    - audit_rules_successful_file_modification_fchownat
    - package_nfs-utils_removed
    - kernel_config_slab_freelist_hardened
    - audit_rules_successful_file_modification_open_o_creat
    - accounts_password_set_max_life_existing
    - accounts_password_pam_unix_rounds_system_auth
    - package_abrt-addon-kerneloops_removed
    - sshd_disable_pubkey_auth
    - package_usbguard_installed
    - nfs_fixed_statd_port
    - audit_privileged_commands_reboot
    - sysctl_kernel_core_uses_pid
    - package_syslogng_installed
    - kernel_config_module_sig_all
    - dconf_gnome_lock_screen_on_smartcard_removal
    - network_disable_zeroconf
    - kernel_config_ia32_emulation
    - mount_option_noexec_removable_partitions
    - grub2_slab_nomerge_argument
    - kernel_config_refcount_full
    - sshd_limit_user_access
    - mount_option_proc_hidepid
    - mount_option_var_tmp_nosuid
    - dconf_gnome_disable_autorun
    - kernel_config_module_sig_key
    - service_bluetooth_disabled
    - dir_perms_world_writable_root_owned
    - package_setroubleshoot_removed
    - accounts_passwords_pam_faillock_dir
    - accounts_polyinstantiated_var_tmp
    - kernel_config_module_sig_sha512
    - network_ipv6_disable_rpc
    - kernel_config_slub_debug
    - kernel_config_page_poisoning_no_sanity
    - sysctl_net_ipv6_conf_default_accept_ra_defrtr
    - dir_perms_world_writable_system_owned_group
    - service_atd_disabled
    - wireless_disable_interfaces
    - file_at_deny_not_exist
    - sssd_memcache_timeout
    - kernel_module_uvcvideo_disabled
    - sshd_disable_user_known_hosts
    - mount_option_tmp_noexec
    - no_password_auth_for_systemaccounts
    - audit_rules_successful_file_modification_open_by_handle_at_o_creat
    - kernel_config_default_mmap_min_addr
    - account_use_centralized_automated_auth
    - partition_for_var
    - sysctl_net_ipv6_conf_all_disable_ipv6
    - sudo_vdsm_nopasswd
    - package_rsyslog_installed
    - sysctl_vm_mmap_min_addr
    - kernel_config_legacy_vsyscall_none
    - package_inetutils-telnetd_removed
    - audit_rules_successful_file_modification_openat
    - service_ntpd_enabled
    - avahi_disable_publishing
    - audit_rules_successful_file_modification_fchmod
    - sssd_offline_cred_expiration
    - kernel_config_debug_wx
    - account_passwords_pam_faillock_dir
    - kernel_config_devkmem
    - package_iptables_installed
    - package_iprutils_removed
    - dconf_gnome_disable_geolocation
    - kernel_config_legacy_ptys
    - disable_users_coredumps
    - kernel_config_legacy_vsyscall_xonly
    - nfs_fixed_lockd_udp_port
    - accounts_authorized_local_users
    - file_groupownership_sshd_private_key
    - kernel_module_ipv6_option_disabled
    - xwindows_runlevel_target
    - sysctl_kernel_pid_max
    - kernel_config_arm64_sw_ttbr0_pan
    - kernel_config_randomize_memory
    - partition_for_usr
    - mount_option_var_log_noexec
    - audit_rules_successful_file_modification_renameat
    - kernel_module_cfg80211_disabled
    - grub2_mds_argument
    - enable_dconf_user_profile
    - kernel_module_jffs2_disabled
    - mount_option_var_log_nosuid
    - service_nfslock_disabled
    - auditd_data_retention_admin_space_left_percentage
    - dir_ownership_library_dirs
    - sysctl_net_ipv4_conf_default_shared_media
    - harden_sshd_ciphers_openssh_conf_crypto_policy
    - audit_rules_successful_file_modification_open
    - kernel_config_x86_vsyscall_emulation
    - accounts_password_pam_maxclassrepeat
    - sysctl_net_ipv6_conf_all_accept_ra_rtr_pref
    - no_shelllogin_for_systemaccounts
    - kernel_config_proc_kcore
    - mount_option_opt_nosuid
    - grub2_spectre_v2_argument
    - file_permissions_etc_issue
    - kernel_config_hardened_usercopy
    - accounts_passwords_pam_faillock_enforce_local
    - kernel_config_strict_kernel_rwx
    - restrict_nfs_clients_to_privileged_ports
    - file_permissions_var_log_messages
    - dconf_gnome_disable_automount
    - install_antivirus
    - kernel_module_usb-storage_disabled
    - accounts_password_pam_pwhistory_remember_password_auth
    - package_nss-tools_installed
    - kernel_config_vmap_stack
    - file_permissions_unauthorized_sgid
    - grub2_admin_username
    - sudo_remove_nopasswd
    - kernel_config_page_poisoning_zero
    - package_logrotate_installed
    - kernel_config_compat_vdso
    - postfix_client_configure_relayhost
    - audit_privileged_commands_init
    - etc_system_fips_exists
    - iptables_sshd_disabled
    - grub2_ipv6_disable_argument
    - dconf_gnome_disable_thumbnailers
    - kernel_module_hfsplus_disabled
    - ensure_gpgcheck_repo_metadata
    - network_ipv6_privacy_extensions
    - dconf_gnome_enable_smartcard_auth
    - package_openssh-server_removed
    - mount_option_var_nodev
    - kernel_config_retpoline
    - audit_rules_successful_file_modification_lchown
    - mount_option_tmp_nosuid
    - accounts_max_concurrent_login_sessions
    - mount_option_boot_noexec
    - file_owner_var_log
    - service_cron_enabled
    - kernel_config_slab_merge_default
    - audit_rules_successful_file_modification_unlink
    - wireless_disable_in_bios
    - no_all_squash_exports
    - service_ufw_enabled
    - accounts_password_all_shadowed_sha512
    - mount_option_boot_nodev
    - harden_sshd_macs_openssh_conf_crypto_policy
    - nfs_no_anonymous
    - dir_permissions_binary_dirs
    - dconf_gnome_disable_wifi_notification
    - package_nis_removed
    - mount_option_var_log_audit_noexec
    - mount_option_var_tmp_nodev
    - package_gnutls-utils_installed
    - dhcp_client_restrict_options
    - banner_etc_issue_net
    - service_crond_enabled
    - enable_pam_namespace
    - kernel_config_sched_stack_end_check
    - kernel_module_freevxfs_disabled
    - account_emergency_expire_date
    - accounts_password_last_change_is_in_past
    - file_permissions_var_log_syslog
    - package_gdm_removed
    - kernel_config_module_sig_force
    - kernel_module_iwlmvm_disabled
    - file_owner_var_log_syslog
    - service_ip6tables_enabled
    - smartcard_auth
    - audit_rules_privileged_commands_ssh_agent
    - package_cryptsetup-luks_installed
    - package_tar_installed
    - use_root_squashing_all_exports
    - network_sniffer_disabled
    - grub2_nosmep_argument_absent
    - kernel_config_fortify_source
    - configure_tmux_lock_after_time
    - libreswan_approved_tunnels
    - configure_user_data_backups
    - dir_ownership_binary_dirs
    - nfs_fixed_lockd_tcp_port
    - snmpd_not_default_password
    - sysctl_net_ipv6_conf_default_disable_ipv6
    - kernel_config_security_yama
    - sysctl_net_ipv4_conf_all_drop_gratuitous_arp
    - mount_option_home_noexec
    - usbguard_allow_hid_and_hub
    - kernel_config_seccomp_filter
    - configure_tmux_lock_keybinding
    - mount_option_tmp_nodev
    - sysctl_net_ipv6_conf_default_accept_ra_pinfo
    - kernel_config_security_writable_hooks
    - sssd_enable_certmap
    - fapolicyd_prevent_home_folder_access
    - no_legacy_plus_entries_etc_passwd
    - kernel_config_binfmt_misc
    - sysctl_net_ipv4_conf_all_accept_local
    - audit_rules_successful_file_modification_fsetxattr
    - rsyslog_remote_access_monitoring
    - service_sssd_enabled
    - audit_rules_successful_file_modification_fremovexattr
    - package_tmux_installed
    - network_nmcli_permissions
    - mount_option_var_log_audit_nosuid
    - audit_rules_successful_file_modification_rename
    - rsyslog_nolisten
    - kernel_module_rds_disabled
    - kernel_config_panic_timeout
    - kernel_config_debug_credentials
    - file_permissions_var_log
    - file_ownership_sshd_private_key
    - audit_rules_successful_file_modification_setxattr
    - kernel_config_panic_on_oops
    - grub2_systemd_debug-shell_argument_absent
    - dir_group_ownership_library_dirs
    - bios_enable_execution_restrictions
    - sssd_certificate_verification
    - auditd_data_disk_full_action_stig
    - sudo_add_requiretty
    - kernel_module_hfs_disabled
    - sshd_enable_gssapi_auth
    - kernel_config_debug_sg
    - partition_for_dev_shm
    - umask_for_daemons
    - grub2_l1tf_argument
    - auditd_data_disk_error_action
    - sysctl_kernel_modules_disabled
    - install_PAE_kernel_on_x86-32
    - bios_disable_usb_boot
    - file_permissions_systemmap
    - sysctl_net_ipv6_conf_all_forwarding
    - partition_for_opt
    - kernel_config_ipv6
    - file_permissions_etc_audit_auditd
    - service_rpcgssd_disabled
    - audit_rules_successful_file_modification_chown
    - audit_rules_successful_file_modification_fchmodat
    - kernel_config_slab_freelist_random
    - grub2_disable_recovery
    - kernel_module_bluetooth_disabled
    - package_telnetd_removed
    - no_legacy_plus_entries_etc_group
    - mount_option_boot_noauto
    - nfs_fixed_mountd_port
    - kernel_config_page_poisoning
    - clean_components_post_updating
    - sshd_enable_pubkey_auth
    - postfix_client_configure_mail_alias
    - kernel_config_stackprotector_strong
    - sysctl_kernel_perf_event_max_sample_rate
    - file_owner_etc_issue
    - dconf_gnome_disable_wifi_create
    - kernel_config_compat_brk
    - audit_rules_successful_file_modification_fchown
    - grub2_spec_store_bypass_disable_argument
    - package_gssproxy_removed
    - partition_for_tmp
    - audit_rules_privileged_commands_postdrop
    - service_syslogng_enabled
    - file_permissions_etc_motd
    - account_passwords_pam_faillock_audit
    - kernel_config_gcc_plugin_structleak_byref_all
    - sudoers_explicit_command_args
    - mount_option_var_tmp_noexec
    - package_sssd-ipa_installed
    - package_openldap-clients_removed
    - banner_etc_motd
    - audit_rules_successful_file_modification_truncate
    - dhcp_server_minimize_served_info
    - package_abrt-cli_removed
    - audit_rules_successful_file_modification_open_by_handle_at
    - package_openssh-server_installed
    - accounts_logon_fail_delay
    - file_permissions_etc_issue_net
    - file_groupowner_var_log_messages
    - audit_rules_successful_file_modification_chmod
    - kernel_config_acpi_custom_method
    - sudoers_validate_passwd
    - ftp_log_transactions
    - sysctl_fs_protected_regular
    - kernel_config_syn_cookies
    - auditd_data_disk_error_action_stig
    - file_cron_deny_not_exist
    - file_owner_var_log_messages
    - installed_OS_is_FIPS_certified
    - network_ipv6_default_gateway
    - sshd_disable_root_password_login
    - sshd_use_directory_configuration
    - harden_sshd_crypto_policy
    - file_ownership_audit_configuration
    - package_telnetd-ssl_removed
    - mount_option_var_log_audit_nodev
    - partition_for_boot
    - service_chronyd_enabled
    - network_ipv6_disable_interfaces
    - package_vsftpd_installed
    - audit_rules_privileged_commands_postqueue
    - audit_rules_successful_file_modification_ftruncate
    - package_libreport-plugin-logger_removed
    - package_rng-tools_installed
    - logwatch_configured_hostlimit
    - no_insecure_locks_exports
    - grub2_rng_core_default_quality_argument
    - dconf_gnome_disable_power_settings
    - package_abrt-plugin-logger_removed
    - package_MFEhiplsm_installed
    - kernel_config_page_table_isolation
    - snmpd_no_rwusers
    - package_setroubleshoot-server_removed
    - mount_option_home_usrquota
    - rsyslog_remote_tls_cacert
    - package_scap-security-guide_installed
    - audit_rules_dac_modification_umount
    - sysctl_net_ipv4_conf_all_arp_filter
    - ftp_disable_uploads
    - kernel_config_hibernation
    - set_iptables_default_rule_forward
    - service_rsyncd_disabled
    - mount_option_boot_nosuid
    - ftp_home_partition
    - package_abrt-plugin-sosreport_removed
    - package_postfix_installed
    - audit_privileged_commands_poweroff
    - audit_rules_successful_file_modification_creat
    - auditd_data_retention_space_left_percentage
    - grub2_mce_argument
    - root_path_default
    - kernel_config_strict_module_rwx
    - dconf_gnome_disable_user_list
    - accounts_polyinstantiated_tmp
    - coreos_enable_selinux_kernel_argument
    - dconf_gnome_disable_ctrlaltdel_reboot
    - kernel_disable_entropy_contribution_for_solid_state_drives
    - dconf_gnome_disable_restart_shutdown
    - audit_rules_successful_file_modification_lremovexattr
    - sshd_use_priv_separation
    - audit_privileged_commands_shutdown
    - dir_permissions_library_dirs
    - accounts_password_pam_dictcheck
    - kernel_config_gcc_plugin_randstruct
    - sysctl_crypto_fips_enabled
    - service_rpcsvcgssd_disabled
    - sshd_enable_warning_banner_net
    - sssd_ssh_known_hosts_timeout
    - mount_option_var_nosuid
    - ftp_limit_users
    - configure_opensc_nss_db
    - kernel_module_mac80211_disabled
    - rsyslog_accept_remote_messages_tcp
    - accounts_password_pam_enforce_local
    - usbguard_allow_hub
    - package_libreport-plugin-rhtsupport_removed
    - sysctl_net_ipv6_conf_default_accept_ra_rtr_pref
    - sysctl_net_ipv6_conf_default_max_addresses
    - sysctl_net_ipv6_conf_default_autoconf
    - service_rsyslog_enabled
    - kernel_config_randomize_base
    - sshd_set_loglevel_info
    - kernel_config_hardened_usercopy_fallback
    - ftp_configure_firewall
    - ntpd_run_as_ntp_user
    - network_ipv6_static_address
    - sysctl_kernel_sysrq
    - sysctl_net_ipv4_conf_all_arp_ignore
    - package_geolite2-country_removed
    - mount_option_var_noexec
    - selinux_not_disabled
    - sysctl_net_ipv6_conf_all_router_solicitations
    - sysctl_net_ipv4_conf_all_shared_media
    - package_vim_installed
    - package_python3-abrt-addon_removed
    - file_permissions_etc_audit_rulesd
    - root_path_no_dot
    - bios_assign_password
    - no_rsh_trust_files
    - file_owner_etc_issue_net
    - sysctl_net_ipv6_conf_all_accept_ra_pinfo
    - sysctl_kernel_perf_cpu_time_max_percent
    - file_groupowner_etc_motd
    - no_root_webbrowsing
    - audit_rules_privileged_commands_modprobe
    - sysctl_net_ipv6_conf_all_accept_ra_defrtr
    - sudo_remove_no_authenticate
    - sudo_add_noexec
    - sysctl_net_ipv4_conf_all_route_localnet
    - kernel_config_debug_fs
    - disallow_bypass_password_sudo
    - ntpd_specify_remote_server
    - sysctl_net_ipv6_conf_default_router_solicitations
    - sysctl_net_ipv6_conf_default_accept_ra
    - audit_rules_successful_file_modification_openat_o_creat
    - kernel_module_iwlwifi_disabled
    - prefer_64bit_os
    - sshd_enable_x11_forwarding
    - sshd_disable_rhosts_rsa
    - harden_ssh_client_crypto_policy
    - package_geolite2-city_removed
    - set_iptables_default_rule
    - audit_rules_privileged_commands_pam_timestamp_check
    - usbguard_allow_hid
    - audit_rules_privileged_commands_insmod
    - sysctl_fs_suid_dumpable
    - package_tuned_removed
    - no_legacy_plus_entries_etc_shadow
    - accounts_passwords_pam_faillock_audit
    - rsyslog_encrypt_offload_actionsendstreamdrivermode
    - rsyslog_encrypt_offload_actionsendstreamdriverauthmode
    - file_owner_etc_motd
    - rsyslog_accept_remote_messages_udp
    - kernel_config_module_sig
    - disable_logwatch_for_logserver
    - audit_rules_execution_setfiles
    - ftp_present_banner
    - mount_option_nodev_removable_partitions
    - dconf_gnome_remote_access_credential_prompt
    - enable_dracut_fips_module
    - accounts_password_pam_pwhistory_remember_system_auth
    - mount_option_var_log_nodev
