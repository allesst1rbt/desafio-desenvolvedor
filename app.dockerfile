FROM php:8.3-fpm
RUN apt-get update && apt-get install -y git openssl  unzip libmcrypt-dev  libzip-dev libxml2-dev libonig-dev  \
    libmagickwand-dev --no-install-recommends
RUN pecl install mcrypt-1.0.7
RUN docker-php-ext-enable mcrypt
        
RUN docker-php-ext-install gd 
RUN docker-php-ext-install xml
RUN docker-php-ext-install pdo
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install pdo_mysql

COPY ./docker-php-entrypoint /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer