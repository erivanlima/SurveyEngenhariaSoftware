CREATE DATABASE  IF NOT EXISTS `mysurvey` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysurvey`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mysurvey
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `my_aspnet_applications`
--

DROP TABLE IF EXISTS `my_aspnet_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_applications`
--

LOCK TABLES `my_aspnet_applications` WRITE;
/*!40000 ALTER TABLE `my_aspnet_applications` DISABLE KEYS */;
INSERT INTO `my_aspnet_applications` VALUES (1,'/','MySQL Session State Store Provider');
/*!40000 ALTER TABLE `my_aspnet_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_membership`
--

DROP TABLE IF EXISTS `my_aspnet_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_membership` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(128) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Password` varchar(128) NOT NULL,
  `PasswordKey` char(32) DEFAULT NULL,
  `PasswordFormat` tinyint(4) DEFAULT NULL,
  `PasswordQuestion` varchar(255) DEFAULT NULL,
  `PasswordAnswer` varchar(255) DEFAULT NULL,
  `IsApproved` tinyint(1) DEFAULT NULL,
  `LastActivityDate` datetime DEFAULT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastPasswordChangedDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `IsLockedOut` tinyint(1) DEFAULT NULL,
  `LastLockedOutDate` datetime DEFAULT NULL,
  `FailedPasswordAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAttemptWindowStart` datetime DEFAULT NULL,
  `FailedPasswordAnswerAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAnswerAttemptWindowStart` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_membership`
--

LOCK TABLES `my_aspnet_membership` WRITE;
/*!40000 ALTER TABLE `my_aspnet_membership` DISABLE KEYS */;
INSERT INTO `my_aspnet_membership` VALUES (3,'marcosdosea@gmail.com','','survey01%','dr8xTaaopCprnr+jlpHG4w==',0,NULL,NULL,1,'2015-09-10 10:06:09','2015-09-10 10:05:23','2015-09-10 10:03:01','2015-09-10 10:03:01',0,'2015-09-10 10:03:01',0,'2015-09-10 10:03:01',0,'2015-09-10 10:03:01');
/*!40000 ALTER TABLE `my_aspnet_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_profiles`
--

DROP TABLE IF EXISTS `my_aspnet_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_profiles` (
  `userId` int(11) NOT NULL,
  `valueindex` longtext,
  `stringdata` longtext,
  `binarydata` longblob,
  `lastUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_profiles`
--

LOCK TABLES `my_aspnet_profiles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_roles`
--

DROP TABLE IF EXISTS `my_aspnet_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_roles`
--

LOCK TABLES `my_aspnet_roles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_roles` DISABLE KEYS */;
INSERT INTO `my_aspnet_roles` VALUES (1,1,'Responsavel'),(2,1,'Administrador');
/*!40000 ALTER TABLE `my_aspnet_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_schemaversion`
--

DROP TABLE IF EXISTS `my_aspnet_schemaversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_schemaversion` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_schemaversion`
--

