#!/usr/bin/env sh

if [ ! -d "${XDG_CONFIG_HOME}/npm" ]; then
    mkdir "${XDG_CONFIG_HOME}/npm"
fi

if [ ! -d "${XDG_DATA_HOME}/npm" ]; then
    mkdir "${XDG_DATA_HOME}/npm" 
fi

if [ ! -d "${XDG_DATA_HOME}/nvm" ]; then
    mkdir "${XDG_DATA_HOME}/nvm"
fi

if [ ! -d "${XDG_CACHE_HOME}/npm" ]; then
    mkdir "${XDG_CACHE_HOME}/npm" 
fi

set_env_var "NPM_CONFIG_USERCONFIG" "${XDG_CONFIG_HOME}/npm/npmrc"
set_env_var "NPM_CONFIG_INIT_MODULE" "${XDG_DATA_HOME}/npm/npm-init.js"
set_env_var "NPM_CONFIG_CACHE" "${XDG_CACHE_HOME}/npm"
set_env_var "NVM_DIR" "${XDG_DATA_HOME}/nvm"
