#!/usr/bin/env sh

#  Location for TMUX PLUGIN MANAGER
set_env_var "TMUX_PLUGIN_MANAGER_PATH" "${XDG_DATA_HOME}/tmux/plugins/"

#   # Check if current shell is running inside TMUX
#   if [ -z "${TMUX:-}" ]; then
#           # Create a new session called `$USER`, attach if it already exists.
#           if tmux has-session -t "${USER}" ; then
#                   tmux attach -t "${USER}"
#           else
#                   tmux new -s "${USER}"
#           fi
#   fi
