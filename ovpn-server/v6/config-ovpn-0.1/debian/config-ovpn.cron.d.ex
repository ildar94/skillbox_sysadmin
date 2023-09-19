#
# Regular cron jobs for the config-ovpn package
#
0 4	* * *	root	[ -x /usr/bin/config-ovpn_maintenance ] && /usr/bin/config-ovpn_maintenance
