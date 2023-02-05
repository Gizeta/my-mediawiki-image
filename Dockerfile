FROM mediawiki:1.39.1

COPY ./copy/composer.local.json /var/www/html/composer.local.json
COPY ./copy/extensions/. /var/www/html/extensions/

RUN cd /var/www/html && \
    apt update && \
    apt install -y ssh-client wget && \
    wget https://getcomposer.org/download/2.5.2/composer.phar && \
    php composer.phar update --no-dev

RUN cd /var/www/html/extensions && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/Arrays.git Arrays && \
    git clone --depth 1 --branch 3.4 https://gerrit.wikimedia.org/r/mediawiki/extensions/Cargo Cargo && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/Echo.git Echo && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/Elastica.git Elastica && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/CirrusSearch.git CirrusSearch && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/LabeledSectionTransclusion.git LabeledSectionTransclusion && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/LoopFunctions.git LoopFunctions && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/ReplaceSet.git ReplaceSet && \
    git clone --depth 1 --branch REL1_39 https://gerrit.wikimedia.org/r/mediawiki/extensions/Widgets.git Widgets && \
    git clone --depth 1 --branch v1.3.3 https://github.com/nbdd0121/MW-FlowThread.git FlowThread

RUN cd /var/www/html/extensions/Widgets && \
    php /var/www/html/composer.phar update --no-dev && \
    cd /var/www/html/extensions/Elastica && \
    php /var/www/html/composer.phar update --no-dev

RUN chmod 777 /var/www/html/extensions/Widgets/compiled_templates && \
    mkdir /var/www/html/external && \
    mkdir /var/www/html/external/mediaelement && \
    wget -O /var/www/html/external/mediaelement/mejs-controls.svg https://cdnjs.cloudflare.com/ajax/libs/mediaelement/5.0.4/mejs-controls.svg

COPY ./copy/.htaccess /var/www/html/.htaccess
COPY ./copy/skins/. /var/www/html/skins/
