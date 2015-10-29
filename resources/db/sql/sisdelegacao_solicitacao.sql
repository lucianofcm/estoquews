-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sisdelegacao
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao` (
  `ide_solicitacao` int(11) NOT NULL,
  `ide_privilegios` int(11) NOT NULL,
  `ide_deputado` int(11) NOT NULL,
  `ide_delegado` int(11) NOT NULL,
  `ide_sistema` int(11) DEFAULT NULL,
  PRIMARY KEY (`ide_solicitacao`),
  KEY `ide_deputado_idx` (`ide_deputado`),
  KEY `ide_delegado_idx` (`ide_delegado`),
  KEY `ide_privilegios_idx` (`ide_privilegios`),
  KEY `ide_sistema_idx` (`ide_sistema`),
  CONSTRAINT `ide_delegado` FOREIGN KEY (`ide_delegado`) REFERENCES `delegado` (`ide_delegado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ide_deputado` FOREIGN KEY (`ide_deputado`) REFERENCES `deputado` (`ide_deputado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ide_privilegios` FOREIGN KEY (`ide_privilegios`) REFERENCES `permissao_sistema` (`ide_permissao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ide_sistema` FOREIGN KEY (`ide_sistema`) REFERENCES `sistemas_delegacao` (`ide_sistema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao`
--

LOCK TABLES `solicitacao` WRITE;
/*!40000 ALTER TABLE `solicitacao` DISABLE KEYS */;
INSERT INTO `solicitacao` VALUES (1,1,1,1,1),(2,2,3,4,2);
/*!40000 ALTER TABLE `solicitacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29  2:48:37
