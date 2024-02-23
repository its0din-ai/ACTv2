FROM php:8.2.0-apache

RUN apt-get update && apt-get install -y \
    iputils-ping \
    && docker-php-ext-install mysqli pdo pdo_mysql

RUN echo 'session.save_path = "/tmp"' >> /usr/local/etc/php/php.ini

WORKDIR /var/www/html
COPY ./app/ .

EXPOSE 80
CMD ["apache2-foreground"]