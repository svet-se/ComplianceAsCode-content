documentation_complete: true

title: 'Sample Security Profile for OpenEmbedded Distros'

description: |-
    This profile is an sample for use in documentation and example content.
    The selected rules are standard and should pass quickly on most systems.

selections:
    - file_owner_etc_passwd
    - file_groupowner_etc_passwd
    - service_crond_enabled
    - file_groupowner_crontab
    - file_owner_crontab
    - file_permissions_crontab
    - file_groupowner_cron_hourly
    - file_owner_cron_hourly
    - file_permissions_cron_hourly
    - file_groupowner_cron_daily
    - file_owner_cron_daily
    - file_permissions_cron_daily
    - file_groupowner_cron_weekly
    - file_owner_cron_weekly
    - file_permissions_cron_weekly
    - file_groupowner_cron_monthly
    - file_owner_cron_monthly
    - file_permissions_cron_monthly
    - file_groupowner_cron_d
    - file_owner_cron_d
    - file_permissions_cron_d
    - file_groupowner_cron_allow
    - file_owner_cron_allow
    - file_cron_deny_not_exist
    - file_groupowner_at_allow
    - file_owner_at_allow
    - file_at_deny_not_exist
    - file_permissions_at_allow
    - file_permissions_cron_allow
    - file_groupowner_sshd_config
    - file_owner_sshd_config
    - file_permissions_sshd_config
    - file_permissions_sshd_private_key
    - file_permissions_sshd_pub_key
    - sshd_set_loglevel_verbose
    - sshd_set_loglevel_info
    - sshd_max_auth_tries_value=4
    - sshd_set_max_auth_tries
    - sshd_disable_rhosts
    - disable_host_auth
    - sshd_disable_root_login
    - sshd_disable_empty_passwords
    - sshd_do_not_permit_user_env
    - sshd_idle_timeout_value=15_minutes
    - sshd_set_idle_timeout
    - sshd_set_keepalive
    - var_sshd_set_keepalive=0
    - sshd_set_login_grace_time
    - var_sshd_set_login_grace_time=60
    - sshd_enable_warning_banner
    - sshd_enable_pam
    - sshd_set_maxstartups
    - var_sshd_set_maxstartups=10:30:60
    - sshd_set_max_sessions
    - var_sshd_max_sessions=10
    - accounts_password_pam_minclass
    - accounts_password_pam_minlen
    - accounts_password_pam_retry
    - var_password_pam_minclass=4
    - var_password_pam_minlen=14
    - accounts_password_pam_pwhistory_remember_password_auth
    - accounts_password_pam_pwhistory_remember_system_auth
    - var_password_pam_remember_control_flag=required
    - var_password_pam_remember=5
    - set_password_hashing_algorithm_systemauth
    - var_accounts_maximum_age_login_defs=365
    - accounts_password_set_max_life_existing
    - var_accounts_minimum_age_login_defs=7
    - accounts_password_set_min_life_existing
    - var_accounts_password_warn_age_login_defs=7
    - account_disable_post_pw_expiration
    - var_account_disable_post_pw_expiration=30
    - no_shelllogin_for_systemaccounts
    - accounts_tmout
    - var_accounts_tmout=15_min
    - accounts_root_gid_zero
    - accounts_umask_etc_bashrc
    - use_pam_wheel_for_su
    - sshd_allow_only_protocol2
    - journald_forward_to_syslog
    - journald_compress
    - journald_storage
    - service_auditd_enabled
    - service_httpd_disabled
    - service_vsftpd_disabled
    - service_named_disabled
    - service_nfs_disabled
    - service_rpcbind_disabled
    - service_slapd_disabled
    - service_dhcpd_disabled
    - service_cups_disabled
    - service_ypserv_disabled
    - service_rsyncd_disabled
    - service_avahi-daemon_disabled
    - service_snmpd_disabled
    - service_squid_disabled
    - service_smb_disabled
    - service_dovecot_disabled
    - banner_etc_motd
    - login_banner_text=cis_banners
    - banner_etc_issue
    - login_banner_text=cis_banners
    - file_groupowner_etc_motd
    - file_owner_etc_motd
    - file_permissions_etc_motd
    - file_groupowner_etc_issue
    - file_owner_etc_issue
    - file_permissions_etc_issue
    - ensure_gpgcheck_globally_activated
    - package_aide_installed
    - aide_periodic_cron_checking
    - grub2_password
    - file_groupowner_grub2_cfg
    - file_owner_grub2_cfg
    - file_permissions_grub2_cfg
    - require_singleuser_auth
    - require_emergency_target_auth
    - disable_users_coredumps
    - configure_crypto_policy
    - var_system_crypto_policy=default_policy
    - dir_perms_world_writable_sticky_bits
    - file_permissions_etc_passwd
    - file_owner_etc_shadow
    - file_groupowner_etc_shadow
    - file_groupowner_etc_group
    - file_owner_etc_group
    - file_permissions_etc_group
    - file_groupowner_etc_gshadow
    - file_owner_etc_gshadow
    - file_groupowner_backup_etc_passwd
    - file_owner_backup_etc_passwd
    - file_permissions_backup_etc_passwd
    - file_groupowner_backup_etc_shadow
    - file_owner_backup_etc_shadow
    - file_permissions_backup_etc_shadow
    - file_groupowner_backup_etc_group
    - file_owner_backup_etc_group
    - file_permissions_backup_etc_group
    - file_groupowner_backup_etc_gshadow
    - file_owner_backup_etc_gshadow
    - file_permissions_unauthorized_world_writable
    - file_permissions_ungroupowned
    - accounts_root_path_dirs_no_write
    - root_path_no_dot
    - accounts_no_uid_except_zero
    - file_ownership_home_directories
    - file_groupownership_home_directories
    - no_netrc_files
    - no_rsh_trust_files
    - account_unique_id
    - group_unique_id
    - group_unique_name
    - wireless_disable_interfaces
    - package_firewalld_installed
    - service_firewalld_enabled
    - package_iptables_installed
