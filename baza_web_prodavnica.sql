/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.20-MariaDB : Database - prodavnica_tehnike
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prodavnica_tehnike` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `prodavnica_tehnike`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `executed` tinyint(4) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_756f53ab9466eb52a52619ee019` (`userId`),
  CONSTRAINT `FK_756f53ab9466eb52a52619ee019` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cart` */

insert  into `cart`(`id`,`userId`,`executed`,`adress`,`phone`) values 
(13,1,0,'Milana Bartoša  37','0615040256'),
(14,4,0,'Milana Bartoša  37','0615040256'),
(15,5,0,'Ulica Oslobodjenja 22','065235568'),
(16,6,0,'Urosevacka 6','063565898');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`timestamp`,`name`) values 
(1,1616683511479,'createUser1616683511479'),
(2,1616683958546,'createProduct1616683958546'),
(3,1616684092971,'createCart1616684092971'),
(4,1616684169908,'updateOrder1616684169908'),
(5,1617194626270,'AddedUsernameToUserAndExecutedColumnToCart1617194626270'),
(6,1617477082034,'AddedPhoneAndAdressToCart1617477082034');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `ammount` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`cartId`),
  KEY `FK_fe3963d525b2ee03ba471953a7c` (`cartId`),
  CONSTRAINT `FK_88991860e839c6153a7ec878d39` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_fe3963d525b2ee03ba471953a7c` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order` */

insert  into `order`(`ammount`,`productId`,`cartId`) values 
(2,12,16),
(2,13,13),
(1,14,14),
(1,15,15),
(1,18,15);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `productCategoryId` int(11) DEFAULT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_618194d24a7ea86a165d7ec628e` (`productCategoryId`),
  CONSTRAINT `FK_618194d24a7ea86a165d7ec628e` FOREIGN KEY (`productCategoryId`) REFERENCES `product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`,`price`,`productCategoryId`,`picture`) values 
(12,'Samsung galaxy S10','6GB ram, octa-core ...',70000,2,'download.jpg'),
(13,'Samsung Smart televizor 43\" UE43TU8072UXXH','Dijagolana odličnog smart televizora od 43\"\n4K UHD rezolucija sa 4 puta više piksela\nCrystal 4K procesorska snaga za jasniji prikaz slika\nA klasa energetske efikasnosti\nTizen operativni sistem',50000,1,'download (1).jpg'),
(14,'Huawei P40 Lite - Crni','Veličina ekrana: 6,4 inča\nRezolucija ekrana: 2310 x 1080 piksela\n6 GB RAM + 128 GB ROM\nZadnja kamera:\n48 MP (sočivo širokog ugla, f/1.8 otvor) + 8 MP (sočivo ultra širokog ugla) + 2 MP (Macro sečivo) + 2 MP (Bokeh sečivo)',29990,2,'p40lite.jpg'),
(15,'Apple AirPods 2 (2019)','Tip: In-ear slušalice\nPovezivanje: Bluetooth\nBoja: Metallic sky',28000,4,'airpods.jpg'),
(16,'Lenovo Laptop 81X1008SYA 14\"/Intel Core i5/8 GB/512 GB/Windows 10 Home 64','Ekran: 14\" FHD, IPS, Glossy\nProcesor: Intel Core i5-1035G1\nMemorija: 8 GB DDR4 - 3200 MHz\nHard disk: 512 GB SSD\nGrafička karta: Intel UHD Graphics\nOperativni sistem: Windows 10 Home 64',98790,3,'lenovo1.jpg'),
(17,'Dell Laptop PRO02069 15,6\"/Intel Core i3-1005G1/8 GB DDR4/256 GB SSD','Ekran: 15,6\" Full HD, WVA, Anti-glare\nProcesor: Intel Core i3-1005G1, Dual Core\nMemorija: 8 GB DDR4 - 2666 MHz\nHard disk: 256 GB SSD\nGrafička karta: Intel UHD, deljena\n',57990,3,'dell.jpg'),
(18,'FujiFilm Foto-aparat Instax mini 11 - Beli','SRL mini fotoaparat sa automatskom ekspozicijom\nFokus od 0,6 m do ∞\nObjektiv sastavljen iz dve komponente i dva elementa\nKapacitet baterija do 100 snimaka\nPoseduje selfi mod za fotografisanje na udaljenosti od 30 cm do 50 cm',13490,6,'mini-11-beli.jpg');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`name`) values 
(1,'televizor'),
(2,'telefon'),
(3,'laptop'),
(4,'slusalice'),
(5,'tastatura'),
(6,'fotoaparat');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`firstName`,`lastName`,`category`,`password`,`username`) values 
(1,'a','a','admin','/1rBkZBCSx2I+UGe+UmuVriRDJwWOeh13xo7L6alJlo=','a'),
(2,'','','','/1rBkZBCSx2I+UGe+UmuVg+Tu5Tj7OdyyovAe6mRtCM=','b'),
(3,'c','c','','/1rBkZBCSx2I+UGe+UmuVl/1c+ZBuLvZ8SpOBPaRWNs=','c'),
(4,'Masa','Komazec','','/1rBkZBCSx2I+UGe+UmuVoPEHuMGQJ4/asikZYne9ak=','masa'),
(5,'Angelina','Jelic','','/1rBkZBCSx2I+UGe+UmuVuVLonZ5d+wSJ/dl4rDNWNY=','angelina'),
(6,'Sara','Kovacevic','','/1rBkZBCSx2I+UGe+UmuVuOj1dvxRM+TIi/xgWkU7MM=','sara');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
