# Script to autoupdate nordvpn servers list

This script downloads the servers list from NordVPN and automatically changes their names to end in .conf so they are debian init script compliant.

This will remove the actual list if it is downloaded correctly the new one.

It adds a line so authentication is done automatically. To create such file, as root, create the file /etc/openvpn/login and include the login (email) and password each in one line. Then change permissions so it's only readable by root:
chmod 600 /etc/openvpn/login
