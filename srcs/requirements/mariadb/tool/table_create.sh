#!/bin/sh

set -e

/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &


until mariadb-admin ping --silent; do
	echo "Waiting for MariaDB to be ready..."
	sleep 2
done

if [ -f "default.sql" ]; then
	envsubst < default.sql | mariadb
fi

sleep infinity