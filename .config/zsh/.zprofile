#!/usr/bin/env zsh

if [ -r "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

. "${ZPLUG_HOME}/init.zsh" 

if ! zplug check; then
    zplug install
fi

zplug "zplug/zplug" hook-build:"zplug --self-manage"
zplug "sindresorhus/pure" use:"pure.zsh" from:"github" as:"theme"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
zplug "lukechilds/zsh-nvm"
zplug "robertaudi/tsm"
zplug "mafredri/zsh-async" from:"github"
zplug "zsh-users/zsh-syntax-highlighting"

