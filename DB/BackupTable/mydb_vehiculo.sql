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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:20:11
