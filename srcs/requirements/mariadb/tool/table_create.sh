#!/bin/sh

set -e


/usr/bin/mariadbd-safe --datadir=/varz/lib/mysql &

if ! rc-service mariadb status ; then
	echo "MariaDB service failed to start"
	exit 1
fi

until mariadb-admin ping --silent; do
	echo "Waiting for MariaDB to be ready..."
	sleep 2
done

if [ -f "/tools/init.sql" ]; then
	envsubst < default.sql | mariadb
fi

sleep infinity
