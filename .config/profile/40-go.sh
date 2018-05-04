#!/usr/bin/env sh

# Go Environment Variables
set_env_var "GOPATH" "${XDG_DATA_HOME}/go"
set_env_var "GOBIN" "${XDG_BIN_HOME}"

# GVM Environment Variables
set_env_var "GVM_ROOT" "${XDG_DATA_HOME}/gvm"
