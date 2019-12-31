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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:23:23
