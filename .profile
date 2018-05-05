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
        
        . "${XDG_CONFIG_HOME}/profile/00-util.sh"

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

}

main
