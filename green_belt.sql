-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2014 at 10:31 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `green_belt`
--
CREATE DATABASE IF NOT EXISTS `green_belt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `green_belt`;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(3, 'poll', 'this poll works', '2014-05-02 13:37:52', '2014-05-02 13:37:52'),
(4, 'another poll', 'dis shit work son!', '2014-05-02 14:55:48', '2014-05-02 14:55:48'),
(5, 'poll 3', 'testing errors', '2014-05-02 15:15:56', '2014-05-02 15:15:56'),
(6, 'poll 4', 'poll shit', '2014-05-02 15:30:54', '2014-05-02 15:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE IF NOT EXISTS `poll_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poll_options_polls1_idx` (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `poll_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 'opt1', '2014-05-02 13:37:52', '2014-05-02 13:37:52'),
(2, 3, 'opt2', '2014-05-02 13:37:52', '2014-05-02 13:37:52'),
(3, 3, 'opt3', '2014-05-02 13:37:52', '2014-05-02 13:37:52'),
(4, 3, 'opt4', '2014-05-02 13:37:53', '2014-05-02 13:37:53'),
(5, 4, 'one', '2014-05-02 14:55:48', '2014-05-02 14:55:48'),
(6, 4, 'two', '2014-05-02 14:55:48', '2014-05-02 14:55:48'),
(7, 4, 'three', '2014-05-02 14:55:48', '2014-05-02 14:55:48'),
(8, 4, 'four', '2014-05-02 14:55:49', '2014-05-02 14:55:49'),
(9, 5, '1', '2014-05-02 15:15:56', '2014-05-02 15:15:56'),
(10, 5, '2', '2014-05-02 15:15:56', '2014-05-02 15:15:56'),
(11, 5, '3', '2014-05-02 15:15:56', '2014-05-02 15:15:56'),
(12, 5, '4', '2014-05-02 15:15:56', '2014-05-02 15:15:56'),
(13, 6, '1', '2014-05-02 15:30:54', '2014-05-02 15:30:54'),
(14, 6, '2', '2014-05-02 15:30:54', '2014-05-02 15:30:54'),
(15, 6, '3', '2014-05-02 15:30:54', '2014-05-02 15:30:54'),
(16, 6, '4', '2014-05-02 15:30:54', '2014-05-02 15:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `poll_results`
--

CREATE TABLE IF NOT EXISTS `poll_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_option_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poll_results_polls_idx` (`poll_id`),
  KEY `fk_poll_results_poll_options1_idx` (`poll_option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `poll_results`
--

INSERT INTO `poll_results` (`id`, `poll_id`, `poll_option_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2014-05-02 14:53:29', '2014-05-02 14:53:29'),
(2, 3, 2, '2014-05-02 14:55:57', '2014-05-02 14:55:57'),
(3, 3, 4, '2014-05-02 14:55:59', '2014-05-02 14:55:59'),
(4, 3, 4, '2014-05-02 14:56:02', '2014-05-02 14:56:02'),
(5, 3, 3, '2014-05-02 14:56:09', '2014-05-02 14:56:09'),
(6, 5, 9, '2014-05-02 15:26:03', '2014-05-02 15:26:03'),
(7, 5, 10, '2014-05-02 15:26:40', '2014-05-02 15:26:40'),
(8, 5, 9, '2014-05-02 15:30:35', '2014-05-02 15:30:35');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `fk_poll_options_polls1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_results`
--
ALTER TABLE `poll_results`
  ADD CONSTRAINT `fk_poll_results_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_poll_results_poll_options1` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
