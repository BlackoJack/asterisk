#!/bin/sh

mkdir -p /opt/sql

apk add --update --no-cache expect tzdata lame \
  asterisk asterisk-sample-config asterisk-sounds-en asterisk-sounds-moh asterisk-speex \
  postgresql-client asterisk-pgsql

rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

mkdir /var/lib/asterisk/sounds/ru
wget -P /var/lib/asterisk/sounds/ru/ http://downloads.asterisk.org/pub/telephony/sounds/asterisk-core-sounds-ru-gsm-current.tar.gz
tar zxf /var/lib/asterisk/sounds/ru/asterisk-core-sounds-ru-gsm-current.tar.gz -C /var/lib/asterisk/sounds/ru/
rm -f /var/lib/asterisk/sounds/ru/asterisk-core-sounds-ru-gsm-current.tar.gz

echo "0" > /var/lib/asterisk/installed.txt

asterisk && sleep 5
