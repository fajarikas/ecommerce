-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creation Time: Sep 4, 2023 at 05:40
-- Server Version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `ecommerece`

DELIMITER $$

-- Procedure
CREATE DEFINER=`fajarikasaputra`@`localhost` PROCEDURE `getcat` (IN `cid` INT)
BEGIN
  SELECT * FROM categories WHERE cat_id = cid;
END $$

DELIMITER ;

-- Structure of table `admin_info`
CREATE TABLE `admin_info` (
  `admin_id` INT(10) NOT NULL,
  `admin_name` VARCHAR(100) NOT NULL,
  `admin_email` VARCHAR(300) NOT NULL,
  `admin_password` VARCHAR(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data for table `admin_info`
INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- Structure of table `email_info`
CREATE TABLE `email_info` (
  `email_id` INT(100) NOT NULL,
  `email` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data for table `email_info`
INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com');

-- Structure of table `user_info`
CREATE TABLE `user_info` (
  `user_id` INT(10) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(300) NOT NULL,
  `password` VARCHAR(300) NOT NULL,
  `mobile` VARCHAR(10) NOT NULL,
  `address1` VARCHAR(300) NOT NULL,
  `address2` VARCHAR(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data for table `user_info`
INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'punee', 'Red', 'pune@gmail.com', 'punee', '9448121558', '123456789', 'sdcjns,djc');

-- Trigger `user_info`
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW
BEGIN
  INSERT INTO user_info_backup VALUES (new.user_id, new.first_name, new.last_name, new.email, new.password, new.mobile, new.address1, new.address2);
END $$
DELIMITER ;

-- Structure of table `user_info_backup`
CREATE TABLE `user_info_backup` (
  `user_id` INT(10) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(300) NOT NULL,
  `password` VARCHAR(300) NOT NULL,
  `mobile` VARCHAR(10) NOT NULL,
  `address1` VARCHAR(300) NOT NULL,
  `address2` VARCHAR(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data for table `user_info_backup`
INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'punee', 'Red', 'pune@gmail.com', 'punee', '9448121558', '123456789', 'sdcjns,djc');

-- Indexes for dumped tables

-- Index for table `admin_info`
ALTER TABLE `admin_info` ADD PRIMARY KEY (`admin_id`);

-- Index for table `email_info`
ALTER TABLE `email_info` ADD PRIMARY KEY (`email_id`);

-- Index for table `user_info`
ALTER TABLE `user_info` ADD PRIMARY KEY (`user_id`);

-- Index for table `user_info_backup`
ALTER TABLE `user_info_backup` ADD PRIMARY KEY (`user_id`);

-- AUTO_INCREMENT for dropped tables

-- AUTO_INCREMENT for table `admin_info`
ALTER TABLE `admin_info` MODIFY `admin_id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT for table `email_info`
ALTER TABLE `email_info` MODIFY `email_id` INT(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- AUTO_INCREMENT for table `user_info`
ALTER TABLE `user_info` MODIFY `user_id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

-- AUTO_INCREMENT for table `user_info_backup`
ALTER TABLE `user_info_backup` MODIFY `user_id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;