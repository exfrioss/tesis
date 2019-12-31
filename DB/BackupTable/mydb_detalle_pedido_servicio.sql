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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:20:12
