#!/usr/bin/env sh

distribution=get_linix_distribution
pkgmanager=get_packager_manager

#######################################
# Guess Posix Distribution Type
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################

get_linix_distribution() {
	if [ -r /etc/os-release ]; then
		grep -e 'ID' -F /etc/os-release | sed 's/.*=//g' | tr -s '[:upper:]' '[:lower:]'
		echo "error reading file '/etc/os-release'."
	fi
}

#######################################
# Load extension files stored in $PROFILE directory.
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################
load_extensions() {
	e_files=$(find "${XDG_CONFIG_HOME}/profile" -type f | sort -n )
        #shellcheck disable=SC2116
        for file in $(echo "${e_files}"); do
                . "${file}"
        done
        unset e_files
}
#######################################
# Print the name of the user's default shell as defined by /etc/passwd.
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################

default_user_shell() {
	grep </etc/passwd -e "$USER" | sed -e 's/.*://g'
}

#######################################
# Check for an environment variable and set it to <value> if and only if $1 does not exist.
# Globals:
# Arguments:
#   $1           - The environment variable that is checked for existence.
#   $2           - The value of the environement variable if it does not exist.
# Returns:
#   None
#######################################

set_env_var() {
	# uppercase the environment variable.
	VAR=$(echo "$1" | tr "[:lower:]" "[:upper:]")
	if [ -z ${1:+} ]; then
		export "${VAR}=$2"
	fi
	unset VAR
}

#######################################
# Determine if command exists on the system.
# Globals:
# Arguments:
#   $1           - The command that is checked for existence.
# Returns:
#   None
#######################################

is_command() {
	command -v "$1" >/dev/null 2>&1
}

#######################################
# Determine the Operating System's Package Manager
# Globals:
#   $pkg_manager - The distribution specific package manager
# Arguments:
#   None
# Returns:
#   None
#######################################

get_pkg_manager() {
    case "$(uname -s)" in
        'GNU/Linux')
            case "$distribution" in
                'arch|manjaro')
                    echo pacman
                    ;;
                'fedora')
                    echo dnf
                    ;;
                'ubuntu|debian')
                    echo apt-get
                    ;;
                'opensuse')
                    echo yast
                    ;;
            esac
            ;;
        'Darwin')
                echo brew
            ;;
    esac
}

#######################################
# Install a package for the system.
# Globals:
#   $pkg_manager - The distribution specific package manager
# Arguments:
#   None
# Returns:
#   None
#######################################

install_package() {
        if ! is_command "$1" ; then
            case "$pkgmanager" in
                'pacman' )
                    pkgmanager="$pkgmanager -S"
                    ;;
                'dnf' )
                    pkgmanager="$pkgmanager install"
                    ;;
                'apt-get' )
                    pkgmanager="$pkgmanager install"
                    ;;
                'brew' )
                    pkgmanager="$pkgmanager install"
                    ;;
            esac
	    $(pkgmanager) "$1"
        fi
}
