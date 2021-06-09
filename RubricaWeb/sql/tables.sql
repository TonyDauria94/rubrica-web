CREATE DATABASE `rubrica`;
USE `rubrica`;

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  
  PRIMARY KEY (`id`)
);

CREATE TABLE `emails` (
  `id_contact` bigint UNSIGNED,
  `email` varchar(50),
  
  PRIMARY KEY (`email`)
);

CREATE TABLE `phones` (
  `id_contact` bigint UNSIGNED,
  `phone` varchar(50),
  
  PRIMARY KEY (`phone`)
);


/* AGGIUNGO LE FOREIGN KEY */
ALTER TABLE `emails`
ADD CONSTRAINT `fk_emails_contacts` 
	FOREIGN KEY (`id_contact`) 
	REFERENCES `contacts`(`id`)
	ON DELETE CASCADE;
	
ALTER TABLE `phones`
ADD CONSTRAINT `fk_phones_contacts` 
	FOREIGN KEY (`id_contact`) 
	REFERENCES `contacts`(`id`)
	ON DELETE CASCADE;

INSERT INTO `contacts` (`name`, `surname`) VALUES ('Antonio', 'D\'Auria');
INSERT INTO `contacts` (`name`, `surname`) VALUES ('Giovanni', 'De Falco');
INSERT INTO `contacts` (`name`, `surname`) VALUES ('Michele', 'Ferrara');


INSERT INTO `emails` VALUES ('1', 'tonydauria94@gmail.com');
INSERT INTO `emails` VALUES ('1', 'antonio.dauria@protom.com');
INSERT INTO `phones` VALUES ('1', '23425364235');
INSERT INTO `phones` VALUES ('1', '85675345534');
INSERT INTO `phones` VALUES ('1', '76687456765');
