#!/bin/sh

apk add --update --no-cache tzdata asterisk asterisk-alsa asterisk-sounds-en \
  asterisk-sounds-moh asterisk-odbc asterisk-curl asterisk-speex asterisk-sample-config \
  asterisk-cdr-mysql

rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

asterisk && sleep 5
