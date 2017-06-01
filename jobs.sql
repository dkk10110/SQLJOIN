-- MySQL dump 10.13  Distrib 5.6.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jobs
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `source` varchar(250) NOT NULL,
  `source_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-auth-user_id-user-id` (`user_id`),
  CONSTRAINT `fk-auth-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_name`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_3` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('User',22,1490953949),('Jobs',23,1490954030),('Jobs',24,1490954337),('User',25,1490955061),('System',36,NULL),('User',123,1459420705),('User',124,1459420751),('User',134,1459423331),('User',135,1459423384),('User',143,1459510539),('User',144,1459511125),('Jobs',146,1462166548),('User',148,1462953678),('User',149,1462953683),('User',150,1462953686),('User',151,1462953691),('User',152,1462953694),('User',156,1462278385),('User',160,1462971119),('User',162,1462971692),('User',163,1463037629),('User',183,1463039544),('User',187,1463043830),('User',188,1463043882),('Jobs',189,1463043961),('User',193,1465018975),('User',194,1468657246),('Jobs',200,1469606105),('Jobs',201,1469606196),('Jobs',202,1469606298),('Jobs',203,1470204759),('Jobs',204,1471935332),('Jobs',205,1471935524),('Jobs',206,1471935654),('Jobs',211,1473138892),('User',212,1473142499),('User',214,1473143603),('Jobs',218,1473159813),('Jobs',219,1473318966),('User',220,1478691570),('User',221,1479111778),('User',222,1479111924),('User',223,1479189628),('User',224,1479189728),('Jobs',225,1479189869),('User',226,1479293568),('User',227,1479293747),('User',228,1479294023),('User',229,1479295882),('User',230,1479295953),('User',231,1479296082),('User',232,1479296120),('User',233,1479296172),('Jobs',234,1479793467),('Jobs',235,1479794038);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,'every thing access',NULL,NULL,1437382962,1437382962),('/auth/*',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/assignment/*',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/assignment/assign',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/assignment/index',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/assignment/revoke',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/assignment/view',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/default/*',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/default/index',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/*',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/create',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/delete',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/index',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/update',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/menu/view',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/permission/*',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/permission/assign',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/permission/create',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/permission/delete',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/permission/index',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/permission/remove',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/permission/update',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/permission/view',2,NULL,NULL,NULL,1469526957,1469526957),('/auth/role/*',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/assign',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/create',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/delete',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/index',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/remove',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/update',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/role/view',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/route/*',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/route/assign',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/route/create',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/route/index',2,NULL,NULL,NULL,1469526958,1469526958),('/auth/route/refresh',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/route/remove',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/*',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/create',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/delete',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/index',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/update',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/rule/view',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/*',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/user/activate',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/user/change-password',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/user/delete',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/index',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/login',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/logout',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/request-password-reset',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/user/reset-password',2,NULL,NULL,NULL,1469526960,1469526960),('/auth/user/signup',2,NULL,NULL,NULL,1469526959,1469526959),('/auth/user/view',2,NULL,NULL,NULL,1469526959,1469526959),('/automaticEmails/index',2,NULL,NULL,NULL,1482992746,1482992746),('/cms/*',2,NULL,NULL,NULL,1462019406,1462019406),('/cms/cms-block-mapper/*',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-block-mapper/create',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-block-mapper/delete',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-block-mapper/index',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block-mapper/update',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-block-mapper/view',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/*',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/create',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/delete',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/index',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/update',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-block/view',2,NULL,NULL,NULL,1474538409,1474538409),('/cms/cms-category-mapper/*',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-mapper/create',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category-mapper/delete',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category-mapper/index',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category-mapper/update',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category-mapper/view',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category-path/*',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-path/create',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-path/delete',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-path/index',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-path/update',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category-path/view',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-category/*',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/create',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/delete',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/index',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/repair',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/update',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-category/view',2,NULL,NULL,NULL,1474538410,1474538410),('/cms/cms-comment/*',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-comment/create',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-comment/delete',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-comment/index',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-comment/update',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-comment/view',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-field-option/*',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-option/create',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-option/delete',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-option/index',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field-option/update',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-option/view',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/*',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/create',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/delete',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/index',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/update',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field-value/view',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-field/*',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field/create',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field/delete',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field/index',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field/update',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-field/view',2,NULL,NULL,NULL,1474538411,1474538411),('/cms/cms-gallay/*',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-gallay/create',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-gallay/delete',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-gallay/index',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-gallay/update',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-gallay/view',2,NULL,NULL,NULL,1474538412,1474538412),('/cms/cms-item-fr/*',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item-fr/create',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item-fr/delete',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item-fr/index',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item-fr/update',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item-fr/view',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-item/*',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-item/create',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-item/delete',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-item/index',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-item/update',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-item/view',2,NULL,NULL,NULL,1462019405,1462019405),('/cms/cms-keyword/*',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-keyword/create',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-keyword/delete',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-keyword/index',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-keyword/update',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-keyword/view',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-layout/*',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-layout/create',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-layout/delete',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-layout/index',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-layout/update',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-layout/view',2,NULL,NULL,NULL,1474538413,1474538413),('/cms/cms-media/*',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-media/create',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-media/delete',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-media/index',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-media/update',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-media/view',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-menu-path/*',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu-path/create',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu-path/delete',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu-path/index',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu-path/update',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu-path/view',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu/*',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu/create',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-menu/delete',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu/index',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-menu/menu-list',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-menu/repair',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-menu/update',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-menu/view',2,NULL,NULL,NULL,1474538414,1474538414),('/cms/cms-path/*',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-path/create',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-path/delete',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-path/index',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-path/update',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-path/view',2,NULL,NULL,NULL,1474538415,1474538415),('/cms/cms-relation/*',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-relation/create',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-relation/delete',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-relation/index',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-relation/update',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-relation/view',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget-mapper/*',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget-mapper/create',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget-mapper/delete',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget-mapper/index',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget-mapper/update',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget-mapper/view',2,NULL,NULL,NULL,1474538417,1474538417),('/cms/cms-widget/*',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget/create',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget/delete',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget/index',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget/update',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/cms-widget/view',2,NULL,NULL,NULL,1474538416,1474538416),('/cms/default/*',2,NULL,NULL,NULL,1462019406,1462019406),('/cms/default/index',2,NULL,NULL,NULL,1462016463,1462016463),('/core/*',2,NULL,NULL,NULL,1470208893,1470208893),('/core/default/*',2,NULL,NULL,NULL,1470208893,1470208893),('/core/default/index',2,NULL,NULL,NULL,1470208893,1470208893),('/coupons/index',2,NULL,NULL,NULL,1485840296,1485840296),('/debug/*',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/*',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/db-explain',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/download-mail',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/index',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/toolbar',2,NULL,NULL,NULL,1462016403,1462016403),('/debug/default/view',2,NULL,NULL,NULL,1462016403,1462016403),('/emails/index',2,NULL,NULL,NULL,1482994546,1482994546),('/employe/*',2,NULL,NULL,NULL,1481625668,1481625668),('/employe/index',2,NULL,NULL,NULL,1481625660,1481625660),('/gii/*',2,NULL,NULL,NULL,1462016404,1462016404),('/gii/default/*',2,NULL,NULL,NULL,1462016404,1462016404),('/gii/default/action',2,NULL,NULL,NULL,1462016403,1462016403),('/gii/default/diff',2,NULL,NULL,NULL,1462016403,1462016403),('/gii/default/index',2,NULL,NULL,NULL,1462016403,1462016403),('/gii/default/preview',2,NULL,NULL,NULL,1462016403,1462016403),('/gii/default/view',2,NULL,NULL,NULL,1462016403,1462016403),('/gridview/*',2,NULL,NULL,NULL,1469520286,1469520286),('/gridview/export/*',2,NULL,NULL,NULL,1469520286,1469520286),('/gridview/export/download',2,NULL,NULL,NULL,1469520285,1469520285),('/job/*',2,NULL,NULL,NULL,1462016446,1462622782),('/job/default/*',2,NULL,NULL,NULL,1462016444,1462016444),('/job/default/index',2,NULL,NULL,NULL,1461924818,1461924818),('/job/job-category-fr/*',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-fr/create',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-fr/delete',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-fr/index',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-fr/update',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-fr/view',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-mapper/*',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-mapper/create',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-mapper/delete',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-mapper/index',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-mapper/update',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-mapper/view',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category-template-fr/*',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template-fr/create',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template-fr/delete',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template-fr/index',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template-fr/update',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template-fr/view',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template/*',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template/create',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template/delete',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template/index',2,NULL,NULL,NULL,1474538422,1474538422),('/job/job-category-template/update',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category-template/view',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-category/*',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category/create',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category/delete',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category/index',2,NULL,NULL,NULL,1462016444,1462016444),('/job/job-category/update',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-category/view',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-field-value/*',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field-value/create',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field-value/delete',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field-value/index',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field-value/update',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field-value/view',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field/*',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field/create',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field/delete',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field/index',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-field/update',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-field/view',2,NULL,NULL,NULL,1474538423,1474538423),('/job/job-item-fr/*',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-item-fr/create',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-item-fr/delete',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-item-fr/index',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-item-fr/update',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-item-fr/view',2,NULL,NULL,NULL,1474538424,1474538424),('/job/job-item/*',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-item/create',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-item/delete',2,NULL,NULL,NULL,1462016446,1462194525),('/job/job-item/index',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-item/update',2,NULL,'isAllow',NULL,1462016446,1471350033),('/job/job-item/view',2,NULL,NULL,NULL,1462016445,1462016445),('/job/job-msg-recipients/*',2,NULL,NULL,NULL,1462019405,1462019405),('/job/job-msg-recipients/create',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg-recipients/delete',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg-recipients/index',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg-recipients/update',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg-recipients/view',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/*',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/create',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/delete',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/index',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/update',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-msg/view',2,NULL,NULL,NULL,1462019404,1462019404),('/job/job-transaction/*',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-transaction/create',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-transaction/delete',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-transaction/index',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-transaction/update',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-transaction/view',2,NULL,NULL,NULL,1474538425,1474538425),('/job/job-user-mapper/*',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-user-mapper/create',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-user-mapper/delete',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-user-mapper/index',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-user-mapper/update',2,NULL,NULL,NULL,1462016446,1462016446),('/job/job-user-mapper/view',2,NULL,NULL,NULL,1462016446,1462016446),('/purchase/index',2,NULL,NULL,NULL,1482322962,1482322962),('/site/*',2,NULL,NULL,NULL,NULL,1462615166),('/site/change-password',2,NULL,NULL,NULL,1464152451,1464152451),('/site/employer-cover-page',2,NULL,NULL,NULL,1481283894,1481283894),('/site/error',2,NULL,NULL,NULL,NULL,NULL),('/site/index',2,NULL,NULL,NULL,1437385079,1437385079),('/site/language',2,NULL,NULL,NULL,1457429687,1457429687),('/site/login',2,NULL,NULL,NULL,NULL,NULL),('/site/logout',2,NULL,NULL,NULL,NULL,NULL),('/user/*',2,NULL,NULL,NULL,1462016403,1462616581),('/user/default/*',2,NULL,NULL,NULL,1462016401,1462623523),('/user/default/index',2,NULL,NULL,NULL,1462019406,1462623533),('/user/intern/*',2,NULL,NULL,NULL,1474538417,1474538417),('/user/intern/create',2,NULL,NULL,NULL,1474538417,1474538417),('/user/intern/delete',2,NULL,NULL,NULL,1474538417,1474538417),('/user/intern/index',2,NULL,NULL,NULL,1474538417,1474538417),('/user/intern/update',2,NULL,NULL,NULL,1474538417,1474538417),('/user/intern/view',2,NULL,NULL,NULL,1474538417,1474538417),('/user/job-owner/*',2,NULL,NULL,NULL,1474538418,1474538418),('/user/job-owner/create',2,NULL,NULL,NULL,1474538418,1474538418),('/user/job-owner/delete',2,NULL,NULL,NULL,1474538418,1474538418),('/user/job-owner/index',2,NULL,NULL,NULL,1474538417,1474538417),('/user/job-owner/update',2,NULL,NULL,NULL,1474538418,1474538418),('/user/job-owner/view',2,NULL,NULL,NULL,1474538417,1474538417),('/user/user-address/*',2,NULL,NULL,NULL,1462016401,1462612533),('/user/user-address/create',2,NULL,NULL,NULL,1462016401,1462612563),('/user/user-address/delete',2,NULL,NULL,NULL,1462016401,1462612597),('/user/user-address/index',2,NULL,NULL,NULL,1462016401,1462612626),('/user/user-address/update',2,NULL,NULL,NULL,1462016401,1462612668),('/user/user-address/view',2,NULL,NULL,NULL,1462016401,1462612696),('/user/user-company-images/*',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-images/create',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-images/delete',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-images/index',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-images/update',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-images/view',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company-msg-attachments/*',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-attachments/create',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-attachments/delete',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-attachments/index',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-attachments/update',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-attachments/view',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/*',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/create',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/delete',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/index',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/update',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg-recipients/view',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-company-msg/*',2,NULL,NULL,NULL,1469529015,1469529015),('/user/user-company-msg/create',2,NULL,NULL,NULL,1469531300,1469531300),('/user/user-company-msg/delete',2,NULL,NULL,NULL,1469530162,1469530162),('/user/user-company-msg/index',2,NULL,NULL,NULL,1469530139,1469530139),('/user/user-company-msg/update',2,NULL,NULL,NULL,1469530191,1469530191),('/user/user-company-msg/view',2,NULL,NULL,NULL,1469530149,1469530149),('/user/user-company/',2,NULL,NULL,NULL,1463115080,1463394779),('/user/user-company/*',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company/create',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company/delete',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company/index',2,NULL,NULL,NULL,1463395122,1463395122),('/user/user-company/update',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-company/view',2,NULL,NULL,NULL,1474538418,1474538418),('/user/user-msg-recipients/*',2,NULL,NULL,NULL,1465282399,1465282399),('/user/user-msg-recipients/create',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg-recipients/delete',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg-recipients/index',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg-recipients/update',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg-recipients/view',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg/*',2,NULL,NULL,NULL,1465282338,1465282338),('/user/user-msg/create',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg/delete',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg/index',2,NULL,NULL,NULL,1474538419,1474538419),('/user/user-msg/update',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-msg/view',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-news/',2,NULL,NULL,NULL,1463654739,1463654739),('/user/user-news/*',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-news/create',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-news/delete',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-news/index',2,NULL,NULL,NULL,1463656364,1463656364),('/user/user-news/update',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-news/view',2,NULL,NULL,NULL,1474538420,1474538420),('/user/user-notification-recipients/*',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification-recipients/create',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification-recipients/delete',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification-recipients/index',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification-recipients/update',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification-recipients/view',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/*',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/create',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/delete',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/index',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/update',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-notification/view',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-profile/*',2,NULL,NULL,NULL,1462016402,1462612727),('/user/user-profile/create',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user-profile/delete',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user-profile/index',2,NULL,NULL,NULL,1462016402,1462612784),('/user/user-profile/update',2,NULL,NULL,NULL,1462016402,1462612800),('/user/user-profile/view',2,NULL,NULL,NULL,1462016402,1462612822),('/user/user-social/*',2,NULL,NULL,NULL,1462016403,1462612849),('/user/user-social/create',2,NULL,NULL,NULL,1462016402,1462612886),('/user/user-social/delete',2,NULL,NULL,NULL,1462016403,1462612904),('/user/user-social/index',2,NULL,NULL,NULL,1462016402,1462612922),('/user/user-social/update',2,NULL,NULL,NULL,1462016403,1462612976),('/user/user-social/view',2,NULL,NULL,NULL,1462016402,1462612991),('/user/user-subscription-mapper/*',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription-mapper/create',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription-mapper/delete',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription-mapper/index',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription-mapper/update',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription-mapper/view',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription/*',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription/create',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription/delete',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription/index',2,NULL,NULL,NULL,1462166221,1462166221),('/user/user-subscription/update',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-subscription/view',2,NULL,NULL,NULL,1462166222,1462166222),('/user/user-transaction/*',2,NULL,NULL,NULL,1474538422,1474538422),('/user/user-transaction/create',2,NULL,NULL,NULL,1474538422,1474538422),('/user/user-transaction/delete',2,NULL,NULL,NULL,1474538422,1474538422),('/user/user-transaction/index',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user-transaction/update',2,NULL,NULL,NULL,1474538422,1474538422),('/user/user-transaction/view',2,NULL,NULL,NULL,1474538421,1474538421),('/user/user/*',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user/create',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user/delete',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user/index',2,NULL,NULL,NULL,1462016402,1462016402),('/user/user/update',2,NULL,NULL,NULL,1462016402,1463126376),('/user/user/view',2,NULL,NULL,NULL,1462016402,1462613056),('Admin',1,'admin can access all',NULL,NULL,1437375364,1437375364),('Guest',1,'Guest:  Without logged Users ',NULL,NULL,1456121757,1456121757),('Jobs',1,'Jobs',NULL,NULL,1462166383,1462166569),('System',1,'System can access every thing',NULL,NULL,1437382927,1437382927),('User',1,'User: General Logged Users',NULL,NULL,1456121692,1462616423);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('System','/*'),('Admin','/cms/*'),('Guest','/cms/cms-item/view'),('Admin','/job/*'),('Jobs','/job/*'),('Guest','/job/default/*'),('Guest','/job/default/index'),('User','/job/job-user-mapper/*'),('User','/job/job-user-mapper/create'),('Admin','/site/*'),('Guest','/site/*'),('Jobs','/site/*'),('Admin','/site/error'),('Guest','/site/error'),('Admin','/site/index'),('Guest','/site/index'),('Guest','/site/language'),('Admin','/site/login'),('Guest','/site/login'),('Admin','/site/logout'),('Admin','/user/*'),('Jobs','/user/*'),('Jobs','/user/user-company-msg/*'),('User','/user/user-company-msg/*'),('Jobs','/user/user-company-msg/create'),('User','/user/user-company-msg/create'),('Jobs','/user/user-company-msg/delete'),('User','/user/user-company-msg/delete'),('Jobs','/user/user-company-msg/index'),('User','/user/user-company-msg/index'),('Jobs','/user/user-company-msg/update'),('User','/user/user-company-msg/update'),('Jobs','/user/user-company-msg/view'),('User','/user/user-company-msg/view'),('Guest','/user/user-company/'),('Jobs','/user/user-company/'),('User','/user/user-company/'),('Guest','/user/user-company/index'),('Jobs','/user/user-company/index'),('User','/user/user-company/index'),('Jobs','/user/user-msg-recipients/*'),('User','/user/user-msg-recipients/*'),('Jobs','/user/user-msg/*'),('User','/user/user-msg/*'),('Guest','/user/user-news/'),('User','/user/user-news/'),('Guest','/user/user-news/index'),('User','/user/user-news/index'),('Jobs','/user/user-notification-recipients/*'),('User','/user/user-notification-recipients/*'),('Jobs','/user/user-notification/*'),('User','/user/user-notification/*'),('Guest','/user/user-profile/view'),('User','/user/user-profile/view'),('User','/user/user/index'),('User','/user/user/update'),('User','/user/user/view');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_menu`
