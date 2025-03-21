FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add mariadb mariadb-client --no-cache
RUN apk add openrc --no-cache
RUN mkdir -p /run/openrc/exclusive
RUN touch /run/openrc/softlevel

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/my.cnf /etc/my.cnf
COPY ./conf/table_create.sh .

# TODO only for debug
RUN apk add zsh git curl --no-cache
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN /etc/init.d/mariadb setup
RUN rc-update add mariadb default

EXPOSE 3306

ARG SQL_USER
ARG SQL_DATABASE
ARG SQL_PASSWORD

RUN sh "table_create.sh"
COPY ./conf/env_file .


ENTRYPOINT ["mariadbd-safe"]
# ENTRYPOINT ["sh", "table_create.sh"]