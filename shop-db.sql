CREATE DATABASE  IF NOT EXISTS `e_commerce_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `e_commerce_shop`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce_shop
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
-- Table structure for table `ecom_address`
--

DROP TABLE IF EXISTS `ecom_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_address` (
  `adr_id` int(11) NOT NULL AUTO_INCREMENT,
  `adr_full_name` varchar(200) NOT NULL,
  `adr_line_1` varchar(255) NOT NULL,
  `adr_line_2` varchar(200) DEFAULT NULL,
  `adr_zip_postal_code` varchar(10) NOT NULL,
  `adr_city` varchar(200) NOT NULL,
  `adr_country_id` int(11) NOT NULL,
  PRIMARY KEY (`adr_id`),
  KEY `adr_country_id` (`adr_country_id`),
  CONSTRAINT `ecom_address_ibfk_1` FOREIGN KEY (`adr_country_id`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_address`
--

LOCK TABLES `ecom_address` WRITE;
/*!40000 ALTER TABLE `ecom_address` DISABLE KEYS */;
INSERT INTO `ecom_address` VALUES (1,'Pierre Stephan','Achrafieh, Adib Isaac Str, Jamml Bldg 4th Floor',NULL,'113-7418','Beirut',3);
/*!40000 ALTER TABLE `ecom_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_category_attributes`
--

DROP TABLE IF EXISTS `ecom_category_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_category_attributes` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_ict_id` int(11) NOT NULL,
  `cat_attribute_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_ict_id` (`cat_ict_id`),
  CONSTRAINT `ecom_category_attributes_ibfk_1` FOREIGN KEY (`cat_ict_id`) REFERENCES `ecom_item_categories` (`ict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_category_attributes`
--

LOCK TABLES `ecom_category_attributes` WRITE;
/*!40000 ALTER TABLE `ecom_category_attributes` DISABLE KEYS */;
INSERT INTO `ecom_category_attributes` VALUES (1,10,'Number of Pages'),(2,10,'Language');
/*!40000 ALTER TABLE `ecom_category_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_countries`
--

DROP TABLE IF EXISTS `ecom_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_countries` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnt_name` varchar(100) NOT NULL,
  `cnt_iso_name` varchar(3) NOT NULL,
  `cnt_iso_currency` varchar(3) NOT NULL,
  `cnt_currency_name` varchar(50) NOT NULL,
  `cnt_phone_contry_code` varchar(4) NOT NULL,
  PRIMARY KEY (`cnt_id`),
  UNIQUE KEY `cnt_name` (`cnt_name`),
  UNIQUE KEY `cnt_iso_name` (`cnt_iso_name`),
  UNIQUE KEY `cnt_iso_currency` (`cnt_iso_currency`),
  UNIQUE KEY `cnt_currency_name` (`cnt_currency_name`),
  UNIQUE KEY `cnt_phone_contry_code` (`cnt_phone_contry_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_countries`
--

LOCK TABLES `ecom_countries` WRITE;
/*!40000 ALTER TABLE `ecom_countries` DISABLE KEYS */;
INSERT INTO `ecom_countries` VALUES (1,'United States of America','USA','USD','US Dollars','001'),(2,'Armenia','ARM','AMD','Armenian Dram','374'),(3,'Lebanon','LBN','LBP','Lebanese Pounds','961');
/*!40000 ALTER TABLE `ecom_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_courrier`
--

DROP TABLE IF EXISTS `ecom_courrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_courrier` (
  `crr_id` int(11) NOT NULL AUTO_INCREMENT,
  `crr_name` varchar(200) NOT NULL,
  `crr_average_raiting` double DEFAULT '0',
  PRIMARY KEY (`crr_id`),
  UNIQUE KEY `crr_name` (`crr_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_courrier`
--

LOCK TABLES `ecom_courrier` WRITE;
/*!40000 ALTER TABLE `ecom_courrier` DISABLE KEYS */;
INSERT INTO `ecom_courrier` VALUES (1,'FedEx',5);
/*!40000 ALTER TABLE `ecom_courrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ecom_currency_v`
--

DROP TABLE IF EXISTS `ecom_currency_v`;
/*!50001 DROP VIEW IF EXISTS `ecom_currency_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ecom_currency_v` AS SELECT 
 1 AS `cnt_id`,
 1 AS `cnt_iso_currency`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ecom_customer_address_mm`
--

DROP TABLE IF EXISTS `ecom_customer_address_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_customer_address_mm` (
  `cad_id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_cst_id` int(11) NOT NULL,
  `cad_adr_id` int(11) NOT NULL,
  `cad_adr_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cad_id`),
  UNIQUE KEY `ecom_customer_address_idx1` (`cad_cst_id`,`cad_adr_id`),
  KEY `cad_adr_id` (`cad_adr_id`),
  CONSTRAINT `ecom_customer_address_mm_ibfk_1` FOREIGN KEY (`cad_cst_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_customer_address_mm_ibfk_2` FOREIGN KEY (`cad_adr_id`) REFERENCES `ecom_address` (`adr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_customer_address_mm`
--

LOCK TABLES `ecom_customer_address_mm` WRITE;
/*!40000 ALTER TABLE `ecom_customer_address_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_customer_address_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_customer_list_content_mm`
--

DROP TABLE IF EXISTS `ecom_customer_list_content_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_customer_list_content_mm` (
  `elc_id` int(11) NOT NULL AUTO_INCREMENT,
  `elc_ecl_id` int(11) NOT NULL,
  `elc_itm_id` int(11) NOT NULL,
  `elc_added_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elc_id`),
  UNIQUE KEY `ecom_customer_list_content_mm_idx1` (`elc_ecl_id`,`elc_itm_id`),
  KEY `elc_itm_id` (`elc_itm_id`),
  CONSTRAINT `ecom_customer_list_content_mm_ibfk_1` FOREIGN KEY (`elc_ecl_id`) REFERENCES `ecom_customer_lists` (`ecl_id`),
  CONSTRAINT `ecom_customer_list_content_mm_ibfk_2` FOREIGN KEY (`elc_itm_id`) REFERENCES `ecom_item` (`itm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_customer_list_content_mm`
--

LOCK TABLES `ecom_customer_list_content_mm` WRITE;
/*!40000 ALTER TABLE `ecom_customer_list_content_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_customer_list_content_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_customer_lists`
--

DROP TABLE IF EXISTS `ecom_customer_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_customer_lists` (
  `ecl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ecl_cst_id` int(11) NOT NULL,
  `ecl_list_name` varchar(100) DEFAULT NULL,
  `ecl_type` int(11) NOT NULL,
  PRIMARY KEY (`ecl_id`),
  KEY `ecl_cst_id` (`ecl_cst_id`),
  KEY `ecl_type` (`ecl_type`),
  CONSTRAINT `ecom_customer_lists_ibfk_1` FOREIGN KEY (`ecl_cst_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_customer_lists_ibfk_2` FOREIGN KEY (`ecl_type`) REFERENCES `ecom_list_type` (`elt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_customer_lists`
--

LOCK TABLES `ecom_customer_lists` WRITE;
/*!40000 ALTER TABLE `ecom_customer_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_customer_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_customer_payment_mm`
--

DROP TABLE IF EXISTS `ecom_customer_payment_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_customer_payment_mm` (
  `cpy_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpy_cst_id` int(11) NOT NULL,
  `cpy_pay_id` int(11) NOT NULL,
  PRIMARY KEY (`cpy_id`),
  UNIQUE KEY `customer_payment_mm_idx1` (`cpy_cst_id`,`cpy_pay_id`),
  KEY `cpy_pay_id` (`cpy_pay_id`),
  CONSTRAINT `ecom_customer_payment_mm_ibfk_1` FOREIGN KEY (`cpy_cst_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_customer_payment_mm_ibfk_2` FOREIGN KEY (`cpy_pay_id`) REFERENCES `ecom_payment` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_customer_payment_mm`
--

LOCK TABLES `ecom_customer_payment_mm` WRITE;
/*!40000 ALTER TABLE `ecom_customer_payment_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_customer_payment_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_customers`
--

DROP TABLE IF EXISTS `ecom_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_customers` (
  `cst_id` int(11) NOT NULL AUTO_INCREMENT,
  `csr_customer_id` varchar(64) NOT NULL,
  `cst_display_name` varchar(45) NOT NULL,
  `cst_profile_pic_uri` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`cst_id`),
  UNIQUE KEY `csr_customer_id` (`csr_customer_id`),
  UNIQUE KEY `cst_display_name_UNIQUE` (`cst_display_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_customers`
--

LOCK TABLES `ecom_customers` WRITE;
/*!40000 ALTER TABLE `ecom_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_email`
--

DROP TABLE IF EXISTS `ecom_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_email` (
  `eml_id` int(11) NOT NULL AUTO_INCREMENT,
  `eml_email` varchar(255) NOT NULL,
  `eml_order` int(11) DEFAULT '0',
  PRIMARY KEY (`eml_id`),
  UNIQUE KEY `eml_email` (`eml_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_email`
--

LOCK TABLES `ecom_email` WRITE;
/*!40000 ALTER TABLE `ecom_email` DISABLE KEYS */;
INSERT INTO `ecom_email` VALUES (1,'georges.stephan@iclooud.com',0);
/*!40000 ALTER TABLE `ecom_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_invoice`
--

DROP TABLE IF EXISTS `ecom_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_invoice` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_recipient_name` varchar(200) DEFAULT NULL,
  `inv_number` varchar(8) DEFAULT NULL,
  `inv_opened_date` datetime NOT NULL,
  `inv_closed_date` datetime DEFAULT NULL,
  `inv_cutomer_id` int(11) NOT NULL,
  `inv_discount` double DEFAULT '0',
  `inv_status` int(11) NOT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `inv_cutomer_id` (`inv_cutomer_id`),
  KEY `inv_status` (`inv_status`),
  CONSTRAINT `ecom_invoice_ibfk_1` FOREIGN KEY (`inv_cutomer_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_invoice_ibfk_2` FOREIGN KEY (`inv_status`) REFERENCES `ecom_invoice_status` (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_invoice`
--

LOCK TABLES `ecom_invoice` WRITE;
/*!40000 ALTER TABLE `ecom_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_invoice_order_mm`
--

DROP TABLE IF EXISTS `ecom_invoice_order_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_invoice_order_mm` (
  `ivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ivo_inv_id` int(11) NOT NULL,
  `ivo_odr_id` int(11) NOT NULL,
  PRIMARY KEY (`ivo_id`),
  KEY `ivo_inv_id` (`ivo_inv_id`),
  KEY `ivo_odr_id` (`ivo_odr_id`),
  CONSTRAINT `ecom_invoice_order_mm_ibfk_1` FOREIGN KEY (`ivo_inv_id`) REFERENCES `ecom_invoice` (`inv_id`),
  CONSTRAINT `ecom_invoice_order_mm_ibfk_2` FOREIGN KEY (`ivo_odr_id`) REFERENCES `ecom_order` (`odr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_invoice_order_mm`
--

LOCK TABLES `ecom_invoice_order_mm` WRITE;
/*!40000 ALTER TABLE `ecom_invoice_order_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_invoice_order_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_invoice_status`
--

DROP TABLE IF EXISTS `ecom_invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_invoice_status` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_description` varchar(200) NOT NULL,
  PRIMARY KEY (`est_id`),
  UNIQUE KEY `est_description` (`est_description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_invoice_status`
--

LOCK TABLES `ecom_invoice_status` WRITE;
/*!40000 ALTER TABLE `ecom_invoice_status` DISABLE KEYS */;
INSERT INTO `ecom_invoice_status` VALUES (1,'Payed'),(2,'Pending');
/*!40000 ALTER TABLE `ecom_invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item`
--

DROP TABLE IF EXISTS `ecom_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item` (
  `itm_id` int(11) NOT NULL AUTO_INCREMENT,
  `itm_average_rating` double DEFAULT '0',
  `itm_manufacture_reference` varchar(255) DEFAULT NULL,
  `itm_our_ref` varchar(22) DEFAULT NULL,
  `itm_acquired_price` double NOT NULL,
  `itm_acquired_currency` int(11) NOT NULL,
  `itm_return_policy` int(11) DEFAULT NULL,
  `itm_seller` int(11) NOT NULL,
  `itm_width_in_inch` double NOT NULL,
  `itm_height_in_inch` double NOT NULL,
  `itm_length_in_inch` double NOT NULL,
  `itm_weight_in_pounds` double NOT NULL,
  PRIMARY KEY (`itm_id`),
  KEY `itm_return_policy` (`itm_return_policy`),
  KEY `itm_seller` (`itm_seller`),
  KEY `ecom_item_ibfk_3_idx` (`itm_acquired_currency`),
  CONSTRAINT `ecom_item_ibfk_1` FOREIGN KEY (`itm_return_policy`) REFERENCES `ecom_return_policy` (`rtp_id`),
  CONSTRAINT `ecom_item_ibfk_2` FOREIGN KEY (`itm_seller`) REFERENCES `ecom_item_seller` (`sel_id`),
  CONSTRAINT `ecom_item_ibfk_3` FOREIGN KEY (`itm_acquired_currency`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item`
--

LOCK TABLES `ecom_item` WRITE;
/*!40000 ALTER TABLE `ecom_item` DISABLE KEYS */;
INSERT INTO `ecom_item` VALUES (1,0,'1234','o987',100,1,1,1,5,2,3,0.5),(2,5,'1235','Z33',10,2,2,1,1,2,2,0.1);
/*!40000 ALTER TABLE `ecom_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item_attribute_values`
--

DROP TABLE IF EXISTS `ecom_item_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item_attribute_values` (
  `iav_id` int(11) NOT NULL AUTO_INCREMENT,
  `iav_itm_id` int(11) NOT NULL,
  `iav_cat_id` int(11) NOT NULL,
  `iav_attribute_value` varchar(255) NOT NULL,
  PRIMARY KEY (`iav_id`),
  KEY `iav_itm_id` (`iav_itm_id`),
  KEY `iav_cat_id` (`iav_cat_id`),
  CONSTRAINT `ecom_item_attribute_values_ibfk_1` FOREIGN KEY (`iav_itm_id`) REFERENCES `ecom_item` (`itm_id`),
  CONSTRAINT `ecom_item_attribute_values_ibfk_2` FOREIGN KEY (`iav_cat_id`) REFERENCES `ecom_category_attributes` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item_attribute_values`
--

LOCK TABLES `ecom_item_attribute_values` WRITE;
/*!40000 ALTER TABLE `ecom_item_attribute_values` DISABLE KEYS */;
INSERT INTO `ecom_item_attribute_values` VALUES (1,1,1,'500'),(2,1,2,'English');
/*!40000 ALTER TABLE `ecom_item_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item_categories`
--

DROP TABLE IF EXISTS `ecom_item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item_categories` (
  `ict_id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_parent_id` int(11) DEFAULT NULL,
  `ict_category_id` int(11) NOT NULL,
  `ict_label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ict_id`),
  FULLTEXT KEY `ecom_item_categories_cat_search` (`ict_label`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item_categories`
--

LOCK TABLES `ecom_item_categories` WRITE;
/*!40000 ALTER TABLE `ecom_item_categories` DISABLE KEYS */;
INSERT INTO `ecom_item_categories` VALUES (1,NULL,1,'Home'),(2,NULL,2,'Business'),(3,NULL,3,'Hobbies'),(4,1,4,'Gardening'),(5,1,5,'Kitchen'),(6,2,7,'Development'),(7,2,8,'Marketing'),(8,3,10,'Soccer'),(9,3,11,'Reading'),(10,NULL,12,'Books');
/*!40000 ALTER TABLE `ecom_item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item_categories_mm`
--

DROP TABLE IF EXISTS `ecom_item_categories_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item_categories_mm` (
  `itc_id` int(11) NOT NULL AUTO_INCREMENT,
  `itc_item_id` int(11) NOT NULL,
  `itc_ict_id` int(11) NOT NULL,
  PRIMARY KEY (`itc_id`),
  UNIQUE KEY `ecom_item_categories_mm_idx1` (`itc_item_id`,`itc_ict_id`),
  KEY `ecom_item_categories_mm_ibfk_2` (`itc_ict_id`),
  CONSTRAINT `ecom_item_categories_mm_ibfk_1` FOREIGN KEY (`itc_item_id`) REFERENCES `ecom_item` (`itm_id`),
  CONSTRAINT `ecom_item_categories_mm_ibfk_2` FOREIGN KEY (`itc_ict_id`) REFERENCES `ecom_item_categories` (`ict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item_categories_mm`
--

LOCK TABLES `ecom_item_categories_mm` WRITE;
/*!40000 ALTER TABLE `ecom_item_categories_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_item_categories_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item_pics`
--

DROP TABLE IF EXISTS `ecom_item_pics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item_pics` (
  `itp_id` int(11) NOT NULL AUTO_INCREMENT,
  `itp_itm_id` int(11) NOT NULL,
  `itp_picture_uri` varchar(2048) NOT NULL,
  PRIMARY KEY (`itp_id`),
  KEY `itp_itm_id` (`itp_itm_id`),
  CONSTRAINT `ecom_item_pics_ibfk_1` FOREIGN KEY (`itp_itm_id`) REFERENCES `ecom_item` (`itm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item_pics`
--

LOCK TABLES `ecom_item_pics` WRITE;
/*!40000 ALTER TABLE `ecom_item_pics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_item_pics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_item_seller`
--

DROP TABLE IF EXISTS `ecom_item_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_item_seller` (
  `sel_id` int(11) NOT NULL AUTO_INCREMENT,
  `sel_display_name` varchar(200) NOT NULL,
  `sel_average_rating` double DEFAULT '0',
  `sel_country` int(11) NOT NULL,
  `sel_url` varchar(2048) NOT NULL,
  `sel_email` varchar(255) NOT NULL,
  PRIMARY KEY (`sel_id`),
  UNIQUE KEY `sel_display_name` (`sel_display_name`),
  KEY `seller_country_fk_idx` (`sel_country`),
  CONSTRAINT `seller_country_fk` FOREIGN KEY (`sel_country`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_item_seller`
--

LOCK TABLES `ecom_item_seller` WRITE;
/*!40000 ALTER TABLE `ecom_item_seller` DISABLE KEYS */;
INSERT INTO `ecom_item_seller` VALUES (1,'Press & Co',5,2,'http://www.press-and-co.com','support@press-and-co.com');
/*!40000 ALTER TABLE `ecom_item_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_list_type`
--

DROP TABLE IF EXISTS `ecom_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_list_type` (
  `elt_id` int(11) NOT NULL AUTO_INCREMENT,
  `elt_description` varchar(200) NOT NULL,
  PRIMARY KEY (`elt_id`),
  UNIQUE KEY `elt_description` (`elt_description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_list_type`
--

LOCK TABLES `ecom_list_type` WRITE;
/*!40000 ALTER TABLE `ecom_list_type` DISABLE KEYS */;
INSERT INTO `ecom_list_type` VALUES (2,'Wedding List'),(1,'Wish List');
/*!40000 ALTER TABLE `ecom_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_mobile`
--

DROP TABLE IF EXISTS `ecom_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_mobile` (
  `mbl_id` int(11) NOT NULL AUTO_INCREMENT,
  `mbl_mobile` varchar(22) NOT NULL,
  `mbl_order` int(11) DEFAULT '0',
  PRIMARY KEY (`mbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_mobile`
--

LOCK TABLES `ecom_mobile` WRITE;
/*!40000 ALTER TABLE `ecom_mobile` DISABLE KEYS */;
INSERT INTO `ecom_mobile` VALUES (1,'009613254993',0);
/*!40000 ALTER TABLE `ecom_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_order`
--

DROP TABLE IF EXISTS `ecom_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_order` (
  `odr_id` int(11) NOT NULL AUTO_INCREMENT,
  `odr_tracking_number` varchar(200) NOT NULL,
  `odr_shipping_adr` int(11) NOT NULL,
  `odr_billing_adr` int(11) DEFAULT NULL,
  `odr_gift` int(11) DEFAULT '0',
  `odr_courrier_company` int(11) NOT NULL,
  `odr_cst_charges_amount` double DEFAULT '0',
  `odr_cst_charges_currency` int(11) NOT NULL,
  `odr_cst_charged_on` datetime NOT NULL,
  `odr_delivered_on` datetime DEFAULT NULL,
  `odr_rating` int(11) DEFAULT '-1',
  PRIMARY KEY (`odr_id`),
  UNIQUE KEY `odr_tracking_number` (`odr_tracking_number`),
  KEY `odr_shipping_adr` (`odr_shipping_adr`),
  KEY `odr_billing_adr` (`odr_billing_adr`),
  KEY `odr_courrier_company` (`odr_courrier_company`),
  KEY `ecom_order_ibfk_5_idx` (`odr_cst_charges_currency`),
  CONSTRAINT `ecom_order_ibfk_2` FOREIGN KEY (`odr_shipping_adr`) REFERENCES `ecom_address` (`adr_id`),
  CONSTRAINT `ecom_order_ibfk_3` FOREIGN KEY (`odr_billing_adr`) REFERENCES `ecom_address` (`adr_id`),
  CONSTRAINT `ecom_order_ibfk_4` FOREIGN KEY (`odr_courrier_company`) REFERENCES `ecom_courrier` (`crr_id`),
  CONSTRAINT `ecom_order_ibfk_5` FOREIGN KEY (`odr_cst_charges_currency`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_order`
--

LOCK TABLES `ecom_order` WRITE;
/*!40000 ALTER TABLE `ecom_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_order_history`
--

DROP TABLE IF EXISTS `ecom_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_order_history` (
  `odh_id` int(11) NOT NULL AUTO_INCREMENT,
  `odh_status_mod_date` datetime DEFAULT NULL,
  `odh_status_desc` varchar(200) DEFAULT NULL,
  `odh_status` int(11) NOT NULL,
  `odh_status_subject` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`odh_id`),
  KEY `odh_status` (`odh_status`),
  CONSTRAINT `ecom_order_history_ibfk_1` FOREIGN KEY (`odh_status`) REFERENCES `ecom_order_status` (`ods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_order_history`
--

LOCK TABLES `ecom_order_history` WRITE;
/*!40000 ALTER TABLE `ecom_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_order_item_mm`
--

DROP TABLE IF EXISTS `ecom_order_item_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_order_item_mm` (
  `odm_id` int(11) NOT NULL AUTO_INCREMENT,
  `odm_odr_id` int(11) NOT NULL,
  `odm_itm_id` int(11) NOT NULL,
  `odm_charged_price` double DEFAULT '0',
  `odm_charged_currency` int(11) NOT NULL,
  `odm_quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`odm_id`),
  UNIQUE KEY `ecom_order_item_mm_idx1` (`odm_odr_id`,`odm_itm_id`),
  KEY `odm_itm_id` (`odm_itm_id`),
  KEY `ecom_order_item_mm_ibfk_3_idx` (`odm_charged_currency`),
  CONSTRAINT `ecom_order_item_mm_ibfk_1` FOREIGN KEY (`odm_odr_id`) REFERENCES `ecom_order` (`odr_id`),
  CONSTRAINT `ecom_order_item_mm_ibfk_2` FOREIGN KEY (`odm_itm_id`) REFERENCES `ecom_item` (`itm_id`),
  CONSTRAINT `ecom_order_item_mm_ibfk_3` FOREIGN KEY (`odm_charged_currency`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_order_item_mm`
--

LOCK TABLES `ecom_order_item_mm` WRITE;
/*!40000 ALTER TABLE `ecom_order_item_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_order_item_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_order_status`
--

DROP TABLE IF EXISTS `ecom_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_order_status` (
  `ods_id` int(11) NOT NULL AUTO_INCREMENT,
  `ods_status_description` varchar(200) NOT NULL,
  `ods_last_status` int(11) DEFAULT '0',
  PRIMARY KEY (`ods_id`),
  UNIQUE KEY `ods_status_description` (`ods_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_order_status`
--

LOCK TABLES `ecom_order_status` WRITE;
/*!40000 ALTER TABLE `ecom_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_payment`
--

DROP TABLE IF EXISTS `ecom_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_card_token` varchar(19) NOT NULL,
  `pay_card_expiry` varchar(4) DEFAULT NULL,
  `pay_card_cvv2` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_card_token` (`pay_card_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_payment`
--

LOCK TABLES `ecom_payment` WRITE;
/*!40000 ALTER TABLE `ecom_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_return_policy`
--

DROP TABLE IF EXISTS `ecom_return_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_return_policy` (
  `rtp_id` int(11) NOT NULL AUTO_INCREMENT,
  `rtp_description` varchar(200) NOT NULL,
  `rtp_policy_duration_in_days` int(11) DEFAULT '0',
  PRIMARY KEY (`rtp_id`),
  UNIQUE KEY `rtp_description` (`rtp_description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_return_policy`
--

LOCK TABLES `ecom_return_policy` WRITE;
/*!40000 ALTER TABLE `ecom_return_policy` DISABLE KEYS */;
INSERT INTO `ecom_return_policy` VALUES (1,'90 days money back guarantee',90),(2,'60 days money back guarantee',60),(3,'30 days money back guarantee',30);
/*!40000 ALTER TABLE `ecom_return_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_review`
--

DROP TABLE IF EXISTS `ecom_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_review` (
  `rvw_id` int(11) NOT NULL AUTO_INCREMENT,
  `rvw_rating` double DEFAULT '0',
  `rvw_review_uri` varchar(2048) DEFAULT NULL,
  `rvw_reported_count` int(11) DEFAULT '0',
  `rvw_parent_comment_id` int(11) DEFAULT NULL,
  `rvw_author_customer_id` int(11) DEFAULT NULL,
  `rvw_itm_id` int(11) NOT NULL,
  PRIMARY KEY (`rvw_id`),
  KEY `rvw_parent_comment_id` (`rvw_parent_comment_id`),
  KEY `ecom_review_ibfk_2_idx` (`rvw_author_customer_id`),
  KEY `ecom_review_ibfk_2_idx1` (`rvw_itm_id`),
  CONSTRAINT `ecom_review_ibfk_1` FOREIGN KEY (`rvw_parent_comment_id`) REFERENCES `ecom_review` (`rvw_id`),
  CONSTRAINT `ecom_review_ibfk_2` FOREIGN KEY (`rvw_author_customer_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_review_ibfk_3` FOREIGN KEY (`rvw_itm_id`) REFERENCES `ecom_item` (`itm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_review`
--

LOCK TABLES `ecom_review` WRITE;
/*!40000 ALTER TABLE `ecom_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_seller_address_mm`
--

DROP TABLE IF EXISTS `ecom_seller_address_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_seller_address_mm` (
  `csd_id` int(11) NOT NULL AUTO_INCREMENT,
  `csd_sel_id` int(11) NOT NULL,
  `csd_adr_id` int(11) NOT NULL,
  `csd_adr_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`csd_id`),
  UNIQUE KEY `ecom_seller_address_mm_idx1` (`csd_sel_id`,`csd_adr_id`),
  KEY `csd_adr_id` (`csd_adr_id`),
  CONSTRAINT `ecom_seller_address_mm_ibfk_1` FOREIGN KEY (`csd_sel_id`) REFERENCES `ecom_item_seller` (`sel_id`),
  CONSTRAINT `ecom_seller_address_mm_ibfk_2` FOREIGN KEY (`csd_adr_id`) REFERENCES `ecom_address` (`adr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_seller_address_mm`
--

LOCK TABLES `ecom_seller_address_mm` WRITE;
/*!40000 ALTER TABLE `ecom_seller_address_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_seller_address_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_shipping_charges`
--

DROP TABLE IF EXISTS `ecom_shipping_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_shipping_charges` (
  `shc_id` int(11) NOT NULL AUTO_INCREMENT,
  `shc_courrier_id` int(11) NOT NULL,
  `shc_departure_city` varchar(100) NOT NULL,
  `shc_arrival_city` varchar(100) NOT NULL,
  `shc_min_volume_in_inch2` double NOT NULL,
  `shc_max_volume_in_inch2` double NOT NULL,
  `shc_min_weight_in_lbps` double NOT NULL,
  `shc_max_weight_in_lbps` double NOT NULL,
  `shc_estimated_delivery_in_hours` int(11) NOT NULL,
  `shc_shipping_cost` double NOT NULL,
  `shc_shipping_currency` int(11) NOT NULL,
  `shc_last_mofified` datetime NOT NULL,
  `shc_departure_country` int(11) NOT NULL,
  `shc_arrival_country` int(11) NOT NULL,
  PRIMARY KEY (`shc_id`),
  KEY `ecom_shipping_charges_fk_1_idx` (`shc_shipping_currency`),
  KEY `ecom_shipping_charges_cnt1_idx` (`shc_departure_country`),
  KEY `ecom_shipping_charges_cnt2_idx` (`shc_arrival_country`),
  CONSTRAINT `ecom_shipping_charges_cnt1` FOREIGN KEY (`shc_departure_country`) REFERENCES `ecom_countries` (`cnt_id`),
  CONSTRAINT `ecom_shipping_charges_cnt2` FOREIGN KEY (`shc_arrival_country`) REFERENCES `ecom_countries` (`cnt_id`),
  CONSTRAINT `ecom_shipping_charges_fk_1` FOREIGN KEY (`shc_shipping_currency`) REFERENCES `ecom_countries` (`cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_shipping_charges`
--

LOCK TABLES `ecom_shipping_charges` WRITE;
/*!40000 ALTER TABLE `ecom_shipping_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_shipping_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_user_email_mm`
--

DROP TABLE IF EXISTS `ecom_user_email_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_user_email_mm` (
  `uml_id` int(11) NOT NULL AUTO_INCREMENT,
  `uml_cst_id` int(11) NOT NULL,
  `uml_eml_id` int(11) NOT NULL,
  PRIMARY KEY (`uml_id`),
  UNIQUE KEY `ecom_user_email_mm_idx1` (`uml_cst_id`,`uml_eml_id`),
  KEY `uml_eml_id` (`uml_eml_id`),
  CONSTRAINT `ecom_user_email_mm_ibfk_1` FOREIGN KEY (`uml_cst_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_user_email_mm_ibfk_2` FOREIGN KEY (`uml_eml_id`) REFERENCES `ecom_email` (`eml_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_user_email_mm`
--

LOCK TABLES `ecom_user_email_mm` WRITE;
/*!40000 ALTER TABLE `ecom_user_email_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_user_email_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_user_mobile_mm`
--

DROP TABLE IF EXISTS `ecom_user_mobile_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecom_user_mobile_mm` (
  `umb_id` int(11) NOT NULL AUTO_INCREMENT,
  `umb_cst_id` int(11) NOT NULL,
  `umb_mbl_id` int(11) NOT NULL,
  PRIMARY KEY (`umb_id`),
  UNIQUE KEY `ecom_user_mobile_mm_idx1` (`umb_cst_id`,`umb_mbl_id`),
  KEY `umb_mbl_id` (`umb_mbl_id`),
  CONSTRAINT `ecom_user_mobile_mm_ibfk_1` FOREIGN KEY (`umb_cst_id`) REFERENCES `ecom_customers` (`cst_id`),
  CONSTRAINT `ecom_user_mobile_mm_ibfk_2` FOREIGN KEY (`umb_mbl_id`) REFERENCES `ecom_mobile` (`mbl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_user_mobile_mm`
--

LOCK TABLES `ecom_user_mobile_mm` WRITE;
/*!40000 ALTER TABLE `ecom_user_mobile_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecom_user_mobile_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ecom_currency_v`
--

/*!50001 DROP VIEW IF EXISTS `ecom_currency_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ecom_currency_v` AS select `ecom_countries`.`cnt_id` AS `cnt_id`,`ecom_countries`.`cnt_iso_currency` AS `cnt_iso_currency` from `ecom_countries` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-29 22:55:53
