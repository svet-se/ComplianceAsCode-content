#!/bin/bash
# platform = Red Hat Enterprise Linux 8
# packages = dhcp-server

# Simple configuration for dhcp so we can start the service
cat << EOF >> /etc/dhcp/dhcpd.conf
subnet 192.168.122.0 netmask 255.255.255.248 {
}
EOF

systemctl start dhcpd
systemctl enable dhcpd
