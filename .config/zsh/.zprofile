# Location of OH-MY-ZSH
set_env_var "ZSH" "${XDG_CONFIG_HOME}/zsh/oh-my-zsh"
set_env_var "ZSH_THEME" "agnoster"

if [ ! -d ${ZSH} ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ${ZSH}
fi


