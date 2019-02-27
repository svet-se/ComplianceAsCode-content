# platform = multi_platform_rhel,multi_platform_sle

# Identify local mounts
MOUNT_LIST=$(df | grep "^/dev" | awk '{ print $6 }') 

# Find file on each listed mount point
for cur_mount in ${MOUNT_LIST}
do
	find ${cur_mount} -xdev -type f -name "shosts.equiv" -exec rm -f {} \;
done
