#!/bin/bash
# packages = audit

path={{{ PATH }}}
. $SHARED/audit_rules_login_events/auditctl_wrong_rule_without_key.fail.sh
