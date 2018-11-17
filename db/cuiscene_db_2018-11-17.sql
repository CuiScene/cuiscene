# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.38)
# Database: cuiscene_db
# Generation Time: 2018-11-17 17:14:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table recipe_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipe_details`;

CREATE TABLE `recipe_details` (
  `recipe_id_pk_fk` int(11) NOT NULL,
  `recipe_name_pk_fk` varchar(45) NOT NULL,
  `servings` varchar(45) DEFAULT NULL,
  `serving_size` varchar(45) DEFAULT NULL,
  `preptime` varchar(45) DEFAULT NULL,
  `cooktime` varchar(45) DEFAULT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`recipe_id_pk_fk`,`recipe_name_pk_fk`),
  KEY `fkIdx_55` (`recipe_id_pk_fk`,`recipe_name_pk_fk`),
  CONSTRAINT `FK_55` FOREIGN KEY (`recipe_id_pk_fk`, `recipe_name_pk_fk`) REFERENCES `recipes` (`id`, `recipe_name_pk`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table recipe_ratings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipe_ratings`;

CREATE TABLE `recipe_ratings` (
  `recipe_id_fk` int(11) NOT NULL,
  `recipe_name_fk` varchar(45) NOT NULL,
  `recipe_rating` int(1) NOT NULL,
  `recipe_notes` varchar(255) DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  PRIMARY KEY (`recipe_id_fk`,`recipe_name_fk`),
  KEY `fkIdx_97` (`recipe_id_fk`,`recipe_name_fk`),
  CONSTRAINT `FK_97` FOREIGN KEY (`recipe_id_fk`, `recipe_name_fk`) REFERENCES `recipes` (`id`, `recipe_name_pk`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table recipes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipes`;

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_name_pk` varchar(45) NOT NULL,
  `username_fk` varchar(45) NOT NULL,
  `restaurant_id_fk` int(11) NOT NULL,
  `restaurant_name_fk` varchar(45) NOT NULL,
  `recipe_cuisine` varchar(45) NOT NULL,
  `recipe_tags` varchar(45) DEFAULT NULL,
  `restaurant_menu_item` varchar(45) NOT NULL,
  `recipe_rating` decimal(1,1) DEFAULT NULL,
  `recipe_date` date NOT NULL,
  PRIMARY KEY (`id`,`recipe_name_pk`),
  KEY `fkIdx_110` (`username_fk`),
  KEY `fkIdx_116` (`restaurant_id_fk`,`restaurant_name_fk`),
  CONSTRAINT `FK_110` FOREIGN KEY (`username_fk`) REFERENCES `users` (`username_pk`),
  CONSTRAINT `FK_116` FOREIGN KEY (`restaurant_id_fk`, `restaurant_name_fk`) REFERENCES `restaurants` (`id`, `restaurant_name_pk`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;

INSERT INTO `recipes` (`id`, `recipe_name_pk`, `username_fk`, `restaurant_id_fk`, `restaurant_name_fk`, `recipe_cuisine`, `recipe_tags`, `restaurant_menu_item`, `recipe_rating`, `recipe_date`)
VALUES
	(1,'Test Soup','User1',1,'valentinos','italian','vegan','soup',NULL,'2018-11-13');

/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table restaurants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name_pk` varchar(45) NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `rating` decimal(1,1) DEFAULT NULL,
  PRIMARY KEY (`id`,`restaurant_name_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;

INSERT INTO `restaurants` (`id`, `restaurant_name_pk`, `cuisine`, `location`, `rating`)
VALUES
	(1,'valentinos','italian','Cleveland',NULL);

/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_entries`;

CREATE TABLE `user_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meal_time` varchar(45) NOT NULL,
  `menu_item` varchar(45) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `price` decimal(3,2) NOT NULL,
  `username_fk` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkIdx_27` (`username_fk`),
  CONSTRAINT `FK_27` FOREIGN KEY (`username_fk`) REFERENCES `users` (`username_pk`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username_pk` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`username_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`username_pk`, `date_created`, `last_login`)
VALUES
	('test','0000-00-00 00:00:00',NULL),
	('User1','2018-11-13 21:20:48',NULL),
	('yhamid1982','0000-00-00 00:00:00',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
