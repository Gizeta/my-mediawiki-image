FROM mediawiki:1.35.4

COPY ./copy/composer.local.json /var/www/html/composer.local.json

RUN cd /var/www/html && \
    apt update && \
    apt install -y ssh-client wget zip unzip && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/ce43e63e47a7fca052628faf1e4b14f9100ae82c/web/installer -O - -q | php -- --quiet && \
    php composer.phar install

COPY ./copy/.htaccess /var/www/html/.htaccess
