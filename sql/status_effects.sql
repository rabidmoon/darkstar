-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1

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
-- Table structure for table `status_effects`
--

DROP TABLE IF EXISTS `status_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_effects` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `negative_id` smallint(5) unsigned DEFAULT '0',
  `overwrite` smallint(5) unsigned NOT NULL DEFAULT '0',
  `block_id` smallint(5) unsigned DEFAULT '0',
  `remove_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `element` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_effects`
--

LOCK TABLES `status_effects` WRITE;
/*!40000 ALTER TABLE `status_effects` DISABLE KEYS */;
INSERT INTO `status_effects` VALUES (0,'ko',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (1,'weakness',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (2,'sleep',48,2,19,2,193,0,8);
INSERT INTO `status_effects` VALUES (3,'poison',32,0,0,1,0,0,3);
INSERT INTO `status_effects` VALUES (4,'paralysis',32,0,0,1,0,0,5);
INSERT INTO `status_effects` VALUES (5,'blindness',32,0,0,1,0,0,8);
INSERT INTO `status_effects` VALUES (6,'silence',32,0,0,2,0,0,4);
INSERT INTO `status_effects` VALUES (7,'petrification',32,7,0,2,0,0,2);
INSERT INTO `status_effects` VALUES (8,'disease',32,8,0,2,0,0,1);
INSERT INTO `status_effects` VALUES (9,'curse',32,9,0,2,0,0,8);
INSERT INTO `status_effects` VALUES (10,'stun',34,0,0,2,0,0,6);
INSERT INTO `status_effects` VALUES (11,'bind',34,0,0,2,0,0,5);
INSERT INTO `status_effects` VALUES (12,'weight',34,0,0,1,0,0,4);
INSERT INTO `status_effects` VALUES (13,'slow',34,0,33,1,0,0,2);
INSERT INTO `status_effects` VALUES (14,'charm',32,0,0,2,0,0,7);
INSERT INTO `status_effects` VALUES (15,'doom',32,0,0,2,0,0,8);
INSERT INTO `status_effects` VALUES (16,'amnesia',32,0,0,2,0,0,1);
INSERT INTO `status_effects` VALUES (17,'charm',32,0,0,2,0,0,7);
INSERT INTO `status_effects` VALUES (18,'gradual_petrification',32,7,0,2,0,0,2);
INSERT INTO `status_effects` VALUES (19,'sleep',48,2,0,2,0,0,8);
INSERT INTO `status_effects` VALUES (20,'curse',32,9,0,2,0,0,8);
INSERT INTO `status_effects` VALUES (21,'addle',32,0,0,2,0,0,1);
INSERT INTO `status_effects` VALUES (22,'intimidate',32,0,0,2,0,0,0);
INSERT INTO `status_effects` VALUES (23,'kaustra',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (28,'terror',32,7,0,0,0,0,8);
INSERT INTO `status_effects` VALUES (29,'mute',32,0,0,2,0,6,4);
INSERT INTO `status_effects` VALUES (30,'bane',32,0,0,2,0,9,8);
INSERT INTO `status_effects` VALUES (31,'plague',32,8,0,2,0,0,1);
INSERT INTO `status_effects` VALUES (32,'flee',37,0,0,0,0,0,4);
INSERT INTO `status_effects` VALUES (33,'haste',33,0,13,0,0,0,4);
INSERT INTO `status_effects` VALUES (34,'blaze_spikes',33,34,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (35,'ice_spikes',33,34,0,0,0,0,5);
INSERT INTO `status_effects` VALUES (36,'blink',33,36,0,0,66,0,4);
INSERT INTO `status_effects` VALUES (37,'stoneskin',33,0,0,2,0,0,2);
INSERT INTO `status_effects` VALUES (38,'shock_spikes',33,34,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (39,'aquaveil',33,0,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (40,'protect',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (41,'shell',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (42,'regen',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (43,'refresh',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (44,'mighty_strikes',32,0,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (45,'boost',37,0,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (46,'hundred_fists',32,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (47,'manafont',32,0,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (48,'chainspell',32,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (49,'perfect_dodge',32,0,0,0,0,0,4);
INSERT INTO `status_effects` VALUES (50,'invincible',32,0,0,0,0,0,2);
INSERT INTO `status_effects` VALUES (51,'blood_weapon',32,94,0,0,0,0,8);
INSERT INTO `status_effects` VALUES (52,'soul_voice',32,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (53,'eagle_eye_shot',32,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (54,'meikyo_shisui',32,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (55,'astral_flow',32,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (56,'berserk',33,56,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (57,'defender',33,56,0,0,0,0,2);
INSERT INTO `status_effects` VALUES (58,'aggressor',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (59,'focus',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (60,'dodge',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (61,'counterstance',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (62,'sentinel',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (63,'souleater',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (64,'last_resort',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (65,'sneak_attack',37,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (66,'copy_image',33,0,0,0,0,36,4);
INSERT INTO `status_effects` VALUES (67,'third_eye',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (68,'warcry',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (69,'invisible',3445,0,0,2,0,0,4);
INSERT INTO `status_effects` VALUES (70,'deodorize',2357,0,0,2,0,0,4);
INSERT INTO `status_effects` VALUES (71,'sneak',2357,0,0,2,0,0,4);
INSERT INTO `status_effects` VALUES (72,'sharpshot',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (73,'barrage',33,73,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (74,'holy_circle',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (75,'arcane_circle',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (76,'hide',3445,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (77,'camouflage',3445,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (78,'divine_seal',161,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (79,'elemental_seal',161,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (80,'str_boost',33,0,136,0,0,0,1);
INSERT INTO `status_effects` VALUES (81,'dex_boost',33,0,137,0,0,0,6);
INSERT INTO `status_effects` VALUES (82,'vit_boost',33,0,138,0,0,0,2);
INSERT INTO `status_effects` VALUES (83,'agi_boost',33,0,139,0,0,0,4);
INSERT INTO `status_effects` VALUES (84,'int_boost',33,0,140,0,0,0,5);
INSERT INTO `status_effects` VALUES (85,'mnd_boost',33,0,141,0,0,0,3);
INSERT INTO `status_effects` VALUES (86,'chr_boost',33,0,142,0,0,0,7);
INSERT INTO `status_effects` VALUES (87,'trick_attack',37,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (88,'max_hp_boost',33,0,144,0,0,0,7);
INSERT INTO `status_effects` VALUES (89,'max_mp_boost',33,0,145,0,0,0,8);
INSERT INTO `status_effects` VALUES (90,'accuracy_boost',33,0,146,0,0,0,6);
INSERT INTO `status_effects` VALUES (91,'attack_boost',33,0,147,0,0,0,1);
INSERT INTO `status_effects` VALUES (92,'evasion_boost',33,0,148,0,0,0,4);
INSERT INTO `status_effects` VALUES (93,'defense_boost',33,0,149,0,0,0,2);
INSERT INTO `status_effects` VALUES (94,'enfire',33,94,51,0,0,0,1);
INSERT INTO `status_effects` VALUES (95,'enblizzard',33,94,51,0,0,0,5);
INSERT INTO `status_effects` VALUES (96,'enaero',33,94,51,0,0,0,4);
INSERT INTO `status_effects` VALUES (97,'enstone',33,94,51,0,0,0,2);
INSERT INTO `status_effects` VALUES (98,'enthunder',33,94,51,0,0,0,6);
INSERT INTO `status_effects` VALUES (99,'enwater',33,94,51,0,0,0,3);
INSERT INTO `status_effects` VALUES (100,'barfire',33,100,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (101,'barblizzard',33,100,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (102,'baraero',33,100,0,0,0,0,5);
INSERT INTO `status_effects` VALUES (103,'barstone',33,100,0,0,0,0,4);
INSERT INTO `status_effects` VALUES (104,'barthunder',33,100,0,0,0,0,2);
INSERT INTO `status_effects` VALUES (105,'barwater',33,100,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (106,'barsleep',33,106,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (107,'barpoison',33,106,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (108,'barparalyze',33,106,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (109,'barblind',33,106,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (110,'barsilence',33,106,0,0,0,0,5);
INSERT INTO `status_effects` VALUES (111,'barpetrify',33,106,0,0,0,0,4);
INSERT INTO `status_effects` VALUES (112,'barvirus',33,106,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (113,'reraise',0,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (114,'cover',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (115,'unlimited_shot',32,73,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (116,'phalanx',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (117,'warding_circle',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (118,'ancient_circle',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (119,'str_boost',33,0,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (120,'dex_boost',33,0,0,0,0,0,6);
INSERT INTO `status_effects` VALUES (121,'vit_boost',33,0,0,0,0,0,2);
INSERT INTO `status_effects` VALUES (122,'agi_boost',33,0,0,0,0,0,4);
INSERT INTO `status_effects` VALUES (123,'int_boost',33,0,0,0,0,0,5);
INSERT INTO `status_effects` VALUES (124,'mnd_boost',33,0,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (125,'chr_boost',33,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (126,'spirit_surge',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (127,'costume',164,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (128,'burn',34,0,0,0,133,129,1);
INSERT INTO `status_effects` VALUES (129,'frost',34,0,0,0,128,130,5);
INSERT INTO `status_effects` VALUES (130,'choke',34,0,0,0,129,131,4);
INSERT INTO `status_effects` VALUES (131,'rasp',34,0,0,0,130,132,2);
INSERT INTO `status_effects` VALUES (132,'shock',34,0,0,0,131,133,6);
INSERT INTO `status_effects` VALUES (133,'drown',34,0,0,0,132,128,3);
INSERT INTO `status_effects` VALUES (134,'dia',34,0,135,0,0,0,7);
INSERT INTO `status_effects` VALUES (135,'bio',34,0,134,0,0,0,8);
INSERT INTO `status_effects` VALUES (136,'str_down',34,0,0,0,0,80,3);
INSERT INTO `status_effects` VALUES (137,'dex_down',34,0,0,0,0,81,2);
INSERT INTO `status_effects` VALUES (138,'vit_down',34,0,0,0,0,82,4);
INSERT INTO `status_effects` VALUES (139,'agi_down',34,0,0,0,0,83,5);
INSERT INTO `status_effects` VALUES (140,'int_down',34,0,0,0,0,84,1);
INSERT INTO `status_effects` VALUES (141,'mnd_down',34,0,0,0,0,85,6);
INSERT INTO `status_effects` VALUES (142,'chr_down',34,0,0,0,0,86,8);
INSERT INTO `status_effects` VALUES (143,'level_restriction',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (144,'max_hp_down',34,0,0,0,0,88,8);
INSERT INTO `status_effects` VALUES (145,'max_mp_down',34,0,0,0,0,89,7);
INSERT INTO `status_effects` VALUES (146,'accuracy_down',34,0,0,0,0,90,2);
INSERT INTO `status_effects` VALUES (147,'attack_down',34,0,0,0,0,91,3);
INSERT INTO `status_effects` VALUES (148,'evasion_down',34,0,0,0,0,92,5);
INSERT INTO `status_effects` VALUES (149,'defense_down',34,0,0,0,0,93,4);
INSERT INTO `status_effects` VALUES (150,'physical_shield',33,150,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (151,'arrow_shield',33,150,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (152,'magic_shield',33,150,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (153,'damage_spikes',33,34,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (154,'shining_ruby',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (155,'medicine',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (156,'flash',34,0,0,2,0,0,7);
INSERT INTO `status_effects` VALUES (157,'sj_restriction',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (158,'provoke',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (159,'penalty',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (160,'preparations',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (161,'sprint',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (162,'enchantment',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (163,'azure_lore',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (164,'chain_affinity',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (165,'burst_affinity',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (166,'overdrive',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (167,'magic_def_down',34,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (168,'inhibit_tp',32,0,0,0,0,0,8);
INSERT INTO `status_effects` VALUES (169,'potency',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (170,'regain',32,0,0,0,0,0,7);
INSERT INTO `status_effects` VALUES (171,'pax',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (172,'intension',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (173,'dread_spikes',33,34,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (174,'magic_acc_down',34,0,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (175,'magic_atk_down',34,0,0,0,0,0,2);
INSERT INTO `status_effects` VALUES (176,'quickening',164,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (177,'encumbrance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (178,'firestorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (179,'hailstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (180,'windstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (181,'sandstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (182,'thunderstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (183,'rainstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (184,'aurorastorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (185,'voidstorm',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (186,'helix',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (187,'sublimation_activated',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (188,'sublimation_complete',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (189,'max_tp_down',34,0,0,0,0,0,8);
INSERT INTO `status_effects` VALUES (190,'magic_atk_boost',33,0,0,0,0,0,5);
INSERT INTO `status_effects` VALUES (191,'magic_def_boost',33,0,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (192,'requiem',32,0,0,1,0,0,7);
INSERT INTO `status_effects` VALUES (193,'lullaby',48,2,19,2,2,0,7);
INSERT INTO `status_effects` VALUES (194,'elegy',32,0,0,1,0,0,2);
INSERT INTO `status_effects` VALUES (195,'paeon',33,0,0,4,0,0,7);
INSERT INTO `status_effects` VALUES (196,'ballad',33,0,0,4,0,0,7);
INSERT INTO `status_effects` VALUES (197,'minne',33,0,0,4,0,0,2);
INSERT INTO `status_effects` VALUES (198,'minuet',33,0,0,4,0,0,1);
INSERT INTO `status_effects` VALUES (199,'madrigal',33,0,0,4,0,0,6);
INSERT INTO `status_effects` VALUES (200,'prelude',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (201,'mambo',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (202,'aubade',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (203,'pastoral',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (204,'hum',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (205,'fantasia',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (206,'operetta',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (207,'capriccio',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (208,'serenade',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (209,'round',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (210,'gavotte',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (211,'fugue',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (212,'rhapsody',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (213,'aria',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (214,'march',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (215,'etude',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (216,'carol',33,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (217,'threnody',544,0,0,1,0,0,0);
INSERT INTO `status_effects` VALUES (218,'hymnus',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (219,'mazurka',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (220,'sirvente',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (221,'dirge',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (222,'scherzo',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (223,'nocturne',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (227,'store_tp',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (228,'embrava',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (229,'manawell',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (230,'spontaneity',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (231,'marcato',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (233,'auto-regen',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (234,'auto-refresh',32,0,0,4,0,0,0);
INSERT INTO `status_effects` VALUES (235,'fishing_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (236,'woodworking_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (237,'smithing_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (238,'goldsmithing_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (239,'clothcraft_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (240,'leathercraft_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (241,'bonecraft_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (242,'alchemy_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (243,'cooking_imagery',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (244,'(imagery)',32,244,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (245,'(imagery)',32,244,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (246,'(imagery)',32,244,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (247,'(imagery)',32,244,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (248,'(imagery)',32,244,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (249,'dedication',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (250,'ef_badge',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (251,'food',32,0,0,2,0,0,0);
INSERT INTO `status_effects` VALUES (252,'chocobo',164,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (253,'signet',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (254,'battlefield',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (256,'sanction',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (257,'besieged',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (258,'illusion',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (259,'encumbrance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (260,'obliviscence',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (261,'impairment',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (262,'omerta',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (263,'debilitation',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (264,'pathos',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (265,'flurry',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (266,'concentration',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (267,'allied_tags',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (268,'sigil',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (269,'level_sync',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (270,'aftermath',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (271,'aftermath',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (272,'aftermath',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (273,'aftermath',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (274,'enlight',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (275,'auspice',32,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (276,'confrontation',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (277,'enfire_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (278,'enblizzard_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (279,'enaero_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (280,'enstone_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (281,'enthunder_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (282,'enwater_ii',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (283,'perfect_defense',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (284,'egg',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (285,'visitant',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (286,'baramnesia',33,106,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (287,'atma',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (288,'endark',33,94,51,0,0,0,0);
INSERT INTO `status_effects` VALUES (289,'enmity_boost',32,0,0,0,0,0,1);
INSERT INTO `status_effects` VALUES (290,'subtle_blow_plus',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (291,'enmity_down',32,0,0,0,0,0,3);
INSERT INTO `status_effects` VALUES (292,'pennant',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (293,'negate_petrify',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (294,'negate_terror',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (295,'negate_amnesia',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (296,'negate_doom',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (297,'negate_poison',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (298,'critical_hit_evasion_down',34,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (299,'overload',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (300,'fire_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (301,'ice_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (302,'wind_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (303,'earth_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (304,'thunder_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (305,'water_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (306,'light_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (307,'dark_maneuver',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (308,'double-up_chance',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (309,'bust',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (310,'fighters_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (311,'monks_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (312,'healers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (313,'wizards_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (314,'warlocks_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (315,'rogues_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (316,'gallants_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (317,'chaos_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (318,'beast_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (319,'choral_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (320,'hunters_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (321,'samurai_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (322,'ninja_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (323,'drachen_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (324,'evokers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (325,'maguss_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (326,'corsairs_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (327,'puppet_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (328,'dancers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (329,'scholars_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (330,'bolters_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (331,'casters_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (332,'coursers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (333,'blitzers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (334,'tacticians_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (335,'allies_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (336,'misers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (337,'companions_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (338,'avengers_roll',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (340,'warriors_charge',37,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (341,'formless_strikes',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (342,'assassins_charge',37,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (343,'feint',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (344,'fealty',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (345,'dark_seal',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (346,'diabolic_eye',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (347,'nightingale',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (348,'troubadour',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (349,'killer_instinct',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (350,'stealth_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (351,'flashy_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (352,'sange',32,73,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (353,'hasso',33,353,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (354,'seigan',33,353,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (355,'convergence',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (356,'diffusion',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (357,'snake_eye',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (358,'light_arts',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (359,'dark_arts',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (360,'penury',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (361,'parsimony',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (362,'celerity',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (363,'alacrity',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (364,'rapture',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (365,'ebullience',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (366,'accession',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (367,'manifestation',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (368,'drain_samba',32,368,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (369,'aspir_samba',32,368,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (370,'haste_samba',32,368,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (371,'velocity_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (375,'building_flourish',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (376,'trance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (377,'tabula_rasa',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (378,'drain_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (379,'aspir_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (380,'haste_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (381,'finishing_move',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (382,'finishing_move',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (383,'finishing_move',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (384,'finishing_move',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (385,'finishing_move',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (386,'lethargic_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (387,'lethargic_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (388,'lethargic_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (389,'lethargic_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (390,'lethargic_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (391,'sluggish_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (392,'sluggish_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (393,'sluggish_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (394,'sluggish_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (395,'sluggish_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (396,'weakened_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (397,'weakened_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (398,'weakened_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (399,'weakened_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (400,'weakened_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (401,'addendum_white',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (402,'addendum_black',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (403,'reprisal',32,34,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (404,'magic_evasion_down',34,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (405,'retaliation',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (406,'footwork',288,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (407,'klimaform',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (408,'sekkanoki',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (409,'pianissimo',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (410,'saber_dance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (411,'fan_dance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (412,'altruism',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (413,'focalization',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (414,'tranquility',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (415,'equanimity',160,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (416,'enlightenment',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (417,'afflatus_solace',289,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (418,'afflatus_misery',289,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (419,'composure',33,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (420,'yonin',289,420,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (421,'innin',289,420,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (422,'carbuncles_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (423,'ifrits_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (424,'shivas_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (425,'garudas_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (426,'titans_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (427,'ramuhs_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (428,'leviathans_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (429,'fenrirs_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (430,'diaboloss_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (431,'avatars_favor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (432,'multi_strikes',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (433,'double_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (434,'transcendency',256,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (435,'restraint',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (436,'perfect_counter',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (437,'mana_wall',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (438,'divine_emblem',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (439,'nether_void',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (440,'sengikori',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (441,'futae',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (442,'presto',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (443,'climactic_flourish',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (444,'copy_image',32,36,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (445,'copy_image',32,36,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (446,'copy_image',32,36,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (447,'multi_shots',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (448,'bewildered_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (449,'bewildered_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (450,'bewildered_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (451,'bewildered_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (452,'bewildered_daze',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (453,'divine_caress',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (454,'saboteur',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (455,'tenuto',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (456,'spur',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (457,'efflux',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (458,'earthen_armor',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (459,'divine_caress',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (460,'blood_rage',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (461,'impetus',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (462,'conspirator',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (463,'sepulcher',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (464,'arcane_crest',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (465,'hamanoha',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (466,'dragon_breaker',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (467,'triple_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (468,'striking_flourish',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (469,'perpetuance',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (470,'immanence',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (471,'migawari',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (472,'ternary_flourish',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (473,'muddle',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (474,'prowess',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (475,'voidwatcher',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (476,'ensphere',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (477,'sacrosanctity',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (478,'palisade',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (479,'scarlet_delirium',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (480,'scarlet_delirium',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (482,'decoy_shot',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (483,'hagakure',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (484,'issekigan',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (485,'unbridled_learning',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (486,'counter_boost',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (487,'endrain',32,94,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (488,'enaspir',32,94,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (489,'afterglow',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (490,'ninjutsu_ele_debuff',32,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (511,'dynamis',0,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (512,'healing',48,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (513,'leavegame',48,0,0,0,0,0,0);
INSERT INTO `status_effects` VALUES (514,'skillchain',32,0,0,0,0,0,0);
/*!40000 ALTER TABLE `status_effects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-26 19:33:10
