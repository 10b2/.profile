# Lines configured by zsh-newuser-install
HISTFILE=~/.local/share/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
