#! /bin/sh
# /etc/init.d/openvpn

set -e

# variables
NAME=openvpn
PIDFILE=/var/run/$NAME.pid
DAEMON=/opt/openvpn/sbin/openvpn
DAEMON_OPTS="/opt/openvpn/etc/client.conf"

case "$1" in
    start)
	echo -n "Starting $NAME client\n"
	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON $DAEMON_OPTS
	echo "."
	;;
    stop)
	echo -n "Stopping $NAME client\n"
	start-stop-daemon --stop --quiet --oknodo --pidfile $PIDFILE
	echo "."
	;;
    *)
	echo "Usage: "$1" {start|stop}"
	exit 1
esac

exit 0

