# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

awk -F':' '{ if ($4 >= {{{ uid_min }}} && $4 != 65534) system("chmod -f g-w,o-w "$6"/.[^\.]?*") }' /etc/passwd
