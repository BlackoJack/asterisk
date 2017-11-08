FROM alpine:edge
MAINTAINER Raenko Ivan <admin@sysadminsk.ru>

ENV LANG=ru_RU.utf8 \
 LC_ALL=ru_RU.utf8 \
 LANGUAGE=ru_RU.utf8 \
 TZ=Asia/Novosibirsk \
 MYSQL_HOST=asterisk_db \
 MYSQL_DATABASE=asterisk \
 MYSQL_USER=asterisk \
 MYSQL_PASSWORD=changeme

COPY scripts/ /
COPY configs/sql/ /
RUN /install.sh

VOLUME ["/etc/asterisk"]
VOLUME ["/var/spool/asterisk"]
VOLUME ["/var/lib/asterisk"]
VOLUME ["/var/log/asterisk"]

WORKDIR /var/lib/asterisk/

EXPOSE 5060/udp
EXPOSE 4569/udp

ENTRYPOINT ["/start.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
