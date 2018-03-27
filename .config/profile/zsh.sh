# ZSH startup/shutdown files
set_env_var "ZDOTDIR" "${XDG_DATA_HOME}/zsh"

# Location of OH-MY-ZSH
set_env_var "ZSH" "${ZDOTDIR}/oh-my-zsh"
set_env_var "ZSH_THEME" "agnoster"

if [ ! -d ${ZSH} ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ${ZSH}
fi

