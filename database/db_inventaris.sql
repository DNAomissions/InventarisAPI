/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.30-MariaDB : Database - db_inventaris
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_inventaris` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_inventaris`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `spesifikasi` text NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `jml_barang` int(5) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `sumber_dana` varchar(255) NOT NULL,
  PRIMARY KEY (`kode_barang`),
  UNIQUE KEY `nama_barang` (`nama_barang`),
  KEY `id_lokasi` (`id_lokasi`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_kondisi` (`id_kondisi`),
  CONSTRAINT `id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `id_kondisi` FOREIGN KEY (`id_kondisi`) REFERENCES `kondisi` (`id_kondisi`),
  CONSTRAINT `id_lokasi` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang` */

/*Table structure for table `barang_ditemukan` */

DROP TABLE IF EXISTS `barang_ditemukan`;

CREATE TABLE `barang_ditemukan` (
  `id_barang_ditemukan` varchar(5) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `spesifikasi` varchar(255) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_barang_ditemukan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang_ditemukan` */

/*Table structure for table `barang_hilang` */

DROP TABLE IF EXISTS `barang_hilang`;

CREATE TABLE `barang_hilang` (
  `id_barang_hilang` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_barang_hilang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang_hilang` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(25) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`kategori`) values 
(1,'TIK'),
(2,'Properti Kelas'),
(3,'ATK'),
(4,'_kfka');

/*Table structure for table `keluar_barang` */

DROP TABLE IF EXISTS `keluar_barang`;

CREATE TABLE `keluar_barang` (
  `id_brg_keluar` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `jml_brg_keluar` int(8) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id_brg_keluar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `keluar_barang` */

/*Table structure for table `kondisi` */

DROP TABLE IF EXISTS `kondisi`;

CREATE TABLE `kondisi` (
  `id_kondisi` int(11) NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `kondisi` */

insert  into `kondisi`(`id_kondisi`,`kondisi`) values 
(1,'Bagus'),
(2,'Perlu perawatan'),
(3,'Rusak');

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level` */

insert  into `level`(`id_level`,`level`) values 
(1,'ketua'),
(2,'petugas'),
(3,'user');

/*Table structure for table `lokasi` */

DROP TABLE IF EXISTS `lokasi`;

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(50) NOT NULL,
  PRIMARY KEY (`id_lokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lokasi` */

/*Table structure for table `masuk_barang` */

DROP TABLE IF EXISTS `masuk_barang`;

CREATE TABLE `masuk_barang` (
  `id_msk_brg` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jml_masuk` int(8) NOT NULL,
  `kode_supplier` varchar(255) NOT NULL,
  PRIMARY KEY (`id_msk_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `masuk_barang` */

/*Table structure for table `pinjam_barang` */

DROP TABLE IF EXISTS `pinjam_barang`;

CREATE TABLE `pinjam_barang` (
  `no_pinjam` varchar(255) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `jml_pinjam` int(11) NOT NULL,
  `nama_peminjam` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `tgl_kembali` date DEFAULT '0000-00-00',
  `keterangan` varchar(30) NOT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`no_pinjam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pinjam_barang` */

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `status` */

insert  into `status`(`id_status`,`status`) values 
(1,'mengajukan'),
(2,'disetujui'),
(3,'diterima'),
(4,'dikembalikan/selesai');

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `kode_barang` varchar(255) NOT NULL,
  `jml_brg_masuk` int(11) NOT NULL DEFAULT '0',
  `jml_brg_keluar` int(11) NOT NULL DEFAULT '0',
  `jml_brg_pinjam` int(11) NOT NULL DEFAULT '0',
  `jml_brg_hilang` int(11) NOT NULL DEFAULT '0',
  `total_brg` int(11) NOT NULL DEFAULT '0',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stok` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `kode_supplier` varchar(5) NOT NULL,
  `nama_supplier` varchar(35) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `telp_supplier` varchar(25) NOT NULL,
  `kota_supplier` varchar(20) NOT NULL,
  PRIMARY KEY (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_level` int(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id_user`,`nama`,`username`,`password`,`id_level`) values 
('U001','Ketua','ketua','00719910bb805741e4b7f28527ecb3ad',1),
('U002','Petugas','petugas','afb91ef692fd08c445e8cb1bab2ccf9c',2),
('U003','User','user','ee11cbb19052e40b07aac0ca060c23ee',3);

/* Trigger structure for table `barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_barang` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
	insert into stok values(new.kode_barang,'0','0','0','0',new.jml_barang,'');
    END */$$


DELIMITER ;

/* Trigger structure for table `barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_barang` AFTER UPDATE ON `barang` FOR EACH ROW BEGIN
	update stok set total_brg = new.jml_barang where kode_barang = new.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_delete_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_delete_barang` BEFORE DELETE ON `barang` FOR EACH ROW BEGIN
	delete from stok where kode_barang = old.kode_barang;
	delete from barang_hilang where kode_barang = old.kode_barang;
	delete from keluar_barang WHERE kode_barang = old.kode_barang;
	delete from masuk_barang WHERE kode_barang = old.kode_barang;
	delete from pinjam_barang WHERE kode_barang = old.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `barang_hilang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_barang_hilang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_barang_hilang` AFTER INSERT ON `barang_hilang` FOR EACH ROW BEGIN
	update stok set jml_brg_hilang = jml_brg_hilang+new.jumlah_barang where kode_barang = new.kode_barang;
	update barang set `jml_barang` = `jml_barang`-new.jumlah_barang where kode_barang = new.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `barang_hilang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_update_barang_hilang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_update_barang_hilang` BEFORE UPDATE ON `barang_hilang` FOR EACH ROW BEGIN
	UPDATE stok SET `jml_brg_hilang` = `jml_brg_hilang`-(new.jumlah_barang-old.jumlah_barang) WHERE kode_barang = old.kode_barang;
	UPDATE barang SET `jml_barang` = jml_barang-(new.jumlah_barang-old.jumlah_barang) WHERE kode_barang = old.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `barang_hilang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_delete_barang_hilang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_delete_barang_hilang` BEFORE DELETE ON `barang_hilang` FOR EACH ROW BEGIN
	UPDATE stok SET `jml_brg_hilang` = `jml_brg_hilang`-old.jumlah_barang WHERE kode_barang = old.kode_barang;
	UPDATE barang SET `jml_barang` = jml_barang+old.jumlah_barang WHERE kode_barang = old.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `keluar_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_keluar_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_keluar_barang` AFTER INSERT ON `keluar_barang` FOR EACH ROW BEGIN
    	UPDATE stok SET jml_brg_keluar = jml_brg_keluar+new.jml_brg_keluar WHERE kode_barang = new.kode_barang;
	UPDATE barang SET jml_barang = jml_barang+new.jml_brg_keluar WHERE kode_barang = new.kode_barang;
	END */$$


DELIMITER ;

/* Trigger structure for table `keluar_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_update_keluar_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_update_keluar_barang` BEFORE UPDATE ON `keluar_barang` FOR EACH ROW BEGIN
	if new.id_status = '4' then
		UPDATE barang SET jml_barang = jml_barang+old.jml_brg_keluar WHERE kode_barang = old.kode_barang;
	end if;
	if new.id_status = '3' THEN
		update stok set `jml_brg_keluar` = `jml_brg_keluar`+old.jml_brg_keluar where kode_barang = old.kode_barang;
		UPDATE barang SET jml_barang = jml_barang-new.jml_brg_keluar WHERE kode_barang = old.kode_barang;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `keluar_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_delete_keluar_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_delete_keluar_barang` BEFORE DELETE ON `keluar_barang` FOR EACH ROW BEGIN
	IF old.id_status = '3' THEN
		UPDATE stok SET `jml_brg_keluar` = `jml_brg_keluar`-old.jml_brg_keluar WHERE kode_barang = old.kode_barang;
		UPDATE barang SET jml_barang = jml_barang+old.jml_brg_keluar WHERE kode_barang = old.kode_barang;
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `masuk_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_masuk_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_masuk_barang` AFTER INSERT ON `masuk_barang` FOR EACH ROW BEGIN
	update stok set jml_brg_masuk = jml_brg_masuk+new.jml_masuk where kode_barang = new.kode_barang;
	update barang set jml_barang = jml_barang+new.jml_masuk where kode_barang = new.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `masuk_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_update_masuk_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_update_masuk_barang` BEFORE UPDATE ON `masuk_barang` FOR EACH ROW BEGIN
	UPDATE stok SET `jml_brg_masuk` = jml_brg_masuk-(old.jml_masuk-new.jml_masuk) WHERE kode_barang = old.kode_barang;
	UPDATE barang SET `jml_barang` = jml_barang-(old.jml_masuk-new.jml_masuk) WHERE kode_barang = old.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `masuk_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_delete_masuk_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_delete_masuk_barang` BEFORE DELETE ON `masuk_barang` FOR EACH ROW BEGIN
	UPDATE stok SET `jml_brg_masuk` = `jml_brg_masuk`-old.jml_masuk WHERE kode_barang = old.kode_barang;
	UPDATE barang SET `jml_barang` = jml_barang-old.jml_masuk WHERE kode_barang = old.kode_barang;
    END */$$


DELIMITER ;

/* Trigger structure for table `pinjam_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_pinjam_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_pinjam_barang` AFTER INSERT ON `pinjam_barang` FOR EACH ROW BEGIN
	UPDATE stok SET jml_brg_pinjam = jml_brg_pinjam+new.jml_pinjam WHERE kode_barang = new.kode_barang;
    	UPDATE barang SET jml_barang = jml_barang-new.jml_pinjam WHERE kode_barang = new.kode_barang;
END */$$


DELIMITER ;

/* Trigger structure for table `pinjam_barang` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_update_pinjam_barang` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_update_pinjam_barang` BEFORE UPDATE ON `pinjam_barang` FOR EACH ROW BEGIN
	IF new.id_status = '4' THEN
		UPDATE barang SET jml_barang = jml_barang+old.jml_pinjam WHERE kode_barang = old.kode_barang;
	END IF;
	if new.id_status = '3' THEN
		UPDATE stok SET jml_brg_pinjam = jml_brg_pinjam+new.jml_pinjam WHERE kode_barang = new.kode_barang;
		update barang set jml_barang = jml_barang-old.jml_pinjam where kode_barang = old.kode_barang;
	end if;
    END */$$


DELIMITER ;

/* Function  structure for function  `getKodeBarang` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarang` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarang`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	declare id varchar(4);
	
		SELECT concat("B",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(kode_barang,2,3),SIGNED))+1,1),3,"0"))) AS "kode_barang" into id FROM barang;
	
	return id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeBarangDitemukan` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarangDitemukan` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarangDitemukan`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("D",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(`id_barang_ditemukan`,2,3),SIGNED))+1,1),3,"0"))) AS "id_barang_ditemukan" INTO id FROM barang_ditemukan;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeBarangHilang` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarangHilang` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarangHilang`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("H",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(id_barang_hilang,2,3),SIGNED))+1,1),3,"0"))) AS "id_barang_hilang" INTO id FROM barang_hilang;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeBarangKeluar` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarangKeluar` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarangKeluar`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("K",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(id_brg_keluar,2,3),SIGNED))+1,1),3,"0"))) AS "id_brg_keluar" INTO id FROM keluar_barang;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeBarangMasuk` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarangMasuk` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarangMasuk`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("M",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(id_msk_brg,2,3),SIGNED))+1,1),3,"0"))) AS "id_msk_brg" INTO id FROM masuk_barang;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeBarangPinjam` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeBarangPinjam` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeBarangPinjam`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("P",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(no_pinjam,2,3),SIGNED))+1,1),3,"0"))) AS "no_pinjam" INTO id FROM pinjam_barang;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeSupplier` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeSupplier` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeSupplier`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("S",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(`kode_supplier`,2,3),SIGNED))+1,1),3,"0"))) AS "kode_supplier" INTO id FROM supplier;
	
	RETURN id;
    END */$$
DELIMITER ;

/* Function  structure for function  `getKodeUser` */

/*!50003 DROP FUNCTION IF EXISTS `getKodeUser` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getKodeUser`() RETURNS varchar(4) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE id VARCHAR(4);
	
		SELECT CONCAT("U",CONCAT_WS("B",LPAD(IFNULL(MAX(CONVERT(SUBSTRING(id_user,2,3),SIGNED))+1,1),3,"0"))) AS "id_user" INTO id FROM user;
	
	RETURN id;
    END */$$
DELIMITER ;

/*Table structure for table `barang_keluar_detail` */

DROP TABLE IF EXISTS `barang_keluar_detail`;

/*!50001 DROP VIEW IF EXISTS `barang_keluar_detail` */;
/*!50001 DROP TABLE IF EXISTS `barang_keluar_detail` */;

/*!50001 CREATE TABLE  `barang_keluar_detail`(
 `id_status` int(11) ,
 `id_user` varchar(255) ,
 `kode_barang` varchar(255) ,
 `id_brg_keluar` varchar(255) ,
 `tgl_keluar` date ,
 `jml_brg_keluar` int(8) ,
 `keperluan` varchar(255) ,
 `nama_barang` varchar(255) ,
 `spesifikasi` text ,
 `id_lokasi` int(11) ,
 `id_kategori` int(11) ,
 `jml_barang` int(5) ,
 `id_kondisi` int(11) ,
 `sumber_dana` varchar(255) ,
 `nama` varchar(255) ,
 `username` varchar(255) ,
 `password` varchar(255) ,
 `id_level` int(1) ,
 `status` varchar(20) 
)*/;

/*Table structure for table `barang_masuk_detail` */

DROP TABLE IF EXISTS `barang_masuk_detail`;

/*!50001 DROP VIEW IF EXISTS `barang_masuk_detail` */;
/*!50001 DROP TABLE IF EXISTS `barang_masuk_detail` */;

/*!50001 CREATE TABLE  `barang_masuk_detail`(
 `kode_supplier` varchar(255) ,
 `kode_barang` varchar(255) ,
 `id_msk_brg` varchar(255) ,
 `tgl_masuk` date ,
 `jml_masuk` int(8) ,
 `nama_barang` varchar(255) ,
 `spesifikasi` text ,
 `id_lokasi` int(11) ,
 `id_kategori` int(11) ,
 `jml_barang` int(5) ,
 `id_kondisi` int(11) ,
 `sumber_dana` varchar(255) ,
 `nama_supplier` varchar(35) ,
 `alamat_supplier` text ,
 `telp_supplier` varchar(25) ,
 `kota_supplier` varchar(20) 
)*/;

/*Table structure for table `barang_pinjam_detail` */

DROP TABLE IF EXISTS `barang_pinjam_detail`;

/*!50001 DROP VIEW IF EXISTS `barang_pinjam_detail` */;
/*!50001 DROP TABLE IF EXISTS `barang_pinjam_detail` */;

/*!50001 CREATE TABLE  `barang_pinjam_detail`(
 `id_status` int(11) ,
 `id_user` varchar(255) ,
 `kode_barang` varchar(255) ,
 `no_pinjam` varchar(255) ,
 `tgl_pinjam` date ,
 `jml_pinjam` int(11) ,
 `tgl_kembali` date ,
 `keterangan` varchar(30) ,
 `nama_barang` varchar(255) ,
 `spesifikasi` text ,
 `id_lokasi` int(11) ,
 `id_kategori` int(11) ,
 `jml_barang` int(5) ,
 `id_kondisi` int(11) ,
 `sumber_dana` varchar(255) ,
 `nama` varchar(255) ,
 `username` varchar(255) ,
 `password` varchar(255) ,
 `id_level` int(1) ,
 `status` varchar(20) 
)*/;

/*Table structure for table `dashboard` */

DROP TABLE IF EXISTS `dashboard`;

/*!50001 DROP VIEW IF EXISTS `dashboard` */;
/*!50001 DROP TABLE IF EXISTS `dashboard` */;

/*!50001 CREATE TABLE  `dashboard`(
 `bd` bigint(21) ,
 `jbd` decimal(32,0) ,
 `bm` bigint(21) ,
 `jbm` decimal(32,0) ,
 `bk` bigint(21) ,
 `jbk` decimal(32,0) ,
 `bp` bigint(21) ,
 `jbp` decimal(32,0) ,
 `bh` bigint(21) ,
 `jbh` decimal(32,0) 
)*/;

/*View structure for view barang_keluar_detail */

/*!50001 DROP TABLE IF EXISTS `barang_keluar_detail` */;
/*!50001 DROP VIEW IF EXISTS `barang_keluar_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_keluar_detail` AS (select `keluar_barang`.`id_status` AS `id_status`,`keluar_barang`.`id_user` AS `id_user`,`keluar_barang`.`kode_barang` AS `kode_barang`,`keluar_barang`.`id_brg_keluar` AS `id_brg_keluar`,`keluar_barang`.`tgl_keluar` AS `tgl_keluar`,`keluar_barang`.`jml_brg_keluar` AS `jml_brg_keluar`,`keluar_barang`.`keperluan` AS `keperluan`,`barang`.`nama_barang` AS `nama_barang`,`barang`.`spesifikasi` AS `spesifikasi`,`barang`.`id_lokasi` AS `id_lokasi`,`barang`.`id_kategori` AS `id_kategori`,`barang`.`jml_barang` AS `jml_barang`,`barang`.`id_kondisi` AS `id_kondisi`,`barang`.`sumber_dana` AS `sumber_dana`,`user`.`nama` AS `nama`,`user`.`username` AS `username`,`user`.`password` AS `password`,`user`.`id_level` AS `id_level`,`status`.`status` AS `status` from (((`keluar_barang` join `barang` on((`keluar_barang`.`kode_barang` = `barang`.`kode_barang`))) join `user` on((`keluar_barang`.`id_user` = `user`.`id_user`))) join `status` on((`keluar_barang`.`id_status` = `status`.`id_status`)))) */;

/*View structure for view barang_masuk_detail */

/*!50001 DROP TABLE IF EXISTS `barang_masuk_detail` */;
/*!50001 DROP VIEW IF EXISTS `barang_masuk_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_masuk_detail` AS (select `masuk_barang`.`kode_supplier` AS `kode_supplier`,`masuk_barang`.`kode_barang` AS `kode_barang`,`masuk_barang`.`id_msk_brg` AS `id_msk_brg`,`masuk_barang`.`tgl_masuk` AS `tgl_masuk`,`masuk_barang`.`jml_masuk` AS `jml_masuk`,`barang`.`nama_barang` AS `nama_barang`,`barang`.`spesifikasi` AS `spesifikasi`,`barang`.`id_lokasi` AS `id_lokasi`,`barang`.`id_kategori` AS `id_kategori`,`barang`.`jml_barang` AS `jml_barang`,`barang`.`id_kondisi` AS `id_kondisi`,`barang`.`sumber_dana` AS `sumber_dana`,`supplier`.`nama_supplier` AS `nama_supplier`,`supplier`.`alamat_supplier` AS `alamat_supplier`,`supplier`.`telp_supplier` AS `telp_supplier`,`supplier`.`kota_supplier` AS `kota_supplier` from ((`masuk_barang` join `barang` on((`masuk_barang`.`kode_barang` = `barang`.`kode_barang`))) join `supplier` on((`masuk_barang`.`kode_supplier` = `supplier`.`kode_supplier`)))) */;

/*View structure for view barang_pinjam_detail */

/*!50001 DROP TABLE IF EXISTS `barang_pinjam_detail` */;
/*!50001 DROP VIEW IF EXISTS `barang_pinjam_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_pinjam_detail` AS (select `pinjam_barang`.`id_status` AS `id_status`,`pinjam_barang`.`id_user` AS `id_user`,`pinjam_barang`.`kode_barang` AS `kode_barang`,`pinjam_barang`.`no_pinjam` AS `no_pinjam`,`pinjam_barang`.`tgl_pinjam` AS `tgl_pinjam`,`pinjam_barang`.`jml_pinjam` AS `jml_pinjam`,`pinjam_barang`.`tgl_kembali` AS `tgl_kembali`,`pinjam_barang`.`keterangan` AS `keterangan`,`barang`.`nama_barang` AS `nama_barang`,`barang`.`spesifikasi` AS `spesifikasi`,`barang`.`id_lokasi` AS `id_lokasi`,`barang`.`id_kategori` AS `id_kategori`,`barang`.`jml_barang` AS `jml_barang`,`barang`.`id_kondisi` AS `id_kondisi`,`barang`.`sumber_dana` AS `sumber_dana`,`user`.`nama` AS `nama`,`user`.`username` AS `username`,`user`.`password` AS `password`,`user`.`id_level` AS `id_level`,`status`.`status` AS `status` from (((`pinjam_barang` join `barang` on((`pinjam_barang`.`kode_barang` = `barang`.`kode_barang`))) join `user` on((`pinjam_barang`.`id_user` = `user`.`id_user`))) join `status` on((`pinjam_barang`.`id_status` = `status`.`id_status`)))) */;

/*View structure for view dashboard */

/*!50001 DROP TABLE IF EXISTS `dashboard` */;
/*!50001 DROP VIEW IF EXISTS `dashboard` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dashboard` AS (select (select count(`barang_ditemukan`.`id_barang_ditemukan`) from `barang_ditemukan`) AS `bd`,(select sum(`barang_ditemukan`.`jumlah_barang`) from `barang_ditemukan`) AS `jbd`,(select count(`masuk_barang`.`id_msk_brg`) from `masuk_barang`) AS `bm`,sum(`stok`.`jml_brg_masuk`) AS `jbm`,(select count(`keluar_barang`.`id_brg_keluar`) from `keluar_barang`) AS `bk`,sum(`stok`.`jml_brg_keluar`) AS `jbk`,(select count(`pinjam_barang`.`no_pinjam`) from `pinjam_barang`) AS `bp`,sum(`stok`.`jml_brg_pinjam`) AS `jbp`,(select count(`barang_hilang`.`id_barang_hilang`) from `barang_hilang`) AS `bh`,sum(`stok`.`jml_brg_hilang`) AS `jbh` from `stok`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
