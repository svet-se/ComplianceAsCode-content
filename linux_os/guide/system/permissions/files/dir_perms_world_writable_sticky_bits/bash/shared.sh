# platform = Red Hat Virtualization 4,multi_platform_ol,multi_platform_rhel,multi_platform_sle,multi_platform_ubuntu
df --local -P | awk '{if (NR!=1) print $6}' \
| xargs -I '{}' find '{}' -xdev -type d \
\( -perm -0002 -a ! -perm -1000 \) 2>/dev/null \
| xargs chmod a+t
