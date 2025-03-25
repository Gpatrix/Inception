#!/bin/sh

set -e

/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &

mariadb_pid=$!

until mariadb-admin ping --silent; do
	echo "Waiting for MariaDB to be ready..."
	sleep 2
done

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
	echo "Initializing database..."
	if [ -f "default.sql" ]; then
		envsubst < default.sql | mariadb
	fi
else
	echo "Database already initialized."
fi

echo "SHUTDOWN;" | mariadb
sleep 2

exec /usr/bin/mariadbd-safe --datadir=/var/lib/mysql