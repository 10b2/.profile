# appendhistory - If this is set, zsh sessions will append their history list to the history file, rather than replace it. 

# autocd - If a command is issued that can't be executed as  a  normal command,  and  the command is the name of a directory, perform the cd command to that directory.   

# beep - Beep on error in ZLE.

# extendedglob - Treat the `#', `~' and `^' characters as part  of  patterns for  filename  generation,  etc.  

# nomatch - If a pattern for filename generation has no matches,  print an  error,  instead of leaving it unchanged in the argument list. 

# notify - Report  the  status  of background jobs immediately, rather than waiting until just before printing a prompt.
 
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

# The following lines were added by compinstall

zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 0
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format '%d:'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-/]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e Possible Errors'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/luwum/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

. "${ZPLUG_HOME}/init.zsh" 

if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async", from:"github"
zplug "sindresorhus/pure", use:"pure.zsh", from:"github", as:"theme"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
zplug "chriskempson/base16-shell", from:"github", as:"plugin"
zplug "asdf-vm/asdf", use:"asdf.sh", from:"github", as:"plugin" 
zplug "plugins/fasd", from:"oh-my-zsh"
zplug "plugins/fancy-ctrl-z", from:"oh-my-zsh"
zplug "plugins/colored-man-pages", from:"oh-my-zsh"
zplug "plugins/command-not-found", from:"oh-my-zsh"
zplug "plugins/vagrant", from:"oh-my-zsh"
zplug "plugins/docker", from:"oh-my-zsh"
zplug "plugins/terraform", from:"oh-my-zsh"
zplug "plugins/git", from:"oh-my-zsh"
zplug "plugins/systemd", from:"oh-my-zsh"
zplug "MichaelAquilina/zsh-you-should-use", from:"github", as:"plugin"
zplug "robertaudi/tsm"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load

alias -g ls='exa --group-directories-first'
alias -g ll='ls -l'
alias -g la='ll -a'
