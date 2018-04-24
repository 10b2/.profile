#!/usr/bin/env sh

set_env_var "NVM_DIR" "${XDG_DATA_HOME}/nvm"

if ! [ -d "${NVM_DIR}" ]; then
    git clone https://github.com/creationix/nvm "${NVM_DIR}"
fi
