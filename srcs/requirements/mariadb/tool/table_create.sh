#!/bin/sh

set -e

# rc-service mariadb start
/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &

until mariadb-admin ping --silent; do
	echo "Waiting for MariaDB to be ready..."
	sleep 2
done

if [ -f "/tools/init.sql" ]; then
	envsubst < default.sql | mariadb
fi

# rc-service mariadb restart
sleep infinity
