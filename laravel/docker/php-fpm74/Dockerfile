FROM phpdockerio/php74-fpm:latest

MAINTAINER "Mohammed Mudassir <hello@mudasir.me>"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /code

# Install locales package
RUN apt-get update && apt-get -y --no-install-recommends install git nginx make \
    php7.4-redis php7.4-mysql php7.4-sqlite3 php7.4-intl php7.4-gmp php7.4-gd php7.4-bcmath \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data && \
    chown -R www-data:www-data /code

CMD php-fpm7.4

EXPOSE 9000
