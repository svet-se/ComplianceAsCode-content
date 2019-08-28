# platform = multi_platform_fedora,Red Hat Enterprise Linux 8,Oracle Linux 8

MISSING_MOUNTS=$( mount | awk '$5 ~ /^(tmpfs|ext4|ext3|xfs)$/ { print $3 }' | grep -vxf /etc/fapolicyd/fapolicyd.mounts )
if [ -n "$MISSING_MOUNTS" ] ; then
	echo "$MISSING_MOUNTS" >> /etc/fapolicyd/fapolicyd.mounts
fi
