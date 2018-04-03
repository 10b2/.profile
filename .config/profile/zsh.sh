#!/usr/bin/env sh

# ZSH startup/shutdown files
set_env_var "ZDOTDIR" "${XDG_DATA_HOME}/zsh"

# Location of ZPLUG_HOME 
set_env_var "ZPLUG_HOME" "${ZDOTDIR}/zplug"

if ! [ -d "${ZPLUG_HOME}" ]; then
    git clone https://github.com/zplug/zplug --depth=1 --branch 2.4.2 "${ZPLUG_HOME}"
fi

