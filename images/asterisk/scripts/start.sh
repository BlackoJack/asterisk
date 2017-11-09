#!/bin/sh

if [ "$(cat /var/lib/asterisk/installed.txt)" = 0 ]; then

  echo "1" > /var/lib/asterisk/installed.txt

  echo "preload => res_config_pgsql.so" >> /etc/asterisk/modules.conf
  echo "noload => chan_sip.so" >> /etc/asterisk/modules.conf
  echo "noload => cel_pgsql.so" >> /etc/asterisk/modules.conf
  echo "noload => cdr_csv.so" >> /etc/asterisk/modules.conf
  echo "noload => cdr_custom.so" >> /etc/asterisk/modules.conf
  echo "noload => cel_custom.so" >> /etc/asterisk/modules.conf
  echo "noload => cel_manager.so" >> /etc/asterisk/modules.conf
  echo "noload => res_phoneprov.so" >> /etc/asterisk/modules.conf
  echo "noload => res_pjsip_phoneprov_provider.so" >> /etc/asterisk/modules.conf

  sed -i "s|dbhost=127.0.0.1|dbhost=$POSTGRES_HOST|" /etc/asterisk/res_pgsql.conf
  sed -i "s|dbname=asterisk|dbname=$POSTGRES_DB|" /etc/asterisk/res_pgsql.conf
  sed -i "s|dbuser=asterisk|dbuser=$POSTGRES_USER|" /etc/asterisk/res_pgsql.conf
  sed -i "s|dbpass=password|dbpass=$POSTGRES_PASSWORD|" /etc/asterisk/res_pgsql.conf

  sed -i "s|;hostname=localhost|hostname=$POSTGRES_HOST|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;port=5432|port=5432|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;dbname=asterisk|dbname=$POSTGRES_DB|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;password=password|password=$POSTGRES_PASSWORD|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;user=postgres|user=$POSTGRES_USER|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;table=cdr		;SQL table where CDRs will be inserted|table=cdr		;SQL table where CDRs will be inserted|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;encoding=LATIN9	; Encoding of logged characters in Asterisk|encoding=UTF8	; Encoding of logged characters in Asterisk|" /etc/asterisk/cdr_pgsql.conf
  sed -i "s|;timezone=UTC		; Uncomment if you want datetime fields in UTC/GMT|timezone=$TZ		; Uncomment if you want datetime fields in UTC/GMT|" /etc/asterisk/cdr_pgsql.conf

  sed -i "s|rtpstart=10000|rtpstart=16364|g" /etc/asterisk/rtp.conf
  sed -i "s|rtpend=20000|rtpend=16394|g" /etc/asterisk/rtp.conf

  sed -i "s|;cache_record_files = yes	; Cache recorded sound files to another|cache_record_files = yes	; Cache recorded sound files to another|" /etc/asterisk/asterisk.conf
  sed -i "s|;record_cache_dir = /tmp	; Specify cache directory (used in conjunction|record_cache_dir = /tmp/asterisk	; Specify cache directory (used in conjunction|" /etc/asterisk/asterisk.conf
  sed -i "s|;defaultlanguage = en|defaultlanguage = ru|" /etc/asterisk/asterisk.conf

  cat <<EOF >> /etc/asterisk/extconfig.conf
iaxfriends => pgsql,$POSTGRES_DB
sippeers => pgsql,$POSTGRES_DB
ps_endpoints => pgsql,$POSTGRES_DB
ps_auths => pgsql,$POSTGRES_DB
ps_aors => pgsql,$POSTGRES_DB
ps_domain_aliases => pgsql,$POSTGRES_DB
ps_endpoint_id_ips => pgsql,$POSTGRES_DB
ps_outbound_publishes => pgsql,$POSTGRES_DB
ps_inbound_publications = pgsql,$POSTGRES_DB
ps_asterisk_publications = pgsql,$POSTGRES_DB
ps_transports => pgsql,$POSTGRES_DB
ps_registrations => pgsql,$POSTGRES_DB
ps_contacts => pgsql,$POSTGRES_DB
ps_globals => pgsql,$POSTGRES_DB
ps_resource_list => pgsql,$POSTGRES_DB
ps_subscription_persistence => pgsql,$POSTGRES_DB
ps_systems => pgsql,$POSTGRES_DB
voicemail => pgsql,$POSTGRES_DB
extensions => pgsql,$POSTGRES_DB
meetme => pgsql,$POSTGRES_DB
queues => pgsql,$POSTGRES_DB
queue_members => pgsql,$POSTGRES_DB
queue_rules => pgsql,$POSTGRES_DB
musiconhold => pgsql,$POSTGRES_DB
;followme => pgsql,$POSTGRES_DB
;followme_numbers => pgsql,$POSTGRES_DB
EOF

  cat <<EOF >> /etc/asterisk/sorcery.conf
[app_followme]
followme=realtime,followme
followme_member=realtime,followme_members

[res_pjsip] ; Realtime PJSIP configuration wizard
endpoint=realtime,ps_endpoints
auth=realtime,ps_auths
aor=realtime,ps_aors
transport=realtime,ps_transports
domain_alias=realtime,ps_domain_aliases
contact=realtime,ps_contacts

[res_pjsip_endpoint_identifier_ip]
identify=realtime,ps_endpoint_id_ips

[res_pjsip_outbound_registration]
registration=realtime,ps_registrations
EOF

  cat <<EOF > /etc/asterisk/extensions.conf
[general]
static=yes
writeprotect=yes
clearglobalvars=no

[default]
switch => Realtime/@extensions
EOF

  cat <<EOF > /etc/asterisk/voicemail.conf
[general]
format=wav49|gsm|wav
serveremail=asterisk
attach=yes
skipms=3000
maxsilence=10
silencethreshold=128
maxlogins=3
emaildateformat=%A, %B %d, %Y at %r
pagerdateformat=%A, %B %d, %Y at %r
sendvoicemail=yes
EOF

  echo '' > /etc/asterisk/pjsip.conf

  sleep 15
  /usr/bin/expect<<EOF
    log_user 1
    set timeout 1000
    spawn psql -U$POSTGRES_USER -W -d $POSTGRES_DB -h $POSTGRES_HOST -f /opt/sql/postgresql_config.sql
    expect "Password for user $POSTGRES_USER:"
    send "$POSTGRES_PASSWORD\n"
    expect eof
EOF

  /usr/bin/expect<<EOF
    log_user 1
    set timeout 1000
    spawn psql -U$POSTGRES_USER -W -d $POSTGRES_DB -h $POSTGRES_HOST -f /opt/sql/postgresql_cdr.sql
    expect "Password for user $POSTGRES_USER:"
    send "$POSTGRES_PASSWORD\n"
    expect eof
EOF

  /usr/bin/expect<<EOF
    log_user 1
    set timeout 1000
    spawn psql -U$POSTGRES_USER -W -d $POSTGRES_DB -h $POSTGRES_HOST -f /opt/sql/postgresql_voicemail.sql
    expect "Password for user $POSTGRES_USER:"
    send "$POSTGRES_PASSWORD\n"
    expect eof
EOF

fi


if [ "$1" = "" ]; then
  # This works if CMD is empty or not specified in Dockerfile
  exec asterisk -vvvdddc
else
  exec "$@"
fi
