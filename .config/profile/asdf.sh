#!/usr/bin/env sh

#ASDF is an Extendable Version Manager. 
set_env_var "ASDF_CONFIG_FILE" "${XDG_CONFIG_HOME}/asdf/.asdfrc" 

if [ ! -d "${XDG_DATA_HOME}/asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git "${XDG_DATA_HOME}/asdf" --branch v0.4.3
fi

. "${XDG_DATA_HOME}/asdf.sh"

