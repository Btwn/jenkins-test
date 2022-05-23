FROM php:7.1.17-apache
LABEL maintainer="Jaivic"

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y curl
  # zlibig-dev \
  # libicu-dev \
  # libxml2-dev \
  # libpq-dev 
  # && docker-php-extconfigure pgsql -with-pgsql=/usr/local/pgsql \
  # && docker-php-ext-install pdo pdo_mysql pdo_pgsql zip intl xmlrcp soap opcache \
  # && apt-get install vim -y

COPY . /var/www/html/
WORKDIR /var/www/html/
