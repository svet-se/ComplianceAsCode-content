# platform = multi_platform_all

{{{ bash_instantiate_variables("var_accounts_passwords_pam_faillock_deny") }}}

{{{ bash_pam_faillock_enable() }}}
{{{ bash_pam_faillock_parameter_value("deny", "$var_accounts_passwords_pam_faillock_deny") }}}
