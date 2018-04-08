#!/usr/bin/env sh
# shellcheck shell=sh

#######################################
#
#  Portable-Profile Settings
#
#  Maintainer: Idigo Luwum
#
#######################################

set -a

main() {

	XDG_CONFIG_HOME="${HOME}/.config"

        #shellcheck disable=2034
	XDG_DATA_HOME="${HOME}/.local/share"

        #shellcheck disable=2034
        XDG_BIN_HOME="${HOME}/.local/bin"

	# script utilities must be loaded first
	# shellcheck source=.config/profile/util.sh
	. "${XDG_CONFIG_HOME}/profile/util.sh"

	# shellcheck source=.config/profile/vars.sh
	. "${XDG_CONFIG_HOME}/profile/vars.sh"

	load_extensions

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
        
	unset distro
	unset os

	cd "$HOME" || return
}

main
