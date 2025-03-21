FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add --no-cache mariadb mariadb-client gettext-envsubst
RUN apk add --no-cache openrc
RUN mkdir -p /run/openrc/exclusive
RUN touch /run/openrc/softlevel

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tool/table_create.sh .
COPY ./tool/default.sql .

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

RUN rc-update add mariadb default

ARG SQL_USER
ARG SQL_DATABASE
ARG SQL_PASSWORD

RUN chmod +x ./table_create.sh

USER mysql
# RUN sh table_create.sh

EXPOSE 3306
ENTRYPOINT ["sh", "table_create.sh"]
# ENTRYPOINT ["mariadbd"]