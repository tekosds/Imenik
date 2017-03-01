/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 10.1.13-MariaDB : Database - imenik
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`imenik` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `imenik`;

/*Table structure for table `kontakt` */

DROP TABLE IF EXISTS `kontakt`;

CREATE TABLE `kontakt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `korisnikID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `korisnikID` (`korisnikID`),
  CONSTRAINT `kontakt_ibfk_1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `kontakt` */

insert  into `kontakt`(`id`,`name`,`lastName`,`email`,`phoneNumber`,`korisnikID`) values (1,'stefan','radenovic','tekosds@gmail.com1','0664105911',1),(2,'mile','mikic','miki','041123131qqq',2),(5,'Stefa','Stevic','tekosds@gmail.com','0651002002',1),(6,'Ludo','Ludo','tekosds@gmail.com','04121123',2);

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `korisnik` */

insert  into `korisnik`(`id`,`username`,`password`,`email`,`phoneNumber`) values (1,'stefan','stefan','tekosds@gmail.com','066410591'),(2,'miki','miki','miki@miki.com','041231312'),(7,'teko','teko','tekosds@gmail.com1','0553131');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
