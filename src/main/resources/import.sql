-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for employroll
CREATE DATABASE IF NOT EXISTS `employroll` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `employroll`;


-- Dumping structure for table employroll.device_and_sim_details
CREATE TABLE IF NOT EXISTS `device_and_sim_details` (
  `dasd_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_pairing` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `device_details` int(11) DEFAULT NULL,
  `sim_details` int(11) DEFAULT NULL,
  `device_details_id` bigint(20) DEFAULT NULL,
  `sim_details_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dasd_id`),
  KEY `FK_np0vl1csjtt5icj7v4yn0u81d` (`device_details`),
  KEY `FK_4369p30k9m185cmcsq9ub8hk` (`sim_details`),
  KEY `FK_mvh3ym797ia0f86jxjr7fhtre` (`sim_details_id`),
  CONSTRAINT `FK_4369p30k9m185cmcsq9ub8hk` FOREIGN KEY (`sim_details`) REFERENCES `sim_details` (`sim_id`),
  CONSTRAINT `FK_mvh3ym797ia0f86jxjr7fhtre` FOREIGN KEY (`sim_details_id`) REFERENCES `sim_details` (`sim_id`),
  CONSTRAINT `FK_np0vl1csjtt5icj7v4yn0u81d` FOREIGN KEY (`device_details`) REFERENCES `device_details` (`device_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.device_and_sim_details: ~0 rows (approximately)
DELETE FROM `device_and_sim_details`;
/*!40000 ALTER TABLE `device_and_sim_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_and_sim_details` ENABLE KEYS */;


-- Dumping structure for table employroll.device_details
CREATE TABLE IF NOT EXISTS `device_details` (
  `device_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` bigint(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `device_type` int(11) DEFAULT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`device_detail_id`),
  KEY `FK_al7roa9gd8maqt44fqmoh1cby` (`device_type`),
  KEY `FK_ayxmwxqk6vc00o1ravx04b0lf` (`device_type_id`),
  CONSTRAINT `FK_al7roa9gd8maqt44fqmoh1cby` FOREIGN KEY (`device_type`) REFERENCES `device_type` (`device_type_id`),
  CONSTRAINT `FK_ayxmwxqk6vc00o1ravx04b0lf` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`device_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.device_details: ~0 rows (approximately)
DELETE FROM `device_details`;
/*!40000 ALTER TABLE `device_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_details` ENABLE KEYS */;


-- Dumping structure for table employroll.device_type
CREATE TABLE IF NOT EXISTS `device_type` (
  `device_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_cost` float NOT NULL,
  `device_model` int(11) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `min_installment_percentage` float NOT NULL,
  PRIMARY KEY (`device_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.device_type: ~0 rows (approximately)
DELETE FROM `device_type`;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;


-- Dumping structure for table employroll.franchisee_details
CREATE TABLE IF NOT EXISTS `franchisee_details` (
  `franchisee_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contact` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `franchisee_name` varchar(255) DEFAULT NULL,
  `pincode` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `franchisee_personnel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`franchisee_id`),
  KEY `FK_9qsa1ggrcruqvh7fc3cbh9bif` (`franchisee_personnel_id`),
  CONSTRAINT `FK_9qsa1ggrcruqvh7fc3cbh9bif` FOREIGN KEY (`franchisee_personnel_id`) REFERENCES `franchisee_personnel` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.franchisee_details: ~0 rows (approximately)
DELETE FROM `franchisee_details`;
/*!40000 ALTER TABLE `franchisee_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_details` ENABLE KEYS */;


-- Dumping structure for table employroll.franchisee_personnel
CREATE TABLE IF NOT EXISTS `franchisee_personnel` (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `franchisee_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.franchisee_personnel: ~0 rows (approximately)
DELETE FROM `franchisee_personnel`;
/*!40000 ALTER TABLE `franchisee_personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_personnel` ENABLE KEYS */;


-- Dumping structure for table employroll.franchisee_sales_force
CREATE TABLE IF NOT EXISTS `franchisee_sales_force` (
  `sales_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `person_photo` varchar(1200) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `device_details_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sales_person_id`),
  KEY `FK_s7ifaaqw1b5cgmibc5q0jx2uj` (`device_details_id`),
  CONSTRAINT `FK_s7ifaaqw1b5cgmibc5q0jx2uj` FOREIGN KEY (`device_details_id`) REFERENCES `franchisee_details` (`franchisee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.franchisee_sales_force: ~0 rows (approximately)
DELETE FROM `franchisee_sales_force`;
/*!40000 ALTER TABLE `franchisee_sales_force` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_sales_force` ENABLE KEYS */;


-- Dumping structure for table employroll.organisation_branch_details
CREATE TABLE IF NOT EXISTS `organisation_branch_details` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `organisation_details_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `FK_g64dq50poauwe8nwyhbbh5f7` (`organisation_details_id`),
  CONSTRAINT `FK_g64dq50poauwe8nwyhbbh5f7` FOREIGN KEY (`organisation_details_id`) REFERENCES `organisation_details` (`organisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.organisation_branch_details: ~0 rows (approximately)
DELETE FROM `organisation_branch_details`;
/*!40000 ALTER TABLE `organisation_branch_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `organisation_branch_details` ENABLE KEYS */;


-- Dumping structure for table employroll.organisation_details
CREATE TABLE IF NOT EXISTS `organisation_details` (
  `organisation_id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `organisation_logo` varchar(255) DEFAULT NULL,
  `organisation_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.organisation_details: ~0 rows (approximately)
DELETE FROM `organisation_details`;
/*!40000 ALTER TABLE `organisation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `organisation_details` ENABLE KEYS */;


-- Dumping structure for table employroll.organisation_device_details
CREATE TABLE IF NOT EXISTS `organisation_device_details` (
  `organisation_device_details_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_and_sim_id` int(11) DEFAULT NULL,
  `organisation_branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`organisation_device_details_id`),
  KEY `FK_5baca21frvkt71yyv2b3ub3ay` (`device_and_sim_id`),
  KEY `FK_p7wxluxrky5lbonrex21x5fdt` (`organisation_branch_id`),
  CONSTRAINT `FK_5baca21frvkt71yyv2b3ub3ay` FOREIGN KEY (`device_and_sim_id`) REFERENCES `device_and_sim_details` (`dasd_id`),
  CONSTRAINT `FK_p7wxluxrky5lbonrex21x5fdt` FOREIGN KEY (`organisation_branch_id`) REFERENCES `organisation_branch_details` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.organisation_device_details: ~0 rows (approximately)
DELETE FROM `organisation_device_details`;
/*!40000 ALTER TABLE `organisation_device_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `organisation_device_details` ENABLE KEYS */;


-- Dumping structure for table employroll.security_group
CREATE TABLE IF NOT EXISTS `security_group` (
  `group_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.security_group: ~4 rows (approximately)
DELETE FROM `security_group`;
/*!40000 ALTER TABLE `security_group` DISABLE KEYS */;
INSERT INTO `security_group` (`group_id`, `description`) VALUES
	('ADMIN', 'SUPER ADMIN OF EMPLOYROLL'),
	('COMPANY_ADMIN', 'COMPANY ADMIN WHO HAS PURCHASED THE DEVICE'),
	('COMPANY_EMPLOYEE', 'PERSON WHO IS THE EMPLOYEE OF COMPANY'),
	('FRANCHISEE', 'THE ONE WHO IS THE PARTNER WITH EMPLOYROLL');
/*!40000 ALTER TABLE `security_group` ENABLE KEYS */;


-- Dumping structure for table employroll.security_group_permission
CREATE TABLE IF NOT EXISTS `security_group_permission` (
  `group_id` varchar(20) NOT NULL,
  `permission_id` varchar(60) NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `FK_ml0oo9j78ajpk8092xm6uslht` (`group_id`),
  KEY `FK_3qol2884bucve7ev4358d72dx` (`permission_id`),
  CONSTRAINT `FK_3qol2884bucve7ev4358d72dx` FOREIGN KEY (`permission_id`) REFERENCES `security_permission` (`permission_id`),
  CONSTRAINT `FK_ml0oo9j78ajpk8092xm6uslht` FOREIGN KEY (`group_id`) REFERENCES `security_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.security_group_permission: ~2 rows (approximately)
DELETE FROM `security_group_permission`;
/*!40000 ALTER TABLE `security_group_permission` DISABLE KEYS */;
INSERT INTO `security_group_permission` (`group_id`, `permission_id`) VALUES
	('ADMIN', 'COMPANY_REGISTRATION:CREATE'),
	('FRANCHISEE', 'COMPANY_REGISTRATION:CREATE');
/*!40000 ALTER TABLE `security_group_permission` ENABLE KEYS */;


-- Dumping structure for table employroll.security_permission
CREATE TABLE IF NOT EXISTS `security_permission` (
  `permission_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.security_permission: ~1 rows (approximately)
DELETE FROM `security_permission`;
/*!40000 ALTER TABLE `security_permission` DISABLE KEYS */;
INSERT INTO `security_permission` (`permission_id`, `description`) VALUES
	('COMPANY_REGISTRATION:CREATE', 'PERMISSION TO CREATE COMPANY');
/*!40000 ALTER TABLE `security_permission` ENABLE KEYS */;


-- Dumping structure for table employroll.service_subscription_pack
CREATE TABLE IF NOT EXISTS `service_subscription_pack` (
  `subscription_pack_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_per_employee` float NOT NULL,
  `max_emp_no` int(11) NOT NULL,
  `min_emp_no` int(11) NOT NULL,
  `months` int(11) NOT NULL,
  `pack_purchasing_date` date DEFAULT NULL,
  `service_subs_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `years` int(11) NOT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscription_pack_id`),
  KEY `FK_8hi0fnv1a3od78jxdrdgtpvhi` (`service_type_id`),
  CONSTRAINT `FK_8hi0fnv1a3od78jxdrdgtpvhi` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.service_subscription_pack: ~0 rows (approximately)
DELETE FROM `service_subscription_pack`;
/*!40000 ALTER TABLE `service_subscription_pack` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_subscription_pack` ENABLE KEYS */;


-- Dumping structure for table employroll.service_type
CREATE TABLE IF NOT EXISTS `service_type` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `FK_lbr75o3ebnf89lf4h19a4qwmp` (`device_type_id`),
  CONSTRAINT `FK_lbr75o3ebnf89lf4h19a4qwmp` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`device_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.service_type: ~0 rows (approximately)
DELETE FROM `service_type`;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;


-- Dumping structure for table employroll.sim_details
CREATE TABLE IF NOT EXISTS `sim_details` (
  `sim_id` int(11) NOT NULL AUTO_INCREMENT,
  `mob_no` int(11) NOT NULL,
  `sim_no` int(11) NOT NULL,
  PRIMARY KEY (`sim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.sim_details: ~0 rows (approximately)
DELETE FROM `sim_details`;
/*!40000 ALTER TABLE `sim_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sim_details` ENABLE KEYS */;


-- Dumping structure for table employroll.user_login
CREATE TABLE IF NOT EXISTS `user_login` (
  `user_id` varchar(255) NOT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expiry_date_time` datetime DEFAULT NULL,
  `password` varchar(800) DEFAULT NULL,
  `salt` varchar(1200) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_profile_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.user_login: ~5 rows (approximately)
DELETE FROM `user_login`;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` (`user_id`, `logged_in`, `name`, `otp`, `otp_expiry_date_time`, `password`, `salt`, `status`, `user_type`, `user_profile_image`) VALUES
	('admin@employroll.com', 0, 'SUPER ADMIN', NULL, '2017-02-22 16:59:14', '44d997fc662132f5ffd1d5b03d3e1bc58b357b923f266474f762986be2d523e13268b704fc8cb70eeeeb643e28dc45fdd6651836dfcd2571495bf73825d38453', 'fe789c90c838ee9451805cf04e5426ef2074660760bc50053350c3bc5d402eb41f70dd507eb2a656ee287ac48c933181de9156bb8f6bc17e5109de73363418bbc9e61d2dcda4af6b5e22c19c249b354291446837ddb05780006a812e3efbffa1a7e108b035619d8987f8d0e8bb5399bec32b214e321026f6dc3bbf806902ea4a', 'active', NULL, 'https://lh3.googleusercontent.com/-1OuokGKNHYA/AAAAAAAAAAI/AAAAAAAAAAA/AAomvV3uZKU8w82ckM6PsBirVfK8GgM5Ag/s32-c-mo/photo.jpg'),
	('companyadmin@employroll.com', 0, 'COMPANY ADMIN', NULL, '2017-02-22 16:59:14', '44d997fc662132f5ffd1d5b03d3e1bc58b357b923f266474f762986be2d523e13268b704fc8cb70eeeeb643e28dc45fdd6651836dfcd2571495bf73825d38453', 'fe789c90c838ee9451805cf04e5426ef2074660760bc50053350c3bc5d402eb41f70dd507eb2a656ee287ac48c933181de9156bb8f6bc17e5109de73363418bbc9e61d2dcda4af6b5e22c19c249b354291446837ddb05780006a812e3efbffa1a7e108b035619d8987f8d0e8bb5399bec32b214e321026f6dc3bbf806902ea4a', 'active', NULL, NULL),
	('employee1@employroll.com', 0, 'EMPLOYEE 2', NULL, '2017-02-22 16:59:14', '44d997fc662132f5ffd1d5b03d3e1bc58b357b923f266474f762986be2d523e13268b704fc8cb70eeeeb643e28dc45fdd6651836dfcd2571495bf73825d38453', 'fe789c90c838ee9451805cf04e5426ef2074660760bc50053350c3bc5d402eb41f70dd507eb2a656ee287ac48c933181de9156bb8f6bc17e5109de73363418bbc9e61d2dcda4af6b5e22c19c249b354291446837ddb05780006a812e3efbffa1a7e108b035619d8987f8d0e8bb5399bec32b214e321026f6dc3bbf806902ea4a', 'active', NULL, NULL),
	('employee2@employroll.com', 0, 'EMPLOYEE 1', NULL, '2017-02-22 16:59:14', '44d997fc662132f5ffd1d5b03d3e1bc58b357b923f266474f762986be2d523e13268b704fc8cb70eeeeb643e28dc45fdd6651836dfcd2571495bf73825d38453', 'fe789c90c838ee9451805cf04e5426ef2074660760bc50053350c3bc5d402eb41f70dd507eb2a656ee287ac48c933181de9156bb8f6bc17e5109de73363418bbc9e61d2dcda4af6b5e22c19c249b354291446837ddb05780006a812e3efbffa1a7e108b035619d8987f8d0e8bb5399bec32b214e321026f6dc3bbf806902ea4a', 'active', NULL, NULL),
	('franchisee@employroll.com', 0, 'FRANCHISEE', NULL, '2017-02-22 16:59:14', '44d997fc662132f5ffd1d5b03d3e1bc58b357b923f266474f762986be2d523e13268b704fc8cb70eeeeb643e28dc45fdd6651836dfcd2571495bf73825d38453', 'fe789c90c838ee9451805cf04e5426ef2074660760bc50053350c3bc5d402eb41f70dd507eb2a656ee287ac48c933181de9156bb8f6bc17e5109de73363418bbc9e61d2dcda4af6b5e22c19c249b354291446837ddb05780006a812e3efbffa1a7e108b035619d8987f8d0e8bb5399bec32b214e321026f6dc3bbf806902ea4a', 'active', NULL, NULL);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;


-- Dumping structure for table employroll.user_login_security_group
CREATE TABLE IF NOT EXISTS `user_login_security_group` (
  `group_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `FK_4f4xeeeo43wtyxs7fn5hcy6d9` (`group_id`),
  KEY `FK_dl7f5ae2vgt6mjga6o8shlxrh` (`user_id`),
  CONSTRAINT `FK_4f4xeeeo43wtyxs7fn5hcy6d9` FOREIGN KEY (`group_id`) REFERENCES `security_group` (`group_id`),
  CONSTRAINT `FK_dl7f5ae2vgt6mjga6o8shlxrh` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employroll.user_login_security_group: ~3 rows (approximately)
DELETE FROM `user_login_security_group`;
/*!40000 ALTER TABLE `user_login_security_group` DISABLE KEYS */;
INSERT INTO `user_login_security_group` (`group_id`, `user_id`) VALUES
	('ADMIN', 'admin@employroll.com'),
	('COMPANY_ADMIN', 'companyadmin@employroll.com'),
	('FRANCHISEE', 'franchisee@employroll.com');
/*!40000 ALTER TABLE `user_login_security_group` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
