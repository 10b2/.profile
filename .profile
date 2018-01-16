#!/bin/sh

#######################################
#
#  Portable-Profile Settings
#
#  Maintainer: Idigo Luwum
#
#######################################

set -a

#######################################
#  Source files from XDG_CONFIG_HOME
#######################################

XDG_CONFIG_HOME="${HOME}/.config"

# Basic must be loaded first
. "${XDG_CONFIG_HOME}/profile/util.sh"
. "${XDG_CONFIG_HOME}/profile/vars.sh"
for conf in $(find "${XDG_CONFIG_HOME}/profile" -path "${XDG_CONFIG_HOME}/profile/.git" -prune \
    -o \! \( -name util.sh -o -name vars.sh \) -type f); do
    . "${conf}"
done

main() {
    local distro=$(guess_distro)
    local os=$(uname -s)

    case ${distro} in
    'manjaro'|'arch')
        pacman -Sc
        pacman -Syyu
        ;;
    esac
}

main
