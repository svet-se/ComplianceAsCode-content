# platform = multi_platform_ol,multi_platform_rhel
#!/bin/bash

source common_0600.sh

echo "log_file = ${FILE2}" >> /etc/audit/auditd.conf

chmod 0600 ${FILE2}
chmod 0640 ${FILE1}
