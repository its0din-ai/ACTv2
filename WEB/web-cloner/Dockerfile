FROM php:8.0-apache

RUN apt-get update && apt-get install -y curl

COPY flag.txt /flag.txt
RUN chmod 444 /flag.txt

COPY src/ /var/www/html
RUN mkdir /var/www/html/cloned
RUN chown -R www-data:www-data /var/www/html/cloned
RUN chmod -R 777 /var/www/html/cloned

CMD ["apache2-foreground"]