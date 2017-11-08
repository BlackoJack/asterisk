#!/bin/sh

if [ "$1" = "" ]; then
  # This works if CMD is empty or not specified in Dockerfile
  exec asterisk -vvvdddc
else

  cat <<EOF >> /etc/asterisk/res_pgsql.conf
[$POSTGRES_DB]
dbhost = $POSTGRES_HOST
dbname = $POSTGRES_DB
dbuser = $POSTGRES_USER
dbpass = $POSTGRES_PASSWORD
dbport = 5432
EOF

  cat <<EOF >> /etc/asterisk/extconfig.conf
iaxusers => pgsql,$POSTGRES_DB
iaxpeers => pgsql,$POSTGRES_DB
sippeers => pgsql,$POSTGRES_DB
sipregs => pgsql,$POSTGRES_DB
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
voicemail => pgsql,$POSTGRES_DB
extensions => pgsql,$POSTGRES_DB
meetme => pgsql,$POSTGRES_DB
queues => pgsql,$POSTGRES_DB
queue_members => pgsql,$POSTGRES_DB
queue_rules => pgsql,$POSTGRES_DB
acls => pgsql,$POSTGRES_DB
musiconhold => pgsql,$POSTGRES_DB
queue_log => pgsql,$POSTGRES_DB
followme => pgsql,$POSTGRES_DB
followme_numbers => pgsql,$POSTGRES_DB
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

  sleep 15
  /usr/bin/expect<<EOF
    log_user 1
    set timeout 1000
    spawn psql -U$POSTGRES_USER -W -d $POSTGRES_DB -h $POSTGRES_HOST -f /opt/sql/postgresql_config.sql
    expect "Password for user $POSTGRES_USER:"
    send "$POSTGRES_PASSWORD\n"
    expect eof
EOF

  exec "$@"
fi
