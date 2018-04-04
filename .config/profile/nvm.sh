#!/usr/bin/env sh

set_env_var "NVM_DIR" "${XDG_DATA_HOME}/nvm"

if ! [ -d "${NVM_DIR}" ]; then
    git clone https://github.com/creationix/nvm "${NVM_DIR}"
fi

[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion
