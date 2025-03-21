#!/bin/sh

set -e

# rc-service mariadb start
/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &

echo "Waiting for MariaDB to be ready..."
until mariadb-admin ping --silent; do
	sleep 2
done

# Run the SQL script
if [ -f "/tools/init.sql" ]; then
	envsubst < /tools/init.sql | mariadb
fi

# rc-service mariadb restart
