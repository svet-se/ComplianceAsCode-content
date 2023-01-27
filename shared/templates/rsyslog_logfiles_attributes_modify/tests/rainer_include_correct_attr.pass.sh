#!/bin/bash
# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_sle

# Declare variables used for the tests and define the create_rsyslog_test_logs function
source $SHARED/rsyslog_log_utils.sh

{{% if ATTRIBUTE == "owner" %}}
CHATTR="chown"
{{% else %}}
CHATTR="chgrp"
{{% endif %}}

ATTR_VALUE=root

# create two test log file
create_rsyslog_test_logs 2

# setup test log file property
$CHATTR $ATTR_VALUE ${RSYSLOG_TEST_LOGS[0]}
$CHATTR $ATTR_VALUE ${RSYSLOG_TEST_LOGS[1]}

# create test configuration file with rule for second test log file
test_conf=${RSYSLOG_TEST_DIR}/test1.conf
cat << EOF > ${test_conf}
# rsyslog test configuration file

#### RULES ####
*.*     action(type="omfile" FileCreateMode="0640" fileOwner="root" fileGroup="hoiadm" File="${RSYSLOG_TEST_LOGS[1]}")

EOF

# add rule with first test log file plus an include statement
cat << EOF > $RSYSLOG_CONF
# rsyslog configuration file

#### RULES ####
*.*     action(type="omfile" FileCreateMode="0640" fileOwner="root" fileGroup="hoiadm" File="${RSYSLOG_TEST_LOGS[0]}")

#### MODULES ####
include(file="${test_conf}")

EOF
