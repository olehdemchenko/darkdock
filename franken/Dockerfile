FROM dunglas/frankenphp
 
RUN install-php-extensions \
    pcntl \
    gd \
    imagick \
    # mcrypt NOT SUPPOORTED
    # mcrypt \
    mongodb \
    mysqli \
    # parallel PHP ^8.0
    parallel \ 
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    # xdebug NOT SUPPOORTED
    # xdebug \
    @composer;
    # Add other PHP extensions here...
 
COPY . /app
 
ENTRYPOINT ["php", "artisan", "octane:frankenphp"]