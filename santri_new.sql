/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.36-MariaDB : Database - santri
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`santri` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `santri`;

/*Table structure for table `hafalan` */

DROP TABLE IF EXISTS `hafalan`;

CREATE TABLE `hafalan` (
  `id_hafalan` int(10) NOT NULL AUTO_INCREMENT,
  `waktu` datetime DEFAULT CURRENT_TIMESTAMP,
  `nim` varchar(10) DEFAULT NULL,
  `id_target` int(11) DEFAULT NULL,
  `id_surah` int(11) DEFAULT NULL,
  `nama_surah` varchar(30) DEFAULT NULL,
  `ayat` int(11) DEFAULT NULL,
  `status` enum('Tercapai','Belum Tercapai') DEFAULT 'Belum Tercapai',
  PRIMARY KEY (`id_hafalan`),
  KEY `hafalan_ibfk_1` (`nim`),
  KEY `hafalan_ibfk_2` (`id_target`),
  KEY `id_surah` (`id_surah`),
  CONSTRAINT `hafalan_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hafalan_ibfk_2` FOREIGN KEY (`id_target`) REFERENCES `target` (`id_target`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `hafalan` */

insert  into `hafalan`(`id_hafalan`,`waktu`,`nim`,`id_target`,`id_surah`,`nama_surah`,`ayat`,`status`) values 
(13,'2019-09-24 14:39:01','100211',10,110,'An-Nashr',3,'Tercapai'),
(17,'2019-09-24 15:00:30','100211',9,11,'Huud',3,'Tercapai'),
(18,'2019-09-24 15:45:11','100211',8,2,'Al-Baqarah',32,'Tercapai'),
(21,'2019-09-24 15:48:59','4534262',10,3,'Ali `Imran',12,'Belum Tercapai'),
(22,'2019-10-02 14:38:04','100211',10,3,'Ali `Imran',50,'Belum Tercapai'),
(23,'2019-10-10 14:40:11','100211',10,72,'Al-Jin',32,'Tercapai'),
(24,'2019-11-12 14:48:22','4534262',10,72,'Al-Jin',32,'Tercapai'),
(25,'2019-11-13 14:49:28','100211',10,72,'Al-Jin',32,'Tercapai');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama_mahasiswa` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('P','L') DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `prodi` varchar(20) DEFAULT NULL,
  `jurusan` varchar(20) DEFAULT NULL,
  `ipk` double DEFAULT NULL,
  `semester` int(1) DEFAULT NULL,
  `jumlah_hafalan` double DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`nim`,`nama_mahasiswa`,`tempat_lahir`,`tgl_lahir`,`jenis_kelamin`,`alamat`,`prodi`,`jurusan`,`ipk`,`semester`,`jumlah_hafalan`) values 
('100211','Nurhidayah','Lampung','1998-09-13','L','Lampung','S1','Sistem Komputer',3.84,6,23),
('4534262','Syarifah Zakiyyah','Palembang','1998-09-12','P','kenten Laut, Palembang','D4','Teknik Informatika',3,3,2);

/*Table structure for table `orang_tua` */

DROP TABLE IF EXISTS `orang_tua`;

CREATE TABLE `orang_tua` (
  `id_orangtua` int(10) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) DEFAULT NULL,
  `nama_ayah` varchar(25) DEFAULT NULL,
  `nama_ibu` varchar(25) DEFAULT NULL,
  `pekerjaan` varchar(25) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_orangtua`),
  KEY `nim` (`nim`),
  CONSTRAINT `orang_tua_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `orang_tua` */

insert  into `orang_tua`(`id_orangtua`,`nim`,`nama_ayah`,`nama_ibu`,`pekerjaan`,`alamat`) values 
(2,'100211','Sukayat','Sri Warsitin','Tani','Tulang Bawang, Lampung');

/*Table structure for table `surah` */

DROP TABLE IF EXISTS `surah`;

CREATE TABLE `surah` (
  `id_surah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_surah` varchar(50) DEFAULT NULL,
  `jml_ayat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surah`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

/*Data for the table `surah` */

insert  into `surah`(`id_surah`,`nama_surah`,`jml_ayat`) values 
(1,'Al-Faatihah',7),
(2,'Al-Baqarah',286),
(3,'Ali `Imran',200),
(4,'An-Nisaa`',176),
(5,'Al-Maa`idah',120),
(6,'Al-An`am',165),
(7,'Al-A`raaf',206),
(8,'Al-Anfaal',75),
(9,'At-Taubah',129),
(10,'Yunus',109),
(11,'Huud',123),
(12,'Yusuf',111),
(13,'Ar-Ra`d',43),
(14,'Ibrahim',52),
(15,'Al-Hijr',99),
(16,'An-Nahl',128),
(17,'Al-Israa`',111),
(18,'Al-Kahfi',110),
(19,'Maryam',98),
(20,'Thaahaa',135),
(21,'Al-Anbiyaa`',112),
(22,'Al-Hajj',78),
(23,'Al-Mu`minuun',118),
(24,'An-Nuur',64),
(25,'Al-Furqaan',77),
(26,'Asy-Syu`araa`',227),
(27,'An-Naml',93),
(28,'Al-Qashash',88),
(29,'Al-`Ankabuut',69),
(30,'Ar-Ruum',60),
(31,'Luqman',34),
(32,'As-Sajdah',30),
(33,'Al-Ahzab',73),
(34,'Saba`',54),
(35,'Faathir',45),
(36,'Yaasiin',83),
(37,'Ash-Shaaffat',182),
(38,'Shaad',88),
(39,'Az-Zumar',75),
(40,'Al-Mu`min',85),
(41,'Fushshilat',54),
(42,'Asy-Syuura',53),
(43,'Az-Zukhruf',89),
(44,'Ad-Dukhaan',59),
(45,'Al-Jaatsiyah',37),
(46,'Al-Ahqaaf',35),
(47,'Muhammad',38),
(48,'Al-Fath',29),
(49,'Al-Hujuraat',18),
(50,'Qaaf',45),
(51,'Adz-Dzariyaat',60),
(52,'Ath-Thuur',49),
(53,'An-Najm',62),
(54,'Al-Qamar',55),
(55,'Ar-Rahmaan',78),
(56,'Al-Waaqi`ah',96),
(57,'Al-Hadiid',29),
(58,'Al-Mujaadilah',22),
(59,'Al-Hasyr',24),
(60,'Al-Mumtahanah',13),
(61,'Ash-Shaff',14),
(62,'Al-Jumu`ah',11),
(63,'Al-Munaafiquun',11),
(64,'At-Taghaabun',18),
(65,'Ath-Thalaaq',12),
(66,'At-Tahriim',12),
(67,'Al-Mulk',30),
(68,'Al-Qalam',52),
(69,'Al-Haaqqah',52),
(70,'Al-Ma`aarij',44),
(71,'Nuh',28),
(72,'Al-Jin',28),
(73,'Al-Muzzammil',20),
(74,'Al-Muddatstsir',56),
(75,'Al-Qiyaamah',40),
(76,'Al-Insaan',31),
(77,'Al-Mursalaat',50),
(78,'An-Naba`',40),
(79,'An-Nazi`at',46),
(80,'Abasa',42),
(81,'At-Takwiir',29),
(82,'Al-Infithaar',19),
(83,'Al-Muthaffifiin',36),
(84,'Al-Insyiqaaq',25),
(85,'Al-Buruuj',22),
(86,'Ath-Thaariq',17),
(87,'Al-A`laa',19),
(88,'Al-Ghaasyiyah',26),
(89,'Al-Fajr',30),
(90,'Al-Balad',20),
(91,'Asy-Syams',15),
(92,'Al-Lail',21),
(93,'Adh-Dhuhaa',11),
(94,'Al-Insyirah',8),
(95,'At-Tiin',8),
(96,'Al-`Alaq',19),
(97,'Al-Qadr',5),
(98,'Al-Bayyinah',8),
(99,'Al-Zalzalah',8),
(100,'Al-`Aadiyaat',11),
(101,'Al-Qaari`ah',11),
(102,'At-Takaatsur',8),
(103,'Al-`Ashr',3),
(104,'Al-Humazah',9),
(105,'Al-Fiil',5),
(106,'Quraisy',4),
(107,'Al-Maa`uun',7),
(108,'Al-Kautsar',3),
(109,'Al-Kaafiruun',6),
(110,'An-Nashr',3),
(111,'Al-Lahab',5),
(112,'Al-Ikhlash',4),
(113,'Al-Falaq',5),
(114,'An-Naas',6);

/*Table structure for table `target` */

DROP TABLE IF EXISTS `target`;

CREATE TABLE `target` (
  `id_target` int(11) NOT NULL AUTO_INCREMENT,
  `id_surah` int(11) DEFAULT NULL,
  `ayat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_target`),
  KEY `id_surah` (`id_surah`),
  CONSTRAINT `target_ibfk_1` FOREIGN KEY (`id_surah`) REFERENCES `surah` (`id_surah`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `target` */

insert  into `target`(`id_target`,`id_surah`,`ayat`) values 
(8,37,10),
(9,55,32),
(10,71,32),
(11,2,200);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Admin','Mahasiswa','Orang Tua') DEFAULT NULL,
  `status` enum('online','offline') DEFAULT 'offline',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`nama_user`,`username`,`password`,`hak_akses`,`status`) values 
(1,'Rizqi Nurhidayah','admin1','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','Admin','online'),
(2,'Dwiki Likuisa','admin2','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','Admin','offline');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
