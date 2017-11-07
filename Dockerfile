FROM alpine
MAINTAINER Raenko Ivan <admin@sysadminsk.ru>

ENV LANG ru_RU.utf8
ENV LC_ALL ru_RU.utf8
ENV LANGUAGE ru_RU.utf8
ENV TZ Asia/Novosibirsk

RUN apk add --update psqlodbc mysql-connector-odbc tzdata asterisk asterisk-alsa asterisk-sounds-en asterisk-sounds-ru asterisk-sounds-moh asterisk-odbc asterisk-curl asterisk-speex asterisk-sample-config asterisk-addons-mysql \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN asterisk && sleep 5

COPY scripts/start.sh /

ENTRYPOINT ["/start.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
