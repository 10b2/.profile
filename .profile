#! /bin/sh

# Guess Linux Distribution Type 
check_distro()
{
if [ -r /etc/os-release ]
then
	echo $(grep -e 'ID' -F /etc/os-release | sed s/.*=//g | tr -s '[:upper:]' '[:lower:]')
else 
	echo "error reading file '/etc/os-release'."
fi
}

distro=$(check_distro)
os=$(uname -s)

# XDG configuration home variable
if [ -z ${XDG_CONFIG_HOME:+} ]
then 
	XDG_CONFIG_HOME="${HOME}/.config" 
	export XDG_CONFIG_HOME
fi 

case ${distro} in 
'manjaro'|'arch')
	# makepkg environment variables
	if [ -z ${BUILDDIR:+} ]
	then
		if [ ! -d /tmp/makepkg ] 
		then
			mkdir /tmp/makepkg
		fi
		BUILDDIR=/tmp/makepkg
		export BUILDDIR
	fi
	which pacaur 2>&1 > /dev/null 
	# Install pacaur for packages
 	if [ $? -ne 0 ]
       	then
		pacman -Sy pacaur 
	fi
	# Arch User repository clone folder
	if [ -z ${AURDEST:+} ]
	then
		if ! mkdir -m 777 /var/cache/pacaur 2>&1 /dev/null
		then
			echo 'creating /var/cache/pauaur directory'
			su -c 'mkdir -m 777 /var/cache/pacaur'
		fi
		AURDEST=/var/cache/pacaur
		export AURDEST
	fi
	;;
esac

