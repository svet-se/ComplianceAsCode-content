documentation_complete: true

metadata:
    version: V3R14
    SMEs:
        - ggbecker

reference: https://public.cyber.mil/stigs/downloads/?_dl_facet_stigs=operating-systems%2Cunix-linux

title: 'DISA STIG for Red Hat Enterprise Linux 7'

description: |-
    This profile contains configuration checks that align to the
    DISA STIG for Red Hat Enterprise Linux V3R14.

    In addition to being applicable to Red Hat Enterprise Linux 7, DISA recognizes this
    configuration baseline as applicable to the operating system tier of
    Red Hat technologies that are based on Red Hat Enterprise Linux 7, such as:

    - Red Hat Enterprise Linux Server
    - Red Hat Enterprise Linux Workstation and Desktop
    - Red Hat Enterprise Linux for HPC
    - Red Hat Storage
    - Red Hat Containers with a Red Hat Enterprise Linux 7 image

selections:
    - login_banner_text=dod_banners
    - inactivity_timeout_value=15_minutes
    - var_screensaver_lock_delay=5_seconds
    - sshd_idle_timeout_value=10_minutes
    - var_accounts_fail_delay=4
    - var_selinux_state=enforcing
    - var_selinux_policy_name=targeted
    - var_password_pam_minlen=15
    - var_password_pam_ocredit=1
    - var_password_pam_lcredit=1
    - var_password_pam_ucredit=1
    - var_accounts_passwords_pam_faillock_unlock_time=never
    - var_accounts_passwords_pam_faillock_fail_interval=900
    - var_accounts_passwords_pam_faillock_deny=3
    - var_password_pam_unix_remember=5
    - var_password_pam_maxclassrepeat=4
    - var_password_pam_difok=8
    - var_password_pam_dcredit=1
    - var_password_pam_minclass=4
    - var_accounts_minimum_age_login_defs=1
    - var_password_pam_maxrepeat=3
    - var_accounts_maximum_age_login_defs=60
    - var_account_disable_post_pw_expiration=35
    - var_removable_partition=dev_cdrom
    - var_auditd_action_mail_acct=root
    - var_auditd_space_left_action=email
    - var_auditd_space_left_percentage=25pc
    - var_accounts_user_umask=077
    - var_password_pam_retry=3
    - var_accounts_max_concurrent_login_sessions=10
    - var_accounts_tmout=15_min
    - var_accounts_authorized_local_users_regex=rhel7
    - var_time_service_set_maxpoll=18_hours
    - sysctl_net_ipv4_conf_all_accept_source_route_value=disabled
    - sysctl_net_ipv4_conf_default_accept_source_route_value=disabled
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts_value=enabled
    - sysctl_net_ipv4_conf_default_accept_redirects_value=disabled
    - sysctl_net_ipv6_conf_all_accept_source_route_value=disabled
    - sysctl_net_ipv4_conf_all_accept_redirects_value=disabled
    - rpm_verify_permissions
    - rpm_verify_ownership
    - rpm_verify_hashes
    - dconf_db_up_to_date
    - dconf_gnome_banner_enabled
    - dconf_gnome_login_banner_text
    - banner_etc_issue
    - dconf_gnome_screensaver_lock_enabled
    - dconf_gnome_screensaver_lock_locked
    - dconf_gnome_enable_smartcard_auth
    - dconf_gnome_screensaver_idle_delay
    - dconf_gnome_screensaver_idle_activation_enabled
    - dconf_gnome_screensaver_idle_activation_locked
    - dconf_gnome_screensaver_lock_delay
    - dconf_gnome_disable_ctrlaltdel_reboot
    - dconf_gnome_disable_automount
    - dconf_gnome_disable_automount_open
    - dconf_gnome_disable_autorun
    - accounts_password_pam_ucredit
    - accounts_password_pam_lcredit
    - accounts_password_pam_dcredit
    - accounts_password_pam_ocredit
    - accounts_password_pam_difok
    - accounts_password_pam_minclass
    - accounts_password_pam_maxrepeat
    - accounts_password_pam_maxclassrepeat
    - set_password_hashing_algorithm_systemauth
    - set_password_hashing_algorithm_passwordauth
    - set_password_hashing_algorithm_logindefs
    - set_password_hashing_algorithm_libuserconf
    - accounts_minimum_age_login_defs
    - accounts_password_set_min_life_existing
    - accounts_maximum_age_login_defs
    - accounts_password_set_max_life_existing
    - accounts_password_pam_pwhistory_remember_password_auth
    - accounts_password_pam_pwhistory_remember_system_auth
    - accounts_password_pam_minlen
    - no_empty_passwords
    - sshd_disable_empty_passwords
    - account_disable_post_pw_expiration
    - accounts_passwords_pam_faillock_unlock_time
    - accounts_passwords_pam_faillock_interval
    - accounts_passwords_pam_faillock_deny
    - accounts_passwords_pam_faillock_deny_root
    - sudo_remove_nopasswd
    - sudo_restrict_privilege_elevation_to_authorized
    - sudo_remove_no_authenticate
    - sudo_require_reauthentication
    - sudoers_validate_passwd
    - accounts_logon_fail_delay
    - gnome_gdm_disable_automatic_login
    - gnome_gdm_disable_guest_login
    - sshd_do_not_permit_user_env
    - disable_host_auth
    - grub2_admin_username
    - grub2_password
    - require_singleuser_auth
    - grub2_uefi_admin_username
    - grub2_uefi_password
    - smartcard_auth
    - package_rsh-server_removed
    - package_ypserv_removed
    - selinux_user_login_roles
    - package_aide_installed
    - aide_build_database
    - aide_periodic_cron_checking
    - aide_scan_notification
    - ensure_gpgcheck_globally_activated
    - ensure_gpgcheck_local_packages
    - kernel_module_usb-storage_disabled
    - kernel_module_dccp_disabled
    - service_autofs_disabled
    - clean_components_post_updating
    - selinux_state
    - selinux_policytype
    - disable_ctrlaltdel_reboot
    - accounts_umask_etc_login_defs
    - installed_OS_is_vendor_supported
    - security_patches_up_to_date
    - gid_passwd_group_same
    - accounts_no_uid_except_zero
    - no_files_unowned_by_user
    - file_permissions_ungroupowned
    - accounts_have_homedir_login_defs
    - accounts_user_interactive_home_directory_exists
    - file_permissions_home_directories
    - file_ownership_home_directories
    - file_groupownership_home_directories
    - accounts_users_home_files_ownership
    - accounts_users_home_files_groupownership
    - accounts_users_home_files_permissions
    - accounts_user_dot_user_ownership
    - accounts_user_dot_group_ownership
    - file_permission_user_init_files
    - accounts_user_home_paths_only
    - accounts_user_dot_no_world_writable_programs
    - selinux_all_devicefiles_labeled
    - mount_option_home_nosuid
    - mount_option_nosuid_removable_partitions
    - mount_option_nosuid_remote_filesystems
    - dir_perms_world_writable_system_owned
    - dir_perms_world_writable_system_owned_group
    - accounts_umask_interactive_users
    - rsyslog_cron_logging
    - file_owner_cron_allow
    - file_groupowner_cron_allow
    - service_kdump_disabled
    - partition_for_home
    - partition_for_var
    - partition_for_var_log_audit
    - partition_for_tmp
    - grub2_enable_fips_mode
    - aide_verify_acls
    - aide_verify_ext_attributes
    - aide_use_fips_hashes
    - grub2_no_removeable_media
    - uefi_no_removeable_media
    - package_telnet-server_removed
    - service_auditd_enabled
    - audit_rules_system_shutdown
    - var_audit_failure_mode=panic
    - auditd_audispd_configure_remote_server
    - auditd_audispd_encrypt_sent_records
    - auditd_audispd_disk_full_action
    - auditd_audispd_remote_daemon_activated
    - auditd_audispd_remote_daemon_direction
    - auditd_audispd_remote_daemon_path
    - auditd_audispd_remote_daemon_type
    - auditd_data_retention_space_left_action
    - auditd_data_retention_space_left_percentage
    - auditd_data_retention_action_mail_acct
    - audit_rules_suid_privilege_function
    - audit_rules_dac_modification_chown
    - audit_rules_dac_modification_fchown
    - audit_rules_dac_modification_lchown
    - audit_rules_dac_modification_fchownat
    - audit_rules_dac_modification_chmod
    - audit_rules_dac_modification_fchmod
    - audit_rules_dac_modification_fchmodat
    - audit_rules_dac_modification_setxattr
    - audit_rules_dac_modification_fsetxattr
    - audit_rules_dac_modification_lsetxattr
    - audit_rules_dac_modification_removexattr
    - audit_rules_dac_modification_fremovexattr
    - audit_rules_dac_modification_lremovexattr
    - audit_rules_unsuccessful_file_modification_creat
    - audit_rules_unsuccessful_file_modification_open
    - audit_rules_unsuccessful_file_modification_openat
    - audit_rules_unsuccessful_file_modification_open_by_handle_at
    - audit_rules_unsuccessful_file_modification_truncate
    - audit_rules_unsuccessful_file_modification_ftruncate
    - audit_rules_execution_semanage
    - audit_rules_execution_setsebool
    - audit_rules_execution_chcon
    - audit_rules_execution_setfiles
    - audit_rules_login_events_faillock
    - var_accounts_passwords_pam_faillock_dir=run
    - audit_rules_login_events_lastlog
    - audit_rules_privileged_commands_passwd
    - audit_rules_privileged_commands_unix_chkpwd
    - audit_rules_privileged_commands_gpasswd
    - audit_rules_privileged_commands_chage
    - audit_rules_privileged_commands_userhelper
    - audit_rules_privileged_commands_su
    - audit_rules_privileged_commands_sudo
    - audit_rules_sysadmin_actions
    - audit_rules_privileged_commands_newgrp
    - audit_rules_privileged_commands_chsh
    - audit_rules_media_export
    - audit_rules_privileged_commands_umount
    - audit_rules_privileged_commands_postdrop
    - audit_rules_privileged_commands_postqueue
    - audit_rules_privileged_commands_ssh_keysign
    - audit_rules_privileged_commands_crontab
    - audit_rules_privileged_commands_kmod
    - audit_rules_privileged_commands_pam_timestamp_check
    - audit_rules_kernel_module_loading_init
    - audit_rules_kernel_module_loading_finit
    - audit_rules_kernel_module_loading_delete
    - audit_rules_usergroup_modification_passwd
    - audit_rules_file_deletion_events_rename
    - audit_rules_file_deletion_events_renameat
    - audit_rules_file_deletion_events_rmdir
    - audit_rules_file_deletion_events_unlink
    - audit_rules_file_deletion_events_unlinkat
    - rsyslog_remote_loghost
    - rsyslog_nolisten
    - install_antivirus
    - accounts_max_concurrent_login_sessions
    - configure_firewalld_ports
    - sshd_use_approved_ciphers_ordered_stig
    - sshd_use_approved_kex_ordered_stig
    - accounts_tmout
    - sshd_enable_warning_banner
    - sssd_ldap_start_tls
    - sssd_ldap_start_tls.severity=medium
    - sssd_ldap_configure_tls_ca_dir
    - sssd_ldap_configure_tls_ca
    - sssd_ldap_configure_tls_reqcert
    - sysctl_kernel_randomize_va_space
    - package_openssh-server_installed
    - sshd_required=yes
    - service_sshd_enabled
    - sshd_set_idle_timeout
    - sshd_disable_rhosts
    - sshd_disable_rhosts_rsa
    - var_sshd_set_keepalive=0
    - sshd_set_keepalive_0
    - sshd_print_last_log
    - sshd_disable_root_login
    - sshd_allow_only_protocol2
    - sshd_use_approved_macs_ordered_stig
    - file_permissions_sshd_pub_key
    - file_permissions_sshd_private_key
    - sshd_disable_gssapi_auth
    - sshd_disable_kerb_auth
    - sshd_enable_strictmodes
    - sshd_use_priv_separation
    - sshd_disable_compression
    - sshd_disable_user_known_hosts
    - chronyd_or_ntpd_set_maxpoll
    - service_firewalld_enabled
    - display_login_attempts
    - no_user_host_based_files
    - no_host_based_files
    - network_configure_name_resolution
    - sysctl_net_ipv4_conf_all_accept_source_route
    - sysctl_net_ipv4_conf_default_accept_source_route
    - sysctl_net_ipv4_icmp_echo_ignore_broadcasts
    - sysctl_net_ipv4_conf_default_accept_redirects
    - sysctl_net_ipv4_conf_default_send_redirects
    - sysctl_net_ipv4_conf_all_send_redirects
    - network_sniffer_disabled
    - postfix_prevent_unrestricted_relay
    - package_vsftpd_removed
    - package_tftp-server_removed
    - sshd_disable_x11_forwarding
    - sshd_x11_use_localhost
    - tftpd_uses_secure_mode
    - xwindows_remove_packages
    - sysctl_net_ipv4_ip_forward
    - mount_option_krb_sec_remote_filesystems
    - snmpd_not_default_password
    - set_firewalld_default_zone
    - libreswan_approved_tunnels
    - sysctl_net_ipv6_conf_all_accept_source_route
    - install_smartcard_packages
    - sssd_enable_pam_services
    - smartcard_configure_cert_checking
    - dconf_gnome_screensaver_user_locks
    - dconf_gnome_session_idle_user_locks
    - accounts_password_pam_retry
    - mount_option_noexec_remote_filesystems
    - auditd_audispd_network_failure_action
    - audit_rules_usergroup_modification_group
    - audit_rules_usergroup_modification_gshadow
    - audit_rules_usergroup_modification_shadow
    - audit_rules_usergroup_modification_opasswd
    - sysctl_net_ipv4_conf_all_accept_redirects
    - wireless_disable_interfaces
    - mount_option_dev_shm_nodev
    - mount_option_dev_shm_noexec
    - mount_option_dev_shm_nosuid
    - audit_rules_privileged_commands_mount
    - file_ownership_var_log_audit
    - file_permissions_var_log_audit
    - sysctl_net_ipv4_conf_all_rp_filter
    - sysctl_net_ipv4_conf_default_rp_filter
    - package_mcafeetp_installed
    - agent_mfetpd_running
    - accounts_authorized_local_users
    - auditd_overflow_action
    - auditd_name_format
    - var_auditd_name_format=stig
    - sebool_ssh_sysadm_login
    - sudoers_default_includedir
    - package_aide_installed
    - selinux_context_elevation_for_sudo
    - audit_rules_kernel_module_loading_create
    - account_temp_expire_date
    - package_screen_installed
    - sysctl_kernel_dmesg_restrict
    - aide_build_database
    - authconfig_config_files_symlinks
    - no_empty_passwords_etc_shadow
    - disallow_bypass_password_sudo
    - selinux_confine_to_least_privilege
    - ensure_redhat_gpgkey_installed
    - dconf_gnome_disable_user_list
    - package_mailx_installed
