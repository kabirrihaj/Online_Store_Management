-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema online_store_management
--

CREATE DATABASE IF NOT EXISTS online_store_management;
USE online_store_management;

--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(10) unsigned NOT NULL auto_increment,
  `customer_fname` varchar(50) NOT NULL,
  `customer_lname` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `customer_gender` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `customer_user_name` varchar(100) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `customer_image` varchar(100) NOT NULL,
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`,`customer_fname`,`customer_lname`,`date_of_birth`,`customer_gender`,`email`,`password`,`customer_user_name`,`address_1`,`address_2`,`city`,`state`,`zip`,`phone_number`,`customer_image`) VALUES 
 (1,'Kakib','Khan','1992-04-16','Male','kakib123@gmail.com','rakib123','Kakib Khan','Lokkhipur, Noakhali','Dhaka','Dhaka','Bangladesh','1262','01683046684','abc'),
 (8,'Arif','Khan','1992-04-16','Maleds','arif123@gmail.com','arif123','Arif khan','Julekha Medicine','Horina,','Dhaka','Bangladesh','1262','01683046684','abc'),
 (9,'Kakib','Khan','1990-04-01','Male','rarkar@gmail.com','rakib123','Rakib Khan','Lokkhipur, Noakhali','Dhaka','Dhaka','Bangladesh','1262','01683046684','abc'),
 (10,'Hasan','Khan','1992-04-16','Male','razwar@gmail.com','rakib123','Hasan Khan','Julekha Medicine','Horina, Dhanua Bazar','Dhaka','Bangladesh','1262','01683046684','abc');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `order_items_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `discount_price` double NOT NULL,
  `total_price` double NOT NULL,
  `net_price` double NOT NULL,
  `delivary_zone` varchar(45) NOT NULL,
  `address` varchar(150) NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`order_items_id`),
  KEY `FK_order_items_1` (`order_id`),
  KEY `FK_order_items_2` (`product_id`),
  KEY `FK_order_items_3` (`customer_id`),
  CONSTRAINT `FK_order_items_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_order_items_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_order_items_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`order_items_id`,`order_id`,`product_id`,`price`,`quantity`,`discount_price`,`total_price`,`net_price`,`delivary_zone`,`address`,`customer_id`) VALUES 
 (3,1,1,10,4,3,55,4343,'rfger55555555','eferf',1),
 (4,1,3,3003,4,33,12012,11979,'rfger55555555','eferf',1),
 (5,3,1,80000,4,33,320000,319967,'ddd','eferf5555555555555',1),
 (7,1,1,80000,35,33,2800000,2799967,'rfger55555555','eferf5555555555555',9);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;


--
-- Definition of trigger `order_items_after_insert`
--

DROP TRIGGER /*!50030 IF EXISTS */ `order_items_after_insert`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `order_items_after_insert` AFTER INSERT ON `order_items` FOR EACH ROW BEGIN
update product
set product_quantity=product_quantity-new.quantity;
END $$

DELIMITER ;

--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `create_date` date NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `order_sub_total` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`order_id`),
  KEY `FK_orders_1` (`customer_id`),
  KEY `FK_orders_2` (`product_id`),
  CONSTRAINT `FK_orders_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_orders_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`,`customer_id`,`product_id`,`create_date`,`order_status`,`order_sub_total`) VALUES 
 (1,1,1,'2018-04-06','Allow',2),
 (3,8,1,'2018-07-12','yes',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `payment_date` date NOT NULL,
  `total_payment` double NOT NULL,
  `discount` double NOT NULL,
  `order_items_id` int(10) unsigned NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `delivary_charge` double NOT NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_payment_1` (`customer_id`),
  KEY `FK_payment_2` (`order_items_id`),
  CONSTRAINT `FK_payment_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_payment_2` FOREIGN KEY (`order_items_id`) REFERENCES `order_items` (`order_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `pro_category`
--

DROP TABLE IF EXISTS `pro_category`;
CREATE TABLE `pro_category` (
  `category_id` int(10) unsigned NOT NULL auto_increment,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_category`
--

/*!40000 ALTER TABLE `pro_category` DISABLE KEYS */;
INSERT INTO `pro_category` (`category_id`,`category_name`,`description`) VALUES 
 (1,'Electronic Device','Good Qualitity'),
 (2,'Cloth','Good Qualitities'),
 (8,'Food !','Dry food'),
 (10,'Furniture','Good Qualitities');
/*!40000 ALTER TABLE `pro_category` ENABLE KEYS */;


--
-- Definition of table `pro_sub_category`
--

DROP TABLE IF EXISTS `pro_sub_category`;
CREATE TABLE `pro_sub_category` (
  `sub_category_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned NOT NULL,
  `sub_category_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY  (`sub_category_id`),
  KEY `FK_pro_sub_category_1` (`category_id`),
  CONSTRAINT `FK_pro_sub_category_1` FOREIGN KEY (`category_id`) REFERENCES `pro_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_sub_category`
--

/*!40000 ALTER TABLE `pro_sub_category` DISABLE KEYS */;
INSERT INTO `pro_sub_category` (`sub_category_id`,`category_id`,`sub_category_name`,`description`) VALUES 
 (1,1,'Mobile','Smat'),
 (2,2,'shirt','mens'),
 (3,10,'Table1','well rrrr');
/*!40000 ALTER TABLE `pro_sub_category` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned NOT NULL,
  `sub_category_id` int(10) unsigned NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `manufacture` varchar(100) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL,
  `product_pur_price` double NOT NULL,
  `product_sel_price` double NOT NULL,
  `description` varchar(200) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `featured` varchar(45) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY  (`product_id`),
  KEY `FK_product_1` (`category_id`),
  KEY `FK_product_2` (`sub_category_id`),
  CONSTRAINT `FK_product_1` FOREIGN KEY (`category_id`) REFERENCES `pro_category` (`category_id`),
  CONSTRAINT `FK_product_2` FOREIGN KEY (`sub_category_id`) REFERENCES `pro_sub_category` (`sub_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`,`category_id`,`sub_category_id`,`product_name`,`manufacture`,`product_quantity`,`product_pur_price`,`product_sel_price`,`description`,`product_image`,`featured`,`create_date`) VALUES 
 (1,1,1,'iPhone-11','Linax',1,70000,80000,'good','abc','1','2018-07-19'),
 (3,10,3,'T12','ygyu2',74,2003,3003,'Smatt tab2','wwe','122','2018-07-21'),
 (4,10,2,'hghg','ghgh',11,200,300,'ghghg','ww','ghgh','2018-07-18');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `users_registration`
--

DROP TABLE IF EXISTS `users_registration`;
CREATE TABLE `users_registration` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(50) NOT NULL,
  `user_fname` varchar(50) NOT NULL,
  `user_lname` varchar(50) NOT NULL,
  `user_gender` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `create_date` date NOT NULL,
  `user_image` varchar(200) NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_registration`
--

/*!40000 ALTER TABLE `users_registration` DISABLE KEYS */;
INSERT INTO `users_registration` (`user_id`,`user_name`,`user_fname`,`user_lname`,`user_gender`,`date_of_birth`,`email`,`password`,`address_1`,`address_2`,`state`,`city`,`zip`,`phone_number`,`create_date`,`user_image`) VALUES 
 (4,'Kabir Khan','kabir','Khan','male','1990-09-08','k@gmail.com','123','dhaka','chandpur','bd','dd','1234','01687569226','2018-09-04','eee'),
 (5,'Arif Hossain','Arif','Hossain','Male','2000-07-08','arif@gmail.com','arif123','Dhaka','Chandpur','DH','Dhaka','1262','01683046684','2018-06-30','123');
/*!40000 ALTER TABLE `users_registration` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
