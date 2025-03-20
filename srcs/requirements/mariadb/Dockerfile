FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add mariadb
RUN apk add openrc  --no-cache
RUN mkdir -p /run/openrc/exclusive
RUN touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup

# TODO only for debug
RUN apk add zsh git curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY . .

EXPOSE 3306

ENTRYPOINT ["sleep", "infinity"]