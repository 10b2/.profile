#!/bin/sh

#  Location for TMUX PLUGIN MANAGER
set_env_var "TMUX_PLUGIN_MANAGER_PATH" "${XDG_CONFIG_HOME}/tmux/tpm"

# Check if current shell is running inside TMUX
if [ -z ${TMUX:-}; then
    # Create a new session called `$USER`, attach if it already exists.
    tmux attach || tmux new -A -D -s $USER
fi
