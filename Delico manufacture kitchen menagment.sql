CREATE DATABASE  IF NOT EXISTS `kuhinja_menagment` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kuhinja_menagment`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: kuhinja_menagment
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `izlaz`
--

DROP TABLE IF EXISTS `izlaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izlaz` (
  `id_izlaz` int(11) NOT NULL AUTO_INCREMENT,
  `kolicina_izlaz` decimal(10,2) NOT NULL,
  `id_tip` int(11) NOT NULL,
  `datum_izlaz` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_recepti` int(11) NOT NULL,
  PRIMARY KEY (`id_izlaz`),
  KEY `fk_izlaz_tip1_idx` (`id_tip`),
  KEY `fk_izlaz_tip1_idx1` (`id_recepti`),
  CONSTRAINT `fk_izlaz_tip1` FOREIGN KEY (`id_tip`) REFERENCES `tip` (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izlaz`
--

LOCK TABLES `izlaz` WRITE;
/*!40000 ALTER TABLE `izlaz` DISABLE KEYS */;
INSERT INTO `izlaz` VALUES (1,2.00,2,'2019-01-08 13:55:56',0),(2,1.00,2,'2019-01-08 13:57:29',0),(3,5.00,2,'2019-01-08 13:57:44',0),(4,5.00,2,'2019-01-08 13:57:51',0),(5,1.00,2,'2019-01-08 13:58:23',0),(6,1.00,2,'2019-01-08 14:00:42',0),(7,1.00,1,'2019-01-08 14:01:03',0),(8,1.00,1,'2019-01-08 14:01:30',0),(9,5.00,1,'2019-01-09 13:22:03',3),(10,5.00,1,'2019-01-09 13:35:16',3),(11,5.00,1,'2019-01-09 13:38:17',3),(12,5.00,1,'2019-01-09 13:40:01',3),(13,5.00,1,'2019-01-09 13:43:30',3),(16,5.00,1,'2019-01-09 13:48:11',3),(17,5.00,1,'2019-01-09 13:50:57',3),(20,5.00,1,'2019-01-09 13:55:22',3),(21,2.00,1,'2019-01-09 13:56:12',1),(26,2.00,1,'2019-01-09 13:59:03',1),(34,2.00,1,'2019-01-09 14:05:25',1),(35,2.00,1,'2019-01-09 14:05:37',1),(36,2.00,1,'2019-01-09 14:05:41',1),(37,2.00,1,'2019-01-09 14:05:42',1),(38,2.00,1,'2019-01-09 14:05:42',1),(39,2.00,1,'2019-01-09 14:05:42',1),(40,2.00,1,'2019-01-09 14:05:42',1),(41,2.00,1,'2019-01-09 14:05:43',1),(42,2.00,1,'2019-01-09 14:05:43',1),(43,2.00,1,'2019-01-09 14:06:20',1),(44,2.00,1,'2019-01-09 14:06:20',1),(45,2.00,1,'2019-01-09 14:06:20',1),(46,2.00,1,'2019-01-09 14:06:20',1),(47,2.00,1,'2019-01-09 14:06:20',1),(48,2.00,1,'2019-01-09 14:06:21',1),(49,2.00,1,'2019-01-09 14:06:21',1),(50,2.00,1,'2019-01-09 14:06:21',1),(51,2.00,1,'2019-01-09 14:06:21',1),(52,2.00,1,'2019-01-09 14:06:21',1),(53,1.00,1,'2019-01-09 14:22:00',1),(54,1.00,2,'2019-01-09 14:25:05',1),(55,3.00,1,'2019-01-14 13:19:54',1);
/*!40000 ALTER TABLE `izlaz` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kuhinja_menagment`.`izlaz_AFTER_INSERT` AFTER INSERT ON `izlaz` FOR EACH ROW
BEGIN
INSERT INTO POMOCNA (ID_RN, KOLICINA_RN, ID_RECEPTI, ID_NAMIRNICE)
(SELECT ID_RN,
 (KOLICINA_RN*NEW.KOLICINA_IZLAZ) AS KOL, ID_RECEPTI, 
ID_NAMIRNICE FROM RECEPTI_NAMIRNICE 
WHERE ID_RECEPTI = 
NEW.ID_RECEPTI);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mera`
--

DROP TABLE IF EXISTS `mera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mera` (
  `id_mera` int(11) NOT NULL AUTO_INCREMENT,
  `ime_mera` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mera`
--

LOCK TABLES `mera` WRITE;
/*!40000 ALTER TABLE `mera` DISABLE KEYS */;
INSERT INTO `mera` VALUES (1,'litar'),(2,'kilogram'),(3,'komad');
/*!40000 ALTER TABLE `mera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namirnice`
--

DROP TABLE IF EXISTS `namirnice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namirnice` (
  `id_namirnice` int(11) NOT NULL AUTO_INCREMENT,
  `ime_namirnice` varchar(45) NOT NULL,
  `trenutna_kolicina` decimal(10,2) NOT NULL,
  `id_mera` int(11) NOT NULL,
  PRIMARY KEY (`id_namirnice`),
  KEY `fk_namirnice_mera_idx` (`id_mera`),
  CONSTRAINT `fk_namirnice_mera` FOREIGN KEY (`id_mera`) REFERENCES `mera` (`id_mera`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namirnice`
--

LOCK TABLES `namirnice` WRITE;
/*!40000 ALTER TABLE `namirnice` DISABLE KEYS */;
INSERT INTO `namirnice` VALUES (1,'krompir',150.00,2),(2,'svinjsko  meso',147.50,2),(3,'junece meso',10.50,2),(4,'mleko',0.50,1),(5,'jaja',54.00,3),(6,'crni luk',9.05,2),(7,'ulje',8.05,1),(8,'beli luk',10.00,2),(9,'crvena aleva paprika',1.00,2),(10,'paradajz pire',1.00,2),(11,'prezle',1.70,2),(12,'brasno',4.90,2);
/*!40000 ALTER TABLE `namirnice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kuhinja_menagment`.`namirnice_AFTER_UPDATE` AFTER UPDATE ON `namirnice` FOR EACH ROW
BEGIN
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `otpis`
--

DROP TABLE IF EXISTS `otpis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otpis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum_otpis` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kolicina_otpis` decimal(10,2) NOT NULL,
  `id_namirnice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_otpis_namirnice1_idx` (`id_namirnice`),
  CONSTRAINT `fk_otpis_namirnice1` FOREIGN KEY (`id_namirnice`) REFERENCES `namirnice` (`id_namirnice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otpis`
--

LOCK TABLES `otpis` WRITE;
/*!40000 ALTER TABLE `otpis` DISABLE KEYS */;
INSERT INTO `otpis` VALUES (1,'2019-01-08 13:42:33',1.00,5),(2,'2019-01-09 09:46:23',2.00,5);
/*!40000 ALTER TABLE `otpis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kuhinja_menagment`.`otpis_AFTER_INSERT` AFTER INSERT ON `otpis` FOR EACH ROW
BEGIN
UPDATE namirnice
     SET namirnice.trenutna_kolicina = namirnice.trenutna_kolicina-new.kolicina_otpis
     where namirnice.id_namirnice = new.id_namirnice;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pomocna`
--

DROP TABLE IF EXISTS `pomocna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pomocna` (
  `id_rn` int(11) NOT NULL,
  `kolicina_rn` decimal(10,2) NOT NULL,
  `id_recepti` int(11) NOT NULL,
  `id_namirnice` int(11) NOT NULL,
  `PK` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PK`),
  KEY `fk_recepti_namirnice_recepti1_idx` (`id_recepti`),
  KEY `fk_recepti_namirnice_namirnice1_idx` (`id_namirnice`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pomocna`
--

LOCK TABLES `pomocna` WRITE;
/*!40000 ALTER TABLE `pomocna` DISABLE KEYS */;
INSERT INTO `pomocna` VALUES (34,0.40,1,1,171),(35,0.20,1,2,172),(36,0.20,1,3,173),(37,0.20,1,4,174),(38,2.00,1,5,175),(39,0.02,1,6,176),(40,0.02,1,7,177),(34,0.40,1,1,178),(35,0.20,1,2,179),(36,0.20,1,3,180),(37,0.20,1,4,181),(38,2.00,1,5,182),(39,0.02,1,6,183),(40,0.02,1,7,184),(34,0.40,1,1,185),(35,0.20,1,2,186),(36,0.20,1,3,187),(37,0.20,1,4,188),(38,2.00,1,5,189),(39,0.02,1,6,190),(40,0.02,1,7,191),(34,0.40,1,1,192),(35,0.20,1,2,193),(36,0.20,1,3,194),(37,0.20,1,4,195),(38,2.00,1,5,196),(39,0.02,1,6,197),(40,0.02,1,7,198),(34,0.40,1,1,199),(35,0.20,1,2,200),(36,0.20,1,3,201),(37,0.20,1,4,202),(38,2.00,1,5,203),(39,0.02,1,6,204),(40,0.02,1,7,205),(34,0.40,1,1,206),(35,0.20,1,2,207),(36,0.20,1,3,208),(37,0.20,1,4,209),(38,2.00,1,5,210),(39,0.02,1,6,211),(40,0.02,1,7,212),(34,0.40,1,1,213),(35,0.20,1,2,214),(36,0.20,1,3,215),(37,0.20,1,4,216),(38,2.00,1,5,217),(39,0.02,1,6,218),(40,0.02,1,7,219),(34,0.40,1,1,220),(35,0.20,1,2,221),(36,0.20,1,3,222),(37,0.20,1,4,223),(38,2.00,1,5,224),(39,0.02,1,6,225),(40,0.02,1,7,226),(34,0.40,1,1,227),(35,0.20,1,2,228),(36,0.20,1,3,229),(37,0.20,1,4,230),(38,2.00,1,5,231),(39,0.02,1,6,232),(40,0.02,1,7,233),(34,0.40,1,1,234),(35,0.20,1,2,235),(36,0.20,1,3,236),(37,0.20,1,4,237),(38,2.00,1,5,238),(39,0.02,1,6,239),(40,0.02,1,7,240),(34,0.40,1,1,241),(35,0.20,1,2,242),(36,0.20,1,3,243),(37,0.20,1,4,244),(38,2.00,1,5,245),(39,0.02,1,6,246),(40,0.02,1,7,247),(34,0.40,1,1,248),(35,0.20,1,2,249),(36,0.20,1,3,250),(37,0.20,1,4,251),(38,2.00,1,5,252),(39,0.02,1,6,253),(40,0.02,1,7,254),(34,0.40,1,1,255),(35,0.20,1,2,256),(36,0.20,1,3,257),(37,0.20,1,4,258),(38,2.00,1,5,259),(39,0.02,1,6,260),(40,0.02,1,7,261),(34,0.40,1,1,262),(35,0.20,1,2,263),(36,0.20,1,3,264),(37,0.20,1,4,265),(38,2.00,1,5,266),(39,0.02,1,6,267),(40,0.02,1,7,268),(34,0.40,1,1,269),(35,0.20,1,2,270),(36,0.20,1,3,271),(37,0.20,1,4,272),(38,2.00,1,5,273),(39,0.02,1,6,274),(40,0.02,1,7,275),(34,0.40,1,1,276),(35,0.20,1,2,277),(36,0.20,1,3,278),(37,0.20,1,4,279),(38,2.00,1,5,280),(39,0.02,1,6,281),(40,0.02,1,7,282),(34,0.40,1,1,283),(35,0.20,1,2,284),(36,0.20,1,3,285),(37,0.20,1,4,286),(38,2.00,1,5,287),(39,0.02,1,6,288),(40,0.02,1,7,289),(34,0.40,1,1,290),(35,0.20,1,2,291),(36,0.20,1,3,292),(37,0.20,1,4,293),(38,2.00,1,5,294),(39,0.02,1,6,295),(40,0.02,1,7,296),(34,0.40,1,1,297),(35,0.20,1,2,298),(36,0.20,1,3,299),(37,0.20,1,4,300),(38,2.00,1,5,301),(39,0.02,1,6,302),(40,0.02,1,7,303),(34,0.20,1,1,304),(35,0.10,1,2,305),(36,0.10,1,3,306),(37,0.10,1,4,307),(38,1.00,1,5,308),(39,0.01,1,6,309),(40,0.01,1,7,310),(34,0.20,1,1,311),(35,0.10,1,2,312),(36,0.10,1,3,313),(37,0.10,1,4,314),(38,1.00,1,5,315),(39,0.01,1,6,316),(40,0.01,1,7,317),(34,0.60,1,1,318),(35,0.30,1,2,319),(36,0.30,1,3,320),(37,0.30,1,4,321),(38,3.00,1,5,322),(39,0.03,1,6,323),(40,0.03,1,7,324);
/*!40000 ALTER TABLE `pomocna` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kuhinja_menagment`.`pomocna_AFTER_INSERT` AFTER INSERT ON `pomocna` FOR EACH ROW
BEGIN
UPDATE namirnice 
    SET TRENUTNA_KOLICINA =
    TRENUTNA_KOLICINA - NEW.KOLICINA_RN
    WHERE ID_NAMIRNICE = NEW.ID_NAMIRNICE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recepti`
--

DROP TABLE IF EXISTS `recepti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepti` (
  `id_recepti` int(11) NOT NULL AUTO_INCREMENT,
  `ime_recepti` varchar(45) NOT NULL,
  PRIMARY KEY (`id_recepti`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti`
--

LOCK TABLES `recepti` WRITE;
/*!40000 ALTER TABLE `recepti` DISABLE KEYS */;
INSERT INTO `recepti` VALUES (1,'Musaka'),(2,'Govedji gulas'),(3,'Becka snicla');
/*!40000 ALTER TABLE `recepti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti_namirnice`
--

DROP TABLE IF EXISTS `recepti_namirnice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepti_namirnice` (
  `id_rn` int(11) NOT NULL AUTO_INCREMENT,
  `kolicina_rn` decimal(10,2) NOT NULL,
  `id_recepti` int(11) NOT NULL,
  `id_namirnice` int(11) NOT NULL,
  PRIMARY KEY (`id_rn`),
  KEY `fk_recepti_namirnice_recepti1_idx` (`id_recepti`),
  KEY `fk_recepti_namirnice_namirnice1_idx` (`id_namirnice`),
  CONSTRAINT `fk_recepti_namirnice_namirnice1` FOREIGN KEY (`id_namirnice`) REFERENCES `namirnice` (`id_namirnice`),
  CONSTRAINT `fk_recepti_namirnice_recepti1` FOREIGN KEY (`id_recepti`) REFERENCES `recepti` (`id_recepti`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti_namirnice`
--

LOCK TABLES `recepti_namirnice` WRITE;
/*!40000 ALTER TABLE `recepti_namirnice` DISABLE KEYS */;
INSERT INTO `recepti_namirnice` VALUES (34,0.20,1,1),(35,0.10,1,2),(36,0.10,1,3),(37,0.10,1,4),(38,1.00,1,5),(39,0.01,1,6),(40,0.01,1,7),(41,0.20,2,6),(42,0.20,2,3),(43,0.01,2,7),(44,0.01,2,8),(45,0.01,2,10),(46,0.01,2,9),(47,0.20,3,2),(48,1.00,3,5),(49,0.10,3,7),(50,0.03,3,11),(51,0.01,3,12);
/*!40000 ALTER TABLE `recepti_namirnice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip`
--

DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip` (
  `id_tip` int(11) NOT NULL AUTO_INCREMENT,
  `ime_tip` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
INSERT INTO `tip` VALUES (1,'prodaja'),(2,'rashod');
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulaz`
--

DROP TABLE IF EXISTS `ulaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ulaz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum_ulaz` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kolicina_ulaz` decimal(10,2) NOT NULL,
  `id_namirnice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ulaz_namirnice1_idx` (`id_namirnice`),
  CONSTRAINT `fk_ulaz_namirnice1` FOREIGN KEY (`id_namirnice`) REFERENCES `namirnice` (`id_namirnice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulaz`
--

LOCK TABLES `ulaz` WRITE;
/*!40000 ALTER TABLE `ulaz` DISABLE KEYS */;
INSERT INTO `ulaz` VALUES (1,'2019-01-09 10:11:46',2.00,5),(2,'2019-01-09 14:21:01',150.00,5),(3,'2019-01-09 14:21:20',150.00,1),(4,'2019-01-09 14:21:24',150.00,2),(5,'2019-01-14 13:14:01',12.00,1);
/*!40000 ALTER TABLE `ulaz` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kuhinja_menagment`.`ulaz_AFTER_INSERT` AFTER INSERT ON `ulaz` FOR EACH ROW
BEGIN
UPDATE namirnice
     SET namirnice.trenutna_kolicina = namirnice.trenutna_kolicina+new.kolicina_ulaz
     where namirnice.id_namirnice = new.id_namirnice;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'kuhinja_menagment'
--

--
-- Dumping routines for database 'kuhinja_menagment'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-15 22:59:05
