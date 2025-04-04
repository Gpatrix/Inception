FROM alpine:3.20.6

WORKDIR /usr/src/Inception

RUN apk update --no-cache
RUN apk add --no-cache mariadb mariadb-client gettext-envsubst
RUN apk add --no-cache openrc
RUN mkdir -p /run/openrc/exclusive
RUN touch /run/openrc/softlevel

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ARG SQL_USER

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

RUN mariadb-install-db --user=${SQL_USER} --datadir=/var/lib/mysql
RUN /etc/init.d/mariadb setup

RUN rc-update add mariadb default

ARG SQL_DATABASE
ARG SQL_PASSWORD

COPY ./tool/table_create.sh .
COPY ./tool/default.sql .
RUN chmod +x ./table_create.sh

USER ${SQL_USER}

EXPOSE 3306
ENTRYPOINT ["sh", "table_create.sh"]