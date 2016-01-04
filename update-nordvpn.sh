#!/bin/bash -x


# Check if user has admin privileges
ID=$(id -u)
if [ $ID -ne 0 ] ; then
	echo "Must be root to execute this script"
	exit 1
fi

cd /etc/openvpn/
wget https://nordvpn.com/api/files/zip -O list.zip && OK=true

if [ OK ] ; then
	# delete previous servers' setups and unzip the new list
	rm /etc/openvpn/*ovpn*
	unzip list.zip
		# adds auto-login line if login file exists
	if [ -f login ] ; then
		LOGINFILE=true
	fi
	for f in *ovpn; do
		[ $LOGINFILE ] && echo 'auth-user-pass login' >> $f
		# to make the config file accessible to the service command, it must be named with .conf extension 
		mv $f ${f}.conf
	done
fi

