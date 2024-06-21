description: 'This profile contains configuration checks that align to the

    DISA STIG with GUI for Red Hat Enterprise Linux 8 V1R13.


    In addition to being applicable to Red Hat Enterprise Linux 8, DISA recognizes
    this

    configuration baseline as applicable to the operating system tier of

    Red Hat technologies that are based on Red Hat Enterprise Linux 8, such as:


    - Red Hat Enterprise Linux Server

    - Red Hat Enterprise Linux Workstation and Desktop

    - Red Hat Enterprise Linux for HPC

    - Red Hat Storage

    - Red Hat Containers with a Red Hat Enterprise Linux 8 image


    Warning: The installation and use of a Graphical User Interface (GUI)

    increases your attack vector and decreases your overall security posture. If

    your Information Systems Security Officer (ISSO) lacks a documented operational

    requirement for a graphical user interface, please consider using the

    standard DISA STIG for Red Hat Enterprise Linux 8 profile.'
extends: null
hidden: ''
metadata:
    version: V1R13
    SMEs:
    - mab879
    - ggbecker
reference: https://public.cyber.mil/stigs/downloads/?_dl_facet_stigs=operating-systems%2Cunix-linux
selections:
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- service_rngd_enabled
- sshd_set_idle_timeout
- accounts_maximum_age_login_defs
- postfix_prevent_unrestricted_relay
- file_permissions_var_log_messages
- accounts_password_pam_maxrepeat
- account_password_pam_faillock_password_auth
- accounts_password_pam_maxclassrepeat
- mount_option_tmp_nodev
- rsyslog_remote_loghost
- package_krb5-workstation_removed
- selinux_policytype
- file_ownership_var_log_audit_stig
- audit_rules_dac_modification_fremovexattr
- audit_rules_unsuccessful_file_modification_creat
- file_groupownership_system_commands_dirs
- file_ownership_binary_dirs
- accounts_passwords_pam_faillock_dir
- audit_rules_execution_semanage
- accounts_password_pam_pwhistory_remember_password_auth
- sysctl_net_core_bpf_jit_harden
- mount_option_boot_nosuid
- audit_rules_usergroup_modification_group
- kernel_module_atm_disabled
- audit_rules_unsuccessful_file_modification_open
- file_permission_user_init_files_root
- configure_ssh_crypto_policy
- dir_ownership_library_dirs
- package_rsyslog_installed
- accounts_logon_fail_delay
- file_audit_tools_group_ownership
- audit_rules_media_export
- package_firewalld_installed
- package_usbguard_installed
- accounts_password_pam_dcredit
- dconf_gnome_disable_ctrlaltdel_reboot
- mount_option_var_tmp_nodev
- audit_rules_privileged_commands_unix_chkpwd
- partition_for_home
- sysctl_net_ipv4_conf_default_send_redirects
- mount_option_nodev_remote_filesystems
- package_tuned_removed
- mount_option_tmp_nosuid
- service_systemd-coredump_disabled
- mount_option_nodev_removable_partitions
- accounts_passwords_pam_faillock_interval
- partition_for_var_tmp
- sshd_disable_root_login
- root_permissions_syslibrary_files
- enable_dracut_fips_module
- aide_verify_acls
- mount_option_dev_shm_nodev
- package_gssproxy_removed
- chronyd_server_directive
- audit_rules_file_deletion_events_rmdir
- file_permissions_etc_audit_auditd
- sudoers_default_includedir
- package_postfix_installed
- set_password_hashing_algorithm_logindefs
- grub2_uefi_admin_username
- auditd_name_format
- sudo_restrict_privilege_elevation_to_authorized
- rsyslog_encrypt_offload_defaultnetstreamdriver
- account_unique_id
- sysctl_kernel_dmesg_restrict
- sshd_disable_user_known_hosts
- package_vsftpd_removed
- sysctl_fs_protected_symlinks
- mount_option_boot_efi_nosuid
- display_login_attempts
- package_tmux_installed
- package_policycoreutils_installed
- file_audit_tools_permissions
- audit_rules_privileged_commands_mount
- file_groupownership_home_directories
- mount_option_var_log_nodev
- agent_mfetpd_running
- audit_rules_immutable_login_uids
- accounts_passwords_pam_faillock_deny
- configure_openssl_tls_crypto_policy
- mount_option_var_log_audit_nosuid
- file_permissions_var_log
- audit_rules_usergroup_modification_passwd
- kernel_module_usb-storage_disabled
- mount_option_noexec_remote_filesystems
- grub2_admin_username
- grub2_audit_argument
- file_groupowner_var_log_messages
- configure_tmux_lock_command
- mount_option_home_nosuid
- no_tmux_in_shells
- audit_rules_sudoers_d
- audit_rules_privileged_commands_chage
- audit_rules_privileged_commands_umount
- service_auditd_enabled
- mount_option_var_tmp_noexec
- auditd_data_disk_full_action
- mount_option_home_noexec
- audit_rules_privileged_commands_ssh_keysign
- sshd_set_keepalive
- mount_option_dev_shm_noexec
- audit_rules_immutable
- sshd_disable_x11_forwarding
- enable_authselect
- sysctl_kernel_yama_ptrace_scope
- audit_rules_privileged_commands_sudo
- audit_rules_login_events_faillock
- partition_for_var_log_audit
- audit_rules_dac_modification_chown
- harden_sshd_macs_openssh_conf_crypto_policy
- sysctl_crypto_fips_enabled
- package_tftp-server_removed
- audit_rules_usergroup_modification_opasswd
- configure_bind_crypto_policy
- accounts_password_pam_pwhistory_remember_system_auth
- accounts_user_interactive_home_directory_exists
- coredump_disable_storage
- sudo_remove_nopasswd
- accounts_umask_etc_login_defs
- ssh_keys_passphrase_protected
- directory_group_ownership_var_log_audit
- configure_gnutls_tls_crypto_policy
- audit_rules_login_events_lastlog
- dir_group_ownership_library_dirs
- disable_users_coredumps
- auditd_audispd_configure_sufficiently_large_partition
- accounts_user_home_paths_only
- grub2_audit_backlog_limit_argument
- service_sshd_enabled
- audit_rules_dac_modification_setxattr
- audit_rules_kernel_module_loading_delete
- mount_option_nosuid_remote_filesystems
- package_rsh-server_removed
- package_abrt-addon-ccpp_removed
- enable_fips_mode
- sysctl_fs_protected_hardlinks
- sysctl_net_ipv6_conf_default_accept_redirects
- accounts_minimum_age_login_defs
- no_host_based_files
- partition_for_var_log
- audit_rules_execution_setfacl
- mount_option_noexec_removable_partitions
- kernel_module_cramfs_disabled
- accounts_password_pam_lcredit
- accounts_passwords_pam_faillock_silent
- mount_option_var_log_nosuid
- accounts_umask_interactive_users
- audit_rules_dac_modification_lchown
- no_empty_passwords
- audit_rules_privileged_commands_postdrop
- accounts_umask_etc_profile
- accounts_passwords_pam_faillock_unlock_time
- kernel_module_sctp_disabled
- install_smartcard_packages
- package_mailx_installed
- audit_rules_dac_modification_fchmod
- package_aide_installed
- mount_option_nodev_nonroot_local_partitions
- configured_firewalld_default_deny
- no_empty_passwords_etc_shadow
- kernel_module_bluetooth_disabled
- sysctl_net_ipv6_conf_all_accept_source_route
- file_permissions_library_dirs
- audit_rules_dac_modification_lremovexattr
- package_krb5-server_removed
- mount_option_var_log_audit_nodev
- audit_rules_unsuccessful_file_modification_truncate
- set_password_hashing_min_rounds_logindefs
- accounts_authorized_local_users
- configure_crypto_policy
- gnome_gdm_disable_automatic_login
- service_firewalld_enabled
- sshd_rekey_limit
- chronyd_client_only
- accounts_password_pam_minlen
- package_openssh-server_installed
- service_autofs_disabled
- grub2_vsyscall_argument
- grub2_password
- encrypt_partitions
- audit_rules_dac_modification_fchmodat
- accounts_password_all_shadowed_sha512
- rsyslog_cron_logging
- package_sendmail_removed
- logind_session_timeout
- configure_tmux_lock_after_time
- accounts_password_set_min_life_existing
- audit_rules_file_deletion_events_renameat
- audit_rules_execution_chcon
- dir_permissions_library_dirs
- aide_verify_ext_attributes
- mount_option_var_log_audit_noexec
- accounts_max_concurrent_login_sessions
- dconf_gnome_disable_user_list
- sysctl_net_ipv4_conf_all_accept_redirects
- file_permissions_sshd_pub_key
- package_abrt-addon-kerneloops_removed
- disable_ctrlaltdel_reboot
- sysctl_net_ipv6_conf_default_accept_ra
- network_sniffer_disabled
- auditd_local_events
- kernel_module_firewire-core_disabled
- configure_libreswan_crypto_policy
- wireless_disable_interfaces
- dir_perms_world_writable_root_owned
- audit_rules_privileged_commands_postqueue
- sshd_use_approved_kex_ordered_stig
- sysctl_kernel_unprivileged_bpf_disabled
- accounts_no_uid_except_zero
- sysctl_net_ipv4_conf_all_rp_filter
- configure_bashrc_tmux
- dconf_gnome_lock_screen_on_smartcard_removal
- mount_option_nosuid_removable_partitions
- directory_permissions_var_log_audit
- file_permissions_binary_dirs
- no_user_host_based_files
- file_group_ownership_var_log_audit
- service_debug-shell_disabled
- accounts_passwords_pam_faillock_deny_root
- accounts_password_pam_retry
- network_configure_name_resolution
- auditd_data_retention_action_mail_acct
- sysctl_net_ipv6_conf_all_forwarding
- audit_rules_privileged_commands_crontab
- selinux_state
- audit_rules_privileged_commands_gpasswd
- audit_rules_dac_modification_fchownat
- mount_option_var_log_noexec
- package_mcafeetp_installed
- audit_rules_dac_modification_fchown
- accounts_users_home_files_permissions
- auditd_data_retention_space_left_action
- grub2_pti_argument
- set_password_hashing_algorithm_systemauth
- auditd_data_retention_space_left_percentage
- accounts_password_pam_ucredit
- audit_rules_usergroup_modification_gshadow
- directory_ownership_var_log_audit
- sshd_disable_kerb_auth
- sysctl_net_ipv4_conf_default_accept_redirects
- ensure_gpgcheck_never_disabled
- audit_rules_dac_modification_removexattr
- audit_rules_suid_privilege_function
- kernel_module_uvcvideo_disabled
- accounts_password_set_max_life_existing
- dconf_gnome_banner_enabled
- configure_tmux_lock_keybinding
- file_owner_var_log_messages
- chronyd_no_chronyc_network
- configure_usbguard_auditbackend
- account_password_pam_faillock_system_auth
- audit_rules_dac_modification_lsetxattr
- audit_rules_unsuccessful_file_modification_openat
- coredump_disable_backtraces
- harden_sshd_macs_opensshserver_conf_crypto_policy
- file_owner_var_log
- ensure_gpgcheck_globally_activated
- audit_rules_kernel_module_loading_init
- configure_openssl_crypto_policy
- mount_option_var_tmp_nosuid
- audit_rules_kernel_module_loading_finit
- kerberos_disable_no_keytab
- accounts_password_pam_difok
- sysctl_kernel_kptr_restrict
- auditd_log_format
- accounts_password_pam_minclass
- accounts_password_pam_pwquality_password_auth
- audit_rules_sudoers
- sysctl_net_ipv6_conf_all_accept_ra
- file_audit_tools_ownership
- file_permissions_home_directories
- audit_rules_execution_setsebool
- firewalld-backend
- sudoers_validate_passwd
- dir_perms_world_writable_system_owned_group
- service_usbguard_enabled
- accounts_user_interactive_home_directory_defined
- set_firewalld_default_zone
- accounts_password_minlen_login_defs
- audit_rules_privileged_commands_kmod
- dconf_gnome_screensaver_lock_locked
- sshd_enable_warning_banner
- grub2_uefi_password
- package_python3-abrt-addon_removed
- bios_enable_execution_restrictions
- accounts_users_home_files_groupownership
- sysctl_kernel_randomize_va_space
- sssd_enable_smartcards
- dir_perms_world_writable_sticky_bits
- package_rng-tools_installed
- chronyd_or_ntpd_set_maxpoll
- service_kdump_disabled
- package_abrt-cli_removed
- aide_scan_notification
- file_permissions_ungroupowned
- package_abrt-plugin-sosreport_removed
- dconf_gnome_login_banner_text
- accounts_umask_etc_csh_cshrc
- package_fapolicyd_installed
- package_audit_installed
- fapolicy_default_deny
- audit_rules_privileged_commands_unix_update
- sysctl_net_ipv4_conf_default_accept_source_route
- security_patches_up_to_date
- sudo_require_reauthentication
- file_permissions_etc_audit_rulesd
- audit_rules_privileged_commands_pam_timestamp_check
- dconf_gnome_screensaver_user_locks
- audit_rules_dac_modification_chmod
- audit_rules_execution_setfiles
- mount_option_dev_shm_nosuid
- audit_rules_privileged_commands_passwd
- ensure_gpgcheck_local_packages
- mount_option_tmp_noexec
- account_disable_post_pw_expiration
- set_password_hashing_algorithm_passwordauth
- sshd_disable_empty_passwords
- clean_components_post_updating
- accounts_password_pam_pwquality_system_auth
- accounts_password_pam_ocredit
- audit_rules_execution_chacl
- audit_rules_file_deletion_events_unlinkat
- chronyd_specify_remote_server
- file_ownership_library_dirs
- service_fapolicyd_enabled
- sysctl_kernel_perf_event_paranoid
- sshd_x11_use_localhost
- sshd_print_last_log
- audit_rules_unsuccessful_file_modification_open_by_handle_at
- audit_rules_file_deletion_events_rename
- accounts_passwords_pam_faillock_audit
- postfix_client_configure_mail_alias_postmaster
- sysctl_net_ipv4_conf_all_forwarding
- auditd_overflow_action
- audit_rules_privileged_commands_newgrp
- audit_rules_usergroup_modification_shadow
- aide_check_audit_tools
- dconf_gnome_screensaver_idle_delay
- disable_ctrlaltdel_burstaction
- file_groupowner_var_log
- accounts_umask_etc_bashrc
- sssd_certificate_verification
- usbguard_generate_policy
- sysctl_net_ipv4_conf_all_send_redirects
- package_opensc_installed
- grub2_slub_debug_argument
- configure_firewalld_ports
- file_permissions_var_log_audit
- file_permissions_sshd_private_key
- rsyslog_encrypt_offload_actionsendstreamdrivermode
- accounts_password_pam_dictcheck
- selinux_user_login_roles
- aide_build_database
- sssd_offline_cred_expiration
- kernel_module_tipc_disabled
- harden_sshd_ciphers_opensshserver_conf_crypto_policy
- accounts_user_dot_no_world_writable_programs
- sshd_disable_gssapi_auth
- audit_rules_dac_modification_fsetxattr
- account_temp_expire_date
- installed_OS_is_vendor_supported
- package_iprutils_removed
- rsyslog_remote_access_monitoring
- audit_rules_privileged_commands_userhelper
- audit_rules_privileged_commands_su
- audit_rules_privileged_commands_ssh_agent
- sssd_has_trust_anchor
- service_rsyslog_enabled
- package_rsyslog-gnutls_installed
- require_singleuser_auth
- account_password_selinux_faillock_dir
- sysctl_kernel_kexec_load_disabled
- require_emergency_target_auth
- sshd_enable_strictmodes
- kernel_module_can_disabled
- no_files_unowned_by_user
- sysctl_kernel_core_pattern
- banner_etc_issue
- package_abrt_removed
- disallow_bypass_password_sudo
- configure_kerberos_crypto_policy
- package_libreport-plugin-logger_removed
- sshd_do_not_permit_user_env
- sysctl_net_ipv4_conf_all_accept_source_route
- dconf_gnome_screensaver_lock_delay
- accounts_have_homedir_login_defs
- sysctl_net_ipv6_conf_all_accept_redirects
- audit_rules_unsuccessful_file_modification_ftruncate
- grub2_page_poison_argument
- package_telnet-server_removed
- audit_rules_privileged_commands_chsh
- partition_for_var
- audit_rules_privileged_commands_usermod
- sssd_enable_certmap
- tftpd_uses_secure_mode
- dconf_gnome_session_idle_user_locks
- partition_for_tmp
- sshd_use_strong_rng
- ensure_redhat_gpgkey_installed
- harden_sshd_ciphers_openssh_conf_crypto_policy
- auditd_data_disk_error_action
- rsyslog_encrypt_offload_actionsendstreamdriverauthmode
- sysctl_net_ipv6_conf_default_accept_source_route
- sudo_remove_no_authenticate
- dconf_gnome_screensaver_lock_enabled
- audit_rules_file_deletion_events_unlink
- var_rekey_limit_size=1G
- var_rekey_limit_time=1hour
- var_accounts_user_umask=077
- var_password_pam_difok=8
- var_password_pam_maxrepeat=3
- var_password_hashing_algorithm=SHA512
- var_password_pam_maxclassrepeat=4
- var_password_pam_minclass=4
- var_accounts_minimum_age_login_defs=1
- var_accounts_max_concurrent_login_sessions=10
- var_password_pam_remember=5
- var_password_pam_remember_control_flag=requisite_or_required
- var_selinux_state=enforcing
- var_selinux_policy_name=targeted
- var_password_pam_unix_rounds=5000
- var_password_pam_minlen=15
- var_password_pam_ocredit=1
- var_password_pam_dcredit=1
- var_password_pam_dictcheck=1
- var_password_pam_ucredit=1
- var_password_pam_lcredit=1
- var_password_pam_retry=3
- var_sshd_set_keepalive=1
- sshd_approved_macs=stig_extended
- sshd_approved_ciphers=stig_extended
- sshd_idle_timeout_value=10_minutes
- var_accounts_authorized_local_users_regex=rhel8
- var_accounts_passwords_pam_faillock_deny=3
- var_accounts_passwords_pam_faillock_fail_interval=900
- var_accounts_passwords_pam_faillock_unlock_time=never
- var_ssh_client_rekey_limit_size=1G
- var_ssh_client_rekey_limit_time=1hour
- var_accounts_fail_delay=4
- var_account_disable_post_pw_expiration=35
- var_auditd_action_mail_acct=root
- var_time_service_set_maxpoll=18_hours
- var_accounts_maximum_age_login_defs=60
- var_auditd_space_left_percentage=25pc
- var_auditd_space_left_action=email
- var_auditd_disk_error_action=rhel8
- var_auditd_max_log_file_action=syslog
- var_auditd_disk_full_action=rhel8
- var_sssd_certificate_verification_digest_function=sha1
- login_banner_text=dod_banners
- var_authselect_profile=sssd
- var_multiple_time_servers=stig
- var_system_crypto_policy=fips
- var_sudo_timestamp_timeout=always_prompt
- var_slub_debug_options=P
- var_screensaver_lock_delay=5_seconds
- var_logind_session_timeout=15_minutes
- var_auditd_name_format=stig
- var_user_initialization_files_regex=all_dotfiles
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
policies: []
title: DISA STIG with GUI for Red Hat Enterprise Linux 8
documentation_complete: true
