# platform = Red Hat Enterprise Linux 7

sed -i '/RekeyLimit/Id' /etc/ssh/sshd_config
echo "RekeyLimit 512M 1h" >> /etc/ssh/sshd_config
