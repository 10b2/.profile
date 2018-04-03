#!/usr/bin/env sh

set_env_var "MODERNISH_HOME" "${XDG_DATA_HOME}/modernish"

if ! [ -d "${MODERNISH_HOME}" ]; then
     git clone https://github.com/modernish/modernish ${MODERNISH_HOME} 
fi

