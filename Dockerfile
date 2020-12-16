ARG VERSION=latest
FROM alpine:${VERSION}

LABEL version="0.1.0"
LABEL repository="https://github.com/hiPsyDuck/actions-php"

# 安装基础 package
RUN set -x \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache tzdata vim openssl openssh openssl-dev bash curl \
    # 变更时区
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata
    
# 安装 PHP 
RUN set -x \
    && apk update \
    && apk add --no-cache php7 php7-fpm php7-pear php7-dev \
        php7-curl php7-json php7-phar php7-iconv php7-openssl php7-dom php7-mbstring
