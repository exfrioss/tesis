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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:23:23
