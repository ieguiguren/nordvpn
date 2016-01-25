# Script to autoupdate nordvpn server's list

This script downloads the servers list from NordVPN and automatically changes their names to end in .conf so they are debian init script compliant.

This will remove the actual list if it is downloaded correctly the new one.

It adds a line to configuration files so authentication is done automatically. Thus, we'd need to create a file with authentication credentials. As root, create the file /etc/openvpn/login and include just the login (email) and password, one per line. 
Example:
test@example.org
12345678

Then change permissions so it's only readable by root:
chmod 600 /etc/openvpn/login
