DIR=`pwd`/copy

docker build -t my-mediawiki .
docker stop some-mediawiki
docker rm some-mediawiki

if [ -f "RUN" ]; then
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -v $DIR/LocalSettings.php:/var/www/html/LocalSettings.php \
    -v $DIR/.smw.json:/var/www/html/.smw.json \
    -v $DIR/images:/var/www/html/images \
    -d my-mediawiki
elif [ -f "INIT" ]; then
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -v $DIR/LocalSettings.php:/var/www/html/LocalSettings.php \
    -v $DIR/images:/var/www/html/images \
    -d my-mediawiki
else
  docker run --name some-mediawiki -p 9080:80 \
    -v $DIR/data:/var/www/data \
    -v $DIR/images:/var/www/html/images \
    -d my-mediawiki
fi
