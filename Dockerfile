ARG VERSION=latest
FROM alpine:${VERSION}

LABEL version="0.1.0"
LABEL repository="https://github.com/hiPsyDuck/actions-php"

RUN apk update && \ 
	apk add php7 && \
	php=`php7`
