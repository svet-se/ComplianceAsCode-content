#!/bin/bash

USER="cac_user"
useradd -m $USER
touch /home/$USER/.bashrc
chgrp 10005 /home/$USER/.bashrc
