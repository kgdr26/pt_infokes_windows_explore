/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 11.8.1-MariaDB : Database - db_windows_explorer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_windows_explorer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `db_windows_explorer`;

/*Table structure for table `mst_icon` */

DROP TABLE IF EXISTS `mst_icon`;

CREATE TABLE `mst_icon` (
  `mi_id` int(11) NOT NULL AUTO_INCREMENT,
  `mi_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_icon` */

insert  into `mst_icon`(`mi_id`,`mi_icon`) values 
(1,'ri-home-line'),
(2,'ri-home-fill'),
(3,'ri-home-2-line'),
(4,'ri-home-2-fill'),
(5,'ri-home-3-line'),
(6,'ri-home-3-fill'),
(7,'ri-home-4-line'),
(8,'ri-home-4-fill'),
(9,'ri-home-5-line'),
(10,'ri-home-5-fill'),
(11,'ri-home-6-line'),
(12,'ri-home-6-fill'),
(13,'ri-home-7-line'),
(14,'ri-home-7-fill'),
(15,'ri-home-8-line'),
(16,'ri-home-8-fill'),
(17,'ri-home-gear-line'),
(18,'ri-home-gear-fill'),
(19,'ri-home-wifi-line'),
(20,'ri-home-wifi-fill'),
(21,'ri-home-smile-line'),
(22,'ri-home-smile-fill'),
(23,'ri-home-smile-2-line'),
(24,'ri-home-smile-2-fill'),
(25,'ri-home-heart-line'),
(26,'ri-home-heart-fill'),
(27,'ri-building-line'),
(28,'ri-building-fill'),
(29,'ri-building-2-line'),
(30,'ri-building-2-fill'),
(31,'ri-building-3-line'),
(32,'ri-building-3-fill'),
(33,'ri-building-4-line'),
(34,'ri-building-4-fill'),
(35,'ri-hotel-line'),
(36,'ri-hotel-fill'),
(37,'ri-community-line'),
(38,'ri-community-fill'),
(39,'ri-government-line'),
(40,'ri-government-fill'),
(41,'ri-bank-line'),
(42,'ri-bank-fill'),
(43,'ri-store-line'),
(44,'ri-store-fill'),
(45,'ri-store-2-line'),
(46,'ri-store-2-fill'),
(47,'ri-store-3-line'),
(48,'ri-store-3-fill'),
(49,'ri-hospital-line'),
(50,'ri-hospital-fill'),
(51,'ri-ancient-gate-line'),
(52,'ri-ancient-gate-fill'),
(53,'ri-ancient-pavilion-line'),
(54,'ri-ancient-pavilion-fill'),
(55,'ri-mail-line'),
(56,'ri-mail-fill'),
(57,'ri-mail-open-line'),
(58,'ri-mail-open-fill'),
(59,'ri-mail-send-line'),
(60,'ri-mail-send-fill'),
(61,'ri-mail-unread-line'),
(62,'ri-mail-unread-fill'),
(63,'ri-mail-add-line'),
(64,'ri-mail-add-fill'),
(65,'ri-mail-check-line'),
(66,'ri-mail-check-fill'),
(67,'ri-mail-close-line'),
(68,'ri-mail-close-fill'),
(69,'ri-mail-download-line'),
(70,'ri-mail-download-fill'),
(71,'ri-mail-forbid-line'),
(72,'ri-mail-forbid-fill'),
(73,'ri-mail-lock-line'),
(74,'ri-mail-lock-fill'),
(75,'ri-mail-settings-line'),
(76,'ri-mail-settings-fill'),
(77,'ri-mail-star-line'),
(78,'ri-mail-star-fill'),
(79,'ri-mail-volume-line'),
(80,'ri-mail-volume-fill'),
(81,'ri-inbox-line'),
(82,'ri-inbox-fill'),
(83,'ri-inbox-archive-line'),
(84,'ri-inbox-archive-fill'),
(85,'ri-inbox-unarchive-line'),
(86,'ri-inbox-unarchive-fill'),
(87,'ri-cloud-line'),
(88,'ri-cloud-fill'),
(89,'ri-cloud-off-line'),
(90,'ri-cloud-off-fill'),
(91,'ri-attachment-line'),
(92,'ri-attachment-fill'),
(93,'ri-profile-line'),
(94,'ri-profile-fill'),
(95,'ri-archive-line'),
(96,'ri-archive-fill'),
(97,'ri-archive-drawer-line'),
(98,'ri-archive-drawer-fill'),
(99,'ri-at-line'),
(100,'ri-at-fill'),
(101,'ri-award-line'),
(102,'ri-award-fill'),
(103,'ri-medal-line'),
(104,'ri-medal-fill'),
(105,'ri-medal-2-line'),
(106,'ri-medal-2-fill'),
(107,'ri-bar-chart-line'),
(108,'ri-bar-chart-fill'),
(109,'ri-bar-chart-horizontal-line'),
(110,'ri-bar-chart-horizontal-fill'),
(111,'ri-bar-chart-2-line'),
(112,'ri-bar-chart-2-fill'),
(113,'ri-bar-chart-box-line'),
(114,'ri-bar-chart-box-fill'),
(115,'ri-bar-chart-grouped-line'),
(116,'ri-bar-chart-grouped-fill'),
(117,'ri-bubble-chart-line'),
(118,'ri-bubble-chart-fill'),
(119,'ri-pie-chart-line'),
(120,'ri-pie-chart-fill'),
(121,'ri-pie-chart-2-line'),
(122,'ri-pie-chart-2-fill'),
(123,'ri-pie-chart-box-line'),
(124,'ri-pie-chart-box-fill'),
(125,'ri-donut-chart-line'),
(126,'ri-donut-chart-fill'),
(127,'ri-line-chart-line'),
(128,'ri-line-chart-fill'),
(129,'ri-bookmark-line'),
(130,'ri-bookmark-fill'),
(131,'ri-bookmark-2-line'),
(132,'ri-bookmark-2-fill'),
(133,'ri-bookmark-3-line'),
(134,'ri-bookmark-3-fill'),
(135,'ri-briefcase-line'),
(136,'ri-briefcase-fill'),
(137,'ri-briefcase-2-line'),
(138,'ri-briefcase-2-fill'),
(139,'ri-briefcase-3-line'),
(140,'ri-briefcase-3-fill'),
(141,'ri-briefcase-4-line'),
(142,'ri-briefcase-4-fill'),
(143,'ri-briefcase-5-line'),
(144,'ri-briefcase-5-fill'),
(145,'ri-calculator-line'),
(146,'ri-calculator-fill'),
(147,'ri-calendar-line'),
(148,'ri-calendar-fill'),
(149,'ri-calendar-2-line'),
(150,'ri-calendar-2-fill'),
(151,'ri-calendar-event-line'),
(152,'ri-calendar-event-fill'),
(153,'ri-calendar-todo-line'),
(154,'ri-calendar-todo-fill'),
(155,'ri-calendar-check-line'),
(156,'ri-calendar-check-fill'),
(157,'ri-customer-service-line'),
(158,'ri-customer-service-fill'),
(159,'ri-customer-service-2-line'),
(160,'ri-customer-service-2-fill'),
(161,'ri-flag-line'),
(162,'ri-flag-fill'),
(163,'ri-flag-2-line'),
(164,'ri-flag-2-fill'),
(165,'ri-global-line'),
(166,'ri-global-fill'),
(167,'ri-honour-line'),
(168,'ri-honour-fill'),
(169,'ri-links-line'),
(170,'ri-links-fill'),
(171,'ri-printer-line'),
(172,'ri-printer-fill'),
(173,'ri-printer-cloud-line'),
(174,'ri-printer-cloud-fill'),
(175,'ri-record-mail-line'),
(176,'ri-record-mail-fill'),
(177,'ri-reply-line'),
(178,'ri-reply-fill'),
(179,'ri-send-plane-line'),
(180,'ri-send-plane-fill'),
(181,'ri-send-plane-2-line'),
(182,'ri-send-plane-2-fill'),
(183,'ri-projector-line'),
(184,'ri-projector-fill'),
(185,'ri-projector-2-line'),
(186,'ri-projector-2-fill'),
(187,'ri-slideshow-line'),
(188,'ri-slideshow-fill'),
(189,'ri-slideshow-2-line'),
(190,'ri-slideshow-2-fill'),
(191,'ri-slideshow-3-line'),
(192,'ri-slideshow-3-fill'),
(193,'ri-slideshow-4-line'),
(194,'ri-slideshow-4-fill'),
(195,'ri-window-line'),
(196,'ri-window-fill'),
(197,'ri-window-2-line'),
(198,'ri-window-2-fill'),
(199,'ri-stack-line'),
(200,'ri-stack-fill'),
(201,'ri-service-line'),
(202,'ri-service-fill'),
(203,'ri-registered-line'),
(204,'ri-registered-fill'),
(205,'ri-trademark-line'),
(206,'ri-trademark-fill'),
(207,'ri-advertisement-line'),
(208,'ri-advertisement-fill'),
(209,'ri-copyright-line'),
(210,'ri-copyright-fill'),
(211,'ri-creative-commons-line'),
(212,'ri-creative-commons-fill'),
(213,'ri-creative-commons-by-line'),
(214,'ri-creative-commons-by-fill'),
(215,'ri-creative-commons-nc-line'),
(216,'ri-creative-commons-nc-fill'),
(217,'ri-creative-commons-nd-line'),
(218,'ri-creative-commons-nd-fill'),
(219,'ri-creative-commons-sa-line'),
(220,'ri-creative-commons-sa-fill'),
(221,'ri-creative-commons-zero-line'),
(222,'ri-creative-commons-zero-fill');

/*Table structure for table `trx_content_folder` */

DROP TABLE IF EXISTS `trx_content_folder`;

CREATE TABLE `trx_content_folder` (
  `tcf_id` int(11) NOT NULL AUTO_INCREMENT,
  `tcf_id_folder` int(11) DEFAULT NULL,
  `tcf_name` varchar(255) DEFAULT NULL,
  `tcf_description` text DEFAULT NULL,
  `tcf_turunan` int(11) DEFAULT NULL,
  `tcf_created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tcf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_content_folder` */

insert  into `trx_content_folder`(`tcf_id`,`tcf_id_folder`,`tcf_name`,`tcf_description`,`tcf_turunan`,`tcf_created_date`) values 
(1,1,'Folder 1','Folder 1',1,'2025-10-03 00:30:56'),
(2,1,'Folder 1 Dari 1','Folder 1 Dari 2',2,'2025-10-03 00:31:55'),
(3,1,'Folder 2 Dari 1','Folder 2 Dari 2\r\n',2,'2025-10-03 00:32:52'),
(4,1,'Folder 2','Ini folder 2',1,'2025-10-03 08:56:10'),
(5,2,'Folder 1 Dari 2','Ini folder 1 Dari 2',3,NULL);

/*Table structure for table `trx_master_folder` */

DROP TABLE IF EXISTS `trx_master_folder`;

CREATE TABLE `trx_master_folder` (
  `tmf_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmf_name` varchar(255) DEFAULT NULL,
  `tmf_mi_id` int(11) DEFAULT NULL,
  `tmf_description` text DEFAULT NULL,
  `tmf_created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tmf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_master_folder` */

insert  into `trx_master_folder`(`tmf_id`,`tmf_name`,`tmf_mi_id`,`tmf_description`,`tmf_created_date`) values 
(1,'Doc Home',1,'Folder ini diperuntukan untuk document yang berkaitan dengan rumah','2025-10-02 22:33:19'),
(2,'Doc School',7,'Folder ini di peruntukan untuk document yang berkaitan dengan pendidikan atau sekolah','2025-10-02 22:34:10'),
(3,'Doc Komunitas',5,'Folder untuk komunitas','2025-10-02 23:58:36'),
(4,'Folder tes 1',17,'sasdasd','2025-10-03 01:13:24'),
(5,'sdfsdfsdf',16,'sdfsdfsdfsdfds','2025-10-03 01:19:20'),
(6,'sdafyhjghjhg',13,'sxzdfsdafsdfdasfsd','2025-10-02 18:19:41'),
(7,'dsdfssdfsdf',12,'cvxvxcvxcv','2025-10-02 18:23:12'),
(8,'ddfhfghg',10,'nbjghjhj','2025-10-02 18:32:54'),
(9,'tess beneran ',10,'nbjghjhj','2025-10-02 18:33:09'),
(10,'fgjjjjjjj',15,'rrrrrrr','2025-10-02 18:41:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
