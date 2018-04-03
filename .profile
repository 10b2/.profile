#!/bin/sh
# shellcheck shell=sh

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

# shellcheck disable=SC2034
XDG_DATA_HOME="${HOME}/.local/share"

# script utilities must be loaded first
# shellcheck source=.config/profile/util.sh
. "${XDG_CONFIG_HOME}/profile/util.sh"

# shellcheck source=.config/profile/vars.sh
. "${XDG_CONFIG_HOME}/profile/vars.sh"

load_extensions

main() {
	local distro
	local os

	distro=$(guess_distro)
	os=$(uname -s)

	case ${os} in
	'Linux')
		case ${distro} in
		'manjaro' | 'arch')
			:
			;;
		esac
		;;
	'Darwin')
		:
		;;
	esac
}

main
