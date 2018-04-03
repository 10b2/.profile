#!/usr/bin/env sh

set_env_var "WORKON_HOME" "${XDG_DATA_HOME}/virtualenvs"

is_command "virtualenvwrapper.sh"
if [ $? -eq 0 ]; then
    virtualenvwrapper.sh
fi
