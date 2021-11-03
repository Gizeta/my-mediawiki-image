docker run -d --name elasticsearch-service -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "ES_JAVA_OPTS=-Xms128m -Xmx128m" elasticsearch:6.5.4
docker run -d --name mariadb-service -p 3306:3306 -e "MARIADB_ROOT_PASSWORD=12345678" mariadb:10.6.4
