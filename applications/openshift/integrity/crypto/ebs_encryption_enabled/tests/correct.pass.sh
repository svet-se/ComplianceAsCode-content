#!/bin/bash

mkdir -p /tmp/apis/machineconfiguration.openshift.io/v1/machineconfigs/99-master-fips

cat << EOF > /tmp/apis/machineconfiguration.openshift.io/v1/machineconfigs/99-master-fips
[
  true,
  true
]
EOF
