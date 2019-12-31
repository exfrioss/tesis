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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:20:12
