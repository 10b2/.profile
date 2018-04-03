#!/usr/bin/env sh

set_env_var "WORKON_HOME" "${XDG_DATA_HOME}/virtualenvs"

if is_command "virtualenvwrapper.sh"; then
    virtualenvwrapper.sh
fi
