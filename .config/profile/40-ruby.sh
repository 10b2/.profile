#!/usr/bin/env sh

if [ ! -d "${XDG_DATA_HOME}/gem" ]; then
    mkdir "${XDG_DATA_HOME}/gem"
fi

set_env_var "GEM_HOME" "${XDG_DATA_HOME}/gem"
set_env_var "PATH" "${PATH}:$(ruby -e 'print Gem.user_dir')/bin"
