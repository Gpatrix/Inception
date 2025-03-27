#!/bin/sh

set -e
trap "exit" TERM

/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &

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

wait