description: 'This profile contains configuration checks that align to the

    DISA STIG for Red Hat Enterprise Linux 9 V1R2.



    In addition to being applicable to Red Hat Enterprise Linux 9, DISA recognizes
    this

    configuration baseline as applicable to the operating system tier of

    Red Hat technologies that are based on Red Hat Enterprise Linux 9, such as:


    - Red Hat Enterprise Linux Server

    - Red Hat Enterprise Linux Workstation and Desktop

    - Red Hat Enterprise Linux for HPC

    - Red Hat Storage

    - Red Hat Containers with a Red Hat Enterprise Linux 9 image


    Warning: The installation and use of a Graphical User Interface (GUI)

    increases your attack vector and decreases your overall security posture. If

    your Information Systems Security Officer (ISSO) lacks a documented operational

    requirement for a graphical user interface, please consider using the

    standard DISA STIG for Red Hat Enterprise Linux 9 profile.'
extends: null
hidden: ''
metadata:
    version: V1R2
    SMEs:
    - mab879
    - ggbecker
reference: https://public.cyber.mil/stigs/downloads/?_dl_facet_stigs=operating-systems%2Cunix-linux
selections:
- aide_build_database
- auditd_data_retention_admin_space_left_action
- postfix_client_configure_mail_alias
- accounts_password_pam_ocredit
- file_owner_cron_d
- audit_rules_usergroup_modification_shadow
- audit_rules_immutable
- configure_bashrc_tmux
- auditd_write_logs
- file_owner_backup_etc_passwd
- mount_option_var_tmp_nosuid
- sshd_disable_compression
- audit_privileged_commands_shutdown
- file_permissions_binary_dirs
- audit_rules_dac_modification_fchownat
- audit_rules_file_deletion_events_renameat
- file_owner_cron_hourly
- mount_option_var_tmp_noexec
- file_groupownership_system_commands_dirs
- configured_firewalld_default_deny
- mount_option_var_tmp_nodev
- accounts_password_pam_pwhistory_remember_password_auth
- sysctl_net_ipv6_conf_all_accept_source_route
- sshd_print_last_log
- service_fapolicyd_enabled
- file_owner_cron_daily
- accounts_password_pam_ucredit
- accounts_tmout
- firewalld-backend
- sshd_disable_empty_passwords
- package_openssh-server_installed
- audit_rules_dac_modification_fchmod
- package_tuned_removed
- file_groupowner_etc_gshadow
- audit_rules_unsuccessful_file_modification_ftruncate
- sysctl_kernel_unprivileged_bpf_disabled
- package_policycoreutils_installed
- dconf_gnome_session_idle_user_locks
- audit_rules_privileged_commands_sudoedit
- audit_rules_execution_setsebool
- audit_rules_login_events_faillock
- audit_rules_system_shutdown
- sshd_enable_strictmodes
- package_opensc_installed
- file_owner_etc_shadow
- audit_rules_dac_modification_fremovexattr
- audit_rules_file_deletion_events_rename
- accounts_passwords_pam_faillock_dir
- dconf_gnome_screensaver_mode_blank
- dir_perms_world_writable_sticky_bits
- file_groupowner_cron_deny
- service_debug-shell_disabled
- file_owner_cron_monthly
- accounts_user_interactive_home_directory_defined
- audit_rules_unsuccessful_file_modification_truncate
- audit_rules_dac_modification_fchmodat
- mount_option_home_nodev
- kernel_module_sctp_disabled
- file_groupowner_crontab
- package_gssproxy_removed
- configure_ssh_crypto_policy
- sysctl_kernel_exec_shield
- accounts_passwords_pam_faillock_interval
- mount_option_dev_shm_nosuid
- sysctl_net_ipv6_conf_default_accept_ra
- package_crypto-policies_installed
- directory_group_ownership_var_log_audit
- audit_rules_kernel_module_loading_init
- sshd_set_idle_timeout
- audit_rules_usergroup_modification_group
- file_audit_tools_permissions
- chronyd_server_directive
- audit_rules_privileged_commands_ssh_keysign
- audit_rules_unsuccessful_file_modification_creat
- package_telnet-server_removed
- security_patches_up_to_date
- enable_dracut_fips_module
- harden_sshd_ciphers_openssh_conf_crypto_policy
- sysctl_net_ipv4_icmp_ignore_bogus_error_responses
- file_owner_backup_etc_group
- package_openssh-clients_installed
- grub2_pti_argument
- dconf_gnome_disable_ctrlaltdel_reboot
- sshd_disable_rhosts
- audit_rules_unsuccessful_file_modification_openat
- audit_privileged_commands_poweroff
- ssh_keys_passphrase_protected
- accounts_password_pam_dictcheck
- dir_perms_world_writable_root_owned
- rsyslog_cron_logging
- configure_tmux_lock_command
- no_tmux_in_shells
- rsyslog_encrypt_offload_actionsendstreamdrivermode
- account_password_pam_faillock_system_auth
- package_s-nail_installed
- audit_rules_usergroup_modification_passwd
- audit_rules_dac_modification_umount2
- service_pcscd_enabled
- dir_group_ownership_library_dirs
- file_owner_crontab
- accounts_authorized_local_users
- mount_option_nodev_remote_filesystems
- accounts_logon_fail_delay
- account_temp_expire_date
- enable_authselect
- rsyslog_remote_access_monitoring
- set_password_hashing_algorithm_libuserconf
- file_owner_cron_deny
- auditd_local_events
- sssd_certificate_verification
- mount_option_dev_shm_noexec
- sysctl_kernel_kexec_load_disabled
- aide_use_fips_hashes
- mount_option_dev_shm_nodev
- file_permissions_var_log_audit
- file_groupowner_etc_shadow
- directory_ownership_var_log_audit
- package_tftp-server_removed
- service_kdump_disabled
- service_usbguard_enabled
- audit_rules_privileged_commands_postdrop
- ensure_gpgcheck_globally_activated
- sysctl_net_ipv6_conf_all_forwarding
- firewalld_sshd_port_enabled
- sshd_disable_gssapi_auth
- audit_rules_kernel_module_loading_delete
- mount_option_noexec_removable_partitions
- configure_libreswan_crypto_policy
- partition_for_var_tmp
- audit_rules_dac_modification_fchown
- sysctl_net_ipv4_conf_default_accept_redirects
- sshd_disable_kerb_auth
- mount_option_nodev_nonroot_local_partitions
- audit_rules_execution_chcon
- no_user_host_based_files
- sysctl_kernel_core_pattern
- auditd_data_retention_space_left_action
- package_nss-tools_installed
- sysctl_crypto_fips_enabled
- disable_host_auth
- mount_option_nodev_removable_partitions
- package_audispd-plugins_installed
- logind_session_timeout
- dconf_gnome_screensaver_user_locks
- file_groupowner_backup_etc_passwd
- accounts_have_homedir_login_defs
- selinux_policytype
- file_owner_etc_gshadow
- file_groupownership_home_directories
- grub2_audit_argument
- use_pam_wheel_for_su
- service_rsyslog_enabled
- package_fapolicyd_installed
- audit_rules_unsuccessful_file_modification_open_by_handle_at
- file_permission_user_init_files
- sshd_rekey_limit
- audit_rules_dac_modification_chown
- file_permissions_cron_hourly
- clean_components_post_updating
- service_systemd-coredump_disabled
- account_password_pam_faillock_password_auth
- file_groupowner_cron_weekly
- postfix_client_configure_mail_alias_postmaster
- configure_firewalld_ports
- file_permissions_backup_etc_gshadow
- package_pcsc-lite_installed
- account_disable_post_pw_expiration
- accounts_passwords_pam_faillock_unlock_time
- audit_rules_privileged_commands_chsh
- file_groupowner_var_log_messages
- accounts_passwords_pam_faillock_deny
- disable_users_coredumps
- audit_rules_privileged_commands_newgrp
- display_login_attempts
- sysctl_net_ipv4_conf_all_accept_redirects
- dir_permissions_library_dirs
- audit_rules_login_events_tallylog
- package_rng-tools_installed
- configure_tmux_lock_after_time
- accounts_max_concurrent_login_sessions
- file_owner_cron_weekly
- dconf_gnome_disable_autorun
- no_empty_passwords
- file_permissions_var_log_messages
- accounts_passwords_pam_faillock_audit
- kerberos_disable_no_keytab
- audit_rules_usergroup_modification_opasswd
- package_rsh-server_removed
- service_systemd-journald_enabled
- mount_option_var_log_audit_nosuid
- dconf_gnome_screensaver_lock_enabled
- file_permissions_var_log
- sudo_require_reauthentication
- file_permissions_backup_etc_group
- audit_rules_unsuccessful_file_modification_open
- mount_option_var_log_nosuid
- grub2_slub_debug_argument
- audit_rules_file_deletion_events_rmdir
- sysctl_kernel_perf_event_paranoid
- grub2_vsyscall_argument
- sshd_disable_x11_forwarding
- package_iprutils_removed
- file_groupowner_cron_d
- file_permissions_etc_audit_rulesd
- auditd_freq
- selinux_all_devicefiles_labeled
- package_aide_installed
- file_audit_tools_ownership
- sysctl_net_ipv6_conf_all_accept_redirects
- kernel_module_bluetooth_disabled
- mount_option_var_nodev
- accounts_password_pam_retry
- package_audit_installed
- sysctl_net_ipv4_conf_all_accept_source_route
- file_owner_etc_passwd
- grub2_page_poison_argument
- file_permissions_crontab
- audit_rules_dac_modification_lchown
- audit_rules_privileged_commands_chage
- accounts_password_pam_dcredit
- audit_rules_execution_setfiles
- file_permissions_cron_daily
- accounts_password_all_shadowed_sha512
- service_chronyd_enabled
- postfix_prevent_unrestricted_relay
- accounts_password_pam_difok
- package_rsyslog_installed
- configure_opensc_card_drivers
- accounts_password_minlen_login_defs
- mount_option_nosuid_removable_partitions
- audit_rules_execution_setfacl
- sysctl_net_ipv6_conf_all_accept_ra
- sysctl_net_ipv6_conf_default_accept_redirects
- file_groupowner_backup_etc_shadow
- ensure_redhat_gpgkey_installed
- mount_option_var_log_noexec
- sysctl_kernel_randomize_va_space
- auditd_data_retention_action_mail_acct
- audit_rules_privileged_commands_usermod
- sysctl_net_ipv4_conf_all_log_martians
- disable_ctrlaltdel_reboot
- aide_check_audit_tools
- file_owner_backup_etc_shadow
- audit_rules_privileged_commands_postqueue
- accounts_umask_etc_bashrc
- rsyslog_remote_loghost
- chronyd_specify_remote_server
- agent_mfetpd_running
- partition_for_var_log
- file_permissions_etc_group
- package_sendmail_removed
- file_permissions_cron_monthly
- file_groupowner_etc_passwd
- root_permissions_syslibrary_files
- sshd_enable_pam
- configure_usbguard_auditbackend
- sssd_enable_certmap
- file_permissions_sshd_config
- accounts_password_pam_pwquality_password_auth
- dconf_gnome_lock_screen_on_smartcard_removal
- sshd_x11_use_localhost
- accounts_maximum_age_login_defs
- audit_rules_dac_modification_lsetxattr
- mount_option_tmp_noexec
- file_audit_tools_group_ownership
- accounts_password_pam_lcredit
- audit_rules_privileged_commands_su
- package_gnutls-utils_installed
- audit_rules_privileged_commands_pam_timestamp_check
- accounts_password_pam_enforce_root
- mount_option_var_log_audit_noexec
- package_quagga_removed
- file_groupowner_etc_group
- accounts_password_pam_minlen
- accounts_password_pam_maxclassrepeat
- chronyd_or_ntpd_set_maxpoll
- auditd_audispd_configure_sufficiently_large_partition
- service_autofs_disabled
- accounts_user_dot_no_world_writable_programs
- sudo_remove_no_authenticate
- configure_openssl_crypto_policy
- aide_verify_ext_attributes
- dconf_gnome_screensaver_lock_delay
- partition_for_var_log_audit
- service_auditd_enabled
- auditd_name_format
- service_sshd_enabled
- audit_rules_suid_privilege_function
- dconf_gnome_disable_user_list
- audit_rules_privileged_commands_mount
- set_password_hashing_min_rounds_logindefs
- grub2_password
- dconf_gnome_disable_restart_shutdown
- file_permissions_etc_gshadow
- audit_rules_execution_semanage
- chronyd_client_only
- mount_option_home_nosuid
- file_owner_var_log
- package_tmux_installed
- accounts_password_pam_pwquality_system_auth
- audit_rules_privileged_commands_unix_update
- package_chrony_installed
- accounts_passwords_pam_faillock_deny_root
- grub2_audit_backlog_limit_argument
- sshd_enable_pubkey_auth
- file_groupowner_cron_hourly
- sysctl_fs_protected_symlinks
- audit_rules_dac_modification_fsetxattr
- account_password_selinux_faillock_dir
- file_permissions_backup_etc_passwd
- package_vsftpd_removed
- auditd_log_format
- sysctl_fs_protected_hardlinks
- file_permissions_ungroupowned
- coredump_disable_storage
- rsyslog_encrypt_offload_actionsendstreamdriverauthmode
- accounts_umask_etc_profile
- sudo_remove_nopasswd
- libreswan_approved_tunnels
- sysctl_net_ipv4_conf_all_send_redirects
- sshd_disable_root_login
- grub2_disable_interactive_boot
- sysctl_kernel_kptr_restrict
- disable_ctrlaltdel_burstaction
- audit_rules_privileged_commands_userhelper
- audit_rules_privileged_commands_sudo
- kernel_module_usb-storage_disabled
- rsyslog_encrypt_offload_defaultnetstreamdriver
- audit_rules_privileged_commands_ssh_agent
- no_files_unowned_by_user
- configure_openssl_tls_crypto_policy
- kernel_module_can_disabled
- partition_for_tmp
- audit_rules_dac_modification_chmod
- file_groupowner_cron_daily
- rsyslog_nolisten
- accounts_umask_etc_login_defs
- harden_sshd_ciphers_opensshserver_conf_crypto_policy
- gnome_gdm_disable_automatic_login
- package_policycoreutils-python-utils_installed
- tftpd_uses_secure_mode
- audit_privileged_commands_reboot
- wireless_disable_interfaces
- chronyd_no_chronyc_network
- file_permissions_cron_weekly
- set_password_hashing_algorithm_logindefs
- mount_option_noexec_remote_filesystems
- dconf_gnome_screensaver_idle_delay
- file_groupowner_grub2_cfg
- no_host_based_files
- aide_verify_acls
- aide_scan_notification
- file_permissions_backup_etc_shadow
- no_shelllogin_for_systemaccounts
- sssd_has_trust_anchor
- mount_option_krb_sec_remote_filesystems
- sysctl_net_ipv4_conf_default_log_martians
- mount_option_home_noexec
- network_configure_name_resolution
- package_subscription-manager_installed
- file_owner_grub2_cfg
- sshd_disable_user_known_hosts
- accounts_password_pam_minclass
- mount_option_nosuid_remote_filesystems
- sssd_enable_smartcards
- sysctl_net_ipv4_conf_default_send_redirects
- audit_rules_execution_chacl
- banner_etc_issue
- sshd_set_keepalive
- sysctl_net_ipv4_conf_default_accept_source_route
- configure_crypto_policy
- auditd_data_retention_max_log_file_action_stig
- mount_option_var_log_nodev
- audit_rules_privileged_commands_gpasswd
- file_permissions_sshd_pub_key
- audit_rules_file_deletion_events_unlinkat
- require_singleuser_auth
- audit_rules_kernel_module_loading_finit
- package_sudo_installed
- sshd_do_not_permit_user_env
- coredump_disable_backtraces
- sysctl_net_ipv4_conf_all_forwarding
- ensure_gpgcheck_local_packages
- file_owner_etc_group
- mount_option_boot_efi_nosuid
- file_groupowner_cron_monthly
- sysctl_kernel_dmesg_restrict
- sshd_enable_warning_banner
- sshd_use_priv_separation
- audit_privileged_commands_init
- enable_fips_mode
- audit_rules_dac_modification_lremovexattr
- audit_rules_dac_modification_umount
- file_groupowner_backup_etc_group
- accounts_password_set_max_life_existing
- file_permissions_home_directories
- accounts_umask_etc_csh_cshrc
- file_groupowner_var_log
- sssd_offline_cred_expiration
- file_permissions_etc_audit_auditd
- audit_rules_dac_modification_removexattr
- mount_option_boot_nodev
- encrypt_partitions
- audit_rules_sudoers
- accounts_password_pam_pwhistory_remember_system_auth
- install_smartcard_packages
- file_permissions_cron_d
- no_empty_passwords_etc_shadow
- sysctl_net_ipv4_tcp_syncookies
- networkmanager_dns_mode
- accounts_user_home_paths_only
- dconf_gnome_banner_enabled
- auditd_data_retention_space_left_percentage
- network_sniffer_disabled
- sysctl_net_ipv4_conf_default_rp_filter
- kernel_module_firewire-core_disabled
- ensure_gpgcheck_never_disabled
- accounts_minimum_age_login_defs
- mount_option_tmp_nosuid
- partition_for_home
- accounts_no_uid_except_zero
- audit_rules_privileged_commands_passwd
- kernel_module_atm_disabled
- package_mcafeetp_installed
- file_ownership_library_dirs
- auditd_audispd_syslog_plugin_activated
- dconf_db_up_to_date
- partition_for_var
- configure_bind_crypto_policy
- auditd_overflow_action
- file_owner_sshd_config
- package_rsyslog-gnutls_installed
- auditd_data_disk_full_action_stig
- audit_rules_sudoers_d
- installed_OS_is_vendor_supported
- configure_kerberos_crypto_policy
- gid_passwd_group_same
- accounts_password_pam_maxrepeat
- dir_ownership_library_dirs
- sshd_set_loglevel_verbose
- sysctl_net_ipv6_conf_default_accept_source_route
- auditd_data_retention_admin_space_left_percentage
- file_permissions_sshd_private_key
- file_owner_var_log_messages
- audit_rules_privileged_commands_kmod
- sudoers_validate_passwd
- audit_rules_privileged_commands_crontab
- kernel_module_tipc_disabled
- file_ownership_binary_dirs
- audit_rules_dac_modification_setxattr
- audit_rules_usergroup_modification_gshadow
- audit_rules_privileged_commands_umount
- file_groupowner_backup_etc_gshadow
- kernel_module_cramfs_disabled
- package_usbguard_installed
- mount_option_boot_nosuid
- audit_rules_login_events_lastlog
- grub2_admin_username
- dconf_gnome_disable_automount_open
- package_ypserv_removed
- aide_periodic_cron_checking
- mount_option_var_log_audit_nodev
- package_libreswan_installed
- audit_rules_file_deletion_events_unlink
- sysctl_net_ipv4_conf_all_rp_filter
- account_unique_id
- accounts_password_pam_unix_rounds_password_auth
- sysctl_kernel_yama_ptrace_scope
- service_firewalld_enabled
- disallow_bypass_password_sudo
- require_emergency_target_auth
- file_permissions_etc_shadow
- sysctl_net_core_bpf_jit_harden
- accounts_user_interactive_home_directory_exists
- usbguard_generate_policy
- audit_rules_privileged_commands_unix_chkpwd
- accounts_password_pam_unix_rounds_system_auth
- file_permissions_etc_passwd
- file_groupowner_sshd_config
- group_unique_id
- mount_option_tmp_nodev
- auditd_data_disk_error_action_stig
- package_firewalld_installed
- file_permissions_library_dirs
- accounts_password_set_min_life_existing
- selinux_state
- accounts_umask_interactive_users
- set_password_hashing_algorithm_passwordauth
- file_owner_backup_etc_gshadow
- sudo_restrict_privilege_elevation_to_authorized
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- var_system_crypto_policy=fips
- var_auditd_freq=100
- var_auditd_action_mail_acct=root
- var_auditd_name_format=stig
- var_auditd_max_log_file_action=rotate
- var_auditd_admin_space_left_action=single
- var_auditd_admin_space_left_percentage=5pc
- var_auditd_space_left_action=email
- var_auditd_space_left_percentage=25pc
- var_auditd_disk_full_action=halt
- var_auditd_disk_error_action=halt
- var_sssd_certificate_verification_digest_function=sha512
- var_smartcard_drivers=cac
- var_password_hashing_algorithm=SHA512
- var_password_pam_minclass=4
- var_password_pam_maxrepeat=3
- var_password_pam_maxclassrepeat=4
- var_password_pam_difok=8
- var_password_pam_ucredit=1
- var_password_pam_dictcheck=1
- var_password_pam_ocredit=1
- var_password_pam_minlen=15
- var_accounts_minimum_age_login_defs=1
- var_password_pam_dcredit=1
- var_password_pam_lcredit=1
- var_password_pam_unix_rounds=5000
- var_password_pam_remember=5
- var_password_pam_remember_control_flag=requisite_or_required
- var_password_pam_retry=3
- var_selinux_policy_name=targeted
- var_selinux_state=enforcing
- var_logind_session_timeout=15_minutes
- var_accounts_fail_delay=4
- var_accounts_max_concurrent_login_sessions=10
- var_accounts_authorized_local_users_regex=rhel9
- var_accounts_passwords_pam_faillock_unlock_time=never
- var_accounts_passwords_pam_faillock_fail_interval=900
- var_accounts_passwords_pam_faillock_deny=3
- var_account_disable_post_pw_expiration=35
- var_accounts_user_umask=077
- var_accounts_maximum_age_login_defs=60
- var_sshd_disable_compression=no
- sshd_idle_timeout_value=10_minutes
- var_sshd_set_keepalive=1
- var_rekey_limit_size=1G
- var_rekey_limit_time=1hour
- sshd_approved_ciphers=stig_extended
- var_networkmanager_dns_mode=none
- var_multiple_time_servers=stig
- var_time_service_set_maxpoll=18_hours
- login_banner_text=dod_banners
- var_authselect_profile=sssd
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies: []
title: DISA STIG with GUI for Red Hat Enterprise Linux 9
documentation_complete: true
