-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2021 at 03:41 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(1000) NOT NULL,
  `detail` text,
  `category` varchar(100) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `date`, `description`, `detail`, `category`, `image`) VALUES
(2, 'Test News Updated', '2016-07-19 00:00:00', 'Test News First Entry EditedUpdated', 'Test News First Entry.............\r\nDescription..Updated', 'Support', 'http://feelgrafix.com/data/love-images/love-images-1.jpg/Updated'),
(3, 'Test News Edited', '2016-07-19 00:00:00', 'Test News First Entry Edited', 'Test News First Entry............. Description..Edited', 'Tech', 'http://feelgrafix.com/data/love-images/love-images-1.jpg'),
(4, 'File upload', '2016-08-16 00:00:00', 'File upload Description', 'File upload Details............', 'Tech', 'http://feelgrafix.com/data/love-images/love-images-1.jpg'),
(5, 'This is me', '2016-09-30 00:00:00', 'This is me', 'This is me', 'World', 'This is me');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `roll` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `roll`, `address`) VALUES
(1, 'liton', 101, 'dhaka'),
(2, 'Don', 102, 'Bogra'),
(3, 'AAA', 103, 'BBB');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
