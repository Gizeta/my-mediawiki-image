VERSION=`date +"%y%m%d%H%M"`

docker build -t skyfish624/my-mediawiki-image:$VERSION .
docker push skyfish624/my-mediawiki-image:$VERSION
