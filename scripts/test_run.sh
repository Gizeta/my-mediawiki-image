DIR=`pwd`

docker build -t my-mediawiki .
docker stop some-mediawiki
docker rm some-mediawiki

if [ -f "RUN" ]; then
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -v $DIR/copy/LocalSettings.php:/var/www/html/LocalSettings.php \
    -v $DIR/copy/.smw.json:/var/www/html/.smw.json \
    -d my-mediawiki
elif [ -f "INIT" ]; then
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -v $DIR/copy/LocalSettings.php:/var/www/html/LocalSettings.php \
    -d my-mediawiki
else
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -d my-mediawiki
fi
