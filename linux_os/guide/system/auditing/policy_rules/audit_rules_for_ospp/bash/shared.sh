# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8

{{% if product == "rhel8" %}}
# This is needed for RHEL8 until the file is updated
dump_ospp_rules(){
cat << EOF > /etc/audit/rules.d/30-ospp-v42.rules
## The purpose of these rules is to meet the requirements for Operating
## System Protection Profile (OSPP)v4.2. These rules depends on having
## 10-base-config.rules, 11-loginuid.rules, and 43-module-load.rules installed.

## Successful/Unsuccessful file creation (open with O_CREAT)
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b32 -S creat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S creat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create

## Successful/Unsuccessful file modifications (open for write or truncate)
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification

## Successful/Unsuccessful file access (any other opens) This has to go last.
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
# These next two are likely to result in a whole lot of events
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-access

## Successful/Unsuccessful file delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-delete

## Successful/Unsuccessful permission change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change

## Successful/Unsuccessful ownership change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change

## User add delete modify. This is covered by pam. However, someone could
## open a file and directly create or modify a user, so we'll watch passwd and
## shadow for writes
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S open -F a1&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S open -F a1&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S open -F a1&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S open -F a1&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify

## User enable and disable. This is entirely handled by pam.

## Group add delete modify. This is covered by pam. However, someone could
## open a file and directly create or modify a user, so we'll watch group and
## gshadow for writes
-a always,exit -F path=/etc/passwd -F perm=wa -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F path=/etc/shadow -F perm=wa -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F path=/etc/group -F perm=wa -F auid>=1000 -F auid!=unset -F key=group-modify
-a always,exit -F path=/etc/gshadow -F perm=wa -F auid>=1000 -F auid!=unset -F key=group-modify


## Use of special rights for config changes. This would be use of setuid
## programs that relate to user accts. This is not all setuid apps because
## requirements are only for ones that affect system configuration.
-a always,exit -F path=/usr/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/usernetctl -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/userhelper -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/seunshare -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/mount -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newuidmap -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newgidmap -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/umount -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/at -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes

## Privilege escalation via su or sudo. This is entirely handled by pam.

## Audit log access
-a always,exit -F dir=/var/log/audit/ -F perm=r -F auid>=1000 -F auid!=unset -F key=access-audit-trail
## Attempts to Alter Process and Session Initiation Information
-a always,exit -F path=/var/run/utmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session
-a always,exit -F path=/var/log/btmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session
-a always,exit -F path=/var/log/wtmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session

## Attempts to modify MAC controls
-a always,exit -F dir=/etc/selinux/ -F perm=wa -F auid>=1000 -F auid!=unset -F key=MAC-policy

## Software updates. This is entirely handled by rpm.

## System start and shutdown. This is entirely handled by systemd

## Kernel Module loading. This is handled in 43-module-load.rules

## Application invocation. The requirements list an optional requirement
## FPT_SRP_EXT.1 Software Restriction Policies. This event is intended to
## state results from that policy. This would be handled entirely by
## that daemon.

EOF
}
{{% elif product == "rhel7" %}}
# This is needed for RHEL7 until the file is updated
dump_ospp_rules(){
cat << EOF > /etc/audit/rules.d/30-ospp-v42.rules
## The purpose of these rules is to meet the requirements for Operating
## System Protection Profile (OSPP)v4.2. These rules depends on having
## 10-base-config.rules, 11-loginuid.rules, and 43-module-load.rules installed.

## Successful/Unsuccessful file creation (open with O_CREAT)
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b64 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-create
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b32 -S open -F a1&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S open -F a1&0100 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b32 -S creat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create
-a always,exit -F arch=b64 -S creat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-create

## Successful/Unsuccessful file modifications (open for write or truncate)
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-modification
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b32 -S open -F a1&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S open -F a1&01003 -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b32 -S truncate,ftruncate -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification
-a always,exit -F arch=b64 -S truncate,ftruncate -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-modification

## Successful/Unsuccessful file access (any other opens) This has to go last.
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-access
# These next two are likely to result in a whole lot of events
-a always,exit -F arch=b32 -S open,openat,open_by_handle_at -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-access
-a always,exit -F arch=b64 -S open,openat,open_by_handle_at -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-access

## Successful/Unsuccessful file delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-delete
-a always,exit -F arch=b32 -S unlink,unlinkat,rename,renameat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-delete
-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-delete

## Successful/Unsuccessful permission change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change

## Successful/Unsuccessful ownership change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=unsuccessful-perm-change
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change
-a always,exit -F arch=b64 -S lchown,fchown,chown,fchownat -F success=1 -F auid>=1000 -F auid!=unset -F key=successful-perm-change

## User add delete modify. This is covered by pam. However, someone could
## open a file and directly create or modify a user, so we'll watch passwd and
## shadow for writes
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S open -F a1&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S open -F a1&03 -F path=/etc/passwd -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S openat,open_by_handle_at -F a2&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S openat,open_by_handle_at -F a2&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b32 -S open -F a1&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F arch=b64 -S open -F a1&03 -F path=/etc/shadow -F auid>=1000 -F auid!=unset -F key=user-modify

## User enable and disable. This is entirely handled by pam.

## Group add delete modify. This is covered by pam. However, someone could
## open a file and directly create or modify a user, so we'll watch group and
## gshadow for writes
-a always,exit -F path=/etc/passwd -F perm=wa -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F path=/etc/shadow -F perm=wa -F auid>=1000 -F auid!=unset -F key=user-modify
-a always,exit -F path=/etc/group -F perm=wa -F auid>=1000 -F auid!=unset -F key=group-modify
-a always,exit -F path=/etc/gshadow -F perm=wa -F auid>=1000 -F auid!=unset -F key=group-modify

## Use of special rights for config changes. This would be use of setuid
## programs that relate to user accts. This is not all setuid apps because
## requirements are only for ones that affect system configuration.
-a always,exit -F path=/usr/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/usernetctl -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/userhelper -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/sbin/seunshare -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/mount -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newuidmap -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/newgidmap -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/umount -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes
-a always,exit -F path=/usr/bin/at -F perm=x -F auid>=1000 -F auid!=unset -F key=special-config-changes

## Privilege escalation via su or sudo. This is entirely handled by pam.

## Audit log access
-a always,exit -F dir=/var/log/audit/ -F perm=r -F auid>=1000 -F auid!=unset -F key=access-audit-trail
## Attempts to Alter Process and Session Initiation Information
-a always,exit -F path=/var/run/utmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session
-a always,exit -F path=/var/log/btmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session
-a always,exit -F path=/var/log/wtmp -F perm=wa -F auid>=1000 -F auid!=unset -F key=session

## Attempts to modify MAC controls
-a always,exit -F dir=/etc/selinux/ -F perm=wa -F auid>=1000 -F auid!=unset -F key=MAC-policy

## Software updates. This is entirely handled by rpm.

## System start and shutdown. This is entirely handled by systemd

## Kernel Module loading. This is handled in 43-module-load.rules
EOF
}
{{% endif %}}

{{% set audit_dir="audit" %}}
{{# in rhel7, docs dir are versioned #}}
{{% if product == "rhel7" %}}
  {{% set audit_dir="audit-2.8.4" %}}
{{% endif %}}

cp /usr/share/doc/{{{ audit_dir }}}/rules/10-base-config.rules /etc/audit/rules.d
cp /usr/share/doc/{{{ audit_dir }}}/rules/11-loginuid.rules /etc/audit/rules.d

{{% if product == "rhel8" %}}
# cp /usr/share/doc/{{{ audit_dir }}}/rules/30-ospp-v42.rules /etc/audit/rules.d
dump_ospp_rules
{{% elif product == "rhel7" %}}
dump_ospp_rules
{{% endif %}}

cp /usr/share/doc/{{{ audit_dir }}}/rules/43-module-load.rules /etc/audit/rules.d

augenrules --load
