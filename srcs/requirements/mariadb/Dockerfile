FROM alpine:3.20

WORKDIR /usr/src/Inception

COPY . .

RUN apk update
RUN apk add mysql mariadb mariadb-client --no-cache
RUN apk add openrc --no-cache
RUN mkdir -p /run/openrc/exclusive
RUN touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup
RUN rc-service mariadb start

# TODO only for debug
RUN apk add zsh git curl --no-cache
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


EXPOSE 3306

ENTRYPOINT ["sleep", "infinity"]