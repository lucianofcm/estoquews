CREATE DATABASE  IF NOT EXISTS `sisdelegacao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sisdelegacao`;
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
-- Table structure for table `delegado`
--

DROP TABLE IF EXISTS `delegado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegado` (
  `ide_delegado` int(11) NOT NULL,
  `ponto_delegado` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_delegado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegado`
--

LOCK TABLES `delegado` WRITE;
/*!40000 ALTER TABLE `delegado` DISABLE KEYS */;
INSERT INTO `delegado` VALUES (1,'1111'),(2,'222'),(3,'333'),(4,'444'),(5,'555');
/*!40000 ALTER TABLE `delegado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deputado`
--

DROP TABLE IF EXISTS `deputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deputado` (
  `ide_deputado` int(11) NOT NULL,
  `ponto_deputado` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_deputado`),
  UNIQUE KEY `ponto_deputado_UNIQUE` (`ponto_deputado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deputado`
--

LOCK TABLES `deputado` WRITE;
/*!40000 ALTER TABLE `deputado` DISABLE KEYS */;
INSERT INTO `deputado` VALUES (1,'1777'),(2,'2777'),(3,'3777'),(4,'4777');
/*!40000 ALTER TABLE `deputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_solicitacao`
--

DROP TABLE IF EXISTS `estado_solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_solicitacao` (
  `ide_estado_solicitacao` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_estado_solicitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_solicitacao`
--

LOCK TABLES `estado_solicitacao` WRITE;
/*!40000 ALTER TABLE `estado_solicitacao` DISABLE KEYS */;
INSERT INTO `estado_solicitacao` VALUES (1,'Pendente Assinatura'),(2,'Pendente Efetivacao'),(3,'Efetivada'),(4,'Pedente de Publicacao'),(5,'Publicada'),(6,'Pedente de Revogacao'),(7,'Revogada');
/*!40000 ALTER TABLE `estado_solicitacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao_sistema`
--

DROP TABLE IF EXISTS `permissao_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao_sistema` (
  `ide_permissao` int(11) NOT NULL,
  `nome_permissao` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_permissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao_sistema`
--

LOCK TABLES `permissao_sistema` WRITE;
/*!40000 ALTER TABLE `permissao_sistema` DISABLE KEYS */;
INSERT INTO `permissao_sistema` VALUES (1,'Permissão 1'),(2,'Permissão 2'),(3,'Permissão3'),(4,'Permissao 4');
/*!40000 ALTER TABLE `permissao_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_andamento`
--

DROP TABLE IF EXISTS `registro_andamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_andamento` (
  `ide_registro_andamento` int(11) NOT NULL AUTO_INCREMENT,
  `ide_solicitacao` int(11) NOT NULL,
  `ide_tipo_solicitacao` int(11) NOT NULL,
  `ide_status_solicitacao` int(11) NOT NULL,
  `data_registro_andamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ide_registro_andamento`),
  UNIQUE KEY `ide_registro_andamento_UNIQUE` (`ide_registro_andamento`),
  KEY `ide_tipo_solicitacao_idx` (`ide_tipo_solicitacao`),
  KEY `ide_estado_solicitacao_idx` (`ide_status_solicitacao`),
  KEY `ide_solicitacao_idx` (`ide_solicitacao`),
  CONSTRAINT `ide_solicitacao` FOREIGN KEY (`ide_solicitacao`) REFERENCES `solicitacao` (`ide_solicitacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ide_tipo_solicitacao` FOREIGN KEY (`ide_tipo_solicitacao`) REFERENCES `tipo_solicitacao` (`ide_tipo_solicitacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_andamento`
--

LOCK TABLES `registro_andamento` WRITE;
/*!40000 ALTER TABLE `registro_andamento` DISABLE KEYS */;
INSERT INTO `registro_andamento` VALUES (1,1,1,1,'2015-10-28 02:00:00'),(2,1,1,2,'2015-10-28 04:00:10'),(3,2,1,1,'2015-10-28 03:00:05');
/*!40000 ALTER TABLE `registro_andamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemas_delegacao`
--

DROP TABLE IF EXISTS `sistemas_delegacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistemas_delegacao` (
  `ide_sistema` int(11) NOT NULL,
  `nome_sistema` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_sistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemas_delegacao`
--

LOCK TABLES `sistemas_delegacao` WRITE;
/*!40000 ALTER TABLE `sistemas_delegacao` DISABLE KEYS */;
INSERT INTO `sistemas_delegacao` VALUES (1,'Sistema1'),(2,'Sistema 2'),(3,'Sistema 3'),(4,'Sistema 4'),(5,'Sistema5');
/*!40000 ALTER TABLE `sistemas_delegacao` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tipo_solicitacao`
--

DROP TABLE IF EXISTS `tipo_solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_solicitacao` (
  `ide_tipo_solicitacao` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ide_tipo_solicitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_solicitacao`
--

LOCK TABLES `tipo_solicitacao` WRITE;
/*!40000 ALTER TABLE `tipo_solicitacao` DISABLE KEYS */;
INSERT INTO `tipo_solicitacao` VALUES (1,'Delegação'),(2,'Revogação');
/*!40000 ALTER TABLE `tipo_solicitacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29  2:50:28
