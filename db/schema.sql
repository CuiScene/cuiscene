-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;
CREATE DATABASE cuiscene;

USE cuiscene;

-- ************************************** `users`

CREATE TABLE `users`
(
 `username_pk`  varchar(45) NOT NULL ,
 `birthday`     date ,
 `restrictions` varchar(45) ,
 `zipcode`      int(5) NOT NULL ,
PRIMARY KEY (`username_pk`)
);






-- ************************************** `user_entries`

CREATE TABLE `user_entries`
(
 `id`                 int NOT NULL AUTO_INCREMENT ,
 `restaurant_name_pk` varchar(45) NOT NULL ,
 `username_fk`        varchar(45) NOT NULL ,
 `date`               date NOT NULL ,
 `zipcode`            int(5) NOT NULL ,
 `menu_item`          varchar(45) NOT NULL ,
 `notes`              varchar(255) ,
 `rating`             decimal(1,1) NOT NULL ,
 `price`              decimal(3,2) NOT NULL ,
PRIMARY KEY (`id`, `restaurant_name_pk`),
KEY `fkIdx_27` (`username_fk`),
CONSTRAINT `FK_27` FOREIGN KEY `fkIdx_27` (`username_fk`) REFERENCES `users` (`username_pk`)
);






-- ************************************** `restaurants`

CREATE TABLE `restaurants`
(
 `user_entry_id_fk`      int NOT NULL ,
 `restaurant_name_pk_fk` varchar(45) NOT NULL ,
 `cuisine`               varchar(45) NOT NULL ,
 `location`              varchar(45) NOT NULL ,
 `rating`                decimal(1,1) ,
 `breakfast`             boolean ,
 `brunch`                boolean ,
 `lunch`                 boolean ,
 `happy_hour`            boolean ,
 `dinner`                boolean ,
 `late_night`            boolean ,
PRIMARY KEY (`user_entry_id_fk`, `restaurant_name_pk_fk`),
KEY `fkIdx_70` (`user_entry_id_fk`, `restaurant_name_pk_fk`),
CONSTRAINT `FK_70` FOREIGN KEY `fkIdx_70` (`user_entry_id_fk`, `restaurant_name_pk_fk`) REFERENCES `user_entries` (`id`, `restaurant_name_pk`)
);






-- ************************************** `recipes`

CREATE TABLE `recipes`
(
 `id`                 int NOT NULL ,
 `user_entry_id_fk`   int NOT NULL ,
 `recipe_name`        varchar(45) NOT NULL ,
 `recipe_menu_item`   varchar(45) NOT NULL ,
 `recipe_cuisine`     varchar(45) NOT NULL ,
 `recipe_tags`        varchar(45) NOT NULL ,
 `restaurant_name_fk` varchar(45) NOT NULL ,
PRIMARY KEY (`user_entry_id_fk`, `id`, `recipe_name`),
KEY `fkIdx_75` (`user_entry_id_fk`, `restaurant_name_fk`),
CONSTRAINT `FK_75` FOREIGN KEY `fkIdx_75` (`user_entry_id_fk`, `restaurant_name_fk`) REFERENCES `user_entries` (`id`, `restaurant_name_pk`)
);






-- ************************************** `recipe_details`

CREATE TABLE `recipe_details`
(
 `recipe_id_fk`       int NOT NULL ,
 `recipe_name_fk`     varchar(45) NOT NULL ,
 `user_entry_id_fk`   int NOT NULL ,
 `ingredient1_name`   varchar(45) NOT NULL ,
 `ingredient1_amount` varchar(45) NOT NULL ,
 `ingredient2_name`   varchar(45) NOT NULL ,
 `ingredient2_amount` varchar(45) NOT NULL ,
PRIMARY KEY (`user_entry_id_fk`, `recipe_id_fk`, `recipe_name_fk`),
KEY `fkIdx_55` (`user_entry_id_fk`, `recipe_id_fk`, `recipe_name_fk`),
CONSTRAINT `FK_55` FOREIGN KEY `fkIdx_55` (`user_entry_id_fk`, `recipe_id_fk`, `recipe_name_fk`) REFERENCES `recipes` (`user_entry_id_fk`, `id`, `recipe_name`)
);





