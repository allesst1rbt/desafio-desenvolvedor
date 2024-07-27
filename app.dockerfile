FROM php:8.3-fpm
RUN apt-get update && apt-get install -y git openssl  unzip libmcrypt-dev  libzip-dev libxml2-dev libonig-dev  \
    libmagickwand-dev --no-install-recommends
RUN pecl install mcrypt-1.0.4
RUN docker-php-ext-enable mcrypt
        
RUN docker-php-ext-install gd  tokenizer xml pdo mbstring pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer