#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_ospp

. ../../dconf_test_functions.sh

yum -y install dconf
clean_dconf_settings
