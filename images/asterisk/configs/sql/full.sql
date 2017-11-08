-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ${MYSQL_DATABASE}
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `${MYSQL_DATABASE}`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `${MYSQL_DATABASE}` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `${MYSQL_DATABASE}`;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `accountcode` varchar(80) DEFAULT NULL,
  `src` varchar(80) DEFAULT NULL,
  `dst` varchar(80) DEFAULT NULL,
  `dcontext` varchar(80) DEFAULT NULL,
  `clid` varchar(80) DEFAULT NULL,
  `channel` varchar(80) DEFAULT NULL,
  `dstchannel` varchar(80) DEFAULT NULL,
  `lastapp` varchar(80) DEFAULT NULL,
  `lastdata` varchar(80) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `answer` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `billsec` int(11) DEFAULT NULL,
  `disposition` varchar(45) DEFAULT NULL,
  `amaflags` varchar(45) DEFAULT NULL,
  `userfield` varchar(256) DEFAULT NULL,
  `uniqueid` varchar(150) DEFAULT NULL,
  `linkedid` varchar(150) DEFAULT NULL,
  `peeraccount` varchar(80) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int(11) NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context` (`context`,`exten`,`priority`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaxfriends`
--

DROP TABLE IF EXISTS `iaxfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaxfriends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int(11) DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `iaxfriends_name` (`name`),
  KEY `iaxfriends_name_host` (`name`,`host`),
  KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  KEY `iaxfriends_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaxfriends`
--

LOCK TABLES `iaxfriends` WRITE;
/*!40000 ALTER TABLE `iaxfriends` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaxfriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetme` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int(11) DEFAULT NULL,
  `members` int(11) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetme`
--

LOCK TABLES `meetme` WRITE;
/*!40000 ALTER TABLE `meetme` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiconhold`
--

DROP TABLE IF EXISTS `musiconhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiconhold`
--

