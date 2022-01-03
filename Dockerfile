FROM mediawiki:1.35.5

COPY ./copy/composer.local.json /var/www/html/composer.local.json
COPY ./copy/extensions/. /var/www/html/extensions/

RUN cd /var/www/html && \
    apt update && \
    apt install -y ssh-client wget zip unzip && \
    wget https://raw.githubusercontent.com/composer/getcomposer.org/ce43e63e47a7fca052628faf1e4b14f9100ae82c/web/installer -O - -q | php -- --quiet && \
    php composer.phar install

RUN cd /var/www/html/extensions && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/Arrays.git Arrays && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/Echo.git Echo && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/Elastica.git Elastica && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/CirrusSearch.git CirrusSearch && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/LabeledSectionTransclusion.git LabeledSectionTransclusion && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/LoopFunctions.git LoopFunctions && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/RegexFun.git RegexFun && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/ReplaceSet.git ReplaceSet && \
    git clone --branch REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/Widgets.git Widgets && \
    git clone https://github.com/nbdd0121/MW-FlowThread.git FlowThread

RUN cd /var/www/html/extensions/FlowThread && \
    git checkout v1.3.2 && \
    cd /var/www/html/extensions/Widgets && \
    php /var/www/html/composer.phar update --no-dev && \
    cd /var/www/html/extensions/Elastica && \
    git checkout -f 3e3b76f3b7208167342fee843c401f2587dacde3 && \
    php /var/www/html/composer.phar update --no-dev && \
    cd /var/www/html/extensions/CirrusSearch && \
    git checkout -f 9e203ac720bf99a20d0ff03f31f289dfc61f2e16

RUN chmod 777 /var/www/html/extensions/Widgets/compiled_templates && \
    mkdir /var/www/html/external && \
    mkdir /var/www/html/external/mediaelement && \
    wget -O /var/www/html/external/mediaelement/mejs-controls.svg https://cdnjs.cloudflare.com/ajax/libs/mediaelement/5.0.4/mejs-controls.svg

COPY ./copy/.htaccess /var/www/html/.htaccess
