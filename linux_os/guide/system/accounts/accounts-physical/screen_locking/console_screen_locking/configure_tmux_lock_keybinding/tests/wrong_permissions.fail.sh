#!/bin/bash
# platform = Oracle Linux 8,Red Hat Enterprise Linux 8,multi_platform_fedora

echo 'bind X lock-session' >> '/etc/tmux.conf'
chmod 0600 "/etc/tmux.conf"
