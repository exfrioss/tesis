CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `idauditoria` int(11) NOT NULL AUTO_INCREMENT,
  `oldUsuario` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `evento` varchar(45) DEFAULT NULL,
  `usuarioDB` varchar(45) DEFAULT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idauditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (130,NULL,'moeka@kiryu.com','2019-11-20 12:58:04','Login',NULL,'SESSION'),(131,NULL,'moeka@kiryu.com','2019-11-20 12:58:04','Login',NULL,'SESSION'),(132,NULL,'moeka@kiryu.com','2019-11-20 12:59:47','INSERT','root@localhost','EMPLEADO'),(133,NULL,'moeka@kiryu.com','2019-11-20 13:23:59','Login',NULL,'SESSION'),(134,NULL,'moeka@kiryu.com','2019-11-20 13:24:00','Login',NULL,'SESSION'),(135,NULL,'moeka@kiryu.com','2019-11-20 13:27:38','INSERT','root@localhost','PROVEEDOR'),(136,NULL,'moeka@kiryu.com','2019-11-20 13:45:53','Login',NULL,'SESSION'),(137,NULL,'moeka@kiryu.com','2019-11-20 13:45:53','Login',NULL,'SESSION'),(138,NULL,'moeka@kiryu.com','2019-11-20 13:47:14','INSERT','root@localhost','CARGO'),(139,NULL,'moeka@kiryu.com','2019-11-20 15:37:05','Login',NULL,'SESSION'),(140,NULL,'moeka@kiryu.com','2019-11-20 15:37:07','Login',NULL,'SESSION'),(141,NULL,'moeka@kiryu.com','2019-11-20 15:37:38','INSERT','root@localhost','INSUMO'),(142,NULL,'moeka@kiryu.com','2019-11-20 16:19:16','Login',NULL,'SESSION'),(143,NULL,'moeka@kiryu.com','2019-11-20 16:19:17','Login',NULL,'SESSION'),(144,NULL,'moeka@kiryu.com','2019-11-20 16:21:37','Login',NULL,'SESSION'),(145,NULL,'moeka@kiryu.com','2019-11-20 16:21:38','Login',NULL,'SESSION'),(146,NULL,'moeka@kiryu.com','2019-11-20 16:21:56','Login',NULL,'SESSION'),(147,NULL,'moeka@kiryu.com','2019-11-20 16:21:56','Login',NULL,'SESSION'),(148,NULL,'moeka@kiryu.com','2019-11-20 16:23:45','Login',NULL,'SESSION'),(149,NULL,'moeka@kiryu.com','2019-11-20 16:23:45','Login',NULL,'SESSION'),(150,NULL,'moeka@kiryu.com','2019-11-20 16:24:46','Login',NULL,'SESSION'),(151,NULL,'moeka@kiryu.com','2019-11-20 16:24:46','Login',NULL,'SESSION'),(152,NULL,'moeka@kiryu.com','2019-11-20 16:25:48','Login',NULL,'SESSION'),(153,NULL,'moeka@kiryu.com','2019-11-20 16:25:48','Login',NULL,'SESSION'),(154,NULL,'moeka@kiryu.com','2019-11-20 16:26:30','Login',NULL,'SESSION'),(155,NULL,'moeka@kiryu.com','2019-11-20 16:26:31','Login',NULL,'SESSION'),(156,NULL,'moeka@kiryu.com','2019-11-20 16:28:07','Login',NULL,'SESSION'),(157,NULL,'moeka@kiryu.com','2019-11-20 16:28:07','Login',NULL,'SESSION'),(158,NULL,'moeka@kiryu.com','2019-11-20 17:13:04','INSERT','root@localhost','PEDIDO'),(159,NULL,'moeka@kiryu.com','2019-11-20 17:20:00','Login',NULL,'SESSION'),(160,NULL,'moeka@kiryu.com','2019-11-20 17:20:00','Login',NULL,'SESSION'),(161,'moeka@kiryu.com','moeka@kiryu.com','2019-11-20 17:24:37','UPDATE','root@localhost','PEDIDO'),(162,NULL,'moeka@kiryu.com','2019-11-20 22:20:48','Login',NULL,'SESSION'),(163,NULL,'moeka@kiryu.com','2019-11-20 22:20:48','Login',NULL,'SESSION'),(164,NULL,'moeka@kiryu.com','2019-11-21 00:12:35','Login',NULL,'SESSION'),(165,NULL,'moeka@kiryu.com','2019-11-21 00:12:35','Login',NULL,'SESSION'),(166,NULL,'moeka@kiryu.com','2019-11-21 00:15:45','Login',NULL,'SESSION'),(167,NULL,'moeka@kiryu.com','2019-11-21 00:15:45','Login',NULL,'SESSION'),(168,NULL,'moeka@kiryu.com','2019-11-21 00:22:55','Login',NULL,'SESSION'),(169,NULL,'moeka@kiryu.com','2019-11-21 00:22:56','Login',NULL,'SESSION'),(170,NULL,'moeka@kiryu.com','2019-11-21 01:09:10','Login',NULL,'SESSION'),(171,NULL,'moeka@kiryu.com','2019-11-21 01:09:10','Login',NULL,'SESSION'),(172,NULL,'moeka@kiryu.com','2019-11-21 01:15:56','Login',NULL,'SESSION'),(173,NULL,'moeka@kiryu.com','2019-11-21 01:15:56','Login',NULL,'SESSION'),(174,NULL,'moeka@kiryu.com','2019-11-21 02:07:48','Login',NULL,'SESSION'),(175,NULL,'moeka@kiryu.com','2019-11-21 02:07:49','Login',NULL,'SESSION'),(176,NULL,'moeka@kiryu.com','2019-11-21 10:39:41','Login',NULL,'SESSION'),(177,NULL,'moeka@kiryu.com','2019-11-21 10:39:42','Login',NULL,'SESSION'),(178,NULL,NULL,'2019-11-21 12:10:16','DELETE','root@localhost','CLIENTE'),(179,NULL,'yoshimura@anteiku.com','2019-11-21 12:11:40','Login',NULL,'SESSION'),(180,NULL,'yoshimura@anteiku.com','2019-11-21 12:11:41','Login',NULL,'SESSION'),(181,NULL,'yoshimura@anteiku.com','2019-11-21 13:54:00','Login',NULL,'SESSION'),(182,NULL,'yoshimura@anteiku.com','2019-11-21 13:54:02','Login',NULL,'SESSION'),(183,NULL,'yoshimura@anteiku.com','2019-11-21 14:10:44','Login',NULL,'SESSION'),(184,NULL,'yoshimura@anteiku.com','2019-11-21 14:10:44','Login',NULL,'SESSION'),(185,NULL,'yoshimura@anteiku.com','2019-11-21 14:20:05','Login',NULL,'SESSION'),(186,NULL,'yoshimura@anteiku.com','2019-11-21 14:20:05','Login',NULL,'SESSION'),(187,NULL,'yoshimura@anteiku.com','2019-11-22 10:10:51','Login',NULL,'SESSION'),(188,NULL,'yoshimura@anteiku.com','2019-11-22 10:10:51','Login',NULL,'SESSION'),(189,NULL,'yoshimura@anteiku.com','2019-11-22 10:43:46','Login',NULL,'SESSION'),(190,NULL,'yoshimura@anteiku.com','2019-11-22 10:43:47','Login',NULL,'SESSION'),(191,NULL,'yoshimura@anteiku.com','2019-11-22 10:44:50','Login',NULL,'SESSION'),(192,NULL,'yoshimura@anteiku.com','2019-11-22 10:44:50','Login',NULL,'SESSION'),(193,NULL,'yoshimura@anteiku.com','2019-11-22 10:45:51','Login',NULL,'SESSION'),(194,NULL,'yoshimura@anteiku.com','2019-11-22 10:45:53','Login',NULL,'SESSION'),(195,NULL,'yoshimura@anteiku.com','2019-11-22 10:50:39','Login',NULL,'SESSION'),(196,NULL,'yoshimura@anteiku.com','2019-11-22 10:50:40','Login',NULL,'SESSION'),(197,NULL,'yoshimura@anteiku.com','2019-11-22 10:55:51','Login',NULL,'SESSION'),(198,NULL,'yoshimura@anteiku.com','2019-11-22 10:55:52','Login',NULL,'SESSION'),(199,NULL,'yoshimura@anteiku.com','2019-11-22 11:00:10','Login',NULL,'SESSION'),(200,NULL,'yoshimura@anteiku.com','2019-11-22 11:00:12','Login',NULL,'SESSION'),(201,NULL,'yoshimura@anteiku.com','2019-11-22 11:01:49','Login',NULL,'SESSION'),(202,NULL,'yoshimura@anteiku.com','2019-11-22 11:01:52','Login',NULL,'SESSION'),(203,NULL,'yoshimura@anteiku.com','2019-11-22 11:04:01','Login',NULL,'SESSION'),(204,NULL,'yoshimura@anteiku.com','2019-11-22 11:04:02','Login',NULL,'SESSION'),(205,NULL,'yoshimura@anteiku.com','2019-11-22 11:04:46','Login',NULL,'SESSION'),(206,NULL,'yoshimura@anteiku.com','2019-11-22 11:04:47','Login',NULL,'SESSION'),(207,NULL,'yoshimura@anteiku.com','2019-11-22 11:07:02','Login',NULL,'SESSION'),(208,NULL,'yoshimura@anteiku.com','2019-11-22 11:07:02','Login',NULL,'SESSION'),(209,NULL,'yoshimura@anteiku.com','2019-11-22 11:08:54','Login',NULL,'SESSION'),(210,NULL,'yoshimura@anteiku.com','2019-11-22 11:08:56','Login',NULL,'SESSION'),(211,NULL,'yoshimura@anteiku.com','2019-11-22 11:09:38','Login',NULL,'SESSION'),(212,NULL,'yoshimura@anteiku.com','2019-11-22 11:09:38','Login',NULL,'SESSION'),(213,NULL,'yoshimura@anteiku.com','2019-11-22 11:10:17','Login',NULL,'SESSION'),(214,NULL,'yoshimura@anteiku.com','2019-11-22 11:10:17','Login',NULL,'SESSION'),(215,NULL,'yoshimura@anteiku.com','2019-11-22 11:10:59','Login',NULL,'SESSION'),(216,NULL,'yoshimura@anteiku.com','2019-11-22 11:11:00','Login',NULL,'SESSION'),(217,NULL,'yoshimura@anteiku.com','2019-11-22 11:11:49','Login',NULL,'SESSION'),(218,NULL,'yoshimura@anteiku.com','2019-11-22 11:11:49','Login',NULL,'SESSION'),(219,NULL,'yoshimura@anteiku.com','2019-11-22 11:13:17','Login',NULL,'SESSION'),(220,NULL,'yoshimura@anteiku.com','2019-11-22 11:13:18','Login',NULL,'SESSION'),(221,NULL,'yoshimura@anteiku.com','2019-11-22 11:23:26','Login',NULL,'SESSION'),(222,NULL,'yoshimura@anteiku.com','2019-11-22 11:23:26','Login',NULL,'SESSION'),(223,NULL,'yoshimura@anteiku.com','2019-11-22 11:23:40','Login',NULL,'SESSION'),(224,NULL,'yoshimura@anteiku.com','2019-11-22 11:26:40','Login',NULL,'SESSION'),(225,NULL,'yoshimura@anteiku.com','2019-11-22 11:26:40','Login',NULL,'SESSION'),(226,NULL,'yoshimura@anteiku.com','2019-11-22 11:27:56','Login',NULL,'SESSION'),(227,NULL,'yoshimura@anteiku.com','2019-11-22 11:27:56','Login',NULL,'SESSION'),(228,NULL,'yoshimura@anteiku.com','2019-11-22 11:34:41','Login',NULL,'SESSION'),(229,NULL,'yoshimura@anteiku.com','2019-11-22 11:34:41','Login',NULL,'SESSION'),(230,NULL,'yoshimura@anteiku.com','2019-11-22 11:41:55','Login',NULL,'SESSION'),(231,NULL,'yoshimura@anteiku.com','2019-11-22 11:41:56','Login',NULL,'SESSION'),(232,NULL,'yoshimura@anteiku.com','2019-11-22 11:42:48','Login',NULL,'SESSION'),(233,NULL,'yoshimura@anteiku.com','2019-11-22 11:42:48','Login',NULL,'SESSION'),(234,NULL,'yoshimura@anteiku.com','2019-11-22 11:45:29','Login',NULL,'SESSION'),(235,NULL,'yoshimura@anteiku.com','2019-11-22 11:45:30','Login',NULL,'SESSION'),(236,NULL,'yoshimura@anteiku.com','2019-11-22 11:46:22','Login',NULL,'SESSION'),(237,NULL,'yoshimura@anteiku.com','2019-11-22 11:46:23','Login',NULL,'SESSION'),(238,NULL,'moeka@kiryu.com','2019-11-22 11:47:36','Login',NULL,'SESSION'),(239,NULL,'moeka@kiryu.com','2019-11-22 11:47:38','Login',NULL,'SESSION'),(240,'moeka@kiryu.com','moeka@kiryu.com','2019-11-22 11:48:51','UPDATE','root@localhost','DEPARTAMENTO'),(241,NULL,'moeka@kiryu.com','2019-11-22 12:42:12','Login',NULL,'SESSION'),(242,NULL,'moeka@kiryu.com','2019-11-22 12:42:12','Login',NULL,'SESSION'),(243,'moeka@kiryu.com','moeka@kiryu.com','2019-11-22 12:44:07','UPDATE','root@localhost','CIUDAD'),(244,'moeka@kiryu.com','moeka@kiryu.com','2019-11-22 12:45:47','UPDATE','root@localhost','CIUDAD'),(245,'moeka@kiryu.com','moeka@kiryu.com','2019-11-22 12:47:29','UPDATE','root@localhost','CIUDAD'),(246,'moeka@kiryu.com','moeka@kiryu.com','2019-11-22 12:49:11','UPDATE','root@localhost','CIUDAD'),(247,NULL,'moeka@kiryu.com','2019-11-22 12:53:39','Login',NULL,'SESSION'),(248,NULL,'moeka@kiryu.com','2019-11-22 12:53:41','Login',NULL,'SESSION'),(249,NULL,'moeka@kiryu.com','2019-11-22 13:09:53','Login',NULL,'SESSION'),(250,NULL,'moeka@kiryu.com','2019-11-22 13:09:53','Login',NULL,'SESSION'),(251,NULL,'moeka@kiryu.com','2019-11-22 13:12:04','Login',NULL,'SESSION'),(252,NULL,'moeka@kiryu.com','2019-11-22 13:12:04','Login',NULL,'SESSION'),(253,NULL,'moeka@kiryu.com','2019-11-22 13:12:39','Login',NULL,'SESSION'),(254,NULL,'moeka@kiryu.com','2019-11-22 13:12:39','Login',NULL,'SESSION'),(255,NULL,'moeka@kiryu.com','2019-11-22 13:13:27','Login',NULL,'SESSION'),(256,NULL,'moeka@kiryu.com','2019-11-22 13:13:27','Login',NULL,'SESSION'),(257,NULL,'moeka@kiryu.com','2019-11-22 13:16:54','Login',NULL,'SESSION'),(258,NULL,'moeka@kiryu.com','2019-11-22 13:16:55','Login',NULL,'SESSION'),(259,NULL,'moeka@kiryu.com','2019-11-22 13:32:34','Login',NULL,'SESSION'),(260,NULL,'moeka@kiryu.com','2019-11-22 13:32:34','Login',NULL,'SESSION'),(261,NULL,'moeka@kiryu.com','2019-11-22 13:34:26','Login',NULL,'SESSION'),(262,NULL,'moeka@kiryu.com','2019-11-22 13:34:27','Login',NULL,'SESSION'),(263,NULL,'moeka@kiryu.com','2019-11-22 13:34:57','Login',NULL,'SESSION'),(264,NULL,'moeka@kiryu.com','2019-11-22 13:34:58','Login',NULL,'SESSION'),(265,NULL,'moeka@kiryu.com','2019-11-22 13:35:33','Login',NULL,'SESSION'),(266,NULL,'moeka@kiryu.com','2019-11-22 13:35:33','Login',NULL,'SESSION'),(267,NULL,'moeka@kiryu.com','2019-11-22 13:36:32','Login',NULL,'SESSION'),(268,NULL,'moeka@kiryu.com','2019-11-22 13:36:32','Login',NULL,'SESSION'),(269,NULL,'moeka@kiryu.com','2019-11-22 13:37:40','Login',NULL,'SESSION'),(270,NULL,'moeka@kiryu.com','2019-11-22 13:37:40','Login',NULL,'SESSION'),(271,NULL,'moeka@kiryu.com','2019-11-22 13:41:01','Login',NULL,'SESSION'),(272,NULL,'moeka@kiryu.com','2019-11-22 13:41:01','Login',NULL,'SESSION'),(273,NULL,'moeka@kiryu.com','2019-11-22 13:41:41','Login',NULL,'SESSION'),(274,NULL,'moeka@kiryu.com','2019-11-22 13:41:42','Login',NULL,'SESSION'),(275,NULL,'moeka@kiryu.com','2019-11-22 20:11:08','Login',NULL,'SESSION'),(276,NULL,'moeka@kiryu.com','2019-11-22 20:11:08','Login',NULL,'SESSION'),(277,NULL,'moeka@kiryu.com','2019-11-22 20:22:34','Login',NULL,'SESSION'),(278,NULL,'moeka@kiryu.com','2019-11-22 20:22:34','Login',NULL,'SESSION'),(279,NULL,'moeka@kiryu.com','2019-11-22 20:23:11','Login',NULL,'SESSION'),(280,NULL,'moeka@kiryu.com','2019-11-22 20:23:11','Login',NULL,'SESSION'),(281,NULL,'moeka@kiryu.com','2019-11-22 20:25:16','Login',NULL,'SESSION'),(282,NULL,'moeka@kiryu.com','2019-11-22 20:25:16','Login',NULL,'SESSION'),(283,NULL,'moeka@kiryu.com','2019-11-22 20:41:22','Login',NULL,'SESSION'),(284,NULL,'moeka@kiryu.com','2019-11-22 20:41:22','Login',NULL,'SESSION'),(285,NULL,'moeka@kiryu.com','2019-11-22 20:47:12','Login',NULL,'SESSION'),(286,NULL,'moeka@kiryu.com','2019-11-22 20:47:12','Login',NULL,'SESSION'),(287,NULL,'moeka@kiryu.com','2019-11-22 20:55:43','Login',NULL,'SESSION'),(288,NULL,'moeka@kiryu.com','2019-11-22 20:55:44','Login',NULL,'SESSION'),(289,NULL,'moeka@kiryu.com','2019-11-22 20:56:25','Login',NULL,'SESSION'),(290,NULL,'moeka@kiryu.com','2019-11-22 20:56:26','Login',NULL,'SESSION'),(291,NULL,'moeka@kiryu.com','2019-11-22 21:09:34','Login',NULL,'SESSION'),(292,NULL,'moeka@kiryu.com','2019-11-22 21:09:34','Login',NULL,'SESSION'),(293,NULL,'moeka@kiryu.com','2019-11-22 21:24:40','Login',NULL,'SESSION'),(294,NULL,'moeka@kiryu.com','2019-11-22 21:24:40','Login',NULL,'SESSION'),(295,NULL,'moeka@kiryu.com','2019-11-22 22:00:10','Login',NULL,'SESSION'),(296,NULL,'moeka@kiryu.com','2019-11-22 22:00:10','Login',NULL,'SESSION'),(297,NULL,'moeka@kiryu.com','2019-11-22 22:01:02','Login',NULL,'SESSION'),(298,NULL,'moeka@kiryu.com','2019-11-22 22:01:02','Login',NULL,'SESSION'),(299,NULL,'moeka@kiryu.com','2019-11-22 22:02:26','Login',NULL,'SESSION'),(300,NULL,'moeka@kiryu.com','2019-11-22 22:02:26','Login',NULL,'SESSION'),(301,NULL,'moeka@kiryu.com','2019-11-22 22:02:57','Login',NULL,'SESSION'),(302,NULL,'moeka@kiryu.com','2019-11-22 22:02:57','Login',NULL,'SESSION'),(303,NULL,'moeka@kiryu.com','2019-11-22 22:03:07','Login',NULL,'SESSION'),(304,NULL,'moeka@kiryu.com','2019-11-22 22:03:07','Login',NULL,'SESSION'),(305,NULL,'moeka@kiryu.com','2019-11-22 22:03:35','Login',NULL,'SESSION'),(306,NULL,'moeka@kiryu.com','2019-11-22 22:03:35','Login',NULL,'SESSION'),(307,NULL,'moeka@kiryu.com','2019-11-22 22:04:36','Login',NULL,'SESSION'),(308,NULL,'moeka@kiryu.com','2019-11-22 22:04:36','Login',NULL,'SESSION'),(309,NULL,'moeka@kiryu.com','2019-11-22 22:05:01','Login',NULL,'SESSION'),(310,NULL,'moeka@kiryu.com','2019-11-22 22:05:01','Login',NULL,'SESSION'),(311,NULL,'moeka@kiryu.com','2019-11-22 22:31:28','Login',NULL,'SESSION'),(312,NULL,'moeka@kiryu.com','2019-11-22 22:31:29','Login',NULL,'SESSION'),(313,NULL,'moeka@kiryu.com','2019-11-22 22:31:38','Login',NULL,'SESSION'),(314,NULL,'moeka@kiryu.com','2019-11-22 22:31:38','Login',NULL,'SESSION'),(315,NULL,'moeka@kiryu.com','2019-11-22 22:51:14','Login',NULL,'SESSION'),(316,NULL,'moeka@kiryu.com','2019-11-22 22:51:14','Login',NULL,'SESSION'),(317,NULL,'moeka@kiryu.com','2019-11-22 22:53:57','Login',NULL,'SESSION'),(318,NULL,'moeka@kiryu.com','2019-11-22 22:53:57','Login',NULL,'SESSION'),(319,NULL,'moeka@kiryu.com','2019-11-22 23:27:42','Login',NULL,'SESSION'),(320,NULL,'moeka@kiryu.com','2019-11-22 23:27:42','Login',NULL,'SESSION'),(321,NULL,'moeka@kiryu.com','2019-11-22 23:32:31','Login',NULL,'SESSION'),(322,NULL,'moeka@kiryu.com','2019-11-22 23:32:31','Login',NULL,'SESSION'),(323,NULL,'moeka@kiryu.com','2019-11-23 15:04:34','Login',NULL,'SESSION'),(324,NULL,'moeka@kiryu.com','2019-11-23 15:04:36','Login',NULL,'SESSION'),(325,NULL,'moeka@kiryu.com','2019-11-23 15:46:52','Login',NULL,'SESSION'),(326,NULL,'moeka@kiryu.com','2019-11-23 15:46:52','Login',NULL,'SESSION'),(327,NULL,'moeka@kiryu.com','2019-11-23 19:11:03','Login',NULL,'SESSION'),(328,NULL,'moeka@kiryu.com','2019-11-23 19:11:03','Login',NULL,'SESSION'),(329,NULL,'moeka@kiryu.com','2019-11-23 19:12:05','Login',NULL,'SESSION'),(330,NULL,'moeka@kiryu.com','2019-11-23 19:12:05','Login',NULL,'SESSION'),(331,NULL,'moeka@kiryu.com','2019-11-23 19:46:51','Login',NULL,'SESSION'),(332,NULL,'moeka@kiryu.com','2019-11-23 19:46:51','Login',NULL,'SESSION'),(333,NULL,'yoshimura@anteiku.com','2019-11-23 19:49:07','Login',NULL,'SESSION'),(334,NULL,'yoshimura@anteiku.com','2019-11-23 19:49:09','Login',NULL,'SESSION'),(335,NULL,'moeka@kiryu.com','2019-11-23 21:13:40','Login',NULL,'SESSION'),(336,NULL,'moeka@kiryu.com','2019-11-23 21:13:40','Login',NULL,'SESSION'),(337,NULL,'moeka@kiryu.com','2019-11-23 21:23:45','Login',NULL,'SESSION'),(338,NULL,'moeka@kiryu.com','2019-11-23 22:42:42','Login',NULL,'SESSION'),(339,NULL,'moeka@kiryu.com','2019-11-23 22:42:43','Login',NULL,'SESSION'),(340,NULL,'moeka@kiryu.com','2019-11-24 02:17:04','Login',NULL,'SESSION'),(341,NULL,'moeka@kiryu.com','2019-11-24 02:17:04','Login',NULL,'SESSION'),(342,NULL,'moeka@kiryu.com','2019-11-24 02:36:52','Login',NULL,'SESSION'),(343,NULL,'moeka@kiryu.com','2019-11-24 02:36:53','Login',NULL,'SESSION'),(344,NULL,'moeka@kiryu.com','2019-11-24 02:41:43','Login',NULL,'SESSION'),(345,NULL,'moeka@kiryu.com','2019-11-24 02:41:44','Login',NULL,'SESSION'),(346,NULL,'moeka@kiryu.com','2019-11-24 02:45:35','Login',NULL,'SESSION'),(347,NULL,'moeka@kiryu.com','2019-11-24 02:45:35','Login',NULL,'SESSION'),(348,NULL,'moeka@kiryu.com','2019-11-24 03:10:18','Login',NULL,'SESSION'),(349,NULL,'moeka@kiryu.com','2019-11-24 03:10:18','Login',NULL,'SESSION'),(350,NULL,'moeka@kiryu.com','2019-11-24 03:12:36','Login',NULL,'SESSION'),(351,NULL,'moeka@kiryu.com','2019-11-24 03:12:37','Login',NULL,'SESSION'),(352,NULL,'moeka@kiryu.com','2019-11-24 03:27:45','Login',NULL,'SESSION'),(353,NULL,'moeka@kiryu.com','2019-11-24 03:27:45','Login',NULL,'SESSION'),(354,NULL,'moeka@kiryu.com','2019-11-24 03:35:08','Login',NULL,'SESSION'),(355,NULL,'moeka@kiryu.com','2019-11-24 03:35:08','Login',NULL,'SESSION'),(356,NULL,'moeka@kiryu.com','2019-11-24 10:50:26','Login',NULL,'SESSION'),(357,NULL,'moeka@kiryu.com','2019-11-24 10:50:39','Login',NULL,'SESSION'),(358,NULL,'moeka@kiryu.com','2019-11-24 11:00:27','INSERT','root@localhost','SOLICITUD_SERVICIO'),(359,'moeka@kiryu.com','moeka@kiryu.com','2019-11-24 11:00:48','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(360,'moeka@kiryu.com','moeka@kiryu.com','2019-11-24 11:00:48','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(361,'moeka@kiryu.com','moeka@kiryu.com','2019-11-24 11:00:48','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(362,NULL,'moeka@kiryu.com','2019-11-24 11:01:01','INSERT','root@localhost','SOLICITUD_SERVICIO'),(363,NULL,'moeka@kiryu.com','2019-11-24 23:07:59','Login',NULL,'SESSION'),(364,NULL,'moeka@kiryu.com','2019-11-24 23:07:59','Login',NULL,'SESSION'),(365,NULL,'moeka@kiryu.com','2019-11-24 23:08:08','Login',NULL,'SESSION'),(366,NULL,'moeka@kiryu.com','2019-11-24 23:09:30','Login',NULL,'SESSION'),(367,NULL,'moeka@kiryu.com','2019-11-24 23:09:31','Login',NULL,'SESSION'),(368,NULL,'moeka@kiryu.com','2019-11-24 23:18:41','Login',NULL,'SESSION'),(369,NULL,'moeka@kiryu.com','2019-11-24 23:18:42','Login',NULL,'SESSION'),(370,NULL,'moeka@kiryu.com','2019-11-24 23:41:17','Login',NULL,'SESSION'),(371,NULL,'moeka@kiryu.com','2019-11-24 23:41:18','Login',NULL,'SESSION'),(372,NULL,'moeka@kiryu.com','2019-11-25 01:17:30','Login',NULL,'SESSION'),(373,NULL,'moeka@kiryu.com','2019-11-25 01:17:30','Login',NULL,'SESSION'),(374,NULL,'moeka@kiryu.com','2019-11-25 01:49:16','Login',NULL,'SESSION'),(375,NULL,'moeka@kiryu.com','2019-11-25 11:49:41','Login',NULL,'SESSION'),(376,NULL,'moeka@kiryu.com','2019-11-25 11:49:42','Login',NULL,'SESSION'),(377,NULL,'moeka@kiryu.com','2019-11-25 13:43:05','Login',NULL,'SESSION'),(378,NULL,'moeka@kiryu.com','2019-11-25 13:43:05','Login',NULL,'SESSION'),(379,NULL,'moeka@kiryu.com','2019-11-25 13:43:07','Login',NULL,'SESSION'),(380,NULL,'moeka@kiryu.com','2019-11-25 14:46:00','Login',NULL,'SESSION'),(381,NULL,'moeka@kiryu.com','2019-11-25 14:46:00','Login',NULL,'SESSION'),(382,NULL,'moeka@kiryu.com','2019-11-25 16:02:39','INSERT','root@localhost','SOLICITUD_SERVICIO'),(383,'moeka@kiryu.com','moeka@kiryu.com','2019-11-25 16:02:47','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(384,'moeka@kiryu.com','moeka@kiryu.com','2019-11-25 16:02:47','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(385,NULL,'moeka@kiryu.com','2019-11-25 17:26:33','Login',NULL,'SESSION'),(386,NULL,'moeka@kiryu.com','2019-11-25 17:26:34','Login',NULL,'SESSION'),(387,NULL,'moeka@kiryu.com','2019-11-25 18:16:37','Login',NULL,'SESSION'),(388,NULL,'moeka@kiryu.com','2019-11-25 18:16:37','Login',NULL,'SESSION'),(389,NULL,'moeka@kiryu.com','2019-11-25 18:18:18','Login',NULL,'SESSION'),(390,NULL,'moeka@kiryu.com','2019-11-25 18:18:18','Login',NULL,'SESSION'),(391,'moeka@kiryu.com','moeka@kiryu.com','2019-11-25 18:24:06','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(392,NULL,'moeka@kiryu.com','2019-11-25 21:31:44','INSERT','root@localhost','EMPLEADO'),(393,NULL,'[    ]','2019-11-25 22:25:31','Login',NULL,'SESSION'),(394,NULL,'[    ]','2019-11-25 22:25:32','Login',NULL,'SESSION'),(395,NULL,'[    ]','2019-11-25 23:40:11','Login',NULL,'SESSION'),(396,NULL,'[    ]','2019-11-25 23:40:11','Login',NULL,'SESSION'),(397,NULL,'[    ]','2019-11-25 23:40:24','Login',NULL,'SESSION'),(398,NULL,'[    ]','2019-11-25 23:40:24','Login',NULL,'SESSION'),(399,NULL,'[    ]','2019-11-25 23:40:43','Login',NULL,'SESSION'),(400,NULL,'[    ]','2019-11-25 23:40:45','Login',NULL,'SESSION'),(401,NULL,'moeka@kiryu.com','2019-11-25 23:47:48','Login',NULL,'SESSION'),(402,NULL,'moeka@kiryu.com','2019-11-25 23:47:49','Login',NULL,'SESSION'),(403,NULL,'moeka@kiryu.com','2019-11-26 00:06:12','Login',NULL,'SESSION'),(404,NULL,'moeka@kiryu.com','2019-11-26 00:06:12','Login',NULL,'SESSION'),(405,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 00:13:28','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(406,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 00:14:26','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(407,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 00:15:53','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(408,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 00:15:56','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(409,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 00:15:59','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(410,NULL,'moeka@kiryu.com','2019-11-26 00:46:28','Login',NULL,'SESSION'),(411,NULL,'moeka@kiryu.com','2019-11-26 00:46:28','Login',NULL,'SESSION'),(412,NULL,'moeka@kiryu.com','2019-11-26 00:54:29','Login',NULL,'SESSION'),(413,NULL,'moeka@kiryu.com','2019-11-26 00:54:29','Login',NULL,'SESSION'),(414,NULL,'moeka@kiryu.com','2019-11-26 00:55:47','Login',NULL,'SESSION'),(415,NULL,'moeka@kiryu.com','2019-11-26 00:55:47','Login',NULL,'SESSION'),(416,NULL,'moeka@kiryu.com','2019-11-26 00:56:46','Login',NULL,'SESSION'),(417,NULL,'moeka@kiryu.com','2019-11-26 01:07:28','Login',NULL,'SESSION'),(418,NULL,'moeka@kiryu.com','2019-11-26 01:09:20','Login',NULL,'SESSION'),(419,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(420,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(421,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(422,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(423,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(424,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(425,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(426,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(427,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(428,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(429,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(430,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(431,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(432,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(433,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(434,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(435,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(436,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(437,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(438,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(439,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(440,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(441,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(442,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(443,'moeka@kiryu.com',NULL,'2019-11-26 10:48:01','DELETE','root@localhost','SOLICITUD_SERVICIO'),(444,NULL,'moeka@kiryu.com','2019-11-26 10:52:33','INSERT','root@localhost','SOLICITUD_SERVICIO'),(445,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 10:53:09','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(446,'moeka@kiryu.com','moeka@kiryu.com','2019-11-26 10:55:31','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(447,NULL,'moeka@kiryu.com','2019-11-26 11:24:33','Login',NULL,'SESSION'),(448,NULL,'moeka@kiryu.com','2019-11-26 11:25:23','Login',NULL,'SESSION'),(449,NULL,'moeka@kiryu.com','2019-11-26 12:39:06','Login',NULL,'SESSION'),(450,NULL,'moeka@kiryu.com','2019-11-26 13:58:35','Login',NULL,'SESSION'),(451,NULL,'moeka@kiryu.com','2019-11-26 15:08:12','INSERT','root@localhost','AGREGAR TALONARIO'),(452,NULL,'moeka@kiryu.com','2019-11-26 17:50:32','Login',NULL,'SESSION'),(453,NULL,'moeka@kiryu.com','2019-11-26 22:01:53','Login',NULL,'SESSION'),(454,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 00:58:51','UPDATE','root@localhost','TALONARIO'),(455,NULL,'moeka@kiryu.com','2019-11-27 01:00:55','Login',NULL,'SESSION'),(456,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 01:09:46','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(457,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 01:10:22','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(458,NULL,'moeka@kiryu.com','2019-11-27 02:15:34','Login',NULL,'SESSION'),(459,NULL,'moeka@kiryu.com','2019-11-27 02:17:38','Login',NULL,'SESSION'),(460,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 02:17:57','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(461,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 02:22:09','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(462,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 02:23:25','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(463,NULL,'moeka@kiryu.com','2019-11-27 02:27:51','Login',NULL,'SESSION'),(464,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 02:28:10','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(465,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 02:35:16','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(466,NULL,'moeka@kiryu.com','2019-11-27 07:42:54','Login',NULL,'SESSION'),(467,NULL,'moeka@kiryu.com','2019-11-27 08:39:28','Login',NULL,'SESSION'),(468,NULL,'moeka@kiryu.com','2019-11-27 09:01:08','Login',NULL,'SESSION'),(469,NULL,'moeka@kiryu.com','2019-11-27 09:23:02','Login',NULL,'SESSION'),(470,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 09:40:43','UPDATE','root@localhost','TALONARIO'),(471,NULL,'moeka@kiryu.com','2019-11-27 10:46:23','Login',NULL,'SESSION'),(472,NULL,'moeka@kiryu.com','2019-11-27 10:48:36','Login',NULL,'SESSION'),(473,NULL,'moeka@kiryu.com','2019-11-27 10:50:30','Login',NULL,'SESSION'),(476,NULL,'moeka@kiryu.com','2019-11-27 11:16:05','INSERT','root@localhost','GENERAR FACTURA_CLIENTE'),(477,NULL,'moeka@kiryu.com','2019-11-27 11:30:11','Login',NULL,'SESSION'),(478,NULL,'moeka@kiryu.com','2019-11-27 11:37:32','INSERT','root@localhost','GENERAR FACTURA_CLIENTE'),(479,'moeka@kiryu.com','moeka@kiryu.com','2019-11-27 11:37:32','UPDATE','root@localhost','SOLICITUD_SERVICIO'),(480,NULL,NULL,'2019-11-27 12:22:23','UPDATE','root@localhost','INSUMO'),(481,NULL,'moeka@kiryu.com','2019-11-27 16:15:24','Login',NULL,'SESSION'),(482,NULL,'moeka@kiryu.com','2019-11-27 16:15:24','Login',NULL,'SESSION'),(483,NULL,'moeka@kiryu.com','2019-11-27 16:29:03','Login',NULL,'SESSION'),(484,NULL,'moeka@kiryu.com','2019-11-27 16:34:03','Login',NULL,'SESSION'),(485,NULL,'moeka@kiryu.com','2019-11-27 16:34:42','Login',NULL,'SESSION'),(486,NULL,'moeka@kiryu.com','2019-11-27 16:46:38','Login',NULL,'SESSION'),(487,NULL,'moeka@kiryu.com','2019-11-27 16:47:54','Login',NULL,'SESSION'),(488,NULL,'moeka@kiryu.com','2019-11-27 16:49:23','Login',NULL,'SESSION'),(489,NULL,'moeka@kiryu.com','2019-11-27 16:49:24','Login',NULL,'SESSION'),(490,NULL,'moeka@kiryu.com','2019-11-27 16:52:51','Login',NULL,'SESSION'),(491,NULL,'moeka@kiryu.com','2019-11-27 16:54:20','Login',NULL,'SESSION'),(492,NULL,'moeka@kiryu.com','2019-11-27 16:54:21','Login',NULL,'SESSION'),(493,NULL,'moeka@kiryu.com','2019-11-27 16:55:41','Login',NULL,'SESSION'),(494,NULL,'moeka@kiryu.com','2019-11-27 16:55:41','Login',NULL,'SESSION'),(495,NULL,'moeka@kiryu.com','2019-11-27 17:22:00','Login',NULL,'SESSION'),(496,NULL,'moeka@kiryu.com','2019-11-27 17:25:29','Login',NULL,'SESSION'),(497,NULL,'moeka@kiryu.com','2019-11-27 17:28:40','Login',NULL,'SESSION'),(498,NULL,'moeka@kiryu.com','2019-11-27 17:28:42','Login',NULL,'SESSION'),(499,NULL,'moeka@kiryu.com','2019-11-27 17:43:44','Login',NULL,'SESSION'),(500,NULL,'moeka@kiryu.com','2019-11-27 17:43:44','Login',NULL,'SESSION'),(501,NULL,'moeka@kiryu.com','2019-11-27 17:44:30','Login',NULL,'SESSION'),(502,NULL,'moeka@kiryu.com','2019-11-27 17:45:55','Login',NULL,'SESSION'),(503,NULL,'moeka@kiryu.com','2019-11-27 17:46:31','Login',NULL,'SESSION'),(504,NULL,'moeka@kiryu.com','2019-11-27 17:49:06','Login',NULL,'SESSION'),(505,NULL,'moeka@kiryu.com','2019-11-27 17:49:07','Login',NULL,'SESSION'),(506,NULL,'moeka@kiryu.com','2019-11-27 17:50:30','Login',NULL,'SESSION'),(507,NULL,'moeka@kiryu.com','2019-11-27 17:53:44','Login',NULL,'SESSION'),(508,NULL,'moeka@kiryu.com','2019-11-27 17:54:38','Login',NULL,'SESSION'),(509,NULL,'moeka@kiryu.com','2019-11-27 17:58:43','Login',NULL,'SESSION');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `codcargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Administradora',0,NULL),(2,'Gerente',1,NULL),(3,'Chofer',1,'moeka@kiryu.com'),(4,'CAJERO',1,'moeka@kiryu.com');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaCargo
BEFORE INSERT ON mydb.cargo
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "CARGO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaCargo
BEFORE UPDATE ON mydb.cargo
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "CARGO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaCargo
BEFORE DELETE ON mydb.cargo
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "CARGO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `codciudad` char(10) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `departamento_coddepa` char(5) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codciudad`,`departamento_coddepa`),
  KEY `fk_ciudad_departamento1_idx` (`departamento_coddepa`),
  CONSTRAINT `fk_ciudad_departamento1` FOREIGN KEY (`departamento_coddepa`) REFERENCES `departamento` (`coddepa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('001','NEW Ajos',0,'05','moeka@kiryu.com'),('002','NEW Santani',0,'04','moeka@kiryu.com'),('003','NEW DOCENTE',1,'05','003'),('004','NEW Villarrica',1,'04','yoshimura@anteiku.com'),('005','Coronel Oviedo',1,'05',NULL),('33','NEW CIUDAD',1,'01','moeka@kiryu.com');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaCiudad
before insert on mydb.ciudad
for each row
BEGIN 
    INSERT INTO mydb.auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "CIUDAD");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaCiudad
before update on mydb.ciudad
for each row
BEGIN
	INSERT INTO mydb.auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (OLD.usuario, new.usuario, "UPDATE", current_user(), "CIUDAD");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaCiudad
before delete on mydb.ciudad
for each row
BEGIN
	INSERT INTO mydb.auditoria(oldUsuario, evento, usuarioDB, tabla) values (OLD.usuario, "DELETE", current_user(), "CIUDAD");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ci_numero` char(15) CHARACTER SET cp1250 NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ultima` date DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `ciudad_codciudad` char(10) NOT NULL,
  `isUsuario` tinyint(4) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ci_numero`,`ciudad_codciudad`),
  KEY `fk_cliente_ciudad1_idx` (`ciudad_codciudad`),
  CONSTRAINT `fk_cliente_ciudad1` FOREIGN KEY (`ciudad_codciudad`) REFERENCES `ciudad` (`codciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('0000001','Eto','Yoshimura','Arbol Aogiri','0981000001','yoshimura@eto.com','1','F','2019-11-06','2019-11-06','2031-10-19',0,'12345678','005',0,NULL),('454656','Okabe','Rintaro','Coronel Oviedo','09867415','rintaro@okabe.com','4','M','2019-11-07','2019-11-06','2005-11-19',1,'123456','002',0,NULL),('5005937','Fredy','Rios','Pedro Juan caballero c/ tacuary','0986741950','exfrioss@gmail.com','8','M','2005-11-19','1990-12-26','2005-11-19',1,NULL,'005',NULL,NULL),('9874125','Yato','Noragami','everywhere','985741222','yato@noragami.com','6','M','2019-11-06','2019-11-06','2006-11-19',1,'123456','005',1,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaCliente
BEFORE INSERT ON mydb.cliente
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "CLIENTE");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaCliente
BEFORE UPDATE ON mydb.cliente
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "CLIENTE");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaCliente
BEFORE DELETE ON mydb.cliente
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "CLIENTE");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `numero_factura` char(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total_pago` float DEFAULT NULL,
  `proveedor_codproveedor` char(15) NOT NULL,
  `pedido_cod_pedido` int(11) NOT NULL,
  `anulado` tinyint(4) DEFAULT '0',
  `empleado_cod_empleado` int(11) NOT NULL,
  PRIMARY KEY (`numero_factura`,`proveedor_codproveedor`,`pedido_cod_pedido`,`empleado_cod_empleado`),
  KEY `fk_compra_proveedor1_idx` (`proveedor_codproveedor`),
  KEY `fk_compra_pedido1_idx` (`pedido_cod_pedido`),
  KEY `fk_compra_empleado1_idx` (`empleado_cod_empleado`),
  CONSTRAINT `fk_compra_empleado1` FOREIGN KEY (`empleado_cod_empleado`) REFERENCES `empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_pedido1` FOREIGN KEY (`pedido_cod_pedido`) REFERENCES `pedido` (`cod_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`proveedor_codproveedor`) REFERENCES `proveedor` (`codproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('123456','2019-11-10',926320,'2',56,1,1),('1234567','2019-11-10',596000,'2',57,1,1),('123456789','2019-11-10',596000,'2',57,0,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `coddepa` char(5) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `region_codregion` char(1) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coddepa`,`region_codregion`),
  KEY `fk_departamento_region_idx` (`region_codregion`),
  CONSTRAINT `fk_departamento_region` FOREIGN KEY (`region_codregion`) REFERENCES `region` (`codregion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('01','Concepción',1,'1',NULL),('02','San Pedro',1,'1',NULL),('03','Cordillera',1,'1',NULL),('04','Guaira',1,'1',NULL),('05','Caaguazu',1,'1',NULL),('06','Caazapa',1,'1',NULL),('07','Encarnación',1,'1',NULL),('08','San Juan Bautista',1,'1',NULL),('09','Paraguari',1,'1',NULL),('10','Ciudad Del Este',1,'1',NULL),('11','Aregua',1,'1','moeka@kiryu.com'),('12','Pilar',1,'1',NULL),('13','Pedro Juan Caballero',1,'1',NULL),('14','Saltos de Guaira',1,'1',NULL),('15','Benjamin Aceval',1,'1',NULL),('16','Mariscal Estigarribia',1,'1',NULL),('17','Fuerte olimpo',1,'1',NULL),('18','ASADAS',1,'2','moeka@kiryu.com');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaDepartamento
BEFORE INSERT ON mydb.departamento
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "DEPARTAMENTO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaDepartamento
BEFORE UPDATE ON mydb.departamento
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "DEPARTAMENTO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaDepartamento
BEFORE DELETE ON mydb.departamento
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "DEPARTAMENTO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `compra_numero_factura` char(45) NOT NULL,
  `insumo_cod_insumo` char(15) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `iva5` float DEFAULT NULL,
  `iva10` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  PRIMARY KEY (`compra_numero_factura`,`insumo_cod_insumo`),
  KEY `fk_compra_has_insumo_insumo1_idx` (`insumo_cod_insumo`),
  KEY `fk_compra_has_insumo_compra1_idx` (`compra_numero_factura`),
  CONSTRAINT `fk_compra_has_insumo_compra1` FOREIGN KEY (`compra_numero_factura`) REFERENCES `compra` (`numero_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_insumo_insumo1` FOREIGN KEY (`insumo_cod_insumo`) REFERENCES `insumo` (`cod_insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES ('123456','001',3,5000,0,1363.64,15000),('123456','002',2,5660,0,0,11320),('123456','003',3,300000,0,0,900000),('1234567','001',6,5000,0,2727.27,30000),('1234567','002',100,5660,0,0,566000),('123456789','001',6,5000,0,2727.27,30000),('123456789','002',100,5660,0,0,566000);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_insumo_servicio`
--

DROP TABLE IF EXISTS `detalle_insumo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_insumo_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insumo_cod_insumo` char(15) NOT NULL,
  `servicio_cod_servicio` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cantidad` float DEFAULT '0',
  `precio` float DEFAULT '0',
  `total` float DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_insumo_has_servicio_servicio1_idx` (`servicio_cod_servicio`),
  KEY `fk_insumo_has_servicio_insumo1_idx` (`insumo_cod_insumo`),
  CONSTRAINT `fk_insumo_has_servicio_insumo1` FOREIGN KEY (`insumo_cod_insumo`) REFERENCES `insumo` (`cod_insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_has_servicio_servicio1` FOREIGN KEY (`servicio_cod_servicio`) REFERENCES `servicio` (`cod_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_insumo_servicio`
--

LOCK TABLES `detalle_insumo_servicio` WRITE;
/*!40000 ALTER TABLE `detalle_insumo_servicio` DISABLE KEYS */;
INSERT INTO `detalle_insumo_servicio` VALUES (1,'002',2,'Combustible',2,5660,11320,'2019-11-13 07:05:50'),(2,'003',2,'Viatico',1,300000,300000,'2019-11-13 07:05:50'),(3,'002',2,'Combustible',1,5660,5660,'2019-11-13 07:05:50'),(4,'003',2,'Viatico',3,300000,900000,'2019-11-13 07:05:50'),(5,'003',2,'Viatico',2,300000,600000,'2019-11-13 07:05:50'),(6,'002',2,'Combustible',3,5660,16980,'2019-11-13 07:05:50'),(7,'001',2,'Té',6,5000,30000,'2019-11-13 07:05:50'),(8,'003',2,'Viatico',2,300000,600000,'2019-11-13 07:05:50'),(9,'002',2,'Combustible',2,5660,11320,'2019-11-13 07:05:50'),(10,'003',2,'Viatico',2,300000,600000,'2019-11-13 07:05:50'),(11,'002',2,'Combustible',1,5660,5660,'2019-11-13 07:05:50'),(12,'002',2,'Combustible',1,5660,5660,'2019-11-13 07:05:50'),(13,'003',2,'Viatico',3,300000,900000,'2019-11-13 07:05:50'),(14,'002',2,'Combustible',6,5660,33960,'2019-11-13 07:05:50'),(15,'001',2,'Té',5,5000,25000,'2019-11-13 07:05:50'),(16,'003',2,'Viatico',3,300000,900000,'2019-11-13 07:05:50'),(17,'002',2,'Combustible',100,5660,566000,'2019-11-13 07:05:50'),(18,'002',2,'Combustible',2,5660,11320,'2019-11-13 07:05:50'),(19,'002',2,'Combustible',6,5660,33960,'2019-11-13 07:05:50'),(20,'002',2,'Combustible',2,5660,11320,'2019-11-13 07:05:50'),(21,'001',2,'Té',10,5000,50000,'2019-11-13 07:05:50'),(22,'002',2,'Combustible',2,5660,11320,'2019-11-13 07:06:10'),(23,'002',2,'Combustible',5,5660,28300,'2019-11-13 20:54:10'),(24,'002',4,'Combustible',100,5660,566000,'2019-11-27 15:22:23'),(25,'123',4,'Prueba',20,5560,111200,'2019-11-27 15:22:23'),(26,'003',4,'Viatico',30,300000,9000000,'2019-11-27 15:22:23');
/*!40000 ALTER TABLE `detalle_insumo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `insumo_cod_insumo` char(15) NOT NULL,
  `pedido_cod_pedido` int(11) NOT NULL,
  `cantidad` float DEFAULT '0',
  `precio_unitario` float DEFAULT '0',
  `subtotal` float DEFAULT '0',
  `cantidad_comprada` float DEFAULT '0',
  PRIMARY KEY (`insumo_cod_insumo`,`pedido_cod_pedido`),
  KEY `fk_pedido_has_insumo_insumo1_idx` (`insumo_cod_insumo`),
  KEY `fk_pedido_has_insumo_pedido1_idx` (`pedido_cod_pedido`),
  CONSTRAINT `fk_pedido_has_insumo_insumo1` FOREIGN KEY (`insumo_cod_insumo`) REFERENCES `insumo` (`cod_insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_insumo_pedido1` FOREIGN KEY (`pedido_cod_pedido`) REFERENCES `pedido` (`cod_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES ('001',56,3,5000,15000,0),('001',57,6,5000,30000,6),('001',58,4,5660,22640,0),('002',56,2,5660,11320,0),('002',57,100,5660,566000,100),('002',58,2,5660,11320,0),('002',59,2,5660,11320,0),('003',56,3,300000,900000,0),('123',59,12,5560,66720,0);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido_servicio`
--

DROP TABLE IF EXISTS `detalle_pedido_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido_servicio` (
  `pedidosClientes_cod_pedidos` int(11) NOT NULL,
  `servicio_cod_servicio` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `peso_inicial` varchar(45) DEFAULT NULL,
  `peso_fin` varchar(45) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `cantidad_kilomentros` float DEFAULT NULL,
  `diferencia_peso` float DEFAULT NULL,
  PRIMARY KEY (`pedidosClientes_cod_pedidos`,`servicio_cod_servicio`),
  KEY `fk_pedidosClientes_has_servicio_servicio1_idx` (`servicio_cod_servicio`),
  KEY `fk_pedidosClientes_has_servicio_pedidosClientes1_idx` (`pedidosClientes_cod_pedidos`),
  CONSTRAINT `fk_pedidosClientes_has_servicio_pedidosClientes1` FOREIGN KEY (`pedidosClientes_cod_pedidos`) REFERENCES `orden_servicio` (`cod_pedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidosClientes_has_servicio_servicio1` FOREIGN KEY (`servicio_cod_servicio`) REFERENCES `servicio` (`cod_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido_servicio`
--

LOCK TABLES `detalle_pedido_servicio` WRITE;
/*!40000 ALTER TABLE `detalle_pedido_servicio` DISABLE KEYS */;
INSERT INTO `detalle_pedido_servicio` VALUES (38,4,1,385000,'25000','25000',9625000000,NULL,200);
/*!40000 ALTER TABLE `detalle_pedido_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_servicio_factura`
--

DROP TABLE IF EXISTS `detalle_servicio_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_servicio_factura` (
  `factura_cliente_numero_factura` char(45) NOT NULL,
  `servicio_cod_servicio` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `peso_inicial` float DEFAULT NULL,
  `peso_final` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `cantidad_kilomentros` float DEFAULT NULL,
  `diferencia_peso` float DEFAULT NULL,
  `iva5` float DEFAULT NULL,
  `IVA10` float DEFAULT NULL,
  PRIMARY KEY (`factura_cliente_numero_factura`,`servicio_cod_servicio`),
  KEY `fk_servicio_has_factura_cliente_factura_cliente1_idx` (`factura_cliente_numero_factura`),
  KEY `fk_servicio_has_factura_cliente_servicio1_idx` (`servicio_cod_servicio`),
  CONSTRAINT `fk_servicio_has_factura_cliente_factura_cliente1` FOREIGN KEY (`factura_cliente_numero_factura`) REFERENCES `factura_cliente` (`numero_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_factura_cliente_servicio1` FOREIGN KEY (`servicio_cod_servicio`) REFERENCES `servicio` (`cod_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_servicio_factura`
--

LOCK TABLES `detalle_servicio_factura` WRITE;
/*!40000 ALTER TABLE `detalle_servicio_factura` DISABLE KEYS */;
INSERT INTO `detalle_servicio_factura` VALUES ('001-001 80',4,385000,25000,25000,9625000000,1,0,200,0,875000000);
/*!40000 ALTER TABLE `detalle_servicio_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `cod_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_ultima` date NOT NULL,
  `ciudad_codciudad` char(10) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `password` varchar(250) DEFAULT NULL,
  `cargo_codcargo` int(11) NOT NULL,
  `isUsuario` tinyint(4) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`,`ciudad_codciudad`,`cargo_codcargo`),
  KEY `fk_proveedor_ciudad1_idx` (`ciudad_codciudad`),
  KEY `fk_emnpleado_cargo1_idx` (`cargo_codcargo`),
  CONSTRAINT `fk_emnpleado_cargo1` FOREIGN KEY (`cargo_codcargo`) REFERENCES `cargo` (`codcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedor_ciudad10` FOREIGN KEY (`ciudad_codciudad`) REFERENCES `ciudad` (`codciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'0000002-2','Kuze','Yoshimura','Anteiku','yoshimura@anteiku.com','0981000002','2019-10-02','2031-10-19','2031-10-19','004',0,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',2,1,'F','moeka@kiryu.com'),(2,'5005933-5','Suzuha','Amane','el futuro','suzuha@amane.com','0986547121','2022-02-01','2006-11-19','2006-11-19','005',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,0,'F','moeka@kiryu.com'),(3,'6541234-9','Faris','NyanNyan','NyanNyan burguer','faris@NyanNyan.com','032147895','2017-12-03','2006-11-19','2006-11-19','004',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,0,'F',NULL),(4,'6321547-41','Moeka','Kiryū','Fututro','moeka@kiryu.com','0321456987','2020-02-01','2006-11-19','2006-11-19','004',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,1,'F',NULL),(5,'669666','FFFFFF','AAAAAA','aasasa','aas@dd.com','032145698','2019-11-01','2006-11-19','2006-11-19','005',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,1,'F',NULL),(7,'5005937-8','Fredy','Rios','Pedro jua caballero c/ tacuery','exfrioss@gmail.com','0986741950','2019-11-07','2019-11-07','2007-11-19','005',0,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,0,'M',NULL),(8,'654785','Frios','Santacruz','Pedro Juan Caballero C/ tacuary','exfrioss@gmail.com','0986741950','2019-03-04','2019-11-01','2008-11-19','005',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,1,'M',NULL),(9,'5005932-9','Fredy','Rios','Pedro Juan Caballero C/ tacuary','[    ]','0986741950','2019-03-04','2019-11-01','2008-11-19','003',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,1,'F',NULL),(10,'4545454-4','xxxxxxxxxxxxx','xxxxxxxxxxxxxxxxx','xxxxxxxxxxxxx','xxxxxxxxxxxxxx','xxxxxxxxxxxxxx','2017-11-29','2019-11-03','2008-11-19','001',1,'sha256$R6MGsCxw$1b70ccd645b1668e72ffca72ae7209d479efd1062d2bdc4b585ead57111e7929',1,1,'M',NULL),(11,'6520-54','Sultano','Gomez','xxxxxxxxxxxxxx','sincorreo@gmail.com','098675xxxxxx','1992-01-01','2019-11-08','2008-11-19','001',1,'sha256$najjlaBu$3d6ef0da552de07b23a4548fb725490bf32ccc977378bce5d29d026eff933a1c',1,0,'F',NULL),(12,'15454545','frioss','frioss','frioss','frioss@gmail.com','02150465411','1990-12-26','2019-11-01','2020-11-19','005',1,'sha256$P5S6EWHO$f5cfb7462ba3c8c7832dde3380eb4e3c2b92159e16c9b65c80ebd2daaecb7aab',1,0,'M','undefined'),(13,'232323','sasdasas','3232323','adsdsds','dsdsd@as.com','6456456645','2019-11-01','2019-11-01','2020-11-19','002',1,'sha256$nYpMsgNg$a51fe5d075608a6873d04a37a1ec816660c4ee9a14cb38ff17c63e3860a7a195',2,0,'F','undefined'),(14,'123456-8','frioss','frioss','frioss','frioss@frioss.com','098741236','1990-12-26','1990-12-20','2020-11-19','005',1,'sha256$foktXVTg$33d6cd1b91a34ba6b8f2d66f39fbeffafc468a89cf102dbbbcdf0ad2d2200672',1,0,'M','moeka@kiryu.com'),(15,'1234567-8','Juan ','Chofer','Coronel Oviedo','juanchofer@gmail.com','0985221365','1990-05-16','2019-11-01','2025-11-19','004',1,'sha256$N8AqiAGM$f1034e14c34de0133f3a0085f428a1e14b99883ee40ea5321289c1fd46ab295b',3,0,'M','moeka@kiryu.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaEmpleado
BEFORE INSERT ON mydb.empleado
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "EMPLEADO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaEmpleado
BEFORE UPDATE ON mydb.empleado
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "EMPLEADO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factura_cliente`
--

DROP TABLE IF EXISTS `factura_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_cliente` (
  `numero_factura` char(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `anulado` varchar(45) DEFAULT NULL,
  `chofer_id` varchar(45) DEFAULT NULL,
  `cliente_ci_numero` char(15) CHARACTER SET cp1250 NOT NULL,
  `empleado_cod_empleado` int(11) NOT NULL,
  `orden_servicio_cod_pedidos` int(11) NOT NULL,
  `talonario_idtalonario` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`numero_factura`,`cliente_ci_numero`,`empleado_cod_empleado`,`orden_servicio_cod_pedidos`),
  KEY `fk_factura_cliente_cliente1_idx` (`cliente_ci_numero`),
  KEY `fk_factura_cliente_empleado1_idx` (`empleado_cod_empleado`),
  KEY `fk_factura_cliente_orden_servicio1_idx` (`orden_servicio_cod_pedidos`),
  KEY `fk_factura_cliente_talonario1_idx` (`talonario_idtalonario`),
  CONSTRAINT `fk_factura_cliente_empleado1` FOREIGN KEY (`empleado_cod_empleado`) REFERENCES `empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_cliente_orden_servicio1` FOREIGN KEY (`orden_servicio_cod_pedidos`) REFERENCES `orden_servicio` (`cod_pedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_cliente_talonario1` FOREIGN KEY (`talonario_idtalonario`) REFERENCES `talonario` (`idtalonario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_cliente`
--

LOCK TABLES `factura_cliente` WRITE;
/*!40000 ALTER TABLE `factura_cliente` DISABLE KEYS */;
INSERT INTO `factura_cliente` VALUES ('001-001 80','2019-11-27','0','0','15','5005937',4,38,8,'moeka@kiryu.com',9625000000);
/*!40000 ALTER TABLE `factura_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaFacturaCliente
BEFORE INSERT ON mydb.factura_cliente
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "GENERAR FACTURA_CLIENTE");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `cod_insumo` char(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `stock_ideal` float DEFAULT NULL,
  `stock_actual` float DEFAULT NULL,
  `stock_minimo` float DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES ('001','Té',5000,10,20,79,10,1,NULL),('002','Combustible',5660,0,100,67,60,1,NULL),('003','Viatico',300000,0,0,54,0,1,NULL),('123','Prueba',5560,10,30,0,10,1,'moeka@kiryu.com');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaInsumo
BEFORE INSERT ON mydb.insumo
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "INSUMO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaInsumo
BEFORE UPDATE ON mydb.insumo
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "INSUMO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaInsumo
BEFORE DELETE ON mydb.insumo
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "INSUMO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `codmarca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`codmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'ToeAnimation',1),(2,'Matiris',0),(3,'Youtube',1),(4,'Nissan',1),(5,'Sparker',1),(6,'Entropy',1),(7,'Base base',1),(8,'Huawei',1),(9,'Huawei',1),(10,'Samsung',1),(11,'Zapatillas',1),(12,'Huynday',1);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `codModelo` int(11) NOT NULL AUTO_INCREMENT,
  `anio` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`codModelo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'2012','Samsung',1),(2,'2019','Budweiser 66',1),(3,'2016','Hyundai Asumido',1),(4,'0981000001','Yoshimura',1),(5,'2020','New Model Avantasia',1);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_servicio` (
  `cod_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pedidos` date DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `anulado` tinyint(4) DEFAULT '0',
  `cliente_ci_numero` char(15) CHARACTER SET cp1250 NOT NULL,
  `empleado_cod_empleado` int(11) NOT NULL,
  `chofer_id_chofer` varchar(45) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `archivo_salida` varchar(45) DEFAULT NULL,
  `archivo_llegada` varchar(45) DEFAULT NULL,
  `isWeb` tinyint(4) DEFAULT '0',
  `esConfirmado` tinyint(4) DEFAULT '0',
  `usuario` varchar(45) DEFAULT NULL,
  `isfacturado` tinyint(4) DEFAULT '0',
  `total` float DEFAULT NULL,
  PRIMARY KEY (`cod_pedidos`,`cliente_ci_numero`,`empleado_cod_empleado`),
  KEY `fk_pedidosClientes_cliente1_idx` (`cliente_ci_numero`),
  KEY `fk_pedidosClientes_empleado1_idx` (`empleado_cod_empleado`),
  CONSTRAINT `fk_pedidosClientes_cliente1` FOREIGN KEY (`cliente_ci_numero`) REFERENCES `cliente` (`ci_numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidosClientes_empleado1` FOREIGN KEY (`empleado_cod_empleado`) REFERENCES `empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (38,'2019-11-26',1,0,'5005937',4,'15',NULL,'2019-11-26',NULL,NULL,0,1,'moeka@kiryu.com',1,9625000000);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaOrdenServicio
BEFORE INSERT ON mydb.orden_servicio
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "SOLICITUD_SERVICIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaOrdenServicio
BEFORE UPDATE ON mydb.orden_servicio
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "SOLICITUD_SERVICIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaORDENSERVICIO
BEFORE DELETE ON mydb.orden_servicio
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "SOLICITUD_SERVICIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `origen_destino`
--

DROP TABLE IF EXISTS `origen_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origen_destino` (
  `idorigen_destino` int(11) NOT NULL AUTO_INCREMENT,
  `localOrigen` varchar(45) DEFAULT NULL,
  `localDestino` varchar(45) DEFAULT NULL,
  `idciudadOrigen` varchar(45) DEFAULT NULL,
  `idCiudadDestino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorigen_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origen_destino`
--

LOCK TABLES `origen_destino` WRITE;
/*!40000 ALTER TABLE `origen_destino` DISABLE KEYS */;
INSERT INTO `origen_destino` VALUES (1,'Sojera Coronel Oviedo','Sojera Villarrica','005','004');
/*!40000 ALTER TABLE `origen_destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `cod_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `total_pago` float DEFAULT NULL,
  `anulado` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `proveedor_codproveedor` char(15) NOT NULL,
  `empleado_cod_empleado` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pedido`,`proveedor_codproveedor`,`empleado_cod_empleado`),
  KEY `fk_pedido_proveedor1_idx` (`proveedor_codproveedor`),
  KEY `fk_pedido_emnpleado1_idx` (`empleado_cod_empleado`),
  CONSTRAINT `fk_pedido_emnpleado1` FOREIGN KEY (`empleado_cod_empleado`) REFERENCES `empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_proveedor1` FOREIGN KEY (`proveedor_codproveedor`) REFERENCES `proveedor` (`codproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (56,'2019-11-10',NULL,926320,1,0,'2',1,NULL),(57,'2019-11-10',NULL,596000,0,1,'2',1,NULL),(58,'2019-11-12',NULL,56600,1,0,'2',1,NULL),(59,'2019-11-20',NULL,78040,1,0,'2365412',4,'moeka@kiryu.com');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaPedido
BEFORE INSERT ON mydb.pedido
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "PEDIDO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaPedido
BEFORE UPDATE ON mydb.pedido
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "PEDIDO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaPedido
BEFORE DELETE ON mydb.pedido
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "PEDIDO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `codproveedor` char(15) NOT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `razon_social` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_ultima` date DEFAULT NULL,
  `nombre_contacto` varchar(45) DEFAULT NULL,
  `telefono_contacto` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `ciudad_codciudad` char(10) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codproveedor`,`ciudad_codciudad`),
  KEY `fk_proveedor_ciudad1_idx` (`ciudad_codciudad`),
  CONSTRAINT `fk_proveedor_ciudad1` FOREIGN KEY (`ciudad_codciudad`) REFERENCES `ciudad` (`codciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('0000004','4','uta','HySy ArtMask Studio','0981000005','uta@HySy.com','2019-10-01','2031-10-19','uta','0981000004',1,'004',NULL),('2','5','Steins Gate','Steins Gate','0981000007','kurisu@makise.com','2019-11-03','2002-11-19','Kurisu Makise','09810000006',1,'005',NULL),('2365412','8','Prueba','Coronel oviedo','0985212478','prueba@prueba.com','2019-11-21','2020-11-19','Prueba','098524511',1,'005','moeka@kiryu.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaProveedor
BEFORE INSERT ON mydb.proveedor
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "PROVEEDOR");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaProveedor
BEFORE UPDATE ON mydb.proveedor
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "PROVEEDOR");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaProveedor
BEFORE DELETE ON mydb.proveedor
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "PROVEEDOR");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `codregion` char(1) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codregion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('1','Orientales',1,NULL),('2','Occidental',1,NULL),('3','NEW REGIÓN ',1,'moeka@kiryu.com');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaRegion
before insert on mydb.region
for each row
BEGIN 
    INSERT INTO mydb.auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "REGION");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaRegion
before update on mydb.region
for each row
BEGIN
	INSERT INTO mydb.auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (OLD.usuario, new.usuario, "UPDATE", current_user(), "REGION");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaRegion
before delete on mydb.region
for each row
BEGIN
	INSERT INTO mydb.auditoria(oldUsuario, evento, usuarioDB, tabla) values (OLD.usuario, "DELETE", current_user(), "REGION");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguro` (
  `numero_contrato` char(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`numero_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES ('987412563','Seguro anti choque','2019-11-03','2020-12-12','56000',1);
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `cod_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `vehiculo_cod_vehiculo` char(30) NOT NULL,
  `lugarCarga` varchar(45) DEFAULT NULL,
  `lugarDestino` varchar(45) DEFAULT NULL,
  `idciudadOrigen` varchar(45) DEFAULT NULL,
  `idCiudadDestino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_servicio`,`vehiculo_cod_vehiculo`),
  KEY `fk_servicio_vehiculo1_idx` (`vehiculo_cod_vehiculo`),
  CONSTRAINT `fk_servicio_vehiculo1` FOREIGN KEY (`vehiculo_cod_vehiculo`) REFERENCES `vehiculo` (`cod_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (2,'Carga de Granos de soja',90,5,1,'6544AGKJS','DAP-ISLA YOBAI','ANTEQUERA','005','004'),(3,'Otro Servicios',1000,10,1,'6544AGKJS','BLABLA','BLANLA','005','002'),(4,'Prueba02',385000,10,1,'6544AGKJS','Azucena D','PASOYOBAY D','004','003');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talonario`
--

DROP TABLE IF EXISTS `talonario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talonario` (
  `idtalonario` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(4) DEFAULT NULL,
  `cod_establecimiento` varchar(255) DEFAULT NULL,
  `inicio_vigencia` date DEFAULT NULL,
  `fin_vigencia` date DEFAULT NULL,
  `nro_inicio` int(11) DEFAULT NULL,
  `nro_actual` int(11) DEFAULT NULL,
  `nro_fin` int(11) DEFAULT NULL,
  `timbrado` int(11) DEFAULT NULL,
  `usuario` varchar(95) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtalonario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talonario`
--

LOCK TABLES `talonario` WRITE;
/*!40000 ALTER TABLE `talonario` DISABLE KEYS */;
INSERT INTO `talonario` VALUES (8,1,'001-001','2019-02-18','2020-02-29',51,80,100,13246023,'moeka@kiryu.com','5005937-8'),(9,0,'002-002','2019-04-02','2020-04-29',50,60,100,123456203,'moeka@kiryu.com',NULL);
/*!40000 ALTER TABLE `talonario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_auditoriaTalonario
BEFORE INSERT ON mydb.talonario
FOR EACH ROW
BEGIN
	insert into auditoria(usuario, evento, usuarioDB, tabla) values (new.usuario, "INSERT", current_user(), "AGREGAR TALONARIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_update_auditoriaTalonario
BEFORE UPDATE ON mydb.talonario
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, usuario, evento, usuarioDB, tabla) values (old.usuario, new.usuario, "UPDATE", current_user(), "TALONARIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mydb.tg_delete_auditoriaTalonario
BEFORE DELETE ON mydb.talonario
FOR EACH ROW
BEGIN
	insert into auditoria(oldUsuario, evento, usuarioDB, tabla) values (old.usuario, "DELETE", current_user(), "TALONARIO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculo` (
  `idtipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `peso_neto` float DEFAULT NULL,
  `isAsociado` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  PRIMARY KEY (`idtipo_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES (1,'Doble cabina',5200,1,1,22),(2,'Carga Pesada',5320,0,1,22),(3,'Carga Liviana soja',6520,0,1,30),(4,NULL,NULL,NULL,NULL,15);
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `cod_vehiculo` char(30) NOT NULL,
  `chasis` varchar(120) DEFAULT NULL,
  `nroMotor` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `tipo_vehiculo_idtipo_vehiculo` int(11) NOT NULL,
  `modelo_codModelo` int(11) NOT NULL,
  `marca_codmarca` int(11) NOT NULL,
  `seguro_numero_contrato` char(45) NOT NULL,
  PRIMARY KEY (`cod_vehiculo`,`tipo_vehiculo_idtipo_vehiculo`,`modelo_codModelo`,`marca_codmarca`,`seguro_numero_contrato`),
  KEY `fk_vehiculo_tipo_vehiculo1_idx` (`tipo_vehiculo_idtipo_vehiculo`),
  KEY `fk_vehiculo_modelo1_idx` (`modelo_codModelo`),
  KEY `fk_vehiculo_marca1_idx` (`marca_codmarca`),
  KEY `fk_vehiculo_seguro1_idx` (`seguro_numero_contrato`),
  CONSTRAINT `fk_vehiculo_marca1` FOREIGN KEY (`marca_codmarca`) REFERENCES `marca` (`codmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_modelo1` FOREIGN KEY (`modelo_codModelo`) REFERENCES `modelo` (`codModelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_seguro1` FOREIGN KEY (`seguro_numero_contrato`) REFERENCES `seguro` (`numero_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_idtipo_vehiculo`) REFERENCES `tipo_vehiculo` (`idtipo_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('369852147kjaslkd','2121sasa12sa45dsfs5fs','12za1sa1s',1,2,2,4,'987412563'),('6544AGKJS','asasasaslkanska45546546a4s-56565','6544AGKJS',1,1,1,1,'987412563');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:25:42
