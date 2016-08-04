#httpd 2.2

FROM httpd:2.2

ENV APACHE_MOD_PROXY=""

COPY entrypoint.sh /entrypoint.sh
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY server.key /usr/local/apache2/conf/server.key
COPY server.crt /usr/local/apache2/conf/server.crt

RUN apt-get update && apt-get install net-tools -y

ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd-foreground"]
