#
# Regular cron jobs for the monitoring package
#
0 4	* * *	root	[ -x /usr/bin/monitoring_maintenance ] && /usr/bin/monitoring_maintenance