LOCK TABLES `musiconhold` WRITE;
/*!40000 ALTER TABLE `musiconhold` DISABLE KEYS */;
/*!40000 ALTER TABLE `musiconhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_aors`
--

DROP TABLE IF EXISTS `ps_aors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_aors`
--

LOCK TABLES `ps_aors` WRITE;
/*!40000 ALTER TABLE `ps_aors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_aors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_asterisk_publications`
--

DROP TABLE IF EXISTS `ps_asterisk_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_asterisk_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_asterisk_publications`
--

LOCK TABLES `ps_asterisk_publications` WRITE;
/*!40000 ALTER TABLE `ps_asterisk_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_asterisk_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_auths`
--

DROP TABLE IF EXISTS `ps_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int(11) DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_auths`
--

LOCK TABLES `ps_auths` WRITE;
/*!40000 ALTER TABLE `ps_auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_contacts`
--

DROP TABLE IF EXISTS `ps_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `expiration_time` bigint(20) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(20) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int(11) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_contacts`
--

LOCK TABLES `ps_contacts` WRITE;
/*!40000 ALTER TABLE `ps_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_domain_aliases`
--

DROP TABLE IF EXISTS `ps_domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_domain_aliases`
--

LOCK TABLES `ps_domain_aliases` WRITE;
/*!40000 ALTER TABLE `ps_domain_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_domain_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoint_id_ips`
--

DROP TABLE IF EXISTS `ps_endpoint_id_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoint_id_ips`
--

LOCK TABLES `ps_endpoint_id_ips` WRITE;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoints`
--

DROP TABLE IF EXISTS `ps_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoints` (
  `id` varchar(40) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` enum('username','auth_username') DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` int(11) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoints`
--

LOCK TABLES `ps_endpoints` WRITE;
/*!40000 ALTER TABLE `ps_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_globals`
--

DROP TABLE IF EXISTS `ps_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int(11) DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int(11) DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int(11) DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int(11) DEFAULT NULL,
  `unidentified_request_period` int(11) DEFAULT NULL,
  `unidentified_request_prune_interval` int(11) DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int(11) DEFAULT NULL,
  `mwi_tps_queue_low` int(11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_globals`
--

LOCK TABLES `ps_globals` WRITE;
/*!40000 ALTER TABLE `ps_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_inbound_publications`
--

DROP TABLE IF EXISTS `ps_inbound_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_inbound_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_inbound_publications`
--

LOCK TABLES `ps_inbound_publications` WRITE;
/*!40000 ALTER TABLE `ps_inbound_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_inbound_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_outbound_publishes`
--

DROP TABLE IF EXISTS `ps_outbound_publishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int(11) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_outbound_publishes_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_outbound_publishes`
--

LOCK TABLES `ps_outbound_publishes` WRITE;
/*!40000 ALTER TABLE `ps_outbound_publishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_outbound_publishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_registrations`
--

DROP TABLE IF EXISTS `ps_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `max_retries` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `forbidden_retry_interval` int(11) DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int(11) DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_registrations`
--

LOCK TABLES `ps_registrations` WRITE;
/*!40000 ALTER TABLE `ps_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_resource_list`
--

DROP TABLE IF EXISTS `ps_resource_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_resource_list_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_resource_list`
--

LOCK TABLES `ps_resource_list` WRITE;
/*!40000 ALTER TABLE `ps_resource_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_resource_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_subscription_persistence`
--

DROP TABLE IF EXISTS `ps_subscription_persistence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int(11) DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int(11) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_subscription_persistence`
--

LOCK TABLES `ps_subscription_persistence` WRITE;
/*!40000 ALTER TABLE `ps_subscription_persistence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_subscription_persistence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_systems`
--

DROP TABLE IF EXISTS `ps_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int(11) DEFAULT NULL,
  `timer_b` int(11) DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int(11) DEFAULT NULL,
  `threadpool_auto_increment` int(11) DEFAULT NULL,
  `threadpool_idle_timeout` int(11) DEFAULT NULL,
  `threadpool_max_size` int(11) DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_systems`
--

LOCK TABLES `ps_systems` WRITE;
/*!40000 ALTER TABLE `ps_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_transports`
--

DROP TABLE IF EXISTS `ps_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int(11) DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int(11) DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int(11) DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_transports`
--

LOCK TABLES `ps_transports` WRITE;
/*!40000 ALTER TABLE `ps_transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_members`
--

DROP TABLE IF EXISTS `queue_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`queue_name`,`interface`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_members`
--

LOCK TABLES `queue_members` WRITE;
/*!40000 ALTER TABLE `queue_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_rules`
--

DROP TABLE IF EXISTS `queue_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_rules`
--

LOCK TABLES `queue_rules` WRITE;
/*!40000 ALTER TABLE `queue_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int(11) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `penaltymemberslimit` int(11) DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int(11) DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sippeers`
--

DROP TABLE IF EXISTS `sippeers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sippeers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sippeers_name` (`name`),
  KEY `sippeers_name_host` (`name`,`host`),
  KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `sippeers_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sippeers`
--

LOCK TABLES `sippeers` WRITE;
/*!40000 ALTER TABLE `sippeers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sippeers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail`
--

DROP TABLE IF EXISTS `voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `voicemail_mailbox` (`mailbox`),
  KEY `voicemail_context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail`
--

LOCK TABLES `voicemail` WRITE;
/*!40000 ALTER TABLE `voicemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail_messages`
--

DROP TABLE IF EXISTS `voicemail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail_messages` (
  `dir` varchar(255) NOT NULL,
  `msgnum` int(11) NOT NULL,
  `context` varchar(80) DEFAULT NULL,
  `macrocontext` varchar(80) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `origtime` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `recording` longblob,
  `flag` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `mailboxuser` varchar(30) DEFAULT NULL,
  `mailboxcontext` varchar(30) DEFAULT NULL,
  `msg_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dir`,`msgnum`),
  KEY `voicemail_messages_dir` (`dir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail_messages`
--

LOCK TABLES `voicemail_messages` WRITE;
/*!40000 ALTER TABLE `voicemail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `accountcode` varchar(80) DEFAULT NULL,
  `src` varchar(80) DEFAULT NULL,
  `dst` varchar(80) DEFAULT NULL,
  `dcontext` varchar(80) DEFAULT NULL,
  `clid` varchar(80) DEFAULT NULL,
  `channel` varchar(80) DEFAULT NULL,
  `dstchannel` varchar(80) DEFAULT NULL,
  `lastapp` varchar(80) DEFAULT NULL,
  `lastdata` varchar(80) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `answer` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `billsec` int(11) DEFAULT NULL,
  `disposition` varchar(45) DEFAULT NULL,
  `amaflags` varchar(45) DEFAULT NULL,
  `userfield` varchar(256) DEFAULT NULL,
  `uniqueid` varchar(150) DEFAULT NULL,
  `linkedid` varchar(150) DEFAULT NULL,
  `peeraccount` varchar(80) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int(11) NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context` (`context`,`exten`,`priority`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaxfriends`
--

DROP TABLE IF EXISTS `iaxfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaxfriends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int(11) DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `iaxfriends_name` (`name`),
  KEY `iaxfriends_name_host` (`name`,`host`),
  KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  KEY `iaxfriends_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaxfriends`
--

LOCK TABLES `iaxfriends` WRITE;
/*!40000 ALTER TABLE `iaxfriends` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaxfriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetme` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int(11) DEFAULT NULL,
  `members` int(11) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetme`
--

LOCK TABLES `meetme` WRITE;
/*!40000 ALTER TABLE `meetme` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiconhold`
--

DROP TABLE IF EXISTS `musiconhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiconhold`
--

LOCK TABLES `musiconhold` WRITE;
/*!40000 ALTER TABLE `musiconhold` DISABLE KEYS */;
/*!40000 ALTER TABLE `musiconhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_aors`
--

DROP TABLE IF EXISTS `ps_aors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_aors`
--

LOCK TABLES `ps_aors` WRITE;
/*!40000 ALTER TABLE `ps_aors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_aors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_asterisk_publications`
--

DROP TABLE IF EXISTS `ps_asterisk_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_asterisk_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_asterisk_publications`
--

LOCK TABLES `ps_asterisk_publications` WRITE;
/*!40000 ALTER TABLE `ps_asterisk_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_asterisk_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_auths`
--

DROP TABLE IF EXISTS `ps_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int(11) DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_auths`
--

LOCK TABLES `ps_auths` WRITE;
/*!40000 ALTER TABLE `ps_auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_contacts`
--

DROP TABLE IF EXISTS `ps_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `expiration_time` bigint(20) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(20) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int(11) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_contacts`
--

LOCK TABLES `ps_contacts` WRITE;
/*!40000 ALTER TABLE `ps_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_domain_aliases`
--

DROP TABLE IF EXISTS `ps_domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_domain_aliases`
--

LOCK TABLES `ps_domain_aliases` WRITE;
/*!40000 ALTER TABLE `ps_domain_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_domain_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoint_id_ips`
--

DROP TABLE IF EXISTS `ps_endpoint_id_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoint_id_ips`
--

LOCK TABLES `ps_endpoint_id_ips` WRITE;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoints`
--

DROP TABLE IF EXISTS `ps_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoints` (
  `id` varchar(40) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` enum('username','auth_username') DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` int(11) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoints`
--

LOCK TABLES `ps_endpoints` WRITE;
/*!40000 ALTER TABLE `ps_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_globals`
--

DROP TABLE IF EXISTS `ps_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int(11) DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int(11) DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int(11) DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int(11) DEFAULT NULL,
  `unidentified_request_period` int(11) DEFAULT NULL,
  `unidentified_request_prune_interval` int(11) DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int(11) DEFAULT NULL,
  `mwi_tps_queue_low` int(11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_globals`
--

LOCK TABLES `ps_globals` WRITE;
/*!40000 ALTER TABLE `ps_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_inbound_publications`
--

DROP TABLE IF EXISTS `ps_inbound_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_inbound_publications_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_inbound_publications`
--

LOCK TABLES `ps_inbound_publications` WRITE;
/*!40000 ALTER TABLE `ps_inbound_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_inbound_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_outbound_publishes`
--

DROP TABLE IF EXISTS `ps_outbound_publishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int(11) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_outbound_publishes_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_outbound_publishes`
--

LOCK TABLES `ps_outbound_publishes` WRITE;
/*!40000 ALTER TABLE `ps_outbound_publishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_outbound_publishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_registrations`
--

DROP TABLE IF EXISTS `ps_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `max_retries` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `forbidden_retry_interval` int(11) DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int(11) DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_registrations`
--

LOCK TABLES `ps_registrations` WRITE;
/*!40000 ALTER TABLE `ps_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_resource_list`
--

DROP TABLE IF EXISTS `ps_resource_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_resource_list_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_resource_list`
--

LOCK TABLES `ps_resource_list` WRITE;
/*!40000 ALTER TABLE `ps_resource_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_resource_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_subscription_persistence`
--

DROP TABLE IF EXISTS `ps_subscription_persistence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int(11) DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int(11) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_subscription_persistence`
--

LOCK TABLES `ps_subscription_persistence` WRITE;
/*!40000 ALTER TABLE `ps_subscription_persistence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_subscription_persistence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_systems`
--

DROP TABLE IF EXISTS `ps_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int(11) DEFAULT NULL,
  `timer_b` int(11) DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int(11) DEFAULT NULL,
  `threadpool_auto_increment` int(11) DEFAULT NULL,
  `threadpool_idle_timeout` int(11) DEFAULT NULL,
  `threadpool_max_size` int(11) DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_systems`
--

LOCK TABLES `ps_systems` WRITE;
/*!40000 ALTER TABLE `ps_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_transports`
--

DROP TABLE IF EXISTS `ps_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int(11) DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int(11) DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int(11) DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_transports`
--

LOCK TABLES `ps_transports` WRITE;
/*!40000 ALTER TABLE `ps_transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_members`
--

DROP TABLE IF EXISTS `queue_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`queue_name`,`interface`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_members`
--

LOCK TABLES `queue_members` WRITE;
/*!40000 ALTER TABLE `queue_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_rules`
--

DROP TABLE IF EXISTS `queue_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_rules`
--

LOCK TABLES `queue_rules` WRITE;
/*!40000 ALTER TABLE `queue_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int(11) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `penaltymemberslimit` int(11) DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int(11) DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sippeers`
--

DROP TABLE IF EXISTS `sippeers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sippeers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sippeers_name` (`name`),
  KEY `sippeers_name_host` (`name`,`host`),
  KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `sippeers_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sippeers`
--

LOCK TABLES `sippeers` WRITE;
/*!40000 ALTER TABLE `sippeers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sippeers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail`
--

DROP TABLE IF EXISTS `voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `voicemail_mailbox` (`mailbox`),
  KEY `voicemail_context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail`
--

LOCK TABLES `voicemail` WRITE;
/*!40000 ALTER TABLE `voicemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail_messages`
--

DROP TABLE IF EXISTS `voicemail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail_messages` (
  `dir` varchar(255) NOT NULL,
  `msgnum` int(11) NOT NULL,
  `context` varchar(80) DEFAULT NULL,
  `macrocontext` varchar(80) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `origtime` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `recording` longblob,
  `flag` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `mailboxuser` varchar(30) DEFAULT NULL,
  `mailboxcontext` varchar(30) DEFAULT NULL,
  `msg_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dir`,`msgnum`),
  KEY `voicemail_messages_dir` (`dir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail_messages`
--

LOCK TABLES `voicemail_messages` WRITE;
/*!40000 ALTER TABLE `voicemail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail_messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 14:03:07
