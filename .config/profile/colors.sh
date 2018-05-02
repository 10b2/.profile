#!/usr/bin/env sh

# Check for a syslink to the vimspectr plugin. Create one if necessary.
if [ ! -L ~/.vimspectr_shell ]; then
    if [ -d "$XDG_DATA_HOME/nvim/plugged/vimspectr/shell" ]; then
        ln -s ~/.local/share/nvim/plugged/vimspectr/shell ~/.vimspectr-shell
    for f in ~/.vimspectr-shell/*-*; do
        ln -s "$f" "$( \
            echo "$f.sh" | \
            sed s#vimspectr-shell/#config/zsh/plugins/chriskempson/base16-shell/scripts/base16-#)"
    done
    fi
fi

# Add color to `ls` command
if [ ! -d "${ZPLUG_REPOS}/trapd00r/LS_COLORS" ];then
    git clone https://github.com/trapd00r/LS_COLORS "${ZPLUG_REPOS}/trapd00r/LS_COLORS"
fi

[ -n "$LS_COLORS" ] && eval "$( dircolors -b "${ZPLUG_REPOS}/trapd00r/LS_COLORS/LS_COLORS" )"
[ -n "$PS1" ] && . "$HOME/.vimspectr-shell/vimspectr240-dark" 
