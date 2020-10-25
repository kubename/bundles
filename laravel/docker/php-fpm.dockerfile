FROM phpdockerio/php73-fpm:latest

MAINTAINER "Mohammed Mudassir<hello@mudasir.me>"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /code

# Install locales package
RUN apt-get update && apt-get -y --no-install-recommends install git \
    php7.3-redis php7.3-mysql php7.3-sqlite3 php7.3-intl php7.3-gmp php7.3-gd php7.3-bcmath \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data && \
    chown -R www-data:www-data /code

CMD php-fpm7.3

EXPOSE 9000
