#!/bin/sh

# Location of various userfiles, eg init.vim.
set_env_var "VIM" "${XDG_CONFIG_HOME}/nvim"
set_env_var "VIMRUNTIME" "${XDG_CONFIG_HOME}/nvim"
