# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_fedora,multi_platform_rhv,Oracle Linux 7
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

. /usr/share/scap-security-guide/remediation_functions

PKCSSW=$(/usr/bin/pkcs11-switch)

if ! [[ ${PKCSSW} -eq "opensc" ]] ; then
    ${PKCSSW} opensc
fi
