FROM php:7.2-apache
RUN apt-get update && \
  apt-get install -y libpq-dev libcurl4-gnutls-dev && \
  docker-php-ext-install pdo pdo_pgsql curl && \
  docker-php-ext-enable curl && \
  a2enmod rewrite
COPY src/ /var/www/html