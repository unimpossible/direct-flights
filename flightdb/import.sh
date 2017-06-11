#!/bin/bash
echo "Downloading data..."
wget -O /opt/import/airports.dat https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat
wget -O /opt/import/routes.dat https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat
wget -O /opt/import/airlines.dat https://raw.githubusercontent.com/jpatokal/openflights/master/data/airlines.dat

#remove all quotes
sed -i 's/\"//g' /opt/import/*.dat
#remove us airways as active airline
sed -i '/US Airways/s/,Y/,N/g' /opt/import/airlines.dat

echo "Importing data...."
mysql -u root --password=$MYSQL_ROOT_PASSWORD < /opt/import/db-setup.sql

# Import airlines
mysqlimport --fields-terminated-by=, --local -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE /opt/import/airlines.dat

#import airports
mysqlimport --fields-terminated-by=, --local -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE /opt/import/airports.dat

#import routes
mysqlimport --fields-terminated-by=, --local -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE /opt/import/routes.dat
