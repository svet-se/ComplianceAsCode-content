#!/bin/bash

# profiles = xccdf_org.ssgproject.content_profile_ospp
# remediation = none

sed '3,4d' $SHARED/audit_open_o_trunc_write.rules > /etc/audit/rules.d/open-o_trunc_write.rules
