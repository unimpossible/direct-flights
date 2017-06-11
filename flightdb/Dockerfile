FROM mysql:5

ENV MYSQL_ROOT_PASSWORD hitemwiththeroot
ENV MYSQL_DATABASE flights
ENV MYSQL_USER flight-user
ENV MYSQL_PASSWORD flyingawaywiththewind

COPY ./import /opt/import/

RUN apt-get update && apt-get install -y wget
RUN chmod 777 /opt/import

COPY import.sh /docker-entrypoint-initdb.d
