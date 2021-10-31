FROM mediawiki:1.35.4

COPY ./copy/composer.local.json /var/www/html/composer.local.json

RUN cd /var/www/html && \
    apt update && \
    apt install -y ssh-client wget zip unzip && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/ce43e63e47a7fca052628faf1e4b14f9100ae82c/web/installer -O - -q | php -- --quiet && \
    php composer.phar install

RUN cd /var/www/html/extensions && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/Echo.git Echo && \
    git clone https://github.com/nbdd0121/MW-FlowThread.git FlowThread && \
    cd FlowThread && \
    git checkout v1.3.2

COPY ./copy/.htaccess /var/www/html/.htaccess
