# platform = multi_platform_all

{{{ bash_instantiate_variables("var_accounts_user_umask") }}}

{{% if 'sle' in product %}}
{{% set etc_bash_rc = "/etc/bash.bashrc" %}}
{{% else %}}
{{% set etc_bash_rc = "/etc/bashrc" %}}
{{% endif %}}

grep -q umask {{{ etc_bash_rc }}} && \
  sed -i "s/umask.*/umask $var_accounts_user_umask/g" {{{ etc_bash_rc }}}
if ! [ $? -eq 0 ]; then
    echo "umask $var_accounts_user_umask" >> {{{ etc_bash_rc }}}
fi
