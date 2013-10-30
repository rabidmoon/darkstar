-- MySQL dump 10.13  Distrib 5.5.28,for Win64 (x86)
--
-- Host: 10.0.0.10    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS,UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE,SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES,SQL_NOTES=0 */;

--
-- Table structure for table `treasure_spawn_points`
--

DROP TABLE IF EXISTS `treasure_spawn_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasure_spawn_points` (
  `npcid` int(10) NOT NULL,
  `pos` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`npcid`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasure_spawn_points`
--

LOCK TABLES `treasure_spawn_points` WRITE;
/*!40000 ALTER TABLE `treasure_spawn_points` DISABLE KEYS */;

--
-- Chests
--

INSERT INTO `treasure_spawn_points` VALUES (16814554,0,0,-393.000,16.000,-208.000);
INSERT INTO `treasure_spawn_points` VALUES (16814554,1,0,-392.950,16.000,-236.012);
INSERT INTO `treasure_spawn_points` VALUES (16814554,2,20,-349.409,16.000,-232.783);
INSERT INTO `treasure_spawn_points` VALUES (16814554,3,64,-379.409,16.000,-207.245);
INSERT INTO `treasure_spawn_points` VALUES (16814554,4,192,-329.944,0.247,-271.769);
INSERT INTO `treasure_spawn_points` VALUES (16814554,5,161,-322.799,32.000,-276.970);
INSERT INTO `treasure_spawn_points` VALUES (16814554,6,64,-349.915,32.247,-169.891);
INSERT INTO `treasure_spawn_points` VALUES (16814554,7,161,-362.928,32.000,-236.722);
INSERT INTO `treasure_spawn_points` VALUES (16814554,8,0,-389.971,32.247,-229.970);
INSERT INTO `treasure_spawn_points` VALUES (16822524,0,192,-140.636,7.999,200.498);
INSERT INTO `treasure_spawn_points` VALUES (16822524,1,66,-138.897,8.000,157.084);
INSERT INTO `treasure_spawn_points` VALUES (16822524,2,0,-236.521,12.001,32.003);
INSERT INTO `treasure_spawn_points` VALUES (16822524,3,192,-32.310,12.001,105.692);
INSERT INTO `treasure_spawn_points` VALUES (16822524,4,235,-19.717,7.973,66.538);
INSERT INTO `treasure_spawn_points` VALUES (16822524,5,66,67.304,15.973,-95.506);
INSERT INTO `treasure_spawn_points` VALUES (16822524,6,192,156.833,14.000,-86.775);
INSERT INTO `treasure_spawn_points` VALUES (16822524,7,132,197.942,7.995,-76.187);
INSERT INTO `treasure_spawn_points` VALUES (16822524,8,128,186.486,8.000,-42.940);
INSERT INTO `treasure_spawn_points` VALUES (16822524,9,66,-87.437,22.927,-37.080);
INSERT INTO `treasure_spawn_points` VALUES (16822524,10,90,-141.654,8.000,-251.000);
INSERT INTO `treasure_spawn_points` VALUES (16822524,11,192,-142.762,8.000,-310.777);
INSERT INTO `treasure_spawn_points` VALUES (16892176,0,192,179.709,-7.693,-97.007);
INSERT INTO `treasure_spawn_points` VALUES (16892176,1,65,111.451,-2.000,-100.159);
INSERT INTO `treasure_spawn_points` VALUES (16892176,2,190,8.974,-2.179,-133.075);
INSERT INTO `treasure_spawn_points` VALUES (16892176,3,60,260.391,0.000,21.487);
INSERT INTO `treasure_spawn_points` VALUES (16892176,4,130,177.600,8.310,100.000);
INSERT INTO `treasure_spawn_points` VALUES (16892176,5,190,89.034,-2.000,99.248);
INSERT INTO `treasure_spawn_points` VALUES (16892176,6,0,88.223,-2.000,-36.017);
INSERT INTO `treasure_spawn_points` VALUES (16892176,7,190,31.021,-2.000,99.013);
INSERT INTO `treasure_spawn_points` VALUES (17355006,0,21,62.583,-61.584,21.578);
INSERT INTO `treasure_spawn_points` VALUES (17355006,1,127,178.599,-84.157,46.361);
INSERT INTO `treasure_spawn_points` VALUES (17355006,2,0,114.363,-45.114,104.614);
INSERT INTO `treasure_spawn_points` VALUES (17355006,3,135,165.383,-32.000,139.055);
INSERT INTO `treasure_spawn_points` VALUES (17355006,4,71,143.690,-45.584,-102.603);
INSERT INTO `treasure_spawn_points` VALUES (17359046,0,15,143.385,-12.362,132.887);
INSERT INTO `treasure_spawn_points` VALUES (17359046,1,170,363.764,-24.250,167.509);
INSERT INTO `treasure_spawn_points` VALUES (17359046,2,110,216.953,-12.468,49.284);
INSERT INTO `treasure_spawn_points` VALUES (17359046,3,133,63.413,-0.081,11.611);
INSERT INTO `treasure_spawn_points` VALUES (17359046,4,65,12.770,-0.383,36.825);
INSERT INTO `treasure_spawn_points` VALUES (17359046,5,230,-12.144,-0.206,-63.396);
INSERT INTO `treasure_spawn_points` VALUES (17359046,6,253,-151.230,-0.359,-21.489);
INSERT INTO `treasure_spawn_points` VALUES (17363364,0,227,250.037,-32.069,174.156);
INSERT INTO `treasure_spawn_points` VALUES (17363364,1,255,241.950,-31.769,59.927);
INSERT INTO `treasure_spawn_points` VALUES (17363364,2,190,259.068,-31.625,-71.901);
INSERT INTO `treasure_spawn_points` VALUES (17363364,3,60,219.331,-31.595,4.665);
INSERT INTO `treasure_spawn_points` VALUES (17363364,4,197,216.795,-31.527,-71.373);
INSERT INTO `treasure_spawn_points` VALUES (17363364,5,160,262.397,-32.202,87.518);
INSERT INTO `treasure_spawn_points` VALUES (17363364,6,190,179.993,-31.956,93.280);
INSERT INTO `treasure_spawn_points` VALUES (17363364,7,60,139.909,-31.957,146.845);
INSERT INTO `treasure_spawn_points` VALUES (17363364,8,209,99.115,-32.000,83.067);
INSERT INTO `treasure_spawn_points` VALUES (17363364,9,111,21.141,-31.944,81.473);
INSERT INTO `treasure_spawn_points` VALUES (17363364,10,60,59.776,-31.592,5.373);
INSERT INTO `treasure_spawn_points` VALUES (17363364,11,60,99.917,-32.000,-41.557);
INSERT INTO `treasure_spawn_points` VALUES (17371602,0,52,-158.563,0.999,-226.058);
INSERT INTO `treasure_spawn_points` VALUES (17371602,1,150,-103.777,-0.900,-254.271);
INSERT INTO `treasure_spawn_points` VALUES (17371602,2,70,-242.625,0.935,-185.404);
INSERT INTO `treasure_spawn_points` VALUES (17371602,3,234,-267.030,-2.156,-263.207);
INSERT INTO `treasure_spawn_points` VALUES (17371602,4,135,-23.626,0.982,-105.747);
INSERT INTO `treasure_spawn_points` VALUES (17371602,5,235,63.712,-0.900,-254.442);
INSERT INTO `treasure_spawn_points` VALUES (17371602,6,132,125.386,-3.168,-259.326);
INSERT INTO `treasure_spawn_points` VALUES (17371602,7,5,100.137,1.387,-230.499);
INSERT INTO `treasure_spawn_points` VALUES (17371602,8,28,113.058,1.000,-224.402);
INSERT INTO `treasure_spawn_points` VALUES (17371602,9,1,182.259,0.915,-230.619);
INSERT INTO `treasure_spawn_points` VALUES (17371602,10,236,213.192,-2.309,-299.255);
INSERT INTO `treasure_spawn_points` VALUES (17379836,0,238,81.814,-3.250,1.523);
INSERT INTO `treasure_spawn_points` VALUES (17379836,1,206,122.451,-2.468,132.482);
INSERT INTO `treasure_spawn_points` VALUES (17379836,2,18,159.081,-3.275,78.207);
INSERT INTO `treasure_spawn_points` VALUES (17379836,3,94,150.931,-2.969,30.893);
INSERT INTO `treasure_spawn_points` VALUES (17379836,4,159,252.520,-3.000,-56.725);
INSERT INTO `treasure_spawn_points` VALUES (17379836,5,139,161.465,-3.000,-58.075);
INSERT INTO `treasure_spawn_points` VALUES (17379836,6,210,274.491,-3.249,45.577);
INSERT INTO `treasure_spawn_points` VALUES (17379836,7,171,272.330,-3.338,125.156);
INSERT INTO `treasure_spawn_points` VALUES (17379836,8,40,170.554,-3.000,174.293);
INSERT INTO `treasure_spawn_points` VALUES (17379836,9,47,107.592,-3.000,215.188);
INSERT INTO `treasure_spawn_points` VALUES (17379836,10,167,82.216,-3.196,117.415);
INSERT INTO `treasure_spawn_points` VALUES (17379836,11,214,22.898,-2.981,84.606);
INSERT INTO `treasure_spawn_points` VALUES (17388021,0,79,235.907,3.629,-251.378);
INSERT INTO `treasure_spawn_points` VALUES (17388021,1,169,290.556,2.731,-291.040);
INSERT INTO `treasure_spawn_points` VALUES (17388021,2,86,297.370,3.250,-219.350);
INSERT INTO `treasure_spawn_points` VALUES (17388021,3,147,327.747,3.500,-190.758);
INSERT INTO `treasure_spawn_points` VALUES (17388021,4,190,165.449,-0.632,-267.748);
INSERT INTO `treasure_spawn_points` VALUES (17388021,5,60,115.242,-0.546,-252.004);
INSERT INTO `treasure_spawn_points` VALUES (17388021,6,176,65.686,0.628,-347.556);
INSERT INTO `treasure_spawn_points` VALUES (17388021,7,133,63.105,-2.659,-191.565);
INSERT INTO `treasure_spawn_points` VALUES (17388021,8,99,-109.608,2.693,50.392);
INSERT INTO `treasure_spawn_points` VALUES (17388021,9,191,-59.329,-0.672,10.691);
INSERT INTO `treasure_spawn_points` VALUES (17388021,10,64,-59.163,-0.459,69.200);
INSERT INTO `treasure_spawn_points` VALUES (17388021,11,173,-14.535,0.583,-67.930);
INSERT INTO `treasure_spawn_points` VALUES (17396204,0,158,7.378,-16.293,-193.590);
INSERT INTO `treasure_spawn_points` VALUES (17396204,1,96,-52.531,24.218,-12.087);
INSERT INTO `treasure_spawn_points` VALUES (17396204,2,66,-79.345,23.731,-39.930);
INSERT INTO `treasure_spawn_points` VALUES (17396204,3,223,-107.048,24.218,-67.696);
INSERT INTO `treasure_spawn_points` VALUES (17396204,4,43,113.076,-16.326,-85.606);
INSERT INTO `treasure_spawn_points` VALUES (17396204,5,132,50.230,-16.000,-186.078);
INSERT INTO `treasure_spawn_points` VALUES (17396204,6,0,66.460,-4.285,-140.403);
INSERT INTO `treasure_spawn_points` VALUES (17396204,7,40,-167.569,-16.293,193.410);
INSERT INTO `treasure_spawn_points` VALUES (17396204,8,230,-274.293,-16.285,193.509);
INSERT INTO `treasure_spawn_points` VALUES (17396204,9,192,-206.721,-16.000,85.103);
INSERT INTO `treasure_spawn_points` VALUES (17396204,10,253,-213.101,-4.285,139.820);
INSERT INTO `treasure_spawn_points` VALUES (17396204,11,5,-102.026,-52.000,180.448);
INSERT INTO `treasure_spawn_points` VALUES (17396204,12,65,-19.589,-15.750,-15.309);
INSERT INTO `treasure_spawn_points` VALUES (17420669,0,254,-339.909,-127.601,20.816);
INSERT INTO `treasure_spawn_points` VALUES (17420669,1,65,-420.058,-127.601,99.913);
INSERT INTO `treasure_spawn_points` VALUES (17420669,2,255,-398.356,-127.424,20.397);
INSERT INTO `treasure_spawn_points` VALUES (17420669,3,65,-499.848,-127.601,20.397);
INSERT INTO `treasure_spawn_points` VALUES (17420669,4,105,-359.633,-111.424,-39.286);
INSERT INTO `treasure_spawn_points` VALUES (17420669,5,82,-416.369,-112.000,62.454);
INSERT INTO `treasure_spawn_points` VALUES (17420669,6,60,-425.616,-111.424,-0.879);
INSERT INTO `treasure_spawn_points` VALUES (17420669,7,247,-504.196,-112.000,55.353);
INSERT INTO `treasure_spawn_points` VALUES (17424556,0,191,-380.060,-143.601,20.603);
INSERT INTO `treasure_spawn_points` VALUES (17424556,1,255,-333.356,-144.016,-0.481);
INSERT INTO `treasure_spawn_points` VALUES (17424556,2,231,-250.738,-144.019,72.633);
INSERT INTO `treasure_spawn_points` VALUES (17424556,3,191,-220.087,-143.601,19.370);
INSERT INTO `treasure_spawn_points` VALUES (17436991,0,190,110.041,-20.002,106.811);
INSERT INTO `treasure_spawn_points` VALUES (17436991,1,0,-69.716,-19.468,35.659);
INSERT INTO `treasure_spawn_points` VALUES (17436991,2,190,-120.003,-24.000,136.748);
INSERT INTO `treasure_spawn_points` VALUES (17436991,3,65,-120.064,-24.000,103.328);
INSERT INTO `treasure_spawn_points` VALUES (17436991,4,190,-119.996,-24.000,-63.515);
INSERT INTO `treasure_spawn_points` VALUES (17436991,5,65,-119.933,-24.000,-95.999);
INSERT INTO `treasure_spawn_points` VALUES (17436991,6,65,-19.920,-20.010,-29.472);
INSERT INTO `treasure_spawn_points` VALUES (17436991,7,65,9.900,-20.000,12.662);
INSERT INTO `treasure_spawn_points` VALUES (17436991,8,190,9.900,-20.000,27.921);
INSERT INTO `treasure_spawn_points` VALUES (17436991,9,190,-20.354,-20.200,68.930);
INSERT INTO `treasure_spawn_points` VALUES (17436991,10,65,110.250,-20.011,-67.377);
INSERT INTO `treasure_spawn_points` VALUES (17436991,11,65,99.899,-24.065,64.915);
INSERT INTO `treasure_spawn_points` VALUES (17436991,12,190,99.899,-24.077,-25.562);
INSERT INTO `treasure_spawn_points` VALUES (17436991,13,0,57.319,-24.000,20.112);
INSERT INTO `treasure_spawn_points` VALUES (17436991,14,127,52.638,-24.000,20.112);
INSERT INTO `treasure_spawn_points` VALUES (17441082,0,62,-299.787,-48.000,24.873);
INSERT INTO `treasure_spawn_points` VALUES (17498609,0,129,189.673,18.999,30.161);
INSERT INTO `treasure_spawn_points` VALUES (17498609,1,16,173.566,20.431,42.832);
INSERT INTO `treasure_spawn_points` VALUES (17498609,2,124,413.783,8.448,-60.001);
INSERT INTO `treasure_spawn_points` VALUES (17498609,3,12,290.249,8.469,1.592);
INSERT INTO `treasure_spawn_points` VALUES (17498609,4,128,333.903,18.404,19.769);
INSERT INTO `treasure_spawn_points` VALUES (17498609,5,73,294.336,18.301,103.706);
INSERT INTO `treasure_spawn_points` VALUES (17498609,6,244,295.728,25.854,187.175);
INSERT INTO `treasure_spawn_points` VALUES (17498609,7,254,292.495,28.200,209.096);
INSERT INTO `treasure_spawn_points` VALUES (17498609,8,64,259.991,28.488,173.653);
INSERT INTO `treasure_spawn_points` VALUES (17498609,9,217,253.479,8.156,48.403);
INSERT INTO `treasure_spawn_points` VALUES (17498609,10,3,186.575,8.570,99.976);
INSERT INTO `treasure_spawn_points` VALUES (17555948,0,250,150.304,0.000,245.834);
INSERT INTO `treasure_spawn_points` VALUES (17555948,1,250,150.304,0.000,193.493);
INSERT INTO `treasure_spawn_points` VALUES (17555948,2,126,236.549,-0.210,149.944);
INSERT INTO `treasure_spawn_points` VALUES (17555948,3,250,203.316,0.000,140.128);
INSERT INTO `treasure_spawn_points` VALUES (17555948,4,250,203.316,0.000,129.619);
INSERT INTO `treasure_spawn_points` VALUES (17555948,5,250,203.316,0.000,119.546);
INSERT INTO `treasure_spawn_points` VALUES (17555948,6,126,213.959,0.000,129.619);
INSERT INTO `treasure_spawn_points` VALUES (17555948,7,126,236.549,-0.169,109.991);
INSERT INTO `treasure_spawn_points` VALUES (17555948,8,250,150.702,0.000,85.374);
INSERT INTO `treasure_spawn_points` VALUES (17555948,9,250,150.702,0.000,33.969);
INSERT INTO `treasure_spawn_points` VALUES (17555948,10,171,-19.585,6.630,14.740);
INSERT INTO `treasure_spawn_points` VALUES (17555948,11,0,-118.680,9.000,60.010);
INSERT INTO `treasure_spawn_points` VALUES (17555948,12,194,-56.994,7.359,155.155);
INSERT INTO `treasure_spawn_points` VALUES (17555948,13,193,-40.195,-0.008,-130.093);
INSERT INTO `treasure_spawn_points` VALUES (17559918,0,254,-499.709,3.262,215.970);
INSERT INTO `treasure_spawn_points` VALUES (17559918,1,73,-117.128,3.970,134.104);
INSERT INTO `treasure_spawn_points` VALUES (17559918,2,105,-60.745,3.063,295.362);
INSERT INTO `treasure_spawn_points` VALUES (17559918,3,105,-62.183,3.215,416.434);
INSERT INTO `treasure_spawn_points` VALUES (17559918,4,27,-287.324,3.538,328.969);
INSERT INTO `treasure_spawn_points` VALUES (17559918,5,50,-273.053,4.406,332.914);
INSERT INTO `treasure_spawn_points` VALUES (17559918,6,0,-100.291,3.277,495.744);
INSERT INTO `treasure_spawn_points` VALUES (17559918,7,0,-62.243,0.228,564.120);
INSERT INTO `treasure_spawn_points` VALUES (17559918,8,60,-206.223,3.874,571.662);
INSERT INTO `treasure_spawn_points` VALUES (17559918,9,60,-247.736,3.743,576.783);
INSERT INTO `treasure_spawn_points` VALUES (17559918,10,190,-239.459,4.000,505.813);
INSERT INTO `treasure_spawn_points` VALUES (17559918,11,190,-198.482,4.000,506.684);
INSERT INTO `treasure_spawn_points` VALUES (17559918,12,60,-264.091,3.255,460.409);
INSERT INTO `treasure_spawn_points` VALUES (17559918,13,223,-337.859,3.228,384.203);
INSERT INTO `treasure_spawn_points` VALUES (17559918,14,195,-419.957,3.876,335.875);
INSERT INTO `treasure_spawn_points` VALUES (17563908,0,125,-177.956,-0.002,-220.058);
INSERT INTO `treasure_spawn_points` VALUES (17568186,0,165,-111.515,27.986,-90.305);
INSERT INTO `treasure_spawn_points` VALUES (17568186,1,150,-109.446,-0.021,-90.724);
INSERT INTO `treasure_spawn_points` VALUES (17568186,2,103,-108.188,28.338,-29.797);
INSERT INTO `treasure_spawn_points` VALUES (17568186,3,40,-168.397,28.112,-28.818);
INSERT INTO `treasure_spawn_points` VALUES (17568186,4,192,-32.101,-0.040,-90.118);
INSERT INTO `treasure_spawn_points` VALUES (17568186,5,236,-50.539,27.989,-88.427);
INSERT INTO `treasure_spawn_points` VALUES (17568186,6,8,-51.511,28.085,-28.593);
INSERT INTO `treasure_spawn_points` VALUES (17568186,7,198,-15.960,28.372,-31.662);
INSERT INTO `treasure_spawn_points` VALUES (17568186,8,94,10.390,28.396,-30.526);
INSERT INTO `treasure_spawn_points` VALUES (17568186,9,185,8.064,27.984,-90.003);
INSERT INTO `treasure_spawn_points` VALUES (17568186,10,188,-98.103,-27.613,-285.174);
INSERT INTO `treasure_spawn_points` VALUES (17568186,11,190,-140.193,0.546,176.329);
INSERT INTO `treasure_spawn_points` VALUES (17568186,12,194,-112.788,-0.035,230.281);
INSERT INTO `treasure_spawn_points` VALUES (17568186,13,236,-169.325,0.008,231.696);
INSERT INTO `treasure_spawn_points` VALUES (17568186,14,62,-167.160,0.068,289.223);
INSERT INTO `treasure_spawn_points` VALUES (17572283,0,250,-423.066,0.000,672.483);
INSERT INTO `treasure_spawn_points` VALUES (17576351,0,254,171.927,-7.999,20.008);
INSERT INTO `treasure_spawn_points` VALUES (17576351,1,1,261.094,-33.250,100.014);
INSERT INTO `treasure_spawn_points` VALUES (17576351,2,127,98.908,-33.250,100.046);
INSERT INTO `treasure_spawn_points` VALUES (17576351,3,127,98.894,-33.250,-60.000);
INSERT INTO `treasure_spawn_points` VALUES (17576351,4,1,260.965,-33.250,-59.905);
INSERT INTO `treasure_spawn_points` VALUES (17576351,5,193,179.926,-32.000,-51.239);
INSERT INTO `treasure_spawn_points` VALUES (17576351,6,128,251.208,-32.000,20.054);
INSERT INTO `treasure_spawn_points` VALUES (17576351,7,1,-518.830,-8.000,500.082);
INSERT INTO `treasure_spawn_points` VALUES (17576351,8,127,-411.948,8.000,499.879);
INSERT INTO `treasure_spawn_points` VALUES (17576351,9,190,-438.279,0.350,304.854);
INSERT INTO `treasure_spawn_points` VALUES (17580397,0,216,-14.130,-39.999,-85.554);
INSERT INTO `treasure_spawn_points` VALUES (17584469,0,13,39.767,-0.178,-313.865);
INSERT INTO `treasure_spawn_points` VALUES (17584469,1,255,98.913,-1.981,-344.437);
INSERT INTO `treasure_spawn_points` VALUES (17584469,2,65,-7.115,-0.562,-382.455);
INSERT INTO `treasure_spawn_points` VALUES (17584469,3,199,9.410,-0.930,-418.559);
INSERT INTO `treasure_spawn_points` VALUES (17584469,4,170,-93.078,-0.276,-393.625);
INSERT INTO `treasure_spawn_points` VALUES (17584469,5,255,-57.575,-0.238,-279.965);
INSERT INTO `treasure_spawn_points` VALUES (17584469,6,218,24.264,-0.439,165.450);
INSERT INTO `treasure_spawn_points` VALUES (17584469,7,20,11.445,-0.168,211.587);
INSERT INTO `treasure_spawn_points` VALUES (17584469,8,85,54.721,-0.346,233.897);
INSERT INTO `treasure_spawn_points` VALUES (17584469,9,148,35.373,-0.586,264.295);
INSERT INTO `treasure_spawn_points` VALUES (17584469,10,216,-15.799,-0.464,245.820);
INSERT INTO `treasure_spawn_points` VALUES (17584469,11,24,-32.961,-0.351,294.132);
INSERT INTO `treasure_spawn_points` VALUES (17584469,12,46,-89.586,-9.624,95.296);
INSERT INTO `treasure_spawn_points` VALUES (17588767,0,9,290.287,20.225,-138.060);
INSERT INTO `treasure_spawn_points` VALUES (17596803,0,128,-163.053,0.000,351.988);
INSERT INTO `treasure_spawn_points` VALUES (17596803,1,124,-352.798,15.602,266.998);
INSERT INTO `treasure_spawn_points` VALUES (17596803,2,7,-84.561,5.269,139.762);
INSERT INTO `treasure_spawn_points` VALUES (17596803,3,128,-62.448,0.000,88.577);
INSERT INTO `treasure_spawn_points` VALUES (17596803,4,128,-122.826,0.000,112.010);
INSERT INTO `treasure_spawn_points` VALUES (17596803,5,65,-220.049,0.000,167.949);
INSERT INTO `treasure_spawn_points` VALUES (17596803,6,101,14.274,6.000,214.198);
INSERT INTO `treasure_spawn_points` VALUES (17596803,7,192,-7.949,-0.143,296.822);
INSERT INTO `treasure_spawn_points` VALUES (17596803,8,2,-88.405,4.784,299.916);
INSERT INTO `treasure_spawn_points` VALUES (17596803,9,128,-142.400,0.000,328.437);
INSERT INTO `treasure_spawn_points` VALUES (17613220,0,91,170.680,-24.000,210.826);
INSERT INTO `treasure_spawn_points` VALUES (17613220,1,156,172.161,-24.006,-88.152);
INSERT INTO `treasure_spawn_points` VALUES (17613220,2,131,210.956,-24.000,-31.915);
INSERT INTO `treasure_spawn_points` VALUES (17613220,3,226,112.361,-24.008,-52.220);
INSERT INTO `treasure_spawn_points` VALUES (17613220,4,142,136.771,-24.000,43.430);
INSERT INTO `treasure_spawn_points` VALUES (17613220,5,23,102.932,-24.000,76.664);
INSERT INTO `treasure_spawn_points` VALUES (17613220,6,92,170.954,-24.000,131.078);
INSERT INTO `treasure_spawn_points` VALUES (17613220,7,228,28.788,-16.000,108.641);
INSERT INTO `treasure_spawn_points` VALUES (17613220,8,232,-8.153,-16.000,61.675);
INSERT INTO `treasure_spawn_points` VALUES (17613220,9,43,-45.479,-16.009,93.216);
INSERT INTO `treasure_spawn_points` VALUES (17613220,10,2,-116.587,-16.000,29.954);
INSERT INTO `treasure_spawn_points` VALUES (17613220,11,53,-164.008,-16.003,95.594);
INSERT INTO `treasure_spawn_points` VALUES (17613220,12,193,-190.058,-16.000,3.435);
INSERT INTO `treasure_spawn_points` VALUES (17613220,13,13,-95.248,-16.005,164.285);
INSERT INTO `treasure_spawn_points` VALUES (17649890,0,3,50.829,3.684,-27.560);

--
-- Coffers
--

INSERT INTO `treasure_spawn_points` VALUES (16826620,0,64,-46.014,17.980,-26.274);
INSERT INTO `treasure_spawn_points` VALUES (16826620,1,60,348.964,26.066,8.791);
INSERT INTO `treasure_spawn_points` VALUES (16826620,2,0,212.428,19.825,-21.050);
INSERT INTO `treasure_spawn_points` VALUES (16826620,3,190,2.971,16.000,-22.634);
INSERT INTO `treasure_spawn_points` VALUES (16826620,4,0,-68.858,15.992,30.021);
INSERT INTO `treasure_spawn_points` VALUES (16826620,5,190,-24.070,16.841,18.666);
INSERT INTO `treasure_spawn_points` VALUES (16826620,6,60,140.090,20.000,-44.821);
INSERT INTO `treasure_spawn_points` VALUES (16826620,7,90,94.145,15.995,71.251);
INSERT INTO `treasure_spawn_points` VALUES (16826620,8,190,140.432,19.989,84.637);
INSERT INTO `treasure_spawn_points` VALUES (17310019,0,155,-306.824,-23.999,230.783);
INSERT INTO `treasure_spawn_points` VALUES (17379837,0,135,216.974,39.702,68.790);
INSERT INTO `treasure_spawn_points` VALUES (17379837,1,255,369.956,24.075,59.954);
INSERT INTO `treasure_spawn_points` VALUES (17379837,2,210,414.430,23.859,91.361);
INSERT INTO `treasure_spawn_points` VALUES (17379837,3,60,380.187,24.019,150.749);
INSERT INTO `treasure_spawn_points` VALUES (17379837,4,255,330.943,24.244,99.591);
INSERT INTO `treasure_spawn_points` VALUES (17379837,5,45,256.112,39.805,149.514);
INSERT INTO `treasure_spawn_points` VALUES (17379837,6,45,187.398,39.999,95.752);
INSERT INTO `treasure_spawn_points` VALUES (17379837,7,25,170.601,39.831,25.066);
INSERT INTO `treasure_spawn_points` VALUES (17391843,0,187,9.376,-1.345,-223.188);
INSERT INTO `treasure_spawn_points` VALUES (17391843,1,148,106.335,-0.829,-106.411);
INSERT INTO `treasure_spawn_points` VALUES (17391843,2,45,60.765,-0.333,-93.267);
INSERT INTO `treasure_spawn_points` VALUES (17391843,3,201,12.823,-0.390,-144.714);
INSERT INTO `treasure_spawn_points` VALUES (17391843,4,168,37.379,-0.687,-146.255);
INSERT INTO `treasure_spawn_points` VALUES (17391843,5,114,22.771,-1.363,-130.966);
INSERT INTO `treasure_spawn_points` VALUES (17391843,6,60,17.613,-1.386,-91.632);
INSERT INTO `treasure_spawn_points` VALUES (17391843,7,32,-65.136,-0.739,-142.362);
INSERT INTO `treasure_spawn_points` VALUES (17391843,8,30,-68.553,-1.002,-186.570);
INSERT INTO `treasure_spawn_points` VALUES (17391843,9,107,-21.343,-0.797,-177.934);
INSERT INTO `treasure_spawn_points` VALUES (17396205,0,223,-102.723,-60.000,-222.555);
INSERT INTO `treasure_spawn_points` VALUES (17396205,1,0,-266.089,-15.750,-20.133);
INSERT INTO `treasure_spawn_points` VALUES (17396205,2,0,-262.641,-20.000,-60.291);
INSERT INTO `treasure_spawn_points` VALUES (17396205,3,34,-144.194,-39.729,-15.149);
INSERT INTO `treasure_spawn_points` VALUES (17396205,4,130,-80.274,-40.203,-80.277);
INSERT INTO `treasure_spawn_points` VALUES (17396205,5,100,-15.114,-39.745,-134.880);
INSERT INTO `treasure_spawn_points` VALUES (17396205,6,160,-13.623,-39.834,-184.540);
INSERT INTO `treasure_spawn_points` VALUES (17396205,7,193,-60.369,-71.750,-146.231);
INSERT INTO `treasure_spawn_points` VALUES (17396205,8,63,-139.729,-71.750,-53.252);
INSERT INTO `treasure_spawn_points` VALUES (17396205,9,65,-100.197,-72.511,-13.141);
INSERT INTO `treasure_spawn_points` VALUES (17404383,0,95,28.477,6.335,145.925);
INSERT INTO `treasure_spawn_points` VALUES (17404383,1,120,-62.707,8.787,80.017);
INSERT INTO `treasure_spawn_points` VALUES (17404383,2,5,-100.194,7.716,71.802);
INSERT INTO `treasure_spawn_points` VALUES (17404383,3,27,26.121,6.102,95.937);
INSERT INTO `treasure_spawn_points` VALUES (17404383,4,180,68.144,6.428,54.531);
INSERT INTO `treasure_spawn_points` VALUES (17404383,5,234,108.235,7.085,26.143);
INSERT INTO `treasure_spawn_points` VALUES (17404383,6,139,136.094,10.600,26.152);
INSERT INTO `treasure_spawn_points` VALUES (17404383,7,81,176.461,8.172,65.105);
INSERT INTO `treasure_spawn_points` VALUES (17404383,8,200,184.816,5.867,-52.454);
INSERT INTO `treasure_spawn_points` VALUES (17404383,9,0,201.244,8.791,-163.229);
INSERT INTO `treasure_spawn_points` VALUES (17404383,10,66,260.650,8.445,-73.685);
INSERT INTO `treasure_spawn_points` VALUES (17404383,11,18,215.152,8.210,16.315);
INSERT INTO `treasure_spawn_points` VALUES (17404383,12,42,251.260,5.078,24.927);
INSERT INTO `treasure_spawn_points` VALUES (17404383,13,12,251.809,6.141,-18.487);
INSERT INTO `treasure_spawn_points` VALUES (17428979,0,192,-219.944,-0.800,30.638);
INSERT INTO `treasure_spawn_points` VALUES (17428979,1,65,-130.001,0.000,32.935);
INSERT INTO `treasure_spawn_points` VALUES (17428979,2,255,-220.044,-0.000,-19.961);
INSERT INTO `treasure_spawn_points` VALUES (17428979,3,654,-99.999,-0.000,-15.989);
INSERT INTO `treasure_spawn_points` VALUES (17428979,4,125,-122.910,-0.079,-30.315);
INSERT INTO `treasure_spawn_points` VALUES (17428979,5,65,-149.978,0.000,-46.935);
INSERT INTO `treasure_spawn_points` VALUES (17428979,6,65,-126.637,-0.951,-86.835);
INSERT INTO `treasure_spawn_points` VALUES (17428979,7,255,-49.102,0.453,-100.020);
INSERT INTO `treasure_spawn_points` VALUES (17428979,8,190,20.002,-2.011,-143.061);
INSERT INTO `treasure_spawn_points` VALUES (17428979,9,65,-65.184,0.022,27.081);
INSERT INTO `treasure_spawn_points` VALUES (17433071,0,95,371.199,-5.059,260.752);
INSERT INTO `treasure_spawn_points` VALUES (17433071,1,65,-17.924,36.239,-130.382);
INSERT INTO `treasure_spawn_points` VALUES (17433071,2,255,10.426,36.024,-83.844);
INSERT INTO `treasure_spawn_points` VALUES (17433071,3,130,-27.783,44.986,19.830);
INSERT INTO `treasure_spawn_points` VALUES (17433071,4,188,20.967,16.957,-37.771);
INSERT INTO `treasure_spawn_points` VALUES (17433071,5,23,-17.675,15.350,-69.098);
INSERT INTO `treasure_spawn_points` VALUES (17433071,6,95,59.457,15.435,-68.965);
INSERT INTO `treasure_spawn_points` VALUES (17433071,7,190,139.838,15.080,-131.904);
INSERT INTO `treasure_spawn_points` VALUES (17433071,8,62,122.006,15.312,-56.013);
INSERT INTO `treasure_spawn_points` VALUES (17433071,9,105,142.462,15.834,-21.777);
INSERT INTO `treasure_spawn_points` VALUES (17433071,10,125,372.407,-5.088,340.338);
INSERT INTO `treasure_spawn_points` VALUES (17433071,11,65,460.201,5.092,331.775);
INSERT INTO `treasure_spawn_points` VALUES (17436992,0,125,-72.899,0.137,19.549);
INSERT INTO `treasure_spawn_points` VALUES (17436992,1,0,-49.542,0.137,19.549);
INSERT INTO `treasure_spawn_points` VALUES (17436992,2,190,-59.511,0.137,30.749);
INSERT INTO `treasure_spawn_points` VALUES (17436992,3,65,-59.511,0.137,10.051);
INSERT INTO `treasure_spawn_points` VALUES (17436992,4,190,-223.298,-8.000,-143.759);
INSERT INTO `treasure_spawn_points` VALUES (17436992,5,65,-223.298,-8.000,183.912);
INSERT INTO `treasure_spawn_points` VALUES (17436992,6,190,103.469,-8.000,-143.759);
INSERT INTO `treasure_spawn_points` VALUES (17436992,7,65,103.469,-8.000,183.912);
INSERT INTO `treasure_spawn_points` VALUES (17469829,0,62,219.993,16.003,-49.049);
INSERT INTO `treasure_spawn_points` VALUES (17469829,1,192,-88.634,16.000,-31.234);
INSERT INTO `treasure_spawn_points` VALUES (17469829,2,0,-191.180,21.502,-100.104);
INSERT INTO `treasure_spawn_points` VALUES (17469829,3,0,-191.211,21.502,-140.088);
INSERT INTO `treasure_spawn_points` VALUES (17469829,4,192,-59.985,21.502,-191.163);
INSERT INTO `treasure_spawn_points` VALUES (17469829,5,128,111.091,21.502,-180.065);
INSERT INTO `treasure_spawn_points` VALUES (17469829,6,192,114.148,16.000,-226.101);
INSERT INTO `treasure_spawn_points` VALUES (17469829,7,128,72.746,16.000,-180.041);
INSERT INTO `treasure_spawn_points` VALUES (17469829,8,226,26.746,16.500,-212.454);
INSERT INTO `treasure_spawn_points` VALUES (17469829,9,0,6.567,16.000,-180.089);
INSERT INTO `treasure_spawn_points` VALUES (17469829,10,192,179.943,21.502,-271.297);
INSERT INTO `treasure_spawn_points` VALUES (17469829,11,128,310.808,21.502,-179.957);
INSERT INTO `treasure_spawn_points` VALUES (17469829,12,66,285.821,18.000,-59.620);
INSERT INTO `treasure_spawn_points` VALUES (17469829,13,31,143.977,9.500,-103.950);
INSERT INTO `treasure_spawn_points` VALUES (17469829,14,159,95.977,21.500,-56.045);
INSERT INTO `treasure_spawn_points` VALUES (17490294,0,191,103.708,-11.326,208.367);
INSERT INTO `treasure_spawn_points` VALUES (17490294,1,13,127.993,-11.318,96.500);
INSERT INTO `treasure_spawn_points` VALUES (17490294,2,181,126.990,-1.319,49.802);
INSERT INTO `treasure_spawn_points` VALUES (17490294,3,148,154.813,-10.473,-68.138);
INSERT INTO `treasure_spawn_points` VALUES (17490294,4,106,41.657,-11.623,29.949);
INSERT INTO `treasure_spawn_points` VALUES (17490294,5,4,15.489,-11.354,8.337);
INSERT INTO `treasure_spawn_points` VALUES (17490294,6,45,-10.184,-1.373,127.082);
INSERT INTO `treasure_spawn_points` VALUES (17490294,7,163,26.277,-1.554,134.207);
INSERT INTO `treasure_spawn_points` VALUES (17490294,8,196,-15.217,-1.907,51.530);
INSERT INTO `treasure_spawn_points` VALUES (17490294,9,10,-92.888,-0.282,2.676);
INSERT INTO `treasure_spawn_points` VALUES (17490294,10,192,-14.067,-11.940,-132.941);
INSERT INTO `treasure_spawn_points` VALUES (17490294,11,61,-25.934,-11.000,-142.247);
INSERT INTO `treasure_spawn_points` VALUES (17490294,12,30,-27.946,-21.825,-183.709);
INSERT INTO `treasure_spawn_points` VALUES (17498610,0,207,-184.862,17.989,-108.860);
INSERT INTO `treasure_spawn_points` VALUES (17498610,1,4,-130.961,29.207,19.947);
INSERT INTO `treasure_spawn_points` VALUES (17498610,2,114,-106.972,19.055,-65.469);
INSERT INTO `treasure_spawn_points` VALUES (17498610,3,35,-168.173,18.653,-92.826);
INSERT INTO `treasure_spawn_points` VALUES (17498610,4,141,-130.746,20.058,-24.084);
INSERT INTO `treasure_spawn_points` VALUES (17498610,5,254,-188.832,19.446,56.939);
INSERT INTO `treasure_spawn_points` VALUES (17498610,6,65,-220.245,18.466,53.843);
INSERT INTO `treasure_spawn_points` VALUES (17498610,7,149,-288.582,17.787,-73.885);
INSERT INTO `treasure_spawn_points` VALUES (17498610,8,174,-227.255,10.000,-65.473);
INSERT INTO `treasure_spawn_points` VALUES (17498610,9,191,-259.927,8.705,-133.028);
INSERT INTO `treasure_spawn_points` VALUES (17498610,10,254,-356.233,15.475,-104.030);
INSERT INTO `treasure_spawn_points` VALUES (17502692,0,1,101.588,15.837,380.587);
INSERT INTO `treasure_spawn_points` VALUES (17576352,0,31,159.011,-27.999,161.005);
INSERT INTO `treasure_spawn_points` VALUES (17576352,1,64,179.864,-32.000,91.100);
INSERT INTO `treasure_spawn_points` VALUES (17576352,2,1,108.749,-32.000,19.951);
INSERT INTO `treasure_spawn_points` VALUES (17576352,3,223,39.264,-28.000,-0.712);
INSERT INTO `treasure_spawn_points` VALUES (17576352,4,6,174.753,-0.418,-100.369);
INSERT INTO `treasure_spawn_points` VALUES (17576352,5,63,299.967,0.000,69.413);
INSERT INTO `treasure_spawn_points` VALUES (17576352,6,194,300.082,0.000,-29.448);
INSERT INTO `treasure_spawn_points` VALUES (17576352,7,174,188.319,-0.590,128.702);
INSERT INTO `treasure_spawn_points` VALUES (17576352,8,2,-386.548,-3.000,335.046);
INSERT INTO `treasure_spawn_points` VALUES (17584470,0,211,-95.676,-0.436,205.557);
INSERT INTO `treasure_spawn_points` VALUES (17584470,1,229,-103.267,-1.766,-392.964);
INSERT INTO `treasure_spawn_points` VALUES (17584470,2,235,-185.774,-0.282,-379.022);
INSERT INTO `treasure_spawn_points` VALUES (17584470,3,150,-45.265,-0.477,224.265);
INSERT INTO `treasure_spawn_points` VALUES (17584470,4,22,-113.889,-0.449,255.583);
INSERT INTO `treasure_spawn_points` VALUES (17584470,5,74,-129.480,-0.945,378.933);
INSERT INTO `treasure_spawn_points` VALUES (17584470,6,206,-150.126,-0.904,341.438);
INSERT INTO `treasure_spawn_points` VALUES (17596804,0,247,9.831,5.781,10.208);
INSERT INTO `treasure_spawn_points` VALUES (17596804,1,65,-20.193,5.144,85.064);
INSERT INTO `treasure_spawn_points` VALUES (17596804,2,65,100.057,-3.250,103.200);
INSERT INTO `treasure_spawn_points` VALUES (17596804,3,0,-183.168,-3.250,59.951);
INSERT INTO `treasure_spawn_points` VALUES (17596804,4,0,-127.756,0.000,379.906);
INSERT INTO `treasure_spawn_points` VALUES (17596804,5,193,-20.570,-3.250,296.848);
INSERT INTO `treasure_spawn_points` VALUES (17596804,6,193,20.042,-9.250,376.955);
INSERT INTO `treasure_spawn_points` VALUES (17617214,0,159,190.735,-0.191,-30.485);
INSERT INTO `treasure_spawn_points` VALUES (17617214,1,208,-71.694,19.585,-21.956);
INSERT INTO `treasure_spawn_points` VALUES (17617214,2,58,-64.669,20.035,-38.858);
INSERT INTO `treasure_spawn_points` VALUES (17617214,3,74,24.680,20.033,-38.530);
INSERT INTO `treasure_spawn_points` VALUES (17617214,4,57,51.015,17.523,-131.594);
INSERT INTO `treasure_spawn_points` VALUES (17617214,5,80,-8.835,18.592,-128.882);
INSERT INTO `treasure_spawn_points` VALUES (17617214,6,38,-97.569,3.927,-183.248);
INSERT INTO `treasure_spawn_points` VALUES (17617214,7,231,-21.635,-1.884,-71.206);
INSERT INTO `treasure_spawn_points` VALUES (17617214,8,86,31.185,-1.912,-18.542);
INSERT INTO `treasure_spawn_points` VALUES (17617214,9,227,102.903,3.939,-97.614);
INSERT INTO `treasure_spawn_points` VALUES (17617214,10,2,-67.400,0.000,-39.111);
INSERT INTO `treasure_spawn_points` VALUES (17617214,11,255,-67.099,0.000,-0.796);
INSERT INTO `treasure_spawn_points` VALUES (17617214,12,182,160.900,-0.068,-22.165);
INSERT INTO `treasure_spawn_points` VALUES (17629729,0,255,613.598,-6.057,-680.984);
INSERT INTO `treasure_spawn_points` VALUES (17629729,1,192,540.553,-16.920,-770.118);
INSERT INTO `treasure_spawn_points` VALUES (17629729,2,255,429.401,-16.890,-739.502);
INSERT INTO `treasure_spawn_points` VALUES (17629729,3,194,495.848,-10.863,-827.019);
INSERT INTO `treasure_spawn_points` VALUES (17629729,4,255,629.929,-16.899,-820.711);
INSERT INTO `treasure_spawn_points` VALUES (17629729,5,66,740.357,-16.877,-789.623);
INSERT INTO `treasure_spawn_points` VALUES (17629729,6,94,826.074,-11.118,-733.808);
INSERT INTO `treasure_spawn_points` VALUES (17629729,7,156,867.442,1.146,-708.477);
INSERT INTO `treasure_spawn_points` VALUES (17629729,8,27,865.615,1.942,-622.742);
INSERT INTO `treasure_spawn_points` VALUES (17629729,9,192,677.287,3.220,-581.735);

/*!40000 ALTER TABLE `treasure_spawn_points` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-29 21:07:47
