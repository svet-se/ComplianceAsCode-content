# platform = multi_platform_fedora,Oracle Linux 9,Red Hat Enterprise Linux 9
# variables = var_rekey_limit_size=512M

mkdir -p /etc/ssh/sshd_config.d
touch /etc/ssh/sshd_config.d/nothing

if grep -q "^\s*RekeyLimit" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/* ; then
	sed -i "/^\s*RekeyLimit.*/Id" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*
fi

echo "RekeyLimit 512M 2h" > /etc/ssh/sshd_config.d/bad_config.conf
