#!/bin/bash

# fail1 is the plain expected fail scenario, the config with a wrong value

for file in /boot/config-* ; do
    if grep -q ^{{{ CONFIG }}} "$file" ; then
        sed -i "s/{{{ CONFIG }}}.*/{{{ CONFIG }}}=wrong_value/" "$file"
    else
        echo "{{{ CONFIG }}}=wrong_value" >> "$file"
    fi
done
