-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;
-- DROP DATABASE IF EXISTS g6xs2llrd7gfjp1t;

-- CREATE DATABASE g6xs2llrd7gfjp1t;

-- USE g6xs2llrd7gfjp1t;

-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;
DROP DATABASE IF EXISTS `cuiscene_db`;

CREATE DATABASE `cuiscene_db`;

USE `cuiscene_db`;

-- ************************************** `users`

CREATE TABLE `users`
(
 `username_pk`  varchar(45) NOT NULL ,
 `date_created` datetime NOT NULL ,
 `last_login`   datetime ,
PRIMARY KEY (`username_pk`)
) ENGINE=INNODB;






-- ************************************** `restaurants`

CREATE TABLE `restaurants`
(
 `id`                 int NOT NULL AUTO_INCREMENT ,
 `restaurant_name_pk` varchar(45) NOT NULL ,
 `cuisine`            varchar(45) NOT NULL ,
 `location`           varchar(45) ,
 `rating`             decimal(1,1) ,
PRIMARY KEY (`id`, `restaurant_name_pk`)
) ENGINE=INNODB;






-- ************************************** `user_entries`

CREATE TABLE `user_entries`
(
 `id`              int NOT NULL AUTO_INCREMENT ,
 `restaurant_name` varchar(45) NOT NULL ,
 `date`            datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `meal_time`       varchar(45) NOT NULL ,
 `menu_item`       varchar(45) NOT NULL ,
 `notes`           varchar(255) ,
 `rating`          int(1) NOT NULL ,
 `price`           decimal(3,2) NOT NULL ,
 `username_fk`     varchar(45) NOT NULL ,
PRIMARY KEY (`id`),
KEY `fkIdx_27` (`username_fk`),
CONSTRAINT `FK_27` FOREIGN KEY `fkIdx_27` (`username_fk`) REFERENCES `users` (`username_pk`) ON UPDATE CASCADE
) ENGINE=INNODB;






-- ************************************** `recipes`

CREATE TABLE `recipes`
(
 `id`                   int NOT NULL AUTO_INCREMENT ,
 `recipe_name_pk`       varchar(45) NOT NULL ,
 `username_fk`          varchar(45) NOT NULL ,
 `restaurant_id_fk`     int NOT NULL ,
 `restaurant_name_fk`   varchar(45) NOT NULL ,
 `recipe_cuisine`       varchar(45) NOT NULL ,
 `recipe_tags`          varchar(45) ,
 `restaurant_menu_item` varchar(45) NOT NULL ,
 `recipe_rating`        decimal(1,1) ,
 `recipe_date`          date NOT NULL ,
PRIMARY KEY (`id`, `recipe_name_pk`),
KEY `fkIdx_110` (`username_fk`),
CONSTRAINT `FK_110` FOREIGN KEY `fkIdx_110` (`username_fk`) REFERENCES `users` (`username_pk`),
KEY `fkIdx_116` (`restaurant_id_fk`, `restaurant_name_fk`),
CONSTRAINT `FK_116` FOREIGN KEY `fkIdx_116` (`restaurant_id_fk`, `restaurant_name_fk`) REFERENCES `restaurants` (`id`, `restaurant_name_pk`) ON UPDATE CASCADE
) ENGINE=INNODB;






-- ************************************** `recipe_ratings`

CREATE TABLE `recipe_ratings`
(
 `recipe_id_fk`   int NOT NULL ,
 `recipe_name_fk` varchar(45) NOT NULL ,
 `recipe_rating`  int(1) NOT NULL ,
 `recipe_notes`   varchar(255) ,
 `date_submitted` datetime NOT NULL ,
PRIMARY KEY (`recipe_id_fk`, `recipe_name_fk`),
KEY `fkIdx_97` (`recipe_id_fk`, `recipe_name_fk`),
CONSTRAINT `FK_97` FOREIGN KEY `fkIdx_97` (`recipe_id_fk`, `recipe_name_fk`) REFERENCES `recipes` (`id`, `recipe_name_pk`) ON UPDATE CASCADE
) ENGINE=INNODB;






-- ************************************** `recipe_details`

CREATE TABLE `recipe_details`
(
 `recipe_id_pk_fk`   int NOT NULL ,
 `recipe_name_pk_fk` varchar(45) NOT NULL ,
 `servings`          varchar(45) ,
 `serving_size`      varchar(45) ,
 `preptime`          varchar(45) ,
 `cooktime`          varchar(45) ,
PRIMARY KEY (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
KEY `fkIdx_55` (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
CONSTRAINT `FK_55` FOREIGN KEY `fkIdx_55` (`recipe_id_pk_fk`, `recipe_name_pk_fk`) REFERENCES `recipes` (`id`, `recipe_name_pk`) ON UPDATE CASCADE
) ENGINE=INNODB;






-- ************************************** `recipe_instructions`

CREATE TABLE `recipe_instructions`
(
 `recipe_id_pk_fk`   int NOT NULL ,
 `recipe_name_pk_fk` varchar(45) NOT NULL ,
 `step_one`          varchar(255) NOT NULL ,
PRIMARY KEY (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
KEY `fkIdx_152` (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
CONSTRAINT `FK_152` FOREIGN KEY `fkIdx_152` (`recipe_id_pk_fk`, `recipe_name_pk_fk`) REFERENCES `recipe_details` (`recipe_id_pk_fk`, `recipe_name_pk_fk`) ON UPDATE CASCADE
) ENGINE=INNODB;






-- ************************************** `recipe_ingredients`

CREATE TABLE `recipe_ingredients`
(
 `recipe_id_pk_fk`    int NOT NULL ,
 `recipe_name_pk_fk`  varchar(45) NOT NULL ,
 `ingredient1_name`   varchar(45) NOT NULL ,
 `ingredient1_amount` varchar(45) NOT NULL ,
PRIMARY KEY (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
KEY `fkIdx_143` (`recipe_id_pk_fk`, `recipe_name_pk_fk`),
CONSTRAINT `FK_143` FOREIGN KEY `fkIdx_143` (`recipe_id_pk_fk`, `recipe_name_pk_fk`) REFERENCES `recipe_details` (`recipe_id_pk_fk`, `recipe_name_pk_fk`) ON UPDATE CASCADE
) ENGINE=INNODB;





