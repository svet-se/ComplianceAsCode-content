#!/bin/bash

# Clean sysctl config directories
rm -rf /usr/lib/sysctl.d/* /run/sysctl.d/* /etc/sysctl.d/*

sed -i "/net.ipv4.conf.all.accept_source_route/d" /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route = 1" >> /etc/sysctl.conf
# Setting correct runtime value
sysctl -w net.ipv4.conf.all.accept_source_route=0
