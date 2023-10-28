
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#
ARG PHP_VERSION

FROM php:${PHP_VERSION}-zts

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

#
#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
#
# Installing tools and PHP extentions using "apt", "docker-php", "pecl",
#

# Install "curl", "libmemcached-dev", "libpq-dev", "libjpeg-dev",
#         "libpng-dev", "libfreetype6-dev", "libssl-dev", "libmcrypt-dev",
RUN set -eux; \
    apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends \
            curl \
            libmemcached-dev \
            libz-dev \
            libpq-dev \
            libjpeg-dev \
            libpng-dev \
            libfreetype6-dev \
            libssl-dev \
            libwebp-dev \
            libxpm-dev \
            libmcrypt-dev \
            libonig-dev; \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions event \
        gd \
        imagick \
        mcrypt \
        mongodb \
        mysqli \
        parallel \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        redis \
        xdebug \
        @composer;

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

ARG USER_NAME=darkdock
ENV USER_NAME ${USER_NAME}
ARG USER_GROUP=darkdock
ENV USER_GROUP ${USER_GROUP}

RUN groupadd -g ${PGID} ${USER_GROUP} && \
    useradd -l -u ${PUID} -g ${USER_GROUP} -m ${USER_NAME} && \
    usermod -p "*" ${USER_NAME} -s /bin/bash

#Set timezone
ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini