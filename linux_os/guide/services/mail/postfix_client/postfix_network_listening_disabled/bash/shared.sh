# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol

# Include source function library.
. /usr/share/scap-security-guide/remediation_functions

{{{ bash_instantiate_variables("var_postfix_inet_interfaces") }}}

{{{ set_config_file(path="/etc/postfix/main.cf", parameter="inet_interfaces", value="$var_postfix_inet_interfaces", create=true, insensitive=true, separator="=", separator_regex="\s\+=\s\+", prefix_regex="^\s*") }}}
