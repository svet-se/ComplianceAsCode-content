#!/bin/bash
#
# platform = multi_platform_rhel,multi_platform_fedora

> /etc/cpuinfo

if [ -e /etc/cpuinfo ] ; then
mount --bind /etc/cpuinfo /proc/cpuinfo
fi
