FROM rkleinwaechter/php71-fpm-xdebug
MAINTAINER Romano Kleinwaechter

RUN apt-get update && \
  apt-get install \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
  -y

# install iconv and mcrypt
RUN docker-php-ext-install -j$(nproc) iconv mcrypt

# install gd
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

