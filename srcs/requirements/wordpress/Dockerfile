FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add lighttpd php82 fcgi php82-cgi

# TODO only for debug
RUN apk add zsh git curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY . .

EXPOSE 9000

ENTRYPOINT ["sleep", "infinity"]