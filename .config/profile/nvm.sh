if [ ! -d "${XDG_DATA_HOME}/nvm" ]; then
    mkdir ${XDG_DATA_HOME}/nvm
fi

set_env_var "NVM_DIR" "${XDG_DATA_HOME}/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
