#!/bin/sh

if [ "$1" = "" ]; then
  # This works if CMD is empty or not specified in Dockerfile
  exec asterisk -vvvdddc
else

  cat <<EOF >> /etc/asterisk/res_config_mysql.conf
[$MYSQL_DATABASE]
dbhost = $MYSQL_HOST
dbname = $MYSQL_DATABASE
dbuser = $MYSQL_USER
dbpass = $MYSQL_PASSWORD
dbport = 3306
dbcharset = utf8
EOF

  cat <<EOF >> /etc/asterisk/extconfig.conf
iaxusers => mysql,$MYSQL_DATABASE
iaxpeers => mysql,$MYSQL_DATABASE
sippeers => mysql,$MYSQL_DATABASE
sipregs => mysql,$MYSQL_DATABASE
ps_endpoints => mysql,$MYSQL_DATABASE
ps_auths => mysql,$MYSQL_DATABASE
ps_aors => mysql,$MYSQL_DATABASE
ps_domain_aliases => mysql,$MYSQL_DATABASE
ps_endpoint_id_ips => mysql,$MYSQL_DATABASE
ps_outbound_publishes => mysql,$MYSQL_DATABASE
ps_inbound_publications = mysql,$MYSQL_DATABASE
ps_asterisk_publications = mysql,$MYSQL_DATABASE
ps_transports => mysql,$MYSQL_DATABASE
ps_registrations => mysql,$MYSQL_DATABASE
ps_contacts => mysql,$MYSQL_DATABASE
voicemail => mysql,$MYSQL_DATABASE
extensions => mysql,$MYSQL_DATABASE
meetme => mysql,$MYSQL_DATABASE
queues => mysql,$MYSQL_DATABASE
queue_members => mysql,$MYSQL_DATABASE
queue_rules => mysql,$MYSQL_DATABASE
acls => mysql,$MYSQL_DATABASE
musiconhold => mysql,$MYSQL_DATABASE
queue_log => mysql,$MYSQL_DATABASE
followme => mysql,$MYSQL_DATABASE
followme_numbers => mysql,$MYSQL_DATABASE
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

  mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "use $MYSQL_DATABASE; source /full.sql";

  exec "$@"
fi
