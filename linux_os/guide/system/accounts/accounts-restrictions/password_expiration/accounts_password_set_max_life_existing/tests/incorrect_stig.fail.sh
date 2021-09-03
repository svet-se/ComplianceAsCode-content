#!/bin/bash
# make existing entries pass
# assumption: use a nominally small value for var_accounts_maximum_age_login_defs
#             so as to not interfere.
for acct in $(grep -ve ':\(!!\|\*\):' /etc/shadow | awk -F: '{print $1}'); do
    chage -M 1 -d $(date +%Y-%m-%d) $acct
done
# Add a failing test.
# 9000 is picked as an arbitrarily large number.
echo 'max-test-user:$1$q.YkdxU1$ADmXcU4xwPrM.Pc.dclK81:18648:1:9000::::' >> /etc/shadow
echo "max-test-user:x:50000:1000::/:/usr/bin/bash" >> /etc/passwd
