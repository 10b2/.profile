#!/usr/bin/env sh

# Where packages are built
set_env_var "BUILDDIR" "/tmp/makepkg"

# Where to clone package build files
set_env_var "AURDEST" "/var/cache/pacaur"
