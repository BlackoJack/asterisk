#!/bin/sh

apk add --update --no-cache tzdata lame mysql-client asterisk asterisk-sounds-en \
  asterisk-sounds-moh asterisk-curl asterisk-speex asterisk-sample-config \
  asterisk-cdr-mysql

rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

mkdir /var/lib/asterisk/sounds/ru
wget -P /var/lib/asterisk/sounds/ru/ http://downloads.asterisk.org/pub/telephony/sounds/asterisk-core-sounds-ru-gsm-current.tar.gz
tar zxf /var/lib/asterisk/sounds/ru/asterisk-core-sounds-ru-gsm-current.tar.gz -C /var/lib/asterisk/sounds/ru/
rm -f /var/lib/asterisk/sounds/ru/asterisk-core-sounds-ru-gsm-current.tar.gz

asterisk && sleep 5
