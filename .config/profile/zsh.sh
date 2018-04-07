#!/usr/bin/env sh

# ZSH startup/shutdown files
set_env_var "ZDOTDIR" "${XDG_CONFIG_HOME}/zsh"

# Location of ZPLUG_HOME 
set_env_var "ZPLUG_HOME" "${XDG_DATA_HOME}/zplug"

# All binaries go here.
set_env_var "ZPLUG_BIN" "${XDG_BIN_HOME}"

if ! [ -d "${ZPLUG_HOME}" ]; then
    git clone https://github.com/zplug/zplug --depth=1 --branch 2.4.2 "${ZPLUG_HOME}"
fi

. "${ZPLUG_HOME}/init.zsh" 

if ! zplug check; then
    zplug install
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-completions'
zplug 'chrissicool/zsh-256color'
zplug 'lukechilds/zsh-nvm'
zplug 'mafredri/zsh-async' from:'github'
zplug 'sindresorhus/pure', use:"pure.zsh", from:'github', as:"theme"
