FROM "php:8.1.16-apache"

# 必要なプログラムのインストール
RUN apt-get update
RUN apt-get install zip unzip

# Docker php extension installerの導入と、それによるpdo_pgsqlのインストール
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo_pgsql

# composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer

# composerで依存ライブラリをインストール
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /var/www/html
COPY ./server/composer.json /var/www/html/
COPY ./server/composer.lock /var/www/html/
RUN composer install
