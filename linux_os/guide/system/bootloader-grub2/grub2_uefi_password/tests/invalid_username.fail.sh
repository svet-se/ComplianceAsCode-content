#!/bin/bash

# remediation = none

. $SHARED/grub2.sh

set_grub_uefi_root

make_grub_password

set_superusers "use r"