LOCK TABLES `my_aspnet_schemaversion` WRITE;
/*!40000 ALTER TABLE `my_aspnet_schemaversion` DISABLE KEYS */;
INSERT INTO `my_aspnet_schemaversion` VALUES (8);
/*!40000 ALTER TABLE `my_aspnet_schemaversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessioncleanup`
--

DROP TABLE IF EXISTS `my_aspnet_sessioncleanup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessioncleanup` (
  `LastRun` datetime NOT NULL,
  `IntervalMinutes` int(11) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  PRIMARY KEY (`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessioncleanup`
--

LOCK TABLES `my_aspnet_sessioncleanup` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` DISABLE KEYS */;
INSERT INTO `my_aspnet_sessioncleanup` VALUES ('2015-09-10 09:53:02',10,1);
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessions`
--

DROP TABLE IF EXISTS `my_aspnet_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessions` (
  `SessionId` varchar(191) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Expires` datetime NOT NULL,
  `LockDate` datetime NOT NULL,
  `LockId` int(11) NOT NULL,
  `Timeout` int(11) NOT NULL,
  `Locked` tinyint(1) NOT NULL,
  `SessionItems` longblob,
  `Flags` int(11) NOT NULL,
  PRIMARY KEY (`SessionId`,`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessions`
--

LOCK TABLES `my_aspnet_sessions` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_users`
--

DROP TABLE IF EXISTS `my_aspnet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL DEFAULT '1',
  `lastActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_users`
--

LOCK TABLES `my_aspnet_users` WRITE;
/*!40000 ALTER TABLE `my_aspnet_users` DISABLE KEYS */;
INSERT INTO `my_aspnet_users` VALUES (3,1,'marcos',0,'2015-09-10 10:06:09');
/*!40000 ALTER TABLE `my_aspnet_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_usersinroles`
--

DROP TABLE IF EXISTS `my_aspnet_usersinroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_usersinroles` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_usersinroles`
--

LOCK TABLES `my_aspnet_usersinroles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_usersinroles` DISABLE KEYS */;
INSERT INTO `my_aspnet_usersinroles` VALUES (3,1);
/*!40000 ALTER TABLE `my_aspnet_usersinroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classe`
--

DROP TABLE IF EXISTS `tb_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_classe` (
  `id_Classe` int(11) NOT NULL AUTO_INCREMENT,
  `TB_QUESTAO_id_Questao` int(11) NOT NULL,
  `Codigo` longtext,
  PRIMARY KEY (`id_Classe`),
  KEY `TB_CLASSE_FKIndex1` (`TB_QUESTAO_id_Questao`),
  CONSTRAINT `TB_CLASSE_FKIndex1` FOREIGN KEY (`TB_QUESTAO_id_Questao`) REFERENCES `tb_questao` (`id_Questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classe`
--

LOCK TABLES `tb_classe` WRITE;
/*!40000 ALTER TABLE `tb_classe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_entrevistado`
--

DROP TABLE IF EXISTS `tb_entrevistado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_entrevistado` (
  `idTB_ENTREVISTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `SOBRENOME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTB_ENTREVISTADO`),
  KEY `TB_RESPOSTA_FKIndex2` (`idTB_ENTREVISTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_entrevistado`
--

LOCK TABLES `tb_entrevistado` WRITE;
/*!40000 ALTER TABLE `tb_entrevistado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_entrevistado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_itens_da_questao`
--

DROP TABLE IF EXISTS `tb_itens_da_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_itens_da_questao` (
  `idTB_ITENS_DA_QUESTAO` int(11) NOT NULL AUTO_INCREMENT,
  `TB_QUESTAO_id_Questao` int(11) NOT NULL,
  `Item` longtext,
  PRIMARY KEY (`idTB_ITENS_DA_QUESTAO`),
  KEY `TB_ITENS_DA_QUESTAO_FKIndex1` (`TB_QUESTAO_id_Questao`),
  CONSTRAINT `TB_ITENS_DA_QUESTAO_FKIndex1` FOREIGN KEY (`TB_QUESTAO_id_Questao`) REFERENCES `tb_questao` (`id_Questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_itens_da_questao`
--

LOCK TABLES `tb_itens_da_questao` WRITE;
/*!40000 ALTER TABLE `tb_itens_da_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_itens_da_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_questao`
--

DROP TABLE IF EXISTS `tb_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_questao` (
  `id_Questao` int(11) NOT NULL AUTO_INCREMENT,
  `TB_SURVEY_id_Survey` int(11) NOT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  `Escolha` tinyint(1) NOT NULL,
  `TemOutro` tinyint(1) NOT NULL,
  `Pergunta` longtext NOT NULL,
  `Img` longblob,
  `Randomica` tinyint(1) DEFAULT NULL,
  `Obrigatoria` tinyint(1) DEFAULT NULL,
  `EhCodigo` tinyint(1) DEFAULT NULL,
  `Linguagem` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_Questao`),
  KEY `TB_CLASSE_FKIndex1` (`id_Questao`),
  KEY `TB_ITENS_DA_QUESTAO_FKIndex1` (`id_Questao`),
  KEY `TB_RESPOSTA_FKIndex1` (`id_Questao`),
  KEY `TB_QUESTAO_FKIndex1` (`TB_SURVEY_id_Survey`),
  CONSTRAINT `TB_QUESTAO_FKIndex1` FOREIGN KEY (`TB_SURVEY_id_Survey`) REFERENCES `tb_survey` (`id_Survey`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_questao`
--

LOCK TABLES `tb_questao` WRITE;
/*!40000 ALTER TABLE `tb_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_responsavel`
--

DROP TABLE IF EXISTS `tb_responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_responsavel` (
  `id_Responsavel` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Responsavel`),
  KEY `TB_SURVEY_FKIndex1` (`id_Responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_responsavel`
--

LOCK TABLES `tb_responsavel` WRITE;
/*!40000 ALTER TABLE `tb_responsavel` DISABLE KEYS */;
INSERT INTO `tb_responsavel` VALUES (1,'marcos','marcosdosea@gmail.com','marcos'),(2,'marcos','marcosdosea@gmail.com','marcos'),(3,'marcos','marcosdosea@gmail.com','marcos'),(4,'marcos','marcosdosea@gmail.com','marcos'),(5,'marcos','marcosdosea@gmail.com','marcos'),(6,'marcos','marcosdosea@gmail.com','marcos'),(7,'marcos','marcosdosea@gmail.com','marcos');
/*!40000 ALTER TABLE `tb_responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resposta`
--

DROP TABLE IF EXISTS `tb_resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_resposta` (
  `id_Resposta` int(11) NOT NULL AUTO_INCREMENT,
  `TB_ENTREVISTADO_idTB_ENTREVISTADO` int(11) NOT NULL,
  `TB_QUESTAO_id_Questao` int(11) NOT NULL,
  `Resposta` longtext,
  `Item` longtext,
  `OutroTxt` longtext,
  PRIMARY KEY (`id_Resposta`),
  KEY `TB_RESPOSTA_FKIndex1` (`TB_QUESTAO_id_Questao`),
  KEY `TB_RESPOSTA_FKIndex2` (`TB_ENTREVISTADO_idTB_ENTREVISTADO`),
  CONSTRAINT `TB_RESPOSTA_FKIndex1` FOREIGN KEY (`TB_QUESTAO_id_Questao`) REFERENCES `tb_questao` (`id_Questao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_RESPOSTA_FKIndex2` FOREIGN KEY (`TB_ENTREVISTADO_idTB_ENTREVISTADO`) REFERENCES `tb_entrevistado` (`idTB_ENTREVISTADO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resposta`
--

LOCK TABLES `tb_resposta` WRITE;
/*!40000 ALTER TABLE `tb_resposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_survey`
--

DROP TABLE IF EXISTS `tb_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_survey` (
  `id_Survey` int(11) NOT NULL AUTO_INCREMENT,
  `TB_RESPONSAVEL_id_Responsavel` int(11) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Subtitulo` varchar(45) NOT NULL,
  `Data_Criacao` datetime NOT NULL,
  `Data_fim` datetime DEFAULT NULL,
  `flag_ativo` tinyint(1) NOT NULL,
  `UnicaResposta` tinyint(1) NOT NULL,
  `RandomizeQuestoes` tinyint(1) NOT NULL,
  `SenhaAcesso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Survey`),
  KEY `TB_QUESTAO_FKIndex1` (`id_Survey`),
  KEY `TB_SURVEY_FKIndex1` (`TB_RESPONSAVEL_id_Responsavel`),
  CONSTRAINT `TB_SURVEY_FKIndex1` FOREIGN KEY (`TB_RESPONSAVEL_id_Responsavel`) REFERENCES `tb_responsavel` (`id_Responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_survey`
--

LOCK TABLES `tb_survey` WRITE;
/*!40000 ALTER TABLE `tb_survey` DISABLE KEYS */;
INSERT INTO `tb_survey` VALUES (1,1,'Coesão de Classes','Será que classes são coesas?','2015-09-10 00:00:00','2015-09-17 00:00:00',1,0,0,'123456');
/*!40000 ALTER TABLE `tb_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mysurvey'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-10 10:11:29