--

DROP TABLE IF EXISTS `auth_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `auth_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_menu`
--

LOCK TABLES `auth_menu` WRITE;
/*!40000 ALTER TABLE `auth_menu` DISABLE KEYS */;
INSERT INTO `auth_menu` VALUES (18,'Gii',21,'/gii/default/index',5,NULL),(19,'Debug',21,'/debug/default/index',6,NULL),(21,'System',NULL,NULL,NULL,NULL),(31,'Admin',NULL,NULL,NULL,NULL),(36,'Jobs',21,'/job/job-item/index',NULL,NULL),(37,'Auth',21,'/auth/assignment/index',NULL,NULL),(38,'Cms',21,'/cms/cms-item/index',NULL,NULL),(39,'User',21,'/user/user/index',NULL,NULL),(40,'User',31,'/user/user/index',1,NULL),(41,'Cms',31,'/cms/cms-item/index',3,NULL),(42,'Jobs',31,'/job/job-item/index',2,NULL),(43,'Manage Employer Cover Page',21,'/employe/index',7,NULL),(46,'Manage Purchase Plan',21,'/purchase/index',8,NULL),(48,'Manage Automatic Emails',21,'/emails/index',9,NULL),(49,'Manage Coupon Codes',21,'/coupons/index',10,NULL);
/*!40000 ALTER TABLE `auth_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('isAllow','O:23:\"common\\rbac\\CustomeRule\":3:{s:4:\"name\";s:7:\"isAllow\";s:9:\"createdAt\";i:1471349866;s:9:\"updatedAt\";i:1471349866;}',1471349866,1471349866);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boardemail`
--

DROP TABLE IF EXISTS `boardemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boardemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardemail`
--

LOCK TABLES `boardemail` WRITE;
/*!40000 ALTER TABLE `boardemail` DISABLE KEYS */;
INSERT INTO `boardemail` VALUES (5,'Welcome on Board Email','<p>Hello ##NAME##,</p>\r\n\r\n<p>On behalf of everyone at KIOUI, we would like to welcome you to our team. It is always a delight to acquire motivated and professional individuals like yourself. We are proud to have you with us and I&rsquo;m sure you feel the same. Please familiarize yourself with its processes and inform us if you have any queries.</p>\r\n\r\n<p>Thanking you once again!</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team</p>\r\n',1,'2017-01-05');
/*!40000 ALTER TABLE `boardemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boardemail_fr`
--

DROP TABLE IF EXISTS `boardemail_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boardemail_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardemail_fr`
--

LOCK TABLES `boardemail_fr` WRITE;
/*!40000 ALTER TABLE `boardemail_fr` DISABLE KEYS */;
INSERT INTO `boardemail_fr` VALUES (5,'Welcome On Board-Template','<p>Bonjour ##NAME##</p>\r\n\r\n<p>Au nom de tous les membres de KIOUI, nous souhaitons vous souhaiter la bienvenue &agrave; notre &eacute;quipe. C&#39;est toujours un plaisir d&#39;acqu&eacute;rir des individus motiv&eacute;s et professionnels comme vous. Nous sommes fiers de vous avoir avec nous et je suis s&ucirc;r que vous sentez la m&ecirc;me chose. Veuillez vous familiariser avec ses processus et nous informer si vous avez des questions.</p>\r\n\r\n<p>Merci encore une fois!</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe &nbsp;KIOUI&nbsp;</p>\r\n',1,'2017-01-05');
/*!40000 ALTER TABLE `boardemail_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_mapper`
--

DROP TABLE IF EXISTS `cms_block_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_mapper` (
  `block_id` int(10) unsigned NOT NULL,
  `cms_id` int(10) unsigned NOT NULL,
  `order_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`block_id`,`cms_id`),
  KEY `cms_id` (`cms_id`),
  CONSTRAINT `cms_block_mapper_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_block_mapper_ibfk_2` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_mapper`
--

LOCK TABLES `cms_block_mapper` WRITE;
/*!40000 ALTER TABLE `cms_block_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_block_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `sort_order` int(11) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (1,NULL,'Pages','Pages',1,'2016-07-22 07:04:24',NULL),(2,1,'Cms Pages','Cms Pages',1,'2016-07-22 07:05:36',NULL);
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category_mapper`
--

DROP TABLE IF EXISTS `cms_category_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_mapper` (
  `cms_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cms_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cms_category_mapper_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_category_mapper_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_mapper`
--

LOCK TABLES `cms_category_mapper` WRITE;
/*!40000 ALTER TABLE `cms_category_mapper` DISABLE KEYS */;
INSERT INTO `cms_category_mapper` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `cms_category_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category_path`
--

DROP TABLE IF EXISTS `cms_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_path` (
  `category_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `cms_category_path_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_category_path_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_path`
--

