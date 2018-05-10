#!/usr/bin/env sh

# Check for a syslink to the vimspectr plugin. Create one if necessary.
if [ ! -L "$HOME/.vimspectr-shell" ]; then
    if [ -d "$XDG_DATA_HOME/nvim/plugged/vimspectr/shell" ]; then
        ln -s "$XDG_DATA_HOME/nvim/plugged/vimspectr/shell" "$HOME/.vimspectr-shell"
        for f in $HOME/.vimspectr-shell/*-*; do
            ln -s "$f" "$( \
                echo "$f.sh" | \
                sed s#vimspectr-shell/#config/zsh/plugins/chriskempson/base16-shell/scripts/base16-#)"
        done
    fi
fi

# Add color to `ls` command
if [ ! -d "$XDG_DATA_HOME/LS_COLORS" ];then
    git clone https://github.com/trapd00r/LS_COLORS "$XDG_DATA_HOME/LS_COLORS" 
    ln -s ~/.dir_colors "$XDG_DATA_HOME/LS_COLORS/LS_COLORS"
fi

base16_phd
