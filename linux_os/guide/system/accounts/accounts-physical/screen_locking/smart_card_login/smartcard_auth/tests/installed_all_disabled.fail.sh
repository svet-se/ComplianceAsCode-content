#!/bin/bash


yum install -y pcsc-lite pam_pkcs11 esc

systemctl disable pcscd.socket
systemctl disable pcscd.service

. ./configure_pam_stack.sh
