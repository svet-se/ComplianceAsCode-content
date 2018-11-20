# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_fedora
. /usr/share/scap-security-guide/remediation_functions
populate var_accounts_tmout

if grep --silent ^TMOUT /etc/profile ; then
        sed -i "s/^TMOUT.*/TMOUT=$var_accounts_tmout/g" /etc/profile
else
        echo -e "\n# Set TMOUT to $var_accounts_tmout per security requirements" >> /etc/profile
        echo "TMOUT=$var_accounts_tmout" >> /etc/profile
fi
