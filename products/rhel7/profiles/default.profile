documentation_complete: true

hidden: true

title: Default Profile for Red Hat Enterprise Linux 7

description: |-
    This profile contains all the rules that once belonged to the
    rhel7 product via 'prodtype'. This profile won't
    be rendered into an XCCDF Profile entity, nor it will select any
    of these rules by default. The only purpose of this profile
    is to keep a rule in the product's XCCDF Benchmark.

selections:
    - sebool_nfsd_anon_write
    - sebool_squid_connect_any
    - sebool_polipo_connect_all_unreserved
    - audit_rules_successful_file_modification_open_by_handle_at_o_trunc_write
    - mount_option_var_tmp_bind
    - package_subscription-manager_installed
    - sebool_condor_tcp_network_connect
    - rsyslog_encrypt_offload_defaultnetstreamdriver
    - mount_option_home_grpquota
    - sebool_mpd_enable_homedirs
    - auditd_data_retention_max_log_file_action_stig
    - install_mcafee_antivirus
    - httpd_configure_documentroot
    - journald_forward_to_syslog
    - sebool_logwatch_can_network_connect_mail
    - audit_rules_unsuccessful_file_modification_openat_rule_order
    - sebool_mpd_use_nfs
    - sebool_virt_use_sanlock
    - disable_anacron
    - kernel_module_vfat_disabled
    - sebool_puppetagent_manage_all_files
    - sebool_staff_use_svirt
    - audit_rules_successful_file_modification_lsetxattr
    - sebool_daemons_enable_cluster_mode
    - file_groupowner_var_log
    - file_permissions_etc_hosts_deny
    - package_krb5-workstation_removed
    - passwd_system-auth_substack
    - package_samba-common_installed
    - ntpd_configure_restrictions
    - sebool_httpd_enable_cgi
    - accounts_password_pam_pwquality_password_auth
    - xwindows_remove_packages
    - package_iptables-services_removed
    - sebool_httpd_can_network_memcache
    - sebool_git_system_use_nfs
    - sudoers_no_root_target
    - enable_ldap_client
    - sebool_httpd_can_connect_zabbix
    - sebool_samba_portmapper
    - audit_rules_etc_shadow_open
    - sebool_httpd_graceful_shutdown
    - httpd_limit_java_files
    - sebool_ftpd_use_fusefs
    - sebool_unconfined_chrome_sandbox_transition
    - avahi_prevent_port_sharing
    - package_ntpdate_removed
    - sebool_gitosis_can_sendmail
    - set_loopback_traffic
    - configure_firewalld_rate_limiting
    - firewalld_sshd_disabled
    - audit_rules_unsuccessful_file_modification_renameat
    - sebool_pcp_read_generic_logs
    - package_abrt-plugin-rhtsupport_removed
    - sebool_httpd_run_ipa
    - package_abrt-addon-ccpp_removed
    - file_groupowner_var_log_syslog
    - httpd_configure_perl_taint
    - service_netfs_disabled
    - sebool_dbadm_manage_user_files
    - sebool_smbd_anon_write
    - service_ypserv_disabled
    - sebool_nagios_run_sudo
    - sebool_dbadm_exec_content
    - package_ntp_installed
    - kernel_module_can_disabled
    - package_policycoreutils_installed
    - package_cron_installed
    - audit_rules_successful_file_modification_unlinkat
    - httpd_entrust_passwords
    - httpd_proxy_support
    - package_audit-audispd-plugins_installed
    - service_rpcidmapd_disabled
    - package_docker_installed
    - sebool_httpd_serve_cobbler_files
    - kernel_module_firewire-core_disabled
    - httpd_configure_log_format
    - sebool_container_connect_any
    - sebool_sge_domain_can_network_connect
    - package_openscap-scanner_installed
    - file_permissions_home_dirs
    - audit_rules_privileged_commands_newgidmap
    - sebool_virt_use_xserver
    - no_netrc_files
    - sebool_mozilla_plugin_use_spice
    - postfix_client_configure_mail_alias_postmaster
    - package_libcap-ng-utils_installed
    - package_nftables_removed
    - sebool_tmpreaper_use_nfs
    - sebool_httpd_can_connect_ldap
    - ftp_restrict_to_anon
    - sysctl_net_ipv4_conf_all_forwarding
    - sebool_glance_use_fusefs
    - snmpd_use_newer_protocol
    - sebool_httpd_dontaudit_search_dirs
    - sebool_named_tcp_bind_http_port
    - sebool_wine_mmap_zero_ignore
    - sebool_cluster_use_execmem
    - audit_rules_privileged_commands_usernetctl
    - kernel_module_atm_disabled
    - sebool_ftpd_use_nfs
    - sebool_httpd_use_fusefs
    - service_iptables_enabled
    - sebool_tor_bind_all_unreserved_ports
    - httpd_configure_banner_page
    - chronyd_server_directive
    - httpd_install_mod_ssl
    - sebool_httpd_use_openstack
    - sebool_icecast_use_any_tcp_ports
    - sebool_virt_sandbox_use_all_caps
    - audit_rules_unsuccessful_file_modification_rename
    - service_cgconfig_disabled
    - sebool_openshift_use_nfs
    - package_binutils_installed
    - sebool_mailman_use_fusefs
    - sebool_nfs_export_all_rw
    - service_sysstat_disabled
    - sebool_httpd_dbus_avahi
    - service_smartd_disabled
    - dir_perms_etc_httpd_conf
    - logwatch_configured_splithosts
    - mount_option_smb_client_signing
    - audit_rules_successful_file_modification_open_o_trunc_write
    - httpd_no_compilers_in_prod
    - sebool_mplayer_execstack
    - sebool_virt_sandbox_use_mknod
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_rule_order
    - sebool_fcron_crond
    - sebool_httpd_read_user_content
    - sebool_samba_domain_controller
    - service_sshd_disabled
    - sebool_cobbler_anon_write
    - audit_rules_successful_file_modification_openat_o_trunc_write
    - audit_rules_successful_file_modification_removexattr
    - sebool_httpd_mod_auth_pam
    - audit_rules_successful_file_modification_fchownat
    - package_nfs-utils_removed
    - sebool_pppd_for_user
    - sebool_rsync_export_all_ro
    - audit_rules_successful_file_modification_open_o_creat
    - sebool_authlogin_radius
    - httpd_configure_remote_session_encryption
    - sebool_swift_can_network
    - dhcp_server_disable_ddns
    - package_abrt-addon-kerneloops_removed
    - sudo_restrict_others_executable_permission
    - sshd_disable_pubkey_auth
    - sebool_tor_can_network_relay
    - postfix_server_banner
    - package_usbguard_installed
    - nfs_fixed_statd_port
    - audit_privileged_commands_reboot
    - sebool_virt_use_samba
    - install_mcafee_hbss_pa
    - sebool_spamassassin_can_network
    - package_syslogng_installed
    - sebool_virt_sandbox_use_sys_admin
    - httpd_ldap_support
    - network_disable_zeroconf
    - sebool_irssi_use_full_network
    - sebool_polipo_use_cifs
    - sebool_samba_load_libgfapi
    - package_rpcbind_removed
    - sebool_samba_run_unconfined
    - sebool_webadm_manage_user_files
    - cups_disable_browsing
    - service_certmonger_disabled
    - sebool_zoneminder_run_sudo
    - sebool_ftpd_anon_write
    - sebool_rsync_anon_write
    - install_mcafee_hbss_accm
    - mount_option_proc_hidepid
    - kerberos_disable_no_keytab
    - sebool_nfs_export_all_ro
    - audit_rules_unsuccessful_file_modification_chown
    - sebool_cups_execmem
    - httpd_enable_loglevel
    - sebool_httpd_execmem
    - sebool_httpd_sys_script_anon_write
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_o_trunc_write
    - sebool_ftpd_use_cifs
    - audit_rules_etc_shadow_open_by_handle_at
    - sebool_mysql_connect_any
    - audit_rules_privileged_commands_pt_chown
    - sebool_httpd_can_sendmail
    - sebool_prosody_bind_http_port
    - sebool_httpd_use_sasl
    - set_nftables_base_chain
    - sebool_tftp_home_dir
    - sebool_gssd_read_tmp
    - kernel_module_uvcvideo_disabled
    - sebool_squid_use_tproxy
    - sebool_httpd_ssi_exec
    - sebool_use_lpd_server
    - httpd_restrict_root_directory
    - audit_rules_successful_file_modification_open_by_handle_at_o_creat
    - grub2_nousb_argument
    - account_use_centralized_automated_auth
    - httpd_configure_valid_server_cert
    - sebool_postgresql_selinux_transmit_client_label
    - sebool_smartmon_3ware
    - dhcp_server_configure_logging
    - audit_rules_unsuccessful_file_modification_setxattr
    - sebool_global_ssp
    - sebool_virt_rw_qemu_ga_data
    - package_inetutils-telnetd_removed
    - audit_rules_successful_file_modification_openat
    - audit_rules_unsuccessful_file_modification_fchmod
    - file_permissions_httpd_server_conf_files
    - sebool_httpd_use_gpg
    - sysconfig_networking_bootproto_ifcfg
    - sebool_spamd_enable_home_dirs
    - avahi_disable_publishing
    - audit_rules_successful_file_modification_fchmod
    - dns_server_disable_dynamic_updates
    - sebool_fenced_can_network_connect
    - sebool_virt_use_nfs
    - sebool_lsmd_plugin_connect_any
    - account_passwords_pam_faillock_dir
    - httpd_configure_script_permissions
    - sebool_authlogin_yubikey
    - sebool_authlogin_nsswitch_use_ldap
    - package_iprutils_removed
    - sebool_httpd_run_preupgrade
    - sebool_httpd_use_cifs
    - sebool_telepathy_tcp_connect_generic_network_ports
    - httpd_cache_support
    - dir_perms_var_log_httpd
    - nfs_fixed_lockd_udp_port
    - sebool_entropyd_use_audio
    - sebool_httpd_enable_ftp_server
    - sebool_postgresql_selinux_users_ddl
    - http_configure_log_file_ownership
    - kernel_module_ipv6_option_disabled
    - sebool_cobbler_use_nfs
    - sebool_mozilla_plugin_can_network_connect
    - accounts_password_pam_pwquality_system_auth
    - httpd_restrict_web_directory
    - sebool_ftpd_full_access
    - sebool_mcelog_foreground
    - audit_rules_successful_file_modification_renameat
    - package_prelink_removed
    - sebool_git_cgi_use_cifs
    - sebool_virt_sandbox_use_netlink
    - smb_server_disable_root
    - service_nfslock_disabled
    - auditd_data_retention_admin_space_left_percentage
    - dir_ownership_library_dirs
    - sebool_openvpn_run_unconfined
    - package_sssd_installed
    - sebool_gluster_anon_write
    - audit_rules_successful_file_modification_open
    - sebool_nscd_use_shm
    - sebool_ksmtuned_use_cifs
    - service_messagebus_disabled
    - sebool_nagios_run_pnp4nagios
    - sebool_haproxy_connect_any
    - audit_rules_etc_shadow_openat
    - dns_server_authenticate_zone_transfers
    - sebool_pppd_can_insmod
    - sebool_glance_api_can_network
    - httpd_serversignature_off
    - sebool_mozilla_plugin_use_bluejeans
    - sebool_mozilla_read_content
    - restrict_nfs_clients_to_privileged_ports
    - file_permissions_var_log_messages
    - sebool_virt_use_usb
    - sebool_virt_use_execmem
    - sebool_virt_read_qemu_ga_data
    - sebool_gluster_export_all_ro
    - sebool_mcelog_server
    - package_nss-tools_installed
    - sebool_sge_use_nfs
    - service_saslauthd_disabled
    - sebool_mcelog_client
    - sebool_rsync_client
    - sebool_privoxy_connect_any
    - service_irqbalance_enabled
    - postfix_client_configure_relayhost
    - audit_privileged_commands_init
    - sebool_httpd_builtin_scripting
    - iptables_sshd_disabled
    - grub2_ipv6_disable_argument
    - etc_system_fips_exists
    - docker_selinux_enabled
    - sebool_varnishd_connect_any
    - ensure_gpgcheck_repo_metadata
    - httpd_servertokens_prod
    - service_postfix_enabled
    - package_openssh-server_removed
    - timer_logrotate_enabled
    - httpd_limit_available_methods
    - sebool_httpd_can_connect_mythtv
    - audit_rules_successful_file_modification_lchown
    - sebool_tftp_anon_write
    - dhcp_server_deny_decline
    - sebool_cobbler_can_network_connect
    - sebool_samba_export_all_ro
    - file_owner_var_log
    - service_cron_enabled
    - httpd_webdav
    - httpd_configure_max_keepalive_requests
    - set_nftables_loopback_traffic
    - audit_rules_successful_file_modification_unlink
    - wireless_disable_in_bios
    - no_all_squash_exports
    - sebool_use_samba_home_dirs
    - audit_rules_etc_gshadow_openat
    - service_ufw_enabled
    - package_psacct_installed
    - network_disable_ddns_interfaces
    - nfs_no_anonymous
    - dir_permissions_binary_dirs
    - mount_option_boot_nodev
    - sebool_xend_run_blktap
    - package_nis_removed
    - httpd_server_side_includes
    - package_gnutls-utils_installed
    - audit_rules_etc_passwd_open
    - dhcp_client_restrict_options
    - sebool_openvpn_can_network_connect
    - httpd_server_configuration_display
    - account_emergency_expire_date
    - sebool_unconfined_mozilla_plugin_transition
    - audit_rules_unsuccessful_file_modification_lremovexattr
    - file_permissions_var_log_syslog
    - sebool_git_cgi_enable_homedirs
    - dovecot_configure_ssl_cert
    - audit_rules_etc_passwd_open_by_handle_at
    - audit_rules_privileged_commands_at
    - sebool_virt_use_fusefs
    - avahi_ip_only
    - service_ntp_enabled
    - file_owner_var_log_syslog
    - service_ip6tables_enabled
    - sebool_logging_syslogd_run_nagios_plugins
    - sebool_mozilla_plugin_use_gps
    - partition_for_web_content
    - file_groupowner_etc_hosts_allow
    - audit_rules_unsuccessful_file_modification_open_o_trunc_write
    - package_tar_installed
    - httpd_private_server_on_separate_subnet
    - use_root_squashing_all_exports
    - sebool_ftpd_connect_all_unreserved
    - configure_user_data_backups
    - dir_ownership_binary_dirs
    - nfs_fixed_lockd_tcp_port
    - sebool_mcelog_exec_scripts
    - httpd_configure_tls
    - sysctl_net_ipv4_tcp_invalid_ratelimit
    - service_nftables_enabled
    - sysctl_net_ipv6_conf_default_disable_ipv6
    - sebool_collectd_tcp_network_connect
    - sebool_httpd_enable_homedirs
    - sebool_httpd_unified
    - audit_rules_privileged_commands_newuidmap
    - ldap_client_tls_cacertpath
    - sebool_zabbix_can_network
    - sshd_rekey_limit
    - audit_rules_unsuccessful_file_modification_chmod
    - fapolicyd_prevent_home_folder_access
    - no_legacy_plus_entries_etc_passwd
    - sebool_sanlock_use_nfs
    - httpd_restrict_critical_directories
    - sebool_racoon_read_shadow
    - configure_etc_hosts_deny
    - audit_rules_successful_file_modification_fsetxattr
    - service_sssd_enabled
    - service_psacct_enabled
    - audit_rules_successful_file_modification_fremovexattr
    - httpd_remove_backups
    - package_krb5-server_removed
    - service_netconsole_disabled
    - file_permissions_httpd_server_conf_d_files
    - audit_rules_successful_file_modification_rename
    - sebool_antivirus_use_jit
    - file_permissions_var_log
    - sebool_ksmtuned_use_nfs
    - audit_rules_successful_file_modification_setxattr
    - grub2_systemd_debug-shell_argument_absent
    - sebool_polipo_session_bind_all_unreserved_ports
    - sebool_webadm_read_user_files
    - auditd_data_disk_full_action_stig
    - audit_rules_unsuccessful_file_modification_open_by_handle_at_o_creat
    - audit_rules_unsuccessful_file_modification_fsetxattr
    - avahi_restrict_published_information
    - sebool_git_session_users
    - sebool_exim_manage_user_files
    - sshd_enable_gssapi_auth
    - httpd_digest_authentication
    - sebool_minidlna_read_generic_user_content
    - audit_rules_etc_group_openat
    - umask_for_daemons
    - sebool_httpd_can_network_connect_cobbler
    - service_mdmonitor_disabled
    - audit_rules_unsuccessful_file_modification_fchownat
    - sebool_openvpn_enable_homedirs
    - bios_disable_usb_boot
    - file_permissions_systemmap
    - service_docker_enabled
    - file_owner_etc_hosts_allow
    - audit_rules_unsuccessful_file_modification_open_o_creat
    - kernel_config_ipv6
    - service_rpcgssd_disabled
    - audit_rules_successful_file_modification_chown
    - audit_rules_successful_file_modification_fchmodat
    - sebool_dhcpc_exec_iptables
    - grub2_disable_recovery
    - httpd_public_resources_not_shared
    - audit_rules_unsuccessful_file_modification_removexattr
    - sebool_telepathy_connect_all_ports
    - httpd_enable_error_logging
    - httpd_disable_mime_types
    - sebool_postgresql_can_rsync
    - audit_rules_unsuccessful_file_modification_openat_o_trunc_write
    - httpd_install_mod_security
    - package_telnetd_removed
    - use_pam_wheel_for_su
    - sebool_httpd_setrlimit
    - service_cockpit_disabled
    - no_legacy_plus_entries_etc_group
    - mount_option_boot_noauto
    - nfs_fixed_mountd_port
    - sebool_git_cgi_use_nfs
    - httpd_remove_robots_file
    - sebool_git_system_use_cifs
    - sebool_httpd_use_nfs
    - sshd_enable_pubkey_auth
    - audit_rules_unsuccessful_file_modification_lchown
    - audit_rules_successful_file_modification_fchown
    - docker_storage_configured
    - sssd_ldap_configure_tls_ca_dir
    - sebool_git_system_enable_homedirs
    - sebool_httpd_can_check_spam
    - package_gssproxy_removed
    - sebool_mpd_use_cifs
    - sebool_xen_use_nfs
    - sebool_samba_enable_home_dirs
    - service_syslogng_enabled
    - sebool_sanlock_use_fusefs
    - account_passwords_pam_faillock_audit
    - httpd_require_client_certs
    - sebool_zebra_write_config
    - httpd_disable_content_symlinks
    - package_sssd-ipa_installed
    - sebool_irc_use_any_tcp_ports
    - audit_rules_etc_gshadow_open_by_handle_at
    - sebool_samba_export_all_rw
    - httpd_anonymous_content_sharing
    - audit_rules_successful_file_modification_truncate
    - dhcp_server_minimize_served_info
    - file_owner_etc_hosts_deny
    - package_abrt-cli_removed
    - file_permissions_httpd_server_modules_files
    - httpd_mime_magic
    - audit_rules_successful_file_modification_open_by_handle_at
    - sebool_tmpreaper_use_samba
    - sebool_samba_create_home_dirs
    - httpd_configure_firewall
    - file_groupowner_var_log_messages
    - audit_rules_successful_file_modification_chmod
    - sebool_nis_enabled
    - ftp_log_transactions
    - sebool_cvs_read_shadow
    - audit_rules_unsuccessful_file_modification_lsetxattr
    - sebool_xend_run_qemu
    - auditd_data_disk_error_action_stig
    - file_owner_var_log_messages
    - sebool_virt_use_comm
    - mcafee_antivirus_definitions_updated
    - network_ipv6_default_gateway
    - sebool_httpd_can_network_connect
    - sebool_virt_sandbox_use_audit
    - sshd_disable_root_password_login
    - harden_sshd_crypto_policy
    - package_telnetd-ssl_removed
    - file_groupowner_etc_hosts_deny
    - service_chronyd_enabled
    - network_ipv6_disable_interfaces
    - package_vsftpd_installed
    - sebool_puppetmaster_use_db
    - audit_rules_successful_file_modification_ftruncate
    - package_libreport-plugin-logger_removed
    - package_rng-tools_installed
    - logwatch_configured_hostlimit
    - dns_server_disable_zone_transfers
    - no_insecure_locks_exports
    - dconf_gnome_disable_power_settings
    - package_abrt-plugin-logger_removed
    - sebool_mozilla_plugin_bind_unreserved_ports
    - package_MFEhiplsm_installed
    - sebool_fenced_can_ssh
    - sebool_glance_use_execmem
    - audit_rules_etc_passwd_openat
    - sebool_rsync_full_access
    - httpd_server_activity_status
    - snmpd_no_rwusers
    - httpd_ignore_htaccess_files
    - mount_option_home_usrquota
    - service_quota_nld_disabled
    - file_permissions_etc_hosts_allow
    - sebool_ftpd_use_passive_mode
    - sebool_cluster_can_network_connect
    - sebool_cdrecord_read_content
    - sebool_antivirus_can_scan_system
    - rsyslog_logging_configured
    - package_scap-security-guide_installed
    - sebool_httpd_manage_ipa
    - audit_rules_dac_modification_umount
    - sebool_samba_share_nfs
    - package_389-ds-base_removed
    - audit_rules_etc_group_open
    - ftp_disable_uploads
    - set_iptables_default_rule_forward
    - httpd_enable_log_config
    - audit_rules_unsuccessful_file_modification_openat_o_creat
    - dovecot_enable_ssl
    - sebool_awstats_purge_apache_log_files
    - ftp_home_partition
    - httpd_url_correction
    - sebool_httpd_tmp_exec
    - package_abrt-plugin-sosreport_removed
    - package_postfix_installed
    - sebool_sanlock_use_samba
    - audit_privileged_commands_poweroff
    - audit_rules_successful_file_modification_creat
    - package_avahi-autoipd_removed
    - sebool_httpd_can_connect_ftp
    - sebool_httpd_anon_write
    - root_path_default
    - sebool_dhcpd_use_ldap
    - httpd_antivirus_scan_uploads
    - coreos_enable_selinux_kernel_argument
    - sebool_postgresql_selinux_unconfined_dbadm
    - kernel_disable_entropy_contribution_for_solid_state_drives
    - sebool_use_fusefs_home_dirs
    - audit_rules_successful_file_modification_lremovexattr
    - sebool_virt_transition_userdomain
    - sudo_add_passwd_timeout
    - package_freeradius_removed
    - avahi_check_ttl
    - audit_privileged_commands_shutdown
    - dir_permissions_library_dirs
    - sebool_httpd_tty_comm
    - sebool_dbadm_read_user_files
    - service_rpcsvcgssd_disabled
    - audit_rules_unsuccessful_file_modification_unlink
    - httpd_enable_system_logging
    - httpd_encrypt_file_uploads
    - sebool_exim_read_user_files
    - ftp_limit_users
    - sebool_zarafa_setrlimit
    - sebool_kdumpgui_run_bootloader
    - service_portreserve_disabled
    - sebool_httpd_verify_dns
    - set_nftables_table
    - sebool_polipo_use_nfs
    - sebool_exim_can_connect_db
    - package_libreport-plugin-rhtsupport_removed
    - sebool_unprivuser_use_svirt
    - sebool_httpd_run_stickshift
    - httpd_nipr_accredited_dmz
    - set_ipv6_loopback_traffic
    - package_systemd-journal-remote_installed
    - ftp_configure_firewall
    - ntpd_run_as_ntp_user
    - httpd_mod_rewrite
    - network_ipv6_static_address
    - package_libreswan_installed
    - audit_rules_unsuccessful_file_modification_fremovexattr
    - sebool_httpd_dbus_sssd
    - package_geolite2-country_removed
    - audit_rules_etc_group_open_by_handle_at
    - httpd_disable_anonymous_ftp_access
    - sebool_use_nfs_home_dirs
    - dhcp_server_deny_bootp
    - sebool_conman_can_network
    - sebool_logrotate_use_nfs
    - audit_rules_unsuccessful_file_modification_fchown
    - sebool_httpd_can_network_connect_db
    - sebool_gluster_export_all_rw
    - package_vim_installed
    - sebool_named_write_master_zones
    - sebool_postfix_local_write_mail_spool
    - httpd_cgi_support
    - bios_assign_password
    - service_cpupower_disabled
    - sebool_virt_use_rawip
    - sebool_pcp_bind_all_unreserved_ports
    - install_mcafee_cma_rt
    - no_root_webbrowsing
    - audit_rules_etc_gshadow_open
    - sebool_saslauthd_read_shadow
    - service_rhsmcertd_disabled
    - audit_rules_successful_file_modification_openat_o_creat
    - sebool_zoneminder_anon_write
    - require_smb_client_signing
    - sebool_neutron_can_network
    - dovecot_disable_plaintext_auth
    - sebool_ftpd_connect_db
    - sebool_httpd_mod_auth_ntlm_winbind
    - sebool_samba_share_fusefs
    - harden_ssh_client_crypto_policy
    - sebool_cobbler_use_cifs
    - sebool_httpd_can_network_relay
    - package_geolite2-city_removed
    - set_iptables_default_rule
    - sebool_piranha_lvs_can_network_connect
    - package_abrt-addon-python_removed
    - cups_disable_printserver
    - package_tuned_removed
    - no_legacy_plus_entries_etc_shadow
    - accounts_passwords_pam_faillock_audit
    - rsyslog_encrypt_offload_actionsendstreamdrivermode
    - service_acpid_disabled
    - rsyslog_encrypt_offload_actionsendstreamdriverauthmode
    - sebool_git_session_bind_all_unreserved_ports
    - sebool_boinc_execmem
    - service_nails_enabled
    - audit_rules_unsuccessful_file_modification_unlinkat
    - disable_logwatch_for_logserver
    - audit_rules_unsuccessful_file_modification_open_rule_order
    - service_cgred_disabled
    - ftp_present_banner
    - audit_rules_unsuccessful_file_modification_fchmodat
    - sebool_polipo_session_users
    - sebool_cluster_manage_all_files
    - dovecot_configure_ssl_key
