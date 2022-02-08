#!/bin/bash

if grep -q 'maxclassrepeat' /etc/security/pwquality.conf; then
	sed -i 's/.*maxclassrepeat.*/maxclassrepeat = 5/' /etc/security/pwquality.conf
else
	echo "maxclassrepeat = 5" >> /etc/security/pwquality.conf
fi

