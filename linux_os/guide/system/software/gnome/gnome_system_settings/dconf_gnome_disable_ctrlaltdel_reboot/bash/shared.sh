# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_fedora,multi_platform_ol,multi_platform_ubuntu


{{{ bash_dconf_settings("org/gnome/settings-daemon/plugins/media-keys", "logout", "''", "local.d", "00-security-settings") }}}
{{{ bash_dconf_lock("org/gnome/settings-daemon/plugins/media-keys", "logout", "local.d", "00-security-settings-lock") }}}