LOCK TABLES `cms_category_path` WRITE;
/*!40000 ALTER TABLE `cms_category_path` DISABLE KEYS */;
INSERT INTO `cms_category_path` VALUES (1,1,0),(2,1,0),(2,2,1);
/*!40000 ALTER TABLE `cms_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comments`
--

DROP TABLE IF EXISTS `cms_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comments` (
  `review_id` int(10) unsigned NOT NULL,
  `email` varchar(64) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`email`),
  CONSTRAINT `cms_comments_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `cms_reviews` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comments`
--

LOCK TABLES `cms_comments` WRITE;
/*!40000 ALTER TABLE `cms_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_field`
--

DROP TABLE IF EXISTS `cms_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_field` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `section` enum('None','Summary','Requirements','Skills') DEFAULT 'None',
  `field` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('Text','TextArea','Radio','List','MultiList') DEFAULT 'Text',
  `order_by` int(10) unsigned DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cms_field_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_field`
--

LOCK TABLES `cms_field` WRITE;
/*!40000 ALTER TABLE `cms_field` DISABLE KEYS */;
INSERT INTO `cms_field` VALUES (1,NULL,'','title','Title','Text',1,1);
/*!40000 ALTER TABLE `cms_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_field_option`
--

DROP TABLE IF EXISTS `cms_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_field_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `cms_field_option_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `cms_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_field_option`
--

LOCK TABLES `cms_field_option` WRITE;
/*!40000 ALTER TABLE `cms_field_option` DISABLE KEYS */;
INSERT INTO `cms_field_option` VALUES (1,1,'Title','');
/*!40000 ALTER TABLE `cms_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_field_value`
--

DROP TABLE IF EXISTS `cms_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_field_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cms_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `value` varchar(250) NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `job_id` (`cms_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `cms_field_value_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_field_value_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `cms_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_field_value`
--

LOCK TABLES `cms_field_value` WRITE;
/*!40000 ALTER TABLE `cms_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_gallay`
--

DROP TABLE IF EXISTS `cms_gallay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_gallay` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cms_id` int(10) unsigned NOT NULL,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `cms_id` (`cms_id`),
  CONSTRAINT `cms_gallay_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_gallay`
--

LOCK TABLES `cms_gallay` WRITE;
/*!40000 ALTER TABLE `cms_gallay` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_gallay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_item`
--

DROP TABLE IF EXISTS `cms_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `layout_id` int(10) unsigned DEFAULT '1',
  `slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `external_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `restricted` tinyint(3) unsigned DEFAULT '0',
  `status` smallint(3) DEFAULT '0',
  `meta_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` datetime DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`),
  KEY `layout` (`layout_id`),
  CONSTRAINT `cms_item_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_item_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `cms_layout` (`layout_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_item`
--

LOCK TABLES `cms_item` WRITE;
/*!40000 ALTER TABLE `cms_item` DISABLE KEYS */;
INSERT INTO `cms_item` VALUES (1,NULL,1,'about-us','','About Us','<p>About Us</p>\r\n',0,1,'About Us','About Us','About Us',NULL,'2016-07-22 10:55:55'),(2,NULL,1,'terms-and-condition','','Terms and Condition','<p>Terms and Condition</p>\r\n',0,1,'Terms and Condition','Terms and Condition','Terms and Condition',NULL,'2016-07-22 11:21:22'),(6,NULL,1,'faqs','','Faqs','faqs',0,1,'faqs','faqs','faqs',NULL,'2016-08-04 05:25:21'),(7,NULL,1,'privacy-policy','','Privacy Policy','<p>Privacy Policy</p>\r\n',0,1,'Privacy Policy','Privacy Policy','Privacy Policy',NULL,'2016-08-04 05:29:16'),(8,NULL,1,'sitemap','','Sitemap','<p>Sitemap</p>\r\n',0,1,'Sitemap','Sitemap','Sitemap',NULL,'2016-08-04 05:29:54'),(9,NULL,1,'how-to-apply','','How to Apply','<p><a href=\"http://jobs.dev/how-to-apply\">How to Apply</a></p>\r\n',0,1,'How to Apply','How to Apply','How to Apply',NULL,'2016-08-04 05:30:33');
/*!40000 ALTER TABLE `cms_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_item_fr`
--

DROP TABLE IF EXISTS `cms_item_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_item_fr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  CONSTRAINT `cms_item_fr_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_item_fr`
--

LOCK TABLES `cms_item_fr` WRITE;
/*!40000 ALTER TABLE `cms_item_fr` DISABLE KEYS */;
INSERT INTO `cms_item_fr` VALUES (1,'About Us ','<p>About Us</p>\r\n','About Us ','About Us ','About Us '),(2,'Terms and Condition','<p>Terms and Condition</p>\r\n','Terms and Condition','Terms and Condition','Terms and Condition'),(6,'faqs','faqs','faqs','faqs','faqs'),(7,'Privacy Policy','<p>Privacy Policy</p>\r\n','Privacy Policy','Privacy Policy','Privacy Policy'),(8,'Sitemap','<p>Sitemap</p>\r\n','Sitemap','Sitemap','Sitemap'),(9,'How to Apply','<p><a href=\"http://jobs.dev/how-to-apply\">How to Apply</a></p>\n','How to Apply','How to Apply','How to Apply');
/*!40000 ALTER TABLE `cms_item_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_keyword`
--

DROP TABLE IF EXISTS `cms_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_keyword`
--

LOCK TABLES `cms_keyword` WRITE;
/*!40000 ALTER TABLE `cms_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_layout`
--

DROP TABLE IF EXISTS `cms_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_layout` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_layout`
--

LOCK TABLES `cms_layout` WRITE;
/*!40000 ALTER TABLE `cms_layout` DISABLE KEYS */;
INSERT INTO `cms_layout` VALUES (1,'1 column'),(2,'2 column'),(3,'3 column');
/*!40000 ALTER TABLE `cms_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_media`
--

DROP TABLE IF EXISTS `cms_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_media` (
  `media_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cms_id` int(10) unsigned NOT NULL,
  `file` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`media_id`),
  KEY `cms_id` (`cms_id`),
  CONSTRAINT `cms_media_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_media`
--

LOCK TABLES `cms_media` WRITE;
/*!40000 ALTER TABLE `cms_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`menu_id`),
  KEY `parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu`
--

LOCK TABLES `cms_menu` WRITE;
/*!40000 ALTER TABLE `cms_menu` DISABLE KEYS */;
INSERT INTO `cms_menu` VALUES (1,'Header',NULL,'',0,''),(2,'Home',1,'/',1,''),(3,'About Us',1,'about-us',2,''),(4,'School',1,'/user/user-school/school',3,''),(5,'All Jobs',1,'/job/job-item',4,''),(6,'Contact',1,'/site/contact',5,'');
/*!40000 ALTER TABLE `cms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menu_path`
--

DROP TABLE IF EXISTS `cms_menu_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu_path` (
  `menu_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `cms_menu_path_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `cms_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_menu_path_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `cms_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu_path`
--

LOCK TABLES `cms_menu_path` WRITE;
/*!40000 ALTER TABLE `cms_menu_path` DISABLE KEYS */;
INSERT INTO `cms_menu_path` VALUES (1,1,0),(2,1,0),(2,2,1),(3,1,0),(3,3,1),(4,1,0),(4,4,1),(5,1,0),(5,5,1),(6,1,0),(6,6,1);
/*!40000 ALTER TABLE `cms_menu_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_path`
--

DROP TABLE IF EXISTS `cms_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_path` (
  `cms_id` int(10) unsigned NOT NULL,
  `path_id` int(10) unsigned NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`cms_id`,`path_id`),
  KEY `path_id` (`path_id`),
  CONSTRAINT `cms_path_ibfk_3` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_path_ibfk_4` FOREIGN KEY (`path_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_path`
--

LOCK TABLES `cms_path` WRITE;
/*!40000 ALTER TABLE `cms_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ratting`
--

DROP TABLE IF EXISTS `cms_ratting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ratting` (
  `cms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ratting` varchar(250) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cms_id`),
  CONSTRAINT `cms_ratting_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ratting`
--

LOCK TABLES `cms_ratting` WRITE;
/*!40000 ALTER TABLE `cms_ratting` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ratting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_relation`
--

DROP TABLE IF EXISTS `cms_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_relation` (
  `cms_id` int(10) unsigned NOT NULL,
  `keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cms_id`,`keyword_id`),
  KEY `cms_keyword_id` (`keyword_id`),
  CONSTRAINT `cms_relation_ibfk_3` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_relation_ibfk_4` FOREIGN KEY (`keyword_id`) REFERENCES `cms_keyword` (`keyword_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_relation`
--

LOCK TABLES `cms_relation` WRITE;
/*!40000 ALTER TABLE `cms_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_reviews`
--

DROP TABLE IF EXISTS `cms_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_reviews` (
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cms_id` int(10) unsigned NOT NULL,
  `email` varchar(64) NOT NULL,
  `ratting` varchar(64) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `cms_id` (`cms_id`),
  KEY `user_id` (`email`),
  CONSTRAINT `cms_reviews_ibfk_1` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_reviews`
--

LOCK TABLES `cms_reviews` WRITE;
/*!40000 ALTER TABLE `cms_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_widget`
--

DROP TABLE IF EXISTS `cms_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `widget` varchar(250) NOT NULL,
  `data` text,
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_widget`
--

LOCK TABLES `cms_widget` WRITE;
/*!40000 ALTER TABLE `cms_widget` DISABLE KEYS */;
INSERT INTO `cms_widget` VALUES (1,'Feature List ',NULL);
/*!40000 ALTER TABLE `cms_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_widget_mapper`
--

DROP TABLE IF EXISTS `cms_widget_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_widget_mapper` (
  `widget_id` int(10) unsigned NOT NULL,
  `cms_id` int(10) unsigned NOT NULL,
  `order_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`widget_id`,`cms_id`),
  KEY `cms_id` (`cms_id`),
  CONSTRAINT `cms_widget_mapper_ibfk_1` FOREIGN KEY (`widget_id`) REFERENCES `cms_widget` (`widget_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_widget_mapper_ibfk_2` FOREIGN KEY (`cms_id`) REFERENCES `cms_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_widget_mapper`
--

LOCK TABLES `cms_widget_mapper` WRITE;
/*!40000 ALTER TABLE `cms_widget_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_widget_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_social_network`
--

DROP TABLE IF EXISTS `core_social_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_social_network` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network` varchar(200) NOT NULL,
  `icons` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 = Active, 2 = Deactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_social_network`
--

LOCK TABLES `core_social_network` WRITE;
/*!40000 ALTER TABLE `core_social_network` DISABLE KEYS */;
INSERT INTO `core_social_network` VALUES (1,'Facebook','f/b/1/fb1.jpeg','f/b/2/fb2.jpg','f/b/3/fb3.jpeg',1),(2,'Twitters','t/w/1/tw1.jpeg','t/w/2/tw2.jpeg','t/w/3/tw3.jpeg',1),(3,'LinkedIn','l/i/n/k/d/i/n/linkdin.png','l/i/n/k/d/i/n/-/linkdin-2.jpeg','l/i/n/k/d/i/n/-/linkdin-icon.jpeg',1);
/*!40000 ALTER TABLE `core_social_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_on` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'QWERTMNBV',1,'2017-02-14 04:10:08'),(3,'AWSDERFGP',1,'2017-01-31 07:52:19'),(4,'KIOUI60',1,'2017-04-02 23:53:37');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe_cover_page`
--

DROP TABLE IF EXISTS `employe_cover_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe_cover_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `single_job_post` varchar(500) NOT NULL,
  `banner_content` text NOT NULL,
  `employe_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe_cover_page`
--

LOCK TABLES `employe_cover_page` WRITE;
/*!40000 ALTER TABLE `employe_cover_page` DISABLE KEYS */;
INSERT INTO `employe_cover_page` VALUES (7,'','<h1>Student Recruiting Tool</h1>\r\n\r\n<p>Kioui provides worthy apprentices when they are needed.</p>\r\n','<h1>Interested in speaking with one of our<br />\r\nfriendly internship coordinator?</h1>\r\n\r\n<p>Fill this short out. We&rsquo;ll gladly help you out!</p>\r\n');
/*!40000 ALTER TABLE `employe_cover_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe_cover_page_fr`
--

DROP TABLE IF EXISTS `employe_cover_page_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe_cover_page_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `single_job_post` varchar(500) NOT NULL,
  `banner_content` text NOT NULL,
  `employe_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe_cover_page_fr`
--

LOCK TABLES `employe_cover_page_fr` WRITE;
/*!40000 ALTER TABLE `employe_cover_page_fr` DISABLE KEYS */;
INSERT INTO `employe_cover_page_fr` VALUES (7,'','<h1>Recrutement &Eacute;tudiant</h1>\r\n\r\n<p>Kioui fournit des apprentis compet&egrave;nts\r\nlorsqu&#39;ils sont requis.</p>\r\n','<h1>Vous souhaitez discuter avec un de nos<br />\r\ncoordonnateurs de stages?</h1>\r\n\r\n<p>Nous nous ferons un plaisir de vous aider!</p>\r\n');
/*!40000 ALTER TABLE `employe_cover_page_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (1,'Accounting','<p>Accounting</p>\r\n',1,'2016-07-12 07:01:49','2016-07-12 00:00:00'),(2,'Administrative','<p>Administrative</p>\r\n',1,'2016-07-12 07:02:05','2016-07-12 00:00:00'),(3,'Construction','<p>Construction</p>\r\n',1,'2016-07-12 07:02:18','2016-07-12 00:00:00'),(4,'Corporate Training','<p>Corporate Training</p>\r\n',1,'2016-07-12 07:02:32','2016-07-12 00:00:00'),(5,'Customer Service','<p>Customer Service</p>\r\n',1,'2016-07-12 07:02:43','2016-07-12 00:00:00'),(6,'Design','<p>Design</p>\r\n',1,'2016-07-12 07:02:54','2016-07-12 00:00:00'),(7,'Educator & Education','<p>Educator &amp; Education</p>\r\n',1,'2016-07-12 07:03:33','2016-07-12 00:00:00'),(8,'Engineering','<p>Engineering</p>\r\n',1,'2016-07-12 07:03:41','2016-07-12 00:00:00'),(9,'Facilities','<p>Facilities</p>\r\n',1,'2016-07-12 07:03:51','2016-07-12 00:00:00'),(10,'Finance','<p>Finance</p>\r\n',1,'2016-07-12 07:03:59','2016-07-12 00:00:00'),(11,'Healthcare','<p>Healthcare</p>\r\n',1,'2016-07-12 07:04:07','2016-07-12 00:00:00'),(12,'Hospitality','<p>Hospitality</p>\r\n',1,'2016-07-12 07:04:17','2016-07-12 00:00:00'),(13,'Human Resources (HR)','<p>Human Resources (HR)</p>\r\n',1,'2016-07-12 07:04:26','2016-07-12 00:00:00'),(14,'Information Technology (IT)','<p>Information Technology (IT)</p>\r\n',1,'2016-07-12 07:04:36','2016-07-12 00:00:00'),(15,'Law Enforcement / Security','<p>Law Enforcement / Security</p>\r\n',1,'2016-07-12 07:04:44','2016-07-12 00:00:00'),(16,'Legal','<p>Legal</p>\r\n',1,'2016-07-12 07:04:52','2016-07-12 00:00:00'),(17,'Logistics','<p>Logistics</p>\r\n',1,'2016-07-12 07:05:00','2016-07-12 00:00:00'),(18,'Marketing','<p>Marketing</p>\r\n',1,'2016-07-12 07:05:10','2016-07-12 00:00:00'),(19,'Media','<p>Media</p>\r\n',1,'2016-07-12 07:06:11','2016-07-12 00:00:00'),(20,'Pharmaceuticals','<p>Pharmaceuticals</p>\r\n',1,'2016-07-12 07:06:28','2016-07-12 00:00:00'),(21,'Production','<p>Production</p>\r\n',1,'2016-07-12 07:06:37','2016-07-12 00:00:00'),(22,'Public Relations (PR)','<p>Public Relations (PR)</p>\r\n',1,'2016-07-12 07:06:48','2016-07-12 00:00:00'),(23,'Real Estate','<p>Real Estate</p>\r\n',1,'2016-07-12 07:06:57','2016-07-12 00:00:00'),(24,'Retail','<p>Retail</p>\r\n',1,'2016-08-17 09:40:30','2016-08-17 00:00:00'),(25,'Sales','<p>Sales</p>\r\n',1,'2016-08-17 09:40:43','2016-08-17 00:00:00'),(26,'Travel & Tourism','<p>Travel &amp; Tourism</p>\r\n',1,'2016-08-17 09:41:04','2016-08-17 00:00:00');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category_fr`
--

DROP TABLE IF EXISTS `job_category_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category_fr` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  CONSTRAINT `job_category_fr_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category_fr`
--

LOCK TABLES `job_category_fr` WRITE;
/*!40000 ALTER TABLE `job_category_fr` DISABLE KEYS */;
INSERT INTO `job_category_fr` VALUES (1,'Comptabilité','<p>Comptabilit&eacute;</p>\r\n',1),(2,'Administratif','<p>Administratif</p>\r\n',1),(3,'Construction','<p>Construction</p>\r\n',1),(5,'Formation en entreprise','<p>Formation en entreprise</p>\r\n',1),(6,'Service Clients','<p>DesignService Clients</p>\r\n',1),(7,'Conception','<p>Conception</p>\r\n',1),(8,'Éducateur et éducation','<p>&Eacute;ducateur et &eacute;ducation</p>\r\n',1),(9,'Ingénierie','<p>Ing&eacute;nierie</p>\r\n',1),(10,'La finance','<p>La finance\r\n</p>\r\n',1),(11,'Soins de santé','<p>Soins de santé\r\n</p>\r\n',1),(12,'Ressources humaines (RH)','<p>Ressources humaines (RH)</p>\r\n',1),(13,'Technologie de l\'information (TI)','<p>Technologie de l\'information (TI)\r\n</p>\r\n',1),(14,'Application de la loi / Sécurité','<p>Application de la loi / Sécurité\r\n</p>\r\n',1),(15,'Légal','<p>Légal</p>\r\n',1),(16,'Logistique','<p>Logistique</p>\r\n',1),(17,'Commercialisation','<p>Commercialisation</p>\r\n',1),(18,'Médias','<p>Médias</p>\r\n',1),(19,'Médicaments','<p>M&eacute;dicaments</p>\r\n',1),(20,' Relations publiques (RP)','<p>\r\nRelations publiques (RP)</p>\r\n',1),(21,'Immobilier','<p>Immobilier</p>\r\n',1),(22,'Vente au détail','<p>Vente au détail\r\n</p>\r\n',1),(23,'Ventes','<p>Ventes</p>\r\n',1),(24,'Voyage & Tourisme','<p>Voyage & Tourisme</p>\r\n',1);
/*!40000 ALTER TABLE `job_category_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category_mapper`
--

DROP TABLE IF EXISTS `job_category_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category_mapper` (
  `job_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`job_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_category_mapper_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_category_mapper_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category_mapper`
--

LOCK TABLES `job_category_mapper` WRITE;
/*!40000 ALTER TABLE `job_category_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_category_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category_template`
--

DROP TABLE IF EXISTS `job_category_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category_template` (
  `category_id` int(10) unsigned NOT NULL,
  `requirement` text,
  `requirement_status` tinyint(1) NOT NULL,
  `requirement1` text,
  `requirement1_status` tinyint(1) NOT NULL,
  `requirement2` text,
  `requirement2_status` tinyint(1) NOT NULL,
  `responsibility` text,
  `responsibility_status` tinyint(1) NOT NULL,
  `responsibility1` text,
  `responsibility1_status` tinyint(1) NOT NULL,
  `responsibility2` text,
  `responsibility2_status` tinyint(1) NOT NULL,
  `description` text,
  `description_status` tinyint(1) NOT NULL,
  `description1` text,
  `description1_status` tinyint(1) NOT NULL,
  `description2` text,
  `description2_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_category_template_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category_template`
--

LOCK TABLES `job_category_template` WRITE;
/*!40000 ALTER TABLE `job_category_template` DISABLE KEYS */;
INSERT INTO `job_category_template` VALUES (1,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Certified Public Accountant certification.</li>\r\n</ul>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n',0,'<p>As an Accounting Intern, it is your duty to work under the supervision of the director to assist the accounting department. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Shadow an Accounting professional to learn how to accurately perform tasks such as balancing the books an completing tax returns.</li>\r\n	<li>Assist with month end returns</li>\r\n	<li>Post journal entries</li>\r\n	<li>Assist with accounts receivable and payable</li>\r\n	<li>Data entry</li>\r\n	<li>Assist with credit accounts</li>\r\n</ul>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n',0,'<p>Accountants&nbsp;work all year round in all facets of the finance of a company. They help their clients create a financial plan and implement changes to help meet the goals therein. As a Accounting intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum4kkk.</p>\r\n',0),(2,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Computer skills</li>\r\n	<li>Internet research skills</li>\r\n	<li>Flexibility</li>\r\n	<li>Excellent written and communication skills</li>\r\n	<li>Ability to multitask</li>\r\n</ul>\r\n',1,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Computer skills</li>\r\n	<li>Internet research skills</li>\r\n	<li>Flexibility</li>\r\n	<li>Excellent written and communication skills</li>\r\n	<li>Ability to multitask</li>\r\n</ul>\r\n',0,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Computer skills</li>\r\n	<li>Internet research skills</li>\r\n	<li>Flexibility</li>\r\n	<li>Excellent written and communication skills</li>\r\n	<li>Ability to multitask</li>\r\n</ul>\r\n',0,'<p>As an Administrative Intern, it is your duty to work under the supervision of the manager and office staff to manage the clients and their accounts. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Shadow the administrative manager to learn the responsibilities of this position</li>\r\n	<li>Answer incoming phone calls</li>\r\n	<li>Schedule meetings and events</li>\r\n	<li>Making travel arrangements</li>\r\n	<li>Managing financial data</li>\r\n	<li>Project coordination</li>\r\n</ul>\r\n',1,'<p>As an Administrative Intern, it is your duty to work under the supervision of the manager and office staff to manage the clients and their accounts. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Shadow the administrative manager to learn the responsibilities of this position</li>\r\n	<li>Answer incoming phone calls</li>\r\n	<li>Schedule meetings and events</li>\r\n	<li>Making travel arrangements</li>\r\n	<li>Managing financial data</li>\r\n	<li>Project coordination</li>\r\n</ul>\r\n',0,'<p>As an Administrative Intern, it is your duty to work under the supervision of the manager and office staff to manage the clients and their accounts. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Shadow the administrative manager to learn the responsibilities of this position</li>\r\n	<li>Answer incoming phone calls</li>\r\n	<li>Schedule meetings and events</li>\r\n	<li>Making travel arrangements</li>\r\n	<li>Managing financial data</li>\r\n	<li>Project coordination</li>\r\n</ul>\r\n',0,'<p>The Administrative team&nbsp;&nbsp;is the backbone for any office. These professionals are responsible for keeping things organized and running the day to day operations. As an Administrative Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',1,'<p>The Administrative team is the backbone for any office. These professionals are responsible for keeping things organized and running the day to day operations. As an Administrative Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'<p>The Administrative team is the backbone for any office. These professionals are responsible for keeping things organized and running the day to day operations. As an Administrative Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0),(3,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Attention to detail</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>As a Construction Intern, it is your duty to work under the supervision of the construction site manager to maintain a safe workplace and learn how to perform essential job functions. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Assist in building commercial and residential structures</li>\r\n	<li>Assist with land clearing</li>\r\n	<li>Assist with demolition of existing structures</li>\r\n	<li>Mix concrete</li>\r\n	<li>Assist with maintaining machinery needed for construction</li>\r\n	<li>Learn how to use the various tools associated with this role</li>\r\n	<li>Learn to read blueprints and designs</li>\r\n	<li>Assist with removal of debris, hazardous material, and other waste from the work site</li>\r\n	<li>Assist with surveying the site</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>Construction professionals are responsible for preparing a work site so that buildings and other structures can be erected. They clear the land and build both residential and commercial structures for clients. As a Construction Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n\r\n<p>&nbsp;</p>\r\n',0,'',0,'',1),(4,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Detail oriented</li>\r\n	<li>Be able to work with minimal supervision</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n	<li>Have an understanding of the various technologies associated with education</li>\r\n	<li>Work to achieve the goals and standards of the company</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>As a Corporate Training Intern, it is your duty to work under the supervision of the training team to provide support to the employees. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with assessing the students to determine their skill level</li>\r\n	<li>Assist planning and organizing of classroom activities</li>\r\n	<li>Assist with creating educational material to reinforce ideas learned</li>\r\n	<li>Assist with classroom instruction</li>\r\n	<li>Assist with providing constructive feedback to students</li>\r\n	<li>Assist with providing an accurate record of student progress</li>\r\n	<li>Assist with the building of a learning conducive environment</li>\r\n	<li>Provide students with a range of learning materials</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>Corporate Training professionals work with companies to provide education and support to employees. These individuals work to train new hires and teach new skills to existing employees. As a Corporate Training Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'<p>This is job descritptions #2.</p>\r\n',0,'<p>This is Job Description #3.</p>\r\n',0),(5,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Strong written and verbal communication skills</li>\r\n\r\n<li>Ability to effectively listen and empathize with the consumer</li>\r\n\r\n<li>Be able to multi-task</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Customer Service Intern, it is your duty to work under the supervision of the customer support manager to assist each customer. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage large amounts of phone calls</li>\r\n\r\n<li>Generate sales</li>\r\n\r\n<li>Use effective listen to determine the customers issue</li>\r\n\r\n<li>Provide the customer with the correct information</li>\r\n\r\n<li>Build rapport with the customer to build relationships</li>\r\n\r\n<li>Ensure that you are meeting the goals communicated by the manager</li>\r\n\r\n<li>Provide products support to resolve issues</li>\r\n\r\n<li>Take accurate notes to provide an accurate record of each call</li>\r\n\r\n<li>Work within the standards set by the company</li>\r\n\r\n<li>Exceed the customer&#39;s expectations</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Customer Service professionals provide products and support to customers on behalf of the client. They must maintain a high standard to provide quality service. As a Customer Service Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(6,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Have excellent written and verbal communication skills</li>\r\n	<li>Be able to meet a deadline</li>\r\n</ul>\r\n',1,'',0,'',1,'<p>As a Design Intern, it is your duty to work under the supervision of the design manager. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist the design manager with communicating with the client to get an understanding of the design</li>\r\n	<li>Use the various software and hardware to create designs and prototypes</li>\r\n	<li>Collaborate with teams members to get work completed on time</li>\r\n</ul>\r\n',1,'',0,'',1,'<p>Design professionals work to turn an into a visual rendering to assist in construction of the piece. They work closely with clients to bring ideas to life. As a Design Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',1,'',0,'',1),(7,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Ability to work well with a team</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Have an understanding of the various technologies associated with education</li>\r\n\r\n<li>Adhere to the local and state standards</li>\r\n\r\n<li>Work to achieve the goals and standards of the school</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Educator &amp; Education Intern, it is your duty to work under the supervision of the teacher to manage the classroom and teach the students. This can include the following tasks:</p>\r\n<ul>\r\n\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with assessing the students to determine their skill level</li>\r\n\r\n<li>Assist planning and organizing of classroom activities</li>\r\n\r\n<li>Assist with creating educational material to reinforce ideas learned</li>\r\n\r\n<li>Assist with classroom instruction</li>\r\n\r\n<li>Assist with providing constructive feedback to students</li>\r\n\r\n<li>Assist with providing an accurate record of student progress</li>\r\n\r\n<li>Assist with the building of a learning conducive environment</li>\r\n\r\n<li>Maintain the disciplinary standards of the classroom and the school</li>\r\n\r\n<li>Provide students with a range of learning materials</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Education professionals work with students of all ages and abilities to teach them the skills they need to succeed. These individuals work in many capacities to manage the classroom and educate the students. As an Educator &amp; Education Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(8,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n	<li>Able to meet deadlines</li>\r\n</ul>\r\n',1,'',1,'',1,'<p>As an Engineering Intern, it is your duty to work under the supervision of the project manager to complete the project. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with modifying product design</li>\r\n	<li>Assist with developing blueprints and rendering of products and systems</li>\r\n	<li>Create prototypes for the client</li>\r\n	<li>Assist with performing calculations to get accurate dimensions</li>\r\n	<li>Assist with categorizing and identifying parts</li>\r\n	<li>Create instructions on building and proper use of products for the customer</li>\r\n</ul>\r\n',1,'',1,'',1,'<p>Engineering professionals work to research and implement systems of all kinds. These individuals work in a variety of capacities to create blueprints and realize the design as a viable product. As an Engineering Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',1,'',1,'',1),(9,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Attention to detail</li>\r\n	<li>High school diploma or equivalent</li>\r\n</ul>\r\n',0,'',1,'',1,'<p>As a Facilities Intern, it is your duty to work under the supervision of the manager to maintain the facilities. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Ensure buildings and structures are well maintained</li>\r\n	<li>Provide cleaning services</li>\r\n	<li>Oversee catering and ensure vending machines are well stocked and maintained</li>\r\n	<li>Ensure the overall health and safety of employees</li>\r\n	<li>Hire and manage contractors</li>\r\n	<li>Create and maintain communication systems</li>\r\n	<li>Provide secure facilities for the employees</li>\r\n	<li>Offer space management services to provide an organized work space</li>\r\n	<li>Reduce operating costs by keeping equipment and facilities well maintained</li>\r\n</ul>\r\n',0,'',1,'',1,'<p>A Facilities professionals ensure that the workplace is safe and clean. These individuals work in many different capacities to maintain the company property and make any necessary repairs to equipment. As a Facilities Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',1,'',1),(10,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Certified Public Accountant certification</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Finance Intern, it is your duty to work under the supervision of the finance manager to implement and carry out the goals of the finance department. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Shadow the finance manager to learn the duties and responsibilities of this role</li>\r\n\r\n<li>Create payment plans</li>\r\n\r\n<li>Assist with implementing new finance systems</li>\r\n\r\n<li>Assist with creating journal entries</li>\r\n\r\n<li>Assist with creating monthly statements</li>\r\n\r\n<li>Assist with accounts receivable and payable</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>The Finance professionals are responsible for accurately reporting and monitoring the finances of a company. They ensure that accounts are reconciled and all expenses are managed properly. As a Finance Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(11,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Effective listening and empathy</li>\r\n\r\n<li>Able to work well with a team</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Ability to work fast and effectively in an emergency situation</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Healthcare Intern, it is your duty to work under the supervision of the healthcare provider to give patient the best care. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Actively listen and empathize with patient to assess their needs</li>\r\n\r\n<li>Assist with coming up with a course of treatment for the patient</li>\r\n\r\n<li>Assist with prescribing and administering medication to the patient</li>\r\n\r\n<li>Be able to quickly assess and diagnose a patient</li>\r\n\r\n<li>Keep accurate records of patient progress</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Healthcare professionals work in different capacities to provide care to patients. These individuals must effectively listen to the patient to determine the best course of treatment. As a Healthcare Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(12,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Ability to work under pressure</li>\r\n\r\n<li>Actively listen to the guest to exceed their expectations</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Hospitality Intern, it is your duty to work under the supervision of the client to provide them with the best experience. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Attend to bar patrons</li>\r\n\r\n<li>Create and serve food to the clients</li>\r\n\r\n<li>Recommend travel and leisure time activities to the guests</li>\r\n\r\n<li>Arrange transportation for guests</li>\r\n\r\n<li>Organize meetings and events</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Hospitality professionals work in many different capacities to provide clients with the best possible experience. They work in motels, on ships, and in RV parks and campgrounds to provide each guest with a pleasant stay. As a Hospitality Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(13,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Human Resources (HR) Intern, it is your duty to work under the supervision of the company to provide support to the employees. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with maintaining job titles and descriptions</li>\r\n\r\n<li>Assist with interviewing new hires, properly training new employees, and placing them in the appropriate roles</li>\r\n\r\n<li>Assist with supporting the company by giving promotions to the right employees</li>\r\n\r\n<li>Assist with evaluating employees to determine their job effectiveness and ability to complete their duties</li>\r\n\r\n<li>Keep accurate records for all employees</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>The Human Resources (HR) professionals are responsible for being the liaison between the employee and the employer. These individuals support the staff, making sure the needs of both the company and they employee are met. As a Human Resources (HR) Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(14,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Independent worker</li>\r\n\r\n<li>Ability to work well with a team</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Intern, it is your duty to work under the supervision of the IT manager to learn how to properly maintain and install necessary systems. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Respond to requests for support</li>\r\n\r\n<li>Assist with minor repairs</li>\r\n\r\n<li>Monitor systems and report any errors to the IT manager</li>\r\n\r\n<li>Assist in the installation of hardware and software</li>\r\n\r\n<li>Assist with maintenance and upgrades to the network</li>\r\n\r\n<li>Assist with updating technical documents</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Information Technology (IT) professionals are responsible for installing and maintaining the systems necessary for an office to run efficiently. This department works to install hardware, maintain database, and provide technical support to other staff members. As an Information Technology (IT) Intern Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(15,'<ul><li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Good written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Good observation skills</li>\r\n\r\n<li>Be available the days and times needed by the law enforcement department</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Law Enforcement/Security professionals that are employed by the state usually work under the department of safety or through a state bureau. Professionals that work on a local level are employed either as a city cop or a Sheriff at the county level. This experience will introduce you to different specialties and provide you with valuable experience in the field of Law Enforcement/Security.</p>\r\n\r\n<ul>\r\n\r\n<li>As a Law Enforcement/Security Intern, it is your duty to work under the supervision of the director to assist the criminal investigation unit. This can include the following tasks:</li>\r\n\r\n\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Complete investigate assignments</li>\r\n\r\n<li>Work with the professionals to learn and apply the techniques used to patrol the community and uphold law and order.</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Law Enforcement/Security professionals protect civilians as well as their property and work to enforce the laws in the community they serve. Job titles in this industry include officers, sheriff, game warden, criminal investigator, and special agent. As a Law Enforcement/Security intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(16,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Uphold the standards and practices of the governing state board</li>\r\n\r\n<li>Keep client confidentiality</li>\r\n\r\n<li>Maintain integrity and responsibility at all times</li>\r\n\r\n<li>Good judge and ability to analyze situations</li>\r\n\r\n<li>Ability to mount a legal defense and properly represent a client</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Legal Intern, it is your duty to work under the supervision of the company to best represent clients. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist in providing accurate and timely legal services to clients</li>\r\n\r\n<li>Assist with providing a good defense for clients</li>\r\n\r\n<li>Assist with creating policies and enforcing regulations</li>\r\n\r\n<li>Assist with offering proactive advice and risk management techniques</li>\r\n\r\n<li>Assist with communicating and negotiating with other counsel and other entities</li>\r\n\r\n<li>Accurately create contracts and other legal documents</li>\r\n\r\n<li>Handle complex matters for clients</li>\r\n\r\n<li>Provide clients with an explanation of legal language so they understand documents</li>\r\n\r\n<li>Stay up to date on local and state laws as they pertain to clients</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Legal professionals work in many different capacities to provide legal services to companies and clients. These individuals prosecute criminals, defend clients in legal matters, and provide a wealth of legal services to the public and corporations. As a Legal Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(17,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Proficient with logistics software</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Logistics Intern, it is your duty to work under the supervision of the company to move products to their destination. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with the storage, transportation, and delivery of goods and services</li>\r\n\r\n<li>Assist with the creation and management of ongoing orders</li>\r\n\r\n<li>Assist with the communication with consumers, manufacturers, retailers, and suppliers</li>\r\n\r\n<li>Assist with maintaining stock and keeping accurate records of goods on hand</li>\r\n\r\n<li>Resolve any issues</li>\r\n\r\n<li>Assist with maintaining budget and timely delivery of goods</li>\r\n\r\n<li>Assist with providing proper warehouse staff and management</li>\r\n\r\n<li>Assist with keeping the company compliant of all rules and regulations</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Logistics professionals ensure the proper storage, transportation, and delivery of goods for a company. They work with distributors and their team to ensure that these goods are delivered on time. As a Logistics Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(18,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Marketing Intern, it is your duty to work under the supervision of the company to provide the client with an effective marketing campaign. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage and train employees on the marketing and sales campaign</li>\r\n\r\n<li>Meet marketing goals and forecasts</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Identify new marketing strategies and campaigns</li>\r\n\r\n<li>Conduct research to determine the proper way to sell products and services</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Collect, summarize, and analyze data trends</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Marketing professionals develop and maintain sound marketing strategies to boost sales. These individuals come up with effective marketing and sales campaigns that aim to reach out to the consumer. As a Marketing Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(19,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Attention to detail</li>\r\n	<li>Work well with a team</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>As a Media Intern, it is your duty to work under the supervision of the company to provide news and entertainment to the public. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with the creation and production of broadcasts, films, and other productions</li>\r\n	<li>Assist with hiring actors, entertainers, and musicians</li>\r\n	<li>Assist with ensuring that the production stay on budget and is completed in time</li>\r\n	<li>Assist with production modification</li>\r\n	<li>Assist with the creation and distribution of media literature</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>Media professionals work to create and distribute news and entertainment pieces for the public. These individuals use many different outlets to reach out to the consumer. As a Media Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',0,'',1),(20,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Pharmaceuticals Intern, it is your duty to work under the supervision of the company to provide prescriptions to patients and dispensaries. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with creating, formulating, and producing prescription drugs</li>\r\n\r\n<li>Assist with design and development of product packaging</li>\r\n\r\n<li>Assist with research</li>\r\n\r\n<li>Assist with quality assurance and regulation of prescription drugs</li>\r\n\r\n<li>Ensure that the drugs adhere to the rules set forth by the Federal Drug Administration (FDA)</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Pharmaceuticals professionals work to create and distribute prescription drugs. These individuals work in different capacities to ensure safe products are being made and distributed to patients and doctors. As a Pharmaceuticals Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(21,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Able to meet deadlines</li>\r\n\r\n<li>Able to work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Production Intern, it is your duty to work under the supervision of the production team to complete project. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with reading scripts and selecting those appropriate for production</li>\r\n\r\n<li>Assist with hiring actors and entertainers</li>\r\n\r\n<li>Assist with overseeing set construction, lighting, and choreography</li>\r\n\r\n<li>Assist with overseeing editing, adding special effects, and overall look of the final product</li>\r\n\r\n<li>Assist with ensuring that the production stay on budget and is completed in time</li>\r\n\r\n<li>Assist with production modification</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Production professionals create movies, plays, and music to entertain the masses. These individuals interpret a script and develop a performance based on those interpretations. As a Production Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(22,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n<li>Crisis management techniques</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Public Relations (PR) Intern, it is your duty to work under the supervision of the client to provide support. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Create and implement campaigns aimed at building a positive image</li>\r\n\r\n<li>Create company literature other communication to be distributed to the public</li>\r\n\r\n<li>Work with advertisers to get material out in a timely manner</li>\r\n\r\n<li>Organize and determine budgets for events</li>\r\n\r\n<li>Create leadership materials</li>\r\n\r\n<li>Conduct media outreach</li>\r\n\r\n<li>Create briefing materials</li>\r\n\r\n<li>Manage information coming in and out of the organization</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Public Relations (PR) professionals build and maintain a good relationship between entities and the public. These individuals participate in campaigns and events to provide outreach to the public on behalf of corporations and individuals. As a Public Relations (PR) Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n\r\n<p>&nbsp;</p>\r\n',0,NULL,0,NULL,0),(23,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Real estate license</li>\r\n\r\n<li>Uphold the standards and practices of the governing state board</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n<li>Maintain a professional and responsible image</li>\r\n\r\n<li>Uphold rules and regulations set forth by the governing body</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Real Estate Intern, it is your duty to work under the supervision of the firm to facilitate real estate transactions. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Explain complicated legal documents</li>\r\n\r\n<li>Broker real estate deals for residential and commercial clients</li>\r\n\r\n<li>Understand steps necessary to close real estate transactions</li>\r\n\r\n<li>Stay up to date on changes in real estate law</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Real Estate professionals work to broker real estate deals. These individuals manage real estate transactions for both residential and commercial clients. As a Real Estate Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(24,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Retail Intern, it is your duty to work under the supervision of the company to maintain store appearance and assist the customer. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Service and maintain vendor accounts</li>\r\n\r\n<li>Maintain merchandise and keep products organized</li>\r\n\r\n<li>Recommend product changes as trends change</li>\r\n\r\n<li>Maintain knowledge of all products and services offered</li>\r\n\r\n<li>Manage and coordinate staff</li>\r\n\r\n<li>Maintain storefront</li>\r\n\r\n<li>Keep property safe and clean</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Retail professionals work in department stores and other storefronts to maintain a professional appearance. These individuals act as the face of the company to reach out to the customer and establish long lasting relationships. As a Retail Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(25,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Sales Intern, it is your duty to work under the supervision of the client to provide an effective sales strategy and assist the customer. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage and train employees on the marketing and sales campaign</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Conduct research to determine the proper way to sell products and services</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Service and maintain vendor accounts</li>\r\n\r\n<li>Maintain merchandise and keep products organized</li>\r\n\r\n<li>Recommend product changes as trends change</li>\r\n\r\n<li>Maintain knowledge of all products and services offered</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Sales professionals develop and maintain sound marketing strategies to boost sales. These individuals come up with effective marketing and sales campaigns that aim to reach out to the consumer. As a Sales Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(26,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Able to work well with a team</li>\r\n\r\n<li>Work well under pressure</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Travel &amp; Tourism Intern, it is your duty to work under the supervision of the of the client to provide them with the best experience. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Arrange travel and accommodations for business and vacationing clients</li>\r\n\r\n<li>Effectively listen to the customer to determine their schedule preferences and budget</li>\r\n\r\n<li>Plan and organize events and trips for clients</li>\r\n\r\n<li>Find travel schedule and prices</li>\r\n\r\n<li>Book reservations for travel, stay, and transportation</li>\r\n\r\n<li>Make recommendations about recreational activities</li>\r\n\r\n<li>Properly advise clients of climate and culture of the destination</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Travel &amp; Tourism professionals work in a variety of capacities to organize and book travel arrangements for clients. They book flights and hotels and create itineraries for each client. As a Travel &amp; Tourism Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `job_category_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category_template_fr`
--

DROP TABLE IF EXISTS `job_category_template_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_category_template_fr` (
  `category_id` int(10) unsigned NOT NULL,
  `requirement` text,
  `requirement_status` tinyint(1) NOT NULL,
  `requirement1` text,
  `requirement1_status` tinyint(1) NOT NULL,
  `requirement2` text,
  `requirement2_status` tinyint(1) NOT NULL,
  `responsibility` text,
  `responsibility_status` tinyint(1) NOT NULL,
  `responsibility1` text,
  `responsibility1_status` tinyint(1) NOT NULL,
  `responsibility2` text,
  `responsibility2_status` tinyint(1) NOT NULL,
  `description` text,
  `description_status` tinyint(1) NOT NULL,
  `description1` text,
  `description1_status` tinyint(1) NOT NULL,
  `description2` text,
  `description2_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_category_template_fr_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category_template_fr`
--

LOCK TABLES `job_category_template_fr` WRITE;
/*!40000 ALTER TABLE `job_category_template_fr` DISABLE KEYS */;
INSERT INTO `job_category_template_fr` VALUES (1,'<ul>\r\n	<li>\r\n	<p>&Ecirc;tre disponible les jours et les heures n&eacute;cessaires par le directeur du d&eacute;partement</p>\r\n	</li>\r\n	<li>\r\n	<p>&Eacute;tudes formelles d&#39;un coll&egrave;ge ou d&#39;une universit&eacute; accr&eacute;dit&eacute;e</p>\r\n	</li>\r\n	<li>\r\n	<p>&Eacute;tudiant actuel ou &eacute;tudiant en transition</p>\r\n	</li>\r\n	<li>\r\n	<p>Certification des experts-comptables</p>\r\n\r\n	<p>&nbsp;</p>\r\n	.</li>\r\n</ul>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',0,'<p>En tant que stagiaire en comptabilit&eacute;, il est de votre devoir de travailler sous la supervision du directeur pour aider le d&eacute;partement de comptabilit&eacute;. Cela peut inclure les t&acirc;ches suivantes</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Participer &agrave; des sessions de formation hebdomadaires</p>\r\n	</li>\r\n	<li>\r\n	<p>Ombre un professionnel de la comptabilit&eacute; pour apprendre &agrave; effectuer avec pr&eacute;cision des t&acirc;ches telles que l&#39;&eacute;quilibrage des livres et une d&eacute;claration de revenus.</p>\r\n	</li>\r\n	<li>\r\n	<p>Aider avec les retours de fin de mois</p>\r\n	</li>\r\n	<li>\r\n	<p>Entr&eacute;es de journal post</p>\r\n	</li>\r\n	<li>\r\n	<p>Assist with accounts receivable and payable</p>\r\n	</li>\r\n	<li>\r\n	<p>La saisie des donn&eacute;es</p>\r\n	</li>\r\n	<li>\r\n	<p>Aider avec les comptes de cr&eacute;dit</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',0,'<p>Les comptables travaillent toute l&#39;ann&eacute;e dans toutes les facettes de la finance d&#39;une entreprise. Ils aident leurs clients &agrave; cr&eacute;er un plan financier et &agrave; mettre en &oelig;uvre des changements pour aider &agrave; atteindre les objectifs qui s&#39;y trouvent. En tant que stagiaire en comptabilit&eacute;, vous aiderez ces professionnels tout en obtenant des informations pr&eacute;cieuses sur les fonctions et les responsabilit&eacute;s de ce r&ocirc;le.</p>\r\n\r\n<p>&nbsp;</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',1,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing &eacute;lite, sed do eiusmod Temporo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercice ullamco laboris nisi uall aliquip ex ea commodo Cons&eacute;quat. Duis aute irure douleur dans le r&eacute;pr&eacute;henderit dans voluptate velit esse Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non Proident, sunt in culpa qui officia deserunt mollit.</p>\r\n',0),(2,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Computer skills</li>\r\n	<li>Internet research skills</li>\r\n	<li>Flexibility</li>\r\n	<li>Excellent written and communication skills</li>\r\n	<li>Ability to multitask</li>\r\n</ul>\r\n',1,'<p>&Ecirc;tre disponible les jours et les heures n&eacute;cessaires par le directeur du d&eacute;partement &Eacute;tudes formelles d&#39;un coll&egrave;ge ou d&#39;une universit&eacute; accr&eacute;dit&eacute;e &Eacute;tudiant actuel ou &eacute;tudiant en transition</p>\r\n',0,'<p>Comp&eacute;tences informatiques Comp&eacute;tences en recherche Internet La flexibilit&eacute; Excellentes aptitudes &agrave; l&#39;&eacute;crit et &agrave; la communication Capacit&eacute; de multit&acirc;che</p>\r\n',0,'<p>As an Administrative Intern, it is your duty to work under the supervision of the manager and office staff to manage the clients and their accounts. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Shadow the administrative manager to learn the responsibilities of this position</li>\r\n	<li>Answer incoming phone calls</li>\r\n	<li>Schedule meetings and events</li>\r\n	<li>Making travel arrangements</li>\r\n	<li>Managing financial data</li>\r\n	<li>Project coordination</li>\r\n</ul>\r\n',1,'<p>En tant que stagiaire administratif, il est de votre devoir de travailler sous la supervision du gestionnaire et du personnel de bureau pour g&eacute;rer les clients et leurs comptes. Cela peut inclure les t&acirc;ches suivantes:</p>\r\n',0,'<p>Ombrez le gestionnaire administratif pour conna&icirc;tre les responsabilit&eacute;s de ce poste R&eacute;pondre aux appels entrants Planifier des r&eacute;unions et des &eacute;v&eacute;nements Faire des arrangements de voyage Gestion des donn&eacute;es financi&egrave;res Coordination du projet</p>\r\n',0,'<p>The Administrative team is the backbone for any office. These professionals are responsible for keeping things organized and running the day to day operations. As an Administrative Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n\r\n<p>&nbsp;</p>\r\n',1,'<p>L&#39;&eacute;quipe administrative est l&#39;&eacute;pine dorsale de tout bureau. Ces professionnels sont charg&eacute;s de maintenir les choses organis&eacute;es et d&#39;ex&eacute;cuter les op&eacute;rations quotidiennes. En tant que stagiaire administratif, vous aiderez ces professionnels tout en acqu&eacute;rant des informations pr&eacute;cieuses sur les fonctions et les responsabilit&eacute;s de ce r&ocirc;le.</p>\r\n',0,'<p>L&#39;&eacute;quipe administrative est l&#39;&eacute;pine dorsale de tout bureau. Ces professionnels sont charg&eacute;s de maintenir les choses organis&eacute;es et d&#39;ex&eacute;cuter les op&eacute;rations quotidiennes.&nbsp;</p>\r\n',0),(3,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Attention to detail</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n</ul>\r\n',1,'',0,'',0,'<p>As a Construction Intern, it is your duty to work under the supervision of the construction site manager to maintain a safe workplace and learn how to perform essential job functions. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Assist in building commercial and residential structures</li>\r\n	<li>Assist with land clearing</li>\r\n	<li>Assist with demolition of existing structures</li>\r\n	<li>Mix concrete</li>\r\n	<li>Assist with maintaining machinery needed for construction</li>\r\n	<li>Learn how to use the various tools associated with this role</li>\r\n	<li>Learn to read blueprints and designs</li>\r\n	<li>Assist with removal of debris, hazardous material, and other waste from the work site</li>\r\n	<li>Assist with surveying the site</li>\r\n</ul>\r\n',1,'',0,'',0,'<p>Construction professionals are responsible for preparing a work site so that buildings and other structures can be erected. They clear the land and build both residential and commercial structures for clients. As a Construction Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n\r\n<p>&nbsp;</p>\r\n',1,'',0,'',0),(4,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Detail oriented</li>\r\n	<li>Be able to work with minimal supervision</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n	<li>Have an understanding of the various technologies associated with education</li>\r\n	<li>Work to achieve the goals and standards of the company</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>As a Corporate Training Intern, it is your duty to work under the supervision of the training team to provide support to the employees. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with assessing the students to determine their skill level</li>\r\n	<li>Assist planning and organizing of classroom activities</li>\r\n	<li>Assist with creating educational material to reinforce ideas learned</li>\r\n	<li>Assist with classroom instruction</li>\r\n	<li>Assist with providing constructive feedback to students</li>\r\n	<li>Assist with providing an accurate record of student progress</li>\r\n	<li>Assist with the building of a learning conducive environment</li>\r\n	<li>Provide students with a range of learning materials</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>Corporate Training professionals work with companies to provide education and support to employees. These individuals work to train new hires and teach new skills to existing employees. As a Corporate Training Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',0,'',0),(5,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Strong written and verbal communication skills</li>\r\n\r\n<li>Ability to effectively listen and empathize with the consumer</li>\r\n\r\n<li>Be able to multi-task</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Customer Service Intern, it is your duty to work under the supervision of the customer support manager to assist each customer. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage large amounts of phone calls</li>\r\n\r\n<li>Generate sales</li>\r\n\r\n<li>Use effective listen to determine the customers issue</li>\r\n\r\n<li>Provide the customer with the correct information</li>\r\n\r\n<li>Build rapport with the customer to build relationships</li>\r\n\r\n<li>Ensure that you are meeting the goals communicated by the manager</li>\r\n\r\n<li>Provide products support to resolve issues</li>\r\n\r\n<li>Take accurate notes to provide an accurate record of each call</li>\r\n\r\n<li>Work within the standards set by the company</li>\r\n\r\n<li>Exceed the customer&#39;s expectations</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Customer Service professionals provide products and support to customers on behalf of the client. They must maintain a high standard to provide quality service. As a Customer Service Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(6,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Have excellent written and verbal communication skills</li>\r\n	<li>Be able to meet a deadline</li>\r\n</ul>\r\n',1,'',1,'',0,'<p>As a Design Intern, it is your duty to work under the supervision of the design manager. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist the design manager with communicating with the client to get an understanding of the design</li>\r\n	<li>Use the various software and hardware to create designs and prototypes</li>\r\n	<li>Collaborate with teams members to get work completed on time</li>\r\n</ul>\r\n',1,'',1,'',0,'<p>Design professionals work to turn an into a visual rendering to assist in construction of the piece. They work closely with clients to bring ideas to life. As a Design Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',1,'',1,'',0),(7,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Ability to work well with a team</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Have an understanding of the various technologies associated with education</li>\r\n\r\n<li>Adhere to the local and state standards</li>\r\n\r\n<li>Work to achieve the goals and standards of the school</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Educator &amp; Education Intern, it is your duty to work under the supervision of the teacher to manage the classroom and teach the students. This can include the following tasks:</p>\r\n<ul>\r\n\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with assessing the students to determine their skill level</li>\r\n\r\n<li>Assist planning and organizing of classroom activities</li>\r\n\r\n<li>Assist with creating educational material to reinforce ideas learned</li>\r\n\r\n<li>Assist with classroom instruction</li>\r\n\r\n<li>Assist with providing constructive feedback to students</li>\r\n\r\n<li>Assist with providing an accurate record of student progress</li>\r\n\r\n<li>Assist with the building of a learning conducive environment</li>\r\n\r\n<li>Maintain the disciplinary standards of the classroom and the school</li>\r\n\r\n<li>Provide students with a range of learning materials</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Education professionals work with students of all ages and abilities to teach them the skills they need to succeed. These individuals work in many capacities to manage the classroom and educate the students. As an Educator &amp; Education Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(8,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Ability to work well with a team</li>\r\n	<li>Able to meet deadlines</li>\r\n</ul>\r\n',1,'',0,'',0,'<p>As an Engineering Intern, it is your duty to work under the supervision of the project manager to complete the project. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with modifying product design</li>\r\n	<li>Assist with developing blueprints and rendering of products and systems</li>\r\n	<li>Create prototypes for the client</li>\r\n	<li>Assist with performing calculations to get accurate dimensions</li>\r\n	<li>Assist with categorizing and identifying parts</li>\r\n	<li>Create instructions on building and proper use of products for the customer</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>Engineering professionals work to research and implement systems of all kinds. These individuals work in a variety of capacities to create blueprints and realize the design as a viable product. As an Engineering Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',0,'',1),(9,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Attention to detail</li>\r\n	<li>High school diploma or equivalent</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>As a Facilities Intern, it is your duty to work under the supervision of the manager to maintain the facilities. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Ensure buildings and structures are well maintained</li>\r\n	<li>Provide cleaning services</li>\r\n	<li>Oversee catering and ensure vending machines are well stocked and maintained</li>\r\n	<li>Ensure the overall health and safety of employees</li>\r\n	<li>Hire and manage contractors</li>\r\n	<li>Create and maintain communication systems</li>\r\n	<li>Provide secure facilities for the employees</li>\r\n	<li>Offer space management services to provide an organized work space</li>\r\n	<li>Reduce operating costs by keeping equipment and facilities well maintained</li>\r\n</ul>\r\n',0,'',0,'',0,'<p>A Facilities professionals ensure that the workplace is safe and clean. These individuals work in many different capacities to maintain the company property and make any necessary repairs to equipment. As a Facilities Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',0,'',0),(10,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Certified Public Accountant certification</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Finance Intern, it is your duty to work under the supervision of the finance manager to implement and carry out the goals of the finance department. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Shadow the finance manager to learn the duties and responsibilities of this role</li>\r\n\r\n<li>Create payment plans</li>\r\n\r\n<li>Assist with implementing new finance systems</li>\r\n\r\n<li>Assist with creating journal entries</li>\r\n\r\n<li>Assist with creating monthly statements</li>\r\n\r\n<li>Assist with accounts receivable and payable</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>The Finance professionals are responsible for accurately reporting and monitoring the finances of a company. They ensure that accounts are reconciled and all expenses are managed properly. As a Finance Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(11,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Effective listening and empathy</li>\r\n\r\n<li>Able to work well with a team</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Ability to work fast and effectively in an emergency situation</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Healthcare Intern, it is your duty to work under the supervision of the healthcare provider to give patient the best care. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Actively listen and empathize with patient to assess their needs</li>\r\n\r\n<li>Assist with coming up with a course of treatment for the patient</li>\r\n\r\n<li>Assist with prescribing and administering medication to the patient</li>\r\n\r\n<li>Be able to quickly assess and diagnose a patient</li>\r\n\r\n<li>Keep accurate records of patient progress</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Healthcare professionals work in different capacities to provide care to patients. These individuals must effectively listen to the patient to determine the best course of treatment. As a Healthcare Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(12,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Ability to work under pressure</li>\r\n\r\n<li>Actively listen to the guest to exceed their expectations</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Hospitality Intern, it is your duty to work under the supervision of the client to provide them with the best experience. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Attend to bar patrons</li>\r\n\r\n<li>Create and serve food to the clients</li>\r\n\r\n<li>Recommend travel and leisure time activities to the guests</li>\r\n\r\n<li>Arrange transportation for guests</li>\r\n\r\n<li>Organize meetings and events</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Hospitality professionals work in many different capacities to provide clients with the best possible experience. They work in motels, on ships, and in RV parks and campgrounds to provide each guest with a pleasant stay. As a Hospitality Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(13,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Human Resources (HR) Intern, it is your duty to work under the supervision of the company to provide support to the employees. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with maintaining job titles and descriptions</li>\r\n\r\n<li>Assist with interviewing new hires, properly training new employees, and placing them in the appropriate roles</li>\r\n\r\n<li>Assist with supporting the company by giving promotions to the right employees</li>\r\n\r\n<li>Assist with evaluating employees to determine their job effectiveness and ability to complete their duties</li>\r\n\r\n<li>Keep accurate records for all employees</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>The Human Resources (HR) professionals are responsible for being the liaison between the employee and the employer. These individuals support the staff, making sure the needs of both the company and they employee are met. As a Human Resources (HR) Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(14,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Independent worker</li>\r\n\r\n<li>Ability to work well with a team</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Intern, it is your duty to work under the supervision of the IT manager to learn how to properly maintain and install necessary systems. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Respond to requests for support</li>\r\n\r\n<li>Assist with minor repairs</li>\r\n\r\n<li>Monitor systems and report any errors to the IT manager</li>\r\n\r\n<li>Assist in the installation of hardware and software</li>\r\n\r\n<li>Assist with maintenance and upgrades to the network</li>\r\n\r\n<li>Assist with updating technical documents</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Information Technology (IT) professionals are responsible for installing and maintaining the systems necessary for an office to run efficiently. This department works to install hardware, maintain database, and provide technical support to other staff members. As an Information Technology (IT) Intern Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(15,'<ul><li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Good written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Good observation skills</li>\r\n\r\n<li>Be available the days and times needed by the law enforcement department</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Law Enforcement/Security professionals that are employed by the state usually work under the department of safety or through a state bureau. Professionals that work on a local level are employed either as a city cop or a Sheriff at the county level. This experience will introduce you to different specialties and provide you with valuable experience in the field of Law Enforcement/Security.</p>\r\n\r\n<ul>\r\n\r\n<li>As a Law Enforcement/Security Intern, it is your duty to work under the supervision of the director to assist the criminal investigation unit. This can include the following tasks:</li>\r\n\r\n\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Complete investigate assignments</li>\r\n\r\n<li>Work with the professionals to learn and apply the techniques used to patrol the community and uphold law and order.</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Law Enforcement/Security professionals protect civilians as well as their property and work to enforce the laws in the community they serve. Job titles in this industry include officers, sheriff, game warden, criminal investigator, and special agent. As a Law Enforcement/Security intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(16,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Uphold the standards and practices of the governing state board</li>\r\n\r\n<li>Keep client confidentiality</li>\r\n\r\n<li>Maintain integrity and responsibility at all times</li>\r\n\r\n<li>Good judge and ability to analyze situations</li>\r\n\r\n<li>Ability to mount a legal defense and properly represent a client</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Legal Intern, it is your duty to work under the supervision of the company to best represent clients. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist in providing accurate and timely legal services to clients</li>\r\n\r\n<li>Assist with providing a good defense for clients</li>\r\n\r\n<li>Assist with creating policies and enforcing regulations</li>\r\n\r\n<li>Assist with offering proactive advice and risk management techniques</li>\r\n\r\n<li>Assist with communicating and negotiating with other counsel and other entities</li>\r\n\r\n<li>Accurately create contracts and other legal documents</li>\r\n\r\n<li>Handle complex matters for clients</li>\r\n\r\n<li>Provide clients with an explanation of legal language so they understand documents</li>\r\n\r\n<li>Stay up to date on local and state laws as they pertain to clients</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Legal professionals work in many different capacities to provide legal services to companies and clients. These individuals prosecute criminals, defend clients in legal matters, and provide a wealth of legal services to the public and corporations. As a Legal Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(17,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Proficient with logistics software</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Logistics Intern, it is your duty to work under the supervision of the company to move products to their destination. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with the storage, transportation, and delivery of goods and services</li>\r\n\r\n<li>Assist with the creation and management of ongoing orders</li>\r\n\r\n<li>Assist with the communication with consumers, manufacturers, retailers, and suppliers</li>\r\n\r\n<li>Assist with maintaining stock and keeping accurate records of goods on hand</li>\r\n\r\n<li>Resolve any issues</li>\r\n\r\n<li>Assist with maintaining budget and timely delivery of goods</li>\r\n\r\n<li>Assist with providing proper warehouse staff and management</li>\r\n\r\n<li>Assist with keeping the company compliant of all rules and regulations</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Logistics professionals ensure the proper storage, transportation, and delivery of goods for a company. They work with distributors and their team to ensure that these goods are delivered on time. As a Logistics Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(18,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Marketing Intern, it is your duty to work under the supervision of the company to provide the client with an effective marketing campaign. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage and train employees on the marketing and sales campaign</li>\r\n\r\n<li>Meet marketing goals and forecasts</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Identify new marketing strategies and campaigns</li>\r\n\r\n<li>Conduct research to determine the proper way to sell products and services</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Collect, summarize, and analyze data trends</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Marketing professionals develop and maintain sound marketing strategies to boost sales. These individuals come up with effective marketing and sales campaigns that aim to reach out to the consumer. As a Marketing Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(19,'<ul>\r\n	<li>Be available the days and times needed by the director of the department</li>\r\n	<li>Formal education from an accredited college or university</li>\r\n	<li>Current student or student in transition</li>\r\n	<li>Excellent written and verbal communication skills</li>\r\n	<li>Attention to detail</li>\r\n	<li>Work well with a team</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>As a Media Intern, it is your duty to work under the supervision of the company to provide news and entertainment to the public. This can include the following tasks:</p>\r\n\r\n<ul>\r\n	<li>Attend weekly training sessions</li>\r\n	<li>Assist with the creation and production of broadcasts, films, and other productions</li>\r\n	<li>Assist with hiring actors, entertainers, and musicians</li>\r\n	<li>Assist with ensuring that the production stay on budget and is completed in time</li>\r\n	<li>Assist with production modification</li>\r\n	<li>Assist with the creation and distribution of media literature</li>\r\n</ul>\r\n',0,'',0,'',1,'<p>Media professionals work to create and distribute news and entertainment pieces for the public. These individuals use many different outlets to reach out to the consumer. As a Media Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,'',0,'',1),(20,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Pharmaceuticals Intern, it is your duty to work under the supervision of the company to provide prescriptions to patients and dispensaries. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with creating, formulating, and producing prescription drugs</li>\r\n\r\n<li>Assist with design and development of product packaging</li>\r\n\r\n<li>Assist with research</li>\r\n\r\n<li>Assist with quality assurance and regulation of prescription drugs</li>\r\n\r\n<li>Ensure that the drugs adhere to the rules set forth by the Federal Drug Administration (FDA)</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Pharmaceuticals professionals work to create and distribute prescription drugs. These individuals work in different capacities to ensure safe products are being made and distributed to patients and doctors. As a Pharmaceuticals Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(21,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Able to meet deadlines</li>\r\n\r\n<li>Able to work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Production Intern, it is your duty to work under the supervision of the production team to complete project. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Assist with reading scripts and selecting those appropriate for production</li>\r\n\r\n<li>Assist with hiring actors and entertainers</li>\r\n\r\n<li>Assist with overseeing set construction, lighting, and choreography</li>\r\n\r\n<li>Assist with overseeing editing, adding special effects, and overall look of the final product</li>\r\n\r\n<li>Assist with ensuring that the production stay on budget and is completed in time</li>\r\n\r\n<li>Assist with production modification</li>\r\n\r\n\r\n</ul>',0,NULL,0,NULL,0,'<p>Production professionals create movies, plays, and music to entertain the masses. These individuals interpret a script and develop a performance based on those interpretations. As a Production Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(22,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Formal education from an accredited college or university</li>\r\n\r\n<li>Current student or student in transition</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n<li>Crisis management techniques</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Public Relations (PR) Intern, it is your duty to work under the supervision of the client to provide support. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Create and implement campaigns aimed at building a positive image</li>\r\n\r\n<li>Create company literature other communication to be distributed to the public</li>\r\n\r\n<li>Work with advertisers to get material out in a timely manner</li>\r\n\r\n<li>Organize and determine budgets for events</li>\r\n\r\n<li>Create leadership materials</li>\r\n\r\n<li>Conduct media outreach</li>\r\n\r\n<li>Create briefing materials</li>\r\n\r\n<li>Manage information coming in and out of the organization</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Public Relations (PR) professionals build and maintain a good relationship between entities and the public. These individuals participate in campaigns and events to provide outreach to the public on behalf of corporations and individuals. As a Public Relations (PR) Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n\r\n<p>&nbsp;</p>\r\n',0,NULL,0,NULL,0),(23,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Real estate license</li>\r\n\r\n<li>Uphold the standards and practices of the governing state board</li>\r\n\r\n<li>Work well with a team</li>\r\n\r\n<li>Maintain a professional and responsible image</li>\r\n\r\n<li>Uphold rules and regulations set forth by the governing body</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Real Estate Intern, it is your duty to work under the supervision of the firm to facilitate real estate transactions. This can include the following tasks:</p>\r\n\r\n\r\n<ul>\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Explain complicated legal documents</li>\r\n\r\n<li>Broker real estate deals for residential and commercial clients</li>\r\n\r\n<li>Understand steps necessary to close real estate transactions</li>\r\n\r\n<li>Stay up to date on changes in real estate law</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Real Estate professionals work to broker real estate deals. These individuals manage real estate transactions for both residential and commercial clients. As a Real Estate Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(24,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Retail Intern, it is your duty to work under the supervision of the company to maintain store appearance and assist the customer. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Service and maintain vendor accounts</li>\r\n\r\n<li>Maintain merchandise and keep products organized</li>\r\n\r\n<li>Recommend product changes as trends change</li>\r\n\r\n<li>Maintain knowledge of all products and services offered</li>\r\n\r\n<li>Manage and coordinate staff</li>\r\n\r\n<li>Maintain storefront</li>\r\n\r\n<li>Keep property safe and clean</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Retail professionals work in department stores and other storefronts to maintain a professional appearance. These individuals act as the face of the company to reach out to the customer and establish long lasting relationships. As a Retail Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(25,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Work well with a team</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Sales Intern, it is your duty to work under the supervision of the client to provide an effective sales strategy and assist the customer. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Manage and train employees on the marketing and sales campaign</li>\r\n\r\n<li>Work towards meeting sales quotas</li>\r\n\r\n<li>Conduct research to determine the proper way to sell products and services</li>\r\n\r\n<li>Connect with the customer to gain trust and loyalty</li>\r\n\r\n<li>Service and maintain vendor accounts</li>\r\n\r\n<li>Maintain merchandise and keep products organized</li>\r\n\r\n<li>Recommend product changes as trends change</li>\r\n\r\n<li>Maintain knowledge of all products and services offered</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Sales professionals develop and maintain sound marketing strategies to boost sales. These individuals come up with effective marketing and sales campaigns that aim to reach out to the consumer. As a Sales Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0),(26,'<ul><li>Be available the days and times needed by the director of the department</li>\r\n\r\n<li>High school diploma or equivalent</li>\r\n\r\n<li>Excellent written and verbal communication skills</li>\r\n\r\n<li>Attention to detail</li>\r\n\r\n<li>Able to work well with a team</li>\r\n\r\n<li>Work well under pressure</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>As a Travel &amp; Tourism Intern, it is your duty to work under the supervision of the of the client to provide them with the best experience. This can include the following tasks:</p>\r\n\r\n<ul>\r\n\r\n<li>Attend weekly training sessions</li>\r\n\r\n<li>Arrange travel and accommodations for business and vacationing clients</li>\r\n\r\n<li>Effectively listen to the customer to determine their schedule preferences and budget</li>\r\n\r\n<li>Plan and organize events and trips for clients</li>\r\n\r\n<li>Find travel schedule and prices</li>\r\n\r\n<li>Book reservations for travel, stay, and transportation</li>\r\n\r\n<li>Make recommendations about recreational activities</li>\r\n\r\n<li>Properly advise clients of climate and culture of the destination</li>\r\n</ul>',0,NULL,0,NULL,0,'<p>Travel &amp; Tourism professionals work in a variety of capacities to organize and book travel arrangements for clients. They book flights and hotels and create itineraries for each client. As a Travel &amp; Tourism Intern, you will assist these professionals, while gaining valuable insights into the duties and responsibilities of this role.</p>\r\n',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `job_category_template_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_coupon_mapper`
--

DROP TABLE IF EXISTS `job_coupon_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_coupon_mapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `job_coupon_mapper_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE,
  CONSTRAINT `job_coupon_mapper_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_coupon_mapper`
--

LOCK TABLES `job_coupon_mapper` WRITE;
/*!40000 ALTER TABLE `job_coupon_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_coupon_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_field`
--

DROP TABLE IF EXISTS `job_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_field` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `section` enum('None','Summary','Requirements','Skills') DEFAULT 'None',
  `field` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `name_french` varchar(500) NOT NULL,
  `type` enum('Text','TextArea','Radio','List','MultiList') DEFAULT 'Text',
  `order_by` int(10) unsigned DEFAULT NULL,
  `is_searchable` tinyint(3) unsigned DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_field_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_field`
--

LOCK TABLES `job_field` WRITE;
/*!40000 ALTER TABLE `job_field` DISABLE KEYS */;
INSERT INTO `job_field` VALUES (3,NULL,'Summary','salary','Salary','Salaire','Radio',1,1,1),(4,NULL,'Summary','schedule','Work Schedule','Horaire de travail\n','Radio',2,1,1),(7,NULL,'Requirements','diploma','Diploma','','MultiList',1,NULL,1),(8,NULL,'Requirements','written_languages','Written Languages','','MultiList',3,NULL,1),(9,NULL,'Requirements','spoken_languages','Spoken Languages','','MultiList',4,NULL,1),(11,NULL,'Summary','internship-report','Internship Report','Rapport de stage\n','Radio',6,1,1),(12,NULL,'Summary','company_size','Company Size','Taille de l\'entreprise','Radio',7,1,1),(13,NULL,'Summary','internship','Internship Experience','Expérience de stage\n','Radio',5,1,1),(14,NULL,'Requirements','level_of_study','Level of Study','Niveau d\'études','MultiList',2,1,1);
/*!40000 ALTER TABLE `job_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_field_option`
--

DROP TABLE IF EXISTS `job_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_field_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `job_field_option_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `job_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_field_option`
--

LOCK TABLES `job_field_option` WRITE;
/*!40000 ALTER TABLE `job_field_option` DISABLE KEYS */;
INSERT INTO `job_field_option` VALUES (4,4,'Full-Time(35hrs+)','full-time'),(5,4,'Part-Time(10-15hrs)','part-time'),(14,8,' French','French'),(15,8,' English',' English'),(16,8,' Chinese','Chinese'),(17,8,'Spanish','Spanish'),(18,8,' Hindi','Hindi'),(19,8,'Arabic','Arabic'),(20,9,' French',' French'),(21,9,' English',' English'),(22,9,'Chinese','Chinese'),(23,9,'Spanish','Spanish'),(24,9,'Hindi','Hindi'),(25,9,'Arabic','Arabic'),(36,3,'Paid','paid'),(37,3,'Not Paid','not paid'),(38,3,'To be Discussed','to be discussed'),(39,11,'Included','1'),(40,11,'Not included','0'),(41,12,'1-25 employees','1-25'),(42,12,'26-50 employees','26-50'),(43,12,'51-200 employees','51-200'),(44,12,'200+ employees','200+'),(45,13,'1st Cycle','1st cycle'),(46,13,'2nd Cycle','2nd ycle'),(47,13,'3rd Cycle','3rd cycle'),(49,12,'Not Included','not included'),(50,13,'Not Included','not included'),(51,8,'Portuguese','Portuguese'),(52,8,'Bengali','Bengali'),(53,8,'Russian','Russian'),(54,8,'Japanese','Japanese'),(55,8,'Javanese','Javanese'),(56,9,'Portuguese','Portuguese'),(57,9,'Bengali','Bengali'),(58,9,'Russian','Russian'),(59,9,'Japanese','Japanese'),(60,9,'Javanese','Javanese'),(62,7,'Undefine','Undefine'),(63,7,'None','None'),(64,7,'DES','DES'),(65,7,'AEP','AEP'),(66,7,'DEP','DEP'),(67,7,'ASP','ASP'),(68,7,'AEC','AEC'),(69,7,'DEC','DEC'),(70,7,'Certificate','Certificate'),(71,7,'BAC','BAC'),(72,7,'DESS','DESS'),(73,7,'MA','MA'),(74,7,'PH.D.','PH.D.'),(75,7,'Post-doctorat','Post-doctorat'),(76,14,'1st Year','1st Year'),(77,14,'2nd year','2nd year'),(78,14,'3rd Year','3rd Year'),(79,14,'4th Year','4th Year'),(80,14,'Completed','Completed');
/*!40000 ALTER TABLE `job_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_field_value`
--

DROP TABLE IF EXISTS `job_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_field_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `value` varchar(250) NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `job_id` (`job_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `job_field_value_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_field_value_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `job_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3707 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_field_value`
--

LOCK TABLES `job_field_value` WRITE;
/*!40000 ALTER TABLE `job_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_item`
--

DROP TABLE IF EXISTS `job_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_item` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `default_requirement` text NOT NULL,
  `requirement` text,
  `requirement1` text,
  `requirement2` text,
  `requirement_dropdown` text,
  `about` text,
  `default_responsibility` text NOT NULL,
  `responsibility` text,
  `responsibility1` text,
  `responsibility2` text,
  `responsibility_dropdown` text,
  `logo` varchar(250) DEFAULT NULL,
  `default_description` text NOT NULL,
  `description` text,
  `description1` decimal(10,0) DEFAULT NULL,
  `description2` text,
  `description_dropdown` text,
  `ref_url` varchar(100) NOT NULL,
  `checkbox` tinyint(2) NOT NULL,
  `is_featured` tinyint(3) unsigned DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `save_to_draft` int(2) NOT NULL DEFAULT '0',
  `current_step` int(2) NOT NULL DEFAULT '0',
  `fee` decimal(11,3) DEFAULT NULL,
  `renewal` decimal(11,3) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `zip_code` varchar(6) NOT NULL,
  `lat` varchar(200) DEFAULT NULL,
  `lng` varchar(200) DEFAULT NULL,
  `create_dated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_dated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  CONSTRAINT `job_item_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_item`
--

LOCK TABLES `job_item` WRITE;
/*!40000 ALTER TABLE `job_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_item_fr`
--

DROP TABLE IF EXISTS `job_item_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_item_fr` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `default_requirement` text NOT NULL,
  `requirement` text,
  `requirement1` text,
  `requirement2` text,
  `requirement_dropdown` text,
  `default_description` text NOT NULL,
  `description` text,
  `description1` text,
  `description2` text,
  `description_dropdown` text,
  `about` text,
  `default_responsibility` text NOT NULL,
  `responsibility` text,
  `responsibility1` text,
  `responsibility2` text,
  `responsibility_dropdown` text,
  PRIMARY KEY (`job_id`),
  KEY `name` (`name`),
  CONSTRAINT `job_item_fr_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_item_fr`
--

LOCK TABLES `job_item_fr` WRITE;
/*!40000 ALTER TABLE `job_item_fr` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_item_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_msg`
--

DROP TABLE IF EXISTS `job_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_msg` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `sender_id` int(11) unsigned NOT NULL,
  `text` text,
  `ip` varchar(30) NOT NULL,
  `category` enum('Alert','Notification','Email') NOT NULL DEFAULT 'Email',
  `status` enum('Read','UnRead','Deleted','Span','Archived') NOT NULL DEFAULT 'Read',
  `time` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_msg_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_msg_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_msg`
--

LOCK TABLES `job_msg` WRITE;
/*!40000 ALTER TABLE `job_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_msg_recipients`
--

DROP TABLE IF EXISTS `job_msg_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_msg_recipients` (
  `message_id` int(11) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `recipient_id` int(11) unsigned NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `status` enum('Read','UnRead','Deleted') NOT NULL DEFAULT 'UnRead',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`seq`,`recipient_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `conversation_id` (`message_id`),
  CONSTRAINT `job_msg_recipients_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `job_msg` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_msg_recipients_ibfk_3` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_msg_recipients`
--

LOCK TABLES `job_msg_recipients` WRITE;
/*!40000 ALTER TABLE `job_msg_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_msg_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_requirements_info`
--

DROP TABLE IF EXISTS `job_requirements_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_requirements_info` (
  `user_id` int(11) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `field_value` longtext NOT NULL,
  KEY `job_id` (`job_id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_requirements_info_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_requirements_info_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `job_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_requirements_info_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requirements_info`
--

LOCK TABLES `job_requirements_info` WRITE;
/*!40000 ALTER TABLE `job_requirements_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_requirements_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_transaction`
--

DROP TABLE IF EXISTS `job_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `data` text,
  `dated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_transaction_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_transaction`
--

LOCK TABLES `job_transaction` WRITE;
/*!40000 ALTER TABLE `job_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_user_mapper`
--

DROP TABLE IF EXISTS `job_user_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_user_mapper` (
  `job_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `status` enum('Applied','Favorite','Saved') NOT NULL DEFAULT 'Saved',
  PRIMARY KEY (`job_id`,`user_id`,`status`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_user_mapper_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_user_mapper_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_user_mapper`
--

LOCK TABLES `job_user_mapper` WRITE;
/*!40000 ALTER TABLE `job_user_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_user_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobconfirmation`
--

DROP TABLE IF EXISTS `jobconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobconfirmation`
--

LOCK TABLES `jobconfirmation` WRITE;
/*!40000 ALTER TABLE `jobconfirmation` DISABLE KEYS */;
INSERT INTO `jobconfirmation` VALUES (1,'Job Confirmation Email-Template','<p>Hello ##NAME##,</p>\r\n\r\n<p>This is a reminder email to inform that you have created a job post on dd/mm/yy. We appreciate the time you took to create a job.&nbsp; We will keep updating you for any new activity.</p>\r\n\r\n<p>For any concern or assistance, please contact <a href=\"mailto:support@gmail.com\">support@kioui.com</a>.</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team&nbsp;</p>\r\n',1,'2016-12-30');
/*!40000 ALTER TABLE `jobconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobconfirmation_fr`
--

DROP TABLE IF EXISTS `jobconfirmation_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobconfirmation_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobconfirmation_fr`
--

LOCK TABLES `jobconfirmation_fr` WRITE;
/*!40000 ALTER TABLE `jobconfirmation_fr` DISABLE KEYS */;
INSERT INTO `jobconfirmation_fr` VALUES (1,'Confirmation du travail Email-Template V1','<p>Bonjour ##NAME##,</p>\r\n\r\n<p>Ceci est un courriel de rappel pour informer que vous avez cr&eacute;&eacute; le poste de travail sur dd / mm / aa. Nous appr&eacute;cions le temps que vous avez pris pour cr&eacute;er un emploi. Nous continuerons &agrave; vous mettre &agrave; jour pour toute nouvelle activit&eacute;.</p>\r\n\r\n<p>Pour toute question ou assistance, veuillez contacter support@kioui.com.</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n',1,'2016-12-30');
/*!40000 ALTER TABLE `jobconfirmation_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobexpire`
--

DROP TABLE IF EXISTS `jobexpire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobexpire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobexpire`
--

LOCK TABLES `jobexpire` WRITE;
/*!40000 ALTER TABLE `jobexpire` DISABLE KEYS */;
INSERT INTO `jobexpire` VALUES (1,'Job Expire Email-Template V1','<p><img src=\"http://52.10.110.240/admin/img/logo.png\" style=\"display:block; margin:0 auto\" /></p>\r\n\r\n<p>Dear ##NAME##,</p>\r\n\r\n<p>Your internship posting ##INTERNSHIPNAME## posted on ##CREATEDDATE##, is about to expire.<br />\r\n<br />\r\nIf you still have not hired for ##INTERNSHIPNAME## we invite you edit your internship posting to atract more qualified candidates.</p>\r\n\r\n<p>Best Regards,</p>\r\n\r\n<p>KIOUI Team</p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `jobexpire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobexpire_fr`
--

DROP TABLE IF EXISTS `jobexpire_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobexpire_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobexpire_fr`
--

LOCK TABLES `jobexpire_fr` WRITE;
/*!40000 ALTER TABLE `jobexpire_fr` DISABLE KEYS */;
INSERT INTO `jobexpire_fr` VALUES (1,'Job Expire Email-Template V1','<p><img src=\"http://52.10.110.240/admin/img/logo.png\" style=\"display:block; margin:0 auto\" /></p>\r\n\r\n<p>Cher ##NAME##,</p>\r\n\r\n<p>Votre annonce de stage ##INTERNSHIPNAME## affich&eacute; le ##CREATEDDATE##, est sur le point d&#39;expirer.<br />\r\n<br />\r\nSi vous n&#39;avez toujours pas embauch&eacute; pour ##INTERNSHIPNAME ##, nous vous invitons &agrave; modifier vos offres de stage pour airer plus de candidats qualifi&eacute;s.</p>\r\n\r\n<p>Meilleures salutaions,</p>\r\n\r\n<p>L&rsquo;&Eacute;quipe Kioui</p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `jobexpire_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadpostedjob`
--

DROP TABLE IF EXISTS `leadpostedjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leadpostedjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadpostedjob`
--

LOCK TABLES `leadpostedjob` WRITE;
/*!40000 ALTER TABLE `leadpostedjob` DISABLE KEYS */;
INSERT INTO `leadpostedjob` VALUES (4,'Lead Posted job -Template V1','<p>Hello ##NAME##,</p>\r\n\r\n<p>This is a reminder email to inform that you have created a job post on dd/mm/yy. We appreciate the time you took to create a job.&nbsp; We will keep updating you for any new activity.</p>\r\n\r\n<p>For any concern or assistance, please contact <a href=\"mailto:support@gmail.com\">support@gmail.com</a>.</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team&nbsp;</p>\r\n',1,'2016-12-30');
/*!40000 ALTER TABLE `leadpostedjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadpostedjob_fr`
--

DROP TABLE IF EXISTS `leadpostedjob_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leadpostedjob_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadpostedjob_fr`
--

LOCK TABLES `leadpostedjob_fr` WRITE;
/*!40000 ALTER TABLE `leadpostedjob_fr` DISABLE KEYS */;
INSERT INTO `leadpostedjob_fr` VALUES (4,'Lead Posté le poste -Template V1','<p>Bonjour ##NAME##,</p>\r\n\r\n<p>Ceci est un courriel de rappel pour informer que vous avez cr&eacute;&eacute; le poste de travail sur dd / mm / aa. Nous appr&eacute;cions le temps que vous avez pris pour cr&eacute;er un emploi. Nous continuerons &agrave; vous mettre &agrave; jour pour toute nouvelle activit&eacute;.</p>\r\n\r\n<p>Pour toute question ou assistance, veuillez contacter support@gmail.com.</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n',1,'2016-12-30');
/*!40000 ALTER TABLE `leadpostedjob_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1457427466),('m010101_100001_init_comment',1461999698),('m150207_210500_i18n_init',1457427476),('m150212_182851_init_cms',1461999525);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `days` varchar(200) NOT NULL,
  `subtotal` varchar(200) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (2,'Kioui.ca Job Posting','60 days','$100.00','15%','115$');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_fr`
--

DROP TABLE IF EXISTS `purchase_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `days` varchar(200) NOT NULL,
  `subtotal` varchar(200) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_fr`
--

LOCK TABLES `purchase_fr` WRITE;
/*!40000 ALTER TABLE `purchase_fr` DISABLE KEYS */;
INSERT INTO `purchase_fr` VALUES (2,'Emplois Kioui.ca','60 JOURS','$100.00','15%','115$');
/*!40000 ALTER TABLE `purchase_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivedmessage`
--

DROP TABLE IF EXISTS `receivedmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivedmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivedmessage`
--

LOCK TABLES `receivedmessage` WRITE;
/*!40000 ALTER TABLE `receivedmessage` DISABLE KEYS */;
INSERT INTO `receivedmessage` VALUES (1,'User has Received Message Email-V1','<p>Hello ##NAME##,</p>\r\n\r\n<p>This is with regards to your profile on the KIOUI we have a good opening for you in the field of business development. Please find below the brief details about the position:</p>\r\n\r\n<p>Job Description: Own the process for the product team.</p>\r\n\r\n<p>Looking forward to hear from you</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team</p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `receivedmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivedmessage_fr`
--

DROP TABLE IF EXISTS `receivedmessage_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivedmessage_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivedmessage_fr`
--

LOCK TABLES `receivedmessage_fr` WRITE;
/*!40000 ALTER TABLE `receivedmessage_fr` DISABLE KEYS */;
INSERT INTO `receivedmessage_fr` VALUES (1,'L\'utilisateur a reçu le message Email-V1','<p>Bonjour [Etudiant],</p>\r\n\r\n<p>C&#39;est en ce qui concerne votre profil sur le KIOUI nous avons une bonne ouverture pour vous dans le domaine du d&eacute;veloppement des affaires. Vous trouverez ci-dessous les d&eacute;tails sur le poste:</p>\r\n\r\n<p>Description du poste: Poss&eacute;der le processus pour l&#39;&eacute;quipe de produit.</p>\r\n\r\n<p>J&#39;ai h&acirc;te d&#39;avoir de vos nouvelles</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n',1,'2017-01-02'),(3,'fgsdfg','<p>sdfgsdfg</p>\r\n',0,'2017-01-05');
/*!40000 ALTER TABLE `receivedmessage_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sameinterestfiled`
--

DROP TABLE IF EXISTS `sameinterestfiled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sameinterestfiled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sameinterestfiled`
--

LOCK TABLES `sameinterestfiled` WRITE;
/*!40000 ALTER TABLE `sameinterestfiled` DISABLE KEYS */;
INSERT INTO `sameinterestfiled` VALUES (3,'tesy','<p>dwqdqdwqd</p>\r\n',1,'2017-03-30');
/*!40000 ALTER TABLE `sameinterestfiled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sameinterestfiled_fr`
--

DROP TABLE IF EXISTS `sameinterestfiled_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sameinterestfiled_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sameinterestfiled_fr`
--

LOCK TABLES `sameinterestfiled_fr` WRITE;
/*!40000 ALTER TABLE `sameinterestfiled_fr` DISABLE KEYS */;
INSERT INTO `sameinterestfiled_fr` VALUES (1,'wdwq','<p>dqwdqdqdqdq</p>\r\n',1,'2017-03-30');
/*!40000 ALTER TABLE `sameinterestfiled_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_listed_msgs`
--

DROP TABLE IF EXISTS `short_listed_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `short_listed_msgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(100) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `short_listed_user` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `short_listed_user` (`short_listed_user`),
  CONSTRAINT `short_listed_msgs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `short_listed_msgs_ibfk_2` FOREIGN KEY (`short_listed_user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `short_listed_msgs`
--

LOCK TABLES `short_listed_msgs` WRITE;
/*!40000 ALTER TABLE `short_listed_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_listed_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentemails`
--

DROP TABLE IF EXISTS `studentemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentemails`
--

LOCK TABLES `studentemails` WRITE;
/*!40000 ALTER TABLE `studentemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanksforjob`
--

DROP TABLE IF EXISTS `thanksforjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanksforjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanksforjob`
--

LOCK TABLES `thanksforjob` WRITE;
/*!40000 ALTER TABLE `thanksforjob` DISABLE KEYS */;
INSERT INTO `thanksforjob` VALUES (1,'Thanks for applying to job Email-Template V1','<p>Dear ##NAME##,</p>\r\n\r\n<p>Thank you for your interest in the position.</p>\r\n\r\n<p>We received many qualified applications for the position, and the selection was competitive. We congratulate you have been shortlisted for this position.</p>\r\n\r\n<p>For any concern or assistance, please contact support@gmail.com.</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team</p>\r\n',1,'0000-00-00');
/*!40000 ALTER TABLE `thanksforjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanksforjob_fr`
--

DROP TABLE IF EXISTS `thanksforjob_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanksforjob_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanksforjob_fr`
--

LOCK TABLES `thanksforjob_fr` WRITE;
/*!40000 ALTER TABLE `thanksforjob_fr` DISABLE KEYS */;
INSERT INTO `thanksforjob_fr` VALUES (1,'Thanks for applying to job Email-Template V1','<p>Cher &eacute;l&egrave;ve],</p>\r\n\r\n<p>Nous vous remercions de l&#39;int&eacute;r&ecirc;t que vous portez au [Poste] au [Nom de l&#39;employeur] &agrave; [Nom de la ville].</p>\r\n\r\n<p>Nous avons re&ccedil;u de nombreuses demandes qualifi&eacute;es pour le poste et la s&eacute;lection &eacute;tait concurrentielle. Nous vous f&eacute;licitons de votre candidature pour ce poste.</p>\r\n\r\n<p>Nous vous souhaitons bonne chance pour les prochaines &eacute;tapes et nous vous remercions de votre int&eacute;r&ecirc;t pour [Nom de l&#39;employeur] &agrave; [Nom de la ville].</p>\r\n\r\n<p>Pour toute question ou assistance, veuillez contacter support@gmail.com.</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n',1,'0000-00-00');
/*!40000 ALTER TABLE `thanksforjob_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thankyouemail`
--

DROP TABLE IF EXISTS `thankyouemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thankyouemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thankyouemail`
--

LOCK TABLES `thankyouemail` WRITE;
/*!40000 ALTER TABLE `thankyouemail` DISABLE KEYS */;
INSERT INTO `thankyouemail` VALUES (1,'Thank You Email-Template','<p>Hello ##NAME##,</p>\r\n\r\n<p>Thank you for creating a job for users. We have enjoyed working with you. We appreciate the time you took to create a job. &nbsp;</p>\r\n\r\n<p>We shall inform you if there would be any potential lead for this job post. We look forward to working with you.</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team&nbsp;</p>\r\n',1,'2016-12-30');
/*!40000 ALTER TABLE `thankyouemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thankyouemail_fr`
--

DROP TABLE IF EXISTS `thankyouemail_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thankyouemail_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamplate_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thankyouemail_fr`
--

LOCK TABLES `thankyouemail_fr` WRITE;
/*!40000 ALTER TABLE `thankyouemail_fr` DISABLE KEYS */;
INSERT INTO `thankyouemail_fr` VALUES (1,'Thank You Email-Template V1','<p>Bonjour ##NAME##</p>\r\n\r\n<p>Merci de cr&eacute;er un emploi pour les &eacute;tudiants. Nous avons appr&eacute;ci&eacute; travailler avec vous. Nous appr&eacute;cions le temps que vous avez pris pour cr&eacute;er un emploi.</p>\r\n\r\n<p>Nous vous informerons s&#39;il y a un potentiel potentiel pour ce poste. Nous avons h&acirc;te de travailler avec vous.</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n',1,'2016-12-30'),(2,'Thank You Email-Template V2','<p>contrnt</p>\r\n',0,'2017-01-05'),(3,'fghdfgh','<p>fghdgh</p>\r\n',0,'2017-01-05');
/*!40000 ALTER TABLE `thankyouemail_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unreadmessages`
--

DROP TABLE IF EXISTS `unreadmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unreadmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unreadmessages`
--

LOCK TABLES `unreadmessages` WRITE;
/*!40000 ALTER TABLE `unreadmessages` DISABLE KEYS */;
INSERT INTO `unreadmessages` VALUES (1,'Unread Messages Email-Template V1','<p><img src=\"http://52.10.110.240/admin/img/logo.png\" style=\"display:block; margin:0 auto\" /></p>\r\n\r\n<p>Hello ##NAME##,</p>\r\n\r\n<p>You have unread messages about the internship ##INTERNSHIPNAME##.<br />\r\n<br />\r\nKindly check your inbox.</p>\r\n\r\n<p><a href=\"http://52.10.110.240/user/user-company-msg\" style=\" background: rgba(0, 0, 0, 0) linear-gradient(#0dbcc2, #00aec7) repeat scroll 0 0; border: medium none;  border-radius: 25px;  clear: both;  color: #fff;  display: block; font-family: \'RobotoRegular\',Arial; font-size: 21px; font-weight: 700; margin: 40px auto; padding: 30px 35px; text-align: center; text-decoration: none; text-transform: uppercase; width: 250px;\">View inbox</a></p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `unreadmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unreadmessages_fr`
--

DROP TABLE IF EXISTS `unreadmessages_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unreadmessages_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unreadmessages_fr`
--

LOCK TABLES `unreadmessages_fr` WRITE;
/*!40000 ALTER TABLE `unreadmessages_fr` DISABLE KEYS */;
INSERT INTO `unreadmessages_fr` VALUES (1,'Unread Messages Email-Template V1','<p><img src=\"http://52.10.110.240/admin/img/logo.png\" style=\"display:block; margin:0 auto\" /></p>\r\n\r\n<p>Bonjour ##NAME##,</p>\r\n\r\n<p>Vous avez des messages non lus sur le stage ##INTERNSHIPNAME##.<br />\r\n<br />\r\nVeuillez v&eacute;rifier votre bo&icirc;te de r&eacute;cepion.</p>\r\n\r\n<p><a href=\"http://52.10.110.240/user/user-company-msg\" style=\" background: rgba(0, 0, 0, 0) linear-gradient(#0dbcc2, #00aec7) repeat scroll 0 0; border: medium none;  border-radius: 25px;  clear: both;  color: #fff;  display: block; font-family: \'RobotoRegular\',Arial; font-size: 21px; font-weight: 700; margin: 40px auto; padding: 30px 35px; text-align: center; text-decoration: none; text-transform: uppercase; width: 250px;\">VIEW INBOX</a></p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `unreadmessages_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fb_id` varchar(200) DEFAULT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'jagroop',NULL,'6BjZ7-1LOC8vh_y3BziYPkUg58LzhTWw','$2y$13$MKQh4GgN7mArs8G6LMkiP.aUJBjTLXscakxxw.ZF1MCV/RWNXMZWO',NULL,'jagroop@yopmail.com',10,1490953949,1490953949),(23,'becomejobowner',NULL,'btrRGrnppyFlvqfW0l5Dn-ok5UxbPMaf','$2y$13$it/jU3fc.ZRWr35TdWnc5e.zvkQeTSt35RfPSJlV6r6oQx80c98D.',NULL,'becomejobowner@mailinator.com',10,1490954030,1490954030),(24,'markweb',NULL,'JtFddhYYexDw99rvTdWOKTtyDPTg78RJ','$2y$13$WLBTNFRMbuF2OEY/dCpbwOMcpj9ekjp.x2D9X3HGgKJWHiHbWntsW',NULL,'markweb@yopmail.com',10,1490954337,1490954337),(25,'student',NULL,'ie3Q3uz9iRqxfp8A-RbwfH4kMSp_CfUk','$2y$13$/HABmP8XMJn/tvnL51L6XO2lNd2NbnPH/zLcuqGNyer4VIOVQw75i',NULL,'student@yopmail.com',10,1490955061,1490955061),(36,'admin',NULL,'sQVPKvVJ6QXm59mvuZbh-MgisJRRX_HR','$2y$13$it/jU3fc.ZRWr35TdWnc5e.zvkQeTSt35RfPSJlV6r6oQx80c98D.',NULL,'admin@localhost.com',10,1437125592,1491485849);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(250) DEFAULT NULL,
  `address_line_1` varchar(150) DEFAULT NULL,
  `address_line_2` varchar(150) DEFAULT NULL,
  `address_line_3` varchar(150) DEFAULT NULL,
  `pincode` varchar(25) DEFAULT NULL,
  `latitude` decimal(10,3) unsigned NOT NULL,
  `longitude` decimal(10,3) unsigned NOT NULL,
  `is_primary` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (22,NULL,NULL,NULL,NULL,'K9J7M3',0.000,0.000,1),(25,NULL,NULL,NULL,NULL,'10110',0.000,0.000,1),(65,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(68,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(69,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(70,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(71,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(72,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(73,'1','nagpuer','nagpuer','nagpuer','442200',0.000,0.000,NULL),(74,'1','nagpuer kdhfsdh','nagpuer kdhfsdh','nagpuer kdhfsdh','455566',0.000,0.000,NULL),(123,'408 U.S. 1, Attleboro, MA, United States','35, Lokhand nagar','35, Lokhand nagar','35, Lokhand nagar',NULL,0.000,0.000,NULL),(124,'4',NULL,NULL,NULL,NULL,0.000,0.000,NULL),(134,'4',NULL,NULL,NULL,NULL,0.000,0.000,NULL),(135,'4',NULL,NULL,NULL,NULL,0.000,0.000,NULL),(143,'4',NULL,NULL,NULL,NULL,0.000,0.000,NULL),(146,'North Carolina, United States','35, Lokhand nagar','35, Lokhand nagar','35, Lokhand nagar',NULL,0.000,0.000,NULL),(200,'','','','',NULL,0.000,0.000,NULL),(220,NULL,NULL,NULL,NULL,'123456',0.000,0.000,1),(221,NULL,NULL,NULL,NULL,'123456',0.000,0.000,1),(222,NULL,NULL,NULL,NULL,'123456',0.000,0.000,1),(223,NULL,NULL,NULL,NULL,'Tester100',0.000,0.000,1),(224,NULL,NULL,NULL,NULL,'123456',0.000,0.000,1),(226,NULL,NULL,NULL,NULL,'147852',0.000,0.000,1),(227,NULL,NULL,NULL,NULL,'147852',0.000,0.000,1),(228,NULL,NULL,NULL,NULL,'147852',0.000,0.000,1),(229,NULL,NULL,NULL,NULL,'10004',0.000,0.000,1),(230,NULL,NULL,NULL,NULL,'10005',0.000,0.000,1),(231,NULL,NULL,NULL,NULL,'400022',0.000,0.000,1),(232,NULL,NULL,NULL,NULL,'400022',0.000,0.000,1),(233,NULL,NULL,NULL,NULL,'400022',0.000,0.000,1);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ads`
--

DROP TABLE IF EXISTS `user_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ads` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `duration_id` int(10) unsigned NOT NULL COMMENT 'In days',
  `link` varchar(255) DEFAULT NULL,
  `position` enum('left','right','top') DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `user_id` (`user_id`),
  KEY `duration_id` (`duration_id`),
  CONSTRAINT `user_ads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ads_ibfk_2` FOREIGN KEY (`duration_id`) REFERENCES `core_ads_duration` (`duration_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ads`
--

LOCK TABLES `user_ads` WRITE;
/*!40000 ALTER TABLE `user_ads` DISABLE KEYS */;
INSERT INTO `user_ads` VALUES (1,193,'Top Banner for test','Top Banner for test Top Banner for test Top Banner for test Top Banner for test','',1,'','top',NULL);
/*!40000 ALTER TABLE `user_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company`
--

DROP TABLE IF EXISTS `user_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `manager_name` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `cover_photo` varchar(250) DEFAULT NULL,
  `description` text,
  `location` varchar(250) DEFAULT NULL,
  `company_website` varchar(250) DEFAULT NULL,
  `googleplusUrl` varchar(500) NOT NULL,
  `googleplusName` varchar(500) NOT NULL,
  `is_free` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `name` (`name`),
  CONSTRAINT `user_company_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company`
--

LOCK TABLES `user_company` WRITE;
/*!40000 ALTER TABLE `user_company` DISABLE KEYS */;
INSERT INTO `user_company` VALUES (23,'Skyline','Rozer','n/e/w/new.jpeg',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.Asdrg</p>\r\n','Sector 20, Panchkula','http://job.alkurn.net/','','',NULL),(24,'Oblivion','John Doe','I/m/a/g/e/-/F/i/Image-File-Size.jpg',NULL,NULL,NULL,NULL,'','',NULL);
/*!40000 ALTER TABLE `user_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_images`
--

DROP TABLE IF EXISTS `user_company_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_images` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `image` varchar(200) NOT NULL,
  `order_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_company_images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_images`
--

LOCK TABLES `user_company_images` WRITE;
/*!40000 ALTER TABLE `user_company_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_msg`
--

DROP TABLE IF EXISTS `user_company_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_msg` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned NOT NULL DEFAULT '1',
  `identifier` varchar(25) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `subject` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `videolink` varchar(250) NOT NULL,
  `status` enum('Read','UnRead','Delete','Span','Archived','Deleted') NOT NULL DEFAULT 'Read',
  `from_del` bigint(100) NOT NULL DEFAULT '0',
  `to_del` bigint(100) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`,`seq`) USING BTREE,
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `user_company_msg_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `user_company` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_company_msg_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_company_msg_ibfk_3` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_msg`
--

LOCK TABLES `user_company_msg` WRITE;
/*!40000 ALTER TABLE `user_company_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_msg_attachments`
--

DROP TABLE IF EXISTS `user_company_msg_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_msg_attachments` (
  `attachment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `attachment` varchar(250) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `message_id` (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `seq` (`seq`),
  CONSTRAINT `user_company_msg_attachments_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `user_company_msg` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_company_msg_attachments_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_msg_attachments`
--

LOCK TABLES `user_company_msg_attachments` WRITE;
/*!40000 ALTER TABLE `user_company_msg_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_msg_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_msg_recipients`
--

DROP TABLE IF EXISTS `user_company_msg_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_msg_recipients` (
  `message_id` int(11) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `recipient_id` int(11) unsigned NOT NULL,
  `status` enum('Read','UnRead','Deleted') NOT NULL DEFAULT 'UnRead',
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`message_id`,`seq`,`recipient_id`),
  KEY `m2r1` (`message_id`,`status`) USING BTREE,
  KEY `m2r2` (`recipient_id`,`status`) USING BTREE,
  CONSTRAINT `user_company_msg_recipients_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `user_company_msg` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_company_msg_recipients_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_msg_recipients`
--

LOCK TABLES `user_company_msg_recipients` WRITE;
/*!40000 ALTER TABLE `user_company_msg_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_msg_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_job_category_mapper`
--

DROP TABLE IF EXISTS `user_job_category_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_job_category_mapper` (
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `user_job_category_mapper_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_job_category_mapper_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_job_category_mapper`
--

LOCK TABLES `user_job_category_mapper` WRITE;
/*!40000 ALTER TABLE `user_job_category_mapper` DISABLE KEYS */;
INSERT INTO `user_job_category_mapper` VALUES (22,1),(25,3);
/*!40000 ALTER TABLE `user_job_category_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_msg`
--

DROP TABLE IF EXISTS `user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_msg` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `sender_id` int(11) unsigned NOT NULL,
  `text` text,
  `category` enum('None','Alert','Notification','Email','Attachment') NOT NULL DEFAULT 'None',
  `status` enum('Read','UnRead','Deleted','Span','Archived') NOT NULL DEFAULT 'Read',
  `time` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`,`seq`),
  KEY `sender_id` (`sender_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `user_msg_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_msg_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_msg`
--

LOCK TABLES `user_msg` WRITE;
/*!40000 ALTER TABLE `user_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_msg_recipients`
--

DROP TABLE IF EXISTS `user_msg_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_msg_recipients` (
  `message_id` int(11) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `recipient_id` int(11) unsigned NOT NULL,
  `status` enum('Read','UnRead','Deleted') NOT NULL DEFAULT 'UnRead',
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`message_id`,`seq`,`recipient_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `conversation_id` (`message_id`),
  CONSTRAINT `user_msg_recipients_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `user_msg` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_msg_recipients_ibfk_3` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_msg_recipients`
--

LOCK TABLES `user_msg_recipients` WRITE;
/*!40000 ALTER TABLE `user_msg_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_msg_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_news`
--

DROP TABLE IF EXISTS `user_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` tinyint(3) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_news`
--

LOCK TABLES `user_news` WRITE;
/*!40000 ALTER TABLE `user_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_news_fr`
--

DROP TABLE IF EXISTS `user_news_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_news_fr` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text,
  PRIMARY KEY (`news_id`),
  CONSTRAINT `user_news_fr_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `user_news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_news_fr`
--

LOCK TABLES `user_news_fr` WRITE;
/*!40000 ALTER TABLE `user_news_fr` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_news_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `sender_id` int(11) unsigned NOT NULL,
  `text` text,
  `ip` varchar(30) NOT NULL,
  `category` enum('Alert','Notification','Email') NOT NULL DEFAULT 'Email',
  `status` enum('Read','UnRead','Deleted','Span','Archived') NOT NULL DEFAULT 'Read',
  `time` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_item` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_recipients`
--

DROP TABLE IF EXISTS `user_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification_recipients` (
  `message_id` int(11) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `recipient_id` int(11) unsigned NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `status` enum('Read','UnRead','Deleted') NOT NULL DEFAULT 'UnRead',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`seq`,`recipient_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `conversation_id` (`message_id`),
  CONSTRAINT `user_notification_recipients_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `user_notification` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_notification_recipients_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_recipients`
--

LOCK TABLES `user_notification_recipients` WRITE;
/*!40000 ALTER TABLE `user_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(25) NOT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `cover_photo` varchar(250) DEFAULT NULL,
  `full_name` varchar(200) NOT NULL,
  `gender` enum('None','Male','Female') NOT NULL DEFAULT 'None',
  `dob` datetime DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `is_free` tinyint(4) DEFAULT NULL,
  `is_subscriber` tinyint(4) DEFAULT NULL,
  `about_us` text,
  `joining_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `avatar_id` (`avatar`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (22,'0',NULL,NULL,'Jagroop Singh','None',NULL,'','',0,1,'','2017-03-31 09:52:29'),(23,'0',NULL,NULL,'','None',NULL,'','',0,1,'','2017-03-31 09:53:50'),(24,'0',NULL,NULL,'','None',NULL,'','',0,1,'','2017-03-31 09:58:57'),(25,'0',NULL,NULL,'BecomeStudent','None',NULL,'','',0,1,'','2017-03-31 10:11:01');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_social`
--

DROP TABLE IF EXISTS `user_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_social` (
  `user_id` int(10) unsigned NOT NULL,
  `network_id` int(10) unsigned NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `access_key` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`network_id`),
  KEY `user_id` (`user_id`,`network_id`),
  KEY `network_id` (`network_id`),
  CONSTRAINT `user_social_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_social_ibfk_2` FOREIGN KEY (`network_id`) REFERENCES `core_social_network` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_social`
--

LOCK TABLES `user_social` WRITE;
/*!40000 ALTER TABLE `user_social` DISABLE KEYS */;
INSERT INTO `user_social` VALUES (23,1,'Facebook','http://facebook.com',NULL),(23,2,'LinkedIn','http://linkedin.com',NULL);
/*!40000 ALTER TABLE `user_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscription`
--

DROP TABLE IF EXISTS `user_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscription`
--

LOCK TABLES `user_subscription` WRITE;
/*!40000 ALTER TABLE `user_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscription_fr`
--

DROP TABLE IF EXISTS `user_subscription_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscription_fr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_subscription_fr_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_subscription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscription_fr`
--

LOCK TABLES `user_subscription_fr` WRITE;
/*!40000 ALTER TABLE `user_subscription_fr` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subscription_fr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscription_mapper`
--

DROP TABLE IF EXISTS `user_subscription_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscription_mapper` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  UNIQUE KEY `subscription_id` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscription_mapper`
--

LOCK TABLES `user_subscription_mapper` WRITE;
/*!40000 ALTER TABLE `user_subscription_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subscription_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcomeboard`
--

DROP TABLE IF EXISTS `welcomeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welcomeboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcomeboard`
--

LOCK TABLES `welcomeboard` WRITE;
/*!40000 ALTER TABLE `welcomeboard` DISABLE KEYS */;
INSERT INTO `welcomeboard` VALUES (2,'Welcome on Board-Template V1','<p>Hi ##NAME##,</p>\r\n\r\n<p>We are pleased to welcome you as the newest member in KIOUI Team. We hope you will find work/ internships here rewarding and challenging.&nbsp;<br />\r\nWe are all working for a common goal and your contribution is integral.&nbsp;<br />\r\nYou can speak and express yourself openly in the event of any problem. Once again thank you for joining KIOUI.</p>\r\n\r\n<p>Thanks &amp; Regards,</p>\r\n\r\n<p>KIOUI Team</p>\r\n',1,'2017-01-02');
/*!40000 ALTER TABLE `welcomeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcomeboard_fr`
--

DROP TABLE IF EXISTS `welcomeboard_fr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welcomeboard_fr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` text NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcomeboard_fr`
--

LOCK TABLES `welcomeboard_fr` WRITE;
/*!40000 ALTER TABLE `welcomeboard_fr` DISABLE KEYS */;
INSERT INTO `welcomeboard_fr` VALUES (2,'Welcome on Board-Template V1','<p>Salut ##NAME##,</p>\r\n\r\n<p>Nous sommes heureux de vous accueillir comme nouveau membre de KIOUI Team. Nous esp&eacute;rons que vous trouverez ici des stages et des stages enrichissants et stimulants. Nous travaillons tous pour un objectif commun et votre contribution est int&eacute;grale. Vous pouvez parler et vous exprimer ouvertement en cas de probl&egrave;me. Encore une fois merci de vous joindre &agrave; Kioui.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci et salutations,</p>\r\n\r\n<p>&Eacute;quipe KIOUI</p>\r\n','1','2017-01-02');
/*!40000 ALTER TABLE `welcomeboard_fr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-26 17:17:56
