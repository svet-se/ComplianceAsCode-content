#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_stig

cp ../fstab /etc/
sed -i 's|\(.*nfs4.*\),noexec\(.*\)|\1\2|' /etc/fstab
