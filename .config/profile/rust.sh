#!/usr/bin/env sh

# Rust cargo repository data.
set_env_var "CARGO_HOME" "${XDG_DATA_HOME}/cargo"

if [ ! -d "$CARGO_HOME" ]; then 
    mkdir -p "$CARGO_HOME"
fi

