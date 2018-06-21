-- MySQL dump 10.13  Distrib 5.6.38, for Win32 (AMD64)
--
-- Host: localhost    Database: zoo
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `zoo_address`
--

DROP TABLE IF EXISTS `zoo_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_address`
--

LOCK TABLES `zoo_address` WRITE;
/*!40000 ALTER TABLE `zoo_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_api`
--

DROP TABLE IF EXISTS `zoo_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_api`
--

LOCK TABLES `zoo_api` WRITE;
/*!40000 ALTER TABLE `zoo_api` DISABLE KEYS */;
INSERT INTO `zoo_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES (1,'Default','3u317LLdQZrZValn6hueOlm1a9zef8Adl6RYiN4TKg3uH77Iie8cTXogJtwvbtR8FYn2Vdo637uvkDgPN1dK1rC9HOVPiTqJBk552OlcXLW6M9ru5PDcbuI5Kq5DtZAj1MQ2gBDl1zqF4fnsDKyIYileonn2sgNfnLoLSC923ZFzccTUiRzrUeGO3roMgASOvr55urMEIO7O6M5vOXWcNyBMwt6WWDM3QEwZS8Y7ZlTtwSGl3qNoK0Tf3ZUzBeHw',1,'2018-06-21 13:04:23','2018-06-21 13:04:23');
/*!40000 ALTER TABLE `zoo_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_api_ip`
--

DROP TABLE IF EXISTS `zoo_api_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_api_ip`
--

LOCK TABLES `zoo_api_ip` WRITE;
/*!40000 ALTER TABLE `zoo_api_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_api_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_api_session`
--

DROP TABLE IF EXISTS `zoo_api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_api_session`
--

LOCK TABLES `zoo_api_session` WRITE;
/*!40000 ALTER TABLE `zoo_api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_attribute`
--

DROP TABLE IF EXISTS `zoo_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_attribute`
--

LOCK TABLES `zoo_attribute` WRITE;
/*!40000 ALTER TABLE `zoo_attribute` DISABLE KEYS */;
INSERT INTO `zoo_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES (1,6,1),(2,6,5),(3,6,3),(4,3,1),(5,3,2),(6,3,3),(7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,3,8);
/*!40000 ALTER TABLE `zoo_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_attribute_description`
--

DROP TABLE IF EXISTS `zoo_attribute_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_attribute_description`
--

LOCK TABLES `zoo_attribute_description` WRITE;
/*!40000 ALTER TABLE `zoo_attribute_description` DISABLE KEYS */;
INSERT INTO `zoo_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES (1,1,'Description'),(2,1,'No. of Cores'),(3,1,'Clockspeed'),(4,1,'test 1'),(5,1,'test 2'),(6,1,'test 3'),(7,1,'test 4'),(8,1,'test 5'),(9,1,'test 6'),(10,1,'test 7'),(11,1,'test 8');
/*!40000 ALTER TABLE `zoo_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_attribute_group`
--

DROP TABLE IF EXISTS `zoo_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_attribute_group`
--

LOCK TABLES `zoo_attribute_group` WRITE;
/*!40000 ALTER TABLE `zoo_attribute_group` DISABLE KEYS */;
INSERT INTO `zoo_attribute_group` (`attribute_group_id`, `sort_order`) VALUES (3,2),(4,1),(5,3),(6,4);
/*!40000 ALTER TABLE `zoo_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_attribute_group_description`
--

DROP TABLE IF EXISTS `zoo_attribute_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_attribute_group_description`
--

LOCK TABLES `zoo_attribute_group_description` WRITE;
/*!40000 ALTER TABLE `zoo_attribute_group_description` DISABLE KEYS */;
INSERT INTO `zoo_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES (3,1,'Memory'),(4,1,'Technical'),(5,1,'Motherboard'),(6,1,'Processor');
/*!40000 ALTER TABLE `zoo_attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_banner`
--

DROP TABLE IF EXISTS `zoo_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_banner`
--

LOCK TABLES `zoo_banner` WRITE;
/*!40000 ALTER TABLE `zoo_banner` DISABLE KEYS */;
INSERT INTO `zoo_banner` (`banner_id`, `name`, `status`) VALUES (6,'HP Products',1),(7,'Home Page Slideshow',1),(8,'Manufacturers',1);
/*!40000 ALTER TABLE `zoo_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_banner_image`
--

DROP TABLE IF EXISTS `zoo_banner_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_banner_image`
--

LOCK TABLES `zoo_banner_image` WRITE;
/*!40000 ALTER TABLE `zoo_banner_image` DISABLE KEYS */;
INSERT INTO `zoo_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES (79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0),(80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0),(87,6,1,'HP Banner','index.php?route=product/manufacturer/info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0),(88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0),(89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0),(90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0),(91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0),(92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0),(93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0),(94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0),(95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0),(96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0),(97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0),(98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0);
/*!40000 ALTER TABLE `zoo_banner_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_cart`
--

DROP TABLE IF EXISTS `zoo_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_cart`
--

LOCK TABLES `zoo_cart` WRITE;
/*!40000 ALTER TABLE `zoo_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category`
--

DROP TABLE IF EXISTS `zoo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category`
--

LOCK TABLES `zoo_category` WRITE;
/*!40000 ALTER TABLE `zoo_category` DISABLE KEYS */;
INSERT INTO `zoo_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (24,'',0,1,1,5,1,'2009-01-20 02:36:26','2011-05-30 12:15:18'),(59,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(60,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(61,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(62,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(63,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(65,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(66,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(68,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(69,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(70,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(71,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(72,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(73,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(74,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(75,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(76,'no_image.jpg',0,1,1,0,1,'2018-06-21 13:18:04','2018-06-21 13:18:04');
/*!40000 ALTER TABLE `zoo_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category_description`
--

DROP TABLE IF EXISTS `zoo_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category_description`
--

LOCK TABLES `zoo_category_description` WRITE;
/*!40000 ALTER TABLE `zoo_category_description` DISABLE KEYS */;
INSERT INTO `zoo_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES (24,1,'Телефоны','','Телефоны','',''),(59,1,'Корма и лакомства','','Корма и лакомства','',''),(60,1,'Наполнители','','Наполнители','',''),(61,1,'Лотки и совки','','Лотки и совки','',''),(62,1,'Товары для прогулки и дрессировки (амуниция)','','Товары для прогулки и дрессировки (амуниция)','',''),(63,1,'Аксессуары для кормления','','Аксессуары для кормления','',''),(65,1,'Переноски, товары для транспортировки','','Переноски, товары для транспортировки','',''),(66,1,'Средства для ухода и гигиены','','Средства для ухода и гигиены','',''),(68,1,'Аксессуары','','Аксессуары','',''),(69,1,'Игрушки','','Игрушки','',''),(70,1,'Когтеточки и игровые комплексы','','Когтеточки и игровые комплексы','',''),(71,1,'Товары для ухода (груминг)','','Товары для ухода (груминг)','',''),(72,1,'Клетки, вольеры, будки','','Клетки, вольеры, будки','',''),(73,1,'Лежаки, домики, спальные места','','Лежаки, домики, спальные места','',''),(74,1,'Аквариумы и террариумы','','Аквариумы и террариумы','',''),(75,1,'Аксессуары для аквариумов','','Аксессуары для аквариумов','',''),(76,1,'Ветеринарная аптека','','Ветеринарная аптека','','');
/*!40000 ALTER TABLE `zoo_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category_filter`
--

DROP TABLE IF EXISTS `zoo_category_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category_filter`
--

LOCK TABLES `zoo_category_filter` WRITE;
/*!40000 ALTER TABLE `zoo_category_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_category_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category_path`
--

DROP TABLE IF EXISTS `zoo_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category_path`
--

LOCK TABLES `zoo_category_path` WRITE;
/*!40000 ALTER TABLE `zoo_category_path` DISABLE KEYS */;
INSERT INTO `zoo_category_path` (`category_id`, `path_id`, `level`) VALUES (24,24,0),(59,59,0),(60,60,0),(61,61,0),(62,62,0),(63,63,0),(65,65,0),(66,66,0),(68,68,0),(69,69,0),(70,70,0),(71,71,0),(72,72,0),(73,73,0),(74,74,0),(75,75,0),(76,76,0);
/*!40000 ALTER TABLE `zoo_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category_to_layout`
--

DROP TABLE IF EXISTS `zoo_category_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category_to_layout`
--

LOCK TABLES `zoo_category_to_layout` WRITE;
/*!40000 ALTER TABLE `zoo_category_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_category_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_category_to_store`
--

DROP TABLE IF EXISTS `zoo_category_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_category_to_store`
--

LOCK TABLES `zoo_category_to_store` WRITE;
/*!40000 ALTER TABLE `zoo_category_to_store` DISABLE KEYS */;
INSERT INTO `zoo_category_to_store` (`category_id`, `store_id`) VALUES (24,0),(59,0),(60,0),(61,0),(62,0),(63,0),(65,0),(66,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0);
/*!40000 ALTER TABLE `zoo_category_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_country`
--

DROP TABLE IF EXISTS `zoo_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_country`
--

LOCK TABLES `zoo_country` WRITE;
/*!40000 ALTER TABLE `zoo_country` DISABLE KEYS */;
INSERT INTO `zoo_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES (20,'Белоруссия (Беларусь)','BY','BLR','',0,1),(80,'Грузия','GE','GEO','',0,1),(109,'Казахстан','KZ','KAZ','',0,1),(115,'Киргизия (Кыргызстан)','KG','KGZ','',0,1),(176,'Российская Федерация','RU','RUS','',0,1),(220,'Украина','UA','UKR','',0,1),(226,'Узбекистан','UZ','UZB','',0,1);
/*!40000 ALTER TABLE `zoo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_coupon`
--

DROP TABLE IF EXISTS `zoo_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_coupon`
--

LOCK TABLES `zoo_coupon` WRITE;
/*!40000 ALTER TABLE `zoo_coupon` DISABLE KEYS */;
INSERT INTO `zoo_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES (4,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,'10',0,'2009-01-27 13:55:03'),(5,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,'10',0,'2009-03-14 21:13:53'),(6,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,'10000',0,'2009-03-14 21:15:18');
/*!40000 ALTER TABLE `zoo_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_coupon_category`
--

DROP TABLE IF EXISTS `zoo_coupon_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_coupon_category`
--

LOCK TABLES `zoo_coupon_category` WRITE;
/*!40000 ALTER TABLE `zoo_coupon_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_coupon_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_coupon_history`
--

DROP TABLE IF EXISTS `zoo_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_coupon_history`
--

LOCK TABLES `zoo_coupon_history` WRITE;
/*!40000 ALTER TABLE `zoo_coupon_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_coupon_product`
--

DROP TABLE IF EXISTS `zoo_coupon_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_coupon_product`
--

LOCK TABLES `zoo_coupon_product` WRITE;
/*!40000 ALTER TABLE `zoo_coupon_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_coupon_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_currency`
--

DROP TABLE IF EXISTS `zoo_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_currency`
--

LOCK TABLES `zoo_currency` WRITE;
/*!40000 ALTER TABLE `zoo_currency` DISABLE KEYS */;
INSERT INTO `zoo_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES (1,'Рубль','RUB','','р.','0',1.00000000,1,'2018-06-21 08:06:29');
/*!40000 ALTER TABLE `zoo_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_custom_field`
--

DROP TABLE IF EXISTS `zoo_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_custom_field`
--

LOCK TABLES `zoo_custom_field` WRITE;
/*!40000 ALTER TABLE `zoo_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_custom_field_customer_group`
--

DROP TABLE IF EXISTS `zoo_custom_field_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_custom_field_customer_group`
--

LOCK TABLES `zoo_custom_field_customer_group` WRITE;
/*!40000 ALTER TABLE `zoo_custom_field_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_custom_field_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_custom_field_description`
--

DROP TABLE IF EXISTS `zoo_custom_field_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_custom_field_description`
--

LOCK TABLES `zoo_custom_field_description` WRITE;
/*!40000 ALTER TABLE `zoo_custom_field_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_custom_field_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_custom_field_value`
--

DROP TABLE IF EXISTS `zoo_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_custom_field_value`
--

LOCK TABLES `zoo_custom_field_value` WRITE;
/*!40000 ALTER TABLE `zoo_custom_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_custom_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_custom_field_value_description`
--

DROP TABLE IF EXISTS `zoo_custom_field_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_custom_field_value_description`
--

LOCK TABLES `zoo_custom_field_value_description` WRITE;
/*!40000 ALTER TABLE `zoo_custom_field_value_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_custom_field_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer`
--

DROP TABLE IF EXISTS `zoo_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer`
--

LOCK TABLES `zoo_customer` WRITE;
/*!40000 ALTER TABLE `zoo_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_activity`
--

DROP TABLE IF EXISTS `zoo_customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_activity`
--

LOCK TABLES `zoo_customer_activity` WRITE;
/*!40000 ALTER TABLE `zoo_customer_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_affiliate`
--

DROP TABLE IF EXISTS `zoo_customer_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_affiliate`
--

LOCK TABLES `zoo_customer_affiliate` WRITE;
/*!40000 ALTER TABLE `zoo_customer_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_approval`
--

DROP TABLE IF EXISTS `zoo_customer_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_approval`
--

LOCK TABLES `zoo_customer_approval` WRITE;
/*!40000 ALTER TABLE `zoo_customer_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_group`
--

DROP TABLE IF EXISTS `zoo_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_group`
--

LOCK TABLES `zoo_customer_group` WRITE;
/*!40000 ALTER TABLE `zoo_customer_group` DISABLE KEYS */;
INSERT INTO `zoo_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES (1,0,1);
/*!40000 ALTER TABLE `zoo_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_group_description`
--

DROP TABLE IF EXISTS `zoo_customer_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_group_description`
--

LOCK TABLES `zoo_customer_group_description` WRITE;
/*!40000 ALTER TABLE `zoo_customer_group_description` DISABLE KEYS */;
INSERT INTO `zoo_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES (1,1,'Default','test');
/*!40000 ALTER TABLE `zoo_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_history`
--

DROP TABLE IF EXISTS `zoo_customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_history`
--

LOCK TABLES `zoo_customer_history` WRITE;
/*!40000 ALTER TABLE `zoo_customer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_ip`
--

DROP TABLE IF EXISTS `zoo_customer_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_ip`
--

LOCK TABLES `zoo_customer_ip` WRITE;
/*!40000 ALTER TABLE `zoo_customer_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_login`
--

DROP TABLE IF EXISTS `zoo_customer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_login`
--

LOCK TABLES `zoo_customer_login` WRITE;
/*!40000 ALTER TABLE `zoo_customer_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_online`
--

DROP TABLE IF EXISTS `zoo_customer_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_online`
--

LOCK TABLES `zoo_customer_online` WRITE;
/*!40000 ALTER TABLE `zoo_customer_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_reward`
--

DROP TABLE IF EXISTS `zoo_customer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_reward`
--

LOCK TABLES `zoo_customer_reward` WRITE;
/*!40000 ALTER TABLE `zoo_customer_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_search`
--

DROP TABLE IF EXISTS `zoo_customer_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_search`
--

LOCK TABLES `zoo_customer_search` WRITE;
/*!40000 ALTER TABLE `zoo_customer_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_transaction`
--

DROP TABLE IF EXISTS `zoo_customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_transaction`
--

LOCK TABLES `zoo_customer_transaction` WRITE;
/*!40000 ALTER TABLE `zoo_customer_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_customer_wishlist`
--

DROP TABLE IF EXISTS `zoo_customer_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_customer_wishlist`
--

LOCK TABLES `zoo_customer_wishlist` WRITE;
/*!40000 ALTER TABLE `zoo_customer_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_customer_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_download`
--

DROP TABLE IF EXISTS `zoo_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_download`
--

LOCK TABLES `zoo_download` WRITE;
/*!40000 ALTER TABLE `zoo_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_download_description`
--

DROP TABLE IF EXISTS `zoo_download_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_download_description`
--

LOCK TABLES `zoo_download_description` WRITE;
/*!40000 ALTER TABLE `zoo_download_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_download_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_event`
--

DROP TABLE IF EXISTS `zoo_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_event`
--

LOCK TABLES `zoo_event` WRITE;
/*!40000 ALTER TABLE `zoo_event` DISABLE KEYS */;
INSERT INTO `zoo_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES (1,'activity_customer_add','catalog/model/account/customer/addCustomer/after','event/activity/addCustomer',1,0),(2,'activity_customer_edit','catalog/model/account/customer/editCustomer/after','event/activity/editCustomer',1,0),(3,'activity_customer_password','catalog/model/account/customer/editPassword/after','event/activity/editPassword',1,0),(4,'activity_customer_forgotten','catalog/model/account/customer/editCode/after','event/activity/forgotten',1,0),(5,'activity_transaction','catalog/model/account/customer/addTransaction/after','event/activity/addTransaction',1,0),(6,'activity_customer_login','catalog/model/account/customer/deleteLoginAttempts/after','event/activity/login',1,0),(7,'activity_address_add','catalog/model/account/address/addAddress/after','event/activity/addAddress',1,0),(8,'activity_address_edit','catalog/model/account/address/editAddress/after','event/activity/editAddress',1,0),(9,'activity_address_delete','catalog/model/account/address/deleteAddress/after','event/activity/deleteAddress',1,0),(10,'activity_affiliate_add','catalog/model/account/customer/addAffiliate/after','event/activity/addAffiliate',1,0),(11,'activity_affiliate_edit','catalog/model/account/customer/editAffiliate/after','event/activity/editAffiliate',1,0),(12,'activity_order_add','catalog/model/checkout/order/addOrderHistory/before','event/activity/addOrderHistory',1,0),(13,'activity_return_add','catalog/model/account/return/addReturn/after','event/activity/addReturn',1,0),(14,'mail_transaction','catalog/model/account/customer/addTransaction/after','mail/transaction',1,0),(15,'mail_forgotten','catalog/model/account/customer/editCode/after','mail/forgotten',1,0),(16,'mail_customer_add','catalog/model/account/customer/addCustomer/after','mail/register',1,0),(17,'mail_customer_alert','catalog/model/account/customer/addCustomer/after','mail/register/alert',1,0),(18,'mail_affiliate_add','catalog/model/account/customer/addAffiliate/after','mail/affiliate',1,0),(19,'mail_affiliate_alert','catalog/model/account/customer/addAffiliate/after','mail/affiliate/alert',1,0),(20,'mail_voucher','catalog/model/checkout/order/addOrderHistory/after','extension/total/voucher/send',1,0),(21,'mail_order_add','catalog/model/checkout/order/addOrderHistory/before','mail/order',1,0),(22,'mail_order_alert','catalog/model/checkout/order/addOrderHistory/before','mail/order/alert',1,0),(23,'statistics_review_add','catalog/model/catalog/review/addReview/after','event/statistics/addReview',1,0),(24,'statistics_return_add','catalog/model/account/return/addReturn/after','event/statistics/addReturn',1,0),(25,'statistics_order_history','catalog/model/checkout/order/addOrderHistory/after','event/statistics/addOrderHistory',1,0),(26,'admin_mail_affiliate_approve','admin/model/customer/customer_approval/approveAffiliate/after','mail/affiliate/approve',1,0),(27,'admin_mail_affiliate_deny','admin/model/customer/customer_approval/denyAffiliate/after','mail/affiliate/deny',1,0),(28,'admin_mail_customer_approve','admin/model/customer/customer_approval/approveCustomer/after','mail/customer/approve',1,0),(29,'admin_mail_customer_deny','admin/model/customer/customer_approval/denyCustomer/after','mail/customer/deny',1,0),(30,'admin_mail_reward','admin/model/customer/customer/addReward/after','mail/reward',1,0),(31,'admin_mail_transaction','admin/model/customer/customer/addTransaction/after','mail/transaction',1,0),(32,'admin_mail_return','admin/model/sale/return/addReturn/after','mail/return',1,0),(33,'admin_mail_forgotten','admin/model/user/user/editCode/after','mail/forgotten',1,0);
/*!40000 ALTER TABLE `zoo_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_extension`
--

DROP TABLE IF EXISTS `zoo_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_extension`
--

LOCK TABLES `zoo_extension` WRITE;
/*!40000 ALTER TABLE `zoo_extension` DISABLE KEYS */;
INSERT INTO `zoo_extension` (`extension_id`, `type`, `code`) VALUES (1,'payment','cod'),(2,'total','shipping'),(3,'total','sub_total'),(4,'total','tax'),(5,'total','total'),(6,'module','banner'),(7,'module','carousel'),(8,'total','credit'),(9,'shipping','flat'),(10,'total','handling'),(11,'total','low_order_fee'),(12,'total','coupon'),(13,'module','category'),(14,'module','account'),(15,'total','reward'),(16,'total','voucher'),(17,'payment','free_checkout'),(18,'module','featured'),(19,'module','slideshow'),(20,'theme','default'),(21,'dashboard','activity'),(22,'dashboard','sale'),(23,'dashboard','recent'),(24,'dashboard','order'),(25,'dashboard','online'),(26,'dashboard','map'),(27,'dashboard','customer'),(28,'dashboard','chart'),(29,'report','sale_coupon'),(31,'report','customer_search'),(32,'report','customer_transaction'),(33,'report','product_purchased'),(34,'report','product_viewed'),(35,'report','sale_return'),(36,'report','sale_order'),(37,'report','sale_shipping'),(38,'report','sale_tax'),(39,'report','customer_activity'),(40,'report','customer_order'),(41,'report','customer_reward'),(42,'module','import_xls');
/*!40000 ALTER TABLE `zoo_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_extension_install`
--

DROP TABLE IF EXISTS `zoo_extension_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_extension_install`
--

LOCK TABLES `zoo_extension_install` WRITE;
/*!40000 ALTER TABLE `zoo_extension_install` DISABLE KEYS */;
INSERT INTO `zoo_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES (1,0,'2.3.0.0-to-3.X-import-xls-basic.ocmod.zip','2018-06-21 13:08:51');
/*!40000 ALTER TABLE `zoo_extension_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_extension_path`
--

DROP TABLE IF EXISTS `zoo_extension_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_extension_path`
--

LOCK TABLES `zoo_extension_path` WRITE;
/*!40000 ALTER TABLE `zoo_extension_path` DISABLE KEYS */;
INSERT INTO `zoo_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES (1,1,'admin/language/english','2018-06-21 13:08:52'),(2,1,'system/library/Spout','2018-06-21 13:08:52'),(3,1,'admin/language/english/devmanextensions','2018-06-21 13:08:52'),(4,1,'admin/language/english/extension','2018-06-21 13:08:52'),(5,1,'admin/model/extension/devmanextensions','2018-06-21 13:08:52'),(6,1,'admin/model/extension/module','2018-06-21 13:08:52'),(7,1,'system/library/Spout/Autoloader','2018-06-21 13:08:52'),(8,1,'system/library/Spout/Common','2018-06-21 13:08:52'),(9,1,'system/library/Spout/Reader','2018-06-21 13:08:52'),(10,1,'system/library/Spout/Writer','2018-06-21 13:08:52'),(11,1,'admin/controller/extension/module/import_xls.php','2018-06-21 13:08:52'),(12,1,'admin/language/english/devmanextensions/tools_trial.php','2018-06-21 13:08:52'),(13,1,'admin/language/english/extension/module','2018-06-21 13:08:52'),(14,1,'admin/model/extension/devmanextensions/tools_trial.php','2018-06-21 13:08:52'),(15,1,'admin/model/extension/module/export_xls.php','2018-06-21 13:08:52'),(16,1,'admin/model/extension/module/import_export_xls.php','2018-06-21 13:08:52'),(17,1,'admin/model/extension/module/import_xls.php','2018-06-21 13:08:52'),(18,1,'system/library/Spout/Autoloader/Psr4Autoloader.php','2018-06-21 13:08:52'),(19,1,'system/library/Spout/Autoloader/autoload.php','2018-06-21 13:08:52'),(20,1,'system/library/Spout/Common/Escaper','2018-06-21 13:08:52'),(21,1,'system/library/Spout/Common/Exception','2018-06-21 13:08:52'),(22,1,'system/library/Spout/Common/Helper','2018-06-21 13:08:52'),(23,1,'system/library/Spout/Common/Singleton.php','2018-06-21 13:08:52'),(24,1,'system/library/Spout/Common/Type.php','2018-06-21 13:08:52'),(25,1,'system/library/Spout/Reader/AbstractReader.php','2018-06-21 13:08:52'),(26,1,'system/library/Spout/Reader/CSV','2018-06-21 13:08:52'),(27,1,'system/library/Spout/Reader/Common','2018-06-21 13:08:52'),(28,1,'system/library/Spout/Reader/Exception','2018-06-21 13:08:52'),(29,1,'system/library/Spout/Reader/IteratorInterface.php','2018-06-21 13:08:52'),(30,1,'system/library/Spout/Reader/ODS','2018-06-21 13:08:52'),(31,1,'system/library/Spout/Reader/ReaderFactory.php','2018-06-21 13:08:52'),(32,1,'system/library/Spout/Reader/ReaderInterface.php','2018-06-21 13:08:52'),(33,1,'system/library/Spout/Reader/SheetInterface.php','2018-06-21 13:08:52'),(34,1,'system/library/Spout/Reader/Wrapper','2018-06-21 13:08:52'),(35,1,'system/library/Spout/Reader/XLSX','2018-06-21 13:08:52'),(36,1,'system/library/Spout/Writer/AbstractMultiSheetsWriter.php','2018-06-21 13:08:52'),(37,1,'system/library/Spout/Writer/AbstractWriter.php','2018-06-21 13:08:52'),(38,1,'system/library/Spout/Writer/CSV','2018-06-21 13:08:52'),(39,1,'system/library/Spout/Writer/Common','2018-06-21 13:08:52'),(40,1,'system/library/Spout/Writer/Exception','2018-06-21 13:08:52'),(41,1,'system/library/Spout/Writer/ODS','2018-06-21 13:08:52'),(42,1,'system/library/Spout/Writer/Style','2018-06-21 13:08:52'),(43,1,'system/library/Spout/Writer/WriterFactory.php','2018-06-21 13:08:52'),(44,1,'system/library/Spout/Writer/WriterInterface.php','2018-06-21 13:08:52'),(45,1,'system/library/Spout/Writer/XLSX','2018-06-21 13:08:52'),(46,1,'admin/language/en-gb/extension/module/import_xls.php','2018-06-21 13:08:52'),(47,1,'admin/language/english/extension/module/import_xls.php','2018-06-21 13:08:52'),(48,1,'admin/view/template/extension/module/import_xls.tpl','2018-06-21 13:08:52'),(49,1,'admin/view/template/extension/module/import_xls.twig','2018-06-21 13:08:52'),(50,1,'admin/view/template/extension/module/import_xls_files','2018-06-21 13:08:52'),(51,1,'system/library/Spout/Common/Escaper/CSV.php','2018-06-21 13:08:52'),(52,1,'system/library/Spout/Common/Escaper/EscaperInterface.php','2018-06-21 13:08:52'),(53,1,'system/library/Spout/Common/Escaper/ODS.php','2018-06-21 13:08:52'),(54,1,'system/library/Spout/Common/Escaper/XLSX.php','2018-06-21 13:08:52'),(55,1,'system/library/Spout/Common/Exception/EncodingConversionException.php','2018-06-21 13:08:52'),(56,1,'system/library/Spout/Common/Exception/IOException.php','2018-06-21 13:08:52'),(57,1,'system/library/Spout/Common/Exception/InvalidArgumentException.php','2018-06-21 13:08:52'),(58,1,'system/library/Spout/Common/Exception/SpoutException.php','2018-06-21 13:08:52'),(59,1,'system/library/Spout/Common/Exception/UnsupportedTypeException.php','2018-06-21 13:08:52'),(60,1,'system/library/Spout/Common/Helper/EncodingHelper.php','2018-06-21 13:08:52'),(61,1,'system/library/Spout/Common/Helper/FileSystemHelper.php','2018-06-21 13:08:52'),(62,1,'system/library/Spout/Common/Helper/GlobalFunctionsHelper.php','2018-06-21 13:08:52'),(63,1,'system/library/Spout/Common/Helper/StringHelper.php','2018-06-21 13:08:52'),(64,1,'system/library/Spout/Reader/CSV/Reader.php','2018-06-21 13:08:52'),(65,1,'system/library/Spout/Reader/CSV/ReaderOptions.php','2018-06-21 13:08:52'),(66,1,'system/library/Spout/Reader/CSV/RowIterator.php','2018-06-21 13:08:52'),(67,1,'system/library/Spout/Reader/CSV/Sheet.php','2018-06-21 13:08:52'),(68,1,'system/library/Spout/Reader/CSV/SheetIterator.php','2018-06-21 13:08:52'),(69,1,'system/library/Spout/Reader/Common/ReaderOptions.php','2018-06-21 13:08:52'),(70,1,'system/library/Spout/Reader/Common/XMLProcessor.php','2018-06-21 13:08:52'),(71,1,'system/library/Spout/Reader/Exception/IteratorNotRewindableException.php','2018-06-21 13:08:52'),(72,1,'system/library/Spout/Reader/Exception/NoSheetsFoundException.php','2018-06-21 13:08:52'),(73,1,'system/library/Spout/Reader/Exception/ReaderException.php','2018-06-21 13:08:52'),(74,1,'system/library/Spout/Reader/Exception/ReaderNotOpenedException.php','2018-06-21 13:08:52'),(75,1,'system/library/Spout/Reader/Exception/SharedStringNotFoundException.php','2018-06-21 13:08:52'),(76,1,'system/library/Spout/Reader/Exception/XMLProcessingException.php','2018-06-21 13:08:52'),(77,1,'system/library/Spout/Reader/ODS/Helper','2018-06-21 13:08:52'),(78,1,'system/library/Spout/Reader/ODS/Reader.php','2018-06-21 13:08:52'),(79,1,'system/library/Spout/Reader/ODS/ReaderOptions.php','2018-06-21 13:08:52'),(80,1,'system/library/Spout/Reader/ODS/RowIterator.php','2018-06-21 13:08:52'),(81,1,'system/library/Spout/Reader/ODS/Sheet.php','2018-06-21 13:08:52'),(82,1,'system/library/Spout/Reader/ODS/SheetIterator.php','2018-06-21 13:08:52'),(83,1,'system/library/Spout/Reader/Wrapper/XMLInternalErrorsHelper.php','2018-06-21 13:08:52'),(84,1,'system/library/Spout/Reader/Wrapper/XMLReader.php','2018-06-21 13:08:52'),(85,1,'system/library/Spout/Reader/XLSX/Helper','2018-06-21 13:08:52'),(86,1,'system/library/Spout/Reader/XLSX/Reader.php','2018-06-21 13:08:52'),(87,1,'system/library/Spout/Reader/XLSX/ReaderOptions.php','2018-06-21 13:08:52'),(88,1,'system/library/Spout/Reader/XLSX/RowIterator.php','2018-06-21 13:08:52'),(89,1,'system/library/Spout/Reader/XLSX/Sheet.php','2018-06-21 13:08:52'),(90,1,'system/library/Spout/Reader/XLSX/SheetIterator.php','2018-06-21 13:08:52'),(91,1,'system/library/Spout/Writer/CSV/Writer.php','2018-06-21 13:08:52'),(92,1,'system/library/Spout/Writer/Common/Helper','2018-06-21 13:08:52'),(93,1,'system/library/Spout/Writer/Common/Internal','2018-06-21 13:08:52'),(94,1,'system/library/Spout/Writer/Common/Sheet.php','2018-06-21 13:08:52'),(95,1,'system/library/Spout/Writer/Exception/Border','2018-06-21 13:08:52'),(96,1,'system/library/Spout/Writer/Exception/InvalidColorException.php','2018-06-21 13:08:52'),(97,1,'system/library/Spout/Writer/Exception/InvalidSheetNameException.php','2018-06-21 13:08:52'),(98,1,'system/library/Spout/Writer/Exception/SheetNotFoundException.php','2018-06-21 13:08:52'),(99,1,'system/library/Spout/Writer/Exception/WriterAlreadyOpenedException.php','2018-06-21 13:08:52'),(100,1,'system/library/Spout/Writer/Exception/WriterException.php','2018-06-21 13:08:52'),(101,1,'system/library/Spout/Writer/Exception/WriterNotOpenedException.php','2018-06-21 13:08:52'),(102,1,'system/library/Spout/Writer/ODS/Helper','2018-06-21 13:08:52'),(103,1,'system/library/Spout/Writer/ODS/Internal','2018-06-21 13:08:52'),(104,1,'system/library/Spout/Writer/ODS/Writer.php','2018-06-21 13:08:52'),(105,1,'system/library/Spout/Writer/Style/Border.php','2018-06-21 13:08:52'),(106,1,'system/library/Spout/Writer/Style/BorderBuilder.php','2018-06-21 13:08:52'),(107,1,'system/library/Spout/Writer/Style/BorderPart.php','2018-06-21 13:08:52'),(108,1,'system/library/Spout/Writer/Style/Color.php','2018-06-21 13:08:52'),(109,1,'system/library/Spout/Writer/Style/Style.php','2018-06-21 13:08:52'),(110,1,'system/library/Spout/Writer/Style/StyleBuilder.php','2018-06-21 13:08:52'),(111,1,'system/library/Spout/Writer/XLSX/Helper','2018-06-21 13:08:52'),(112,1,'system/library/Spout/Writer/XLSX/Internal','2018-06-21 13:08:52'),(113,1,'system/library/Spout/Writer/XLSX/Writer.php','2018-06-21 13:08:52'),(114,1,'admin/view/template/extension/module/import_xls_files/export_backups','2018-06-21 13:08:52'),(115,1,'admin/view/template/extension/module/import_xls_files/progress.json','2018-06-21 13:08:52'),(116,1,'system/library/Spout/Reader/ODS/Helper/CellValueFormatter.php','2018-06-21 13:08:52'),(117,1,'system/library/Spout/Reader/ODS/Helper/SettingsHelper.php','2018-06-21 13:08:52'),(118,1,'system/library/Spout/Reader/XLSX/Helper/CellHelper.php','2018-06-21 13:08:52'),(119,1,'system/library/Spout/Reader/XLSX/Helper/CellValueFormatter.php','2018-06-21 13:08:52'),(120,1,'system/library/Spout/Reader/XLSX/Helper/DateFormatHelper.php','2018-06-21 13:08:52'),(121,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsCaching','2018-06-21 13:08:52'),(122,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsHelper.php','2018-06-21 13:08:52'),(123,1,'system/library/Spout/Reader/XLSX/Helper/SheetHelper.php','2018-06-21 13:08:52'),(124,1,'system/library/Spout/Reader/XLSX/Helper/StyleHelper.php','2018-06-21 13:08:52'),(125,1,'system/library/Spout/Writer/Common/Helper/AbstractStyleHelper.php','2018-06-21 13:08:52'),(126,1,'system/library/Spout/Writer/Common/Helper/CellHelper.php','2018-06-21 13:08:52'),(127,1,'system/library/Spout/Writer/Common/Helper/ZipHelper.php','2018-06-21 13:08:52'),(128,1,'system/library/Spout/Writer/Common/Internal/AbstractWorkbook.php','2018-06-21 13:08:52'),(129,1,'system/library/Spout/Writer/Common/Internal/WorkbookInterface.php','2018-06-21 13:08:52'),(130,1,'system/library/Spout/Writer/Common/Internal/WorksheetInterface.php','2018-06-21 13:08:52'),(131,1,'system/library/Spout/Writer/Exception/Border/InvalidNameException.php','2018-06-21 13:08:52'),(132,1,'system/library/Spout/Writer/Exception/Border/InvalidStyleException.php','2018-06-21 13:08:52'),(133,1,'system/library/Spout/Writer/Exception/Border/InvalidWidthException.php','2018-06-21 13:08:52'),(134,1,'system/library/Spout/Writer/ODS/Helper/BorderHelper.php','2018-06-21 13:08:52'),(135,1,'system/library/Spout/Writer/ODS/Helper/FileSystemHelper.php','2018-06-21 13:08:52'),(136,1,'system/library/Spout/Writer/ODS/Helper/StyleHelper.php','2018-06-21 13:08:52'),(137,1,'system/library/Spout/Writer/ODS/Internal/Workbook.php','2018-06-21 13:08:52'),(138,1,'system/library/Spout/Writer/ODS/Internal/Worksheet.php','2018-06-21 13:08:52'),(139,1,'system/library/Spout/Writer/XLSX/Helper/BorderHelper.php','2018-06-21 13:08:52'),(140,1,'system/library/Spout/Writer/XLSX/Helper/FileSystemHelper.php','2018-06-21 13:08:52'),(141,1,'system/library/Spout/Writer/XLSX/Helper/SharedStringsHelper.php','2018-06-21 13:08:52'),(142,1,'system/library/Spout/Writer/XLSX/Helper/StyleHelper.php','2018-06-21 13:08:52'),(143,1,'system/library/Spout/Writer/XLSX/Internal/Workbook.php','2018-06-21 13:08:52'),(144,1,'system/library/Spout/Writer/XLSX/Internal/Worksheet.php','2018-06-21 13:08:52'),(145,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsCaching/CachingStrategyFactory.php','2018-06-21 13:08:52'),(146,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsCaching/CachingStrategyInterface.php','2018-06-21 13:08:52'),(147,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsCaching/FileBasedStrategy.php','2018-06-21 13:08:52'),(148,1,'system/library/Spout/Reader/XLSX/Helper/SharedStringsCaching/InMemoryStrategy.php','2018-06-21 13:08:52');
/*!40000 ALTER TABLE `zoo_extension_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_filter`
--

DROP TABLE IF EXISTS `zoo_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_filter`
--

LOCK TABLES `zoo_filter` WRITE;
/*!40000 ALTER TABLE `zoo_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_filter_description`
--

DROP TABLE IF EXISTS `zoo_filter_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_filter_description`
--

LOCK TABLES `zoo_filter_description` WRITE;
/*!40000 ALTER TABLE `zoo_filter_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_filter_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_filter_group`
--

DROP TABLE IF EXISTS `zoo_filter_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_filter_group`
--

LOCK TABLES `zoo_filter_group` WRITE;
/*!40000 ALTER TABLE `zoo_filter_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_filter_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_filter_group_description`
--

DROP TABLE IF EXISTS `zoo_filter_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_filter_group_description`
--

LOCK TABLES `zoo_filter_group_description` WRITE;
/*!40000 ALTER TABLE `zoo_filter_group_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_filter_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_geo_zone`
--

DROP TABLE IF EXISTS `zoo_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_geo_zone`
--

LOCK TABLES `zoo_geo_zone` WRITE;
/*!40000 ALTER TABLE `zoo_geo_zone` DISABLE KEYS */;
INSERT INTO `zoo_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES (3,'Зона НДС','Облагаемые НДС','2014-05-21 22:30:20','2014-09-09 11:48:13');
/*!40000 ALTER TABLE `zoo_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_information`
--

DROP TABLE IF EXISTS `zoo_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_information`
--

LOCK TABLES `zoo_information` WRITE;
/*!40000 ALTER TABLE `zoo_information` DISABLE KEYS */;
INSERT INTO `zoo_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES (3,1,3,1),(4,1,1,1),(5,1,4,1),(6,1,2,1);
/*!40000 ALTER TABLE `zoo_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_information_description`
--

DROP TABLE IF EXISTS `zoo_information_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_information_description`
--

LOCK TABLES `zoo_information_description` WRITE;
/*!40000 ALTER TABLE `zoo_information_description` DISABLE KEYS */;
INSERT INTO `zoo_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES (3,1,'Политика Безопасности','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;','Политика Безопасности','',''),(4,1,'О нас','&lt;p&gt;\r\n	About Us&lt;/p&gt;','О нас','',''),(5,1,'Условия соглашения','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;','Условия соглашения','',''),(6,1,'Доставка','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;','Доставка','','');
/*!40000 ALTER TABLE `zoo_information_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_information_to_layout`
--

DROP TABLE IF EXISTS `zoo_information_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_information_to_layout`
--

LOCK TABLES `zoo_information_to_layout` WRITE;
/*!40000 ALTER TABLE `zoo_information_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_information_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_information_to_store`
--

DROP TABLE IF EXISTS `zoo_information_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_information_to_store`
--

LOCK TABLES `zoo_information_to_store` WRITE;
/*!40000 ALTER TABLE `zoo_information_to_store` DISABLE KEYS */;
INSERT INTO `zoo_information_to_store` (`information_id`, `store_id`) VALUES (3,0),(4,0),(5,0),(6,0);
/*!40000 ALTER TABLE `zoo_information_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_language`
--

DROP TABLE IF EXISTS `zoo_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_language`
--

LOCK TABLES `zoo_language` WRITE;
/*!40000 ALTER TABLE `zoo_language` DISABLE KEYS */;
INSERT INTO `zoo_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES (1,'Russian','ru-ru','ru_RU.UTF-8,ru_RU,russian','ru-ru.png','russian',1,1);
/*!40000 ALTER TABLE `zoo_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_layout`
--

DROP TABLE IF EXISTS `zoo_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_layout`
--

LOCK TABLES `zoo_layout` WRITE;
/*!40000 ALTER TABLE `zoo_layout` DISABLE KEYS */;
INSERT INTO `zoo_layout` (`layout_id`, `name`) VALUES (1,'Home'),(2,'Product'),(3,'Category'),(4,'Default'),(5,'Manufacturer'),(6,'Account'),(7,'Checkout'),(8,'Contact'),(9,'Sitemap'),(10,'Affiliate'),(11,'Information'),(12,'Compare'),(13,'Search');
/*!40000 ALTER TABLE `zoo_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_layout_module`
--

DROP TABLE IF EXISTS `zoo_layout_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_layout_module`
--

LOCK TABLES `zoo_layout_module` WRITE;
/*!40000 ALTER TABLE `zoo_layout_module` DISABLE KEYS */;
INSERT INTO `zoo_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES (2,4,'0','content_top',0),(3,4,'0','content_top',1),(20,5,'0','column_left',2),(65,1,'featured.28','content_top',2),(66,1,'slideshow.27','content_top',1),(67,1,'carousel.29','content_top',3),(68,6,'account','column_right',1),(69,10,'account','column_right',1),(72,3,'category','column_left',1),(73,3,'banner.30','column_left',2);
/*!40000 ALTER TABLE `zoo_layout_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_layout_route`
--

DROP TABLE IF EXISTS `zoo_layout_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_layout_route`
--

LOCK TABLES `zoo_layout_route` WRITE;
/*!40000 ALTER TABLE `zoo_layout_route` DISABLE KEYS */;
INSERT INTO `zoo_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES (17,10,0,'affiliate/%'),(20,2,0,'product/product'),(23,7,0,'checkout/%'),(24,11,0,'information/information'),(31,8,0,'information/contact'),(32,9,0,'information/sitemap'),(34,4,0,''),(38,6,0,'account/%'),(42,1,0,'common/home'),(44,3,0,'product/category'),(45,5,0,'product/manufacturer'),(52,12,0,'product/compare'),(53,13,0,'product/search');
/*!40000 ALTER TABLE `zoo_layout_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_length_class`
--

DROP TABLE IF EXISTS `zoo_length_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_length_class`
--

LOCK TABLES `zoo_length_class` WRITE;
/*!40000 ALTER TABLE `zoo_length_class` DISABLE KEYS */;
INSERT INTO `zoo_length_class` (`length_class_id`, `value`) VALUES (1,1.00000000),(2,10.00000000),(3,0.39370000);
/*!40000 ALTER TABLE `zoo_length_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_length_class_description`
--

DROP TABLE IF EXISTS `zoo_length_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_length_class_description`
--

LOCK TABLES `zoo_length_class_description` WRITE;
/*!40000 ALTER TABLE `zoo_length_class_description` DISABLE KEYS */;
INSERT INTO `zoo_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES (1,1,'Сантиметр','см'),(2,1,'Миллиметр','мм');
/*!40000 ALTER TABLE `zoo_length_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_location`
--

DROP TABLE IF EXISTS `zoo_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_location`
--

LOCK TABLES `zoo_location` WRITE;
/*!40000 ALTER TABLE `zoo_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_manufacturer`
--

DROP TABLE IF EXISTS `zoo_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_manufacturer`
--

LOCK TABLES `zoo_manufacturer` WRITE;
/*!40000 ALTER TABLE `zoo_manufacturer` DISABLE KEYS */;
INSERT INTO `zoo_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES (5,'HTC','catalog/demo/htc_logo.jpg',0),(6,'Palm','catalog/demo/palm_logo.jpg',0),(7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0),(8,'Apple','catalog/demo/apple_logo.jpg',0),(9,'Canon','catalog/demo/canon_logo.jpg',0),(10,'Sony','catalog/demo/sony_logo.jpg',0),(11,'Petreet','no_image.jpg',0),(12,'Hill\'s','no_image.jpg',0),(13,'Royal Canin','no_image.jpg',0),(14,'Наша Марка','no_image.jpg',0),(15,'Pedigree','no_image.jpg',0),(16,'Ночной охотник','no_image.jpg',0),(17,'Cat Step','no_image.jpg',0),(18,'Сибирская кошка','no_image.jpg',0),(19,'№1','no_image.jpg',0),(20,'Vitaline','no_image.jpg',0),(21,'Dr.Elsey\'s','no_image.jpg',0),(22,'Ever Clean','no_image.jpg',0),(23,'Litter Kwitter','no_image.jpg',0),(24,'Гамма','no_image.jpg',0),(25,'Moderna','no_image.jpg',0),(26,'DD Style','no_image.jpg',0),(27,'Triol','no_image.jpg',0),(28,'Marchioro','no_image.jpg',0),(29,'Каскад','no_image.jpg',0),(30,'Rogz','no_image.jpg',0),(31,'Camon','no_image.jpg',0),(32,'Hunter Smart','no_image.jpg',0),(33,'Зооник','no_image.jpg',0),(34,'Flexi','no_image.jpg',0),(35,'Рекс','no_image.jpg',0),(36,'Dezzie','no_image.jpg',0),(37,'Artmiska','no_image.jpg',0),(38,'VM','no_image.jpg',0),(39,'Petro Trade','no_image.jpg',0),(40,'Feed-Ex','no_image.jpg',0),(41,'Gaffy Pet','no_image.jpg',0),(42,'Dobaz','no_image.jpg',0),(43,'Happy Puppy','no_image.jpg',0),(44,'Dogmoda','no_image.jpg',0),(45,'Kuzer-Moda','no_image.jpg',0),(46,'OSSO Fashion','no_image.jpg',0),(47,'MPS','no_image.jpg',0),(48,'Savic','no_image.jpg',0),(49,'FAUNA','no_image.jpg',0),(50,'Elite Valley','no_image.jpg',0),(51,'Fauna','no_image.jpg',0),(52,'Crystal Line','no_image.jpg',0),(53,'ХИМОЛА','no_image.jpg',0),(54,'Медоса','no_image.jpg',0),(55,'OOPS!','no_image.jpg',0),(56,'Flat','no_image.jpg',0),(57,'Грызлик Ам','no_image.jpg',0),(58,'Crazy Liberty','no_image.jpg',0),(59,'Антицарапки','no_image.jpg',0),(60,'Cliny','no_image.jpg',0),(61,'Petstages','no_image.jpg',0),(62,'Zoobaloo','no_image.jpg',0),(63,'GoSi','no_image.jpg',0),(64,'R2P Pet','no_image.jpg',0),(65,'Уют','no_image.jpg',0),(66,'Пушок','no_image.jpg',0),(67,'Меридиан','no_image.jpg',0),(68,'Beeztees','no_image.jpg',0),(69,'Hello Pet','no_image.jpg',0),(70,'V.I.Pet','no_image.jpg',0),(71,'TRIXIE','no_image.jpg',0),(72,'Rolf Club 3D','no_image.jpg',0),(73,'Ziver','no_image.jpg',0),(74,'Wahl','no_image.jpg',0),(75,'Midwest','no_image.jpg',0),(76,'ЗооМарк','no_image.jpg',0),(77,'Заря-Плюс','no_image.jpg',0),(78,'Велес','no_image.jpg',0),(79,'RODY','no_image.jpg',0),(80,'AvtoPoryadok','no_image.jpg',0),(81,'Pride','no_image.jpg',0),(82,'Aquael','no_image.jpg',0),(83,'Tetra','no_image.jpg',0),(84,'AquaLighter','no_image.jpg',0),(85,'Sea Star','no_image.jpg',0),(86,'Titbit','no_image.jpg',0),(87,'Eheim','no_image.jpg',0),(88,'UDeco','no_image.jpg',0),(89,'Meijing Aquarium','no_image.jpg',0),(90,'Гелакан','no_image.jpg',0),(91,'Polidex','no_image.jpg',0),(92,'Агроветзащита','no_image.jpg',0),(93,'Unitabs','no_image.jpg',0),(94,'VetExpert','no_image.jpg',0),(95,'ТАЛИСМЕД','no_image.jpg',0),(96,'Хондрокан','no_image.jpg',0),(97,'Beaphar','no_image.jpg',0);
/*!40000 ALTER TABLE `zoo_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_manufacturer_to_store`
--

DROP TABLE IF EXISTS `zoo_manufacturer_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_manufacturer_to_store`
--

LOCK TABLES `zoo_manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `zoo_manufacturer_to_store` DISABLE KEYS */;
INSERT INTO `zoo_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES (5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(63,0),(64,0),(65,0),(66,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(80,0),(81,0),(82,0),(83,0),(84,0),(85,0),(86,0),(87,0),(88,0),(89,0),(90,0),(91,0),(92,0),(93,0),(94,0),(95,0),(96,0),(97,0);
/*!40000 ALTER TABLE `zoo_manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_marketing`
--

DROP TABLE IF EXISTS `zoo_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_marketing`
--

LOCK TABLES `zoo_marketing` WRITE;
/*!40000 ALTER TABLE `zoo_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_modification`
--

DROP TABLE IF EXISTS `zoo_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_modification`
--

LOCK TABLES `zoo_modification` WRITE;
/*!40000 ALTER TABLE `zoo_modification` DISABLE KEYS */;
INSERT INTO `zoo_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES (1,1,'Import / Export Basic','import_export_basic','DevmanExtensions','7.6.0','https://www.devmanextensions.com','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>Import / Export Basic</name>\n    <version>7.6.0</version>\n    <author>DevmanExtensions</author>\n    <link>https://www.devmanextensions.com</link>\n    <code>import_export_basic</code>\n\n    <file error=\"skip\" path=\"admin/controller/common/menu.php\">\n		<operation error=\"skip\">\n			<search trim=\"true\"><![CDATA[$this->load->language(\'common/menu\');]]></search>\n			<add position=\"after\"><![CDATA[\n				$token_name = version_compare(VERSION, \'3.0.0.0\', \'<\') ? \'token\' : \'user_token\';\n\n				$route_compatible = (version_compare(VERSION, \'2.3\', \'>=\') ? \'extension/\':\'\').\'module/\';\n\n				$this->load->language($route_compatible.\'import_xls\');\n\n				$data[\'text_buttom\'] = $this->language->get(\'text_buttom\');\n\n				$data[\'import\'] = $this->url->link($route_compatible.\'import_xls\', $token_name.\'=\' . $this->session->data[$token_name], \'SSL\');\n\n			]]></add>\n		</operation>\n	</file>\n\n	<file error=\"skip\" path=\"admin/controller/common/column_left.php\">\n		<operation error=\"skip\">\n			<search trim=\"true\"><![CDATA[$user = array();]]></search>\n			<add position=\"after\"><![CDATA[\n				$token_name = version_compare(VERSION, \'3.0.0.0\', \'<\') ? \'token\' : \'user_token\';\n\n				$route_compatible = (version_compare(VERSION, \'2.3\', \'>=\') ? \'extension/\':\'\').\'module/\';\n\n				$this->load->language($route_compatible.\'import_xls\');\n\n				$system[] = array(\n					\'name\'	   => $this->language->get(\'text_buttom\'),\n					\'href\'     => $this->url->link($route_compatible.\'import_xls\', $token_name.\'=\' . $this->session->data[$token_name], \'SSL\'),\n					\'children\' => array()\n				);\n			]]></add>\n		</operation>\n	</file>\n\n	<file error=\"skip\" path=\"admin/view/template/common/menu.tpl\">\n		<operation error=\"skip\">\n			<search trim=\"true\"><![CDATA[<li><a href=\"<?php echo $setting; ?>\"><?php echo $text_setting; ?></a></li>]]></search>\n			<add position=\"after\"><![CDATA[<li><a href=\"<?php echo $import; ?>\"><?php echo $text_buttom; ?></a></li>]]></add>\n		</operation>\n	</file>\n\n	<file path=\"admin/controller/common/filemanager.php\">\n		<operation error=\"skip\" info=\"from OC.2.0.0.0 to OC.2.2.0.0\">\n			<search trim=\"true\"><![CDATA[move_uploaded_file($this->request->files[\'file\'][\'tmp_name\'], $directory . \'/\' . $filename);]]></search>\n			<add position=\"after\"><![CDATA[\n		        $ext = strtolower(strrchr($this->request->files[\'file\'][\'name\'], \'.\'));\n		        $basename = basename($this->request->files[\'file\'][\'name\']);\n		        $target_file = \"$directory/$basename\";\n\n				//OLD Function\n			       	if ($ext == \'.zip\') {\n			          $extract = exec(\'unzip -o \"\'.$target_file.\'\" -d \"\'.$directory.\'\"\');\n			          unlink($target_file);\n			        }\n			    //END OLD Function\n\n				/*\n				//PHP 5 >= 5.2.0, PECL zip >= 1.1.0\n					if ($ext == \'.zip\') {\n				        $zip = new ZipArchive;\n						$res = $zip->open($target_file);\n						if ($res === TRUE) {\n						  $zip->extractTo($directory);\n						  $zip->close();\n							unlink($target_file);\n						}\n					}\n				//END PHP 5 >= 5.2.0, PECL zip >= 1.1.0\n				*/\n			]]></add>\n		</operation>\n\n		<operation error=\"skip\" info=\"more than OC.2.3.0.0\">\n			<search trim=\"true\"><![CDATA[move_uploaded_file($file[\'tmp_name\'], $directory . \'/\' . $filename);]]></search>\n			<add position=\"before\"><![CDATA[\n		        $ext = strtolower(strrchr($file[\'name\'], \'.\'));\n		        $basename = basename($file[\'name\']);\n		        $target_file = \"$directory/$basename\";\n\n				//OLD Function\n			       	if ($ext == \'.zip\') {\n			          $extract = exec(\'unzip -o \"\'.$target_file.\'\" -d \"\'.$directory.\'\"\');\n			          unlink($target_file);\n			        }\n			    //END OLD Function\n\n				/*\n				//PHP 5 >= 5.2.0, PECL zip >= 1.1.0\n					if ($ext == \'.zip\') {\n				        $zip = new ZipArchive;\n						$res = $zip->open($target_file);\n						if ($res === TRUE) {\n						  $zip->extractTo($directory);\n						  $zip->close();\n							unlink($target_file);\n						}\n					}\n				//END PHP 5 >= 5.2.0, PECL zip >= 1.1.0\n				*/\n			]]></add>\n		</operation>\n\n		<operation error=\"skip\" info=\"from OC.2.0.0.0 to OC.2.2.0.0\">\n			<search trim=\"true\"><![CDATA[if (!in_array($this->request->files[\'file\'][\'type\'], $allowed)) {]]></search>\n			<add position=\"before\"><![CDATA[\n				$allowed[] = \'application/zip\';\n				$allowed[] = \'application/x-zip-compressed\';\n			]]></add>\n		</operation>\n\n		<operation error=\"skip\" info=\"more than OC.2.3.0.0\">\n			<search trim=\"true\"><![CDATA[if (!in_array($file[\'type\'], $allowed)) {]]></search>\n			<add position=\"before\"><![CDATA[\n				$allowed[] = \'application/zip\';\n				$allowed[] = \'application/x-zip-compressed\';\n			]]></add>\n		</operation>\n\n		<operation error=\"skip\">\n			<search trim=\"true\"><![CDATA[if (!in_array(utf8_strtolower(utf8_substr(strrchr($filename, \'.\'), 1)), $allowed)) {]]></search>\n			<add position=\"before\"><![CDATA[\n				$allowed[] = \'zip\';\n			]]></add>\n		</operation>\n	</file>\n</modification>',1,'2018-06-21 13:08:52');
/*!40000 ALTER TABLE `zoo_modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_module`
--

DROP TABLE IF EXISTS `zoo_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_module`
--

LOCK TABLES `zoo_module` WRITE;
/*!40000 ALTER TABLE `zoo_module` DISABLE KEYS */;
INSERT INTO `zoo_module` (`module_id`, `name`, `code`, `setting`) VALUES (27,'Home Page','slideshow','{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),(28,'Home Page','featured','{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),(29,'Home Page','carousel','{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),(30,'Category','banner','{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),(31,'Banner 1','banner','{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');
/*!40000 ALTER TABLE `zoo_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_option`
--

DROP TABLE IF EXISTS `zoo_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_option`
--

LOCK TABLES `zoo_option` WRITE;
/*!40000 ALTER TABLE `zoo_option` DISABLE KEYS */;
INSERT INTO `zoo_option` (`option_id`, `type`, `sort_order`) VALUES (1,'radio',1),(2,'checkbox',2),(4,'text',3),(5,'select',4),(6,'textarea',5),(7,'file',6),(8,'date',7),(9,'time',8),(10,'datetime',9),(11,'select',10),(12,'date',11);
/*!40000 ALTER TABLE `zoo_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_option_description`
--

DROP TABLE IF EXISTS `zoo_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_option_description`
--

LOCK TABLES `zoo_option_description` WRITE;
/*!40000 ALTER TABLE `zoo_option_description` DISABLE KEYS */;
INSERT INTO `zoo_option_description` (`option_id`, `language_id`, `name`) VALUES (1,1,'Radio'),(2,1,'Checkbox'),(4,1,'Text'),(5,1,'Select'),(6,1,'Textarea'),(7,1,'File'),(8,1,'Date'),(9,1,'Time'),(10,1,'Date &amp; Time'),(11,1,'Size'),(12,1,'Delivery Date');
/*!40000 ALTER TABLE `zoo_option_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_option_value`
--

DROP TABLE IF EXISTS `zoo_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_option_value`
--

LOCK TABLES `zoo_option_value` WRITE;
/*!40000 ALTER TABLE `zoo_option_value` DISABLE KEYS */;
INSERT INTO `zoo_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES (23,2,'',1),(24,2,'',2),(31,1,'',2),(32,1,'',1),(39,5,'',1),(40,5,'',2),(41,5,'',3),(42,5,'',4),(43,1,'',3),(44,2,'',3),(45,2,'',4),(46,11,'',1),(47,11,'',2),(48,11,'',3);
/*!40000 ALTER TABLE `zoo_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_option_value_description`
--

DROP TABLE IF EXISTS `zoo_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_option_value_description`
--

LOCK TABLES `zoo_option_value_description` WRITE;
/*!40000 ALTER TABLE `zoo_option_value_description` DISABLE KEYS */;
INSERT INTO `zoo_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES (23,1,2,'Checkbox 1'),(24,1,2,'Checkbox 2'),(31,1,1,'Medium'),(32,1,1,'Small'),(39,1,5,'Red'),(40,1,5,'Blue'),(41,1,5,'Green'),(42,1,5,'Yellow'),(43,1,1,'Large'),(44,1,2,'Checkbox 3'),(45,1,2,'Checkbox 4'),(46,1,11,'Small'),(47,1,11,'Medium'),(48,1,11,'Large');
/*!40000 ALTER TABLE `zoo_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order`
--

DROP TABLE IF EXISTS `zoo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order`
--

LOCK TABLES `zoo_order` WRITE;
/*!40000 ALTER TABLE `zoo_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_history`
--

DROP TABLE IF EXISTS `zoo_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_history`
--

LOCK TABLES `zoo_order_history` WRITE;
/*!40000 ALTER TABLE `zoo_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_option`
--

DROP TABLE IF EXISTS `zoo_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_option`
--

LOCK TABLES `zoo_order_option` WRITE;
/*!40000 ALTER TABLE `zoo_order_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_product`
--

DROP TABLE IF EXISTS `zoo_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_product`
--

LOCK TABLES `zoo_order_product` WRITE;
/*!40000 ALTER TABLE `zoo_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_recurring`
--

DROP TABLE IF EXISTS `zoo_order_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_recurring`
--

LOCK TABLES `zoo_order_recurring` WRITE;
/*!40000 ALTER TABLE `zoo_order_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_recurring_transaction`
--

DROP TABLE IF EXISTS `zoo_order_recurring_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_recurring_transaction`
--

LOCK TABLES `zoo_order_recurring_transaction` WRITE;
/*!40000 ALTER TABLE `zoo_order_recurring_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_recurring_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_shipment`
--

DROP TABLE IF EXISTS `zoo_order_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_shipment` (
  `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_shipment`
--

LOCK TABLES `zoo_order_shipment` WRITE;
/*!40000 ALTER TABLE `zoo_order_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_status`
--

DROP TABLE IF EXISTS `zoo_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_status`
--

LOCK TABLES `zoo_order_status` WRITE;
/*!40000 ALTER TABLE `zoo_order_status` DISABLE KEYS */;
INSERT INTO `zoo_order_status` (`order_status_id`, `language_id`, `name`) VALUES (1,1,'Ожидание'),(2,1,'В обработке'),(3,1,'Доставлено'),(5,1,'Сделка завершена'),(7,1,'Отменено'),(8,1,'Возврат'),(9,1,'Отмена и аннулирование'),(10,1,'Неудавшийся'),(11,1,'Возмещенный'),(12,1,'Полностью измененный'),(13,1,'Полный возврат');
/*!40000 ALTER TABLE `zoo_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_total`
--

DROP TABLE IF EXISTS `zoo_order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_total`
--

LOCK TABLES `zoo_order_total` WRITE;
/*!40000 ALTER TABLE `zoo_order_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_order_voucher`
--

DROP TABLE IF EXISTS `zoo_order_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_order_voucher`
--

LOCK TABLES `zoo_order_voucher` WRITE;
/*!40000 ALTER TABLE `zoo_order_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_order_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product`
--

DROP TABLE IF EXISTS `zoo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product`
--

LOCK TABLES `zoo_product` WRITE;
/*!40000 ALTER TABLE `zoo_product` DISABLE KEYS */;
INSERT INTO `zoo_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES (50,'8004030721333','','','','','','','',10,7,'catalog/pet/1010431254.jpg',11,0,111.0000,0,0,'2018-06-21',0.11000000,1,68.00000000,68.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(51,'0052742917603','','','','','','','',10,7,'catalog/pet/1019195792.jpg',12,0,5790.2000,0,0,'2018-06-21',12.00000000,1,400.00000000,660.00000000,140.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(52,'3182550831383','','','','','','','',10,7,'catalog/pet/1011532285.jpg',13,0,709.0000,0,0,'2018-06-21',2.00000000,1,260.00000000,200.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(53,'4607126773069','','','','','','','',10,7,'catalog/pet/1011507328.jpg',14,0,24.0000,0,0,'2018-06-21',0.10000000,1,140.00000000,95.00000000,10.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(54,'9003579302552','','','','','','','',10,7,'catalog/pet/1017471424.jpg',15,0,68.0000,0,0,'2018-06-21',0.15500000,1,150.00000000,190.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(55,'0052742874203','','','','','','','',10,7,'catalog/pet/1002102958.jpg',12,0,2129.0000,0,0,'2018-06-21',2.00000000,1,300.00000000,200.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(56,'8004030721340','','','','','','','',10,7,'catalog/pet/1010431235.jpg',11,0,111.0000,0,0,'2018-06-21',0.11000000,1,68.00000000,68.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(57,'7','','','','','','','',10,7,'catalog/pet/1019195854.jpg',12,0,6290.0000,0,0,'2018-06-21',12.00000000,1,660.00000000,400.00000000,130.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(58,'4627109380060','','','','','','','',10,7,'catalog/pet/1010893672.jpg',13,0,353.0000,0,0,'2018-06-21',0.80000000,1,160.00000000,150.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(59,'4607026705061','','','','','','','',10,7,'catalog/pet/1011833286.jpg',16,0,60.0000,0,0,'2018-06-21',0.40000000,1,70.00000000,70.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(60,'5998749106877','','','','','','','',10,7,'catalog/pet/1013056603.jpg',15,0,38.0000,0,0,'2018-06-21',0.04700000,1,165.00000000,76.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(61,'0052742798905','','','','','','','',10,7,'catalog/pet/1019217505.jpg',12,0,1277.0000,0,0,'2018-06-21',3.04500000,1,380.00000000,200.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(62,'8004030721371','','','','','','','',10,7,'catalog/pet/1010431255.jpg',11,0,111.0000,0,0,'2018-06-21',0.11000000,1,68.00000000,68.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(63,'052742918501','','','','','','','',10,7,'catalog/pet/1019195873.jpg',12,0,1082.5000,0,0,'2018-06-21',1.50100000,1,190.00000000,80.00000000,340.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(64,'3182550795128','','','','','','','',10,7,'catalog/pet/1011596337.jpg',13,0,334.0000,0,0,'2018-06-21',0.80000000,1,180.00000000,150.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(65,'4680384001303','','','','','','','',10,7,'catalog/pet/1013534455.jpg',17,0,309.0000,0,0,'2018-06-21',1.75500000,1,150.00000000,250.00000000,330.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(66,'4607109232705','','','','','','','',10,7,'catalog/pet/1022608493.JPG',18,0,569.0000,0,0,'2018-06-21',10.18000000,1,400.00000000,150.00000000,550.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(67,'6935993100014','','','','','','','',10,7,'catalog/pet/1022689359.jpg',19,0,302.0000,0,0,'2018-06-21',4.47000000,1,400.00000000,250.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(68,'4607155020059','','','','','','','',10,7,'catalog/pet/1017355253.jpg',20,0,92.0000,0,0,'2018-06-21',2.83000000,1,330.00000000,150.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(69,'000338005401','','','','','','','',10,7,'catalog/pet/1020863816.jpg',21,0,2459.0000,0,0,'2018-06-21',18.41000000,1,350.00000000,340.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(70,'4605427224600','','','','','','','',10,7,'catalog/pet/1022689408.jpg',19,0,424.0000,0,0,'2018-06-21',1.82000000,1,400.00000000,290.00000000,325.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(71,'5060255492222','','','','','','','',10,7,'catalog/pet/1021689010.jpg',22,0,1069.0000,0,0,'2018-06-21',10.34000000,1,390.00000000,330.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(72,'4607109232729','','','','','','','',10,7,'catalog/pet/1010938873.jpg',18,0,419.0000,0,0,'2018-06-21',12.00000000,1,500.00000000,100.00000000,400.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(73,'4605427229438','','','','','','','',10,7,'catalog/pet/1022689342.jpg',19,0,1679.0000,0,0,'2018-06-21',7.06000000,1,450.00000000,300.00000000,180.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(74,'000338008204','','','','','','','',10,7,'catalog/pet/1020863819.jpg',21,0,2519.0000,0,0,'2018-06-21',8.67000000,1,310.00000000,190.00000000,190.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(75,'4605427244028','','','','','','','',10,7,'catalog/pet/1022689405.jpg',19,0,1659.0000,0,0,'2018-06-21',6.64000000,1,410.00000000,310.00000000,320.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(76,'0610696101297','','','','','','','',10,7,'catalog/pet/1005223637.jpg',23,0,3199.0000,0,0,'2018-06-21',1.17000000,1,410.00000000,410.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(77,'4607109232392','','','','','','','',10,7,'catalog/pet/1010938867.jpg',18,0,335.0000,0,0,'2018-06-21',10.50000000,1,500.00000000,100.00000000,400.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(78,'4605427225997','','','','','','','',10,7,'catalog/pet/1022860687.jpg',19,0,434.0000,0,0,'2018-06-21',2.08000000,1,350.00000000,200.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(79,'4607155020172','','','','','','','',10,7,'catalog/pet/1021372860.jpg',20,0,157.0000,0,0,'2018-06-21',11.27000000,1,330.00000000,300.00000000,180.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(80,'4605427221777','','','','','','','',10,7,'catalog/pet/1021678054.JPG',19,0,1919.0000,0,0,'2018-06-21',1.00500000,1,500.00000000,340.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(81,'4605427243069','','','','','','','',10,7,'catalog/pet/1022451491.jpg',19,0,1649.0000,0,0,'2018-06-21',1.08500000,1,630.00000000,490.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(82,'4620003273261','','','','','','','',10,7,'catalog/pet/1013438386.jpg',24,0,29.0000,0,0,'2018-06-21',0.10200000,1,150.00000000,150.00000000,270.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(83,'5412087007974','','','','','','','',10,7,'catalog/pet/1018758866.JPG',25,0,1619.0000,0,0,'2018-06-21',1.56000000,1,651.00000000,420.00000000,400.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(84,'4610004680601','','','','','','','',10,7,'catalog/pet/1020778796.jpg',26,0,236.0000,0,0,'2018-06-21',0.53000000,1,400.00000000,270.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(85,'4605427236337','','','','','','','',10,7,'catalog/pet/1021677853.JPG',19,0,2289.0000,0,0,'2018-06-21',1.22000000,1,500.00000000,400.00000000,350.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(86,'4620006489072','','','','','','','',10,7,'catalog/pet/1010832989.jpg',27,0,599.0000,0,0,'2018-06-21',0.51000000,1,420.00000000,350.00000000,145.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(87,'8006751075726','','','','','','','',10,7,'catalog/pet/1013438390.jpg',28,0,157.0000,0,0,'2018-06-21',0.04400000,1,110.00000000,100.00000000,280.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(88,'5412087007462','','','','','','','',10,7,'catalog/pet/1018758873.JPG',25,0,2099.0000,0,0,'2018-06-21',1.65000000,1,630.00000000,450.00000000,420.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(89,'4605427236344','','','','','','','',10,7,'catalog/pet/1021677852.JPG',19,0,2579.0000,0,0,'2018-06-21',1.66500000,1,600.00000000,450.00000000,430.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(90,'4620006486156','','','','','','','',10,7,'catalog/pet/1005686980.jpg',27,0,1043.0000,0,0,'2018-06-21',0.75000000,1,430.00000000,490.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(91,'8006751346932','','','','','','','',10,7,'catalog/pet/1014153648.jpg',0,0,599.0000,0,0,'2018-06-21',1.65200000,1,370.00000000,280.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(92,'4605350000333','','','','','','','',10,7,'catalog/pet/1018036886.jpg',29,0,121.0000,0,0,'2018-06-21',0.03500000,1,190.00000000,180.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(93,'649510041112','','','','','','','',10,7,'catalog/pet/1019076407.jpg',30,0,1839.1000,0,0,'2018-06-21',0.22000000,1,500.00000000,60.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(94,'8019808094717','','','','','','','',10,7,'catalog/pet/1021776934.jpg',31,0,459.0000,0,0,'2018-06-21',0.07500000,1,225.00000000,70.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(95,'4016739927057','','','','','','','',10,7,'catalog/pet/1014131435.jpg',32,0,1069.0000,0,0,'2018-06-21',0.22000000,1,270.00000000,170.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(96,'4620018921751','','','','','','','',10,7,'catalog/pet/1018043975.jpg',33,0,226.0000,0,0,'2018-06-21',0.10500000,1,220.00000000,70.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(97,'649510027017','','','','','','','',10,7,'catalog/pet/1019076477.jpg',30,0,1389.0000,0,0,'2018-06-21',0.13500000,1,390.00000000,60.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(98,'8019808094748','','','','','','','',10,7,'catalog/pet/1021780258.jpg',31,0,699.0000,0,0,'2018-06-21',0.08000000,1,235.00000000,40.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(99,'4016739926890','','','','','','','',10,7,'catalog/pet/1014629156.jpg',32,0,1069.0000,0,0,'2018-06-21',0.09000000,1,170.00000000,60.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(100,'4000498023006','','','','','','','',10,7,'catalog/pet/1018044577.jpg',34,0,1488.9000,0,0,'2018-06-21',0.63000000,1,240.00000000,240.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(101,'659510039200','','','','','','','',10,7,'catalog/pet/1019080593.jpg',30,0,699.0000,0,0,'2018-06-21',0.06500000,1,230.00000000,60.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(102,'8019808112640','','','','','','','',10,7,'catalog/pet/1021780260.jpg',31,0,302.0000,0,0,'2018-06-21',0.04000000,1,210.00000000,30.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(103,'4016739924933','','','','','','','',10,7,'catalog/pet/1014131418.jpg',32,0,602.1000,0,0,'2018-06-21',0.11500000,1,250.00000000,150.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(104,'4000498023020','','','','','','','',10,7,'catalog/pet/1021067421.jpg',34,0,1488.9000,0,0,'2018-06-21',0.63000000,1,240.00000000,240.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(105,'649510012785','','','','','','','',10,7,'catalog/pet/1019080596.jpg',30,0,689.0000,0,0,'2018-06-21',0.06500000,1,230.00000000,60.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(106,'8019808123998','','','','','','','',10,7,'catalog/pet/1021772902.jpg',31,0,549.0000,0,0,'2018-06-21',0.10000000,1,140.00000000,140.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(107,'5412087012268','','','','','','','',10,7,'catalog/pet/1022169334.jpg',25,0,399.0000,0,0,'2018-06-21',0.14500000,1,270.00000000,160.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(108,'4620003546662','','','','','','','',10,7,'catalog/pet/1011340391.jpg',27,0,111.0000,0,0,'2018-06-21',0.10500000,1,160.00000000,160.00000000,55.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(109,'4603225001249','','','','','','','',10,7,'catalog/pet/1013741572.JPG',35,0,1199.0000,0,0,'2018-06-21',1.59500000,1,500.00000000,300.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(110,'4656190040010','','','','','','','',10,7,'catalog/pet/1017674319.jpg',36,0,117.0000,0,0,'2018-06-21',0.08500000,1,120.00000000,120.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(111,'4607086630914','','','','','','','',10,7,'catalog/pet/1020795196.jpg',37,0,1379.0000,0,0,'2018-06-21',0.66000000,1,230.00000000,230.00000000,160.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(112,'4605427231677','','','','','','','',10,7,'catalog/pet/1021685934.jpg',19,0,129.0000,0,0,'2018-06-21',0.05500000,1,150.00000000,150.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(113,'5412087015344','','','','','','','',10,7,'catalog/pet/1022169336.jpg',25,0,383.0000,0,0,'2018-06-21',0.14500000,1,275.00000000,160.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(114,'4620003883477','','','','','','','',10,7,'catalog/pet/1001696434.jpg',27,0,216.0000,0,0,'2018-06-21',0.13000000,1,165.00000000,270.00000000,35.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(115,'8901810271210','','','','','','','',10,7,'catalog/pet/1013741502.jpg',38,0,201.0000,0,0,'2018-06-21',0.33000000,1,250.00000000,210.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(116,'4656190050019','','','','','','','',10,7,'catalog/pet/1017674320.jpg',36,0,117.0000,0,0,'2018-06-21',0.08000000,1,125.00000000,125.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(117,'5826','','','','','','','',10,7,'catalog/pet/1021674162.JPG',39,0,200.0000,0,0,'2018-06-21',0.12000000,1,200.00000000,190.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(118,'4605427237334','','','','','','','',10,7,'catalog/pet/1021685886.jpg',19,0,161.0000,0,0,'2018-06-21',0.23000000,1,150.00000000,150.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(119,'4897030554322','','','','','','','',10,7,'catalog/pet/1022151699.jpg',40,0,2559.0000,0,0,'2018-06-21',0.92500000,1,250.00000000,150.00000000,160.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(120,'6933286380297','','','','','','','',10,7,'catalog/pet/1005192948.jpg',40,0,4041.0000,0,0,'2018-06-21',1.81000000,1,160.00000000,330.00000000,300.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(121,'8901810250222','','','','','','','',10,7,'catalog/pet/1013741465.jpg',38,0,212.0000,0,0,'2018-06-21',0.22500000,1,290.00000000,250.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(122,'4607969101081','','','','','','','',10,7,'catalog/pet/1021751800.jpg',41,0,1939.0000,0,0,'2018-06-21',0.41000000,1,370.00000000,320.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(123,'6946972651021','','','','','','','',10,7,'catalog/pet/1021803002.jpg',42,0,779.0000,0,0,'2018-06-21',0.18800000,1,327.00000000,230.00000000,12.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(124,'6946972620850','','','','','','','',10,7,'catalog/pet/1021803040.jpg',42,0,619.0000,0,0,'2018-06-21',0.10200000,1,350.00000000,253.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(125,'4670017901056','','','','','','','',10,7,'catalog/pet/1014052927.jpg',43,0,1149.0000,0,0,'2018-06-21',0.10500000,1,300.00000000,200.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(126,'4605350038817','','','','','','','',10,7,'catalog/pet/1017379161.jpg',29,0,949.0000,0,0,'2018-06-21',0.05500000,1,240.00000000,200.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(127,'659510037053','','','','','','','',10,7,'catalog/pet/1020029213.jpg',30,0,3049.0000,0,0,'2018-06-21',0.12500000,1,360.00000000,180.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(128,'4607969101104','','','','','','','',10,7,'catalog/pet/1021751802.jpg',41,0,2289.0000,0,0,'2018-06-21',0.41000000,1,370.00000000,320.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(129,'6946972648328','','','','','','','',10,7,'catalog/pet/1021802952.jpg',42,0,859.0000,0,0,'2018-06-21',0.24800000,1,330.00000000,225.00000000,8.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(130,'6946972620812','','','','','','','',10,7,'catalog/pet/1021803041.jpg',42,0,619.0000,0,0,'2018-06-21',0.11200000,1,350.00000000,253.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(131,'4650002019676','','','','','','','',10,7,'catalog/pet/1013971829.JPG',44,0,1429.0000,0,0,'2018-06-21',0.23500000,1,270.00000000,160.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(132,'4605350038725','','','','','','','',10,7,'catalog/pet/1017379150.jpg',29,0,729.0000,0,0,'2018-06-21',0.05500000,1,250.00000000,200.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(133,'0659510037312','','','','','','','',10,7,'catalog/pet/1020029172.jpg',30,0,3679.0000,0,0,'2018-06-21',0.28500000,1,280.00000000,300.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(134,'2900014950019','','','','','','','',10,7,'catalog/pet/1021284083.jpg',45,0,1689.0000,0,0,'2018-06-21',0.15500000,1,350.00000000,200.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(135,'6946972648311','','','','','','','',10,7,'catalog/pet/1021802953.jpg',42,0,859.0000,0,0,'2018-06-21',0.20800000,1,330.00000000,225.00000000,8.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(136,'6946972620911','','','','','','','',10,7,'catalog/pet/1021803046.jpg',42,0,909.0000,0,0,'2018-06-21',0.18400000,1,350.00000000,253.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(137,'4607018900029','','','','','','','',10,7,'catalog/pet/1022879504.jpg',46,0,629.0000,0,0,'2018-06-21',0.20000000,1,210.00000000,240.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(138,'4620003278181','','','','','','','',10,7,'catalog/pet/1003152855.jpg',27,0,3168.9000,0,0,'2018-06-21',2.15500000,1,500.00000000,500.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(139,'8022967055116','','','','','','','',10,7,'catalog/pet/1013343110.jpg',47,0,649.0000,0,0,'2018-06-21',0.45000000,1,210.00000000,240.00000000,310.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(140,'4605350048090','','','','','','','',10,7,'catalog/pet/1016981212.jpg',0,0,1619.0000,0,0,'2018-06-21',1.32000000,1,600.00000000,480.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(141,'4620005089303','','','','','','','',10,7,'catalog/pet/1020064130.JPG',27,0,1969.0000,0,0,'2018-06-21',2.20000000,1,650.00000000,308.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(142,'5411388033125','','','','','','','',10,7,'catalog/pet/1021930304.jpg',48,0,6490.0000,0,0,'2018-06-21',7.73500000,1,785.00000000,500.00000000,95.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(143,'2214000150261','','','','','','','',10,7,'catalog/pet/1022864225.jpg',0,0,849.0000,0,0,'2018-06-21',1.01000000,1,390.00000000,260.00000000,240.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(144,'4620003278228','','','','','','','',10,7,'catalog/pet/1003152851.jpg',27,0,7390.0000,0,0,'2018-06-21',5.95500000,1,1000.00000000,740.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(145,'9327975020934','','','','','','','',10,7,'catalog/pet/1013289868.jpg',49,0,3069.1000,0,0,'2018-06-21',1.13500000,1,410.00000000,220.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(146,'2352365021519','','','','','','','',10,7,'catalog/pet/1017328058.jpg',50,0,749.0000,0,0,'2018-06-21',0.32500000,1,410.00000000,140.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(147,'4620005087828','','','','','','','',10,7,'catalog/pet/1020318327.jpg',27,0,1319.0000,0,0,'2018-06-21',1.42000000,1,480.00000000,290.00000000,180.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(148,'5411388033132','','','','','','','',10,7,'catalog/pet/1021930397.jpg',48,0,8490.0000,0,0,'2018-06-21',10.38000000,1,945.00000000,550.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(149,'4605350054596','','','','','','','',10,7,'catalog/pet/1022900635.jpg',29,0,739.0000,0,0,'2018-06-21',0.68500000,1,450.00000000,350.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(150,'4620003271281','','','','','','','',10,7,'catalog/pet/1012617496.jpg',24,0,859.0000,0,0,'2018-06-21',0.64500000,1,450.00000000,300.00000000,300.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(151,'9327975020880','','','','','','','',10,7,'catalog/pet/1013289869.jpg',51,0,3069.1000,0,0,'2018-06-21',1.26000000,1,450.00000000,250.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(152,'4607114875300','','','','','','','',10,7,'catalog/pet/1022492255.jpg',52,0,343.0000,0,0,'2018-06-21',0.14500000,1,200.00000000,40.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(153,'4680265015160','','','','','','','',10,7,'catalog/pet/1018719307.jpg',27,0,419.0000,0,0,'2018-06-21',0.62000000,1,200.00000000,160.00000000,210.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(154,'4605851000092','','','','','','','',10,7,'catalog/pet/1013384687.jpg',53,0,109.0000,0,0,'2018-06-21',0.18000000,1,50.00000000,50.00000000,155.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(155,'4650002272705','','','','','','','',10,7,'catalog/pet/1014617485.jpg',33,0,549.0000,0,0,'2018-06-21',1.36000000,1,300.00000000,280.00000000,155.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(156,'4603586009205','','','','','','','',10,7,'catalog/pet/1016192436.jpg',0,0,399.0000,0,0,'2018-06-21',0.30000000,1,180.00000000,60.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(157,'4627135980906','','','','','','','',10,7,'catalog/pet/1019874343.jpg',54,0,163.0000,0,0,'2018-06-21',0.30000000,1,180.00000000,40.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(158,'4607114875362','','','','','','','',10,7,'catalog/pet/1022492256.jpg',52,0,343.0000,0,0,'2018-06-21',0.15000000,1,200.00000000,40.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(159,'4620006488556','','','','','','','',10,7,'catalog/pet/1008632517.jpg',27,0,509.0000,0,0,'2018-06-21',0.77000000,1,220.00000000,180.00000000,170.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(160,'4605851000054','','','','','','','',10,7,'catalog/pet/1013384732.jpg',53,0,109.0000,0,0,'2018-06-21',0.18000000,1,50.00000000,50.00000000,155.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(161,'4650002272750','','','','','','','',10,7,'catalog/pet/1014617487.jpg',33,0,499.0000,0,0,'2018-06-21',0.92000000,1,320.00000000,210.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(162,'4607122806174','','','','','','','',10,7,'catalog/pet/1016378188.jpg',55,0,599.0000,0,0,'2018-06-21',1.01500000,1,270.00000000,200.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(163,'4627135980920','','','','','','','',10,7,'catalog/pet/1022670715.jpg',54,0,173.0000,0,0,'2018-06-21',0.12500000,1,110.00000000,40.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(164,'4607114875379','','','','','','','',10,7,'catalog/pet/1022492253.jpg',52,0,282.0000,0,0,'2018-06-21',0.23000000,1,200.00000000,40.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(165,'4600296001154','','','','','','','',10,7,'catalog/pet/1005348739.jpg',56,0,254.0000,0,0,'2018-06-21',0.54500000,1,60.00000000,130.00000000,220.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(166,'4605851000146','','','','','','','',10,7,'catalog/pet/1013384688.jpg',53,0,109.0000,0,0,'2018-06-21',0.17500000,1,50.00000000,50.00000000,155.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(167,'4607969101258','','','','','','','',10,7,'catalog/pet/1021751812.JPG',41,0,749.0000,0,0,'2018-06-21',0.08000000,1,170.00000000,100.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(168,'0767408776509','','','','','','','',10,7,'catalog/pet/1022796942.jpg',57,0,384.0000,0,0,'2018-06-21',0.10000000,1,200.00000000,110.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(169,'4650002019607','','','','','','','',10,7,'catalog/pet/1014083127.jpg',44,0,1089.0000,0,0,'2018-06-21',0.12000000,1,300.00000000,170.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(170,'4680265018772','','','','','','','',10,7,'catalog/pet/1015859834.jpg',27,0,499.0000,0,0,'2018-06-21',0.09500000,1,210.00000000,100.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(171,'4680265009107','','','','','','','',10,7,'catalog/pet/1015860819.jpg',27,0,1459.0000,0,0,'2018-06-21',0.13500000,1,220.00000000,140.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(172,'4607018909583','','','','','','','',10,7,'catalog/pet/1021278416.jpg',46,0,779.0000,0,0,'2018-06-21',0.03500000,1,150.00000000,120.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(173,'4607969101265','','','','','','','',10,7,'catalog/pet/1021751811.JPG',41,0,749.0000,0,0,'2018-06-21',0.08000000,1,170.00000000,100.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(174,'0767408776530','','','','','','','',10,7,'catalog/pet/1022796943.jpg',57,0,384.0000,0,0,'2018-06-21',0.05500000,1,200.00000000,100.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(175,'4650002019614','','','','','','','',10,7,'catalog/pet/1014083131.jpg',44,0,1089.0000,0,0,'2018-06-21',0.13000000,1,300.00000000,180.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(176,'4680265018789','','','','','','','',10,7,'catalog/pet/1015830673.jpg',27,0,539.0000,0,0,'2018-06-21',0.07500000,1,180.00000000,90.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(177,'4680265009213','','','','','','','',10,7,'catalog/pet/1015860827.jpg',27,0,1459.0000,0,0,'2018-06-21',0.08500000,1,210.00000000,130.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(178,'4607018909552','','','','','','','',10,7,'catalog/pet/1020181067.jpg',46,0,779.0000,0,0,'2018-06-21',0.04000000,1,140.00000000,120.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(179,'0767408776547','','','','','','','',10,7,'catalog/pet/1022796944.jpg',57,0,384.0000,0,0,'2018-06-21',0.08000000,1,200.00000000,110.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(180,'4607130988114','','','','','','','',10,7,'catalog/pet/1021458915.jpg',44,0,1089.0000,0,0,'2018-06-21',0.15500000,1,300.00000000,180.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(181,'6235462600275','','','','','','','',10,7,'catalog/pet/1021828734.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(182,'4605350022427','','','','','','','',10,7,'catalog/pet/1015205221.jpg',0,0,77.0000,0,0,'2018-06-21',0.06000000,1,130.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(183,'2412000004328','','','','','','','',10,7,'catalog/pet/1019762787.jpg',59,0,272.0000,0,0,'2018-06-21',0.02500000,1,80.00000000,80.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(184,'4607092075471','','','','','','','',10,7,'catalog/pet/1021374746.jpg',60,0,229.0000,0,0,'2018-06-21',0.12500000,1,120.00000000,80.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(185,'6235462600107','','','','','','','',10,7,'catalog/pet/1021828721.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(186,'6235462600169','','','','','','','',10,7,'catalog/pet/1021828727.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(187,'6235462600381','','','','','','','',10,7,'catalog/pet/1021828737.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(188,'4605350022465','','','','','','','',10,7,'catalog/pet/1015205289.jpg',0,0,79.0000,0,0,'2018-06-21',0.05000000,1,130.00000000,100.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(189,'2412000004397','','','','','','','',10,7,'catalog/pet/1019762788.jpg',59,0,272.0000,0,0,'2018-06-21',0.02500000,1,80.00000000,80.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(190,'4607092075488','','','','','','','',10,7,'catalog/pet/1021374747.jpg',60,0,285.0000,0,0,'2018-06-21',0.10500000,1,120.00000000,90.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(191,'6235462600121','','','','','','','',10,7,'catalog/pet/1021828723.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(192,'6235462600183','','','','','','','',10,7,'catalog/pet/1021828729.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(193,'6235462600398','','','','','','','',10,7,'catalog/pet/1021828738.jpg',58,0,224.0000,0,0,'2018-06-21',0.02000000,1,140.00000000,30.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(194,'2412000004342','','','','','','','',10,7,'catalog/pet/1019762783.jpg',59,0,272.0000,0,0,'2018-06-21',0.02500000,1,80.00000000,80.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(195,'2412000004366','','','','','','','',10,7,'catalog/pet/1019762789.jpg',59,0,272.0000,0,0,'2018-06-21',0.02500000,1,80.00000000,80.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(196,'0700603673426','','','','','','','',10,7,'catalog/pet/1021397304.jpg',61,0,719.0000,0,0,'2018-06-21',0.25000000,1,200.00000000,130.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(197,'4605427243595','','','','','','','',10,7,'catalog/pet/1021806301.jpg',19,0,156.0000,0,0,'2018-06-21',0.02500000,1,100.00000000,70.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(198,'4620003556821','','','','','','','',10,7,'catalog/pet/1001697248.jpg',27,0,135.0000,0,0,'2018-06-21',0.02500000,1,120.00000000,100.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(199,'4610006081222','','','','','','','',10,7,'catalog/pet/1017386627.jpg',62,0,111.0000,0,0,'2018-06-21',0.12500000,1,150.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(200,'4627090333090','','','','','','','',10,7,'catalog/pet/1019058724.JPG',63,0,101.0000,0,0,'2018-06-21',0.07000000,1,600.00000000,100.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(201,'0700603673396','','','','','','','',10,7,'catalog/pet/1021397302.jpg',61,0,279.0000,0,0,'2018-06-21',0.15000000,1,160.00000000,90.00000000,13.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(202,'4605427243977','','','','','','','',10,7,'catalog/pet/1021806339.jpg',19,0,166.0000,0,0,'2018-06-21',0.10000000,1,100.00000000,50.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(203,'0847388011316','','','','','','','',10,7,'catalog/pet/1010250443.jpg',64,0,669.0000,0,0,'2018-06-21',0.14200000,1,300.00000000,200.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(204,'4610006082267','','','','','','','',10,7,'catalog/pet/1016854208.jpg',62,0,86.0000,0,0,'2018-06-21',0.12500000,1,150.00000000,100.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(205,'4627090333113','','','','','','','',10,7,'catalog/pet/1020833856.jpg',63,0,95.0000,0,0,'2018-06-21',0.07000000,1,600.00000000,100.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(206,'0871864002161','','','','','','','',10,7,'catalog/pet/1021397298.jpg',61,0,191.0000,0,0,'2018-06-21',0.05000000,1,150.00000000,90.00000000,9.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(207,'4605427243991','','','','','','','',10,7,'catalog/pet/1021806341.jpg',19,0,166.0000,0,0,'2018-06-21',0.03500000,1,120.00000000,70.00000000,55.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(208,'0871864001393','','','','','','','',10,7,'catalog/pet/1010250534.jpg',61,0,274.0000,0,0,'2018-06-21',0.05000000,1,140.00000000,160.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(209,'4610006080348','','','','','','','',10,7,'catalog/pet/1016854212.jpg',62,0,136.0000,0,0,'2018-06-21',0.25500000,1,55.00000000,55.00000000,55.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(210,'4627090333137','','','','','','','',10,7,'catalog/pet/1019058679.JPG',63,0,162.0000,0,0,'2018-06-21',0.06500000,1,600.00000000,100.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(211,'4605427235477','','','','','','','',10,7,'catalog/pet/1021804457.jpg',65,0,7590.0000,0,0,'2018-06-21',8.29500000,1,550.00000000,500.00000000,400.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(212,'4640000932848','','','','','','','',10,7,'catalog/pet/1017994112.jpg',66,0,1449.0000,0,0,'2018-06-21',3.95000000,1,400.00000000,1000.00000000,400.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(213,'4669211311310','','','','','','','',10,7,'catalog/pet/1014878355.jpg',67,0,1569.1000,0,0,'2018-06-21',7.30000000,1,550.00000000,550.00000000,350.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(214,'4669211332407','','','','','','','',10,7,'catalog/pet/1015933846.jpg',67,0,2499.1000,0,0,'2018-06-21',10.09000000,1,510.00000000,510.00000000,380.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(215,'4669211325515','','','','','','','',10,7,'catalog/pet/1017711237.jpg',67,0,3369.2000,0,0,'2018-06-21',10.28000000,1,600.00000000,550.00000000,440.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(216,'4605427237310','','','','','','','',10,7,'catalog/pet/1021804481.jpg',65,0,1519.0000,0,0,'2018-06-21',1.43000000,1,250.00000000,250.00000000,230.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(217,'4620003543814','','','','','','','',10,7,'catalog/pet/1005666777.jpg',27,0,719.0000,0,0,'2018-06-21',1.30000000,1,450.00000000,450.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(218,'4669211361315','','','','','','','',10,7,'catalog/pet/1014878347.jpg',67,0,1569.1000,0,0,'2018-06-21',6.05500000,1,460.00000000,450.00000000,750.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(219,'4669211322408','','','','','','','',10,7,'catalog/pet/1015934301.jpg',67,0,2499.1000,0,0,'2018-06-21',10.20000000,1,510.00000000,510.00000000,300.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(220,'4669211315516','','','','','','','',10,7,'catalog/pet/1017711406.jpg',67,0,3369.2000,0,0,'2018-06-21',9.92000000,1,590.00000000,550.00000000,440.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(221,'8712695161943','','','','','','','',10,7,'catalog/pet/1019779242.jpg',68,0,1099.0000,0,0,'2018-06-21',2.03500000,1,500.00000000,350.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(222,'4605427235637','','','','','','','',10,7,'catalog/pet/1021804476.jpg',65,0,3549.0000,0,0,'2018-06-21',5.29000000,1,800.00000000,450.00000000,450.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(223,'4620003544019','','','','','','','',10,7,'catalog/pet/1005516767.jpg',27,0,70.0000,0,0,'2018-06-21',0.10500000,1,55.00000000,55.00000000,55.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(224,'4669211381313','','','','','','','',10,7,'catalog/pet/1014886671.jpg',67,0,1569.1000,0,0,'2018-06-21',5.82500000,1,550.00000000,500.00000000,350.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(225,'4669211312409','','','','','','','',10,7,'catalog/pet/1015933982.jpg',67,0,2499.1000,0,0,'2018-06-21',10.09000000,1,510.00000000,540.00000000,380.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(226,'4630001311681','','','','','','','',10,7,'catalog/pet/1013171959.JPG',69,0,549.0000,0,0,'2018-06-21',0.15500000,1,250.00000000,90.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(227,'4630001314149','','','','','','','',10,7,'catalog/pet/1014159480.jpg',70,0,309.0000,0,0,'2018-06-21',0.16000000,1,160.00000000,20.00000000,10.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(228,'4656180220019','','','','','','','',10,7,'catalog/pet/1017683681.jpg',36,0,199.0000,0,0,'2018-06-21',0.04500000,1,170.00000000,120.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(229,'4011905023359','','','','','','','',10,7,'catalog/pet/1021627794.jpg',71,0,229.0000,0,0,'2018-06-21',0.12500000,1,280.00000000,150.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(230,'4607092072500','','','','','','','',10,7,'catalog/pet/1019524555.jpg',72,0,145.0000,0,0,'2018-06-21',0.05000000,1,120.00000000,80.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:04','2018-06-21 13:18:04'),(231,'4630001311643','','','','','','','',10,7,'catalog/pet/1012641568.jpg',69,0,434.0000,0,0,'2018-06-21',0.18500000,1,250.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(232,'4670004000892','','','','','','','',10,7,'catalog/pet/1013172009.JPG',69,0,619.0000,0,0,'2018-06-21',0.12500000,1,250.00000000,100.00000000,10.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(233,'4630001311896','','','','','','','',10,7,'catalog/pet/1014159550.jpg',69,0,669.0000,0,0,'2018-06-21',0.26500000,1,270.00000000,130.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(234,'4656180230018','','','','','','','',10,7,'catalog/pet/1017683682.jpg',36,0,182.0000,0,0,'2018-06-21',0.05500000,1,180.00000000,100.00000000,10.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(235,'4011905024004','','','','','','','',10,7,'catalog/pet/1021701649.jpg',71,0,99.0000,0,0,'2018-06-21',0.04500000,1,220.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(236,'6949649400113','','','','','','','',10,7,'catalog/pet/1005299836.jpg',73,0,414.0000,0,0,'2018-06-21',0.08000000,1,260.00000000,80.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(237,'4630001310233','','','','','','','',10,7,'catalog/pet/1012613362.jpg',69,0,519.0000,0,0,'2018-06-21',0.22500000,1,240.00000000,150.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(238,'4670004003039','','','','','','','',10,7,'catalog/pet/1013171983.jpg',69,0,759.0000,0,0,'2018-06-21',0.16000000,1,250.00000000,80.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(239,'5996415019858','','','','','','','',10,7,'catalog/pet/1014343935.jpg',74,0,18171.0000,0,0,'2018-06-21',1.28000000,1,280.00000000,240.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(240,'4656303100013','','','','','','','',10,7,'catalog/pet/1017683704.jpg',36,0,269.0000,0,0,'2018-06-21',0.11000000,1,250.00000000,130.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(241,'9698','','','','','','','',10,7,'catalog/pet/1014167572.jpg',75,0,4699.0000,0,0,'2018-06-21',8.39500000,1,650.00000000,650.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(242,'4601969004106','','','','','','','',10,7,'catalog/pet/1015550248.jpg',76,0,762.3000,0,0,'2018-06-21',1.42500000,1,440.00000000,400.00000000,320.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(243,'9700','','','','','','','',10,7,'catalog/pet/1017559194.JPG',77,0,5189.8000,0,0,'2018-06-21',3.54000000,1,1010.00000000,580.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(244,'5411388533304','','','','','','','',10,7,'catalog/pet/1021332725.jpg',48,0,11090.0000,0,0,'2018-06-21',7.94000000,1,820.00000000,540.00000000,210.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(245,'4602005061558','','','','','','','',10,7,'catalog/pet/1022040994.JPG',78,0,1729.0000,0,0,'2018-06-21',3.77500000,1,620.00000000,420.00000000,120.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(246,'0027773017639','','','','','','','',10,7,'catalog/pet/1014167573.jpg',75,0,4389.0000,0,0,'2018-06-21',8.33500000,1,610.00000000,610.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(247,'4601969012408','','','','','','','',10,7,'catalog/pet/1015641742.jpg',76,0,1078.9000,0,0,'2018-06-21',2.23500000,1,460.00000000,410.00000000,310.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(248,'3336022058369','','','','','','','',10,7,'catalog/pet/1017830896.jpg',79,0,1699.0000,0,0,'2018-06-21',0.94000000,1,345.00000000,220.00000000,135.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(249,'5411388001896','','','','','','','',10,7,'catalog/pet/1021332712.jpg',48,0,639.0000,0,0,'2018-06-21',0.69000000,1,250.00000000,120.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(250,'4602005073155','','','','','','','',10,7,'catalog/pet/1022098501.JPG',78,0,1039.0000,0,0,'2018-06-21',1.73000000,1,380.00000000,360.00000000,240.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(251,'9708','','','','','','','',10,7,'catalog/pet/1014167575.jpg',75,0,4779.1000,0,0,'2018-06-21',10.28000000,1,760.00000000,610.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(252,'4601969002102','','','','','','','',10,7,'catalog/pet/1015641713.jpg',76,0,646.2000,0,0,'2018-06-21',0.96000000,1,410.00000000,300.00000000,250.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(253,'3336022058376','','','','','','','',10,7,'catalog/pet/1018149524.jpg',79,0,1529.0000,0,0,'2018-06-21',0.94500000,1,340.00000000,220.00000000,130.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(254,'4634444018473','','','','','','','',10,7,'catalog/pet/1021372465.jpg',80,0,419.0000,0,0,'2018-06-21',0.28000000,1,200.00000000,170.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(255,'4602005075029','','','','','','','',10,7,'catalog/pet/1022098502.JPG',78,0,1479.0000,0,0,'2018-06-21',2.46000000,1,470.00000000,450.00000000,290.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(256,'4607130988886','','','','','','','',10,7,'catalog/pet/1001911023.jpg',0,0,1179.0000,0,0,'2018-06-21',0.58500000,1,480.00000000,300.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(257,'4620762022070','','','','','','','',10,7,'catalog/pet/1015374995.jpg',81,0,2959.0000,0,0,'2018-06-21',2.81500000,1,600.00000000,600.00000000,250.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(258,'649510043673','','','','','','','',10,7,'catalog/pet/1019051779.jpg',30,0,2019.0000,0,0,'2018-06-21',0.66500000,1,560.00000000,150.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(259,'4607969103108','','','','','','','',10,7,'catalog/pet/1021464864.jpg',41,0,1979.0000,0,0,'2018-06-21',0.58000000,1,500.00000000,400.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(260,'649510012914','','','','','','','',10,7,'catalog/pet/1021879581.jpg',30,0,4569.0000,0,0,'2018-06-21',3.02500000,1,1070.00000000,700.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(262,'4004218211926','','','','','','','',10,7,'catalog/pet/1012672935.jpg',83,0,9790.0000,0,0,'2018-06-21',16.20000000,1,620.00000000,340.00000000,460.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(263,'4823089303956','','','','','','','',10,7,'catalog/pet/1017639581.jpg',84,0,1599.0000,0,0,'2018-06-21',0.94000000,1,240.00000000,230.00000000,130.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(264,'6900012077059','','','','','','','',10,7,'catalog/pet/1019780641.jpg',85,0,3569.0000,0,0,'2018-06-21',4.46000000,1,380.00000000,280.00000000,390.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(265,'6900012640017','','','','','','','',10,7,'catalog/pet/1019780660.jpg',85,0,3969.0000,0,0,'2018-06-21',7.32000000,1,420.00000000,320.00000000,500.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(268,'4004218238909','','','','','','','',10,7,'catalog/pet/1012672938.jpg',83,0,3600.0000,0,0,'2018-06-21',2.47500000,1,320.00000000,300.00000000,370.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(269,'6923276830024','','','','','','','',10,7,'catalog/pet/1019780664.jpg',85,0,2659.0000,0,0,'2018-06-21',0.50100000,1,1.00000000,1.00000000,1.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(270,'6900011012402','','','','','','','',10,7,'catalog/pet/1019780643.jpg',85,0,3549.0000,0,0,'2018-06-21',4.42000000,1,380.00000000,290.00000000,390.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(271,'6900012076946','','','','','','','',10,7,'catalog/pet/1019780658.jpg',85,0,3969.0000,0,0,'2018-06-21',7.90000000,1,420.00000000,320.00000000,500.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(274,'4004218211827','','','','','','','',10,7,'catalog/pet/1012672933.jpg',83,0,3600.2000,0,0,'2018-06-21',2.48000000,1,310.00000000,280.00000000,370.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(275,'6900011012372','','','','','','','',10,7,'catalog/pet/1019780672.jpg',85,0,2659.0000,0,0,'2018-06-21',0.50100000,1,1.00000000,1.00000000,1.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(276,'4669211453775','','','','','','','',10,7,'catalog/pet/1022904784.jpg',67,0,3629.0000,0,0,'2018-06-21',0.50100000,1,1.00000000,1.00000000,1.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(277,'4620003278471','','','','','','','',10,7,'catalog/pet/1002991947.jpg',27,0,6290.2000,0,0,'2018-06-21',15.74000000,1,810.00000000,650.00000000,760.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(278,'4620762022094','','','','','','','',10,7,'catalog/pet/1015823809.jpg',81,0,3099.0000,0,0,'2018-06-21',2.28000000,1,900.00000000,800.00000000,250.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(279,'649510027857','','','','','','','',10,7,'catalog/pet/1019051954.jpg',30,0,6659.2000,0,0,'2018-06-21',4.10000000,1,1100.00000000,700.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(280,'4607969103115','','','','','','','',10,7,'catalog/pet/1021464863.jpg',41,0,1619.0000,0,0,'2018-06-21',0.58000000,1,500.00000000,400.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(281,'649510043635','','','','','','','',10,7,'catalog/pet/1021879582.jpg',30,0,4569.0000,0,0,'2018-06-21',3.02500000,1,1070.00000000,720.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(282,'4669211443776','','','','','','','',10,7,'catalog/pet/1022904763.JPG',67,0,3629.0000,0,0,'2018-06-21',0.50100000,1,1.00000000,1.00000000,1.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(283,'4690538003091','','','','','','','',10,7,'catalog/pet/1014653100.jpg',86,0,2549.0000,0,0,'2018-06-21',6.29500000,1,350.00000000,660.00000000,200.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(284,'4620762022155','','','','','','','',10,7,'catalog/pet/1015374996.jpg',81,0,1399.0000,0,0,'2018-06-21',1.16500000,1,650.00000000,450.00000000,180.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(285,'649510027796','','','','','','','',10,7,'catalog/pet/1019051951.jpg',30,0,4469.0000,0,0,'2018-06-21',1.48500000,1,650.00000000,500.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(286,'4011708370032','','','','','','','',10,7,'catalog/pet/1018737162.JPG',87,0,2729.0000,0,0,'2018-06-21',0.78500000,1,190.00000000,150.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(287,'4004218143166','','','','','','','',10,7,'catalog/pet/1010440854.jpg',83,0,919.0000,0,0,'2018-06-21',0.53300000,1,160.00000000,80.00000000,140.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(288,'4631136347286','','','','','','','',10,7,'catalog/pet/1022582988.jpg',88,0,151.0000,0,0,'2018-06-21',3.21000000,1,300.00000000,220.00000000,45.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(289,'4011708370025','','','','','','','',10,7,'catalog/pet/1018737163.JPG',87,0,2640.0000,0,0,'2018-06-21',0.91000000,1,200.00000000,150.00000000,90.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(290,'2100576904318','','','','','','','',10,7,'catalog/pet/1021232434.jpg',89,0,899.0000,0,0,'2018-06-21',0.66000000,1,230.00000000,230.00000000,130.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(291,'4004218143180','','','','','','','',10,7,'catalog/pet/1010443912.jpg',83,0,1369.0000,0,0,'2018-06-21',0.86500000,1,215.00000000,100.00000000,165.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(292,'4631136336075','','','','','','','',10,7,'catalog/pet/1022582991.jpg',88,0,403.0000,0,0,'2018-06-21',9.26500000,1,400.00000000,300.00000000,40.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(293,'4011708370018','','','','','','','',10,7,'catalog/pet/1018737164.JPG',87,0,3030.0000,0,0,'2018-06-21',0.84500000,1,190.00000000,150.00000000,80.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(294,'2101302000038','','','','','','','',10,7,'catalog/pet/1021232926.jpg',89,0,1819.0000,0,0,'2018-06-21',0.47000000,1,160.00000000,160.00000000,150.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(295,'4004218143203','','','','','','','',10,7,'catalog/pet/1010440855.jpg',83,0,2558.0000,0,0,'2018-06-21',1.06300000,1,220.00000000,95.00000000,185.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(296,'4631136347279','','','','','','','',10,7,'catalog/pet/1022583018.jpg',88,0,339.0000,0,0,'2018-06-21',9.80500000,1,400.00000000,300.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(297,'4011708370490','','','','','','','',10,7,'catalog/pet/1018737167.JPG',87,0,15789.6000,0,0,'2018-06-21',1.98000000,1,470.00000000,190.00000000,110.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(298,'2101302000045','','','','','','','',10,7,'catalog/pet/1021232927.jpg',89,0,990.0000,0,0,'2018-06-21',0.43500000,1,260.00000000,210.00000000,210.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(299,'4004218174689','','','','','','','',10,7,'catalog/pet/1010431401.jpg',83,0,1934.1000,0,0,'2018-06-21',1.04000000,1,195.00000000,370.00000000,130.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(300,'4631136336105','','','','','','','',10,7,'catalog/pet/1022583177.jpg',88,0,355.0000,0,0,'2018-06-21',9.54000000,1,400.00000000,300.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(301,'4605427224051','','','','','','','',10,7,'catalog/pet/1021677861.JPG',19,0,141.0000,0,0,'2018-06-21',0.04500000,1,130.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(302,'8594004693112','','','','','','','',10,7,'catalog/pet/1014149408.jpg',90,0,889.0000,0,0,'2018-06-21',0.15000000,1,80.00000000,80.00000000,140.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(303,'5907752658266','','','','','','','',10,7,'catalog/pet/1013271553.jpg',0,0,1739.0000,0,0,'2018-06-21',0.08500000,1,50.00000000,50.00000000,100.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(304,'4607177767840','','','','','','','',10,7,'catalog/pet/1013384761.jpg',91,0,444.0000,0,0,'2018-06-21',0.07000000,1,45.00000000,45.00000000,70.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(305,'4603586004521','','','','','','','',10,7,'catalog/pet/1014273115.jpg',92,0,179.0000,0,0,'2018-06-21',0.08500000,1,110.00000000,90.00000000,25.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(306,'4607092074214','','','','','','','',10,7,'catalog/pet/1019858114.jpg',93,0,256.0000,0,0,'2018-06-21',0.09500000,1,110.00000000,50.00000000,50.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(307,'4605427224075','','','','','','','',10,7,'catalog/pet/1021677862.JPG',19,0,141.0000,0,0,'2018-06-21',0.05000000,1,130.00000000,100.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(308,'8594004691378','','','','','','','',10,7,'catalog/pet/1010364258.jpg',90,0,2140.0000,0,0,'2018-06-21',0.53000000,1,95.00000000,95.00000000,180.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(309,'5907752658181','','','','','','','',10,7,'catalog/pet/1013245685.jpg',94,0,1169.0000,0,0,'2018-06-21',0.02100000,1,120.00000000,70.00000000,30.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(310,'4507122108431','','','','','','','',10,7,'catalog/pet/1013457989.jpg',95,0,134.0000,0,0,'2018-06-21',0.02500000,1,320.00000000,160.00000000,5.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(311,'4603586008529','','','','','','','',10,7,'catalog/pet/1014273159.jpg',0,0,35.0000,0,0,'2018-06-21',0.02500000,1,120.00000000,75.00000000,1.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(312,'4607092074207','','','','','','','',10,7,'catalog/pet/1019858117.jpg',93,0,373.0000,0,0,'2018-06-21',0.18000000,1,115.00000000,60.00000000,60.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(313,'4602300074086','','','','','','','',10,7,'catalog/pet/1021677858.JPG',65,0,73.0000,0,0,'2018-06-21',0.04500000,1,100.00000000,80.00000000,20.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(314,'8594004691644','','','','','','','',10,7,'catalog/pet/1010364252.jpg',96,0,2329.0000,0,0,'2018-06-21',0.15000000,1,80.00000000,80.00000000,140.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05'),(315,'8711231106653','','','','','','','',10,7,'catalog/pet/1013422209.jpg',97,0,213.0000,0,0,'2018-06-21',0.07500000,1,120.00000000,120.00000000,10.00000000,1,0,1,0,1,0,'2018-06-21 13:18:05','2018-06-21 13:18:05');
/*!40000 ALTER TABLE `zoo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_attribute`
--

DROP TABLE IF EXISTS `zoo_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_attribute`
--

LOCK TABLES `zoo_product_attribute` WRITE;
/*!40000 ALTER TABLE `zoo_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_description`
--

DROP TABLE IF EXISTS `zoo_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_description`
--

LOCK TABLES `zoo_product_description` WRITE;
/*!40000 ALTER TABLE `zoo_product_description` DISABLE KEYS */;
INSERT INTO `zoo_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES (50,1,'Консервы для кошек Petreet &quot;Natura&quot;, с кусочками розового тунца и лососем, 70 г','Полноценный сбалансированный корм для взрослых кошек всех пород. Консервы Petreet в виде нежного паштета изготовлены исключительно из натуральных продуктов и не оставят равнодушным ни одного питомца. В их состав входит до 64% основного компонента - мяса тунца, а это значит, что продукт богат протеином - источником бодрости вашей кошки. Для поддержания здоровья внутренних органов и зрения в состав консервов входит аргинин, таурин и незаменимые жирные кислоты Омега 3 и Омега 6. Идеально подходит для кастрированных и стерилизованных кошек. Некоторые виды содержат рис, восполняющий недостаток витамина В. В состав консервов входят различные деликатесные добавки в виде морепродуктов, овощей и фруктов, так что можно легко выбрать подходящий вариант даже для самой привередливой кошкиОснову консервов Petreet &quot;Natura&quot; с кусочками розового тунца и лобстером, нежное розовое мясо стейковой части тунца с добавлением лосося. При умеренной калорийности в корме содержится высокий уровень белка (15%). Состав: тунец (60%), лосось (4%), рисовая мука (1%), витамин А, D3,Е. Анализ: влажность - 84,0%, белок - 15,0%, клетчатка - 0,3%, жир - 1,6%, зола - 0,5%, витамин А - 666 МЕ/кг, витамин D3 - 50 МЕ/кг, витамин Е - 20 МЕ/кг. Вес 70 г. Товар сертифицирован.','','','',''),(51,1,'Корм сухой диетический Hill\'s &quot;C/D&quot; для собак, профилактика МКБ и струвитов, 12 кг','Сухой корм для собак Hill\'s &quot;C/D&quot; - полноценный диетический рацион для собак при урологическом синдроме (для  снижения вероятности рецидивов струвитного уролитиаза). Рацион обладает закисляющими мочу свойствами и  содержит умеренный уровень магния. Изменяет состав мочи для профилактики образования струвитных кристаллов и уролитов в мочевыводящих путях  собаки. - Превосходный вкус понравится вашей собаке. - Супер антиоксидантная формула повышает устойчивость клеток организма к воздействию свободных  радикалов. Монодиета. Не требует дополнений. Рекомендации по кормлению: суточная норма кормления указана на  упаковке и должна быть рассчитана в соответствии с размером животного, чтобы поддерживать оптимальный вес.  Суточную норму можно разделить на 2 и более кормлений в день. Рекомендуемая продолжительность  диетотерапии: до 6 месяцев. Обеспечьте питомца постоянным свободным доступом к свежей воде.  Состав: зерновые злаки, мясо и пептиды животного происхождения, производные растительного происхождения,  масла и жиры, минералы, семена.  Подкисляющее мочу вещество: сульфат кальция 5,0 г/кг. Анализ: белок 20,4%, жир 19,5%, клетчатка 2,7%, зола 4,6%, кальций 0,83%, фосфор 0,50%, натрий 0,26%, калий 0,59%,  хлориды 0,46%, сера 0,53%, магний 0,08%. На кг: витамин Е 600 мг, витамин С 70 мг, бета-каротин 1,5 мг.  Добавки на кг: витамин А 17 330 МЕ, витамин D3 1 020 МЕ, железо 58 мг, йод 1,0 мг, медь 5,7 мг, марганец 6 мг, цинк  120 мг, селен 0,16 мг. С консервантом и антиоксидантами.  Товар сертифицирован.  Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(52,1,'Корм сухой Royal Canin &quot;Mini Adult 8+&quot;, для собак весом до 10 кг старше 8 лет, 2 кг','Сухой корм Royal Canin &quot;Mini Adult 8+&quot; является полнорационным кормом для стареющих собак (в возрасте 8 лет и старше) мелких размеров.Особенности корма Royal Canin &quot;Mini Adult 8+&quot;: обеспечивает поддержание оптимального веса; питает шерсть собаки; способствует прекрасному аппетиту; помогает сократить отложение зубного камня.Состав: кукуруза, рис, дегидратированное мясо птицы, животные жиры, кукурузная клейковина, кукурузная мука, гидролизат белков животного происхождения, изолят растительных белков, свекольный жом, минеральные вещества, дрожжи, соевое масло, рыбий жир, фруктоолигосахариды.Пищевые добавки на 1 кг: витамин А 22200 МЕ, витамин D3 1000 МЕ, железо 47 мг, йод 4,7 мг, марганец 60 мг, цинк 181 мг, селен 0,08 мг, L-карнитин 50 мг, триполифосфат натрия 3,5 г, консервант, антиокислители.Питательные вещества: белки 27%, жиры 16%, минеральные вещества 4,7%, клетчатка 1,5%, медь 15 мг/кг.Товар сертифицирован.','','','',''),(53,1,'Консервы &quot;Наша Марка&quot; для взрослых собак мелких пород, с ягненком в соусе, 100 г','Консервы &quot;Наша Марка&quot; содержат большое количество влаги, поэтому они хорошо усваиваются и не перегружают пищеварительную систему. Для кормления взрослых собак мелких парод прекрасно подходят консервы в соусе &quot;Наша Марка&quot; с ягненком. Ароматный и питательный соус придает консервам особенно привлекательный для животного вкус и аромат, поэтому даже разборчивая в еде собака будет с удовольствием кушать такое угощение. Влажный корм &quot;Наша Марка&quot; с ягненком приготовлен на основе курицы и ягненка, причем содержание мясных ингредиентов в каждом кусочке составляет не менее 70%. Курица служит источником качественного протеина, витаминов K, E, A, практически всех витаминов группы B, калия, кальция, фосфора, магния, натрия, железа, селена и других минералов. Ягненок содержит незаменимые аминокислоты, полноценный белок, витамины PP и B12, йод, серу и цинк. Ниацин участвует в энергетическом обмене и, также как и холин, необходим для нормальной работы нервной системы. Витамин B5 отвечает за регенерацию тканей. Витамин B12 способствует высвобождению энергии из пищи. Сера повышает сопротивляемость организма бактериям, регулирует выработку желчи, замедляет процесс старения и отвечает за синтез коллагена. Цинк запускает процесс обновления клеток кожи, участвует в образовании коллагена, препятствует появлению высыпаний на коже, укрепляет иммунитет, улучшает работу мозга и оказывает положительное влияние на обмен веществ.Состав: мясо и продукты животного происхождения (курица мин. 15%, ягненок мин. 4%), растительные компоненты (в т.ч. экстракт белка растительного происхождения и натуральная клетчатка), минеральные добавки, масло подсолнечное, загустители и витамины. Питательные вещества: влажность 82%, протеин 7%, жир 4,5%, зола 2,5%, клетчатка 0,5%.Витамины: A 70 М.Е./100 г, Е 1,2 мг/100 г.Энергетическая ценность: 75 ккал / 100 г.Товар сертифицирован.','','','',''),(54,1,'Лакомство для собак Pedigree &quot;Markies&quot;, с мозговой косточкой, 150 г','Лакомство для собак Pedigree &quot;Markies&quot; подходит в качестве дополнения к   основному корму. Собаки средних размеров, например, кокер-спаниель не более 8 штук в неделю.   Собаки крупных размеров, например, лабрадор не более 16 штук   в неделю. Состав: злаки, продукты растительного происхождения, мясо и субпродукты   (включая 4% мозговой косточки и 4% мяса), сахара, жиры и масла,   минералы, белковые растительные экстракты, семена и травы. Пищевая ценность (100 г): белки - 14,3 г; жиры - 13 г; зола - 9,25 г; клетчатка - 2,5 г;   влага - 9,5 г; кальций - 1,6 г; омега-6 жирные кислоты - 53,7 мг;   витамин А - 796,9 МЕ; витамин Е - 7,97 мг; сульфат железа - 7,28 мг. Энергетическая ценность (100 г): 361 ккал. Товар сертифицирован.    Тайная жизнь домашних животных: чем занять собаку, пока вы на работе. Статья OZON Гид','','','',''),(55,1,'Корм сухой Hill\'s &quot;Active Longevity&quot; для кошек старше 7 лет, с курицей, 2 кг','Сухой корм Hill\'s &quot;Mature Adult Aktive Longevity&quot; - полноценный рацион для взрослых кошек старше 7 лет. Корм  обеспечивает точный баланс калорий, протеинов, витаминов и минералов. Содержит пониженный уровень  фосфора и повышенный уровень клетчатки. Не содержит искусственных красителей, ароматизаторов и  консервантов.  Science Plan - серия диет для повседневного кормления собак и кошек. При их создании специалистами компании  Hill\'s были использованы последние научные достижения в сфере диетологии.  Основной особенностью этого питания является линия рационов, соответствующих определенному возрастному  периоду. Также одним из критериев качества кормов, является их усваиваемость. В состав всех кормов входят  только высококачественные ингредиенты, обеспечивающие сбалансированное питание собак и кошек. Состав: мука из птицы (курицы мин. 35%, общее содержание мяса птицы мин. 50%), кукуруза, рис, животный жир,  мука из кукурузного глютена, гидролизат белка, сухая пульпа сахарной свеклы, калия хлорид, сульфат кальция,  рыбий жир, соль. Пищевая ценность: белки - 32%, жиры - 20,7%, клетчатка - 1%, зола - 4,9%, кальций - 0,77%, фосфор - 0,64%, натрий -  0,32%, калий - 0,77%, магний - 0,06%, витамин А - 16000 МЕ/кг, витамин Д3 - 943МЕ/кг, витамин Е1 - 87 мг/кг, витамин  Е2 - 1,4 мг/кг, витамин Е5 - 9 мг/кг, витамин Е6 - 180 мг/кг, витамин Е8 - 0,2 мг/кг, витамин Е - 650 мг/кг, витамин С - 70  мг/кг,  бета-каратин -1,5 мг/кг, таурин 1970 мг/кг, медь 8,6 мг/кг, натуральный консервант, натуральные  антиоксиданты. Вес: 2 кг.  Товар сертифицирован.','','','',''),(56,1,'Консервы для кошек Petreet &quot;Natura&quot;, с кусочками розового тунца и морковью, 70 г','Полноценный сбалансированный корм для взрослых кошек всех пород. Консервы Petreet в виде нежного паштета изготовлены исключительно из натуральных продуктов и не оставят равнодушным ни одного питомца. В их состав входит до 64% основного компонента - мяса тунца, а это значит, что продукт богат протеином - источником бодрости вашей кошки. Для поддержания здоровья внутренних органов и зрения в состав консервов входит аргинин, таурин и незаменимые жирные кислоты Омега 3 и Омега 6. При умеренной калорийности в корме содержится высокий уровень белка (15%). Уникальный высокоусвояемый полноценный гипоаллергенный рацион с низким показателем зольности (0,5%). Идеально подходит для кастрированных и стерилизованных кошек.Состав: тунец (60%), морковь (4%), рисовая мука (1%), витамины А, D3, Е. Анализ: влажность - 84,0%, белок - 15,0%, клетчатка - 0,3%, жир - 1,6%, зола - 0,5%, витамин А - 666 МЕ/кг, витамин D3 - 50 МЕ/кг, витамин Е - 20 МЕ/кг. Вес 70 г. Товар сертифицирован.','','','',''),(57,1,'Корм сухой для собак Hill\'s &quot;D/D Allergy &amp; Skin Care&quot;, диетический, для лечения пищевых аллергий, с уткой и рисом, 12 кг','Сухой корм для собак Hill\'s &quot;D/D&quot; - полноценный диетический рацион для собак, склонных к пищевым реакциям, или с   непереносимостью компонентов пищи. Поддерживает здоровье кожи при дерматитах и чрезмерной потере   шерсти. Содержит специально подобранные источники протеинов, углеводов и высокий уровень   полиненасыщенных жирных кислот.  Не содержит распространенных пищевых аллергенов, содержит высокий уровень незаменимых жирных кислот для   улучшения состояния кожи вашей собаки. - Превосходный вкус понравится вашей собаке. - Супер антиоксидантная формула повышает устойчивость клеток организма к воздействию свободных   радикалов.  Монодиета. Не требует дополнений. Рекомендации по кормлению: рекомендуемое число кормлений 2 раза в   сутки и более. Рекомендуемая продолжительность диетотерапии при пищевой аллергии/непереносимости   компонентов пищи - 3-8 недель, при исчезновении клинических симптомов диету можно применять без временных   ограничений. Рекомендуемая продолжительность диетотерапии при дерматитах и чрезмерной потери шерсти - до   2х месяцев. Обеспечьте питомца постоянным свободным доступом к свежей воде.   Состав: зерновые злаки, мясо и пептиды животного происхождения, масла и жиры, минералы, производные   растительного происхождения.   Источник белка: мука из утки, куриный гидролизат.  Источник углеводов: рис.   Анализ: белок 16,6%, жир 13,8%, незаменимые жирные кислоты 3,7%, клетчатка 1,3%, зола 4,7%, кальций 0,74%,   фосфор 0,56%, натрий 0,33%, калий 0,64%. На кг: витамин Е 600мг, витамин С 70 мл, бета-каротин 1,5 мг.   Добавки на кг: витамин А 16000 МЕ, витамин D3 940 МЕ, железо 72,5 мг, йод 1,2 мг, медь 7,2 мг, марганец 7,5 мг, цинк   150 мг, селен 0,2 мг. С антиоксидантами.   Товар сертифицирован.    Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.      Расстройства пищеварения у собак: кто виноват и что делать. Статья OZON Гид','','','',''),(58,1,'Корм сухой Royal Canin &quot;Mini Dermacomfort&quot;, для собак мелких пород, при раздражениях и зуде, 800 г','Сухой корм Royal Canin &quot;Mini Dermacomfort&quot; - полнорационный сухой корм для собак мелких размеров (вес взрослой собаки до 10 кг) старше 10 месяцев с раздраженной и зудящей кожей. Снижение риска возникновения аллергии.Использование корма Dermacomfort способствует поддержанию здоровья кожи собаки, поскольку в его составе ограничено использование источников белка, которые считаются потенциальными аллергенами у собак. Используемые белки были отобраны по их высокой степени усвояемости. Dermacomfort помогает уменьшить раздражение и зуд кожи.Здоровая шерсть.Питает шерсть благодаря включению в состав корма серосодержащих аминокислот (метионин и цистин), жирных кислот Омега 6 и витамина А.  Здоровье зубов.Помогает замедлить образование зубного налета благодаря полифосфату натрия, который связывает кальций, содержащийся в слюне.   Состав: рис, пшеничная клейковина, животные жиры, пшеница, кукурузная клейковина, кукуруза, очищенный овес, гидролизат печени птицы, минеральные вещества, соевое масло, свекольный жом, рыбий жир (источник EPA и DHA), льняное семя (источник Омега 3), фруктоолигосахариды, масло огуречника аптечного (источник гамма-линоленовой кислоты), экстракт бархатцев прямостоячих (источник лютеина).Добавки (в 1 кг): витамин А 30500 МЕ, витамин D3 800 МЕ, железо 55 мг, йод 5,5 мг, марганец 71 мг, цинк 214 мг, селен 0,12 мг, триполифосфат натрия 3,5 г, сорбат калия, пропилгаллат, БГА.Содержание питательных веществ: белки 26%, жиры 17%, минеральные вещества 5,4%, клетчатка пищевая 1,4%, жирные кислоты Омега 3 10,5 г, жирные кислоты EPA и DHA 4,2 г, медь 15 мг.Товар сертифицирован.','','','',''),(59,1,'Консервы для взрослых кошек &quot;Ночной охотник&quot;, с ягненком в желе, 400 г','Консервы для взрослых кошек &quot;Ночной охотник&quot; с ягненком в соусе - полноценное сбалансированное питание для взрослых кошек. Изготовлены из натурального мяса, без содержания сои, консервантов и ГМО продуктов. В состав корма входят питательные вещества, белки, минеральные вещества, витамины, таурин и другие компоненты, необходимые кошке для ежедневного питания.Состав: мясо ягненка не менее 10%, мясо и субпродукты животного происхождения, злаки, растительное масло, минеральные вещества, таурин, витамины А, D, E.Пищевая ценность в 100 г: сырой белок - 7%, сырой жир - 3,5%, сырая клетчатка - 0,4%, кальций - 0,25%, фосфор - 0,3%, сырая зола - 2%, влажность 80%.Вес: 400 г.Энергетическая ценность: 80 ккал/100г.Товар сертифицирован.','','','',''),(60,1,'Лакомство Pedigree &quot;Denta Stix&quot; для собак мелких пород, 45 г','Лакомство Pedigree &quot;Denta Stix&quot; подходит для собак мелких пород и щенков старше 4-х месяцев. Для собак мелких пород, например, такса - одна   палочка в день. Предназначено для собак весом 5-10 кг. Регулярное употребление помогает уменьшить образование зубного камня и   обеспечивает уход за зубами. В упаковке - 3 палочки. Состав: злаки, продукты растительного происхождения, мясо и субпродукты, минералы, белковые растительные экстракты, масла и жиры,   ароматизатор натуральный куриный (43,6 мг). Пищевая ценность (100 г): белки - 9,5 г; жиры - 2,6 г; зола - 6,1 г; клетчатка - 2,4 г; влага - 8 г; триполифосфат натрия - 2,4 г; сульфат цинка - 104,5   мг. Энергетическая ценность (100 г): 324 ккал. Товар сертифицирован.    Тайная жизнь домашних животных: чем занять собаку, пока вы на работе. Статья OZON Гид','','','',''),(61,1,'Корм сухой Hill\'s &quot;Adult Advanced Fitness&quot;, для взрослых собак, с тунцом, 3 кг','Корм Hill\'s &quot;Adult Advanced Fitness&quot; является полноценным рационом для собак от 1 года до 6 лет. Содержит точный баланс незаменимых жирных кислот для блестящей шерсти. Не содержит искусственных красителей, вкусовых добавок и консервантов.   Science Plan - серия диет для повседневного кормления собак и кошек. При их создании специалистами компании  Hill\'s   были использованы последние научные достижения в сфере диетологии. Основной особенностью этого питания является линия рационов, соответствующих определенному возрастному периоду. Также одним из критериев качества кормов, является их усваиваемость. В состав всех кормов входят только высококачественные ингредиенты, обеспечивающие сбалансированное питание собак и кошек. Характеристики:  Состав:  кукуруза, рис (минимум 10%), мука из соевых бобов, животный жир, мука из тунца (минимум 16%), мука из птицы, мука из кукурузного глютена, гидролизат белка, льняное семя, растительное масло, соль, карбонат кальция.  Пищевая ценность:  белки - 23%, жиры - 15,1%, клетчатка - 1,6%, зола - 4,3%, кальций - 0,66%, фосфор - 0,59%, калий - 0,64%, натрий - 0,22%, витамин А - 15 900 МЕ/кг, витамин Е - 600 мг/кг, витамин D3 - 935 МЕ/кг, Витамин С - 70 мг/кг, бета-каротин - 1,5 мг/кг, L-карнитин - 275 мг/кг, железо - 68,2 мг/кг, йод - 1,4 мг/кг, медь - 6,7 мг/кг, марганец - 7,1 мг/кг, цинк - 169 мг/кг, селен - 0,2 мг/кг.  Вес:  3 кг. Hill\'s - крупная компания по производству лечебных кормов для животных, основанная в 1948 году американским  ветеринарным врачом Марком Моррисом. В компании работают ветеринарные специалисты, диетологи и физиологи. На сегодняшний день  Hill\'s  является мировым лидером в производстве питания для домашних животных.     Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки.','','','',''),(62,1,'Консервы для кошек Petreet &quot;Natura&quot;, с кусочками розового тунца и рыбой дорада, 70 г','Полноценный сбалансированный корм для взрослых кошек всех пород. Консервы Petreet в виде нежного паштета изготовлены исключительно из натуральных продуктов и не оставят равнодушным ни одного питомца. В их состав входит до 64% основного компонента - мяса тунца, а это значит, что продукт богат протеином - источником бодрости вашей кошки. Для поддержания здоровья внутренних органов и зрения в состав консервов входит аргинин, таурин и незаменимые жирные кислоты Омега 3 и Омега 6. При умеренной калорийности в корме содержится высокий уровень белка (15%). Уникальный высокоусвояемый полноценный гипоаллергенный рацион с низким показателем зольности (0,5%). Идеально подходит для кастрированных и стерилизованных кошек.Состав: тунец (60%), рыба дорада (4%), рисовая мука (1%), витамины А, D3, Е. Анализ: влажность - 84,0%, белок - 15,0%, клетчатка - 0,3%, жир - 1,6%, зола - 0,5%, витамин А - 666 МЕ/кг, витамин D3 - 50 МЕ/кг, витамин Е - 20 МЕ/кг. Вес 70 г. Товар сертифицирован.','','','',''),(63,1,'Корм сухой диетический Hill\'s &quot;C/D&quot; для кошек, профилактика МКБ и струвитов, с курицей, 1,5 кг','Сухой корм для кошек Hill\'s &quot;C/D&quot; - полноценный диетический рацион для кошек. Рекомендован при урологическом  синдроме кошек склонных к набору веса (для снижения вероятности рецидивов струвитного уролитиаза). Рацион  обладает закисляющими мочу свойствами и содержит умеренный уровень магния. Растворяет струвитные уролиты уже через 14 дней и предотвращает рецидивы заболевания. - Превосходный вкус понравится вашей кошке. - Супер Антиоксидантная формула повышает устойчивость клеток организма к воздействию свободных  радикалов. Рекомендации по кормлению: суточная норма кормления указана на упаковке и должна быть расчитана в  соответствии с размером животного, чтобы поддерживать оптимальный вес. Суточную норму можно разделить на  2 и более кормлений в день. Рекомендуемая продолжительность диетотерапии: до 6 месяцев. Обеспечьте питомца  постоянным свободным доступом к свежей воде.  Состав: зерновые злаки, мясо и пептиды животного происхождения, экстракты растительного белка, масла и жиры,  минералы.  Подкисляющее мочу вещество: DL-метионин. Анализ: белок 32,4%, жир 15,6%, клетчатка 0,9%, зола 5,2%, кальций 0,72%, фосфор 0,66%, натрий 0,35%, калий 0,76%,  хлориды 0,88, сера 0,64%, магний 0,06%. На кг: витамин Е 550мг, бета-каротин 1,5 мг, таурин 2 360 мг. Добавки на кг: витамин А 24170 МЕ, витамин D3 1 430 МЕ, железо 264 мг, йод 2,6 мг, медь 33,5 мг, марганец 11,6 мг,  цинк 224 мг, селен 0,5 мг. С антиоксидантами и натуральным консервантом.  Товар сертифицирован.  Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(64,1,'Корм сухой Royal Canin &quot;Mini Exigent&quot;, для собак мелких пород, привередливых в питании, 800 г','Полнорационный сухой корм Royal Canin &quot;Mini Exigent&quot; для подходит собакам мелких размеров (вес взрослой собаки до 10 кг) старше 10 месяцев. Специальная технология изготовления крокет сочетает 2 вида текстур (хрустящую и мягкую), а также уникальные вкусовые добавки, что придется по вкусу даже самым привередливым собакам мелких размеров. Корм питает шерсть благодаря включению в состав корма серосодержащих аминокислот (метионин и цистин), жирных кислот Омега 6 и витамина А. Помогает замедлить образование зубного налета благодаря полифосфату натрия, который связывает кальций, содержащийся в слюне.  Состав: дегидратированное мясо птицы, животные жиры, предварительно обработанная пшеничная мука, рис, изолят растительных белков L.I.P., гидролизат белков животного происхождения, кукурузная мука, растительная клетчатка, свекольный жом, рыбий жир, минеральные вещества, фруктоолигосахариды, масло огуречника аптечного 0,1%.  Добавки в 1 кг: витамин А 29700 МЕ, витамин D3 800 МЕ, железо 45 мг, йод 4,5 мг, марганец 58 мг, цинк 175 мг, селен 0,09 мг, триполифосфат натрия 3,5 г, сорбат калия, пропилгаллат, БГА.  Содержание питательных веществ: белки 30%, жиры 22%, минеральные вещества 4,1%, клетчатка пищевая 2,7%, EPA/DHA 2,5 г, медь 15 мг.  Товар сертифицирован.  Расстройства пищеварения у собак: кто виноват и что делать. Статья OZON Гид','','','',''),(65,1,'Наполнитель для кошачьего туалета &quot;Cat Step&quot;, силикагелевый, 3,8 л','Гигиенический наполнитель &quot;Cat Step&quot; обеспечит вашей кошке всегда чистый туалет и устранит неприятный запах.Наполнитель представляет собой коллоидную форму кварца, разработанную специально для максимального впитывания. Миллионы микроскопических пор в каждом кристалле обеспечивают мгновенное поглощение жидкости и запаха, запирая их внутри. Наполнитель не ароматизирован, не выделяет пыли, не прилипает к лапам и шерсти животного, а также прост в использовании. Состав: силикагель.Вес: 1,81 кг.Товар сертифицирован.','','','',''),(66,1,'Наполнитель для кошачьих туалетов Сибирская Кошка &quot;Комфорт&quot;, 20 л','Экологически чистый супервпитывающий наполнитель для кошачьих туалетов Сибирская Кошка &quot;Комфорт&quot; производится из опоки - легкой, твердой, кремнистой сильно-тонко-пористой горной породы, богатой (до 97%) аморфным кремнеземом, с примесью песка и глинистых частиц. Опока - сильный адсорбент. Полностью поглощает все неприятные запахи, подавляет рост бактерий и других микроорганизмов. Быстро впитывает влагу. Не образует никаких комков и грязи, поэтому не требуется ежедневного ухода за кошачьим туалетом.  Состав: опока (горная порода).  Объем: 20 л. Товар сертифицирован. Уважаемые клиенты! Обращаем ваше внимание на то, что упаковка может иметь несколько видов дизайна. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(67,1,'Наполнитель для кошачьего туалета №1 &quot;Compact&quot;, комкующийся, 5 л','Наполнитель для кошачьего туалета №1 &quot;Compact&quot; состоит из специально обработанной и полностью обеспыленной глины, благодаря которой шерсть вашего питомца остается чистой. Мельчайшие гранулы наполнителя моментально впитывают жидкость, образуя комок и блокируют запах.','','','',''),(68,1,'Наполнитель для кошачьего туалета Vitaline &quot;Фирвуд&quot;, древесный, 4,5 л','Наполнитель для кошачьих туалетов Vitaline &quot;Фирвуд&quot; - это эффективный древесный наполнитель туалетов для кошек, в том числе длинношерстных кошек и котят, а также грызунов и рептилий.Наполнитель изготавливается по современным технологиям, на зарубежном оборудовании с применением измельченной древесной стружки. Гранулы размером 4 мм. Впитывают влагу и могут увеличиваться в размере в 3 раза - таким образом, упаковка весом 4,5 кг. способна впитать 12 литров жидкости! Гранулы не рассыпаются, и не оставляют после себя пыли и грязи. Легкий хвойный запах придется по душе вам и вашему любимцу. ','','','',''),(69,1,'Наполнитель Dr.Elsey\'s &quot;PC Ultra Scent&quot;, комкующийся, ароматизованный, 18,14 кг','Бентонитовый комкующийся наполнитель с натуральным ароматизатором. Маскирует даже самый стойкий запах. При соприкосновении с влагой, выделяет приятный свежий аромат. Образует твердые комки, удобные для уборки. Не оставляет следов.','','','',''),(70,1,'Наполнитель для кошачьего туалета №1 &quot;Naturel. Растительный&quot;, комкующийся, 4,5 л','Комкующийся наполнитель №1 NATUReL &quot;Растительный&quot; – изготовлен из растительных волокон и арахисовых выжимов. Основные свойства наполнителя №1 NATUReL &quot;Растительный&quot;: образует плотные комки, нейтрализует и абсорбирует неприятные запахи, 100% био-разлагаемый продукт. Не содержит никаких побочных добавок или химических составляющих, удобная экономичная упаковка. Инновационная Австралийская технология сочетает в одном продукте абсолютную натуральность компонентов состава и эффективную защиту от запаха и влаги. Естественные свойства натуральных растительных волокон позволяют добиваться хорошего комкующегося эффекта, при значительной экономии самого продукта. В процессе использования не требуется полная замена наполнителя, утилизируются только комочки, наполнитель остается чистым и свежим. Специально разработанная формула гранул нового натурального наполнителя, приятна для подушечек лап вашего питомца. Наполнитель не прилипает к шерсти и не застревает в лапках, препятствуя рассыпанию.','','','',''),(71,1,'Наполнитель для кошачьего туалета Ever Clean &quot;Multi-Crystals&quot;, комкующийся, 10 кг','Наполнитель для кошачьего туалета Ever Clean &quot;Multi-Crystals&quot; состоит из специально обработанной и очищенной от пыли глины. Он содержит синие и зеленые кристаллы, совместно воздействующие на неприятные запахи и медленно блокирующие их, обеспечивает максимальный контроль над запахом. Наполнитель отлично подходит для устранения самых сильных запахов. Гранулы наполнителя Ever Clean &quot;Multi-Crystals&quot; не только отлично впитывают, но и образуют крепкие трудноразбиваемые комки.&quot;Ever Clean&quot; - это элитная серия высококачественных комкующихся наполнителей для кошачьего туалета с уникальными свойствами. Наполнители созданы на основе запатентованной технологии и обеспечивают максимальное устранение запахов. В сердцевине каждой гранулы помещен активированный уголь. Капсулы активированного угля захватывают и удерживают неприятный запах внутри себя. Также в состав гранул входит антибактериальный компонент, который уничтожает бактерии, вызывающие неприятный запах.Состав: глина, активированный уголь.Вес: 10 кг. Товар сертифицирован.','','','',''),(72,1,'Наполнитель для кошачьих туалетов Сибирская Кошка &quot;Лесной&quot;, древесный, 20 л','Экологически чистый супервпитывающий наполнитель для кошачьих туалетов  Сибирская Кошка &quot;Лесной&quot; производится из древесины хвойных пород в  отсутствии каких-либо присадок. Его действие базируется на естественных  свойствах составляет 260-320%, что в 3 раза превосходит характеристики  обычных наполнителей. Дезинфицирующие качества наполнителя содействуют  уничтожению болезнетворных микробов. Обладает природным естественным запахом хвои.Наполнитель возможно  использовать также как подстилку в клетках для кроликов, морских свинок, крыс и  хомяков. Состав: древесина хвойных пород. Размер гранулы: 8 мм. Объем: 20 л. Товар сертифицирован.','','','',''),(73,1,'Наполнитель №1 Naturel &quot;Зеленый чай&quot;, для кошачьего туалета, комкующийся, 17,5 л','Комкующийся наполнитель №1 Naturel &quot;Зеленый чай&quot; для кошачьего туалета создан из древесных волокон высокогорного Гималайского кедра и листьев цейлонского  зеленого чая.  Особенности наполнителя №1 Naturel &quot;Зелёный чай&quot; : создан на основе инновационной Австралийской технологии; добавление листьев зелёного чая позволяет оптимально нейтрализовывать запахи, создавая комфортные условия, как владельцу, так и  питомцу; 100% био-разложимый комкующийся наполнитель; суперэкономичен; утилизируется в туалет, заботясь об окружающей среде и экологии; моментально комкуется, и его комочки легко удаляются лопаткой из лотка.','','','',''),(74,1,'Наполнитель Dr.Elsey\'s &quot;R&amp;R Respiratory&quot;, комкующийся, дыхательная помощь, 9,08 кг','Наполнитель с добавлением эфирных масел. Выпускается в виде комкующейся глины и селикогеля. Без искусственных ароматизаторов. Биоразлагаемый. Не липнет к лапкам. Профилактирует заболевания дыхательных путей. Не содержит растительных белков, отдушек и искусственных ароматизаторов.','','','',''),(75,1,'Наполнитель для кошачьего туалета №1 &quot;Naturel. Кукурузный&quot;, комкующийся, 17,5 л','Натуральный наполнитель №1 NATUReL &quot;Кукурузный&quot; – изготовлен из очищенных зерен кукурузы, с повышенным содержанием кукурузного крахмала, без добавления сердцевины початков. Добавление очищенных зерен кукурузы позволяет оптимально нейтрализовать запахи, создавая комфортные условия, как владельцу, так и питомцу. Основные свойства наполнителя №1 NATUReL &quot;Кукурузный&quot;: образует плотные комки, нейтрализует и абсорбирует неприятные запахи, 100% био-разлагаемый продукт. Не содержит никаких побочных добавок или химических составляющих, удобная экономичная упаковка. Инновационная Австралийская технология сочетает в одном продукте абсолютную натуральность компонентов состава и эффективную защиту от запаха и влаги. Естественные свойства натуральных растительных волокон позволяют добиваться хорошего комкующегося эффекта, при значительной экономии самого продукта. В процессе использования не требуется полная замена наполнителя, утилизируются только комочки, наполнитель остается чистым и свежим. Специально разработанная формула гранул нового натурального наполнителя, приятна для подушечек лап вашего питомца. Наполнитель не прилипает к шерсти и не застревает в лапках, препятствуя рассыпанию.','','','',''),(76,1,'Система приучения кошек к унитазу &quot;Litter Kwitter&quot;','Оригинальная система приучения кошек к унитазу &quot;Litter Kwitter&quot; поможет легко и быстро приучить вашу кошку или  кота ходить в туалет в обычный унитаз. Система представляет собой три пластиковых лотка с увеличивающимися  отверстиями, которые попеременно вставляются в специальную рамку аналогичную сиденью унитаза. Каждый  лоток имеет свой цвет, который определяет стадию приучения: красный, желтый и зеленый. Благодаря такой системе вы избавитесь от мусора от наполнителей, микробов и неприятных запахов.  Подходит ко всем стандартным унитазам.  В комплект входит DVD диск с подробной инструкцией по приучению. Размер лотков: 28 см х 3 см х 23 см. Размер рамки: 38,5 см х 5 см х 38 см.','','','',''),(77,1,'Наполнитель для кошачьих туалетов Сибирская Кошка &quot;Универсал&quot;, 20 л','Наполнитель для кошачьих туалетов Сибирская Кошка &quot;Универсал&quot; - супервпитывающий гигиенический наполнитель, экологически чистый продукт, который изготавливается из неповторимой композиции минералов вулканического происхождения, которые добываются в Свердловской области с глубин. Благодаря высочайшим адсорбционным свойствам вполне поглощает все неприятные запахи, замедляет развитие болезнетворных организмов, непревзойденно втягивает влагу. Влага, попадая в лоток, быстро просачивается вниз и впитывается нижними слоями наполнителя. Не оставляет грязи, и не возникнет практически никаких комков. Вам не потребуется каждодневного ухода за кошачьим туалетом. Состав: композиция минералов вулканического происхождения.Товар сертифицирован.','','','',''),(78,1,'Наполнитель №1 Naturel &quot;Зеленый чай&quot;, для кошачьего туалета, комкующийся, 4,5 л','Комкующийся наполнитель №1 Naturel &quot;Зеленый чай&quot; для кошачьего туалета создан из древесных волокон высокогорного Гималайского кедра и листьев цейлонского  зеленого чая.  Особенности наполнителя №1 Naturel &quot;Зелёный чай&quot; : создан на основе инновационной Австралийской технологии; добавление листьев зелёного чая позволяет оптимально нейтрализовывать запахи, создавая комфортные условия, как владельцу, так и  питомцу; 100% био-разложимый комкующийся наполнитель; суперэкономичен; утилизируется в туалет, заботясь об окружающей среде и экологии; моментально комкуется, и его комочки легко удаляются лопаткой из лотка.','','','',''),(79,1,'Наполнитель для кошачьего туалета Vitaline &quot;Эко№1&quot;, древесный, 10 кг','Наполнитель для кошачьих туалетов Vitaline &quot;Эко№1&quot; - универсальное средство для ухода за кошками, грызунами, рептилиями и даже птицами. Наполнитель созданный из массива хвойных пород древесины. 100% биологически разлагаем, не причиняет никакого вреда природе и совершенно безопасен для окружающей среды. Наполнитель Vitaline &quot;Эко№1&quot; нейтрализует неприятные запахи в период между посещениями лотка, сохраняя свежесть кошачьего туалета. Условия хранения:Гигиенический сертификат на упаковочный материал: Хранение при температуре 20\'C и относительной влажности не более 80%. Срок годности: не менее 5 лет.','','','',''),(80,1,'Туалет для кошек &quot;№1&quot;, с сеткой и совком, 49 х 38 х 16 см','Туалет &quot;№1&quot; - лучшее решение для содержания кошек. Современный и  высококачественный пластик не впитывает неприятные запахи,  которые так не любят животные, а также существенно упрощает процедуру  уборки туалета - легко моется и быстро сохнет. Борт обеспечит чистоту вокруг  туалета.','','','',''),(81,1,'Туалет для собак &quot;№1&quot;, с защелками,цвет: белый, голубой, 62,5 х 48 х 4,1 см','Туалет для собак &quot;№1&quot;, с защелками,цвет: белый, голубой, 62,5 х 48 х 4,1 см','','','',''),(82,1,'Совок &quot;Гамма&quot; для кошачьего туалета, цвет: сиреневый, длина 26 см','Совок для кошачьего туалета &quot;Гамма&quot; изготовлен из полипропилена. Рабочая  поверхность совка с мелкой и крупной сеткой позволяет освободить туалет от  образовавшихся комков и просеять наполнитель. На ручке совка есть отверстие  для  подвешивания на стену.  С помощью этого совка вы сможете быстро и качественно убрать туалет кошки.  Размер рабочей поверхности: 10 см х 11 см.','','','',''),(83,1,'Туалет для кошек Moderna &quot;Flip Cat&quot;, закрытый, цвет: лимонный, 39 х 50 х 37 см','Закрытый туалет для кошек &quot;Flip Cat&quot; выполнен из высококачественного пластика. Туалет оснащен прозрачной открывающейся дверцей, сменным фильтром и удобной ручкой для переноски. Такой туалет избавит ваш дом от неприятного запаха и разбросанных повсюду частичек наполнителя. Кошка в таком туалете будет чувствовать себя увереннее, ведь в этом укромном уголке ее никто не увидит. Кроме того, яркий дизайн с легкостью впишется в интерьер вашего дома. Туалет легко открывается для чистки благодаря практичным защелкам по бокам.','','','',''),(84,1,'Туалет для кошек DD Style &quot;Догуш&quot;, с сеткой, цвет: коричневый, бежевый, 30,5 х 42 х 10,5 см','Туалет для котят DD Style &quot;Догуш&quot; изготовлен из качественного  прочного пластика. Благодаря внутренней сетке, туалет можно  использовать как с наполнителем, так и без него.  Это самый простой в употреблении предмет обихода для котят. Туалет легко моется водой.','','','',''),(85,1,'Туалет-бокс для кошек &quot;№1&quot;, 49 х 37,5 х 39 см','Туалет для животных &quot;Makar&quot; - лучшее решение для содержания кошек. Современный и высококачественный пластик не впитывает неприятные запахи, которые так не любят животные, а также существенно упрощает процедуру уборки туалета - легко моется и быстро сохнет. Благодаря дверце удерживает запах внутри и обеспечивает чистоту вокруг туалета.','','','',''),(86,1,'Туалет для кошек &quot;Triol&quot;, с бортом, цвет: черный, желтый, 42 х 30 х 14,5 см','Туалет для кошек &quot;Triol&quot; выполнен из прочного цветного пластика. Изделие  прекрасно подходит для ухода за кошками. Высокие бортики и рама,  прикрепленная к лотку, предотвращают разбрасывание наполнителя.  Благодаря качественным материалам лоток &quot;Triol&quot; не впитывает неприятные  запахи и прекрасно отмывается.','','','',''),(87,1,'Совочек для кошачьего туалета Marchioro &quot;Pala&quot;, цвет: синий, длина 26 см','Совочек для кошачьего туалета Marchioro &quot;Pala&quot; изготовлен из цветного пластика и оснащен геометрическими отверстиями. Идеален для перемешивания и просеивания наполнителя. На ручке имеется петелька для подвешивания на стену. Размер рабочей поверхности: 10,5 см х 11 см. ','','','',''),(88,1,'Туалет для больших кошек Moderna &quot;Flip Cat&quot;, закрытый, цвет: лимон, 58 х 45 х 42 см','Закрытый туалет для кошек &quot;Flip Cat&quot; выполнен из высококачественного пластика. Туалет оснащен прозрачной открывающейся дверцей, сменным фильтром и удобной ручкой для переноски. Такой туалет избавит ваш дом от неприятного запаха и разбросанных повсюду частичек наполнителя. Кошка в таком туалете будет чувствовать себя увереннее, ведь в этом укромном уголке ее никто не увидит. Кроме того, яркий дизайн с легкостью впишется в интерьер вашего дома. Туалет легко открывается для чистки благодаря практичным защелкам по бокам.','','','',''),(89,1,'Туалет-бокс для кошек &quot;№1&quot;, 58,5 х 44,5 х 43 см','Туалет для животных &quot;Makar&quot; - лучшее решение для содержания кошек. Современный и высококачественный пластик не впитывает неприятные запахи, которые так не любят животные, а также существенно упрощает процедуру уборки туалета - легко моется и быстро сохнет. Благодаря дверце удерживает запах внутри и обеспечивает чистоту вокруг туалета.','','','',''),(90,1,'Туалетный лоток для собак &quot;Triol&quot;, цвет: белый, голубой','Туалетный лоток &quot;Triol&quot; прямоугольной формы предназначен для маленьких собак комнатных пород, совершающих гигиенические процедуры в помещении. Такой туалет хорошо подойдет для щенков любых пород, еще не научившихся дожидаться выгула, а также будет очень удобен в путешествии.   Туалетные лотки очень удобно использовать со впитывающими пеленками. Лоток снабжен фиксаторами, прочно удерживающими пеленку на лотке.         Характеристики:  Материал:  пластик. Размер:  48 см х 42 см х 4 см. Размер упаковки: 49 см х 43 см х 4 см. Производитель: Китай. Артикул: Р549.','','','',''),(91,1,'Туалет для кошек Marchioro &quot;Goa&quot;, с бортом, цвет: темно-зеленый, бежевый, 37 х 27 х 12 см','Туалет для кошек Marchioro &quot;Goa&quot; изготовлен из качественного итальянского  пластика. Высокий борт, прикрепленный по  периметру лотка, удобно защелкивается и предотвращает разбрасывание  наполнителя. Благодаря специальным резиновым ножкам туалет не скользит по  полу.','','','',''),(92,1,'Шлейка для собак и кошек Каскад &quot;Восьмерка&quot;, цвет: светло-коричневый, ширина 1 см, обхват груди 30-37 см','Шлейка Каскад &quot;Восьмерка&quot;, изготовленная из и натуральной кожи, подходит для собак мелких пород и кошек. Крепкие металлические элементы делают ее надежной и долговечной. Шлейка - это альтернатива ошейнику. Правильно подобранная шлейка не стесняет движения питомца, не натирает кожу, поэтому животное чувствует себя в ней уверенно и комфортно. Изделие отличается высоким качеством, удобством и универсальностью. Размер регулируется при помощи пряжек, зафиксированных в одном из 7 отверстий.  Обхват шеи: 24-28 см. Обхват груди: 30-37 см.  Ширина шлейки: 1см.','','','',''),(93,1,'Шлейка для собак Rogz &quot;Fancy Dress&quot;, цвет: голубой, ширина 2,5 см','Шлейка для собак Rogz &quot;Fancy Dress&quot; имеет необычный дизайн. Широкая гамма потрясающе красивых орнаментов на прочной тесьме поверх нейлоновой ленты украсит вашего питомца.Застегивается, не доставляя неудобство собаке.Специальная конструкция пряжки Rog Loc - очень крепкая(система Fort Knox). Замок может быть расстегнут только рукой человека.С помощью системы ремней изделие подгоняется под животного индивидуально.Необыкновенно крепкая и прочная шлейка.Выполненные по заказу литые кольца выдерживают значительные физические нагрузки и имеют хромирование, нанесенное гальваническим способом, что позволяет избежать коррозии и потускнения изделия.Легко можно прикрепить к ошейнику и поводку.Шлейка подходит для крупных собак, на обхват груди 60-100 см.','','','',''),(94,1,'Поводок для собак &quot;Camon&quot;, 1,5 x 120 см','Поводок изготовлен из искусственной кожи. Клеевой слой, сверхпрочные нити, крепкие  металлические элементы делают ошейник надежным и долговечным. Изделие отличается  высоким качеством, удобством и универсальностью. Ваша собака тоже хочет выглядеть стильно! Модный поводок, декорированный металлическими  элементами в виде косточек, станет для питомца отличным украшением и выделит его среди  остальных животных.  Длина поводка: 1,2 м   Ширина: 1,5 см.','','','',''),(95,1,'Ошейник для собак Hunter Maui М (36-55 cм) / 3,5 см сетчатый текстиль оранжевый','Hunter ошейник для собак Maui 36-55 cм сетчатый текстиль оранжевый Ошейник выполнен из невероятно мягкого и легкого текстильного материала. Регулируется по размеру в широком диапазоне. Обхват шеи 36-55 см.','','','',''),(96,1,'Поводок капроновый для собак &quot;Зооник&quot;, с латексной нитью, цвет: оранжевый, ширина 2 см, длина 2 м','Поводок для собак &quot;Зооник&quot; капроновый с латексной нитью. Инновационная разработка Российского производителя. Удобный в использовании:  надежный, мягкий, не скользит в руке. Идеально подходит для прогулок и дрессировки собак.  Поводок - необходимый аксессуар для собаки. Ведь в опасных ситуациях именно он способен спасти жизнь вашему любимому питомцу. Иногда  нужно ограничивать свободу своего четвероногого друга, чтобы защитить его или себя от неприятностей на прогулке.  Длина поводка: 2 м.','','','',''),(97,1,'Шлейка для собак Rogz &quot;Fancy Dress&quot;, цвет: розовый, ширина 2 см','Шлейка для собак Rogz &quot;Fancy Dress&quot; имеет необычный дизайн. Широкая гамма потрясающе красивых орнаментов на прочной тесьме поверх нейлоновой ленты украсит вашего питомца.Застегивается, не доставляя неудобство собаке.Специальная конструкция пряжки Rog Loc - очень крепкая(система Fort Knox). Замок может быть расстегнут только рукой человека.С помощью системы ремней изделие подгоняется под животного индивидуально.Необыкновенно крепкая и прочная шлейка.Выполненные по заказу литые кольца выдерживают значительные физические нагрузки и имеют хромирование, нанесенное гальваническим способом, что позволяет избежать коррозии и потускнения изделия.Легко можно прикрепить к ошейнику и поводку.','','','',''),(98,1,'Поводок для собак &quot;Camon&quot;, цвет: голубой, 1,5 x 120 см','Поводок изготовлен из искусственной кожи. Клеевой слой, сверхпрочные нити, крепкие  металлические элементы делают ошейник надежным и долговечным. Изделие отличается  высоким качеством, удобством и универсальностью. Ваша собака тоже хочет выглядеть стильно! Модный поводок, декорированный металлическими  элементами в виде косточек, станет для питомца отличным украшением и выделит его среди  остальных животных.  Длина поводка: 1,2 м   Ширина: 1,5 см.','','','',''),(99,1,'Ошейник для собак Hunter Smart &quot;Maui M&quot;, цвет: черный, 36-55 см','Ошейник для собак Hunter &quot;Maui&quot; выполнен из невероятно мягкого и легкого сетчатого текстиля. Регулируется по размеру в широком диапазоне. Застегивается на пластиковый карабин, имеет металлическое кольцо для поводка. Обхват шеи: 36-55 см. Ширина ошейника: 2,5 см.','','','',''),(100,1,'Поводок-рулетка Flexi &quot;New Classic L&quot;, лента, для собак весом до 50 кг, цвет: красный, 8 м','Удобный ленточный поводок-рулетка предназначен для выгула собак весом до 50 кг. Лента поводка автоматически сматывается и поводок в процессе использования не провисает, не касается грунта и таким образом не пачкается и не перетирается. Поводок не нужно подбирать руками когда питомец подошел ближе, таким образом ваши руки всегда чистые.   - обновленная эргономичная кнопка системы торможения - запатентованная тормозная система  - надежный карабин - светоотражающие элементы   Запатентованая система сматывания и фиксации длины — дополнительное удобство, помогающее контролировать поведение животного. Корпус рулетки выполнен из ударопрочного пластика.   Рулетка очень легка в применении, принесет вам еще большую радость от моментов, проведенных с любимцем.','','','',''),(101,1,'Шлейка для собак Rogz &quot;Alpinist&quot;, цвет: зеленый, ширина 1,1 см. Размер S','Особо мягкая, но очень прочная шлейка для собак Rogz &quot;Alpinist&quot; обеспечит безопасность на прогулке даже самым активным собакам.Все соединения деталей имеют специальную дополнительную строчку для большей прочности.Специальная конструкция пряжки Rog Loc - очень крепкая (система Fort Knox). Замок может быть расстегнут только рукой человека. Технология распределения нагрузки позволяет снизить нагрузку на пряжки, изготовленные из &quot;титанового&quot; пластика, с помощью правильного и разумного расположения грузовых колец, благодаря чему, даже при самых сильных рывках, изделие не рвется и не деформируется.Выполненные специально по заказу Rogz литые кольца гальванически хромированы, что позволяет избежать коррозии и потускнения изделия.','','','',''),(102,1,'Ошейник для собак &quot;Camon&quot;, цвет: серебряный, 1,5 х 38 см','Ошейник изготовлен из искусственной кожи. Клеевой слой, сверхпрочные нити, крепкие  металлические элементы делают ошейник надежным и долговечным. Изделие отличается  высоким качеством, удобством и универсальностью. Размер ошейника регулируется при помощи металлической пряжки. Имеется металлическое  кольцо для крепления поводка.  Ваша собака тоже хочет выглядеть стильно! Модный ошейник, декорированный металлическими  элементами в виде косточек, станет для питомца отличным украшением и выделит его среди  остальных животных.  Обхват шеи: 38 см.  Ширина: 1,5 см.','','','',''),(103,1,'Намордник для собак Hunter пластиковый размер 1 (4,5-6,5 см) / 20 см, макс 42 см','Hunter намордник для собак пластиковый размер 1 (4,5-6,5 см)/20 см Намордник пластиковый для собак. Легкий, стильный и надежный намордник Hunter из прочного и легкого пластика. Намордник подойдет как для ежедневных выгулов, так и для занятий с собакой по различным дрессировочным курсам. Благодаря своей форме позволяет собаке, лаять, принимать корм. Не трескается, не лопается на морозе.пластик','','','',''),(104,1,'Поводок-рулетка Flexi &quot;New Classic L&quot;, лента, для собак весом до 50 кг, цвет: черный, 8 м','Удобный ленточный поводок-рулетка предназначен для выгула собак весом до 50 кг. Лента поводка автоматически сматывается и поводок в процессе использования не провисает, не касается грунта и таким образом не пачкается и не перетирается. Поводок не нужно подбирать руками когда питомец подошел ближе, таким образом Ваши руки всегда чистые.  - обновленная эргономичная кнопка системы торможения - запатентованная тормозная система  - надежный карабин - светоотражающие элементы   Запатентованая система сматывания и фиксации длины — дополнительное удобство, помогающее контролировать поведение животного. Корпус рулетки выполнен из ударопрочного пластика.   Рулетка очень легка в применении, принесет вам еще большую радость от моментов, проведенных с любимцем.','','','',''),(105,1,'Шлейка для собак Rogz &quot;Alpinist&quot;, цвет: коричневый, ширина 1,1 см. Размер S','Особо мягкая, но очень прочная шлейка для собак Rogz &quot;Alpinist&quot; обеспечит безопасность на прогулке даже самым активным собакам.Все соединения деталей имеют специальную дополнительную строчку для большей прочности.Специальная конструкция пряжки Rog Loc - очень крепкая (система Fort Knox). Замок может быть расстегнут только рукой человека. Технология распределения нагрузки позволяет снизить нагрузку на пряжки, изготовленные из &quot;титанового&quot; пластика, с помощью правильного и разумного расположения грузовых колец, благодаря чему, даже при самых сильных рывках, изделие не рвется и не деформируется.Выполненные специально по заказу Rogz литые кольца гальванически хромированы, что позволяет избежать коррозии и потускнения изделия.','','','',''),(106,1,'Поводок для собак Camon &quot;Бусы. Сердечки&quot;, цвет: белый, фиолетовый, 120 см','Поводок для собак Camon &quot;Бусы. Сердечки&quot; выполнен из тонкого металлического троса, украшенного бусинками и бантиком. Прочный поводок рассчитан на собак весом до 10 кг. Длинна 120 см.','','','',''),(107,1,'Миска для животных Moderna &quot;Trendy Dinner. Друзья навсегда&quot;, двойная, цвет: ярко-розовый, 27 x 16,5 x 6 см','Миска для животных Moderna &quot;Trendy Dinner. Друзья навсегда&quot;, двойная, цвет: ярко-розовый, 27 x 16,5 x 6 см.','','','',''),(108,1,'Миска для животных &quot;Triol&quot;, 750 мл','Металлическая миска &quot;Triol&quot; удобнее пластмассовой тем, что она тяжелее и поэтому не переворачивается. Миска легко моется.  Диаметр основания: 11,5 см.  Высота: 6,5 см.  Объем: 750 мл.','','','',''),(109,1,'Подставка телескопическая &quot;Рекс&quot; 2,5 л, 2 х 2,5 л','Изготавливаемые устройства позволяют плавно изменять высоту расположения мисок. Кроме того, специальный прижим не позволит мискам переворачиваться (исключено расплескивание, загрязнение пола в комнате). Каждый вариант подставки снабжен прорезиненными ножками. Изделия окрашены порошковой краской, нанесенной в электростатическом поле.','','','',''),(110,1,'Миска для кошек Dezzie &quot;Рыбак&quot;, 150 мл','Миска для кошек Dezzie &quot;Рыбак&quot;, выполненная из пластика и оформленная красочным изображением, отличается легкостью и удобством применения. Она легко моется и быстро высыхает. Миска имеет резиновые антискользящие вставки. Размер миски: 12,5 x 12,5 x 4,5 см.Объем миски: 150 мл.','','','',''),(111,1,'Миска для животныx &quot;Artmiska&quot;, одинарная, на подставке, цвет: белый, полупрозрачный, 1 x 350 мл','Миска для животныx &quot;Artmiska&quot; создана специально для кошек и собак мелких пород. Высота подставки и угол ее наклона максимально обеспечивают правильное положение тела кошки или собаки при кормлении. Оптимальная высота и угол наклона подставки, форма и объем миски эффективно снижают разбрасывание корма домашним питомцем. Artmiska подходит для всех кошек и собакам мелких пород – той-терьерам, шпицам, йоркширским терьерам, карликовым пинчерам, чихуахуа и другим. Объем миски - 350 мл.','','','',''),(112,1,'Миска для птиц и грызунов №1 &quot;Зайчик&quot;, 100 мл','Миска для птиц и грызунов №1 имеет антибактериальные свойства, не впитывает жир и запах.  Прочный пластик, из которого выполнена миска совершенно не токсична. Миска рассчитана на длительное и активное использование.','','','',''),(113,1,'Миска для животных Moderna &quot;Trendy Dinner. Друзья навсегда&quot;, двойная, цвет: черничный, 27 x 16,5 x 6 см','Миска для животных Moderna &quot;Trendy Dinner. Друзья навсегда&quot;, двойная, цвет: черничный, 27 x 16,5 x 6 см','','','',''),(114,1,'Миска для животных &quot;Triol&quot;, на резинке, двойная','Металлическая миска с прорезиненным дном удобна тем, что не скользит по поверхности и не переворачивается. Этому способствует специальная резиновая накладка. В миску можно положить два разных блюда - в каждое отделение. Миска легко моется.  Размер миски: 27,5 см х 14,5 см х 2,5 см. Объемы отделений миски: 110 мл, 140 мл.','','','',''),(115,1,'Миска для животных &quot;VM&quot;, цвет: красный, стальной, черный, 480 мл. 3180','Миска для животных &quot;VM&quot;, изготовленная из  высококачественного металла, имеет оригинальный дизайн.  Дно миски оснащено резиновой вставкой, которая  предотвратит скольжение и повреждение пола, а также  обеспечит комфортный прием пищи вашего питомца.  Объем: 480 мл.','','','',''),(116,1,'Миска для кошек Dezzie &quot;Гурман&quot;, 150 мл','Миска для кошек Dezzie &quot;Гурман&quot;, выполненная из пластика и оформленная красочным изображением, отличается легкостью и удобством применения. Она легко моется и быстро высыхает. Миска имеет резиновые антискользящие вставки. Размер миски: 12,5 x 12,5 x 4,5 см.Объем миски: 150 мл.','','','',''),(117,1,'Миска для животных &quot;Petro Trade&quot;, с контейнером, цвет: красный, 600 мл','Миска для животных, изготовленная из пластика, не впитывает посторонние запахи. Особенно удобна такая миска, если в доме содержится несколько животных. Специальный прозрачный контейнер большой вместимости позволяет оставить достаточное количество корма на длительное время. Кроме того, в контейнер можно поместить жидкость объемом до 600 мл. Вместимость контейнера (для твердой пищи): 300 г.  Объем контейнера (для жидкости): 600 мл. Размер миски: 19 см х 12 см х 4,5 см.  Размер контейнера: 8,5 см х 8,5 см х 14,5 см.','','','',''),(118,1,'Миска для животных №1 &quot;Котенок&quot;, 150 мл','Миска для животных №1 &quot;Котенок&quot; имеет антибактериальные свойства, не впитывает жир и запах.  Прочный пластик, из которого выполнена миска совершенно не токсична. Миска рассчитана на длительное и активное использование.','','','',''),(119,1,'Поилка для животных Feed-Ex &quot;CatH2O&quot;, автоматическая, для кошек и собак мелких пород, 2 л','Кошки любят пить проточную воду - она свежая, прохладная и чистая. Автоматическая поилка - лучший способ сделать так, чтобы кошка потребляла больше жидкости. Питьевой фонтан сохраняет воду свежей и повышает содержание кислорода за счет постоянной циркуляции. Сменный угольный фильтр очищает воду от кусочков корма, мелкого мусора и бактерий. К поилке также прилагается таблетка Dental Care, которая поможет защитить от образования зубного камня и налета, а также укрепить десны. Таблетки разработаны и изготовлены в Австралии, не содержат красителей, не имеют вкуса и запаха. Простой способ гигиены полости рта посредством потребления воды! Таблетка Dental Care и фильтр поставляются в комплекте.Питание от адаптера 12V.Сменные угольные фильтры и таблетки Dental Care можно заказать отдельно.','','','',''),(120,1,'Автоматическая кормушка &quot;Feed-Ex&quot;, на 4 кормления, с емкостью для льда или воды, цвет: голубой','Автоматическая программируемая кормушка &quot;Feed-Ex&quot; с ЖК-дисплеем и емкостью для льда или воды,  предназначена для любого типа корма. Кормушка разделена на 4 сектора (лотка) и в установленное время  сектора поочередно открываются, и еда становится доступной для домашнего животного. Основные функции автоматической кормушки:   Возможность установки 4-х независимых кормлений (от 1 до 4 дней), например:  - один раз в день в течение 4-х дней;  - два раза в день в течение 2-х дней;  - четыре раза в день.   Миска с кормом вращается согласно запрограммированному времени.  Минимальный промежуток между кормлениями - 1 час, максимальный - 24 ч.  Объем каждого кормления - до 0,5 л.  Емкость для льда сохранит корм свежим, а также может служить миской для питьевой воды или  дополнительной емкостью для корма.  Возможность записи звукового сообщения длительностью до 6 секунд, которое будет проигрываться 3 раза  перед каждым кормлением.  Индикатор зарядки батареек.  Для собак мелких пород и котят рекомендуется использовать адаптер, уменьшающий объем корма.  Общий объем:  2 л (1-1,2 кг корма).  Объем каждого лотка: 0,5 л (250-300 г корма).  Глубина лотка: 5,5 см.  Необходимо докупить 4 алкалиновых батареи 1,5V типа &quot;С&quot; (не входят в комплект). Инструкция на русском языке прилагается.','','','',''),(121,1,'Миска нескользящая рельефная, 900 мл','','','','',''),(122,1,'Комбинезон для собак &quot;Gaffy Pet&quot;, унисекс, цвет: салатовый, черный. Размер XL','Флисовый комбинезон &quot;Gaffy Pet&quot; защитит вашего питомца от холода в любую   погоду. Выполнен из очень теплого флиса, поэтому теперь прогулка возможна   при любой температуре. На животе есть специальные резинки для лучшей   посадки. Комбинезон легко надевается и застегивается на молнию на спине.   Молния также закрыта планкой из флиса.Комбинезон незаменим при   активных прогулках и походах. Яркая расцветка подойдет всем собакам.  Обхват шеи: 43 см.Обхват груди: 74 см.Длина спины: 47 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(123,1,'Комбинезон для собак &quot;Dobaz&quot;, цвет: сиреневый. ДА13081С2ХЛ. Размер 2XL','Качественный велюровый комбинезон &quot;Dobaz&quot; на спинке оформлен аппликацией из страз. Аккуратная белая окантовка на капюшончике, манжетах рукавов и штанишек.Обхват шеи: 40 см.Обхват груди: 60 см.Длина спинки: 41 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(124,1,'Платье для собак &quot;Dobaz&quot;, цвет: розовый. ДЛ1024АХЛ. Размер XL','Красивое трикотажное платье &quot;Dobaz&quot; выполнено из 100% хлопка. Модель дополнена рюшами и бантиком на спинке. В таком платье ваша собачка будет самой красивой на прогулке.   Обхват шеи: 34 см.Обхват груди: 54 см.Длина спинки: 36 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(125,1,'Комбинезон для собак Happy Puppy &quot;Саванна&quot;, зимний, для девочки, цвет: бордовый. Размер 1 (S)','Зимний комбинезон для собак Happy Puppy &quot;Саванна&quot; отлично подойдет для прогулок в зимнее время года. Комбинезон изготовлен из полиэстера, защищающего от ветра и снега, а на подкладке используется искусственный мех, который обеспечивает отличный воздухообмен. Комбинезон застегивается на молнию, благодаря чему его легко надевать и снимать. Высокий ворот изделия выполнен из искусственного меха. Низ рукавов и брючин оснащен внутренними резинками, которые мягко обхватывают лапки, не позволяя просачиваться холодному воздуху. На пояснице комбинезон затягивается на шнурок-кулиску. Изделие декорировано вставкой из искусственного меха, оформленного под окрас барса.  Благодаря такому комбинезону простуда не грозит вашему питомцу и он сможет испытать не сравнимое удовольствие от снежных игр и забав.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(126,1,'Платье для собак Каскад &quot;Halloween&quot;, цвет: оранжевый, черный. Размер S','Платье для собак &quot;Каскад&quot; отлично подойдет для прогулок в сухую погоду или для дома. Платье не имеет рукавов, поэтому не ограничивает свободу движений, и собачка будет чувствовать себя в нем комфортно. Спинка модели украшена надписями, проймы рукавов отделаны рюшами. Платье также дополнено лаковым поясом.  Модное и удобное платье согреет вашего питомца во время прогулок и защитит от пыли и насекомых.Длина по спинке: 20 см.    Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(127,1,'Попона-дождевик для собак Rogz &quot;RainSkin&quot;, унисекс, цвет: красный. Размер XXS','Попона-дождевик для собак Rogz &quot;RainSkin&quot; предназначена для прогулок в прохладные дни. Низ попона-дождевика выполнен из подкладочного полиэстера и PVC слоя, а верх из 100% нейлона Rip Stop. Попона имеет водоотталкивающую и водонепроницаемую ткань, пятна грязи на которой не впитываются в ткань и легко удаляются.  Изделие имеет специальный карман для хранения, который удобно крепится на поводке или ошейнике. Кожа животного не перегревается. Специальная конструкция предотвращает защемление шерсти в зубья молнии и не вызывает раздражения на коже животного. Эластичные ремни могут перемещаться вправо или влево в зависимости от обхвата груди животного. Удобная застежка-молния располагается сбоку, а не под горлом. Данная система обеспечивает комфорт и удобство движения для активных животных. Специальная застежка на спине позволяет надевать попону вместе со шлейкой. Регулируемые вставки облегчают прилегание изделия к лапам.Ручная или машинная стирка.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(128,1,'Комбинезон для собак &quot;Gaffy Pet&quot;, унисекс, цвет: салатовый, черный. Размер 3XL','Флисовый комбинезон &quot;Gaffy Pet&quot; защитит вашего питомца от холода в любую   погоду. Выполнен из очень теплого флиса, поэтому теперь прогулка возможна   при любой температуре. На животе есть специальные резинки для лучшей   посадки. Комбинезон легко надевается и застегивается на молнию на спине.   Молния также закрыта планкой из флиса.Комбинезон незаменим при   активных прогулках и походах. Яркая расцветка подойдет всем собакам.  Обхват шеи: 52 см.Обхват груди: 104 см.Длина спины: 67 см.    Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(129,1,'Комбинезон для собак &quot;Dobaz&quot;, цвет: желтый, черный. ДА13049Б2ХЛ. Размер 2XL','Качественно выполненный теплый, мягкий трикотажный комбинезон &quot;Dobaz&quot; из комбинированной ткани с капюшоном.Удобно одевать. На спинке аппликация в виде герба.  Обхват шеи: 40 см.Обхват груди: 60 см.Длина спинки: 41 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(130,1,'Платье для собак &quot;Dobaz&quot;, цвет: розовый. ДЛ1024АХХЛ. Размер XXL','Красивое трикотажное платье &quot;Dobaz&quot; выполнено из 100% хлопка. Модель дополнена рюшами и бантиком на спинке. В таком платье ваша собачка будет самой красивой на прогулке.   Обхват шеи: 40 см.Обхват груди: 60 см.Длина спинки: 41 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(131,1,'Попона для собак Dogmoda &quot;Doggs&quot;, для девочки, цвет: коричневый. Размер S','Теплая попона для собак Dogmoda &quot;Doggs&quot; отлично подойдет для прогулок в холодное время года. Попона изготовлена из водоотталкивающего полиэстера, защищающего от ветра и осадков. Синтепоновый утеплитель сохранит тепло даже в сильные морозы и обеспечит уют во время зимних прогулок. На подкладке используется флис, который обеспечивает воздухообмен. Попона не имеет рукавов, поэтому не ограничивает свободу движений, и собака будет чувствовать себя в ней комфортно. Стильный меховой воротник-стойка на молнии всегда будет обращать на себя восторженное внимание других владельцев собак. Модель застегивается на кнопки. На животе попона затягивается на шнурок-кулиску с зажимом. Спинка декорирована вышитой надписью &quot;Doggs&quot;, оснащена светоотражающими элементами и ручкой. Модель снабжена непромокаемым карманом для размещения записки с информацией о вашем питомце, на случай если он потеряется. Благодаря такой попоне питомцу будет тепло и комфортно.      Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(132,1,'Платье для собак Каскад &quot;Два сердца&quot;, цвет: красный. Размер S','Платье для собак &quot;Каскад&quot; отлично подойдет для прогулок или для дома. Платье не имеет рукавов, поэтому не ограничивает свободу движений, и собачка будет чувствовать себя в нем комфортно. Спинка модели украшена изображением двух сердец, низ дополнен оборками.  Модное и удобное платье согреет вашего питомца во время прогулок и защитит от пыли и насекомых.Длина по спинке: 20 см.      Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(133,1,'Попона-дождевик для собак Rogz &quot;RainSkin&quot;, унисекс, цвет: розовый. Размер M/L','Попона-дождевик для собак Rogz &quot;RainSkin&quot; предназначена для прогулок в прохладные дни. Низ попона-дождевика выполнен из подкладочного полиэстера и PVC слоя, а верх из 100% нейлона Rip Stop. Попона имеет водоотталкивающую и водонепроницаемую ткань, пятна грязи на которой не впитываются в ткань и легко удаляются.  Изделие имеет специальный карман для хранения, который удобно крепится на поводке или ошейнике. Кожа животного не перегревается. Специальная конструкция предотвращает защемление шерсти в зубья молнии и не вызывает раздражения на коже животного. Эластичные ремни могут перемещаться вправо или влево в зависимости от обхвата груди животного. Удобная застежка-молния располагается сбоку, а не под горлом. Данная система обеспечивает комфорт и удобство движения для активных животных. Специальная застежка на спине позволяет надевать попону вместе со шлейкой. Регулируемые вставки облегчают прилегание изделия к лапам.Ручная или машинная стрика. Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(134,1,'Комбинезон для собак Kuzer-Moda &quot;Куртка-брюки&quot;, утепленный, унисекс, цвет: синий. Размер M','Утепленный комбинезон для собак Kuzer-Moda &quot;Куртка-брюки&quot; отлично подойдет для прогулок в холодное время года. Комбинезон изготовлен из плащевки с утеплителем из синтепона, который сохранит тепло даже в сильные морозы. Комбинезон с капюшоном застегивается на кнопки, благодаря чему его легко надевать и снимать. Капюшон пристегивается при помощи кнопок и дополнен искусственным мехом. Низ рукавов и брючин оснащен трикотажными манжетами, которые мягко обхватывают лапки, не позволяя просачиваться холодному воздуху. На пояснице комбинезон затягивается на шнурок-кулиску.Благодаря такому комбинезону простуда не грозит вашему питомцу.Длина по спинке 32 см.Обхват груди: 42 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(135,1,'Комбинезон для собак &quot;Dobaz&quot;, цвет: желтый, черный. ДА13049БХЛ. Размер XL','Качественно выполненный теплый, мягкий трикотажный комбинезон &quot;Dobaz&quot; из комбинированной ткани с капюшоном. Удобно одевать. На спинке аппликация в виде герба.  Обхват шеи: 34 см.Обхват груди: 54 см.Длина спинки: 36 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(136,1,'Платье для собак &quot;Dobaz&quot;, утепленное, цвет: розовый. ДЛ1025АХХЛ. Размер XXL','Платье для собак &quot;Dobaz&quot; выполнено из 100% хлопка. Текстильный верх отлично сочетается с джинсовым низом. Юбочка дополнена рюшами в горошек и двумя карманами с нашивкой. Платье имеет капюшон. В таком платье ваша собачка будет самой стильной.   Обхват шеи: 40 см.Обхват груди: 60 см.Длина спинки: 41 см.  Одежда для собак: нужна ли она и как её выбрать. Статья OZON Гид','','','',''),(137,1,'Сумка-фиксатор для кошек &quot;OSSO Fashion&quot;, цвет: серый. Размер S','Сумка-фиксатор для кошек &quot;OSSO Fashion&quot;, цвет: серый. Размер S','','','',''),(138,1,'Дом-тент для собак &quot;Triol&quot;, 53,5 см х 38 см х 46 см','Дом-тент идеален для использования в помещении или на улице. Запатентованная конструкция дает возможность легко и быстро собрать дом.  Такой дом-тент - это лучший выбор для ваших четвероногих друзей!  Дом-тент вложен в удобную сумку-чехол, закрывающуюся на застежку-молнию. Особенности дома-тента: - комфортная подстилка;  - дышащий материал;  - металлический каркас;  - легкая сборка на молнии. Размер домика: 53,5 см х 38 см х 46 см.','','','',''),(139,1,'Переноска для грызунов MPS &quot;Neyo&quot;, цвет: серо-малиновый, 30 см х 23 см х 23 см','Переноска MPS &quot;Neyo&quot;, выполненная из высококачественного пластика, прекрасно подойдет для транспортировки грызунов, а также собак и щенков мелких пород, небольших кошек и котят. Дно переноски снабжено устойчивыми ножками. Крышка с отверстиями для вентиляции оснащена удобной ручкой для переноски. Переноска снабжена надежным замком.','','','',''),(140,1,'Сумка-переноска для животных &quot;Каскад&quot;, складная, цвет: черный, голубой, 50 х 26 х 27 см','Сумка-переноска &quot;Каскад&quot; подходит для собак средних   пород и кошек. Изделие выполнено из плотного   материала и текстиля, а также имеет сборную-  разборную конструкцию. Закрывается при помощи   застежки-молнии по кругу. Сумка внутри оснащена   съемной подстилкой и поводком для безопасности   питомца. Снабжена специальными сетчатыми   резиновыми вставками, чтобы ваш любимец мог   дышать.  Для удобной переноски имеются ручка и  регулируемая по длине съемная лямка со специальной   накладкой. На дне закреплены четыре пластиковые   ножки. При необходимости сумка складывается и фиксируется   липучкой.  Сумка-переноска &quot;Каскад&quot; обязательно понравится   вашим домашним любимцам и сделает любую поездку   наиболее комфортной.  Размер сумки (в сложенном виде): 50 х 27 х 14 см.  Размер сумки (в разложенном виде): 50 х 26 х 27 см.      Прикольные переноски, которые наверняка понравятся питомцу. Статья OZON Гид','','','',''),(141,1,'Переноска для животных &quot;Triol&quot;, с замком, цвет: бежевый, бордовый, 62 х 34 х 36 см','Пластиковая переноска &quot;Triol&quot; предназначена для перевозки животных на небольшие и дальние расстояния. На верхней части переноски есть небольшой люк с отверстием и место для хранения документов и других необходимых вещей. Также переноска имеет специальные боковые отверстия, чтобы ваш любимец мог дышать. Переноска закрывается на металлическую дверцу-решетку с удобным пластиковым замком.  Для удобного использования у переноски имеется пластиковая ручка.   В комплект входят: металлическая дверца-решетка с замком, 5 зажимов-фиксаторов, верхняя и нижняя части переноски.    Прикольные переноски, которые наверняка понравятся питомцу. Статья OZON Гид','','','',''),(142,1,'Переноска-клетка для животных Savic &quot;Cottage&quot;, цвет: черный, 76 х 49 х 55 см','Удобная переноска-клетка для животных &quot;Savic&quot;  изготовлена из металла.  Такая клетка легко располагается в помещении, а также ограничивает  передвижения  маленьких четвероногих друзей по квартире.','','','',''),(143,1,'Сумка-переноска для животных &quot;Теремок&quot;, цвет: синий, темно-синий, 40 х 23 х 23 см','Сумка-переноска для животных &quot;Теремок&quot;, цвет: синий, темно-синий, 40 х 23 х 23 см','','','',''),(144,1,'Дом-тент для собак &quot;Triol&quot;, 107 см х 73,5 см х 86,3 см','Дом-тент идеален для использования в помещении или на улице. Запатентованная конструкция дает возможность легко и быстро собрать дом.  Такой дом-тент - это лучший выбор для ваших четвероногих друзей!  Дом-тент вложен в удобную сумку-чехол, закрывающуюся на застежку-молнию. Особенности дома-тента: - комфортная подcтилка;  - дышащий материал.  - легкая сборка на молнии. Размер домика: 107 см х 73,5 см х 86,3 см.','','','',''),(145,1,'Сумка-переноска для животных Fauna &quot;Lorrette&quot;','Сумка-переноска из модной клетчатой ткани. Детали сумки - из коричневого кожзаменителя. Два окошка с сеткой, дополнительный карман на молнии. Внутри сумки вшит поводок для крепления ошейника.','','','',''),(146,1,'Сумка-переноска для животных Elite Valley &quot;Батискаф&quot;, с отверстием для головы, цвет: темно-синий, черный, 37 х 14 х 16 см','Текстильная сумка Elite Valley &quot;Батискаф&quot; предназначена для собак мелких пород и кошек. Изделие закрывается на застежку-молнию. Для удобной переноски предусмотрены ручки. С внешней стороны имеется один небольшой карман. Также сумка оснащена отверстиями для головы и хвоста животного. По бокам расположены вставки из сетчатой ткани. Дно уплотнено твердой съемной вставкой.Сумка-переноска Elite Valley &quot;Батискаф&quot; обязательно понравится вашему домашнему любимцу.','','','',''),(147,1,'Переноска для животных &quot;Triol&quot;, с замком, цвет: бордовый, бежевый, 47,5 х 30,5 х 29,5 см','Переноска &quot;Triol&quot; предназначена для перевозки животных небольшого размера. Изделие выполнено из прочного пластика. По бокам расположены защелки, которые фиксируют верхнюю крышку. Специальные боковые отверстия обеспечивают проникновение внутрь воздуха. Переноска закрывается на металлическую дверцу-решетку с удобным пластиковым замком. Для удобной переноски имеется пластиковая ручка, а также 2 петли для крепления ремня.       Прикольные переноски, которые наверняка понравятся питомцу. Статья OZON Гид','','','',''),(148,1,'Переноска-клетка для животных Savic &quot;Cottage&quot;, цвет: черный, 91 х 57 х 62 см','Удобная переноска-клетка для животных &quot;Savic&quot;  изготовлена из металла.  Такая клетка легко располагается в помещении, а также ограничивает  передвижения  маленьких четвероногих друзей по квартире.','','','',''),(149,1,'Сумка-переноска для животных Каскад &quot;Спорт&quot;, цвет: черный, красный, 40 х 28 х 29 см','Сумка-переноска для животных Каскад &quot;Спорт&quot;, цвет: черный, красный, 40 х 28 х 29 см','','','',''),(150,1,'Сумка-переноска &quot;Гамма&quot; для животных, с сеткой, цвет: черно-серая клетка, 42 см х 28 см х 31 см','Текстильная сумка-переноска &quot;Гамма&quot; для собак мелких пород и кошек имеет твердое основание, которое не позволит животному провисать. С одной стороны переноски находится специальная вставка из сетки, чтобы ваш любимец мог дышать. Изделие выполнено из плотного текстиля с принтом в клетку.  Также в сумке есть специальная вставка для уплотнения, которая держит всю форму.  При необходимости сумку можно сложить.  Сумка-переноска &quot;Гамма&quot; понравится вашим домашним любимцам.      Прикольные переноски, которые наверняка понравятся питомцу. Статья OZON Гид','','','',''),(151,1,'Сумка-переноска CAPRICE','Сумка-переноска из коричневого кожзаменителя. Детали сумки из бежевого кожзаменителя. Два окошка с сеткой, дополнительный карман на молнии. Внутри вшит поводок для крепления ошейника.','','','',''),(152,1,'Груминг-спрей для кошек и котят Crystal Line &quot;Шелковый&quot;, универсальный, 110 мл','Груминг-спрей Crystal Line. ШЕЛКОВЫЙ универсальный применяется для ухода за кожно-волосяным покровом кошек и собак всех пород. Груминг-спрей представляет собой прозрачную жидкость от бесцветного до светло-желтого цвета со специфическим, характерным для парфюмерной композиции запахом, в своем составе содержит: воду питьевую, антистатик, кондиционер, нативный коллаген, гиалуроновую кислоту, лимонную кислоту, микрокер ИТ и парфюмерную композицию. Входящие в состав спрея компоненты способствуют улучшению обменных процессов в коже и волосяных луковицах, восстановлению эластичности волос, оказывают смягчающее и увлажняющее действие на кожу, облегчают расчесывание шерсти, придают ей шелковистость и блеск, предотвращают спутывание шерсти и образование &quot;колтунов&quot;. По степени воздействия на организм теплокровных животных спрей относится к малоопасным веществам (4 класс опасности по ГОСТ 12.1.007-76), не оказывает местно-раздражающего и сенсибилизирующего действия. При попадании на слизистые оболочки вызывает слабое раздражающее действие. Хорошо переносится собаками и кошками разных пород и возрастов. Перед использованием флакон со спреем встряхивают и нажимают на курковой распылитель, наносят раствор на чистую после мытья шампунем, влажную шерсть, раздвигая ее на пряди, из расчета 0,5-1 мл (одно - два нажатия на распылительную головку) на 1 кг массы животного. Затем не смывая спрей, шерсть расчесывают гребнем и высушивают. При обработке животного следует избегать попадания спрея в глаза. Срок годности при соблюдении условий хранения - 2 года со дня производства. Хранят зоогигиеническое средство в закрытой упаковке производителя, в защищенном от прямых солнечных лучей месте, отдельно от продуктов питания и кормов, при температуре от 2 С до 25 С.','','','',''),(153,1,'Подстилки для животных впитывающие &quot;Triol&quot;, для туалета, 40 см х 50 см, 24 шт','Гигиенические одноразовые подстилки для домашних животных &quot;Triol&quot; изготовлены из нежного, приятного на  ощупь гипоаллергенного нетканого материала. Специальное тиснение верхнего слоя мгновенно пропускает  влагу сквозь себя, а гелевый наполнитель внутри пеленки впитывает влагу и не позволяет жидкости, попавшей  внутрь, выходить наружу. Поверхность подстилки всегда остается сухой, бережно защищает кожу питомца.  Структура и состав подстилки предотвращают появление и распространение неприятных запахов.  Непромокаемое основание подстилки предохраняет пол, мебель и дно переноски от влаги, неизбежных  загрязнений, царапин и шерсти. Подстилки незаменимы во время путешествия, участия в выставках, визита к  ветеринару, приучения питомца к туалету, в послеоперационный период. Помогают решить проблему гигиены  щенков и приучить их к определенному месту. Подстилки являются отличной альтернативой наполнителя для  кошачьих туалетов, достаточно поместить пеленку в лоток вместо наполнителя. Продукт не токсичен, не  вызывает аллергии. Для сохранения влагопоглощающих и влагоудерживающих свойств не разрезать подстилку. Характеристики:   Материал: нетканое волокно, целлюлоза. Размер подстилки: 40 см х 50 см. Комплектация: 24 шт. Размер упаковки: 13,5 см х 18,5 см х 21 Артикул: Мт-150.   Уважаемые клиенты! Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара  остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(154,1,'Спрей для приучения собак к туалету &quot;Химола&quot;, 150 мл','Средство &quot;Химола&quot; предназначено для выработки у вашего домашнего питомца стойкой привычки справлять свою нужду на улице. Препарат позволяет сохранить чистоту и покой в вашем доме без применения силы или иного воздействия. Состав: аналог природного запаха, отдушка, вода очищенная.','','','',''),(155,1,'Коврики впитывающие &quot;Зооник&quot;, 60 х 60 см, 30 шт','Коврики впитывающие &quot;Зооник&quot; предназначены для одноразового использования. Верхний слой изготовлен из мягкого нетканого гипоаллергенного материала, который отлично впитывает и удерживает влагу и поглащает запах. Коврики могут использоваться как для туалетных лотков, так и при транспортировке в переноске или автомобиле.  Размер : 60 х 60 см.  Количество: 30 шт.','','','',''),(156,1,'Шампунь АВЗ &quot;Elite Professional&quot; увлажняющий, для собак и кошек, 270 мл','Увлажняющий шампунь АВЗ &quot;Elite Professional&quot; рекомендован для регулярного ухода за средне- и длинношерстными породами собак и кошек.  Эффективно увлажняет пересушенную шерсть, способствует быстрому росту здоровых волос, облегчает расчесывание. Состав: комплекс  аминокислот, экстракт овса, аллантоин.','','','',''),(157,1,'Средство от цветения воды из-за водорослей &quot;Медоса&quot;, дезинфицирующее, 250 мл','Средство &quot;Медоса&quot; предназначено для борьбы с цветением  воды. Специальный состав позволяет собирать планктонные  водоросли в комки, способствуя их быстрому удалению из  водоема, и очищать воду, не оказывая отрицательного влияния  на природный биологический баланс водоема. Удаляя из воды  фосфаты, препарат предотвращает рост  водорослей.  Товар сертифицирован.','','','',''),(158,1,'Груминг-спрей для собак и щенков Crystal Line &quot;Шелковый&quot;, универсальный, 110 мл','Груминг-спрей для собак и щенков Crystal Line &quot;Шелковый&quot; универсальный применяется для ухода за кожно-волосяным покровом кошек и собак всех пород.Груминг-спрей представляет собой прозрачную жидкость от бесцветного до светло-желтого цвета со специфическим, характерным для парфюмерной композиции запахом, в своем составе содержит: воду питьевую, антистатик, кондиционер, нативный коллаген, гиалуроновую кислоту, лимонную кислоту, микрокер ИТ и парфюмерную композицию. Входящие в состав спрея компоненты способствуют улучшению обменных процессов в коже и волосяных луковицах, восстановлению эластичности волос, оказывают смягчающее и увлажняющее действие на кожу, облегчают расчесывание шерсти, придают ей шелковистость и блеск, предотвращают спутывание шерсти и образование &quot;колтунов&quot;. По степени воздействия на организм теплокровных животных спрей относится к малоопасным веществам (4 класс опасности по ГОСТ 12.1.007-76), не оказывает местно-раздражающего и сенсибилизирующего действия. При попадании на слизистые оболочки вызывает слабое раздражающее действие. Хорошо переносится собаками и кошками разных пород и возрастов. Перед использованием флакон со спреем встряхивают и нажимают на курковой распылитель, наносят раствор на чистую после мытья шампунем, влажную шерсть, раздвигая ее на пряди, из расчета 0,5-1 мл (одно - два нажатия на распылительную головку) на 1 кг массы животного. Затем не смывая спрей, шерсть расчесывают гребнем и высушивают. При обработке животного следует избегать попадания спрея в глаза. Срок годности при соблюдении условий хранения - 2 года со дня производства. Хранят зоогигиеническое средство в закрытой упаковке производителя, в защищенном от прямых солнечных лучей месте, отдельно от продуктов питания и кормов, при температуре от 2 С до 25 С.','','','',''),(159,1,'Подстилки для животных впитывающие &quot;Triol&quot;, для туалета, 45 см х 60 см, 24 шт','Подстилки &quot;Triol&quot;, изготовленные из нежного гипоаллергенного нетканого материала, великолепно подходят для ухода за животными. Полиэтиленовое основание исключает протекание жидкости. Впитывающий слой надежно удерживает влагу и запах. С помощью таких подстилок вы сможете легко приучить своего питомца ходить в туалет в одно место. Также подстилки могут стать отличной заменой наполнителям для туалета.Характеристики: Материал: нетканое волокно, целлюлоза. Размер: 45 см х 60 см. Количество: 24 шт. Артикул: Мт-151.','','','',''),(160,1,'Спрей для приучения кошек к туалету Химола &quot;Антигадин&quot;, 150 мл','Препарат Химола &quot;Антигадин&quot; позволит вернуть чистоту и покой в ваше жилище, мирным путем отучит вашего любимца справлять нужду в непредназначенных для этого местах. Уникальная рецептура биодезодоранта Химола &quot;Антигадин&quot; на основе ферментов абсолютно нетоксична, не раздражает ни животных, ни людей. Состав: ферментная композиция, отдушка, вода очищенная.','','','',''),(161,1,'Коврики впитывающие &quot;Зооник&quot;, 40 х 60 см, 30 шт','Коврики впитывающие Зооник предназначены для одноразового использования. Верхний слой изготовлен из мягкого нетканого гипоаллергенного материала, который отлично впитывает и удерживает влагу и поглощает запах. Коврики могут использоваться как для туалетных лотков, так и при транспортировке в переноске или автомобиле.  Количество: 30 шт.','','','',''),(162,1,'Коврики защитные &quot;OOPS!&quot;, на клейких полосках, с антисептической угольной прослойкой, для кошек и собак, 60 х 60 cм, 18 шт','Коврики &quot;OOPS!&quot; содержат стеганое нетканое полотно, пропитанное специальным составом для приучения собак к месту, слой с активированным углем, адсорбирующее полотно с адсорбирующей крошкой, защитный слой из суперполимера против протекания жидкости и полиэтиленовую подложку. В упаковке 18 шт. Использование: впитывающие коврики незаменимы при посещении грумерского салона, при посещении ветеринарного врача, при появлении потомства, в первые месяцы жизни, в период лактации, при поездках в самолетах и поездах, машинах на дачу, при участии в выставках и соревнованиях.  Впитывающие коврики это — чистый пол в вашей квартире и чистая мебель, так как коврик можно использовать как подстилку на диван. И много, много всего, где коврики будут для вас незаменимыми помощниками.','','','',''),(163,1,'Средство от цветения воды из-за водорослей &quot;Медоса&quot;, дезинфицирующее, 100 мл','Средство &quot;Медоса&quot; предназначено для борьбы с цветением  воды. Специальный состав позволяет собирать планктонные  водоросли в комки, способствуя их быстрому удалению из  водоема, и очищать воду, не оказывая отрицательного влияния  на природный биологический баланс водоема. Удаляя из воды  фосфаты, препарат предотвращает рост  водорослей.  Товар сертифицирован.','','','',''),(164,1,'Шампунь для кошек и котят Crystal Line &quot;Бархатный&quot;, от колтунов, 200 мл','Шампунь Crystal Line &quot;Бархатный&quot; от колтунов предпочтительно использовать для ухода за животными с густой, длинной шерстью.Шампунь представляет собой вязкую жидкость перламутрового цвета, в своем составе содержит: воду питьевую, эмал 270 D, натрия хлорид, бетадет SHR, амидет N, кондиционер П-17, акипосал, диметикон, масло миндаля, парфюмерную композицию, микрокер ИТ, лимонную кислоту и гиалуроновую кислоту. Входящие в состав шампуня компоненты содержат комплекс биологически активных веществ, которые улучшают состояние кожи и шерсти, смягчают, увлажняют кожу, ускоряют ее регенерацию, восстанавливая эпидермальный барьер, обладают антиоксидантными свойствами. Шампунь обладает выраженными моющими свойствами, образует обильную пену в воде любой жесткости, легко смывается, придает шерсти шелковистость и блеск, снимает статический эффект. Зоогигиеническое средство по степени воздействия на организм относится к малоопасным веществам (4 класс опасности по ГОСТ 12.1.007-76), не обладает резорбтивно-токсическим, место-раздражающим и сенсибилизирующим действием. При попадании на слизистые оболочки вызывает слабое раздражающее действие. Хорошо переносится собаками и кошками разных пород и возраста. Перед обработкой кожно-волосяной покров животного обильно смачивают водой, затем наносят шампунь из расчета 0,5 - 1 мл на кг массы животного, равномерно распределяют по всей поверхности тела, слегка втирают до образования обильной пены, избегая попадания на слизистые оболочки. Через 3-5 минут шампунь тщательно смывают теплой водой, шерсть расчесывают гребнем и высушивают. При сильном загрязнении кожно-волосяного покрова животного процедуру повторяют. Срок годности при соблюдении условий хранения - 2 года со дня производства. Хранят зоогигиеническое средство в закрытой упаковке производителя, в защищенном от прямых солнечных лучей месте, отдельно от продуктов питания и кормов, при температуре от 2 С до 25 С.','','','',''),(165,1,'Средство для уборки мест обитания животных &quot;Flat&quot;, с нейтрализатором запаха для кошек, 480 г','Средство для уборки мест обитания животных &quot;Flat&quot; подходит для уборки любой поверхности. Не просто маскирует неприятные запахи, а уничтожает их. Безопасно для людей и животных. С нейтрализатором запаха для кошек.    Состав: вода, композиция ПАВ, функциональные добавки, ароматическая композиция, консервант.   Характеристики:  Вес: 480 г. Производитель: Россия.','','','',''),(166,1,'Спрей для приучения собак к туалету Химола &quot;Антигадин&quot;, 150 мл','Препарат Химола &quot;Антигадин&quot; позволит вернуть чистоту и покой в ваше жилище, мирным путем отучит вашего любимца справлять нужду в непредназначенных для этого местах. Уникальная рецептура биодезодоранта Химола &quot;Антигадин&quot; на основе ферментов абсолютно нетоксична, не раздражает ни животных, ни людей. Состав: ферментная композиция, отдушка, вода очищенная.','','','',''),(167,1,'Ботинки для собак &quot;Gaffy Pet&quot;, цвет: коричневый. Размер XS','Удобные и теплые ботинки &quot;Gaffy Pet&quot; порадуют вашу собачку. Ботиночки выполнены из мягкой замши, снаружи и внутри - искусственный мех. Стелька также на меху. Ботинок надежно фиксируется двумя липучками.В отличие от обуви на привычной твердой подошве, обувь на мягкой не сковывает движения и не скользит. Собака чувствует себя уверенно и комфортно.Подошва не ощутима на лапке, лапы не разъезжаются, и бегать удобно. Как в тапочках! Длина лапы: 3 см. Ширина лапы: 3 см.','','','',''),(168,1,'Ботинки для собак &quot;Грызлик Ам&quot;, цвет: синий. Размер L (5,7 х 4,7 см)','Силиконовые ботинки для собак. Защита лап: от реагентов, от слякоти, от грязи, от гравия, от битого стекла','','','',''),(169,1,'Сапожки для собак Dogmoda &quot;Комфорт&quot;, унисекс, цвет: черный. Размер 3 (L)','Сапожки для собак Dogmoda &quot;Комфорт&quot; отлично подойдут для прогулок в зимнее время года. Сапожки изготовлены из полиэстера, защищающего от ветра и снега, подкладка выполнена из искусственного меха, который обеспечивает отличный воздухообмен и сохранит тепло. Подошва сапожек изготовлена из нескользящего и незамерзающего материала из полиуретана - Vibram.  Высокие сапожки с расширителем застегиваются на эластичные резинки с липучками, благодаря чему их легко надевать и снимать. Красивые и практичные сапожки защитят вашего питомца от влаги, грязи и холода во время прогулки.','','','',''),(170,1,'Сапоги резиновые для собак &quot;Triol&quot;, унисекс, цвет: синий. Размер M','Резиновые сапоги &quot;Triol&quot;, выполненные из высококачественного ПВХ, предназначены для защиты лап собак от влаги и уличной грязи. Они надежно крепятся на лапах с помощью липучек.Сапоги &quot;Triol&quot; - мягкая и удобная обувь, оставляет лапы вашего питомца сухими и чистыми, идеальное решение в сезон весна-осень.','','','',''),(171,1,'Сапоги для собак &quot;Triol&quot;, унисекс, цвет: черный, красный. Размер S','Мягкие сапоги для собак &quot;Triol&quot; - лучшая защита от холода и реагентов. Изделия изготовлены из высококачественного неопрена.  Сапоги надежно фиксируются на лапе с помощью липучек. Специальный крой обеспечивает комфорт и не сковывает движения. Подошва не скользит.','','','',''),(172,1,'Ботинки для собак &quot;OSSO Fashion&quot;, на меху, для девочки, цвет: серый, розовый. Размер XS','Стильные, теплые и модные ботиночки для маленьких собак &quot;OSSO Fashion&quot;, изготовлены из синтетического материала с водоотталкивающей пропиткой. Подкладка выполнена из мягкого плюшевого искусственного меха. Подошва утеплена синтепоном.Рекомендации по уходу:Если ботинки не очень грязные, уберите загрязнения сверху с помощью влажной губки или салфетки, либо просто промойте водой. Допускается стирка при температуре не выше 40 С, однако следует учитывать, что при каждой стирке смывается часть пропитки и водоотталкивающие свойства ткани ухудшаются.Длина лапы: 3,5 см.Ширина лапы: 3 см.','','','',''),(173,1,'Ботинки для собак &quot;Gaffy Pet&quot;, цвет: коричневый. Размер S','Удобные и теплые ботинки &quot;Gaffy Pet&quot; порадуют вашу собачку. Ботиночки выполнены из мягкой замши, снаружи и внутри - искусственный мех. Стелька также на меху. Ботинок надежно фиксируется двумя липучками.В отличие от обуви на привычной твердой подошве, обувь на мягкой не сковывает движения и не скользит. Собака чувствует себя уверенно и комфортно.Подошва не ощутима на лапке, лапы не разъезжаются, и бегать удобно. Как в тапочках! Длина лапы: 3,5 см. Ширина лапы: 3 см.','','','',''),(174,1,'Ботинки для собак &quot;Грызлик Ам&quot;, цвет: сиреневый. Размер S (4,3 х 3,3 см)','Силиконовые ботинки для собак. Защита лап: от реагентов, от слякоти, от грязи, от гравия, от битого стекла','','','',''),(175,1,'Сапожки для собак Dogmoda &quot;Комфорт&quot;, унисекс, цвет: черный. Размер 4 (XL)','Сапожки для собак Dogmoda &quot;Комфорт&quot; отлично подойдут для прогулок в зимнее время года. Сапожки изготовлены из полиэстера, защищающего от ветра и снега, подкладка выполнена из искусственного меха, который обеспечивает отличный воздухообмен и сохранит тепло. Подошва сапожек изготовлена из нескользящего и незамерзающего материала из полиуретана - Vibram.  Высокие сапожки с расширителем застегиваются на эластичные резинки с липучками, благодаря чему их легко надевать и снимать. Красивые и практичные сапожки защитят вашего питомца от влаги, грязи и холода во время прогулки.','','','',''),(176,1,'Сапоги для собак &quot;Triol&quot;, унисекс, цвет: синий. Размер L','Сапоги &quot;Triol&quot; - резиновые сапоги для собак. Предназначены для защиты лап от влаги и уличной грязи. Выполнены из мягкой пластичной резины, надежно крепятся на лапах с помощью липучек. Мягкая и удобная обувь, оставляет лапы вашего питомца сухими и чистыми, идеальное решение в сезон весна-осень.  Длина стопы: 6 см. Ширина стопы: 5 см.','','','',''),(177,1,'Сапоги для собак &quot;Triol&quot;, унисекс, цвет: черный, синий. Размер XS','Сапоги для собак &quot;Triol&quot; - лучшая защита от холода и реагентов. Изделия изготовлены из высококачественного полиэстера. Сапоги оснащены светоотражающей нашивкой, которая сделает вашу собаку заметней в темный вечер. Сапоги надежно фиксируются на лапе с помощью липучек. Специальный крой обеспечивает комфорт и не сковывает движения. Подошва не скользит.','','','',''),(178,1,'Ботинки для собак &quot;OSSO Fashion&quot;, на меху, для девочки, цвет: серый, розовый. Размер S','Стильные, теплые и модные ботиночки для маленьких собак &quot;OSSO Fashion&quot;, изготовлены из синтетического материала с водоотталкивающей пропиткой. Подкладка выполнена из мягкого плюшевого искусственного меха. Подошва утеплена синтепоном.Рекомендации по уходу:Если ботинки не очень грязные, уберите загрязнения сверху с помощью влажной губки или салфетки, либо просто промойте водой. Допускается стирка при температуре не выше 40 С, однако следует учитывать, что при каждой стирке смывается часть пропитки и водоотталкивающие свойства ткани ухудшаются.Длина лапы: 4 см.Ширина лапы: 3,5 см.','','','',''),(179,1,'Ботинки для собак &quot;Грызлик Ам&quot;, цвет: сиреневый. Размер M (5 х 4 см)','Силиконовые ботинки для собак. Защита лап: от реагентов, от слякоти, от грязи, от гравия, от битого стекла','','','',''),(180,1,'Сапожки для собак Dogmoda &quot;Комфорт&quot;, унисекс, цвет: черный. Размер 5 (XXL)','Сапожки для собак Dogmoda &quot;Комфорт&quot; отлично подойдут для прогулок в зимнее время года. Сапожки изготовлены из полиэстера, защищающего от ветра и снега, подкладка выполнена из искусственного меха, который обеспечивает отличный воздухообмен и сохранит тепло. Подошва сапожек изготовлена из нескользящего и незамерзающего материала из полиуретана - Vibram.  Высокие сапожки с расширителем застегиваются на эластичные резинки с липучками, благодаря чему их легко надевать и снимать. Красивые и практичные сапожки защитят вашего питомца от влаги, грязи и холода во время прогулки.','','','',''),(181,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: синий, 20 шт. Размер M','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(182,1,'Резинка для животных Каскад &quot;Бант кружевной&quot;, цвет: белый, голубой, 3,5 х 2,5 см, 2 шт','Резинка для животных Каскад &quot;Бант кружевной&quot; - это красивое и стильное украшение для собак мелких пород и других животных. Изделия выполнены из текстиля, декорированы кружевом и бусиной. Крепятся при помощи латексной резинки.  Размер банта: 3,5 х 2,5 см.','','','',''),(183,1,'Антицарапки &quot;NEW&quot;, цвет: красный, 40 шт','Антицарапки &quot;New&quot; - мягкие колпачки для ногтей кошек голубого цвета, нового дизайна. Размер универсальный. Колпачки подойдут как котятам 1-2 месяцев, так и кошкам с котами весом до 6-7 кг. В каждой упаковке: 40 колпачков, 1 большой тюбик с клеем и 1 инструкция. Одной упаковки приблизительно хватает на 4-6 месяцев.','','','',''),(184,1,'Колпачки на когти кошек Cliny &quot;Мягкие коготки&quot;, защитные, цвет: пурпурный, 40 шт','Защитные колпачки для коготков &quot;Мягкие коготки&quot; - эластичные колпачки, которые крепятся на когти кошек и защищают от царапин. Являются лучшей альтернативой операции по удалению когтей. Легко надеваются и быстро фиксируются при помощи специального клея, входящего в набор.','','','',''),(185,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: красный, 20 шт. Размер S','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(186,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: желтый, 20 шт. Размер L','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(187,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: зеленый, 20 шт. Размер S','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(188,1,'Резинка для животных Каскад &quot;Бант с украшением&quot;, цвет: сиреневый, красный, 4 х 2,5 см, 2 шт','Резинка для животных Каскад &quot;Бант с украшением&quot; - это красивое и стильное украшение для собак мелких пород и других животных. Изделия выполнены из текстиля, декорированы принтом в горошек и украшением со стразами. Крепятся при помощи латексной резинки.  Размер банта: 4 х 2,5 см.','','','',''),(189,1,'Антицарапки &quot;NEW&quot;, цвет: желтый, 40 шт','Антицарапки &quot;New&quot; - мягкие колпачки для ногтей кошек голубого цвета, нового дизайна. Размер универсальный. Колпачки подойдут как котятам 1-2 месяцев, так и кошкам с котами весом до 6-7 кг. В каждой упаковке: 40 колпачков, 1 большой тюбик с клеем и 1 инструкция. Одной упаковки приблизительно хватает на 4-6 месяцев.','','','',''),(190,1,'Колпачки на когти кошек Cliny &quot;Мягкие коготки&quot;, защитные, цвет: серебристый, 40 шт','Защитные колпачки для коготков &quot;Мягкие коготки&quot; - эластичные колпачки, которые крепятся на когти кошек и защищают от царапин. Являются лучшей альтернативой операции по удалению когтей. Легко надеваются и быстро фиксируются при помощи специального клея, входящего в набор.','','','',''),(191,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: красный, 20 шт. Размер L','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(192,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: оранжевый, 20 шт. Размер S','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который предусмотрен в комплекте. В комплект входит: 20 колпачков на когти, клей, пластиковый фиксатор.','','','',''),(193,1,'Антикоготки для кошек &quot;Crazy Liberty&quot;, цвет: зеленый, 20 шт. Размер M','&quot;Crazy Liberty&quot; - модный тренд на креатив!!! Антикоготки для кошек защитят всю мебель в доме и обои от острых коготков. Приклеиваются с помощью специального клея, который идет в комплекте. В комплект входит: 20 шт. антикоготков, клей, пластиковый фиксатор','','','',''),(194,1,'Антицарапки &quot;NEW&quot;, цвет: белый, 40 шт','Антицарапки &quot;New&quot; - мягкие колпачки для ногтей кошек белого цвета, нового дизайна. Размер  универсальный. Колпачки подойдут как котятам 1-2 месяцев, так и кошкам с котами весом до 6-7  кг. В каждой упаковке: 40 колпачков, 1 большой тюбик с клеем и 1 инструкция. Одной упаковки,  приблизительно хватает на 4-6 месяцев.','','','',''),(195,1,'Антицарапки &quot;NEW&quot;, цвет: голубой, 40 шт','Антицарапки &quot;New&quot; - мягкие колпачки для ногтей кошек голубого цвета, нового дизайна. Размер универсальный. Колпачки подойдут как котятам 1-2 месяцев, так и кошкам с котами весом до 6-7 кг. В каждой упаковке: 40 колпачков, 1 большой тюбик с клеем и 1 инструкция. Одной упаковки приблизительно хватает на 4-6 месяцев.','','','',''),(196,1,'Игрушка для собак Petstages &quot;Chick-A-Bone. Косточка&quot;, с ароматом курицы, длина 18 см','Игрушка-косточка для сочетает в себе свойства настоящей косточки и прочность синтетических материалов. Не токсичный, прочный материал не содержит свинца и фталатов.  Не разламывается на куски, а значит, безопаснее, чем обычные кости. Игрушка с ароматом курицы, что дополнительно стимулирует интерес собаки. Отлично подходит для собак, которые любят жевать.Для собак весом свыше 25 кг.','','','',''),(197,1,'Игрушка для собак №1 &quot;Поросенок&quot;, с пищалкой, 9 см','Игрушка для собак &quot;№1&quot; выполнена в виде поросенка. Собаки очень любят играть. Игрушка оснащена пищалкой, благодаря которой собака с радостью ее хватает и подбрасывает.','','','',''),(198,1,'Игрушка для кошек Triol &quot;Мячик&quot;, 4 шт','Яркий мячик не позволит скучать вашему любимцу. Играя с этой забавной игрушкой, маленькие котята развиваются физически, а взрослые кошки и коты поддерживают свой мышечный тонус. Мячик привлечет внимание вашего любимца, не навредит здоровью, и займет его на долгое время.    Характеристики:  Материал: поролон. Диаметр: 4 см. Артикул: 02N.          Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки.  Уважаемые клиенты!  Обращаем ваше внимание, товар поставляется в цветовом ассортименте.','','','',''),(199,1,'Игрушка-когтеточка для кошек Zoobaloo &quot;Мышка с бабочкой&quot;, длина 10 см','Игрушка-когтеточка Zoobaloo &quot;Мышка с бабочкой&quot;  предназначена для кошек. Игрушка выполнена из сизаля.  Верхняя часть выполнена из искусственного меха в виде  мышиной мордочки. Игрушка снабжена бубенчиком.  Когтеточка - превосходное приспособление для  стачивания когтей. Изделие пропитано кошачьей мятой, которая очень нравится  кошкам.  УВАЖАЕМЫЕ КЛИЕНТЫ!  Обращаем ваше внимание на возможные изменения в цветовом дизайне,  связанные с ассортиментом продукции. Поставка осуществляется в зависимости  от наличия на складе.','','','',''),(200,1,'Дразнилка-удочка для кошек GoSi &quot;Мышка из норки&quot;, длина 50 см','Игрушка-удочка для кошек &quot;GoSi&quot; представляет собой деревянную палочку, на конце которой прикреплена мышь, выполненная из норки. Игрушка на резинке, хорошо пружинит и отскакивает. Игрушка поможет развить мускулатуру и реакцию кошки, а также удовлетворит её охотничий инстинкт. Способствует балансировке нервной системы, повышению мышечного тонуса, правильному развитию скелета. Рекомендуется для совместных игр хозяина с питомцем.Длина игрушки: 50 см.  Уважаемые клиенты! Обращаем ваше внимание на цветовой ассортимент товара. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(201,1,'Игрушка для собак Petstages &quot;Chick-A-Bone. Косточка&quot;, с ароматом курицы, длина 8 см','Игрушка-косточка для собак сочетает в себе свойства настоящей косточки и прочность синтетических материалов. Не токсичный, прочный материал не содержит свинца и фталатов.  Не разламывается на куски, а значит, безопаснее, чем обычные кости. Игрушка с ароматом курицы, что дополнительно стимулирует интерес собаки. Для собак весом до 6 кг.Отлично подходит для собак, которые любят жевать.','','','',''),(202,1,'Игрушка для собак №1 &quot;Свинка&quot;, с пищалкой, цвет: оранжевый, 10 см','Игрушка для собак &quot;№1&quot; выполнена в виде свинки. Собаки очень любят играть. Игрушка оснащена пищалкой, благодаря которой собака с радостью ее хватает и подбрасывает.','','','',''),(203,1,'Игрушка плюшевая для собак R2P Pet &quot;Multi-tex. Лиса&quot;, 30 см. 1131','Игрушка плюшевая для собак R2P Pet &quot;Multi-tex. Лиса&quot;  - это занимательная игрушка, изготовленная из плюша и резины. Игрушка умеет &quot;пищать&quot;, выполнена в виде забавного лисенка с прорезиненным животом.Наполнитель 100% полиэстер.Размер игрушки: 30 см х 20 см х 11 см. ','','','',''),(204,1,'Игрушка для кошек Zoobaloo &quot;Мышь&quot;, с пищалкой, 2 шт','Игрушка для кошек Zoobaloo &quot;Мышь&quot;, выполненная из флока и пластика, не  позволит заскучать  вашему пушистому питомцу. Играя с этой забавной игрушкой, маленькие котята  развиваются  физически, а взрослые кошки и коты поддерживают свой мышечный тонус.  Игрушка выполнена в  виде мышки и дополнена пищалкой, которая сделает игру особенно интересной.    Такая игрушка порадует вашего любимца, а вам доставит массу приятных  эмоций,  ведь  наблюдать за игрой всегда интересно и приятно.   В комплект входят 2 игрушки.  Длина игрушки: 6 см.  Длина игрушки (с учетом хвоста): 13 см.  УВАЖАЕМЫЕ КЛИЕНТЫ!  Обращаем ваше внимание на возможные изменения в цветовом дизайне,  связанные с ассортиментом продукции. Поставка осуществляется в  зависимости  от наличия на складе.','','','',''),(205,1,'Дразнилка-удочка для кошек GoSi &quot;Пушистик из норки&quot;, длина 50 см','Игрушка-удочка для кошек &quot;GoSi&quot; представляет собой деревянную палочку, на конце которой прикреплен пушистый помпон, выполненный из норки. Игрушка на резинке, хорошо пружинит и отскакивает. Игрушка поможет развить мускулатуру и реакцию кошки, а также удовлетворит её охотничий инстинкт. Способствует балансировке нервной системы, повышению мышечного тонуса, правильному развитию скелета. Рекомендуется для совместных игр хозяина с питомцем.Длина игрушки: 50 см.  Уважаемые клиенты! Обращаем ваше внимание на цветовой ассортимент товара. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(206,1,'Игрушка для собак Petstages &quot;Dogwood. Палочка&quot;, деревянная, длина 13 см','Игрушка-палочка для собак мелких пород. Сочетает в себе свойства настоящих деревянных палок и прочность синтетических материалов. Не токсичный, прочный материал безопаснее, чем реальные палочки. Игрушка плавает на поверхности воды.  Запах натурального дерева привлекает и удерживает интерес собаки в течение нескольких часов. Отлично подходит для собак, которые любят жевать.Для собак весом до 6 кг.','','','',''),(207,1,'Игрушка для собак №1 &quot;Свинка&quot;, с пищалкой, цвет: розовый, 10 см','Игрушка для собак &quot;№1&quot; выполнена в виде свинки. Собаки очень любят играть. Игрушка оснащена пищалкой, благодаря которой собака с радостью ее хватает и подбрасывает.','','','',''),(208,1,'Игрушка для собак Petstages Mini &quot;Гантелька&quot;, для нежных десен. 139REX','Игрушка для собак Petstages Mini &quot;Гантелька&quot;, изготовленная из полиэстера, предназначена для собак мелких пород с нежными и воспаленными деснами. Намочите игрушку и заморозьте. В холодном состоянии хрустит, что поддерживает интерес к игре, холод способствует снятию воспаления десен. Характеристики: Материал: 100% полиэстер.Длина игрушки: 16 см.','','','',''),(209,1,'Игрушка для кошек Zoobaloo &quot;Мяч из резины витой средний&quot;, диаметр 5 см','Этот мяч из латекса как ничто другое поможет вашему любимцу снять стресс. Мяч подходит для взыскательных и творческих животных – тут вам не просто сфера, а простор воображению и переплетение цветов! Он успокоит, умиротворит. Жевать – не пережЕвать!','','','',''),(210,1,'Дразнилка-удочка для кошек GoSi &quot;Норковый хвостик&quot;, длина 50 см','Игрушка-удочка для кошек &quot;GoSi&quot; представляет собой деревянную палочку, на конце которой прикреплен норковый хвост. Игрушка на резинке, хорошо пружинит и отскакивает. Игрушка поможет развить мускулатуру и реакцию кошки, а также удовлетворит её охотничий инстинкт. Способствует балансировке нервной системы, повышению мышечного тонуса, правильному развитию скелета. Рекомендуется для совместных игр хозяина с питомцем.Длина игрушки: 50 см.  Уважаемые клиенты! Обращаем ваше внимание на цветовой ассортимент товара. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(211,1,'Игровой комплекс для кошек &quot;Уют&quot;, с тремя когтеточками, лежанкой и игрушкой','Игровая четырехуровневая площадка &quot;Уют&quot; с домиком, 3-мя площадками, столбиками-когтеточками и игрушкой обязательно понравится вашему любимцу. Целый городок развлечений для вашего питомца, где можно выплеснуть избыток энергии. На выбор - три удобных спальных места и три столбика-когтеточки из натурального сизаля. Подходит для кошек любой породы и возраста.','','','',''),(212,1,'Когтеточка Пушок &quot;Столбик&quot;, на подставке, цвет: светло-бежевый, 40 х 40 х 100 см','Когтеточка Пушок &quot;Столбик&quot; поможет сохранить мебель и ковры в доме от когтей вашего любимца, стремящегося удовлетворить свою естественную потребность &quot;точить&quot; когти. Когтеточка изготовлена из дерева, искусственного меха и сизаля. Товар продуман в мельчайших деталях и, несомненно, понравится вашей кошке. Всем кошкам необходимо стачивать когти. Когтеточка - один из самых необходимых аксессуаров для кошки. Для приучения к когтеточке можно натереть ее сухой валерьянкой или кошачьей мятой. Когтеточка поможет вашему любимцу стачивать когти и при этом не портить  вашу мебель.Размер основания: 40 х 40 см.Высота когтеточки: 100 см.','','','',''),(213,1,'Игровой комплекс для кошек &quot;Меридиан&quot;, с домиком и когтеточкой, цвет: светло-серый, бежевый, 45 х 47 х 75 см','Игровой комплекс для кошек &quot;Меридиан&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие  предназначено для  кошек. Ваш домашний питомец будет с удовольствием точить когти о специальный столбик, изготовленный из джута. А отдохнуть он сможет либо  на полках разной высоты, либо в  расположенном внизу домике. Также комплекс оснащен подвесной игрушкой, которая привлечет вашего питомца. Общий размер: 45 х 47 х 75 см. Размер домика: 45 х 36 х 32 см. Высота полок (от пола): 75 см, 45 см. Размер полок: 26 х 26 см.','','','',''),(214,1,'Домик-когтеточка Меридиан &quot;Высотка&quot;, 4-ярусный, цвет: черный, коричневый, 51 х 51 х 123 см','Домик-когтеточка Меридиан &quot;Высотка&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие предназначено для кошек. Комплекс имеет 4 яруса. Ваш домашний питомец будет с удовольствием точить когти о специальные столбики, изготовленные из джута. А отдохнуть он сможет либо на полках, либо в расположенном внизу домике. Домик-когтеточка Меридиан &quot;Высотка&quot; принесет пользу не только вашему питомцу, но и вам, так как он сохранит мебель от когтей и шерсти.Общий размер: 51 х 51 х 123 см.Размер домика: 51 х 51 х 32 см.','','','',''),(215,1,'Домик-когтеточка &quot;Меридиан&quot;, круглый, с площадкой и полкой, цвет: светло-коричневый, бежевый, 55 х 50 х 147 см','Домик-когтеточка &quot;Меридиан&quot; выполнен из высококачественных материалов.Изделие предназначено для кошек. Оно включает в себя 2 домика разных размеров и 2 полки. Изделие обтянуто искусственным мехом, а столбики изготовлены из джута. Ваш домашний питомец будет с удовольствием точить когти о специальные столбики. Места хватит для нескольких питомцев. Домик-когтеточка &quot;Меридиан&quot; принесет пользу не только вашему питомцу, но и вам, так как он сохранит мебель от когтей и шерсти.Общий размер: 55 х 50 х 147 см. Размер большого домика: 50 х 50 х 29 см.Размер малого домика: 33 х 33 х 29 см.Размер нижней полки: 55 х 34 см.Размер верхней полки: 27 х 27 см.','','','',''),(216,1,'Когтеточка-катушка &quot;Уют&quot;, сизалевая, 25 х 25 х 22 см','Когтеточка &quot;Уют&quot; выполнена в оригинальной форме катушки, может стать прекрасным дополнением к интерьеру вашей квартиры. Выполнена из натурального сизаля.','','','',''),(217,1,'Когтеточка &quot;Triol&quot;, на подставке, цвет: голубой, молочный, 46 х 30 см','Когтеточка &quot;Triol&quot; выполнена из сизаля, пластика и МДФ в виде столбика на подставке. Сверху к когтеточке крепится шарик на веревочке.  Всем кошкам необходимо стачивать когти. Когтеточка - один из самых необходимых аксессуаров для кошки. Когтеточка должна располагаться на такой высоте, чтобы кошка могла встать на задние лапы и вытянуть наверх передние. Для приучения к когтеточке можно натереть ее сухой валерьянкой или кошачьей мятой. Когтеточка &quot;Triol&quot; поможет вашему любимцу стачивать когти и при этом не портить вашу мебель. Высота когтеточки: 46 см. Диаметр основания: 30 см.','','','',''),(218,1,'Игровой комплекс для кошек &quot;Меридиан&quot;, с домиком и когтеточкой, цвет: оранжевый, черный, бежевый, 45 х 47 х 75 см','Игровой комплекс для кошек &quot;Меридиан&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие  предназначено для  кошек. Ваш домашний питомец будет с удовольствием точить когти о специальный столбик, изготовленный из джута. А отдохнуть он сможет либо  на полках разной высоты, либо в  расположенном внизу домике. Также комплекс оснащен подвесной игрушкой, которая привлечет вашего питомца. Общий размер: 45 х 47 х 75 см. Размер домика: 45 х 36 х 32 см. Высота полок (от пола): 75 см, 45 см. Размер полок: 26 х 26 см.','','','',''),(219,1,'Домик-когтеточка Меридиан &quot;Высотка&quot;, 4-ярусный, цвет: светло-коричневый, 51 х 51 х 123 см','Домик-когтеточка Меридиан &quot;Высотка&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие предназначено для кошек. Комплекс имеет 4 яруса. Ваш домашний питомец будет с удовольствием точить когти о специальные столбики, изготовленные из джута. А отдохнуть он сможет либо на полках, либо в расположенном внизу домике. Домик-когтеточка Меридиан &quot;Высотка&quot; принесет пользу не только вашему питомцу, но и вам, так как он сохранит мебель от когтей и шерсти.Общий размер: 51 х 51 х 123 см.Размер домика: 51 х 51 х 32 см.','','','',''),(220,1,'Домик-когтеточка &quot;Меридиан&quot;, круглый, с площадкой и полкой, цвет: светло-серый, бежевый, 55 х 50 х 147 см','Домик-когтеточка &quot;Меридиан&quot; выполнен из высококачественных материалов.Изделие предназначено для кошек. Оно включает в себя 2 домика разных размеров и 2 полки. Изделие обтянуто искусственным мехом, а столбики изготовлены из джута. Ваш домашний питомец будет с удовольствием точить когти о специальные столбики. Места хватит для нескольких питомцев. Домик-когтеточка &quot;Меридиан&quot; принесет пользу не только вашему питомцу, но и вам, так как он сохранит мебель от когтей и шерсти.Общий размер: 55 х 50 х 147 см. Размер большого домика: 50 х 50 х 29 см.Размер малого домика: 33 х 33 х 29 см.Размер нижней полки: 55 х 34 см.Размер верхней полки: 27 х 27 см.','','','',''),(221,1,'Когтеточка-столбик Beeztees &quot;Lesley&quot;, цвет: серый, 35 х 35 х 60 см','Когтеточка-столбик Beeztees &quot;Lesley&quot; поможет приучить кошку точить коготки в строго определенном месте. Изготовлена из сизаля, натурального прочного материала. Размер: 35 х 35 х 60 см.','','','',''),(222,1,'Когтеточка-столбик &quot;Уют&quot;, прямоугольная, 45 х 45 х 80 см','Когтеточка &quot;Уют&quot; - необходимый аксессуар для вашего питомца. Она сбережет в целости и сохранности ваши обои, мебель и предметы интерьера.  Эта когтеточка не только удовлетворит естественную потребность вашего питомца точить когти, но и станет любимым местом для игр. Когтеточка компактна и многофункциональна, выполнена из натурального сизаля.','','','',''),(223,1,'Игрушка-когтеточка Triol &quot;Шарик с перьями&quot;, цвет: розовый, диаметр 6 см','Игрушка-когтеточка Triol &quot;Шарик с перьями&quot; выполнена из сизаля и украшена разноцветными перьями. Внутри игрушки находится погремушка.  Всем кошкам необходимо стачивать когти. Когтеточка - один из самых необходимых аксессуаров для кошки. Для приучения к когтеточке можно натереть ее сухой валерьянкой или кошачьей мятой.Игрушка-когтеточка Triol &quot;Шарик с перьями&quot; поможет вашему любимцу стачивать когти и при этом не портить вашу мебель.Диаметр игрушки: 6 см.','','','',''),(224,1,'Игровой комплекс для кошек &quot;Меридиан&quot;, с домиком и когтеточкой, цвет: белый, бежевый, 45 х 47 х 75 см','Игровой комплекс для кошек &quot;Меридиан&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие  предназначено для  кошек. Ваш домашний питомец будет с удовольствием точить когти о специальный столбик, изготовленный из джута. А отдохнуть он сможет либо  на полках разной высоты, либо в  расположенном внизу домике. Также комплекс оснащен подвесной игрушкой, которая привлечет вашего питомца. Общий размер: 45 х 47 х 75 см. Размер домика: 45 х 36 х 32 см. Высота полок (от пола): 75 см, 45 см. Размер полок: 26 х 26 см.','','','',''),(225,1,'Домик-когтеточка Меридиан &quot;Высотка&quot;, 4-ярусный, цвет: светло-серый, 51 х 51 х 123 см','Домик-когтеточка Меридиан &quot;Высотка&quot; выполнен из высококачественного ДВП и ДСП и обтянут искусственным мехом. Изделие предназначено для кошек. Комплекс имеет 4 яруса. Ваш домашний питомец будет с удовольствием точить когти о специальные столбики, изготовленные из джута. А отдохнуть он сможет либо на полках, либо в расположенном внизу домике. Домик-когтеточка Меридиан &quot;Высотка&quot; принесет пользу не только вашему питомцу, но и вам, так как он сохранит мебель от когтей и шерсти.Общий размер: 51 х 51 х 123 см.Размер домика: 51 х 51 х 32 см.Размеры полок: 42 х 25 см, 42 х 25 см, 25 х 25 см.','','','',''),(226,1,'Колтунорез для животных &quot;Hello Pet&quot;, вертикальный, с грязесборщиками. 238012','Колтунорез &quot;Hello Pet&quot; предназначен для щадящего удаления   колтунов у кошек и собак мелких пород. Изделие идеально   подходит для длинной и грубой шерсти. Лезвия изготовлены из   долговечной нержавеющей стали специально. Для работы для   правой или левой рукой, предусмотрена перестановка лезвий.  Эргономичная ручка выполнена из пластика и для удобного   хвата оснащена прорезиненными вставки.    Линька под контролем! Статья OZON Гид','','','',''),(227,1,'Тримминг для животных &quot;V.I.Pet&quot;, цвет: зеленый. 1026','Тримминговочный нож - используется для ускорения процесса выщипывания остевого волоса у жесткошерстных пород собак. Редкий тримминг используется для обработки туловища собаки.  Материал: сталь, пластик.    Линька под контролем! Статья OZON Гид','','','',''),(228,1,'Когтерез-секатор &quot;Dezzie&quot; для собак, длина 12,5 см','Когтерез-гильотина &quot;Dezzie&quot; позволяет быстро и безболезненно срезать лишнюю длину когтей у собак.Размер когтереза: 12,5 х 4 х 1,5 см.      Линька под контролем! Статья OZON Гид','','','',''),(229,1,'Рукавица массажная &quot;Trixie&quot;','- для ухода за шерстью в процессе поглаживания,  - стимулирует кровообращение,  - очищает шерсть от мёртвых волос и грязи','','','',''),(230,1,'Удалитель клещей &quot;Rolf Club 3D&quot;, 2 шт','Удалитель клещей &quot;Rolf Club&quot; - это простой и безопасный   способ для удаления паразитарных клещей разных размеров  с   тела животного или человека. Удалитель имеет удобную   нескользящую ручку, легко крепиться на связку ключей. Это   незаменимый помощник при прогулках в лесу или других   местах возможного заражения клещами.  В комплект входят два удалителя разных размеров. Длина малого удалителя: 4,9 см. Длина большого удалителя: 7 см.    Уважаемые клиенты!  Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.      Линька под контролем! Статья OZON Гид','','','',''),(231,1,'Колтунорез боковой &quot;Hello Pet&quot; для животных, с загнутыми лезвиями, 8 лезвий. 2308208N','Колтунорез &quot;Hello Pet&quot; с загнутыми лезвиями предназначен для удаления колтунов у кошек и собак мелких пород. Лезвия изготовлены из высококачественной нержавеющей стали, которая обеспечивает долгий срок службы изделия. Они имеют специально заточенные зазубренные края, которые позволяют легко удалить колтуны и минимизируют срезание шерсти. Эргономичная ручка выполнена из пластика и оснащена упором для большого пальца.   Длина колтунореза: 17 см.  Длина лезвий: 3 см.  Количество лезвий: 8.      Линька под контролем! Статья OZON Гид','','','',''),(232,1,'Ножницы для стрижки животных &quot;Hello Pet&quot;, длина 19,5 см','Ножницы &quot;Hello Pet&quot; изготовлены из высококачественной   нержавеющей стали, которая обеспечивает долгий срок службы   изделия. Изделие предназначено для стрижки любых   домашних животных. Удобные прорезиненные ручки со   смещенными кольцами не позволят выскользнуть ножницам   из ваших рук.   Длина ножниц: 19,5 см. Длина режущей части: 8,5 см.      Линька под контролем! Статья OZON Гид','','','',''),(233,1,'Щетка для животных Hello Pet, двухсторонняя. 3321S','Двухсторонняя щетка для животных &quot;Hello Pet&quot; предназначена   для ухода за шерстью кошек и собак. Одна сторона щетки   металлическая, а другая сторона - с натуральной щетиной.   Ручка выполнена из пластика и снабжена прорезиненными   вставками. Специальное отверстие на ручке позволяет   подвесить щетку на крючок. Такая щетка поможет удалить   старую спутанную шерсть и стимулировать рост новой.    Линька под контролем! Статья OZON Гид','','','',''),(234,1,'Когтерез-ножницы &quot;Dezzie&quot; для собак, длина 14 см','Когтерез-ножницы &quot;Dezzie&quot; предназначены для коррекции стрижки собак и для удаления лишних волосков между подушечками пальцев.  Размер когтереза: 14 х 6,5 х 1 см.    Линька под контролем! Статья OZON Гид','','','',''),(235,1,'Расческа &quot;Trixie&quot; для короткой шерсти, двусторонняя, длина 14,5 см','- пластик,  - для вычёсывания блох и вшей    Линька под контролем! Статья OZON Гид','','','',''),(236,1,'Набор насадок &quot;Ziver&quot; для машинки для стрижки животных, 4 шт','Набор &quot;Ziver&quot; состоит из четырех универсальных насадок, предназначенных для машинки для стрижки животных. Насадки выполнены из высококачественного пластика. С помощью такого набора насадок вы сможете сделать вашему питомцу стрижку разной длины.  Насадки совместимы с ножами большинства немецких и американских производителей.    Высота среза: 12 мм, 9 мм, 6 мм, 3 мм.  Размер основания для ножа:  4,5 см х 3,7 см.  Количество насадок: 4 шт.      Линька под контролем! Статья OZON Гид','','','',''),(237,1,'Пуходерка для животных &quot;Hello Pet&quot;. 168222XL','Пуходерка &quot;Hello Pet&quot;, выполненная из нержавеющей стали, предназначена для   ухода за шерстью кошек и собак. Пуходерка имеет частую металлическую щетину,   что помогает удалять старую шерсть и стимулировать рост новой. Пуходерка   служит для полного разъединения всех шерстинок. Она вычесывает отмершие   волосы, вытягивая шерсть на полную длину. Удобная прорезиненная   ручка не позволит выскользнуть пуходерке из рук даже во влажных условиях   использования.   Длина пуходерки: 17,5 см.  Размер рабочей поверхности: 11 см х 7 см.            Линька под контролем! Статья OZON Гид','','','',''),(238,1,'Пуходерка для животных &quot;Hello Pet&quot;. 3335L','Боковая пуходерка &quot;Hello Pet&quot;, выполненная из нержавеющей   стали и пластика, предназначена для повседневного ухода   за шерстью кошек и собак. Изделие избавляет от спутавшейся   шерсти, удаляет выпавшую шерсть, стимулирует волосяные   луковицы. Зубья посажены на воздушную подложку, что   помогает амортизировать усилия, приложенные к пуходерке,   благодаря чему не травмируется кожа.  Подходит для всех видов шерсти.      Линька под контролем! Статья OZON Гид','','','',''),(239,1,'Машинка для стрижки Wahl &quot;KM 10&quot;','Машинка Wahl &quot;KM 10&quot; - это профессиональная сетевая машинка для стрижки. Эргономичный корпус изделия выполнен из прочного пластика. Специальная накладка на корпусе и отличная балансировка по весу гарантируют удобный хват.Профессиональный ножевой блок изготовлен из нержавеющей стали с высокоточной полировкой и высотой среза 1,8 мм. Фиксирующая кнопка делает процесс замены и обслуживания ножевого блока удобным и простым.Машинка очень мощная, но при этом она удивительно легкая и тихая. Гибкий кабель длиной 4,2 метра дает полную свободу движения.Машинка создана для достижения безупречных результатов при стрижке. Машинка имеет долговечный двигатель с рекордным количеством часов работы: более 10000 часов. Имеет два рабочих режима. Можно использовать как для стрижки волос (голова, усы, борода, брови), так и для стрижки шерсти животных.В комплекте поставляется: машинка для стрижки, ножевой блок 1,8 мм, масло для смазки, щеточка для чистки, инструкция на русском языке.Размер машинки: 19 х 5,5 х 4,5 см. Ширина ножевого блока: 49 мм. Высота среза: 1,8 мм. Длина кабеля: 4,2 м.  Линька под контролем! Статья OZON Гид','','','',''),(240,1,'Щетка-пуходерка для кошек &quot;Dezzie&quot;, 159 х 69 х 40 мм','Кошки обожают, когда их гладят и расчесывают. Щетка-пуходерка для кошек &quot;Dezzie&quot; незаменима для расчесывания шерсти и подшерстка кошки. Жесткость резиновой мембраны подобрана с учетом чувствительности кожи животного. Эргономичная ручка удобна в использовании. Размер щетки-пуходерки: 15,9 х 6,9 х 4 см.  Линька под контролем! Статья OZON Гид','','','',''),(241,1,'Вольер для животныx Midwest &quot;Life Stages&quot;, 8 панелей, цвет: черный, 61 x 61 см','Вольер для животных 8-ми панельный с дверью для использования в помещении и на улице.Запатентованная дверная система MAXLock повышает безопасность, предоставляя множество точек блокировки по периметру двери. Эргономичная ручка-замок позволяет легко и удобно управлять дверью одним движением, без сгибания коленей.Прочное покрытие вольера Electro-Coat обеспечивает долговечную защиту.Вольер легко складывается для удобного хранения и транспортировки, легко собирается, не требуется никаких инструментов или дополнительных деталей. В комплект включены угловые усилители, которые добавляют вес и поддерживают конфигурацию ограждения, они так же могут быть использованы для защиты напольного покрытия, и крепежи, которыми оснащена функциональная безопасная каркасная дверца.Ограниченная площадь:1,5 кв. метра.Возможные конфигурации вольера: квадрат, прямоугольник, восьмиугольник.Вес конструкции: 7,8 кг.Размер одной панели: 61 х 61 см.','','','',''),(242,1,'Клетка для птиц &quot;ЗооМарк&quot;, цвет: красный поддон, зеленая решетка, 39 х 28 х 42 см','Клетка &quot;ЗооМарк&quot;, выполненная из полипропилена и металла с эмалированным покрытием, предназначена для мелких птиц. Изделие состоит из большого поддона и решетки. Клетка снабжена металлической дверцей. В основании клетки находится малый поддон. Клетка удобна в использовании и легко чистится. Она оснащена кольцом для птицы, поилкой, кормушкой и подвижной ручкой для удобной переноски. Комплектация: - клетка с поддоном; - малый поддон; - поилка; - кормушка;- кольцо.Размер клетки: 39 см х 28 см х 42 см.','','','',''),(243,1,'Клетка-палатка для животных &quot;Заря-Плюс&quot;, выставочная, цвет: бежевый, 101 х 58 х 54 см. КВП2','Большая полукруглая выставочная клетка &quot;Заря-Плюс&quot; станет настоящей находкой для владельцев нескольких кошек и котят.  В этой палатке найдется место всем вашим питомцам.  Эта выставочная палатка продумана таким образом, чтобы вам было максимально удобно участвовать в выставках: - собирается круговым движением, как трансформер, легко и просто;  на выставке вы самостоятельно соберете и разберете палатку за считанные минуты; - лицевая сторона палатки выполнена из пленки, которая может полностью отстегиваться; - обратная сторона палатки выполнена наполовину из сетки, наполовину из пленки; также может полностью отстегиваться; - боковые стенки выполнены наполовину из пленки, благодаря чему палатка становится очень светлой.  И вы сможете в максимально выгодном свете представить на выставке своих питомцев: - в комплект входит дополнительная шторка на липучке; при необходимости вы можете закрыть шторкой окно, чтобы ваши питомцы могли  отдохнуть;  - если у вас возникнет необходимость разделить пространство палатки на 2 части, вы можете просто и легко сделать это, застегнув на молнию  разделительную перегородку посередине;  - с двух сторон палатки имеются вместительные карманы, куда вы можете положить все необходимые мелочи для участия в выставке; - в собранном виде палатка довольно компактна; при хранении занимает мало места; - палатка переносится в чехле, который входит в комплект; - для удобной переноски чехол имеет короткую и длинную ручки, также чехол имеет большой карман на молнии для различных мелочей;  - в комплект входит 2 меховых матраца и меховой гамак.','','','',''),(244,1,'Клетка для грызунов Savic &quot;Zeno&quot;, 80 х 50 х 70 см','Клетка идеальна для хомяков, крыс, шиншилл, других мелких и средних грызунов. Расстояние между прутьями 1 см. В комплекте угловая полка-этаж, лестница, гамак, кормушка из нержавеющей стали, поилка.','','','',''),(245,1,'Клетка для грызунов &quot;Велес&quot;, с полками, цвет: серый, 40 х 58 х 45 см','Клетка для грызунов &quot;Велес&quot;, с полками, цвет: серый, 40 х 58 х 45 см','','','',''),(246,1,'Вольер для животныx Midwest &quot;Life Stages&quot;, 8 панелей, цвет: черный, 61 x 61 см','Вольер для животных 8-ми панельный с дверью для использования в помещении и на улице.Запатентованная дверная система MAXLock повышает безопасность, предоставляя множество точек блокировки по периметру двери. Эргономичная ручка-замок позволяет легко и удобно управлять дверью одним движением, без сгибания коленей.Прочное покрытие вольера Electro-Coat обеспечивает долговечную защиту.Вольер легко складывается для удобного хранения и транспортировки, легко собирается, не требуется никаких инструментов или дополнительных деталей. В комплект включены угловые усилители, которые добавляют вес и поддерживают конфигурацию ограждения, они так же могут быть использованы для защиты напольного покрытия, и крепежи, которыми оснащена функциональная безопасная каркасная дверца.Ограниченная площадь: 1,5 кв. метра.Возможные конфигурации вольера: квадрат, прямоугольник, восьмиугольник.Вес конструкции: 7,8 кг.Размер одной панели: 61 х 61 см.','','','',''),(247,1,'Клетка для грызунов ЗооМарк &quot;Гризли&quot;, 4-этажная, цвет: синий поддон, синяя решетка, желтые этажи, 41 х 30 х 50 см. 240ж','Клетка ЗооМарк &quot;Гризли&quot;, выполненная из полипропилена и металла, подходит для мелких грызунов. Изделие четырехэтажное. Клетка имеет яркий поддон, удобна в использовании и легко чистится. Сверху имеется ручка для переноски. Такая клетка станет уединенным личным пространством и уютным домиком для грызуна.','','','',''),(248,1,'Клетка для грызунов Rody &quot;Mini&quot;, цвет: вишневый, 33 х 21 х 18 см','Прозрачные стенки клетки для грызунов Rody &quot;Mini&quot;, позволяют наблюдать за животным и  способствуют тому, чтобы клетка могла удачно вписаться в интерьер любого типа.  Клетка Rody &quot;Mini&quot; обладает дополнительными возможностями: подстройка дополнительных  этажей, присоединение дополнительных тоннелей. Клетки можно соединить вместе, построив  целый мини-городок. Размер: 33 х 21 х 18 см.','','','',''),(249,1,'Купалка для шиншилл Savic &quot;Wellness Bath&quot;, 26 х 23 х 15 см','Шиншиллам жизненно необходимо купаться в мелкозернистом песке, только так их шерсть очищается от грязи и жира. Для этого идеально подойдет оригинальная и простая купалка &quot;Wellness Bath&quot;, при этом закруглённые края купалки обеспечат минимум потерь песка от разбрасывания и чистоту вокруг.Такую купалку можно поставить в клетку на постоянной основе!  Купалка очень большая, просторная и устойчивая. Легко моется.  Есть отверстие для прикрепления к прутьям клетки.','','','',''),(250,1,'Клетка для грызунов Велес &quot;Lusy Hamster-3к&quot;, 3-этажная, цвет: зеленый, 35 х 26 х 40 см','Клетка Велес &quot;Lusy Hamster-3к&quot;, выполненная из полипропилена и металла, подходит для мелких  грызунов. Изделие трехэтажное, оборудовано лестницей. Клетка имеет яркий поддон, удобна в  использовании и легко чистится. Сверху имеется ручка для переноски.  Внутреннее  пространство клетки дополнено домиком, беговым колесом, а также небольшой чашкой для  зерна и различных лакомств.  Такая клетка станет уединенным личным пространством и  уютным домиком для маленького грызуна.','','','',''),(251,1,'Вольер для животныx Midwest &quot;Life Stages&quot;, 8 панелей, цвет: черный, 61 x 76 см','Вольер для животных 8-ми панельный с дверью для использования в помещении и на улице.Запатентованная дверная система MAXLock повышает безопасность, предоставляя множество точек блокировки по периметру двери. Эргономичная ручка-замок позволяет легко и удобно управлять дверью одним движением, без сгибания коленей.Прочное покрытие вольера Electro-Coat обеспечивает долговечную защиту.Вольер легко складывается для удобного хранения и транспортировки, легко собирается, не требуется никаких инструментов или дополнительных деталей. В комплект включены угловые усилители, которые добавляют вес и поддерживают конфигурацию ограждения, они так же могут быть использованы для защиты напольного покрытия, и крепежи, которыми оснащена функциональная безопасная каркасная дверца.Ограниченная площадь:1,5 кв. метра.Возможные конфигурации вольера: квадрат, прямоугольник, восьмиугольник.Вес конструкции: 9,3 кг.Размер одной панели: 61 х 76 см.','','','',''),(252,1,'Клетка для морской свинки &quot;ЗооМарк&quot;, цвет: желтый поддон, красная решетка, 41 х 30 х 25 см','Клетка &quot;ЗооМарк&quot;, выполненная из полипропилена и металла, подходит для морских свинок и других грызунов. Клетка имеет яркий поддон, удобна в использовании и легко чистится. Сверху имеется ручка для переноски. Такая клетка станет личным пространством и уютным домиком для вашего питомца.','','','',''),(253,1,'Клетка для грызунов Rody &quot;Mini&quot;, цвет: лиловый, прозрачный, 30 х 20 х 18 см','Небольшая клетка Rody &quot;Mini&quot;, выполненная из пластика и металла, предназначена для мелких  грызунов. Прозрачные стены и внутренние элементы клетки позволяют наблюдать за животными.  Клетка легко собирается и разбирается. Изделие оснащено удобной ручкой для переноски.  Сверху расположена крышка. Сверху и по бокам предусмотрены отверстия, обеспечивающие  естественную вентиляцию. Отлично подходит для хомяков, мышей и песчанок. В комплект  входит бутылочка-поильник 75 мл, 1 колесо, 1 кормушка, 2 плоских пробки.','','','',''),(254,1,'Перегородка защитная для животных AvtoPoryadok &quot;Сетка&quot;, между передними и задними сиденьями, цвет: черный, 115 х 62 см','Сетка перегородка изготовлена из прочного материала: полипропилена. Ограничивает передвижение животного по салону вашего автомобиля. Ваше животное не мешает вождению автомобиля. Не мешает обзору водителя. Быстрая и простая установка и снятие сетки. Универсальный размер: 115 на 62 см. Комплект крепежей в комплекте. Производство: Россия.','','','',''),(255,1,'Клетка для птиц Велес &quot;Lusy Fly&quot;, разборная, цвет: синий, 30 х 42 х 63 см','Красивые и качественные клетки производства &quot;Велес&quot; создадут уют вашему питомцу, а вам уверенность в том, что во время вашего отсутствия ваш любимец будет на месте. Пользоваться разборной клеткой будет очень удобно.','','','',''),(256,1,'Лежак &quot;Dogmoda&quot;, цвет: бежевый. Размер 3','Мягкий и удобный лежак &quot;Dogmoda&quot; обязательно понравится вашему любимцу. Спать на таком лежаке ему будет тепло и уютно. Лежак выполнен из мягкого, приятного на ощупь материала, внутри - специальная подстилка, выполненная в одной цветовой гамме с лежаком. Кроме того, подстилку можно вынуть и использовать отдельно. Характеристики: Материал: хлопок, полиэстер. Размер лежака: 60 см х 16 см х 42 см. Размер подстилки: 56,5 см х 5 см х 42 см. Цвет: бежевый. Производитель: Россия. Артикул: DM-090550-3.','','','',''),(257,1,'Лежак для животных Pride &quot;Милитари-2&quot;, 90 х 80 х 25 см','Лежак Pride &quot;Милитари-2&quot;прекрасно подойдет для отдыха вашего домашнего питомца. Предназначен для собак средних и крупных пород. Изделие изготовлено из прочных материалов высшего качества в стиле &quot;Милитари&quot;. Лежак снабжен съемной и мягкой подушкой. Комфортный и уютный лежак обязательно понравится вашему питомцу, животное сможет там отдохнуть и выспаться. Размер лежака: 90 х 80 х 25 см.Состав: хлопок, рипстоп.Наполнитель: полиэфирное волокно.','','','',''),(258,1,'Лежак для собак Rogz &quot;Lounge Pod Mat&quot;, 2,5 х 83 х 56 см','Суперкомфортный двусторонний лежак-коврик для собак Rogz &quot;Lounge Pod Mat&quot; выполнен из высокопрочногостирается.Лежак легко сворачивается и не занимает много места.','','','',''),(259,1,'Лежак Gaffy Pet &quot;Stone&quot;, цвет: розовый, 55 х 45 х 23 см','Новая коллекция из серии КАМНИ Stones из прочных профессиональных тканей. АНТИКОГОТЬ.','','','',''),(260,1,'Лежак для собак Rogz &quot;Lounge Pod Flat&quot;, со съемным чехлом, цвет: бежевый, 107 x 72 x 10 см','Лежак для собак Rogz &quot;Lounge Pod Flat&quot; из качественного высокопрочного полипропилена не проваливается и не сминается под животным. Даже самая беспокойная собака не сможет скомкать и загнать в угол такую лежанку. Высота 10 см достаточна, чтобы уберечь животное от сквозняка и холодного пола. Съемный чехол легко стирается.','','','',''),(262,1,'Аквариумный комплекс Tetra &quot;AquaArt&quot;, цвет: белый, 60 л','Аквариумный комплекс Tetra &quot;AquaArt&quot; сочетает в себе совершенный дизайн, высококачественную технику и простоту в обслуживании.  Прочное 5мм флоат-стекло, свободное от искажений и с обработанными краями.   Стабильная крышка с люминисцентной Т5 лампой продолжительного использования 13Вт для превосходного освещения и яркости.   Большое удобное отверстие облегчает процесс кормления и предусматривает легкий доступ к оборудованию.   Инновационный фильтр Tetra EasyCrystal FilterBox c двумя запасными фильтровочными губками для кристально прозрачной, здоровой воды.    Удобные держатели на рамке аквариума позволяют легко закрепить фильтр.   Фильтр очень легко чистить; нужно лишь заменять картридж каждые 4 недели. Нет необходимости промывать фильтрующую губку, а значит, ваши руки останутся сухими!   Высококачественный дизайн аквариума в модном цветовом решении, современное оборудование.   Высокоточный терморегулятор Tetra HT 50.   TetraMin- основной корм всех видов тропических рыб (100 мл) - здоровье, богатство красок и жизненная сила для ваших рыбок.   Tetra AquaSafe (100 мл) - делает агрессивную водопроводную воду безопасной и пригодной для рыб.   Tetra EasyBalance (100 мл) - снижает частоту замен аквариумной воды.   Брошюра с полезными советами по обустройству аквариума.   Протестирован TUV/GS, сертифицирован по CE и DIN 32622.   Гарантия 3 года на места склеивания и верхнюю часть аквариума. Объем: 60 л.  Размер аквариума: 61 см х 33,5 см х 42,7 см.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(263,1,'Аквариумный набор AquaLighter &quot;Wabi Set&quot;','Wabi Set - готовое решение для домашнего флорариума. Идеальный выбор для стиля Wabi Kusa и других композиций из растений. Способен стать украшением любого интерьера. В состав набора входит декоративный аквариум, уникальный гибкий светильник Pico Soft черный (без блока питания).','','','',''),(264,1,'Аквариум Sea Star &quot;HX-320F&quot;, цвет: зеленый, прозрачный, 22 л','Аквариум Sea Star &quot;HX-320F&quot; станет отличным украшением   дома или офиса. Элегантная емкость укомплектована   необходимым оборудованием (энергопотребление - 3 Вт),   которое позволяет максимально быстро подготовить   экосистему и заселить ее рыбками. Выгнутая передняя стенка выполнена из полированного   акрила - материала, который не уступает по прочности стеклу   и отличается исключительной прозрачностью. Он не   царапается и дает возможность наблюдать за обитателями   аквариума из любого угла комнаты. Изделие имеет пластиковую крышку с отверстием для   кормления и откидной панелью для быстрого доступа к   оборудованию.  В комплект входят: LED-светильник, количество и мощность   диодов которого идеально соответствуют емкости аквариума,   обеспечивая правильное развитие растений и рыбок;  встроенный в крышку переливной фильтр с бесшумной   помпой и губчатым наполнителем для биологической   очистки.   Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(265,1,'Аквариум Sea Star &quot;HX-380F&quot;, цвет: сиреневый, прозрачный, 40 л','Аквариум Sea Star &quot;HX-380F&quot; станет отличным украшением   дома или офиса. Элегантная емкость укомплектована   необходимым оборудованием (энергопотребление - 3 Вт),   которое позволяет максимально быстро подготовить   экосистему и заселить ее рыбками. Выгнутая передняя стенка выполнена из полированного   акрила - материала, который не уступает по прочности стеклу   и отличается исключительной прозрачностью. Он не   царапается и дает возможность наблюдать за обитателями   аквариума из любого угла комнаты. Изделие имеет пластиковую крышку с отверстием для   кормления и откидной панелью для быстрого доступа к   оборудованию.  В комплект входят: LED-светильник, количество и мощность   диодов которого идеально соответствуют емкости аквариума,   обеспечивая правильное развитие растений и рыбок;  встроенный в крышку переливной фильтр с бесшумной   помпой и губчатым наполнителем для биологической   очистки.       Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(268,1,'Аквариумный комплекс Tetra &quot;Cascade Globe&quot;, цвет: белый, 6,8 л','Аквариумный комплекс Tetra &quot;Cascade Globe&quot; представляет собой стеклянную емкость с фильтром, прост в установке и уходе.   Функция водопада создаст расслабляющую атмосферу.    Легкость ухода: необходимо лишь заменять картридж фильтра Tetra каждые 4 недели.    8 светодиодных лампочек в крышке обеспечивают яркое освещение.    Питание фильтра и светодиодной подсветки обеспечивается с помощью одного сетевого кабеля низкого напряжения.    Управление светодиодным освещением осуществляется с помощью кнопки включения/выключения.  Объем: 6,8 л.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(269,1,'Аквариум Sea Star &quot;LS-240&quot;, цвет: черный, 8 л. LS-240F','Светодиодная подсветка и встроенный фильтр.  Размер аквариума: 24 х 18 х 27 см.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(270,1,'Аквариум Sea Star &quot;HX-320F&quot;, цвет: белый, прозрачный, 22 л','Аквариум Sea Star &quot;HX-320F&quot; станет отличным украшением   дома или офиса. Элегантная емкость укомплектована   необходимым оборудованием (энергопотребление - 3 Вт),   которое позволяет максимально быстро подготовить   экосистему и заселить ее рыбками. Выгнутая передняя стенка выполнена из полированного   акрила - материала, который не уступает по прочности стеклу   и отличается исключительной прозрачностью. Он не   царапается и дает возможность наблюдать за обитателями   аквариума из любого угла комнаты. Изделие имеет пластиковую крышку с отверстием для   кормления и откидной панелью для быстрого доступа к   оборудованию.  В комплект входят: LED-светильник, количество и мощность   диодов которого идеально соответствуют емкости аквариума,   обеспечивая правильное развитие растений и рыбок;  встроенный в крышку переливной фильтр с бесшумной   помпой и губчатым наполнителем для биологической   очистки.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(271,1,'Аквариум Sea Star &quot;HX-380F&quot;, цвет: зеленый, прозрачный, 40 л','Аквариум Sea Star &quot;HX-380F&quot; станет отличным украшением   дома или офиса. Элегантная емкость укомплектована   необходимым оборудованием (энергопотребление - 3 Вт),   которое позволяет максимально быстро подготовить   экосистему и заселить ее рыбками. Выгнутая передняя стенка выполнена из полированного   акрила - материала, который не уступает по прочности стеклу   и отличается исключительной прозрачностью. Он не   царапается и дает возможность наблюдать за обитателями   аквариума из любого угла комнаты. Изделие имеет пластиковую крышку с отверстием для   кормления и откидной панелью для быстрого доступа к   оборудованию.  В комплект входят: LED-светильник, количество и мощность   диодов которого идеально соответствуют емкости аквариума,   обеспечивая правильное развитие растений и рыбок;  встроенный в крышку переливной фильтр с бесшумной   помпой и губчатым наполнителем для биологической   очистки.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(274,1,'Аквариумный комплекс Tetra &quot;Cascade Globe&quot;, цвет: черный, 6,8 л','Аквариумный комплекс Tetra &quot;Cascade Globe&quot; представляет собой стеклянную емкость с фильтром, прост в установке и уходе.   Функция водопада создаст расслабляющую атмосферу.    Легкость ухода: необходимо лишь заменять картридж фильтра Tetra каждые 4 недели.    8 светодиодных лампочек в крышке обеспечивают яркое освещение.    Питание фильтра и светодиодной подсветки обеспечивается с помощью одного сетевого кабеля низкого напряжения.    Управление светодиодным освещением осуществляется с помощью кнопки включения/выключения.  Объем: 6,8 л.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(275,1,'Аквариум Sea Star &quot;LS-240&quot;, цвет: белый, 8 л. LS-240F','Светодиодная подсветка и встроенный фильтр.  Размер аквариума: 24 х 18 х 27 см.     Как выбрать аквариум и как за ним ухаживать – статья на OZON Гид.','','','',''),(276,1,'Домик для кошек &quot;Меридиан&quot;, 2-ярусный, цвет: черный, белый, 54 х 54 х 47 см','','','','',''),(277,1,'Деревянная будка для собак &quot;Triol&quot;, 81 см х 65 см х 76 см','Деревянная будка для собак &quot;Triol&quot;, несомненно, понравится вашему питомцу. Будка защитит от ветра в плохую погоду, и станет отличным укрытием от солнца в жару.   Особенности будки:  - погодоустойчивая, - наличие ножек исключает попадание влаги внутрь, - хорошая вентиляция воздуха, - легкая сборка.  Размер будки: 81 см х 65 см х 76 см.','','','',''),(278,1,'Лежак для животных Pride &quot;Престиж&quot;, цвет: зеленый, 90 х 80 х 25 см','Уютный лежак для животных Pride &quot;Престиж&quot; обязательно понравится вашему питомцу. В нем питомец будет счастлив, так как лежак очень мягкий и приятный. Он будет проводить все свое свободное время в нем, отдыхать, наслаждаясь удобством. Лежак выполнен из мягкой качественной ткани, также имеется подушка, которая легко вынимается и ее можно использовать отдельно.','','','',''),(279,1,'Лежак для собак Rogz &quot;Spice Podz&quot;, цвет: розовый, 29 х 90 х 59 см. PPLCA','Лежак для собак Rogz &quot;Spice Podz&quot; с бортиком и двусторонней подушкой.Особо прочная ткань Ripstop с водоотталкивающим покрытием обладает также грязеотталкивающими свойствами.Дизайн 2 в 1.Съемный чехол на молнии.Высокая надежность и долговечность.  Машинная стирка.','','','',''),(280,1,'Лежак Gaffy Pet &quot;Stone&quot;, цвет: коричневый, 45 х 35 х 22 см','Новая коллекция из серии КАМНИ Stones из прочных профессиональных тканей. АНТИКОГОТЬ.','','','',''),(281,1,'Лежак для собак Rogz &quot;Lounge Pod Flat&quot;, со съемным чехлом, цвет: оливковый, 170 x 72 x 10 см','Суперкомфортный двусторонний матрас Rogz &quot;Lounge Pod Flat&quot;. Изготовлен из высокопрочного материала. Легко стирается. Имеет съемный чехол.','','','',''),(282,1,'Домик для кошек &quot;Меридиан&quot;, 2-ярусный, цвет: лапки, 54 х 54 х 47 см','','','','',''),(283,1,'Матрас ортопедический для собак &quot;Titbit&quot;, с наполнителем из лузги гречихи, 70 см х 100 см','Матрас для собак &quot;Titbit&quot; с наполнителем из лузги гречихи обладает уникальными ортопедическими свойствами. Он перераспределяет нагрузку на мышцы и суставы во время сна. Способствует быстрому восстановлению физической формы животного. Обладает теплоизоляционными качествами - &quot;прохладный летом, теплый зимой&quot;. В таком матрасе никогда не заведутся блохи. Чехол матраса выполнен из нейлона с рисунком в клетку.  Лузга гречихи - природный гипоаллергенный материал, уникальный по своим качествам. Благодаря ее структуре матрас принимает удобную форму для животного и обеспечивает полноценный отдых. Матрас упакован в удобную сумку-переноску.     Рекомендации по уходу:  Матрас не требует специального ухода. Подушку с основой лузги гречихи достаточно раз в месяц несколько часов просушить на открытом воздухе. Внешнюю оболочку матраса удобнее всего чистить влажной щеткой с использованием моющего средства или без него, в зависимости от его загрязнения. Стирать при температуре не выше 30°С. Перед стиркой необходимо извлечь подушку с лузгой гречихи. Не рекомендуется отбеливать и гладить. Характеристики:  Материал: нейлон. Наполнитель: лузга гречихи. Размер матраса: 100 см х 70 см. Артикул: 3084.   УВАЖАЕМЫЕ КЛИЕНТЫ!  Обращаем ваше внимание на возможные изменения в цвете рисунка, связанные с ассортиментом продукции. Поставка осуществляется в зависимости от наличия на складе.','','','',''),(284,1,'Лежак для животных Pride &quot;Престиж&quot;, цвет: терракотовый, 60 х 50 х 18 см','Лежак для животных Pride &quot;Престиж&quot; прекрасно подойдет для отдыха вашего домашнего питомца. Предназначен для собак средних и мелких пород. Изделие выполнено из прочной ткани. Снабжено невысокими широкими бортиками. Комфортный и уютный лежак обязательно понравится вашему питомцу, животное сможет там отдохнуть и выспаться. Размер лежака: 60 х 50 х 18 см.Состав: велюр.Наполнитель: 100% полиэфирное волокно.','','','',''),(285,1,'Лежак для собак Rogz &quot;Spice Podz&quot;, цвет: розовый, 22 х 56 х 35 см. PPSCA','Лежак для собак Rogz &quot;Spice Podz&quot; с бортиком и двусторонней подушкой.Особо прочная ткань Ripstop с водоотталкивающим покрытием обладает также грязеотталкивающими свойствами.Дизайн 2 в 1.Съемный чехол на молнии.Высокая надежность и долговечность.  Машинная стирка.','','','',''),(286,1,'Компрессор для аквариума Eheim &quot;Air Pump 100&quot;','Компрессор для аквариума Eheim &quot;Air Pump 100&quot; служит для насыщения воды в аквариуме кислородом, эксплуатации фильтров или декоративных элементов, работающих от воздуха, или для создания водяного потока. Воздушный поток можно регулировать на каждом выходе насоса, а также на каждом диффузоре. Это позволяет вам настроить свой собственный эффект пузырьков. Виброгасящие резиновые обкладки способствуют бесшумной работе насоса. Воздушный насос остается неподвижным и не &quot;блуждает&quot;. Вы можете повесить его вертикально на стекло аквариума благодаря специальному крючку. Необходимо регулярно менять войлочную прокладку диффузора.Мощность при 50 Гц: 3,50 Вт.Ширина: 89,00 мм.Высота: 152,00 мм.Глубина: 71,00 мм. Напорная сторона шланга: 4,00 мм.Частота: 50 Гц.','','','',''),(287,1,'Компрессор для аквариумов &quot;Tetra AРS 150&quot;, 80-150 л','Компрессор для аквариумов &quot;Tetra AРS 150&quot; - это очень тихий и надежный компрессор для аквариумов 80-150 л.  крайне низкий уровень шума благодаря шумопонижающим камерам;  инновационный дизайн, уплотненные стенки корпуса, снижающие вибрацию резиновые опоры;  высокий уровень качества и надежности;  равномерная подача воздуха за счет мощной и долговечной мембраны;  воздушный кран для регулировки подачи воздуха в комплекте;  высокий уровень удобства в обслуживании;  сертификаты контроля качества TUV/GS, сертификат качества CE. Производительность: 150 л/ч.Потребляемая мощность: 3,1 Вт.Гарантия 3 года.','','','',''),(288,1,'Грунт для аквариума UDeco &quot;Янтарный гравий&quot;, натуральный, 2-5 мм, 2 л','Натуральный грунт UDeco &quot;Янтарный гравий&quot;  предназначен специально для оформления аквариумов,  палюдариумов и террариумов. Изделие готово к  применению.   Грунт &quot;UDeco&quot; порадует начинающих любителей  природы и самых придирчивых дизайнеров, стремящихся  к созданию нового, оригинального. Такая декорация  придутся по вкусу и обитателям аквариумов и  террариумов, которые ещё больше приблизятся к  природной среде обитания. Необходимое количество грунта рассчитывается по  формуле: длина аквариума х ширина аквариума х толщина  слоя грунта.  Предназначен для аквариумов от 25 литров.   Фракция: 2-5 мм.   Объем: 2 л.','','','',''),(289,1,'Компрессор для аквариума Eheim &quot;Air Pump 200&quot;','Компрессор для аквариума Eheim &quot;Air Pump 200&quot; служит для насыщения воды в аквариуме кислородом, эксплуатации фильтров или декоративных элементов, работающих от воздуха, или для создания водяного потока. Воздушный поток можно регулировать на каждом выходе насоса, а также на каждом диффузоре. Это позволяет вам настроить свой собственный эффект пузырьков.   Виброгасящие резиновые обкладки способствуют бесшумной работе насоса. Воздушный насос остается неподвижным и не &quot;блуждает&quot;. Вы можете повесить его вертикально на стекло аквариума благодаря специальному крючку. Необходимо регулярно менять войлочную прокладку диффузора.Производительность насоса в час при 50 Гц: 200,00 л.Насосная головка при 50 Гц (H max): 2,00 м.Мощность при 50 Гц: 3,50 Вт.Ширина: 89,00 мм.Высота: 152,00 мм.Глубина: 71,00 мм. Напорная сторона шланга: 4,00 мм.Частота: 50 Гц.','','','',''),(290,1,'Грот Meijing Aquarium &quot;Пирамида&quot;. YM-782','Аквариумный грот – это отличный элемент дизайна. Оригинальные аквариумные украшения придают подводному ландшафту завершенный вид, что крайне важно, ведь одной из главнейших функций аквариума в интерьере является функция эстетическая. Но декорация-грот – это еще и прекрасное укрытие для рыбок и иных обитателей подводного мира. Особенно – в том случае, если кто-либо из ваших питомцев проявляет излишнюю агрессивность по отношению к соседям. В таком случае грот для аквариума окажется совершенно незаменимым. Грот Meijing Aquarium прекрасно впишется в любой интерьер аквариума. А в сочетании с другими элементами декора сделает среду обитания ваших рыбок максимально приближенной к морской среде. Декорация абсолютно безвредна для рыб и растений. Грот тонет и не требует дополнительной фиксации в аквариуме. Может использоваться как в пресной, так и в морской воде. Изделие не токсично, не тускнеет и не теряет цвета, краска не облазит.','','','',''),(291,1,'Компрессор для аквариумов &quot;Tetra AРS 300&quot;, 120-300 л','Компрессор для аквариумов &quot;Tetra AРS 300&quot; - это очень тихий и надежный компрессор для аквариумов 120-300 л.  крайне низкий уровень шума благодаря шумопонижающим камерам;  инновационный дизайн, уплотненные стенки корпуса, снижающие вибрацию резиновые опоры;  высокий уровень качества и надежности;  равномерная подача воздуха за счет мощной и долговечной мембраны;  воздушный кран для регулировки подачи воздуха в комплекте;  высокий уровень удобства в обслуживании;  сертификаты контроля качества TUV/GS, сертификат качества CE. Производительность (подача вохдуха): 300 л/ч.Потребляемая мощность: 4,5 Вт. Количество насадок для выпуска воздуха: 2. Количество краников для регулирования подачи воздуха: 2. Гарантия 3 года.','','','',''),(292,1,'Грунт для аквариума UDeco &quot;Янтарный гравий&quot;, натуральный, 2-5 мм, 6 л','Натуральный грунт UDeco &quot;Янтарный гравий&quot;  предназначен специально для оформления аквариумов,  палюдариумов и террариумов. Изделие готово к  применению.   Грунт &quot;UDeco&quot; порадует начинающих любителей  природы и самых придирчивых дизайнеров, стремящихся  к созданию нового, оригинального. Такая декорация  придутся по вкусу и обитателям аквариумов и  террариумов, которые ещё больше приблизятся к  природной среде обитания. Необходимое количество грунта рассчитывается по формуле: длина аквариума х ширина аквариума х толщина слоя грунта.  Предназначен для аквариумов от 25 литров.  Фракция: 2-5 мм.   Объем: 6 л.','','','',''),(293,1,'Компрессор для аквариума Eheim &quot;Air Pump 400&quot;','Компрессор для аквариума Eheim &quot;Air Pump 400&quot; служит для насыщения воды в аквариуме кислородом, эксплуатации фильтров или декоративных элементов, работающих от воздуха, или для создания водяного потока. Воздушный поток можно регулировать на каждом выходе насоса, а также на каждом диффузоре. Это позволяет вам настроить свой собственный эффект пузырьков.   Виброгасящие резиновые обкладки способствуют бесшумной работе насоса. Воздушный насос остается неподвижным и не &quot;блуждает&quot;. Вы можете повесить его вертикально на стекло аквариума благодаря специальному крючку. Необходимо регулярно менять войлочную прокладку диффузора.Производительность насоса в час при 50 Гц: 400,00 л.Насосная головка при 50 Гц (H max): 2,00 м.Мощность при 50 Гц: 4,00 Вт.Ширина: 89,00 мм.Высота: 152,00 мм.Глубина: 71,00 мм. Напорная сторона шланга: 4,00 мм.Частота: 50 Гц.','','','',''),(294,1,'Грот Meijing Aquarium &quot;Пристань&quot;. MJA-003','Грот &quot;Meijing Aquarium&quot; - это отличный элемент дизайна. Декор не только украсит ваш аквариум,  но и послужит прекрасным укрытием для рыб. Ведь, как известно, в аквариуме без укрытий рыбки  постоянно испытывают стресс.  Декор Meijing Aquarium выполнен из высококачественного нетоксичного пластика и абсолютно  безвреден для аквариумных обитателей.','','','',''),(295,1,'Компрессор для аквариумов &quot;Tetra AРS 400&quot;, 250-600 л','Компрессор для аквариумов &quot;Tetra AРS 400&quot; - это очень тихий и надежный компрессор для аквариумов 250-600 л.  крайне низкий уровень шума благодаря шумопонижающим камерам;  инновационный дизайн, уплотненные стенки корпуса, снижающие вибрацию резиновые опоры;  высокий уровень качества и надежности;  равномерная подача воздуха за счет мощной и долговечной мембраны;  воздушный кран для регулировки подачи воздуха в комплекте;  высокий уровень удобства в обслуживании;  сертификаты контроля качества TUV/GS, сертификат качества CE. Производительность: 400 л/ч.Потребляемая мощность: 4,5 Вт.Гарантия 3 года.','','','',''),(296,1,'Грунт для аквариума UDeco &quot;Коричневый песок&quot;, натуральный, 0,1-0,6 мм, 6 л','Натуральный грунт UDeco &quot;Коричневый песок&quot;  предназначен специально для оформления аквариумов,  палюдариумов и террариумов. Изделие готово к  применению.   Грунт &quot;UDeco&quot; порадует начинающих любителей  природы и самых придирчивых дизайнеров, стремящихся  к созданию нового, оригинального. Такая декорация  придутся по вкусу и обитателям аквариумов и  террариумов, которые ещё больше приблизятся к  природной среде обитания. Необходимое количество грунта рассчитывается по формуле: длина аквариума х ширина аквариума х толщина слоя грунта.  Предназначен для аквариумов от 25 литров.  Фракция: 0,1-0,6 мм.   Объем: 6 л.','','','',''),(297,1,'Стерилизатор для аквариума Eheim &quot;Reeflex-Uv-800&quot;','Стерилизатор для аквариума Eheim &quot;Reeflex-Uv-800&quot; быстро и эффективно снижает количество микроорганизмов в воде. Устраняет замутнение, вызванное водорослями или бактериями. Находящийся внутри глянцевый алюминиевый слой отражает ультрафиолетовый свет и обеспечивает особо эффективное обеззараживание. Предотвращает потерю производительности благодаря специальной конструкции, сохраняющей движение воды. Также идеально подходит для отсадников, снижает риск инфекционного заражения.Фильтрующие бактерии, обитающие в субстракте, сохраняются до появления плавающих форм. Простой и безопасный в обращении и очистке. Auto-off автоматическое предохранительное отключение при замене ламп.Легко крепится с помощью прилагаемого специального крепления.Для аквариумов: 400 - 800 л. Мощность при 60 Гц мин: 11 ватт. Максимальное давление при 50 Гц: 0,80 бар. Ширина: 106 мм. Высота: 523 мм. Глубина: 149 мм. Напряжение: 230 вольт. Частота: 50 Гц.','','','',''),(298,1,'Грот Meijing Aquarium &quot;Вигвам&quot;. MJA-004','Аквариумный грот – это отличный элемент дизайна. Оригинальные аквариумные украшения придают подводному ландшафту завершенный вид, что крайне важно, ведь одной из главнейших функций аквариума в интерьере является функция эстетическая. Но декорация-грот – это еще и прекрасное укрытие для рыбок и иных обитателей подводного мира. Особенно – в том случае, если кто-либо из ваших питомцев проявляет излишнюю агрессивность по отношению к соседям. В таком случае грот для аквариума окажется совершенно незаменимым. Грот Meijing Aquarium прекрасно впишется в любой интерьер аквариума. А в сочетании с другими элементами декора сделает среду обитания ваших рыбок максимально приближенной к морской среде. Декорация абсолютно безвредна для рыб и растений. Грот тонет и не требует дополнительной фиксации в аквариуме. Может использоваться как в пресной, так и в морской воде. Изделие не токсично, не тускнеет и не теряет цвета, краска не облазит.','','','',''),(299,1,'Фильтр внутренний для аквариумов Tetra &quot;EasyCrystal 600 Filter Box&quot;','Фильтр внутренний для аквариумов Tetra &quot;EasyCrystal 600 Filter Box&quot; - это внутренний аквариумный фильтр с отсеком для нагревателя, для кристально чистой, здоровой воды, благодаря инновационным фильтрующим картриджам, которые можно быстро и легко менять - оставляя руки сухими!  Обеспечивает кристально чистую, здоровую воду, благодаря интенсивной механической, биологической и химической фильтрации;  Механическая фильтрация: двусторонняя фильтрующая губка для надежного удаления мельчайших частичек грязи;  Биологическая фильтрация: система BioGrid и огромная площадь для заселения полезными бактериями;  Химическая фильтрация - специальный активированный уголь борется с загрязнением воды и неприятными запахами;  Компактная конструкция позволяет сэкономить место в аквариуме;  Сертификаты контроля качества TUV/GS. Гарантия 2 года.','','','',''),(300,1,'Грунт для аквариума UDeco &quot;Коричневый песок&quot;, натуральный, 0,6-2,5 мм, 6 л','Натуральный грунт UDeco &quot;Коричневый песок&quot;  предназначен специально для оформления аквариумов,  палюдариумов и террариумов. Изделие готово к  применению.   Грунт &quot;UDeco&quot; порадует начинающих любителей  природы и самых придирчивых дизайнеров, стремящихся  к созданию нового, оригинального. Такая декорация  придутся по вкусу и обитателям аквариумов и  террариумов, которые ещё больше приблизятся к  природной среде обитания. Необходимое количество грунта рассчитывается по формуле: длина аквариума х ширина аквариума х толщина слоя грунта.  Предназначен для аквариумов от 25 литров.  Фракция: 0,6-2,5 мм.   Объем: 6 л.','','','',''),(301,1,'БиоОшейник №1 &quot;Naturelive Premium&quot;, для собак, от блох и клещей, 65 см','Биоошейник обладает отпугивающим действием, защищая животное от блох и эктопаразитов.  Содержит натуральные эфирные экстракты, что обеспечивает длительный репеллентный эффект.  Не является лекарственным средством.','','','',''),(302,1,'Добавка к корму для собак &quot;Гелакан Дарлинг&quot;, 150 г','Добавка к корму для собак Orling &quot;Гелакан Дарлинг&quot; восстанавливает ткани суставов, укрепляет кости, связки и сухожилия. Применяется для предотвращения заболеваний и травм опорно-двигательного аппарата у собак всех пород и возрастов, а также при излишнем весе. Со второй половины жизни собаки желательно непрерывное применение.  Показания:- для профилактики заболеваний опорно-двигательного аппарата;- для восстановления суставных хрящей, костей, связок и сухожилий;- при заболеваниях и травмах сухожилий;- при дисплазии тазобедренных суставов;- после операций и травм для ускорения заживления ран;- для продления активной жизни собаки. Характеристики: Состав (в 1 кг): коллаген СHP 815 г, кальций 25 г, фосфор 21 г, магний 5 г, селен 4 мг, бета-каротин 200 мг, витамин С 5 г, витамин Е 3,8 г. Вес: 150 г. Товар сертифицирован.','','','',''),(303,1,'Витаминный комплекс для кошек и собак VetExpert &quot;VetoSkin&quot;, 90 капсул','Витаминный комплекс VetExpert &quot;VetoSkin&quot; предназначен для кошек и собак, нуждающихся в  нормализации, восстановлении и поддержании функций кожи и шерстного покрова.  Состав (в 1 капсуле): рыбий жира - 145 мг, масло огуречника - 145 мг, цинк - 8 мг, витамин B1 - 0,23  мг, витамин B2 - 0,575 мг, витамин B6 - 0,253 мг, витамин B12 - 5,75 мкг, биотин - 1,15 мг.  Применение и дозировка: внутрь для кошек - 1 капсула, для собак весом менее 15 кг - 1 капсула,  для собак весом более 15 кг - 2 капсулы один раз в день. Принимать минимум 2 месяца. Количество в упаковке: 90 шт.  Товар сертифицирован.','','','',''),(304,1,'Витамины для кошек Polidex &quot;Super Wool&quot;, 200 шт','Polidex &quot;Super Wool&quot; для кошек зарекомендовал себя как препарат, улучшающий состояние шерсти, кожного покрова, когтей. Данная добавка обеспечивает яркую пигментацию шерсти. Используется в комплексном лечении различных заболеваниях кожи. При применении у кошек породы &quot;канадский сфинкс&quot; было отмечено улучшение состояния кожи без усиления роста шерсти.В состав таблетки входит: витамин В1 0,02 мг, витамин В5 0,6 мг, витамин В6 0,4 мг, витамин В12 1 мкг, витамин Вс 0,2 мг, витамин С 3 мг, биотин 0,6 мг, дериват с ТГОС 3 мг, таурин 10 мг, животный белок 100 мг.','','','',''),(305,1,'Витамины Агроветзащита &quot;Радостин&quot; для собак старше 6 лет, 90 таблеток','Витаминно-минеральный комплекс Агроветзащита &quot;Радостин&quot; для собак – это комбинированный  препарат, в котором витамины, макро- и микроэлементы находятся в сбалансированном,  физиологически обоснованном соотношении, обеспечивая таким образом его максимальную  эффективность.  Витамины Агроветзащита &quot;Радостин&quot; предназначены для профилактики и лечения нарушений  обмена веществ, витаминно-минеральной недостаточности, а также развивающихся на их фоне  заболеваний, для укрепления опорно-двигательного аппарата, поддержания подвижности  суставов, стабилизации работы желудочно-кишечного тракта, улучшения состояния кожи и  шерстного покрова, профилактики сахарного диабета. Товар сертифицирован.','','','',''),(306,1,'Витамины Unitabs &quot;JuniorComplex&quot;, для щенков, 100 таблеток','Unitabs &quot;JuniorComplex&quot; – это витаминно-минеральный комплекс для собак всех возрастов и  пород, который содержит коэнзим Q10 и все необходимые витамины, макро- и микроэлементы. Формула витаминно-минерального комплекса Unitabs &quot;JuniorComplex&quot; разработана совместно с  фирмой Veterinary Bio (Германия) и соответствует европейскому стандарту качества. Витамины Unitabs  &quot;JuniorComplex&quot; стимулируют рост и развитие, поддерживают иммунитет,  улучшают аппетит. Добавку вводят в корм собакам или задают перорально с руки, ежедневно из расчета 1 таблетка  на 5 кг массы тела.  Применяют с 3-недельного до 12-18-месячного возраста (в зависимости от породы собак).  Состав: Дрожжи пивные, дигидрофосфат калия, мука из зародышей пшеницы, мясокостная мука,  минеральные вещества, соевый лецитин, витамины, желатин, хлорид натрия, рыбий жир, сухое  обезжиренное молоко, лактоза, аромотизатор &quot;Говядина&quot;, витамин Е, лимонная кислота, сорбат  калия, вода.   Товар сертифицирован.','','','',''),(307,1,'БиоОшейник №1 &quot;Naturelive Premium&quot;, для щенков, от блох и клещей, 35 см','Биоошейник обладает отпугивающим действием, защищая животное от блох и эктопаразитов. Содержит натуральные эфирные экстракты, что обеспечивает длительный репеллентный эффект. Не является лекарственным средством.','','','',''),(308,1,'Добавка к корму для собак &quot;Гелакан Бейби&quot;, 500 г. GLN-4','Добавка к корму для собак Orling &quot;Гелакан Бейби&quot; интенсивно питает костную и другие соединительные ткани. Обеспечивает правильный рост, развитие и функционирование скелета щенков и молодых собак. Защищает опорно-двигательный аппарат щенной и лактирующей суки. Показания:- для профилактики нарушений опорно-двигательного аппарата щенков и молодых собак (особенно крупных пород) в период роста, а также щенных и лактирующих сук;- для правильного роста, развития и формирования скелета щенков и молодых собак;- для предотвращения чрезмерного или недостаточного роста скелетных структур, связанного с неправильной минерализацией;- для предотвращения  деминерализации скелета беременных и кормящих сук.Способ применения:Применяется внутрь. Предварительно обязательно растворить в воде! Давать ежедневно с привычным для собаки кормом. В идеальном случае применение &quot;Гелакан Бейби&quot; следует начать со второй половины беременности суки, продолжать весь период кормления и еще в течение месяца после отъема щенков. Щенкам начать давать после отъема от матери и продолжать до окончания роста костяка. Давать собакам в количестве, указанном на этикетке в соответствии с весом собаки.Состав (на 1 кг): коллаген СНР 245 г, кальций 117 г, фосфор 98 г, магний 24 г, селен 0,4 мг, бета-каротин 0,06 г, витамин С 6 г, витамин Е 0,4 г. Вес: 500 г. Товар сертифицирован.','','','',''),(309,1,'Препарат VetExpert &quot;UrinoVet&quot;, для собак с заболеваниями мочевой системы, 30 таблеток','Препарат VetExpert &quot;UrinoVet&quot; предназначен для собак с заболеваниями мочевой системы, нуждающихся в нормализации, поддержании и восстановлении функций почек. Показания к применению: - для пациентов с острыми и хроническими, а так же рецидивирующими инфекциями мочевой системы, - для пациентов, прошедших курс лечения с диагнозом &quot;мочекаменная болезнь&quot; от уролитиаза/уретролитиаза, не зависимо от типа камней (ураты, струвиты, оксалаты), а также после хирургического удаления мочевых камней,- с профилактической целью для пациентов, прошедших процедуру катетеризации. Состав (в 1 таблетке): клюквы экстракт (Vaccinum macrocarpon) 300 мг, петрушки экстракт (Petroselinum sativum) 50 мг, глюкозамин (Glucosaminum) 50 мг. Количество в упаковке: 30 таблеток.  Применение и дозировка: внутрь 1 таблетка на 10 кг веса. Товар сертифицирован.','','','',''),(310,1,'Воротник защитный &quot;Талисмед&quot;, на липучке, обхват шеи 21-26 см','Защитный воротник &quot;Талисмед&quot; изготовлен из высококачественного нетоксичного пластика, который позволяет сохранять углы обзора для животного. Изделие разработано для ограничения доступа собаки к заживающей ране или послеоперационному шву. Простота в эксплуатации позволяет хозяевам самостоятельно надевать и снимать защитный воротник с собаки. Воротник крепится при помощи липучки.Обхват шеи: 21-26 см.Высота воротника: 8 см.','','','',''),(311,1,'Сера для животных &quot;Агроветзащита&quot;, порошок, 2,5 г','Сера для животных &quot;Агроветзащита&quot; - это кормовая добавка для кошек, собак, декоративных кроликов и грызунов. Назначают для восполнения дефицита серы в кормах с целью нормализации обмена веществ, улучшения состояния кожи и шерсти, в том числе в комплексе с лекарственными препаратами при заболеваниях кожи.  Сера - необходимый компонент белковой молекулы животного, активно участвует в обменных процессах организма, обладает ярко выраженным противочесоточным и бактерицидным действием.  Введение добавки в ежедневный рацион:  - ускоряет рост шерсти (особенно в период линьки),  - способствует блеску, интенсивной пигментации,  - предупреждает ломкость волос и появление перхоти.  Состав: сера молотая 100%. Товар сертифицирован.','','','',''),(312,1,'Витамины Unitabs &quot;SlimComplex&quot;, для собак, 100 таблеток','Unitabs &quot;SlimComplex&quot; – это витаминно-минеральный комплекс для собак всех возрастов и  пород, который содержит коэнзим Q10 и все необходимые витамины, макро- и микроэлементы.  Формула витаминно-минерального комплекса Unitabs &quot;SlimComplex&quot; разработана совместно с  фирмой Veterinary Bio (Германия) и соответствует европейскому стандарту качества. Витамины Unitabs &quot;SlimComplex&quot; снижают избыточный вес, укрепляют иммунную систему,  нормализуют обмен веществ, снижают уровень холестерина. Добавку вводят в корм собакам или задают перорально с руки, ежедневно из расчета 1 таблетка  на 2 кг массы тела. Применяют курсами по 1 месяцу с интервалом несколько недель.  Состав: дрожжи пивные, дигидрофосфат калия, мука из зародышей пшеницы, мясокостная мука,  минеральные вещества, соевый лецитин, витамины, желатин, хлорид натрия, рыбий жир, сухое  обезжиренное молоко, лактоза, ароматизатор &quot;Говядина&quot;, витамин Е, коэнзим Q10, лимонная  кислота, сорбат калия, вода. Товар сертифицирован.','','','',''),(313,1,'БиоОшейник &quot;Уют&quot;, для собак, от блох и клещей, 60 см','Биоошейник обладает отпугивающим действием, защищая животное от блох и эктопаразитов.  Содержит натуральные эфирные экстракты, что обеспечивает длительный репеллентный эффект.  Не является лекарственным средством.','','','',''),(314,1,'Добавка к корму для собак &quot;Хондрокан&quot;, 150 г. GLN-10','Добавка к корму для собак Orling &quot;Хондрокан&quot; подходит для собак всех возрастов и пород. Добавка обеспечивает интенсивное восстановление и комплексную терапию заболеваний опорно-двигательного аппарата. Высокое содержание глюкозамина и хондроитина сульфатов, коллагеновых пептидов CHP и антиоксидантов способствует интенсивному восстановлению и лечению суставов, связок, сухожилий и позвоночника собаки. Показания:- при деструктивных заболеваниях опорно-двигательного аппарата собак, сопровождающихся болевым синдромом и хромотой;- для интенсивного восстановления суставных хрящей, костей, связок, суставных капсул и сухожилий, в том числе после операций;- при травмах суставов, сухожилий и связок;- при дисплазии тазобедренных суставов;- профилактика старения ОДА.Способ применения:Применять внутрь. Предварительно обязательно растворить в воде! Дается ежедневно с привычным для собаки кормом. Минимальный курс применения 2 месяца. Повторять курс 2-3 раза в год. Возможно непрерывное применение (например, при дисплазии и других хронических заболеваниях). Давать собакам в количестве, указанном на этикетке в соответствии с весом собаки. Состав (в 1 кг): Коллаген CHP 730 г, хондроитин сульфат 75 г, глюкозамин сульфат 75 г, кальции 16 г, фосфор 14 г, магний 3 г, селен 2500 мкг, витамин Е 2500 мг, витамин С 3300 мг, бета-каротин 130 мг. Товар сертифицирован.','','','',''),(315,1,'Ошейник для собак Beaphar &quot;Bio Band&quot;, репеллентный, длина 65 см','Ошейник репеллентный Beaphar &quot;Bio Band&quot; - безопасное и эффективное средство  на основе натуральных эфирных масел маргозы и лаванды для отпугивания  эктопаразитов собак: - блох; - клещей; - вшей; - власоедов; - летающих насекомых (комаров, мух, слепней). Свойства ошейника: - не влияет на активность животного и уход за ним;- водостойкий, не теряет своих свойств при намокании;- безопасный для человека и животных;- без ограничений по физиологическому состоянию.Рекомендуется для следующих животных: - щенков с 2-х месячного возраста;- больных или ослабленных животных;- беременных и кормящих;- склонных к аллергии собак.Активные компоненты: - эфирное масло маргозы; - эфирное масло лаванды. Длина ошейника: 65 см. Товар сертифицирован.  Уважаемые клиенты! Обращаем ваше внимание на возможные изменения в дизайне упаковки. Качественные характеристики товара   остаются неизменными. Поставка осуществляется в зависимости от наличия на складе.    Как защитить питомца от внешних паразитов. Статья OZON Гид','','','','');
/*!40000 ALTER TABLE `zoo_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_discount`
--

DROP TABLE IF EXISTS `zoo_product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_discount`
--

LOCK TABLES `zoo_product_discount` WRITE;
/*!40000 ALTER TABLE `zoo_product_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_filter`
--

DROP TABLE IF EXISTS `zoo_product_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_filter`
--

LOCK TABLES `zoo_product_filter` WRITE;
/*!40000 ALTER TABLE `zoo_product_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_image`
--

DROP TABLE IF EXISTS `zoo_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2466 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_image`
--

LOCK TABLES `zoo_product_image` WRITE;
/*!40000 ALTER TABLE `zoo_product_image` DISABLE KEYS */;
INSERT INTO `zoo_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES (2352,51,'catalog/pet/1019195789.jpg',0),(2353,51,'catalog/pet/1019195790.jpg',1),(2354,54,'catalog/pet/1017471422.jpg',0),(2355,54,'catalog/pet/1017471423.jpg',1),(2356,55,'catalog/pet/1002102953.jpg',0),(2357,57,'catalog/pet/1019195851.jpg',0),(2358,57,'catalog/pet/1019195852.jpg',1),(2359,61,'catalog/pet/1019217499.jpg',0),(2360,61,'catalog/pet/1019217500.jpg',1),(2361,63,'catalog/pet/1019195870.jpg',0),(2362,63,'catalog/pet/1019195871.jpg',1),(2363,65,'catalog/pet/1015446088.jpg',0),(2364,65,'catalog/pet/1015446089.jpg',1),(2365,76,'catalog/pet/1005093038.jpg',0),(2366,82,'catalog/pet/1013438385.jpg',0),(2367,87,'catalog/pet/1013438389.jpg',0),(2368,90,'catalog/pet/1005686979.jpg',0),(2369,93,'catalog/pet/1019076405.jpg',0),(2370,93,'catalog/pet/1019076406.jpg',1),(2371,96,'catalog/pet/1018043976.jpg',0),(2372,97,'catalog/pet/1019076475.jpg',0),(2373,97,'catalog/pet/1019076476.jpg',1),(2374,101,'catalog/pet/1019080592.jpg',0),(2375,102,'catalog/pet/1021780261.jpg',0),(2376,105,'catalog/pet/1019080595.jpg',0),(2377,106,'catalog/pet/1021772912.jpg',0),(2378,108,'catalog/pet/1001699750.jpg',0),(2379,111,'catalog/pet/1020795197.jpg',0),(2380,111,'catalog/pet/1020795198.jpg',1),(2381,114,'catalog/pet/1001696432.jpg',0),(2382,119,'catalog/pet/1022151700.jpg',0),(2383,119,'catalog/pet/1022151701.jpg',1),(2384,120,'catalog/pet/1005093629.jpg',0),(2385,120,'catalog/pet/1005192947.jpg',1),(2386,125,'catalog/pet/1014052924.jpg',0),(2387,125,'catalog/pet/1014052925.jpg',1),(2388,131,'catalog/pet/1013971830.JPG',0),(2389,131,'catalog/pet/1018084806.jpg',1),(2390,134,'catalog/pet/1021284081.jpg',0),(2391,134,'catalog/pet/1021284082.jpg',1),(2392,137,'catalog/pet/1022879502.jpg',0),(2393,137,'catalog/pet/1022879503.jpg',1),(2394,139,'catalog/pet/1013343108.jpg',0),(2395,139,'catalog/pet/1013343109.jpg',1),(2396,140,'catalog/pet/1016981210.jpg',0),(2397,140,'catalog/pet/1016981211.jpg',1),(2398,141,'catalog/pet/1020064128.JPG',0),(2399,141,'catalog/pet/1020064129.JPG',1),(2400,143,'catalog/pet/1022864222.jpg',0),(2401,143,'catalog/pet/1022864223.jpg',1),(2402,146,'catalog/pet/1017328055.jpg',0),(2403,146,'catalog/pet/1017328056.jpg',1),(2404,147,'catalog/pet/1020318325.jpg',0),(2405,147,'catalog/pet/1020318326.jpg',1),(2406,149,'catalog/pet/1022900636.jpg',0),(2407,149,'catalog/pet/1022900637.jpg',1),(2408,153,'catalog/pet/1001696459.jpg',0),(2409,159,'catalog/pet/1001696471.jpg',0),(2410,169,'catalog/pet/1014083125.jpg',0),(2411,169,'catalog/pet/1014083126.jpg',1),(2412,170,'catalog/pet/1015859835.jpg',0),(2413,170,'catalog/pet/1015859836.jpg',1),(2414,171,'catalog/pet/1015860820.jpg',0),(2415,171,'catalog/pet/1015860821.jpg',1),(2416,172,'catalog/pet/1021278415.jpg',0),(2417,172,'catalog/pet/1020181074.jpg',1),(2418,175,'catalog/pet/1014083129.jpg',0),(2419,175,'catalog/pet/1014083130.jpg',1),(2420,176,'catalog/pet/1016848533.JPG',0),(2421,177,'catalog/pet/1015860828.jpg',0),(2422,177,'catalog/pet/1015860829.jpg',1),(2423,178,'catalog/pet/1020181066.jpg',0),(2424,180,'catalog/pet/1015982019.jpg',0),(2425,180,'catalog/pet/1021458916.jpg',1),(2426,182,'catalog/pet/1015205222.jpg',0),(2427,188,'catalog/pet/1015205290.jpg',0),(2428,205,'catalog/pet/1020833854.jpg',0),(2429,205,'catalog/pet/1020833855.jpg',1),(2430,213,'catalog/pet/1014878356.jpg',0),(2431,214,'catalog/pet/1015933851.jpg',0),(2432,215,'catalog/pet/1017711236.jpg',0),(2433,218,'catalog/pet/1014878348.jpg',0),(2434,219,'catalog/pet/1015934302.jpg',0),(2435,220,'catalog/pet/1017711405.jpg',0),(2436,224,'catalog/pet/1014886670.jpg',0),(2437,225,'catalog/pet/1015933983.jpg',0),(2438,230,'catalog/pet/1019524554.jpg',0),(2439,231,'catalog/pet/1012640921.jpg',0),(2440,236,'catalog/pet/1005299829.jpg',0),(2441,236,'catalog/pet/1005299831.jpg',1),(2442,253,'catalog/pet/1018149523.jpg',0),(2443,254,'catalog/pet/1021372461.jpg',0),(2444,254,'catalog/pet/1021372462.jpg',1),(2445,256,'catalog/pet/1001911021.jpg',0),(2446,256,'catalog/pet/1001911022.jpg',1),(2447,258,'catalog/pet/1019051777.jpg',0),(2448,258,'catalog/pet/1019051778.jpg',1),(2449,263,'catalog/pet/1017639582.jpg',0),(2450,263,'catalog/pet/1017639583.jpg',1),(2451,265,'catalog/pet/1019780661.jpg',0),(2454,269,'catalog/pet/1019780665.jpg',0),(2455,271,'catalog/pet/1019780659.jpg',0),(2457,274,'catalog/pet/1018898981.jpg',0),(2458,275,'catalog/pet/1019780673.jpg',0),(2459,277,'catalog/pet/1002991946.jpg',0),(2460,283,'catalog/pet/1014653098.jpg',0),(2461,283,'catalog/pet/1014653099.jpg',1),(2462,297,'catalog/pet/1019495587.jpg',0),(2463,297,'catalog/pet/1019495588.jpg',1),(2464,299,'catalog/pet/1010431400.jpg',0),(2465,315,'catalog/pet/1020730518.jpg',0);
/*!40000 ALTER TABLE `zoo_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_option`
--

DROP TABLE IF EXISTS `zoo_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_option`
--

LOCK TABLES `zoo_product_option` WRITE;
/*!40000 ALTER TABLE `zoo_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_option_value`
--

DROP TABLE IF EXISTS `zoo_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_option_value`
--

LOCK TABLES `zoo_product_option_value` WRITE;
/*!40000 ALTER TABLE `zoo_product_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_recurring`
--

DROP TABLE IF EXISTS `zoo_product_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_recurring`
--

LOCK TABLES `zoo_product_recurring` WRITE;
/*!40000 ALTER TABLE `zoo_product_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_related`
--

DROP TABLE IF EXISTS `zoo_product_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_related`
--

LOCK TABLES `zoo_product_related` WRITE;
/*!40000 ALTER TABLE `zoo_product_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_reward`
--

DROP TABLE IF EXISTS `zoo_product_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_reward`
--

LOCK TABLES `zoo_product_reward` WRITE;
/*!40000 ALTER TABLE `zoo_product_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_special`
--

DROP TABLE IF EXISTS `zoo_product_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_special`
--

LOCK TABLES `zoo_product_special` WRITE;
/*!40000 ALTER TABLE `zoo_product_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_to_category`
--

DROP TABLE IF EXISTS `zoo_product_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_to_category`
--

LOCK TABLES `zoo_product_to_category` WRITE;
/*!40000 ALTER TABLE `zoo_product_to_category` DISABLE KEYS */;
INSERT INTO `zoo_product_to_category` (`product_id`, `category_id`) VALUES (50,59),(51,59),(52,59),(53,59),(54,59),(55,59),(56,59),(57,59),(58,59),(59,59),(60,59),(61,59),(62,59),(63,59),(64,60),(65,60),(66,60),(67,60),(68,60),(69,60),(70,60),(71,60),(72,60),(73,60),(74,60),(75,60),(76,60),(77,60),(78,60),(79,61),(80,61),(81,61),(82,61),(83,61),(84,61),(85,61),(86,61),(87,61),(88,61),(89,61),(90,61),(91,62),(92,62),(93,62),(94,62),(95,62),(96,62),(97,62),(98,62),(99,62),(100,62),(101,62),(102,62),(103,62),(104,62),(105,62),(106,63),(107,63),(108,63),(109,63),(110,63),(111,63),(112,63),(113,63),(114,63),(115,63),(116,63),(117,63),(118,63),(119,63),(120,63),(136,65),(137,65),(138,65),(139,65),(140,65),(141,65),(142,65),(143,65),(144,65),(145,65),(146,65),(147,65),(148,65),(149,65),(150,65),(151,66),(152,66),(153,66),(154,66),(155,66),(156,66),(157,66),(158,66),(159,66),(160,66),(161,66),(162,66),(163,66),(164,66),(165,66),(180,68),(181,68),(182,68),(183,68),(184,68),(185,68),(186,68),(187,68),(188,68),(189,68),(190,68),(191,68),(192,68),(193,68),(194,68),(195,69),(196,69),(197,69),(198,69),(199,69),(200,69),(201,69),(202,69),(203,69),(204,69),(205,69),(206,69),(207,69),(208,69),(209,69),(210,70),(211,70),(212,70),(213,70),(214,70),(215,70),(216,70),(217,70),(218,70),(219,70),(220,70),(221,70),(222,70),(223,70),(224,70),(225,71),(226,71),(227,71),(228,71),(229,71),(230,71),(231,71),(232,71),(233,71),(234,71),(235,71),(236,71),(237,71),(238,71),(239,71),(240,72),(241,72),(242,72),(243,72),(244,72),(245,72),(246,72),(247,72),(248,72),(249,72),(250,72),(251,72),(252,72),(253,72),(254,72),(255,73),(256,73),(257,73),(258,73),(259,73),(275,73),(276,73),(277,73),(278,73),(279,73),(280,73),(281,73),(282,73),(283,73),(284,73),(260,74),(262,74),(263,74),(264,74),(265,74),(268,74),(269,74),(270,74),(271,74),(274,74),(285,75),(286,75),(287,75),(288,75),(289,75),(290,75),(291,75),(292,75),(293,75),(294,75),(295,75),(296,75),(297,75),(298,75),(299,75),(300,76),(301,76),(302,76),(303,76),(304,76),(305,76),(306,76),(307,76),(308,76),(309,76),(310,76),(311,76),(312,76),(313,76),(314,76);
/*!40000 ALTER TABLE `zoo_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_to_download`
--

DROP TABLE IF EXISTS `zoo_product_to_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_to_download`
--

LOCK TABLES `zoo_product_to_download` WRITE;
/*!40000 ALTER TABLE `zoo_product_to_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_to_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_to_layout`
--

DROP TABLE IF EXISTS `zoo_product_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_to_layout`
--

LOCK TABLES `zoo_product_to_layout` WRITE;
/*!40000 ALTER TABLE `zoo_product_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_product_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_product_to_store`
--

DROP TABLE IF EXISTS `zoo_product_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_product_to_store`
--

LOCK TABLES `zoo_product_to_store` WRITE;
/*!40000 ALTER TABLE `zoo_product_to_store` DISABLE KEYS */;
INSERT INTO `zoo_product_to_store` (`product_id`, `store_id`) VALUES (50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(63,0),(64,0),(65,0),(66,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(80,0),(81,0),(82,0),(83,0),(84,0),(85,0),(86,0),(87,0),(88,0),(89,0),(90,0),(91,0),(92,0),(93,0),(94,0),(95,0),(96,0),(97,0),(98,0),(99,0),(100,0),(101,0),(102,0),(103,0),(104,0),(105,0),(106,0),(107,0),(108,0),(109,0),(110,0),(111,0),(112,0),(113,0),(114,0),(115,0),(116,0),(117,0),(118,0),(119,0),(120,0),(121,0),(122,0),(123,0),(124,0),(125,0),(126,0),(127,0),(128,0),(129,0),(130,0),(131,0),(132,0),(133,0),(134,0),(135,0),(136,0),(137,0),(138,0),(139,0),(140,0),(141,0),(142,0),(143,0),(144,0),(145,0),(146,0),(147,0),(148,0),(149,0),(150,0),(151,0),(152,0),(153,0),(154,0),(155,0),(156,0),(157,0),(158,0),(159,0),(160,0),(161,0),(162,0),(163,0),(164,0),(165,0),(166,0),(167,0),(168,0),(169,0),(170,0),(171,0),(172,0),(173,0),(174,0),(175,0),(176,0),(177,0),(178,0),(179,0),(180,0),(181,0),(182,0),(183,0),(184,0),(185,0),(186,0),(187,0),(188,0),(189,0),(190,0),(191,0),(192,0),(193,0),(194,0),(195,0),(196,0),(197,0),(198,0),(199,0),(200,0),(201,0),(202,0),(203,0),(204,0),(205,0),(206,0),(207,0),(208,0),(209,0),(210,0),(211,0),(212,0),(213,0),(214,0),(215,0),(216,0),(217,0),(218,0),(219,0),(220,0),(221,0),(222,0),(223,0),(224,0),(225,0),(226,0),(227,0),(228,0),(229,0),(230,0),(231,0),(232,0),(233,0),(234,0),(235,0),(236,0),(237,0),(238,0),(239,0),(240,0),(241,0),(242,0),(243,0),(244,0),(245,0),(246,0),(247,0),(248,0),(249,0),(250,0),(251,0),(252,0),(253,0),(254,0),(255,0),(256,0),(257,0),(258,0),(259,0),(260,0),(262,0),(263,0),(264,0),(265,0),(268,0),(269,0),(270,0),(271,0),(274,0),(275,0),(276,0),(277,0),(278,0),(279,0),(280,0),(281,0),(282,0),(283,0),(284,0),(285,0),(286,0),(287,0),(288,0),(289,0),(290,0),(291,0),(292,0),(293,0),(294,0),(295,0),(296,0),(297,0),(298,0),(299,0),(300,0),(301,0),(302,0),(303,0),(304,0),(305,0),(306,0),(307,0),(308,0),(309,0),(310,0),(311,0),(312,0),(313,0),(314,0),(315,0);
/*!40000 ALTER TABLE `zoo_product_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_recurring`
--

DROP TABLE IF EXISTS `zoo_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_recurring`
--

LOCK TABLES `zoo_recurring` WRITE;
/*!40000 ALTER TABLE `zoo_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_recurring_description`
--

DROP TABLE IF EXISTS `zoo_recurring_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_recurring_description`
--

LOCK TABLES `zoo_recurring_description` WRITE;
/*!40000 ALTER TABLE `zoo_recurring_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_recurring_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_return`
--

DROP TABLE IF EXISTS `zoo_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_return`
--

LOCK TABLES `zoo_return` WRITE;
/*!40000 ALTER TABLE `zoo_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_return_action`
--

DROP TABLE IF EXISTS `zoo_return_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_return_action`
--

LOCK TABLES `zoo_return_action` WRITE;
/*!40000 ALTER TABLE `zoo_return_action` DISABLE KEYS */;
INSERT INTO `zoo_return_action` (`return_action_id`, `language_id`, `name`) VALUES (1,1,'Возвращены средства'),(2,1,'Выдан в кредит'),(3,1,'Отправлен другой товар для замены');
/*!40000 ALTER TABLE `zoo_return_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_return_history`
--

DROP TABLE IF EXISTS `zoo_return_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_return_history`
--

LOCK TABLES `zoo_return_history` WRITE;
/*!40000 ALTER TABLE `zoo_return_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_return_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_return_reason`
--

DROP TABLE IF EXISTS `zoo_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_return_reason`
--

LOCK TABLES `zoo_return_reason` WRITE;
/*!40000 ALTER TABLE `zoo_return_reason` DISABLE KEYS */;
INSERT INTO `zoo_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES (1,1,'Получен/доставлен неисправным (сломан)'),(2,1,'Получен не тот (ошибочный) товар'),(3,1,'Ошибочный заказ'),(4,1,'Ошибка, пожалуйста укажите/приложите подробности'),(5,1,'Другое (другая причина), пожалуйста укажите/приложите подробности');
/*!40000 ALTER TABLE `zoo_return_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_return_status`
--

DROP TABLE IF EXISTS `zoo_return_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_return_status`
--

LOCK TABLES `zoo_return_status` WRITE;
/*!40000 ALTER TABLE `zoo_return_status` DISABLE KEYS */;
INSERT INTO `zoo_return_status` (`return_status_id`, `language_id`, `name`) VALUES (1,1,'Рассматриваемый'),(2,1,'Заказ в ожидании'),(3,1,'Готов (к отправке)');
/*!40000 ALTER TABLE `zoo_return_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_review`
--

DROP TABLE IF EXISTS `zoo_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_review`
--

LOCK TABLES `zoo_review` WRITE;
/*!40000 ALTER TABLE `zoo_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_seo_url`
--

DROP TABLE IF EXISTS `zoo_seo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`seo_url_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=887 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_seo_url`
--

LOCK TABLES `zoo_seo_url` WRITE;
/*!40000 ALTER TABLE `zoo_seo_url` DISABLE KEYS */;
INSERT INTO `zoo_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES (730,0,1,'manufacturer_id=8','apple'),(772,0,1,'information_id=4','about_us'),(787,0,1,'category_id=24','smartphone'),(828,0,1,'manufacturer_id=9','canon'),(829,0,1,'manufacturer_id=5','htc'),(830,0,1,'manufacturer_id=7','hewlett-packard'),(831,0,1,'manufacturer_id=6','palm'),(832,0,1,'manufacturer_id=10','sony'),(841,0,1,'information_id=6','delivery'),(842,0,1,'information_id=3','privacy'),(843,0,1,'information_id=5','terms'),(845,0,1,'common/home',''),(846,0,1,'information/contact','contact'),(847,0,1,'information/sitemap','sitemap'),(848,0,1,'product/special','specials'),(849,0,1,'product/manufacturer','brands'),(850,0,1,'product/compare','compare-products'),(851,0,1,'product/search','search'),(852,0,1,'checkout/cart','cart'),(853,0,1,'checkout/checkout','checkout'),(854,0,1,'account/login','login'),(855,0,1,'account/logout','logout'),(856,0,1,'account/voucher','vouchers'),(857,0,1,'account/wishlist','wishlist'),(858,0,1,'account/account','my-account'),(859,0,1,'account/order','order-history'),(860,0,1,'account/newsletter','newsletter'),(861,0,1,'account/return/add','return-add'),(862,0,1,'account/forgotten','forgot-password'),(863,0,1,'account/download','downloads'),(864,0,1,'account/return','returns'),(865,0,1,'account/transaction','transactions'),(866,0,1,'account/register','create-account'),(867,0,1,'account/recurring','recurring'),(868,0,1,'account/address','address-book'),(869,0,1,'account/reward','reward-points'),(870,0,1,'account/edit','edit-account'),(871,0,1,'account/password','change-password'),(880,0,1,'affiliate/forgotten','affiliate-forgot-password'),(881,0,1,'affiliate/register','create-affiliate-account'),(882,0,1,'affiliate/login','affiliate-login'),(883,0,1,'affiliate/payment','affiliate-payment'),(884,0,1,'affiliate/tracking','affiliate-tracking'),(885,0,1,'affiliate/transaction','affiliate-transaction'),(886,0,1,'affiliate/account','affiliates');
/*!40000 ALTER TABLE `zoo_seo_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_session`
--

DROP TABLE IF EXISTS `zoo_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_session`
--

LOCK TABLES `zoo_session` WRITE;
/*!40000 ALTER TABLE `zoo_session` DISABLE KEYS */;
INSERT INTO `zoo_session` (`session_id`, `data`, `expire`) VALUES ('549ab8120b4132cec083a3d1ec','{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"iFNlr1RG1yaTyLqEokW09KgXWPgWKdkG\",\"install\":\"1UjJ7lQ4pQ\"}','2018-06-21 08:48:07');
/*!40000 ALTER TABLE `zoo_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_setting`
--

DROP TABLE IF EXISTS `zoo_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_setting`
--

LOCK TABLES `zoo_setting` WRITE;
/*!40000 ALTER TABLE `zoo_setting` DISABLE KEYS */;
INSERT INTO `zoo_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES (1,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),(2,0,'config','config_shared','0',0),(3,0,'config','config_secure','0',0),(4,0,'total_voucher','total_voucher_sort_order','8',0),(5,0,'total_voucher','total_voucher_status','1',0),(6,0,'config','config_fraud_detection','0',0),(7,0,'config','config_ftp_status','0',0),(8,0,'config','config_ftp_root','',0),(9,0,'config','config_ftp_password','',0),(10,0,'config','config_ftp_username','',0),(11,0,'config','config_ftp_port','21',0),(12,0,'config','config_ftp_hostname','',0),(13,0,'config','config_meta_title','Интернет магазин Opencart &quot;Русская сборка&quot;',0),(14,0,'config','config_meta_description','Мой магазин',0),(15,0,'config','config_meta_keyword','',0),(16,0,'config','config_theme','default',0),(17,0,'config','config_layout_id','4',0),(18,0,'config','config_country_id','176',0),(19,0,'config','config_zone_id','0',0),(20,0,'config','config_language','ru-ru',0),(21,0,'config','config_admin_language','ru-ru',0),(22,0,'config','config_currency','RUB',0),(23,0,'config','config_currency_auto','1',0),(24,0,'config','config_length_class_id','1',0),(25,0,'config','config_weight_class_id','1',0),(26,0,'config','config_product_count','1',0),(27,0,'config','config_limit_admin','20',0),(28,0,'config','config_review_status','1',0),(29,0,'config','config_review_guest','1',0),(30,0,'config','config_voucher_min','1',0),(31,0,'config','config_voucher_max','1000',0),(32,0,'config','config_tax','0',0),(33,0,'config','config_tax_default','shipping',0),(34,0,'config','config_tax_customer','shipping',0),(35,0,'config','config_customer_online','0',0),(36,0,'config','config_customer_activity','0',0),(37,0,'config','config_customer_search','0',0),(38,0,'config','config_customer_group_id','1',0),(39,0,'config','config_customer_group_display','[\"1\"]',1),(40,0,'config','config_customer_price','0',0),(41,0,'config','config_account_id','3',0),(42,0,'config','config_invoice_prefix','INV-2018-00',0),(44,0,'config','config_cart_weight','1',0),(45,0,'config','config_checkout_guest','1',0),(46,0,'config','config_checkout_id','5',0),(47,0,'config','config_order_status_id','1',0),(48,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1),(49,0,'config','config_complete_status','[\"5\",\"3\"]',1),(50,0,'config','config_stock_display','0',0),(51,0,'config','config_stock_warning','0',0),(52,0,'config','config_stock_checkout','0',0),(53,0,'config','config_affiliate_approval','0',0),(54,0,'config','config_affiliate_auto','0',0),(55,0,'config','config_affiliate_commission','5',0),(56,0,'config','config_affiliate_id','4',0),(57,0,'config','config_return_id','0',0),(58,0,'config','config_return_status_id','2',0),(59,0,'config','config_logo','catalog/logo.png',0),(60,0,'config','config_icon','catalog/cart.png',0),(61,0,'config','config_comment','',0),(62,0,'config','config_open','',0),(63,0,'config','config_image','',0),(64,0,'config','config_fax','',0),(65,0,'config','config_telephone','495 888-88-88',0),(67,0,'config','config_geocode','',0),(68,0,'config','config_owner','Иванов Иван',0),(69,0,'config','config_address','г. Москва, ул. Ленина 10 оф. 32',0),(70,0,'config','config_name','Интернет магазин Opencart &quot;Русская сборка&quot;',0),(71,0,'config','config_seo_url','0',0),(72,0,'config','config_file_max_size','300000',0),(73,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0),(74,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf',0),(75,0,'config','config_maintenance','0',0),(76,0,'config','config_password','1',0),(78,0,'config','config_compression','0',0),(79,0,'config','config_error_display','1',0),(80,0,'config','config_error_log','1',0),(81,0,'config','config_error_filename','error.log',0),(82,0,'config','config_google_analytics','',0),(83,0,'config','config_mail_engine','mail',0),(84,0,'config','config_mail_parameter','',0),(85,0,'config','config_mail_smtp_hostname','',0),(86,0,'config','config_mail_smtp_username','',0),(87,0,'config','config_mail_smtp_password','',0),(88,0,'config','config_mail_smtp_port','25',0),(89,0,'config','config_mail_smtp_timeout','5',0),(90,0,'config','config_mail_alert_email','',0),(91,0,'config','config_mail_alert','[\"order\"]',1),(92,0,'config','config_captcha','basic',0),(93,0,'config','config_captcha_page','[\"review\",\"return\",\"contact\"]',1),(94,0,'config','config_login_attempts','5',0),(95,0,'payment_free_checkout','payment_free_checkout_status','1',0),(96,0,'payment_free_checkout','free_checkout_order_status_id','1',0),(97,0,'payment_free_checkout','payment_free_checkout_sort_order','1',0),(98,0,'payment_cod','payment_cod_sort_order','5',0),(99,0,'payment_cod','payment_cod_total','0.01',0),(100,0,'payment_cod','payment_cod_order_status_id','1',0),(101,0,'payment_cod','payment_cod_geo_zone_id','0',0),(102,0,'payment_cod','payment_cod_status','1',0),(103,0,'shipping_flat','shipping_flat_sort_order','1',0),(104,0,'shipping_flat','shipping_flat_status','1',0),(105,0,'shipping_flat','shipping_flat_geo_zone_id','0',0),(106,0,'shipping_flat','shipping_flat_tax_class_id','9',0),(107,0,'shipping_flat','shipping_flat_cost','5.00',0),(108,0,'total_shipping','total_shipping_sort_order','3',0),(109,0,'total_sub_total','sub_total_sort_order','1',0),(110,0,'total_sub_total','total_sub_total_status','1',0),(111,0,'total_tax','total_tax_status','0',0),(112,0,'total_total','total_total_sort_order','9',0),(113,0,'total_total','total_total_status','1',0),(114,0,'total_tax','total_tax_sort_order','5',0),(115,0,'total_credit','total_credit_sort_order','7',0),(116,0,'total_credit','total_credit_status','1',0),(117,0,'total_reward','total_reward_sort_order','2',0),(118,0,'total_reward','total_reward_status','1',0),(119,0,'total_shipping','total_shipping_status','1',0),(120,0,'total_shipping','total_shipping_estimator','1',0),(121,0,'total_coupon','total_coupon_sort_order','4',0),(122,0,'total_coupon','total_coupon_status','1',0),(123,0,'module_category','module_category_status','1',0),(124,0,'module_account','module_account_status','1',0),(125,0,'theme_default','theme_default_product_limit','15',0),(126,0,'theme_default','theme_default_product_description_length','100',0),(127,0,'theme_default','theme_default_image_thumb_width','228',0),(128,0,'theme_default','theme_default_image_thumb_height','228',0),(129,0,'theme_default','theme_default_image_popup_width','500',0),(130,0,'theme_default','theme_default_image_popup_height','500',0),(131,0,'theme_default','theme_default_image_category_width','80',0),(132,0,'theme_default','theme_default_image_category_height','80',0),(133,0,'theme_default','theme_default_image_product_width','228',0),(134,0,'theme_default','theme_default_image_product_height','228',0),(135,0,'theme_default','theme_default_image_additional_width','74',0),(136,0,'theme_default','theme_default_image_additional_height','74',0),(137,0,'theme_default','theme_default_image_related_width','200',0),(138,0,'theme_default','theme_default_image_related_height','200',0),(139,0,'theme_default','theme_default_image_compare_width','90',0),(140,0,'theme_default','theme_default_image_compare_height','90',0),(141,0,'theme_default','theme_default_image_wishlist_width','47',0),(142,0,'theme_default','theme_default_image_wishlist_height','47',0),(143,0,'theme_default','theme_default_image_cart_height','47',0),(144,0,'theme_default','theme_default_image_cart_width','47',0),(145,0,'theme_default','theme_default_image_location_height','50',0),(146,0,'theme_default','theme_default_image_location_width','268',0),(147,0,'theme_default','theme_default_directory','default',0),(148,0,'theme_default','theme_default_status','1',0),(149,0,'dashboard_activity','dashboard_activity_status','1',0),(150,0,'dashboard_activity','dashboard_activity_sort_order','7',0),(151,0,'dashboard_sale','dashboard_sale_status','1',0),(152,0,'dashboard_sale','dashboard_sale_width','3',0),(153,0,'dashboard_chart','dashboard_chart_status','1',0),(154,0,'dashboard_chart','dashboard_chart_width','6',0),(155,0,'dashboard_customer','dashboard_customer_status','1',0),(156,0,'dashboard_customer','dashboard_customer_width','3',0),(157,0,'dashboard_map','dashboard_map_status','1',0),(158,0,'dashboard_map','dashboard_map_width','6',0),(159,0,'dashboard_online','dashboard_online_status','1',0),(160,0,'dashboard_online','dashboard_online_width','3',0),(161,0,'dashboard_order','dashboard_order_sort_order','1',0),(162,0,'dashboard_order','dashboard_order_status','1',0),(163,0,'dashboard_order','dashboard_order_width','3',0),(164,0,'dashboard_sale','dashboard_sale_sort_order','2',0),(165,0,'dashboard_customer','dashboard_customer_sort_order','3',0),(166,0,'dashboard_online','dashboard_online_sort_order','4',0),(167,0,'dashboard_map','dashboard_map_sort_order','5',0),(168,0,'dashboard_chart','dashboard_chart_sort_order','6',0),(169,0,'dashboard_recent','dashboard_recent_status','1',0),(170,0,'dashboard_recent','dashboard_recent_sort_order','8',0),(171,0,'dashboard_activity','dashboard_activity_width','4',0),(172,0,'dashboard_recent','dashboard_recent_width','8',0),(173,0,'report_customer_activity','report_customer_activity_status','1',0),(174,0,'report_customer_activity','report_customer_activity_sort_order','1',0),(175,0,'report_customer_order','report_customer_order_status','1',0),(176,0,'report_customer_order','report_customer_order_sort_order','2',0),(177,0,'report_customer_reward','report_customer_reward_status','1',0),(178,0,'report_customer_reward','report_customer_reward_sort_order','3',0),(179,0,'report_customer_search','report_customer_search_sort_order','3',0),(180,0,'report_customer_search','report_customer_search_status','1',0),(181,0,'report_customer_transaction','report_customer_transaction_status','1',0),(182,0,'report_customer_transaction','report_customer_transaction_status_sort_order','4',0),(183,0,'report_sale_tax','report_sale_tax_status','1',0),(184,0,'report_sale_tax','report_sale_tax_sort_order','5',0),(185,0,'report_sale_shipping','report_sale_shipping_status','1',0),(186,0,'report_sale_shipping','report_sale_shipping_sort_order','6',0),(187,0,'report_sale_return','report_sale_return_status','1',0),(188,0,'report_sale_return','report_sale_return_sort_order','7',0),(189,0,'report_sale_order','report_sale_order_status','1',0),(190,0,'report_sale_order','report_sale_order_sort_order','8',0),(191,0,'report_sale_coupon','report_sale_coupon_status','1',0),(192,0,'report_sale_coupon','report_sale_coupon_sort_order','9',0),(193,0,'report_product_viewed','report_product_viewed_status','1',0),(194,0,'report_product_viewed','report_product_viewed_sort_order','10',0),(195,0,'report_product_purchased','report_product_purchased_status','1',0),(196,0,'report_product_purchased','report_product_purchased_sort_order','11',0),(197,0,'report_marketing','report_marketing_status','1',0),(198,0,'report_marketing','report_marketing_sort_order','12',0),(199,0,'developer','developer_theme','1',0),(200,0,'developer','developer_sass','1',0),(201,0,'config','config_email','grol55@mail.ru',0),(202,0,'config','config_encryption','De04LZw0wKQlJwFq36qWOPIIyObR3sfT6C1msxRzjptKCG4lXaoszbFDmhiR9qdoNl3ciEAtolgEC0TyH6zv0xGus5Q3oLNBy9mgoQZu1Woarm23uxPYFSEE2bWGetoSgrEXPOphCnCrlnfB4YopClUqXHOIchjRzTpaYeqJWyk955CEz4AmnouW82CiAeciSWFTHYbqnQIkt26U78LJPepVRCu3TnJaIL6maW9hVkU9WWUXL7cZf8eXOAI2ocXG40FSPQMYiT9KDzHf5hSKddOEoGodmGqcqlwEuHXMrwL2KbsjacsN29kdKzHIRKPO5SYaq0jmkMkGfg0qwQUV0DJdoIOxSstJVzY3uPLPAin2T2b1B3SNFNrF3IWJRv60itvOBR88v05l9XMKBdHprnTZ912Wrh1HyA14rKpRuTeR7LTSOiesAbXWtJRqzeF2CCosvxMCByYb2ZJFiJVpRYNm1aa3StiRjKgmq3pL3JiYFkjvyCEGRow6vZY3jc2gXSY9hWSf4LJkbqjuK9jKCxEBqwAd9vdmXznW6WQxbkV1EOWcDm5KOmZjBk8MNIm3GoSmXEox5WiTdy5lpMC5zIzLHTVmlTSSG1O2zjWCHh4dzhGaWXCU0Ah1ruuvmYK6qWuEwmo5TLCKfFp8gHcDDHl1jVoy94JqvPrgLav1TYikFXqxxwWjvX1vEg4Y6xUIzDObzmCAvwWygIzrIxBlxpypdx73vqXaKhK0daxnIFMJdjC87qGqntTZr3Bha8jrZvfHiWNFmv2d5o6ctAYv5pdISWzqFxte1VUGHarD4qdSU8kBcs93EPWDxLizkp5WT45bpnkfJlAyvwgQzmJCWwYvrjwgy0Ql4MV8vIVFhI40mXRxPHkLE5hPEtJv6ZZFOZxdSeMZy1RYRuyA8fo9qSjUNkOFfhRCsxtV3t5PmUU8lCMSOTLb3d2JNXnSypoMkuUjmBfLOy9c24Aygw0bKtcNU1RKtJesokZy6h9hCUz9p9nPB0CQDqV2pX6JjBec',0),(203,0,'config','config_api_id','1',0),(204,0,'import_xls','import_xls_innodb_converted','1',0);
/*!40000 ALTER TABLE `zoo_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_shipping_courier`
--

DROP TABLE IF EXISTS `zoo_shipping_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`shipping_courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_shipping_courier`
--

LOCK TABLES `zoo_shipping_courier` WRITE;
/*!40000 ALTER TABLE `zoo_shipping_courier` DISABLE KEYS */;
INSERT INTO `zoo_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES (1,'dhl','DHL'),(2,'fedex','Fedex'),(3,'ups','UPS'),(4,'royal-mail','Royal Mail'),(5,'usps','United States Postal Service'),(6,'auspost','Australia Post'),(7,'citylink','Citylink');
/*!40000 ALTER TABLE `zoo_shipping_courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_statistics`
--

DROP TABLE IF EXISTS `zoo_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_statistics`
--

LOCK TABLES `zoo_statistics` WRITE;
/*!40000 ALTER TABLE `zoo_statistics` DISABLE KEYS */;
INSERT INTO `zoo_statistics` (`statistics_id`, `code`, `value`) VALUES (1,'order_sale',0.0000),(2,'order_processing',0.0000),(3,'order_complete',0.0000),(4,'order_other',0.0000),(5,'returns',0.0000),(6,'product',0.0000),(7,'review',0.0000);
/*!40000 ALTER TABLE `zoo_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_stock_status`
--

DROP TABLE IF EXISTS `zoo_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_stock_status`
--

LOCK TABLES `zoo_stock_status` WRITE;
/*!40000 ALTER TABLE `zoo_stock_status` DISABLE KEYS */;
INSERT INTO `zoo_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES (5,1,'Нет в наличии'),(6,1,'Ожидание 2-3 дня'),(7,1,'В наличии'),(8,1,'Предзаказ');
/*!40000 ALTER TABLE `zoo_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_store`
--

DROP TABLE IF EXISTS `zoo_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_store`
--

LOCK TABLES `zoo_store` WRITE;
/*!40000 ALTER TABLE `zoo_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_tax_class`
--

DROP TABLE IF EXISTS `zoo_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_tax_class`
--

LOCK TABLES `zoo_tax_class` WRITE;
/*!40000 ALTER TABLE `zoo_tax_class` DISABLE KEYS */;
INSERT INTO `zoo_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES (9,'Налоги','Облагаемые налогом','2014-06-06 23:00:00','2014-09-09 11:50:31');
/*!40000 ALTER TABLE `zoo_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_tax_rate`
--

DROP TABLE IF EXISTS `zoo_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_tax_rate`
--

LOCK TABLES `zoo_tax_rate` WRITE;
/*!40000 ALTER TABLE `zoo_tax_rate` DISABLE KEYS */;
INSERT INTO `zoo_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES (87,3,'НДС',18.0000,'F','2011-09-21 21:49:23','2014-09-09 11:49:32');
/*!40000 ALTER TABLE `zoo_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `zoo_tax_rate_to_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_tax_rate_to_customer_group`
--

LOCK TABLES `zoo_tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `zoo_tax_rate_to_customer_group` DISABLE KEYS */;
INSERT INTO `zoo_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES (86,1),(87,1);
/*!40000 ALTER TABLE `zoo_tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_tax_rule`
--

DROP TABLE IF EXISTS `zoo_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_tax_rule`
--

LOCK TABLES `zoo_tax_rule` WRITE;
/*!40000 ALTER TABLE `zoo_tax_rule` DISABLE KEYS */;
INSERT INTO `zoo_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES (120,10,87,'store',0),(121,10,86,'payment',1),(127,9,87,'shipping',2),(128,9,86,'shipping',1);
/*!40000 ALTER TABLE `zoo_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_theme`
--

DROP TABLE IF EXISTS `zoo_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_theme`
--

LOCK TABLES `zoo_theme` WRITE;
/*!40000 ALTER TABLE `zoo_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_translation`
--

DROP TABLE IF EXISTS `zoo_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_translation`
--

LOCK TABLES `zoo_translation` WRITE;
/*!40000 ALTER TABLE `zoo_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_upload`
--

DROP TABLE IF EXISTS `zoo_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_upload`
--

LOCK TABLES `zoo_upload` WRITE;
/*!40000 ALTER TABLE `zoo_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_user`
--

DROP TABLE IF EXISTS `zoo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_user`
--

LOCK TABLES `zoo_user` WRITE;
/*!40000 ALTER TABLE `zoo_user` DISABLE KEYS */;
INSERT INTO `zoo_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES (1,1,'admin','75e8da603d1789afbf90e716910e2e6c343964ca','3HgQwVf0I','John','Doe','grol55@mail.ru','','','127.0.0.1',1,'2018-06-21 13:04:23');
/*!40000 ALTER TABLE `zoo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_user_group`
--

DROP TABLE IF EXISTS `zoo_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_user_group`
--

LOCK TABLES `zoo_user_group` WRITE;
/*!40000 ALTER TABLE `zoo_user_group` DISABLE KEYS */;
INSERT INTO `zoo_user_group` (`user_group_id`, `name`, `permission`) VALUES (1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/import_xls\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/event\",\"marketplace\\/api\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/import_xls\"]}'),(10,'Demonstration','');
/*!40000 ALTER TABLE `zoo_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_voucher`
--

DROP TABLE IF EXISTS `zoo_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_voucher`
--

LOCK TABLES `zoo_voucher` WRITE;
/*!40000 ALTER TABLE `zoo_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_voucher_history`
--

DROP TABLE IF EXISTS `zoo_voucher_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_voucher_history`
--

LOCK TABLES `zoo_voucher_history` WRITE;
/*!40000 ALTER TABLE `zoo_voucher_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoo_voucher_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_voucher_theme`
--

DROP TABLE IF EXISTS `zoo_voucher_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_voucher_theme`
--

LOCK TABLES `zoo_voucher_theme` WRITE;
/*!40000 ALTER TABLE `zoo_voucher_theme` DISABLE KEYS */;
INSERT INTO `zoo_voucher_theme` (`voucher_theme_id`, `image`) VALUES (6,'catalog/demo/apple_logo.jpg'),(7,'catalog/demo/gift-voucher-birthday.jpg'),(8,'catalog/demo/canon_eos_5d_2.jpg');
/*!40000 ALTER TABLE `zoo_voucher_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_voucher_theme_description`
--

DROP TABLE IF EXISTS `zoo_voucher_theme_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_voucher_theme_description`
--

LOCK TABLES `zoo_voucher_theme_description` WRITE;
/*!40000 ALTER TABLE `zoo_voucher_theme_description` DISABLE KEYS */;
INSERT INTO `zoo_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES (6,1,'Новый год'),(7,1,'День рождения'),(8,1,'Другое');
/*!40000 ALTER TABLE `zoo_voucher_theme_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_weight_class`
--

DROP TABLE IF EXISTS `zoo_weight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_weight_class`
--

LOCK TABLES `zoo_weight_class` WRITE;
/*!40000 ALTER TABLE `zoo_weight_class` DISABLE KEYS */;
INSERT INTO `zoo_weight_class` (`weight_class_id`, `value`) VALUES (1,1.00000000),(2,1000.00000000),(5,2.20460000),(6,35.27400000);
/*!40000 ALTER TABLE `zoo_weight_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_weight_class_description`
--

DROP TABLE IF EXISTS `zoo_weight_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_weight_class_description`
--

LOCK TABLES `zoo_weight_class_description` WRITE;
/*!40000 ALTER TABLE `zoo_weight_class_description` DISABLE KEYS */;
INSERT INTO `zoo_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES (1,1,'Килограмм','кг'),(2,1,'Грамм','г');
/*!40000 ALTER TABLE `zoo_weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_zone`
--

DROP TABLE IF EXISTS `zoo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_zone`
--

LOCK TABLES `zoo_zone` WRITE;
/*!40000 ALTER TABLE `zoo_zone` DISABLE KEYS */;
INSERT INTO `zoo_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES (1,20,'Брест','BR',1),(2,20,'Гомель','HO',1),(3,20,'Минск','HM',1),(4,20,'Гродно','HR',1),(5,20,'Могилев','MA',1),(6,20,'Минская область','MI',1),(7,20,'Витебск','VI',1),(8,80,'Abkhazia','AB',1),(9,80,'Ajaria','AJ',1),(10,80,'Tbilisi','TB',1),(11,80,'Guria','GU',1),(12,80,'Imereti','IM',1),(13,80,'Kakheti','KA',1),(14,80,'Kvemo Kartli','KK',1),(15,80,'Mtskheta-Mtianeti','MM',1),(16,80,'Racha Lechkhumi and Kvemo Svanet','RL',1),(17,80,'Samegrelo-Zemo Svaneti','SZ',1),(18,80,'Samtskhe-Javakheti','SJ',1),(19,80,'Shida Kartli','SK',1),(20,109,'Алматинская область','AL',1),(21,109,'Алматы - город республ-го значения','AC',1),(22,109,'Акмолинская область','AM',1),(23,109,'Актюбинская область','AQ',1),(24,109,'Астана - город республ-го значения','AS',1),(25,109,'Атырауская область','AT',1),(26,109,'Западно-Казахстанская область','BA',1),(27,109,'Байконур - город республ-го значения','BY',1),(28,109,'Мангистауская область','MA',1),(29,109,'Южно-Казахстанская область','ON',1),(30,109,'Павлодарская область','PA',1),(31,109,'Карагандинская область','QA',1),(32,109,'Костанайская область','QO',1),(33,109,'Кызылординская область','QY',1),(34,109,'Восточно-Казахстанская область','SH',1),(35,109,'Северо-Казахстанская область','SO',1),(36,109,'Жамбылская область','ZH',1),(37,115,'Bishkek','GB',1),(38,115,'Batken','B',1),(39,115,'Chu','C',1),(40,115,'Jalal-Abad','J',1),(41,115,'Naryn','N',1),(42,115,'Osh','O',1),(43,115,'Talas','T',1),(44,115,'Ysyk-Kol','Y',1),(45,176,'Республика Хакасия','KK',1),(46,176,'Московская область','MOS',1),(47,176,'Чукотский АО','CHU',1),(48,176,'Архангельская область','ARK',1),(49,176,'Астраханская область','AST',1),(50,176,'Алтайский край','ALT',1),(51,176,'Белгородская область','BEL',1),(52,176,'Еврейская АО','YEV',1),(53,176,'Амурская область','AMU',1),(54,176,'Брянская область','BRY',1),(55,176,'Чувашская Республика','CU',1),(56,176,'Челябинская область','CHE',1),(57,176,'Карачаево-Черкесия','KC',1),(58,176,'Забайкальский край','ZAB',1),(59,176,'Ленинградская область','LEN',1),(60,176,'Республика Калмыкия','KL',1),(61,176,'Сахалинская область','SAK',1),(62,176,'Республика Алтай','AL',1),(63,176,'Чеченская Республика','CE',1),(64,176,'Иркутская область','IRK',1),(65,176,'Ивановская область','IVA',1),(66,176,'Удмуртская Республика','UD',1),(67,176,'Калининградская область','KGD',1),(68,176,'Калужская область','KLU',1),(69,176,'Республика Татарстан','TA',1),(70,176,'Кемеровская область','KEM',1),(71,176,'Хабаровский край','KHA',1),(72,176,'Ханты-Мансийский АО - Югра','KHM',1),(73,176,'Костромская область','KOS',1),(74,176,'Краснодарский край','KDA',1),(75,176,'Красноярский край','KYA',1),(76,176,'Курганская область','KGN',1),(77,176,'Курская область','KRS',1),(78,176,'Республика Тыва','TY',1),(79,176,'Липецкая область','LIP',1),(80,176,'Магаданская область','MAG',1),(81,176,'Республика Дагестан','DA',1),(82,176,'Республика Адыгея','AD',1),(83,176,'Москва','MOW',1),(84,176,'Мурманская область','MUR',1),(85,176,'Республика Кабардино-Балкария','KB',1),(86,176,'Ненецкий АО','NEN',1),(87,176,'Республика Ингушетия','IN',1),(88,176,'Нижегородская область','NIZ',1),(89,176,'Новгородская область','NGR',1),(90,176,'Новосибирская область','NVS',1),(91,176,'Омская область','OMS',1),(92,176,'Орловская область','ORL',1),(93,176,'Оренбургская область','ORE',1),(94,176,'Пензенская область','PNZ',1),(95,176,'Пермский край','PER',1),(96,176,'Камчатский край','KAM',1),(97,176,'Республика Карелия','KR',1),(98,176,'Псковская область','PSK',1),(99,176,'Ростовская область','ROS',1),(100,176,'Рязанская область','RYA',1),(101,176,'Ямало-Ненецкий АО','YAN',1),(102,176,'Самарская область','SAM',1),(103,176,'Республика Мордовия','MO',1),(104,176,'Саратовская область','SAR',1),(105,176,'Смоленская область','SMO',1),(106,176,'Санкт-Петербург','SPE',1),(107,176,'Ставропольский край','STA',1),(108,176,'Республика Коми','KO',1),(109,176,'Тамбовская область','TAM',1),(110,176,'Томская область','TOM',1),(111,176,'Тульская область','TUL',1),(112,176,'Тверская область','TVE',1),(113,176,'Тюменская область','TYU',1),(114,176,'Республика Башкортостан','BA',1),(115,176,'Ульяновская область','ULY',1),(116,176,'Республика Бурятия','BU',1),(117,176,'Республика Северная Осетия','SE',1),(118,176,'Владимирская область','VLA',1),(119,176,'Приморский край','PRI',1),(120,176,'Волгоградская область','VGG',1),(121,176,'Вологодская область','VLG',1),(122,176,'Воронежская область','VOR',1),(123,176,'Кировская область','KIR',1),(124,176,'Республика Саха','SA',1),(125,176,'Ярославская область','YAR',1),(126,176,'Свердловская область','SVE',1),(127,176,'Республика Марий Эл','ME',1),(128,176,'Республика Крым','CR',1),(129,220,'Черкассы','CK',1),(130,220,'Чернигов','CH',1),(131,220,'Черновцы','CV',1),(132,220,'Днепропетровск','DN',1),(133,220,'Донецк','DO',1),(134,220,'Ивано-Франковск','IV',1),(135,220,'Харьков','KH',1),(136,220,'Хмельницкий','KM',1),(137,220,'Кировоград','KR',1),(138,220,'Киевская область','KV',1),(139,220,'Киев','KY',1),(140,220,'Луганск','LU',1),(141,220,'Львов','LV',1),(142,220,'Николаев','MY',1),(143,220,'Одесса','OD',1),(144,220,'Полтава','PO',1),(145,220,'Ровно','RI',1),(146,176,'Севастополь','SEV',1),(147,220,'Сумы','SU',1),(148,220,'Тернополь','TE',1),(149,220,'Винница','VI',1),(150,220,'Луцк','VO',1),(151,220,'Ужгород','ZK',1),(152,220,'Запорожье','ZA',1),(153,220,'Житомир','ZH',1),(154,220,'Херсон','KE',1),(155,226,'Andijon','AN',1),(156,226,'Buxoro','BU',1),(157,226,'Farg\'ona','FA',1),(158,226,'Jizzax','JI',1),(159,226,'Namangan','NG',1),(160,226,'Navoiy','NW',1),(161,226,'Qashqadaryo','QA',1),(162,226,'Qoraqalpog\'iston Republikasi','QR',1),(163,226,'Samarqand','SA',1),(164,226,'Sirdaryo','SI',1),(165,226,'Surxondaryo','SU',1),(166,226,'Toshkent City','TK',1),(167,226,'Toshkent Region','TO',1),(168,226,'Xorazm','XO',1),(169,176,'Байконур - город республ-го значения','BY',1);
/*!40000 ALTER TABLE `zoo_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zoo_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `zoo_zone_to_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoo_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zoo_zone_to_geo_zone`
--

LOCK TABLES `zoo_zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `zoo_zone_to_geo_zone` DISABLE KEYS */;
INSERT INTO `zoo_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES (1,222,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,176,0,3,'2014-09-09 11:48:13','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `zoo_zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21 13:38:09
