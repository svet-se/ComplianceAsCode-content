# platform = multi_platform_sle,Oracle Linux 8,multi_platform_rhel,multi_platform_fedora,multi_platform_ubuntu

for SYSCMDFILES in /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin
do
   find -L $SYSCMDFILES \! -group root -type f -exec chgrp root '{}' \;
done
