# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle,multi_platform_slmicro,multi_platform_ubuntu
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium

{{% if 'sle' in product %}}
PAM_PATH="/etc/pam.d/"
NULLOK_FILES=$(grep -rl ".*pam_unix\\.so.*nullok.*" ${PAM_PATH})
for FILE in ${NULLOK_FILES}; do
   sed --follow-symlinks -i 's/\<nullok\>//g' ${FILE}
done
{{% elif 'ubuntu' in product %}}
FILE="/etc/pam.d/common-password"
sed -i 's/\(.*pam_unix\.so.*\)\s\<nullok\>\(.*\)/\1\2/g' ${FILE}
{{% else %}}
if [ -f /usr/bin/authselect ]; then
    {{{ bash_enable_authselect_feature('without-nullok') }}}
else
    {{{ bash_remove_pam_module_option('/etc/pam.d/system-auth', 'auth', 'sufficient', 'pam_unix.so', 'nullok') }}}
    {{{ bash_remove_pam_module_option('/etc/pam.d/system-auth', 'password', 'sufficient', 'pam_unix.so', 'nullok') }}}
    {{{ bash_remove_pam_module_option('/etc/pam.d/password-auth', 'auth', 'sufficient', 'pam_unix.so', 'nullok') }}}
    {{{ bash_remove_pam_module_option('/etc/pam.d/password-auth', 'password', 'sufficient', 'pam_unix.so', 'nullok') }}}
fi
{{% endif %}}
