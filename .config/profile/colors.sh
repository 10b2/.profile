#!/usr/bin/env sh

# Check for a syslink to the vimspectr plugin. Create one if necessary.
if [ ! -L ~/.vimspectr_shell ]; then
    if [ -d "$XDG_DATA_HOME/nvim/plugged/vimspectr/shell" ]; then
        ln -s ~/.local/share/nvim/plugged/vimspectr/shell ~/.vimspectr-shell
    fi
fi

# Add color to `ls` command
if [ -d "$ZPLUG_REPOS/trapd00r/LS_COLORS" ];then
    . "$ZPLUG_REPOS/trapd00r/LS_COLORS/LS_COLORS"
fi

[ -n "$PS1" ] && sh ~/.vimspectr-shell/vimspectr240-dark
