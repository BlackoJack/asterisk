FROM alpine:edge
MAINTAINER Raenko Ivan <admin@sysadminsk.ru>

ENV LANG ru_RU.utf8
ENV LC_ALL ru_RU.utf8
ENV LANGUAGE ru_RU.utf8
ENV TZ Asia/Novosibirsk

RUN apk add --update --no-cache tzdata asterisk asterisk-alsa asterisk-sounds-en asterisk-sounds-moh asterisk-odbc asterisk-curl asterisk-speex asterisk-sample-config asterisk-cdr-mysql
#RUN apk add mysql-connector-odbc asterisk-addons-mysql asterisk-sounds-ru psqlodbc
RUN  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN asterisk && sleep 5

COPY scripts/start.sh /

ENTRYPOINT ["/start.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
