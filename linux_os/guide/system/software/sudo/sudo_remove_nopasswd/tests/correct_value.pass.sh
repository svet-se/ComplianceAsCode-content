#!/bin/bash

rm -f /etc/sudoers
echo "%wheel	ALL=(ALL)	ALL" > /etc/sudoers
chmod 440 /etc/sudoers
