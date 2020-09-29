CREATE DATABASE  IF NOT EXISTS `e_commerce_auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `e_commerce_auth`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce_auth
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_credentials_status`
--

DROP TABLE IF EXISTS `auth_credentials_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_credentials_status` (
  `cst_id` int(11) NOT NULL AUTO_INCREMENT,
  `cst_description` varchar(75) NOT NULL,
  PRIMARY KEY (`cst_id`),
  UNIQUE KEY `cst_description_UNIQUE` (`cst_description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_credentials_status`
--

LOCK TABLES `auth_credentials_status` WRITE;
/*!40000 ALTER TABLE `auth_credentials_status` DISABLE KEYS */;
INSERT INTO `auth_credentials_status` VALUES (1,'Active'),(2,'Disabled'),(4,'Other'),(3,'Password Expired');
/*!40000 ALTER TABLE `auth_credentials_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_customers`
--

DROP TABLE IF EXISTS `auth_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_customers` (
  `cst_id` varchar(36) NOT NULL,
  `cst_username` varchar(50) NOT NULL,
  `cst_email` varchar(255) NOT NULL,
  `cst_password_hash` varchar(100) NOT NULL,
  `cst_salt` varchar(36) NOT NULL,
  `cst_status` int(11) NOT NULL,
  `cst_password_expires_on` datetime DEFAULT NULL,
  `cst_consecutive_failed_login_count` int(11) DEFAULT '0',
  `cst_last_action_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cst_id`),
  UNIQUE KEY `cst_username_UNIQUE` (`cst_username`),
  UNIQUE KEY `cst_email_UNIQUE` (`cst_email`),
  UNIQUE KEY `cst_salt_UNIQUE` (`cst_salt`),
  KEY `auth_customers_stat_fk1_idx` (`cst_status`),
  CONSTRAINT `auth_customers_fk1` FOREIGN KEY (`cst_status`) REFERENCES `auth_credentials_status` (`cst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_customers`
--

LOCK TABLES `auth_customers` WRITE;
/*!40000 ALTER TABLE `auth_customers` DISABLE KEYS */;
INSERT INTO `auth_customers` VALUES ('9e878cd8-fa6a-4ef7-8f75-819228b2c4f4','georges.stephan','georges.stephan@press-and-co.com','34797cd3498e68295967a1d2a8854e7debf26bbc24b33783205df116ed11dad2','d5a704c9-927c-48d6-bec7-d10599d81633',1,NULL,0,'2020-09-27 12:07:28');
/*!40000 ALTER TABLE `auth_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_failure_reasons`
--

DROP TABLE IF EXISTS `auth_failure_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_failure_reasons` (
  `flr_id` int(11) NOT NULL AUTO_INCREMENT,
  `flr_description` varchar(100) NOT NULL,
  PRIMARY KEY (`flr_id`),
  UNIQUE KEY `flr_description_UNIQUE` (`flr_description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_failure_reasons`
--

LOCK TABLES `auth_failure_reasons` WRITE;
/*!40000 ALTER TABLE `auth_failure_reasons` DISABLE KEYS */;
INSERT INTO `auth_failure_reasons` VALUES (1,'Login Successfull'),(3,'Password Expired'),(4,'System Error'),(2,'User Disabled'),(5,'Wrong Password');
/*!40000 ALTER TABLE `auth_failure_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_login_history`
--

DROP TABLE IF EXISTS `auth_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_login_history` (
  `lgh_id` int(11) NOT NULL AUTO_INCREMENT,
  `lgh_timestamp` datetime NOT NULL,
  `lgh_login_succeded` smallint(6) NOT NULL,
  `lgh_failure_reason` int(11) NOT NULL,
  `lgh_email_id` varchar(36) DEFAULT NULL,
  `lgh_username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lgh_id`),
  KEY `auth_login_history_fk1_idx` (`lgh_failure_reason`),
  KEY `auth_login_history_fk2_idx` (`lgh_email_id`),
  KEY `auth_login_history_fk3_idx` (`lgh_username`),
  CONSTRAINT `auth_login_history_fk1` FOREIGN KEY (`lgh_failure_reason`) REFERENCES `auth_failure_reasons` (`flr_id`),
  CONSTRAINT `auth_login_history_fk2` FOREIGN KEY (`lgh_email_id`) REFERENCES `auth_customers` (`cst_id`),
  CONSTRAINT `auth_login_history_fk3` FOREIGN KEY (`lgh_username`) REFERENCES `auth_customers` (`cst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_login_history`
--

LOCK TABLES `auth_login_history` WRITE;
/*!40000 ALTER TABLE `auth_login_history` DISABLE KEYS */;
INSERT INTO `auth_login_history` VALUES (1,'2020-09-27 11:24:32',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(2,'2020-09-27 11:25:08',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(4,'2020-09-27 11:32:57',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(5,'2020-09-27 11:34:59',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(7,'2020-09-27 12:00:50',1,1,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(8,'2020-09-27 12:02:29',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(9,'2020-09-27 12:02:57',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(10,'2020-09-27 12:03:04',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(11,'2020-09-27 12:03:09',0,5,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(12,'2020-09-27 12:07:28',1,1,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4'),(13,'2020-09-29 19:44:54',1,1,NULL,'9e878cd8-fa6a-4ef7-8f75-819228b2c4f4');
/*!40000 ALTER TABLE `auth_login_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-29 19:45:53
