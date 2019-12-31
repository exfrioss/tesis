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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 18:20:12
