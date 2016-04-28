
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `weapon_skills`
--

DROP TABLE IF EXISTS `weapon_skills`;
CREATE TABLE IF NOT EXISTS `weapon_skills` (
  `weaponskillid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `jobs` binary(22) NOT NULL,
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `skilllevel` smallint(3) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `animation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `range` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `primary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `secondary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `tertiary_sc` tinyint(4) NOT NULL DEFAULT '0',
  `main_only`    tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`weaponskillid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `weapon_skills`
--

INSERT INTO `weapon_skills` VALUES (1,'combo',x'02020000000200000000000002000000000202000000',1,5,0,16,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (2,'shoulder_tackle',x'02020000000200000000000002000000000202000000',1,40,0,17,5,1,5,8,0,0);
INSERT INTO `weapon_skills` VALUES (3,'one_inch_punch',x'00020000000000000000000000000000000200000000',1,75,0,18,5,1,2,0,0,0);
INSERT INTO `weapon_skills` VALUES (4,'backhand_blow',x'02020000000100000000000001000000000202000000',1,100,0,19,5,1,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (5,'raging_fists',x'00020000000000000000000000000000000200000000',1,125,0,20,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (6,'spinning_attack',x'01010000000100000000000001000000000101000000',1,150,0,21,5,2,3,8,0,0);
INSERT INTO `weapon_skills` VALUES (7,'howling_fist',x'00010000000000000000000000000000000100000000',1,200,0,22,5,1,1,8,0,1);
INSERT INTO `weapon_skills` VALUES (8,'dragon_kick',x'00010000000000000000000000000000000100000000',1,225,0,23,5,1,12,0,0,1);
INSERT INTO `weapon_skills` VALUES (9,'asuran_fists',x'00010000000000000000000000000000000100000000',1,250,0,24,5,1,9,3,0,1);
INSERT INTO `weapon_skills` VALUES (10,'final_heaven',x'00000000000000000000000000000000000000000000',1,300,0,25,5,1,13,11,0,1);
INSERT INTO `weapon_skills` VALUES (11,'ascetics_fury',x'00010000000000000000000000000000000000000000',1,300,0,26,5,1,11,1,0,1);
INSERT INTO `weapon_skills` VALUES (12,'stringing_pummel',x'00000000000000000000000000000000000100000000',1,300,0,27,5,1,9,3,0,1);
INSERT INTO `weapon_skills` VALUES (13,'tornado_kick',x'00010000000000000000000000000000000100000000',1,300,0,28,5,1,7,8,6,0);
INSERT INTO `weapon_skills` VALUES (14,'victory_smite',x'00010000000000000000000000000000000100000000',1,300,0,29,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (15,'shijin_spiral',x'00010000000000000000000000000000000100000000',1,357,0,30,5,1,11,5,0,1);
INSERT INTO `weapon_skills` VALUES (16,'wasp_sting',x'02000002020202020202020202020200020202020000',2,5,0,31,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (19,'gust_slash',x'02000002020202020202020202020200020202020000',2,40,16,34,5,1,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (18,'shadowstitch',x'02000002020202020202020202020200020202020000',2,70,0,33,5,1,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (17,'viper_bite',x'00000000020200000002020002000000000002000000',2,100,0,32,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (20,'cyclone',x'00000000020200000002020002000000000002000000',2,125,16,35,5,2,6,8,0,0);
INSERT INTO `weapon_skills` VALUES (21,'energy_steal',x'02000002020202020202020202020200020202020000',2,150,0,36,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (22,'energy_drain',x'00000000020200000002020002000000000002000000',2,175,0,37,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (23,'dancing_edge',x'00000000000100000000000000000000000001000000',2,200,0,38,5,1,4,6,0,1);
INSERT INTO `weapon_skills` VALUES (24,'shark_bite',x'00000000000100000000000000000000000001000000',2,225,0,39,5,1,12,0,0,1);
INSERT INTO `weapon_skills` VALUES (25,'evisceration',x'01000000010100000101010001000000010001000000',2,230,0,40,5,1,9,1,0,1);
INSERT INTO `weapon_skills` VALUES (30,'aeolian_edge',x'00000000020200000002020002000000000002000000',2,290,16,45,5,2,8,4,6,0);
INSERT INTO `weapon_skills` VALUES (26,'mercy_stroke',x'00000000000000000000000000000000000000000000',2,300,0,41,5,1,14,9,0,1);
INSERT INTO `weapon_skills` VALUES (27,'mandalic_stab',x'00000000000100000000000000000000000000000000',2,300,0,42,5,1,11,2,0,1);
INSERT INTO `weapon_skills` VALUES (28,'mordant_rime',x'00000000000000000001000000000000000000000000',2,300,0,43,5,1,12,10,0,1);
INSERT INTO `weapon_skills` VALUES (29,'pyrrhic_kleos',x'00000000000000000000000000000000000001000000',2,300,0,44,5,1,10,4,0,1);
INSERT INTO `weapon_skills` VALUES (31,'rudras_storm',x'00000000000100000001000000000000000001000000',2,300,0,236,5,1,14,10,0,1);
INSERT INTO `weapon_skills` VALUES (224,'exenterator',x'01000000010100000101010001000000010001000000',2,357,0,238,5,1,12,4,0,1);
INSERT INTO `weapon_skills` VALUES (239,'glory_slash',x'00000000000100000001000000000000000001000000',2,400,0,242,6,2,13,11,0,0);
INSERT INTO `weapon_skills` VALUES (32,'fast_blade',x'02000000020202020202020202020002020002000002',3,5,0,1,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (33,'burning_blade',x'02000000020202020202020202020002020002000002',3,30,2,2,5,1,3,0,0,0);
INSERT INTO `weapon_skills` VALUES (34,'red_lotus_blade',x'02000000020002020000000000000002000000000002',3,50,2,3,5,1,3,6,0,0);
INSERT INTO `weapon_skills` VALUES (35,'flat_blade',x'02000000020202020202020202020002020002000002',3,75,0,6,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (36,'shining_blade',x'02000000020202020102020202020002020002000002',3,100,128,4,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (37,'seraph_blade',x'02000000000002020000000000000002000000000002',3,125,128,5,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (38,'circle_blade',x'01000000010101010101010101010001010001000001',3,150,0,7,5,2,5,8,0,0);
INSERT INTO `weapon_skills` VALUES (39,'spirits_within',x'01000000010101010101010101010001010001000001',3,175,0,8,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (40,'vorpal_blade',x'02000000020002020000000000000002000000000002',3,200,0,9,5,1,4,8,0,0);
INSERT INTO `weapon_skills` VALUES (41,'swift_blade',x'00000000000001000000000000000000000000000001',3,225,0,10,5,1,9,0,0,1);
INSERT INTO `weapon_skills` VALUES (238,'uriel_blade',x'00000000000000000000000000000000000000000000',3,240,128,243,6,2,13,12,0,0);
INSERT INTO `weapon_skills` VALUES (42,'savage_blade',x'01000000010001010000000000000001010000000001',3,240,0,11,5,1,12,4,0,1);
INSERT INTO `weapon_skills` VALUES (225,'chant_du_cygne',x'00000000010001000000000000000001000000000000',3,300,0,233,5,1,13,10,0,1);
INSERT INTO `weapon_skills` VALUES (43,'knights_of_round',x'00000000000000000000000000000000000000000000',3,300,0,12,5,1,13,11,0,1);
INSERT INTO `weapon_skills` VALUES (44,'death_blossom',x'00000000010000000000000000000000000000000000',3,300,0,13,5,1,12,10,0,1);
INSERT INTO `weapon_skills` VALUES (45,'atonement',x'00000000000001000000000000000000000000000000',3,300,0,14,5,1,11,5,0,1);
INSERT INTO `weapon_skills` VALUES (46,'expiacion',x'00000000000000000000000000000001000000000000',3,300,0,15,5,1,10,4,0,1);
INSERT INTO `weapon_skills` VALUES (47,'sanguine_blade',x'01000000000001010000000000000001000000000001',3,300,0,230,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (226,'requiescat',x'01000000010001010000000100000001010000000001',3,357,1,237,5,1,9,4,0,1);
INSERT INTO `weapon_skills` VALUES (48,'hard_slash',x'02000000000002020000000000000000000000000002',4,5,0,106,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (49,'power_slash',x'02000000000002020000000000000000000000000002',4,30,0,107,5,1,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (50,'frostbite',x'02000000000002020000000000000000000000000002',4,70,32,108,5,1,7,0,0,0);
INSERT INTO `weapon_skills` VALUES (51,'freezebite',x'02000000000002020000000000000000000000000002',4,100,32,109,5,1,7,6,0,0);
INSERT INTO `weapon_skills` VALUES (52,'shockwave',x'01000000000001010000000000000000000000000001',4,150,0,110,5,2,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (53,'crescent_moon',x'01000000000001010000000000000000000000000001',4,175,0,111,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (54,'sickle_moon',x'00000000000001010000000000000000000000000001',4,200,0,112,5,1,4,8,0,1);
INSERT INTO `weapon_skills` VALUES (55,'spinning_slash',x'00000000000001010000000000000000000000000001',4,225,0,113,5,1,12,0,0,1);
INSERT INTO `weapon_skills` VALUES (56,'ground_strike',x'01000000000001010000000000000000000000000001',4,250,0,114,5,1,12,10,0,0);
INSERT INTO `weapon_skills` VALUES (58,'herculean_slash',x'01000000000001010000000000000000000000000001',4,290,0,116,5,1,7,8,6,0);
INSERT INTO `weapon_skills` VALUES (57,'scourge',x'00000000000000000000000000000000000000000000',4,300,0,115,5,1,13,11,0,1);
INSERT INTO `weapon_skills` VALUES (59,'torcleaver',x'00000000000001010000000000000000000000000000',4,300,0,117,5,1,13,10,0,1);
INSERT INTO `weapon_skills` VALUES (60,'resolution',x'01000000000001010000000000000000000000000001',4,357,0,118,5,1,12,4,0,1);
INSERT INTO `weapon_skills` VALUES (64,'raging_axe',x'02000000000000020200020000000000000000000002',5,5,0,46,5,1,6,8,0,0);
INSERT INTO `weapon_skills` VALUES (65,'smash_axe',x'02000000000000020200020000000000000000000002',5,40,0,47,5,1,7,5,0,0);
INSERT INTO `weapon_skills` VALUES (66,'gale_axe',x'02000000000000020200020000000000000000000002',5,70,0,48,5,1,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (67,'avalanche_axe',x'02000000000000020200020000000000000000000002',5,100,0,49,5,1,4,8,0,0);
INSERT INTO `weapon_skills` VALUES (68,'spinning_axe',x'02000000000000020200000000000000000000000002',5,150,0,50,5,1,3,4,0,0);
INSERT INTO `weapon_skills` VALUES (69,'rampage',x'01000000000000010100010000000000000000000001',5,175,0,51,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (70,'calamity',x'01000000000000000100000000000000000000000000',5,200,0,52,5,1,4,8,0,1);
INSERT INTO `weapon_skills` VALUES (71,'mistral_axe',x'01000000000000000100000000000000000000000000',5,225,0,53,15,1,11,0,0,1);
INSERT INTO `weapon_skills` VALUES (72,'decimation',x'01000000000000010100010000000000000000000001',5,240,0,54,5,1,11,5,0,1);
INSERT INTO `weapon_skills` VALUES (75,'bora_axe',x'01000000000000000100000000000000000000000000',5,290,0,57,5,1,4,6,0,0);
INSERT INTO `weapon_skills` VALUES (73,'onslaught',x'00000000000000000000000000000000000000000000',5,300,0,55,5,1,14,9,0,1);
INSERT INTO `weapon_skills` VALUES (74,'primal_rend',x'00000000000000000100000000000000000000000000',5,300,128,56,5,1,9,5,0,1);
INSERT INTO `weapon_skills` VALUES (76,'cloudsplitter',x'01000000000000000100000000000000000000000000',5,300,64,58,5,1,14,12,0,1);
INSERT INTO `weapon_skills` VALUES (77,'ruinator',x'01000000000000010100010000000000000000000001',5,357,0,59,5,1,10,6,0,1);
INSERT INTO `weapon_skills` VALUES (80,'shield_break',x'02000000000000020000000000000000000000000002',6,5,0,91,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (81,'iron_tempest',x'02000000000000020000000000000000000000000002',6,40,0,92,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (82,'sturmwind',x'02000000000000020000000000000000000000000002',6,70,0,93,5,1,5,4,0,0);
INSERT INTO `weapon_skills` VALUES (83,'armor_break',x'02000000000000020000000000000000000000000002',6,100,0,94,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (84,'keen_edge',x'01000000000000010000000000000000000000000001',6,150,0,95,5,1,2,0,0,0);
INSERT INTO `weapon_skills` VALUES (85,'weapon_break',x'01000000000000010000000000000000000000000001',6,175,0,96,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (86,'raging_rush',x'01000000000000000000000000000000000000000000',6,200,0,97,5,1,7,5,0,1);
INSERT INTO `weapon_skills` VALUES (87,'full_break',x'01000000000000000000000000000000000000000000',6,225,0,98,5,1,10,0,0,1);
INSERT INTO `weapon_skills` VALUES (88,'steel_cyclone',x'01000000000000010000000000000000000000000001',6,240,0,99,5,1,10,6,0,1);
INSERT INTO `weapon_skills` VALUES (89,'metatron_torment',x'00000000000000000000000000000000000000000000',6,300,0,100,5,1,13,11,0,1);
INSERT INTO `weapon_skills` VALUES (90,'kings_justice',x'01000000000000000000000000000000000000000000',6,300,0,101,5,1,12,4,0,1);
INSERT INTO `weapon_skills` VALUES (91,'fell_cleave',x'01000000000000010000000000000000000000000001',6,300,0,102,5,2,8,6,4,0);
INSERT INTO `weapon_skills` VALUES (92,'ukkos_fury',x'01000000000000000000000000000000000000000000',6,300,0,103,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (93,'upheaval',x'01000000000000010000000000000000000000000001',6,357,0,104,5,1,11,2,0,1);
INSERT INTO `weapon_skills` VALUES (94,'cyclonic_tempest',x'01000000000000000000000000000000000000000000',6,400,0,248,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (96,'slice',x'02000002000000020200000000000000000000000000',7,5,0,61,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (97,'dark_harvest',x'02000002000000020200000000000000000000000000',7,30,256,62,5,1,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (98,'shadow_of_death',x'02000000000000020000000000000000000000000000',7,70,256,63,5,1,7,5,0,0);
INSERT INTO `weapon_skills` VALUES (99,'nightmare_scythe',x'02000001000000020200000000000000000000000000',7,100,0,64,5,1,2,4,0,0);
INSERT INTO `weapon_skills` VALUES (100,'spinning_scythe',x'01000001000000010100000000000000000000000000',7,125,0,65,5,2,5,4,0,0);
INSERT INTO `weapon_skills` VALUES (101,'vorpal_scythe',x'01000001000000010100000000000000000000000000',7,150,0,66,5,1,1,4,0,0);
INSERT INTO `weapon_skills` VALUES (102,'guillotine',x'00000000000000010000000000000000000000000000',7,200,0,67,5,1,7,0,0,1);
INSERT INTO `weapon_skills` VALUES (103,'cross_reaper',x'00000000000000010000000000000000000000000000',7,225,0,68,5,1,10,0,0,1);
INSERT INTO `weapon_skills` VALUES (104,'spiral_hell',x'01000000000000010100000000000000000000000000',7,240,0,69,5,1,10,4,0,1);
INSERT INTO `weapon_skills` VALUES (105,'catastrophe',x'00000000000000000000000000000000000000000000',7,300,0,70,5,1,14,9,0,1);
INSERT INTO `weapon_skills` VALUES (106,'insurgency',x'00000000000000010000000000000000000000000000',7,300,0,71,5,1,11,2,0,1);
INSERT INTO `weapon_skills` VALUES (107,'infernal_scythe',x'01000001000000010100000000000000000000000000',7,300,256,72,5,1,2,5,0,0);
INSERT INTO `weapon_skills` VALUES (108,'quietus',x'00000000000000010000000000000000000000000000',7,300,0,73,5,1,14,10,0,1);
INSERT INTO `weapon_skills` VALUES (109,'entropy',x'01000000000000010100000000000000000000000000',7,357,0,74,5,1,9,5,0,1);
INSERT INTO `weapon_skills` VALUES (110,'eradication',x'00000000000000010000000000000000000000000000',7,400,0,259,5,1,14,10,0,1);
INSERT INTO `weapon_skills` VALUES (112,'double_thrust',x'02000000000002000000000200020000000000000000',8,5,0,121,5,1,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (113,'thunder_thrust',x'02000000000002000000000200020000000000000000',8,30,64,122,5,1,1,8,0,0);
INSERT INTO `weapon_skills` VALUES (114,'raiden_thrust',x'02000000000002000000000000020000000000000000',8,70,64,123,5,1,1,8,0,0);
INSERT INTO `weapon_skills` VALUES (115,'leg_sweep',x'02000000000001000000000200020000000000000000',8,100,0,124,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (116,'penta_thrust',x'01000000000001000000000100010000000000000000',8,150,0,125,5,1,2,0,0,0);
INSERT INTO `weapon_skills` VALUES (117,'vorpal_thrust',x'01000000000001000000000100010000000000000000',8,175,0,126,5,1,5,1,0,0);
INSERT INTO `weapon_skills` VALUES (118,'skewer',x'00000000000000000000000000010000000000000000',8,200,0,127,5,1,1,8,0,1);
INSERT INTO `weapon_skills` VALUES (119,'wheeling_thrust',x'00000000000000000000000000010000000000000000',8,225,0,128,5,1,11,0,0,1);
INSERT INTO `weapon_skills` VALUES (120,'impulse_drive',x'01000000000000000000000100010000000000000000',8,240,0,129,5,1,9,7,0,1);
INSERT INTO `weapon_skills` VALUES (121,'geirskogul',x'00000000000000000000000000000000000000000000',8,300,0,130,5,1,13,10,0,1);
INSERT INTO `weapon_skills` VALUES (122,'drakesbane',x'00000000000000000000000000010000000000000000',8,300,0,131,5,1,11,1,0,1);
INSERT INTO `weapon_skills` VALUES (123,'sonic_thrust',x'01000000000001000000000000010000000000000000',8,300,0,132,5,2,1,4,0,0);
INSERT INTO `weapon_skills` VALUES (124,'camlanns_torment',x'00000000000000000000000000010000000000000000',8,300,0,133,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (125,'stardiver',x'01000000000000000000000100010000000000000000',8,357,384,134,5,1,9,1,0,1);
INSERT INTO `weapon_skills` VALUES (128,'blade_rin',x'00000000000000000000000001000000000000000000',9,5,0,151,5,1,1,0,0,0);
INSERT INTO `weapon_skills` VALUES (129,'blade_retsu',x'00000000000000000000000001000000000000000000',9,30,0,152,5,1,4,0,0,0);
INSERT INTO `weapon_skills` VALUES (130,'blade_teki',x'00000000000000000000000001000000000000000000',9,70,8,153,5,1,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (131,'blade_to',x'00000000000000000000000001000000000000000000',9,100,32,154,5,1,7,6,0,0);
INSERT INTO `weapon_skills` VALUES (132,'blade_chi',x'00000000000000000000000001000000000000000000',9,150,4,155,5,1,1,8,0,0);
INSERT INTO `weapon_skills` VALUES (133,'blade_ei',x'00000000000000000000000001000000000000000000',9,175,256,156,5,1,2,0,0,0);
INSERT INTO `weapon_skills` VALUES (134,'blade_jin',x'00000000000000000000000001000000000000000000',9,200,0,157,5,1,6,8,0,1);
INSERT INTO `weapon_skills` VALUES (135,'blade_ten',x'00000000000000000000000001000000000000000000',9,225,0,158,5,1,9,0,0,1);
INSERT INTO `weapon_skills` VALUES (136,'blade_ku',x'00000000000000000000000001000000000000000000',9,250,0,159,5,1,9,1,0,1);
INSERT INTO `weapon_skills` VALUES (139,'blade_yu',x'00000000000000000000000001000000000000000000',9,290,8,162,5,1,5,4,0,1);
INSERT INTO `weapon_skills` VALUES (137,'blade_metsu',x'00000000000000000000000000000000000000000000',9,300,0,160,5,1,14,12,0,1);
INSERT INTO `weapon_skills` VALUES (138,'blade_kamu',x'00000000000000000000000001000000000000000000',9,300,0,161,5,1,12,2,0,1);
INSERT INTO `weapon_skills` VALUES (140,'blade_hi',x'00000000000000000000000001000000000000000000',9,300,0,163,5,1,14,9,0,1);
INSERT INTO `weapon_skills` VALUES (141,'blade_shun',x'00000000000000000000000001000000000000000000',9,357,0,164,5,1,11,8,0,1);
INSERT INTO `weapon_skills` VALUES (142,'blade_konton',x'00000000000000000000000001000000000000000000',9,400,0,263,5,1,14,12,0,1);
INSERT INTO `weapon_skills` VALUES (144,'tachi_enpi',x'00000000000000000000000202000000000000000000',10,5,0,166,5,1,1,4,0,0);
INSERT INTO `weapon_skills` VALUES (145,'tachi_hobaku',x'00000000000000000000000202000000000000000000',10,30,0,167,5,1,7,0,0,0);
INSERT INTO `weapon_skills` VALUES (146,'tachi_goten',x'00000000000000000000000202000000000000000000',10,70,64,168,5,1,1,8,0,0);
INSERT INTO `weapon_skills` VALUES (147,'tachi_kagero',x'00000000000000000000000202000000000000000000',10,100,2,169,5,1,3,0,0,0);
INSERT INTO `weapon_skills` VALUES (148,'tachi_jinpu',x'00000000000000000000000101000000000000000000',10,150,16,170,5,1,4,6,0,0);
INSERT INTO `weapon_skills` VALUES (149,'tachi_koki',x'00000000000000000000000101000000000000000000',10,175,128,171,5,1,5,8,0,0);
INSERT INTO `weapon_skills` VALUES (150,'tachi_yukikaze',x'00000000000000000000000100000000000000000000',10,200,0,172,5,1,7,6,0,1);
INSERT INTO `weapon_skills` VALUES (151,'tachi_gekko',x'00000000000000000000000100000000000000000000',10,225,0,173,5,1,10,5,0,1);
INSERT INTO `weapon_skills` VALUES (152,'tachi_kasha',x'00000000000000000000000100000000000000000000',10,250,0,174,5,1,11,2,0,1);
INSERT INTO `weapon_skills` VALUES (153,'tachi_kaiten',x'00000000000000000000000000000000000000000000',10,300,0,175,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (154,'tachi_rana',x'00000000000000000000000100000000000000000000',10,300,0,176,5,1,9,7,0,1);
INSERT INTO `weapon_skills` VALUES (155,'tachi_ageha',x'00000000000000000000000101000000000000000000',10,300,0,177,5,1,2,4,0,0);
INSERT INTO `weapon_skills` VALUES (156,'tachi_fudo',x'00000000000000000000000100000000000000000000',10,300,0,178,5,1,13,10,0,1);
INSERT INTO `weapon_skills` VALUES (157,'tachi_shoha',x'00000000000000000000000100000000000000000000',10,357,0,179,5,1,12,2,0,1);
INSERT INTO `weapon_skills` VALUES (158,'tachi_gankaku',x'00000000000000000000000100000000000000000000',10,400,0,258,5,1,12,2,0,1);
INSERT INTO `weapon_skills` VALUES (160,'shining_strike',x'02020202020202020202020202020202000200020202',11,5,128,76,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (161,'seraph_strike',x'02000200000002020000000200000002000000000200',11,40,128,77,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (162,'brainshaker',x'02020202020202020202020202020202000200020202',11,70,0,78,5,1,5,0,0,0);
INSERT INTO `weapon_skills` VALUES (163,'starlight',x'02020202020202020202020202020202000200020202',11,100,0,79,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (164,'moonlight',x'02000200000002020000000200000002000000020200',11,125,0,80,5,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (165,'skullbreaker',x'01010101010101010101010101010101000100010101',11,150,0,81,5,1,7,5,0,0);
INSERT INTO `weapon_skills` VALUES (166,'true_strike',x'01010101010101010101010101010101000100010101',11,175,0,82,5,1,6,8,0,0);
INSERT INTO `weapon_skills` VALUES (167,'judgment',x'02000200000002020000000200000002000000020202',11,200,0,83,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (168,'hexa_strike',x'00000100000000000000000000000000000000000100',11,220,0,84,5,1,11,0,0,1);
INSERT INTO `weapon_skills` VALUES (169,'black_halo',x'01010101000001000000000000000101000000010101',11,230,0,85,5,1,12,2,0,1);
INSERT INTO `weapon_skills` VALUES (172,'flash_nova',x'01000100000001000000000000000001000000000100',11,290,128,88,5,1,7,5,0,0);
INSERT INTO `weapon_skills` VALUES (170,'randgrith',x'00000000000000000000000000000000000000000000',11,300,0,86,5,1,13,12,0,1);
INSERT INTO `weapon_skills` VALUES (171,'mystic_boon',x'00000100000000000000000000000000000000000000',11,300,0,87,5,1,0,0,0,1);
INSERT INTO `weapon_skills` VALUES (173,'dagan',x'00000100000000000000000000000000000000000000',11,300,0,89,5,1,0,0,0,1);
INSERT INTO `weapon_skills` VALUES (174,'realmrazer',x'01010101000001000000000000000101000000010101',11,357,0,90,5,1,11,8,0,1);
INSERT INTO `weapon_skills` VALUES (176,'heavy_swing',x'02020202000002000002000000020200000000020200',12,5,0,136,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (177,'rock_crusher',x'02020202000002000002000000020200000000020200',12,40,4,137,5,1,8,0,0,0);
INSERT INTO `weapon_skills` VALUES (178,'earth_crusher',x'02020200000002000000000000000000000000020200',12,70,4,138,5,2,6,8,0,0);
INSERT INTO `weapon_skills` VALUES (179,'starburst',x'02020202000002000002000000020200000000020200',12,100,384,139,5,1,2,5,0,0);
INSERT INTO `weapon_skills` VALUES (180,'sunburst',x'02020200000002000000000000000000000000020200',12,150,0,140,5,1,2,5,0,0);
INSERT INTO `weapon_skills` VALUES (181,'shell_crusher',x'01010101000001000001000000010100000000010100',12,175,0,141,5,1,6,0,0,0);
INSERT INTO `weapon_skills` VALUES (182,'full_swing',x'01010101000001000001000000010100000000010100',12,200,0,142,5,1,3,8,0,0);
INSERT INTO `weapon_skills` VALUES (183,'spirit_taker',x'01010101000001000001000000010100000000010100',12,215,0,143,5,1,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (184,'retribution',x'01010101000001000001000000010100000000010100',12,230,0,144,5,1,9,5,0,1);
INSERT INTO `weapon_skills` VALUES (240,'tartarus_torpor',x'00000000000000000000000000000000000000000000',12,240,0,149,10,2,0,0,0,0);
INSERT INTO `weapon_skills` VALUES (189,'cataclysm',x'00010000000001000000000000000100000000000100',12,290,256,231,5,2,2,5,0,0);
INSERT INTO `weapon_skills` VALUES (185,'gate_of_tartarus',x'00000000000000000000000000000000000000000000',12,300,0,145,5,1,14,10,0,1);
INSERT INTO `weapon_skills` VALUES (186,'vidohunir',x'00000001000000000000000000000000000000000000',12,300,0,146,5,1,12,10,0,1);
INSERT INTO `weapon_skills` VALUES (187,'garland_of_bliss',x'00000000000000000000000000000100000000000000',12,300,0,147,5,1,11,5,0,1);
INSERT INTO `weapon_skills` VALUES (188,'omniscience',x'00000000000000000000000000000000000000010000',12,300,0,148,5,1,9,1,0,1);
INSERT INTO `weapon_skills` VALUES (190,'myrkr',x'00000001000000000000000000000100000000010000',12,300,0,150,5,1,0,0,0,1);
INSERT INTO `weapon_skills` VALUES (191,'shattersoul',x'01010101000001000001000000010100000000010100',12,357,0,239,5,1,9,7,0,1);
INSERT INTO `weapon_skills` VALUES (192,'flaming_arrow',x'00000000000000000000020000000000000000000000',25,5,2,191,16,1,3,1,0,0);
INSERT INTO `weapon_skills` VALUES (193,'piercing_arrow',x'00000000000000000000020000000000000000000000',25,40,0,192,16,1,5,1,0,0);
INSERT INTO `weapon_skills` VALUES (194,'dulling_arrow',x'00000000000000000000020000000000000000000000',25,80,0,193,16,1,3,1,0,0);
INSERT INTO `weapon_skills` VALUES (196,'sidewinder',x'00000000000000000000020000000000000000000000',25,175,0,195,16,1,5,1,6,0);
INSERT INTO `weapon_skills` VALUES (197,'blast_arrow',x'00000000000000000000010000000000000000000000',25,200,0,219,18,1,7,1,0,1);
INSERT INTO `weapon_skills` VALUES (198,'arching_arrow',x'00000000000000000000010000000000000000000000',25,225,0,220,16,1,11,0,0,1);
INSERT INTO `weapon_skills` VALUES (199,'empyreal_arrow',x'00000000000000000000010000000000000000000000',25,250,0,221,18,1,11,1,0,1);
INSERT INTO `weapon_skills` VALUES (201,'refulgent_arrow',x'00000000000000000000020000000000000000000000',25,290,0,232,16,1,5,1,0,0);
INSERT INTO `weapon_skills` VALUES (200,'namas_arrow',x'00000000000000000000000000000000000000000000',25,300,0,225,16,1,13,10,0,1);
INSERT INTO `weapon_skills` VALUES (202,'jishnus_radiance',x'00000000000000000000020000000000000000000000',25,300,0,234,16,1,13,11,0,1);
INSERT INTO `weapon_skills` VALUES (203,'apex_arrow',x'00000000000000000000010100000000000000000000',25,357,0,240,16,1,12,1,0,1);
INSERT INTO `weapon_skills` VALUES (204,'soulfetter_arrow',x'00000000000000000000010100000000000000000000',25,357,0,300,16,1,12,1,0,1);
INSERT INTO `weapon_skills` VALUES (208,'hot_shot',x'00000000000000000000020000000000020000000000',26,5,2,196,16,1,3,1,0,0);
INSERT INTO `weapon_skills` VALUES (209,'split_shot',x'00000000000000000000020000000000020000000000',26,40,0,197,16,1,5,1,0,0);
INSERT INTO `weapon_skills` VALUES (210,'sniper_shot',x'00000000000000000000020000000000020000000000',26,80,0,198,16,1,3,1,0,0);
INSERT INTO `weapon_skills` VALUES (212,'slug_shot',x'00000000000000000000020000000000020000000000',26,175,0,200,16,1,5,1,6,0);
INSERT INTO `weapon_skills` VALUES (213,'blast_shot',x'00000000000000000000010000000000000000000000',26,200,0,222,18,1,7,1,0,1);
INSERT INTO `weapon_skills` VALUES (214,'heavy_shot',x'00000000000000000000010000000000000000000000',26,225,0,223,16,1,11,0,0,1);
INSERT INTO `weapon_skills` VALUES (215,'detonator',x'00000000000000000000010000000000010000000000',26,250,0,224,18,1,11,1,0,1);
INSERT INTO `weapon_skills` VALUES (219,'numbing_shot',x'00000000000000000000020000000000020000000000',26,290,0,229,7,1,8,6,0,0);
INSERT INTO `weapon_skills` VALUES (216,'coronach',x'00000000000000000000000000000000000000000000',26,300,0,226,16,1,14,12,0,1);
INSERT INTO `weapon_skills` VALUES (217,'trueflight',x'00000000000000000000010000000000000000000000',26,300,128,227,16,1,12,4,0,1);
INSERT INTO `weapon_skills` VALUES (218,'leaden_salute',x'00000000000000000000000000000000010000000000',26,300,256,228,16,1,9,1,0,1);
INSERT INTO `weapon_skills` VALUES (220,'wildfire',x'00000000000000000000020000000000020000000000',26,300,2,235,16,1,14,9,0,1);
INSERT INTO `weapon_skills` VALUES (221,'last_stand',x'00000000000000000000020000000000020000000000',26,357,0,241,16,1,11,5,0,1);
INSERT INTO `weapon_skills` VALUES (222,'clamping_shot',x'00000000000000000000020000000000020000000000',26,400,0,199,16,1,11,5,0,1);

