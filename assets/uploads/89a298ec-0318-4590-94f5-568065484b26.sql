-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2018 at 12:50 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vollage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `fullname` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`fullname`, `photo_url`, `username`, `password`, `id`, `createdAt`, `updatedAt`) VALUES
('Creative Lair', NULL, 'FYP', '$2a$10$2RB8LOXP128eR36lgV3lw.SCbuT4MSzchBMt4RUgvLuM4dbjmx4Qu', 1, '2017-11-19 13:20:32', '2017-11-19 13:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`name`, `id`, `createdAt`, `updatedAt`) VALUES
('Electrical Engineering', 1, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
('Computer Science', 2, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
('Business Management', 3, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
('Programming Language', 4, '2017-11-19 19:09:43', '2017-11-19 19:09:43'),
('Physics', 5, '2017-11-19 19:10:48', '2017-11-19 19:10:48'),
('Chemistry', 7, '2017-11-19 19:12:26', '2017-11-19 19:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `connectionOf` int(11) DEFAULT NULL,
  `connectionWith` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` (`connectionOf`, `connectionWith`, `status`, `username`, `name`, `image_url`, `id`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'active', 'sam17896', 'Sana Qureshi', '/user_images/3_790d2343.png', 1, '2017-12-08 15:37:15', '2017-12-08 15:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `personId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`personId`, `level`, `start_date`, `end_date`, `institute`, `id`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2003', '2012', 'Meritorious', 58, '2017-12-08 12:17:08', '2017-12-08 12:17:08'),
(2, 1, '2012', '2016', 'fsa', 61, '2017-12-10 11:55:38', '2017-12-10 11:55:38'),
(4, 2, '1999', '2001', 'FAST', 62, '2017-12-10 18:41:25', '2017-12-10 18:41:25'),
(4, 1, '2001', '2006', 'FAST', 63, '2017-12-10 18:41:25', '2017-12-10 18:41:25'),
(7, 2, '2001', '2006', 'Folio', 64, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
(13, 2, '2006', '2012', 'The Educators', 65, '2018-03-03 00:01:32', '2018-03-03 00:01:32'),
(13, 1, '2004', '2006', 'The Educator', 66, '2018-03-03 00:01:32', '2018-03-03 00:01:32'),
(13, 3, '2014', '2017', 'FAST NUCES', 67, '2018-03-03 00:01:32', '2018-03-03 00:01:32'),
(14, 2, '2012', '2014', 'Bahria', 68, '2018-03-08 04:07:48', '2018-03-08 04:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `educationlevel`
--

CREATE TABLE `educationlevel` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educationlevel`
--

INSERT INTO `educationlevel` (`name`, `id`, `createdAt`, `updatedAt`) VALUES
('Primary Education', 1, '2017-11-16 23:31:47', '2017-11-16 23:31:47'),
('Secondary Education', 2, '2017-11-16 23:32:08', '2017-11-16 23:32:08'),
('Bachelor\'s Degree', 3, '2017-11-16 23:32:28', '2017-11-16 23:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `teacherId` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`teacherId`, `position`, `start_date`, `end_date`, `institute`, `id`, `createdAt`, `updatedAt`) VALUES
(2, 2, '2017', '2017', 'asff', 10, '2017-12-10 13:21:28', '2017-12-10 13:21:28'),
(2, 4, '2012', '2017', 'saffas', 11, '2017-12-10 13:21:28', '2017-12-10 13:21:28'),
(2, 2, '2016', '2016', 'fasf', 12, '2017-12-10 13:21:28', '2017-12-10 13:21:28'),
(4, 1, '1999', '2005', 'Folio3', 13, '2017-12-10 18:41:26', '2017-12-10 18:41:26'),
(4, 2, '1999', '2005', 'Folio3', 14, '2017-12-10 18:41:26', '2017-12-10 18:41:26'),
(7, 3, '2000', '2005', 'folio3', 15, '2017-12-14 06:38:51', '2017-12-14 06:38:51'),
(9, 2, '2001', '2015', 'Folio3', 16, '2017-12-14 06:51:06', '2017-12-14 06:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `name` varchar(255) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `combineRating` varchar(255) DEFAULT NULL,
  `downloadLink` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filecategory`
--

CREATE TABLE `filecategory` (
  `file` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filecategory`
--

INSERT INTO `filecategory` (`file`, `category`, `id`, `createdAt`, `updatedAt`) VALUES
(5, 1, 4, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(5, 3, 5, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
(5, 2, 6, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(7, 1, 8, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(7, 3, 9, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
(6, 1, 31, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(6, 2, 32, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(8, 1, 33, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(9, 1, 34, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(9, 2, 35, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(10, 1, 36, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(11, 2, 37, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(12, 1, 38, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(13, 1, 39, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(13, 3, 40, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
(14, 1, 41, '2017-11-17 09:46:25', '2017-11-17 09:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `filedownload`
--

CREATE TABLE `filedownload` (
  `file` int(11) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `ratingComment` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filedownload`
--

INSERT INTO `filedownload` (`file`, `person`, `rating`, `ratingComment`, `id`, `createdAt`, `updatedAt`) VALUES
(5, 4, NULL, NULL, 1, NULL, NULL),
(6, 3, NULL, NULL, 2, NULL, NULL),
(6, 4, NULL, NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `filekeyword`
--

CREATE TABLE `filekeyword` (
  `file` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filekeyword`
--

INSERT INTO `filekeyword` (`file`, `keyword`, `id`, `createdAt`, `updatedAt`) VALUES
(5, 'fas', 1, '2017-12-11 21:35:49', '2017-12-11 21:35:49'),
(5, 'gsg', 2, '2017-12-11 21:35:49', '2017-12-11 21:35:49'),
(7, 'gas', 4, '2017-12-12 14:37:12', '2017-12-12 14:37:12'),
(7, 'saf', 5, '2017-12-12 14:37:12', '2017-12-12 14:37:12'),
(6, 'af', 6, '2017-12-14 04:25:18', '2017-12-14 04:25:18'),
(6, 'sasag', 7, '2017-12-14 04:25:18', '2017-12-14 04:25:18'),
(8, 'asf', 8, '2017-12-14 04:31:34', '2017-12-14 04:31:34'),
(8, 'dsh', 9, '2017-12-14 04:31:34', '2017-12-14 04:31:34'),
(9, 'sfag', 10, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
(9, 'tyry', 11, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
(9, 'Electrical Engineering', 12, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
(9, 'Computer Science', 13, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
(10, 'saf', 14, '2018-03-05 00:30:18', '2018-03-05 00:30:18'),
(10, 'fdsfa', 15, '2018-03-05 00:30:18', '2018-03-05 00:30:18'),
(10, 'Electrical Engineering', 16, '2018-03-05 00:30:18', '2018-03-05 00:30:18'),
(11, 'gsd', 17, '2018-03-05 00:33:07', '2018-03-05 00:33:07'),
(11, 'adgsdg', 18, '2018-03-05 00:33:07', '2018-03-05 00:33:07'),
(11, 'Computer Science', 19, '2018-03-05 00:33:07', '2018-03-05 00:33:07'),
(12, 'sagdgd', 20, '2018-03-05 00:34:19', '2018-03-05 00:34:19'),
(12, 'rgdg', 21, '2018-03-05 00:34:19', '2018-03-05 00:34:19'),
(12, 'Electrical Engineering', 22, '2018-03-05 00:34:19', '2018-03-05 00:34:19'),
(13, 'asdas', 23, '2018-03-05 00:38:30', '2018-03-05 00:38:30'),
(13, 'fhsdg', 24, '2018-03-05 00:38:30', '2018-03-05 00:38:30'),
(13, 'Electrical Engineering', 25, '2018-03-05 00:38:30', '2018-03-05 00:38:30'),
(13, 'Business Management', 26, '2018-03-05 00:38:30', '2018-03-05 00:38:30'),
(14, 'safasf', 27, '2018-03-05 00:43:50', '2018-03-05 00:43:50'),
(14, 'fasf', 28, '2018-03-05 00:43:50', '2018-03-05 00:43:50'),
(14, 'Electrical Engineering', 29, '2018-03-05 00:43:50', '2018-03-05 00:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `forumcategory`
--

CREATE TABLE `forumcategory` (
  `forum` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumcategory`
--

INSERT INTO `forumcategory` (`forum`, `category`, `id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 11, '2017-11-17 09:46:25', '2017-11-17 09:46:25'),
(1, 3, 12, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
(1, 5, 13, '2017-11-19 19:10:48', '2017-11-19 19:10:48'),
(2, 2, 14, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(2, 3, 15, '2017-11-19 19:05:53', '2017-11-19 19:05:53'),
(4, 2, 16, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(5, 2, 17, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(6, 2, 18, '2017-11-17 09:46:36', '2017-11-17 09:46:36'),
(6, 1, 19, '2017-11-17 09:46:25', '2017-11-17 09:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `forumcomment`
--

CREATE TABLE `forumcomment` (
  `text` varchar(255) DEFAULT NULL,
  `forum` int(11) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumcomment`
--

INSERT INTO `forumcomment` (`text`, `forum`, `person`, `id`, `createdAt`, `updatedAt`) VALUES
('first message', 1, 4, 2, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
('messsage', 2, 4, 3, '2017-12-11 11:51:19', '2017-12-11 11:51:19'),
('dfa', 6, 4, 4, '2017-12-11 15:51:30', '2017-12-11 15:51:30'),
('gfds', 1, 4, 6, '2017-12-11 17:17:00', '2017-12-11 17:17:00'),
('ffdad', 1, 4, 7, '2017-12-11 17:17:43', '2017-12-11 17:17:43'),
('agfgfa', 1, 4, 8, '2017-12-11 17:17:55', '2017-12-11 17:17:55'),
('fdsag', 1, 4, 9, '2017-12-11 18:40:04', '2017-12-11 18:40:04'),
('agasgagf', 1, 4, 10, '2017-12-11 18:50:34', '2017-12-11 18:50:34'),
('asf', 1, 4, 11, '2017-12-11 18:59:05', '2017-12-11 18:59:05'),
('gsafsag', 1, 4, 12, '2017-12-11 19:00:15', '2017-12-11 19:00:15'),
('gfsagsfa', 1, 5, 13, '2017-12-11 19:06:15', '2017-12-11 19:06:15'),
('gagfggs', 1, 5, 14, '2017-12-11 19:09:39', '2017-12-11 19:09:39'),
('gagfggs', 1, 5, 15, '2017-12-11 19:09:50', '2017-12-11 19:09:50'),
('gfasgfg', 1, 5, 16, '2017-12-11 19:10:13', '2017-12-11 19:10:13'),
('ada', 1, 5, 17, '2017-12-11 19:11:12', '2017-12-11 19:11:12'),
('ada', 1, 5, 18, '2017-12-11 19:12:33', '2017-12-11 19:12:33'),
('gafdgafd', 1, 5, 19, '2017-12-11 19:14:15', '2017-12-11 19:14:15'),
('afgafd', 1, 5, 20, '2017-12-11 19:16:14', '2017-12-11 19:16:14'),
('gfag', 1, 5, 21, '2017-12-11 19:18:23', '2017-12-11 19:18:23'),
('faf', 1, 5, 22, '2017-12-11 19:19:48', '2017-12-11 19:19:48'),
('gsag', 1, 5, 23, '2017-12-11 19:20:55', '2017-12-11 19:20:55'),
('agdgda', 2, 1, 24, '2017-12-11 19:22:13', '2017-12-11 19:22:13'),
('gdagda', 2, 5, 25, '2017-12-11 19:22:23', '2017-12-11 19:22:23'),
('agdgda', 2, 1, 26, '2017-12-11 19:22:25', '2017-12-11 19:22:25'),
('agdgda', 2, 1, 27, '2017-12-11 19:22:28', '2017-12-11 19:22:28'),
('agdgda', 2, 1, 28, '2017-12-11 19:22:28', '2017-12-11 19:22:28'),
('gdagda', 2, 5, 29, '2017-12-11 19:22:29', '2017-12-11 19:22:29'),
('asdfsda', 4, 6, 30, '2017-12-12 13:22:24', '2017-12-12 13:22:24'),
('fasf', 5, 6, 31, '2017-12-12 14:01:12', '2017-12-12 14:01:12'),
('gsdhafh', 5, 6, 32, '2017-12-14 04:26:10', '2017-12-14 04:26:10'),
('agshfsh', 5, 6, 33, '2017-12-14 04:26:13', '2017-12-14 04:26:13'),
('asfhfhafh', 5, 6, 34, '2017-12-14 04:26:16', '2017-12-14 04:26:16'),
('hi', 5, 9, 36, '2017-12-14 06:52:14', '2017-12-14 06:52:14'),
(' mm85585858585 85    85  888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 5, 1, 38, '2017-12-14 16:20:07', '2017-12-14 16:20:07'),
(' mm85585858585 85    85  888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 5, 1, 39, '2017-12-14 16:20:42', '2017-12-14 16:20:42'),
('gaf', 5, 1, 40, '2017-12-14 16:21:10', '2017-12-14 16:21:10'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 4, 1, 41, '2017-12-14 16:21:27', '2017-12-14 16:21:27'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 2, 1, 42, '2017-12-14 16:21:42', '2017-12-14 16:21:42'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 43, '2017-12-14 16:21:57', '2017-12-14 16:21:57'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 44, '2017-12-14 16:22:01', '2017-12-14 16:22:01'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 45, '2017-12-14 16:22:05', '2017-12-14 16:22:05'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 46, '2017-12-14 16:22:08', '2017-12-14 16:22:08'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 47, '2017-12-14 16:22:11', '2017-12-14 16:22:11'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 48, '2017-12-14 16:22:15', '2017-12-14 16:22:15'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 49, '2017-12-14 16:22:18', '2017-12-14 16:22:18'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 50, '2017-12-14 16:22:22', '2017-12-14 16:22:22'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 51, '2017-12-14 16:22:25', '2017-12-14 16:22:25'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 52, '2017-12-14 16:22:28', '2017-12-14 16:22:28'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 53, '2017-12-14 16:22:32', '2017-12-14 16:22:32'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 54, '2017-12-14 16:22:35', '2017-12-14 16:22:35'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 55, '2017-12-14 16:22:38', '2017-12-14 16:22:38'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 6, 1, 56, '2017-12-14 16:22:41', '2017-12-14 16:22:41'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 5, 1, 57, '2017-12-14 16:22:52', '2017-12-14 16:22:52'),
('mm85585858585 85 85 888888this is the long comment you what it is a long comment long long comment long lone logng comemnta amsnfkjsamvsdm vjkln nm ms sdkl nkajkl; sm,k nams n jksdb nsm sdm kas', 5, 1, 58, '2017-12-14 16:22:56', '2017-12-14 16:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `forumkeyword`
--

CREATE TABLE `forumkeyword` (
  `forum` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumkeyword`
--

INSERT INTO `forumkeyword` (`forum`, `keyword`, `id`, `createdAt`, `updatedAt`) VALUES
(1, 'keyword1', 7, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
(1, ' keyword 2 ', 8, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
(1, ' keyword 3 ', 9, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
(2, 'hci1', 10, '2017-12-11 11:51:19', '2017-12-11 11:51:19'),
(2, ' hci2', 11, '2017-12-11 11:51:19', '2017-12-11 11:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `forumtopic`
--

CREATE TABLE `forumtopic` (
  `topicname` varchar(255) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumtopic`
--

INSERT INTO `forumtopic` (`topicname`, `person`, `description`, `username`, `id`, `createdAt`, `updatedAt`) VALUES
('Computer Programming ', 4, 'simple description', 'k142109', 1, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
('HCI', 4, 'small description', 'k142109', 2, '2017-12-11 11:51:19', '2017-12-11 11:51:19'),
('AI', 4, 'small description', 'k142109', 3, '2017-12-11 15:45:37', '2017-12-11 15:45:37'),
('AI', 4, 'small description', 'k142109', 4, '2017-12-11 15:47:08', '2017-12-11 15:47:08'),
('SE', 4, 'small descrip', 'k142109', 5, '2017-12-11 15:48:37', '2017-12-11 15:48:37'),
('CC', 4, 'sfadaf', 'k142109', 6, '2017-12-11 15:51:30', '2017-12-11 15:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `forum_sort_option`
--

CREATE TABLE `forum_sort_option` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_sort_option`
--

INSERT INTO `forum_sort_option` (`name`, `id`, `createdAt`, `updatedAt`) VALUES
('Recently Active', 1, '2018-02-17 20:17:58', '2018-02-17 20:17:58'),
('Newly Created', 2, '2018-02-17 20:17:58', '2018-02-17 20:17:58'),
('Most Active', 3, '2018-02-17 20:18:16', '2018-02-17 20:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `friendrequest`
--

CREATE TABLE `friendrequest` (
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`name`, `id`, `createdAt`, `updatedAt`) VALUES
('Male', 1, NULL, NULL),
('Female', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `how_it_work`
--

CREATE TABLE `how_it_work` (
  `id` int(11) NOT NULL,
  `image_url` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interestedcourse`
--

CREATE TABLE `interestedcourse` (
  `personId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interestedcourse`
--

INSERT INTO `interestedcourse` (`personId`, `categoryId`, `id`, `createdAt`, `updatedAt`) VALUES
(3, 1, 71, '2017-12-08 15:27:56', '2017-12-08 15:27:56'),
(3, 3, 72, '2017-12-08 15:27:56', '2017-12-08 15:27:56'),
(2, 3, 76, '2017-12-10 16:15:10', '2017-12-10 16:15:10'),
(2, 5, 77, '2017-12-10 16:15:10', '2017-12-10 16:15:10'),
(2, 4, 78, '2017-12-10 16:15:10', '2017-12-10 16:15:10'),
(4, 1, 79, '2017-12-10 18:41:25', '2017-12-10 18:41:25'),
(4, 2, 80, '2017-12-10 18:41:25', '2017-12-10 18:41:25'),
(4, 3, 81, '2017-12-10 18:41:25', '2017-12-10 18:41:25'),
(5, 2, 82, '2017-12-11 19:02:46', '2017-12-11 19:02:46'),
(5, 1, 83, '2017-12-11 19:02:46', '2017-12-11 19:02:46'),
(6, 2, 84, '2017-12-11 23:01:31', '2017-12-11 23:01:31'),
(6, 1, 85, '2017-12-11 23:01:31', '2017-12-11 23:01:31'),
(6, 3, 86, '2017-12-11 23:01:31', '2017-12-11 23:01:31'),
(7, 1, 87, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
(7, 2, 88, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
(7, 3, 89, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
(9, 2, 90, '2017-12-14 06:46:26', '2017-12-14 06:46:26'),
(9, 1, 91, '2017-12-14 06:46:26', '2017-12-14 06:46:26'),
(10, 2, 92, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
(10, 1, 93, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
(11, 1, 94, '2017-12-14 13:30:52', '2017-12-14 13:30:52'),
(11, 2, 95, '2017-12-14 13:30:52', '2017-12-14 13:30:52'),
(12, 2, 96, '2017-12-14 13:32:34', '2017-12-14 13:32:34'),
(12, 4, 97, '2017-12-14 13:32:34', '2017-12-14 13:32:34'),
(1, 3, 100, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(1, 1, 101, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(1, 5, 102, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(1, 7, 103, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(1, 2, 104, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(1, 4, 105, '2018-03-03 01:56:51', '2018-03-03 01:56:51'),
(13, 1, 108, '2018-03-03 03:34:24', '2018-03-03 03:34:24'),
(13, 4, 109, '2018-03-03 03:34:24', '2018-03-03 03:34:24'),
(14, 2, 110, '2018-03-08 04:07:48', '2018-03-08 04:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`name`, `id`, `createdAt`, `updatedAt`) VALUES
('Software applications developer', 1, '2017-11-17 09:39:01', '2017-11-17 09:39:01'),
('Computer systems analyst', 2, '2017-11-17 09:39:13', '2017-11-17 09:39:13'),
('Computer systems engineer', 3, '2017-11-17 09:39:24', '2017-11-17 09:39:24'),
('Network systems administrator', 4, '2017-11-17 09:39:35', '2017-11-17 09:39:35'),
('Database administrator', 5, '2017-11-17 09:39:46', '2017-11-17 09:39:46'),
('Business intelligence analyst', 6, '2017-11-17 09:39:55', '2017-11-17 09:39:55'),
('Web developer', 7, '2017-11-17 09:40:06', '2017-11-17 09:40:06'),
('Computer programmer', 8, '2017-11-17 09:40:26', '2017-11-17 09:40:26'),
('Software systems developer', 9, '2017-11-17 09:40:38', '2017-11-17 09:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `message` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`message`, `id`, `createdAt`, `updatedAt`) VALUES
('Ahsan Sohail registered!', 1, '2017-11-19 21:13:43', '2017-11-19 21:13:43'),
('New Category Created', 2, '2017-11-19 21:15:26', '2017-11-19 21:15:26'),
('New Education Level Created', 3, '2017-11-19 21:18:10', '2017-11-19 21:18:10'),
('New Education Level Created', 4, '2017-11-19 21:18:26', '2017-11-19 21:18:26'),
('Ahsan Sohail registered!', 5, '2017-11-19 22:07:39', '2017-11-19 22:07:39'),
('Ahsan Sohail registered!', 6, '2017-11-19 22:10:41', '2017-11-19 22:10:41'),
('Ahsan Sohail registered!', 7, '2017-11-19 22:10:53', '2017-11-19 22:10:53'),
('FYP logs in', 8, '2017-11-19 22:13:20', '2017-11-19 22:13:20'),
('Ahsan Sohail registered!', 9, '2017-11-21 00:16:29', '2017-11-21 00:16:29'),
('Ahsan Sohail registered!', 10, '2017-11-21 00:16:56', '2017-11-21 00:16:56'),
('Ahsan Sohail registered!', 11, '2017-11-21 00:20:20', '2017-11-21 00:20:20'),
('Ahsan Sohail registered!', 12, '2017-11-21 00:20:25', '2017-11-21 00:20:25'),
('Ahsan Sohail registered!', 13, '2017-11-21 01:44:24', '2017-11-21 01:44:24'),
('Ahsan Sohail registered!', 14, '2017-11-21 01:44:40', '2017-11-21 01:44:40'),
('Hisham Ahmed registered!', 15, '2017-11-21 03:12:53', '2017-11-21 03:12:53'),
('Ahsan Sohail registered!', 16, '2017-11-21 03:23:03', '2017-11-21 03:23:03'),
('ahsansam logs in', 17, '2017-11-21 22:04:52', '2017-11-21 22:04:52'),
('ahsansam logs in', 18, '2017-11-21 22:08:07', '2017-11-21 22:08:07'),
('Teacher registered!', 19, '2017-11-22 18:57:14', '2017-11-22 18:57:14'),
('Teacher registered!', 20, '2017-11-22 19:43:28', '2017-11-22 19:43:28'),
('Ahsan Sohail registered!', 21, '2017-11-22 20:25:13', '2017-11-22 20:25:13'),
('Ahsan Sohail registered!', 22, '2017-11-22 21:17:00', '2017-11-22 21:17:00'),
('Ahsan Sohail registered!', 23, '2017-11-22 21:17:49', '2017-11-22 21:17:49'),
('Teacher registered!', 24, '2017-11-22 21:20:28', '2017-11-22 21:20:28'),
('Ahsan Sohail registered!', 25, '2017-12-08 00:34:20', '2017-12-08 00:34:20'),
('ahsansam1 logs in', 26, '2017-12-08 00:39:08', '2017-12-08 00:39:08'),
('Ahsansam registered!', 27, '2017-12-08 12:17:15', '2017-12-08 12:17:15'),
('undefined email verified', 28, '2017-12-08 12:18:39', '2017-12-08 12:18:39'),
('Ahsansam logs in', 29, '2017-12-08 12:18:59', '2017-12-08 12:18:59'),
('Teacher registered!', 30, '2017-12-08 15:25:22', '2017-12-08 15:25:22'),
('Ahsansam logs in', 31, '2017-12-08 15:25:41', '2017-12-08 15:25:41'),
('Ahsan Sohail registered!', 32, '2017-12-08 15:28:02', '2017-12-08 15:28:02'),
('Ahsansam logs in', 33, '2017-12-08 15:37:40', '2017-12-08 15:37:40'),
('Ahsansam logs in', 34, '2017-12-09 02:32:28', '2017-12-09 02:32:28'),
('ahsansam1 logs in', 35, '2017-12-09 03:31:52', '2017-12-09 03:31:52'),
('Ahsansam logs in', 36, '2017-12-09 03:35:59', '2017-12-09 03:35:59'),
('ahsansam1 logs in', 37, '2017-12-09 03:36:18', '2017-12-09 03:36:18'),
('ahsansam1 has updated personal details', 38, '2017-12-09 17:55:10', '2017-12-09 17:55:10'),
('ahsansam1 has updated personal details', 39, '2017-12-09 17:56:13', '2017-12-09 17:56:13'),
('ahsansam1 has updated personal details', 40, '2017-12-09 17:56:39', '2017-12-09 17:56:39'),
('ahsansam1 has updated personal details', 41, '2017-12-09 18:13:18', '2017-12-09 18:13:18'),
('ahsansam1 has updated personal details', 42, '2017-12-09 18:32:46', '2017-12-09 18:32:46'),
('ahsansam1 has updated personal details', 43, '2017-12-09 18:33:29', '2017-12-09 18:33:29'),
('ahsansam1 has updated personal details', 44, '2017-12-09 18:36:13', '2017-12-09 18:36:13'),
('undefined email verified', 45, '2017-12-10 02:14:00', '2017-12-10 02:14:00'),
('ahsansam1 logs in', 46, '2017-12-10 02:15:29', '2017-12-10 02:15:29'),
('ahsansam1 has updated personal details', 47, '2017-12-10 10:55:14', '2017-12-10 10:55:14'),
('ahsansam1 has updated personal details', 48, '2017-12-10 10:55:19', '2017-12-10 10:55:19'),
('ahsansam1 logs in', 49, '2017-12-10 11:11:55', '2017-12-10 11:11:55'),
('ahsansam1 logs in', 50, '2017-12-10 11:51:21', '2017-12-10 11:51:21'),
('ahsansam1 has updated personal details', 51, '2017-12-10 16:29:02', '2017-12-10 16:29:02'),
('ahsansam1 has updated personal details', 52, '2017-12-10 16:30:19', '2017-12-10 16:30:19'),
('Ahsansam logs in', 53, '2017-12-10 18:28:31', '2017-12-10 18:28:31'),
('Ahsan Sohail registered!', 54, '2017-12-10 18:41:29', '2017-12-10 18:41:29'),
('undefined email verified', 55, '2017-12-10 18:43:16', '2017-12-10 18:43:16'),
('k142109 logs in', 56, '2017-12-10 18:43:34', '2017-12-10 18:43:34'),
('k142109 logs in', 57, '2017-12-10 18:49:52', '2017-12-10 18:49:52'),
('fdsa forum created', 58, '2017-12-10 22:58:59', '2017-12-10 22:58:59'),
('fdsa forum created', 59, '2017-12-10 23:00:35', '2017-12-10 23:00:35'),
('fdsa forum created', 60, '2017-12-10 23:01:11', '2017-12-10 23:01:11'),
('fdsa forum created', 61, '2017-12-10 23:05:14', '2017-12-10 23:05:14'),
('fdsa forum created', 62, '2017-12-10 23:19:00', '2017-12-10 23:19:00'),
('fdsa forum created', 63, '2017-12-10 23:19:00', '2017-12-10 23:19:00'),
('gaf forum created', 64, '2017-12-10 23:23:13', '2017-12-10 23:23:13'),
('Ahsansam logs in', 65, '2017-12-11 11:02:11', '2017-12-11 11:02:11'),
('k142109 logs in', 66, '2017-12-11 11:02:53', '2017-12-11 11:02:53'),
('Computer Programming  forum created', 67, '2017-12-11 11:15:13', '2017-12-11 11:15:13'),
('HCI forum created', 68, '2017-12-11 11:51:19', '2017-12-11 11:51:19'),
('CC forum created', 69, '2017-12-11 15:51:31', '2017-12-11 15:51:31'),
('username commented on forum', 70, '2017-12-11 17:05:00', '2017-12-11 17:05:00'),
('username commented on forum', 71, '2017-12-11 17:17:00', '2017-12-11 17:17:00'),
('username commented on forum', 72, '2017-12-11 17:17:43', '2017-12-11 17:17:43'),
('username commented on forum', 73, '2017-12-11 17:17:55', '2017-12-11 17:17:55'),
('username commented on forum', 74, '2017-12-11 18:40:04', '2017-12-11 18:40:04'),
('username commented on forum', 75, '2017-12-11 18:50:34', '2017-12-11 18:50:34'),
('username commented on forum', 76, '2017-12-11 18:59:05', '2017-12-11 18:59:05'),
('username commented on forum', 77, '2017-12-11 19:00:16', '2017-12-11 19:00:16'),
('Ahsansam registered!', 78, '2017-12-11 19:02:52', '2017-12-11 19:02:52'),
('undefined email verified', 79, '2017-12-11 19:03:53', '2017-12-11 19:03:53'),
('sam999 logs in', 80, '2017-12-11 19:04:11', '2017-12-11 19:04:11'),
('sam999 logs in', 81, '2017-12-11 19:06:01', '2017-12-11 19:06:01'),
('username commented on forum', 82, '2017-12-11 19:06:15', '2017-12-11 19:06:15'),
('username commented on forum', 83, '2017-12-11 19:09:39', '2017-12-11 19:09:39'),
('username commented on forum', 84, '2017-12-11 19:09:51', '2017-12-11 19:09:51'),
('username commented on forum', 85, '2017-12-11 19:10:13', '2017-12-11 19:10:13'),
('username commented on forum', 86, '2017-12-11 19:11:12', '2017-12-11 19:11:12'),
('username commented on forum', 87, '2017-12-11 19:12:33', '2017-12-11 19:12:33'),
('username commented on forum', 88, '2017-12-11 19:14:15', '2017-12-11 19:14:15'),
('username commented on forum', 89, '2017-12-11 19:16:14', '2017-12-11 19:16:14'),
('username commented on forum', 90, '2017-12-11 19:18:23', '2017-12-11 19:18:23'),
('username commented on forum', 91, '2017-12-11 19:19:48', '2017-12-11 19:19:48'),
('username commented on forum', 92, '2017-12-11 19:20:55', '2017-12-11 19:20:55'),
('Ahsansam logs in', 93, '2017-12-11 19:22:01', '2017-12-11 19:22:01'),
('username commented on forum', 94, '2017-12-11 19:22:13', '2017-12-11 19:22:13'),
('username commented on forum', 95, '2017-12-11 19:22:23', '2017-12-11 19:22:23'),
('username commented on forum', 96, '2017-12-11 19:22:25', '2017-12-11 19:22:25'),
('username commented on forum', 97, '2017-12-11 19:22:28', '2017-12-11 19:22:28'),
('username commented on forum', 98, '2017-12-11 19:22:28', '2017-12-11 19:22:28'),
('username commented on forum', 99, '2017-12-11 19:22:29', '2017-12-11 19:22:29'),
('File Uploaded By ..', 100, '2017-12-11 19:31:14', '2017-12-11 19:31:14'),
('File Uploaded By ..', 101, '2017-12-11 21:13:33', '2017-12-11 21:13:33'),
('File Uploaded By ..', 102, '2017-12-11 21:14:22', '2017-12-11 21:14:22'),
('File Uploaded By ..', 103, '2017-12-11 21:16:22', '2017-12-11 21:16:22'),
('File Uploaded By ..', 104, '2017-12-11 21:35:49', '2017-12-11 21:35:49'),
('File Downloaded By...', 105, '2017-12-11 21:59:23', '2017-12-11 21:59:23'),
('File Downloaded By...', 106, '2017-12-11 21:59:42', '2017-12-11 21:59:42'),
('File Downloaded By...', 107, '2017-12-11 22:25:44', '2017-12-11 22:25:44'),
('File Downloaded By...', 108, '2017-12-11 22:26:15', '2017-12-11 22:26:15'),
('File Downloaded By...', 109, '2017-12-11 22:26:32', '2017-12-11 22:26:32'),
('Khadija Sohail registered!', 110, '2017-12-11 23:01:35', '2017-12-11 23:01:35'),
('undefined email verified', 111, '2017-12-11 23:02:27', '2017-12-11 23:02:27'),
('khadija logs in', 112, '2017-12-11 23:02:43', '2017-12-11 23:02:43'),
('username commented on forum', 113, '2017-12-12 13:22:24', '2017-12-12 13:22:24'),
('username commented on forum', 114, '2017-12-12 14:01:12', '2017-12-12 14:01:12'),
('File Uploaded By ..', 115, '2017-12-12 14:31:43', '2017-12-12 14:31:43'),
('File Uploaded By ..', 116, '2017-12-12 14:37:12', '2017-12-12 14:37:12'),
('username commented on forum', 117, '2017-12-14 04:26:10', '2017-12-14 04:26:10'),
('username commented on forum', 118, '2017-12-14 04:26:13', '2017-12-14 04:26:13'),
('username commented on forum', 119, '2017-12-14 04:26:16', '2017-12-14 04:26:16'),
('username commented on forum', 120, '2017-12-14 04:26:27', '2017-12-14 04:26:27'),
('File Uploaded By ..', 121, '2017-12-14 04:31:34', '2017-12-14 04:31:34'),
('mailtest registered!', 122, '2017-12-14 06:47:25', '2017-12-14 06:47:25'),
('undefined email verified', 123, '2017-12-14 06:49:00', '2017-12-14 06:49:00'),
('maitest2 logs in', 124, '2017-12-14 06:49:32', '2017-12-14 06:49:32'),
('username commented on forum', 125, '2017-12-14 06:52:14', '2017-12-14 06:52:14'),
('username commented on forum', 126, '2017-12-14 06:52:34', '2017-12-14 06:52:34'),
('maitest2 logs in', 127, '2017-12-14 06:56:10', '2017-12-14 06:56:10'),
('maitest2 has updated personal details', 128, '2017-12-14 10:59:43', '2017-12-14 10:59:43'),
('maitest2 has updated personal details', 129, '2017-12-14 11:16:21', '2017-12-14 11:16:21'),
('maitest2 has updated personal details', 130, '2017-12-14 11:18:25', '2017-12-14 11:18:25'),
('maitest2 has updated personal details', 131, '2017-12-14 11:18:35', '2017-12-14 11:18:35'),
('maitest2 has updated personal details', 132, '2017-12-14 11:25:21', '2017-12-14 11:25:21'),
('maitest2 has updated personal details', 133, '2017-12-14 11:25:37', '2017-12-14 11:25:37'),
('sfap registered!', 134, '2017-12-14 13:10:35', '2017-12-14 13:10:35'),
('ahsansam registered!', 135, '2017-12-14 13:30:56', '2017-12-14 13:30:56'),
('asfp registered!', 136, '2017-12-14 13:32:38', '2017-12-14 13:32:38'),
('undefined email verified', 137, '2017-12-14 15:58:41', '2017-12-14 15:58:41'),
('Ahsansam logs in', 138, '2017-12-14 16:07:30', '2017-12-14 16:07:30'),
('username commented on forum', 139, '2017-12-14 16:20:07', '2017-12-14 16:20:07'),
('username commented on forum', 140, '2017-12-14 16:20:42', '2017-12-14 16:20:42'),
('username commented on forum', 141, '2017-12-14 16:21:10', '2017-12-14 16:21:10'),
('username commented on forum', 142, '2017-12-14 16:21:27', '2017-12-14 16:21:27'),
('username commented on forum', 143, '2017-12-14 16:21:42', '2017-12-14 16:21:42'),
('username commented on forum', 144, '2017-12-14 16:21:57', '2017-12-14 16:21:57'),
('username commented on forum', 145, '2017-12-14 16:22:01', '2017-12-14 16:22:01'),
('username commented on forum', 146, '2017-12-14 16:22:05', '2017-12-14 16:22:05'),
('username commented on forum', 147, '2017-12-14 16:22:08', '2017-12-14 16:22:08'),
('username commented on forum', 148, '2017-12-14 16:22:11', '2017-12-14 16:22:11'),
('username commented on forum', 149, '2017-12-14 16:22:15', '2017-12-14 16:22:15'),
('username commented on forum', 150, '2017-12-14 16:22:18', '2017-12-14 16:22:18'),
('username commented on forum', 151, '2017-12-14 16:22:22', '2017-12-14 16:22:22'),
('username commented on forum', 152, '2017-12-14 16:22:25', '2017-12-14 16:22:25'),
('username commented on forum', 153, '2017-12-14 16:22:29', '2017-12-14 16:22:29'),
('username commented on forum', 154, '2017-12-14 16:22:32', '2017-12-14 16:22:32'),
('username commented on forum', 155, '2017-12-14 16:22:35', '2017-12-14 16:22:35'),
('username commented on forum', 156, '2017-12-14 16:22:38', '2017-12-14 16:22:38'),
('username commented on forum', 157, '2017-12-14 16:22:41', '2017-12-14 16:22:41'),
('username commented on forum', 158, '2017-12-14 16:22:52', '2017-12-14 16:22:52'),
('username commented on forum', 159, '2017-12-14 16:22:56', '2017-12-14 16:22:56'),
('Something went wrong creating Education Level', 160, '2018-02-11 02:05:23', '2018-02-11 02:05:23'),
('Ahsansam logs in', 161, '2018-02-17 12:38:19', '2018-02-17 12:38:19'),
('File Downloaded By...', 162, '2018-02-28 03:03:44', '2018-02-28 03:03:44'),
('fahad farooq registered!', 163, '2018-02-28 03:10:47', '2018-02-28 03:10:47'),
('undefined email verified', 164, '2018-02-28 03:11:43', '2018-02-28 03:11:43'),
('fahad logs in', 165, '2018-02-28 03:11:59', '2018-02-28 03:11:59'),
('sam17896 logs in', 166, '2018-02-28 12:41:37', '2018-02-28 12:41:37'),
('FYP logs in', 167, '2018-02-28 12:51:29', '2018-02-28 12:51:29'),
('sam17896 has updated personal details', 168, '2018-02-28 13:25:03', '2018-02-28 13:25:03'),
('sam17896 logs in', 169, '2018-02-28 16:57:44', '2018-02-28 16:57:44'),
('FYP logs in', 170, '2018-02-28 16:59:31', '2018-02-28 16:59:31'),
('File Uploaded By ..', 171, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
('File Uploaded By ..', 172, '2018-03-05 00:30:17', '2018-03-05 00:30:17'),
('File Uploaded By ..', 173, '2018-03-05 00:33:07', '2018-03-05 00:33:07'),
('File Uploaded By ..', 174, '2018-03-05 00:34:19', '2018-03-05 00:34:19'),
('File Uploaded By ..', 175, '2018-03-05 00:38:29', '2018-03-05 00:38:29'),
('File Uploaded By ..', 176, '2018-03-05 00:43:49', '2018-03-05 00:43:49'),
('File Downloaded By...', 177, '2018-03-05 00:43:53', '2018-03-05 00:43:53'),
('File Downloaded By...', 178, '2018-03-05 00:46:17', '2018-03-05 00:46:17'),
('File Downloaded By...', 179, '2018-03-05 00:54:53', '2018-03-05 00:54:53'),
('File Downloaded By...', 180, '2018-03-05 00:56:20', '2018-03-05 00:56:20'),
('File Downloaded By...', 181, '2018-03-05 00:58:34', '2018-03-05 00:58:34'),
('File Downloaded By...', 182, '2018-03-05 00:59:11', '2018-03-05 00:59:11'),
('File Downloaded By...', 183, '2018-03-05 01:02:27', '2018-03-05 01:02:27'),
('File Downloaded By...', 184, '2018-03-05 01:02:54', '2018-03-05 01:02:54'),
('Hisham Ahmed registered!', 185, '2018-03-08 04:07:55', '2018-03-08 04:07:55'),
('undefined email verified', 186, '2018-03-08 04:08:54', '2018-03-08 04:08:54'),
('hisham logs in', 187, '2018-03-08 04:09:26', '2018-03-08 04:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `mastercourse`
--

CREATE TABLE `mastercourse` (
  `teacherId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mastercourse`
--

INSERT INTO `mastercourse` (`teacherId`, `categoryId`, `id`, `createdAt`, `updatedAt`) VALUES
(2, 1, 32, '2017-12-10 16:15:17', '2017-12-10 16:15:17'),
(2, 3, 33, '2017-12-10 16:15:17', '2017-12-10 16:15:17'),
(2, 2, 34, '2017-12-10 16:15:17', '2017-12-10 16:15:17'),
(4, 1, 35, '2017-12-10 18:41:26', '2017-12-10 18:41:26'),
(4, 3, 36, '2017-12-10 18:41:26', '2017-12-10 18:41:26'),
(5, 1, 37, '2017-12-11 19:02:46', '2017-12-11 19:02:46'),
(5, 3, 38, '2017-12-11 19:02:46', '2017-12-11 19:02:46'),
(5, 4, 39, '2017-12-11 19:02:46', '2017-12-11 19:02:46'),
(7, 3, 40, '2017-12-14 06:38:51', '2017-12-14 06:38:51'),
(7, 2, 41, '2017-12-14 06:38:51', '2017-12-14 06:38:51'),
(7, 1, 42, '2017-12-14 06:38:51', '2017-12-14 06:38:51'),
(9, 1, 43, '2017-12-14 06:46:26', '2017-12-14 06:46:26'),
(9, 3, 44, '2017-12-14 06:46:26', '2017-12-14 06:46:26'),
(11, 2, 45, '2017-12-14 13:30:52', '2017-12-14 13:30:52'),
(11, 1, 46, '2017-12-14 13:30:52', '2017-12-14 13:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg` varchar(255) DEFAULT NULL,
  `isImage` tinyint(1) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msg`, `isImage`, `imageLink`, `student`, `id`, `createdAt`, `updatedAt`) VALUES
('Created this group', 0, NULL, 1, 3, '2018-03-06 23:05:27', '2018-03-06 23:05:27'),
('Created this group', 0, NULL, 1, 4, '2018-03-07 00:39:11', '2018-03-07 00:39:11'),
('new message', 0, NULL, 1, 5, '2018-03-07 00:43:33', '2018-03-07 00:43:33'),
('Created this group', 0, NULL, 1, 6, '2018-03-07 12:28:17', '2018-03-07 12:28:17'),
('newmms', 0, NULL, 1, 7, '2018-03-07 14:01:47', '2018-03-07 14:01:47'),
('dsafsa', 0, NULL, 1, 8, '2018-03-07 14:02:17', '2018-03-07 14:02:17'),
('fagf', 0, NULL, 1, 9, '2018-03-07 14:05:07', '2018-03-07 14:05:07'),
('fagf', 0, NULL, 1, 10, '2018-03-07 14:05:51', '2018-03-07 14:05:51'),
('gss', 0, NULL, 3, 11, '2018-03-08 04:04:36', '2018-03-08 04:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `metatag`
--

CREATE TABLE `metatag` (
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metatag`
--

INSERT INTO `metatag` (`key`, `value`, `id`, `createdAt`, `updatedAt`) VALUES
('right_menu_1', '<a href=\"/signin\">Sign In</a>', 1, '2018-02-11 02:15:13', '2018-02-11 21:48:47'),
('Signup_card2_heading', '<h2>Please Provide your basic details</h2>', 2, '2018-02-11 14:36:42', '2018-02-17 02:25:02'),
('Signup_card2_label_name', 'Fullname', 3, '2018-02-11 14:38:10', '2018-02-11 14:38:10'),
('Signup_card2_label_country', 'Select Country', 4, '2018-02-11 14:38:21', '2018-02-11 14:38:21'),
('Signup_card2_label_DoB', 'Date Of Birth', 5, '2018-02-11 14:38:31', '2018-02-11 14:38:31'),
('Signup_card2_label_contact', 'Contact No', 6, '2018-02-11 14:39:53', '2018-02-11 14:39:53'),
('Signup_card2_label_gender', 'Select Gender', 7, '2018-02-11 14:40:02', '2018-02-11 14:40:02'),
('Signup_card2_image_btn', 'Upload Image', 8, '2018-02-11 14:40:16', '2018-02-17 02:28:57'),
('Signup_card2_back_btn', 'Go Back', 9, '2018-02-11 14:40:27', '2018-02-11 14:40:27'),
('Signup_card2_next_btn', 'Next', 10, '2018-02-11 14:40:39', '2018-02-11 14:40:39'),
('Signup_card2_signin_text', 'Already have an account? Sign In', 11, '2018-02-11 14:40:56', '2018-02-11 14:40:56'),
('Signup_card3_heading', '<h2>Your detail as a Teacher</h2>', 12, '2018-02-11 14:41:18', '2018-02-17 09:15:45'),
('Signup_card3_label_currentJob', 'Your current job position', 13, '2018-02-11 14:41:27', '2018-02-11 14:41:27'),
('Signup_card3_label_institute', 'Institute', 14, '2018-02-11 14:41:35', '2018-02-11 14:41:35'),
('Signup_card3_back_btn', 'Go Back', 15, '2018-02-11 14:41:44', '2018-02-11 14:41:44'),
('Signup_card3_next_btn', 'Next', 16, '2018-02-11 14:41:53', '2018-02-11 14:41:53'),
('Signup_card3_signin_text', 'Already have an account? Sign In', 17, '2018-02-11 14:42:05', '2018-02-11 14:42:05'),
('Signup_card3_heading', '<h2>Your detail as a Teacher</h2>', 18, '2018-02-11 14:42:19', '2018-02-17 09:15:45'),
('Signup_card3_label_educationLevel', 'Your current education level', 19, '2018-02-11 14:42:34', '2018-02-11 14:42:34'),
('Signup_card3_label_institute', 'Institute', 20, '2018-02-11 14:42:46', '2018-02-11 14:42:46'),
('Signup_card3_back_btn', 'Go Back', 21, '2018-02-11 14:43:31', '2018-02-11 14:43:31'),
('Signup_card3_next_btn', 'Next', 22, '2018-02-11 14:43:45', '2018-02-11 14:43:45'),
('Signup_card3_signin_text', 'Already have an account? Sign In', 23, '2018-02-11 14:43:56', '2018-02-11 14:43:56'),
('Signup_card4_heading', '<h2>About You</h2>', 24, '2018-02-11 14:54:35', '2018-02-17 10:20:31'),
('Signup_card4_label_interestedCourses', 'Select your interested courses', 25, '2018-02-11 14:54:45', '2018-02-11 14:54:45'),
('Signup_card4_heading2', '<h4 align=\"center\">Add Education</h4>', 26, '2018-02-11 14:54:59', '2018-02-17 11:29:25'),
('Signup_card4_label_educationLevel', 'Select education level', 27, '2018-02-11 14:55:11', '2018-02-11 14:55:11'),
('Signup_card4_institute', 'Institute', 28, '2018-02-11 14:55:33', '2018-02-11 14:55:33'),
('Signup_card4_fromYear', 'From', 29, '2018-02-11 14:55:41', '2018-02-11 14:55:41'),
('Signup_card4_toYear', 'To', 30, '2018-02-11 14:55:51', '2018-02-11 14:55:51'),
('Signup_card4_add_btn', 'Add', 31, '2018-02-11 14:56:27', '2018-02-11 14:56:27'),
('Signup_card4_back_btn', 'Go Back', 32, '2018-02-11 14:56:44', '2018-02-11 14:56:44'),
('Signup_card4_next_btn_teacher', 'Next', 33, '2018-02-11 14:57:09', '2018-02-11 14:57:09'),
('Signup_card4_next_btn_student', 'Submit', 34, '2018-02-11 14:57:21', '2018-02-11 14:57:21'),
('Signup_card4_signin_text', 'Already have an account? Sign In', 35, '2018-02-11 14:57:32', '2018-02-11 14:57:32'),
('Signup_card5_heading', '<h2>Tell us about your experience</h2>\n', 36, '2018-02-11 14:57:53', '2018-02-17 11:49:47'),
('Signup_card5_label_masterCourses', 'Select your master courses', 37, '2018-02-11 14:58:01', '2018-02-11 14:58:01'),
('Signup_card5_heading2', '<h4 align=\"center\">Add Experience</h4>', 38, '2018-02-11 14:58:15', '2018-02-17 11:51:32'),
('Signup_card5_label_jobPosition', 'Your job position', 39, '2018-02-11 14:58:27', '2018-02-11 14:58:27'),
('Signup_card5_institute', 'Institute', 40, '2018-02-11 14:59:04', '2018-02-11 14:59:04'),
('Signup_card5_fromYear', 'From', 41, '2018-02-11 14:59:10', '2018-02-11 14:59:10'),
('Signup_card5_toYear', 'To', 42, '2018-02-11 14:59:19', '2018-02-11 14:59:19'),
('Signup_card5_add_btn', 'Add', 43, '2018-02-11 14:59:28', '2018-02-11 14:59:28'),
('Signup_card5_back_btn', 'Go Back', 44, '2018-02-11 14:59:37', '2018-02-11 14:59:37'),
('Signup_card5_next_btn_teacher', 'Register', 45, '2018-02-11 14:59:47', '2018-02-11 14:59:47'),
('Signup_card5_signin_text', 'Already have an account? Sign In', 46, '2018-02-11 14:59:56', '2018-02-11 14:59:56'),
('Signin_heading', '<h2>Please Provide Your Login Details</h2>', 47, '2018-02-11 15:00:07', '2018-02-17 00:26:06'),
('Signin_label_heading', 'Username', 48, '2018-02-11 15:00:21', '2018-02-11 15:00:21'),
('Signin_label_password', 'Password', 49, '2018-02-11 15:00:30', '2018-02-11 15:00:30'),
('Signin_forgetPass_btn', '<a class=\"btn btn-default col-md-4 col-md-offset-1\" href=\"/forgetpass\" type=\"button\">Forget Password?</a>', 50, '2018-02-11 15:00:42', '2018-02-17 12:37:20'),
('Signin_signin_btn', 'Sign in', 51, '2018-02-11 15:00:50', '2018-02-17 00:42:20'),
('Signin_signup_text', '<p >Not have an account? <a href=\"/signup\">Sign up</a></p>', 52, '2018-02-11 15:01:01', '2018-02-17 00:41:54'),
('usernameError', 'Username should not be empty', 53, '2018-02-11 15:01:20', '2018-02-11 15:01:20'),
('emailError', 'Email should not be empty', 54, '2018-02-11 15:02:06', '2018-02-11 15:02:06'),
('passwordError', 'Password should not be empty', 55, '2018-02-11 15:02:22', '2018-02-11 15:02:22'),
('confirmPasswordError', 'Confirm Password should not be empty', 56, '2018-02-11 15:02:31', '2018-02-11 15:02:31'),
('fieldEmptyError', 'This field should not be empty', 57, '2018-02-11 15:02:41', '2018-02-17 09:47:35'),
('passwordMistmatchError', 'Password and Confirm Password does not match', 58, '2018-02-11 15:02:50', '2018-02-11 15:02:50'),
('uniqueUsernameError', 'Username has been used before', 59, '2018-02-11 15:03:00', '2018-02-11 15:03:00'),
('uniqueEmailError', 'Email has been used before', 60, '2018-02-11 15:03:11', '2018-02-11 15:03:11'),
('typeError', 'Please select at least one', 61, '2018-02-11 15:03:22', '2018-02-11 15:03:22'),
('invalidEmailError', 'Invalid Email', 62, '2018-02-11 15:03:33', '2018-02-11 15:03:33'),
('invalidPhoneError', 'Invalid Phone Number', 63, '2018-02-11 15:03:42', '2018-02-11 15:03:42'),
('invalidFromTo', 'From year should be less then to year', 64, '2018-02-11 15:03:51', '2018-02-11 15:03:51'),
('emailNotFound', 'User will this email address not found', 65, '2018-02-11 15:04:02', '2018-02-11 15:04:02'),
('invalidName', 'Invalid name', 66, '2018-02-11 15:04:21', '2018-02-11 15:04:21'),
('noAccount', 'No Account Found with the username provided', 67, '2018-02-11 15:04:29', '2018-02-11 15:04:29'),
('usernamePasswordMismatch', 'Username or password is incorrect', 68, '2018-02-11 15:04:38', '2018-02-11 15:04:38'),
('EmailNotVerified', 'This account requires email verification <br>Don\'t have a token? <a href=\'/token/resend\'>request a new one!</a>', 69, '2018-02-11 15:04:52', '2018-02-17 00:37:09'),
('AddedSuccessfully', 'Added Successfully', 70, '2018-02-11 15:05:03', '2018-02-11 15:05:03'),
('SomethingWentWrong', 'Something went wrong', 71, '2018-02-11 15:05:11', '2018-02-11 15:05:11'),
('left_menu_1', '<a href=\"/profile\">Find Students</a>', 72, '2018-02-11 15:39:37', '2018-02-11 15:39:37'),
('left_menu_2', '<a href=\"/search\">How it work</a>', 73, '2018-02-11 15:39:44', '2018-02-11 15:39:44'),
('right_menu_2', '<a href=\"/signup\">Sign Up</a>', 74, '2018-02-11 15:39:58', '2018-02-11 15:39:58'),
('right_menu_3', '<a href=\"#\">Start Teaching</a>', 75, '2018-02-11 15:40:06', '2018-02-11 15:40:06'),
('Banner_heading', '<h1 class=\"large-heading\">Find students with similar interests</h1>', 76, '2018-02-11 15:40:15', '2018-02-16 21:13:35'),
('Banner_inputField_placeholder', 'Which topic you world love to explore', 77, '2018-02-11 15:40:24', '2018-02-11 15:40:24'),
('Banner_button_label', 'Post Request', 78, '2018-02-11 15:40:32', '2018-02-11 15:40:32'),
('Landing_page_section_2_title', '<h1 class=\"large-heading center-heading\">How it Works</h1>\n', 79, '2018-02-11 15:40:42', '2018-02-17 00:13:42'),
('Landing_page_section_3_title', '<h1 class=\"large-heading center-heading\">Find Teachers By Categories</h1>', 80, '2018-02-11 15:40:50', '2018-02-17 00:16:01'),
('Signup_1_username_label', 'Username', 81, '2018-02-11 15:41:08', '2018-02-17 02:19:16'),
('Signup_1_Email_label', 'Email', 82, '2018-02-11 15:41:21', '2018-02-17 02:19:15'),
('Signup_1_password_label', 'Password', 83, '2018-02-11 15:41:27', '2018-02-17 02:19:14'),
('Signup_1_confrimPassword_label', 'Confirm Password', 84, '2018-02-11 15:41:36', '2018-02-17 02:19:13'),
('Signup_1_subheading', '<p>Sign up as:</p>', 85, '2018-02-11 15:41:45', '2018-02-17 02:19:28'),
('Signup_1_choice1', 'Teacher', 86, '2018-02-11 15:41:53', '2018-02-17 01:50:02'),
('Signup_1_choice2', 'Student', 87, '2018-02-11 15:42:00', '2018-02-17 01:50:01'),
('Signup_1_submit_button', 'Continue', 88, '2018-02-11 15:42:08', '2018-02-11 15:42:08'),
('Sign_1_signin_text', '<p>Already have an account? <a href=\"/signin\">Sign In</a></p>\n', 89, '2018-02-11 15:42:15', '2018-02-17 02:07:02'),
('Landing_page_description_find_teacher', '<p class=\"container-intro\" style=\"font-weight:300\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>', 90, '2018-02-17 00:16:53', '2018-02-17 00:17:52'),
('Signup_1_heading', '<h2>Please Provide Your Login Details</h2', 91, '2018-02-17 01:05:33', '2018-02-17 01:05:33'),
('Something_went_wrong', '<p>Something went wrong</p>', 92, '2018-02-17 01:08:35', '2018-02-17 01:08:35'),
('signup_2_btn_modal', 'Save', 93, '2018-02-17 08:52:26', '2018-02-17 08:52:26'),
('experience_table_content', '<th>Job Position</th>     <th>Institute Name</th>      <th>From</th>     <th>To</th>     <th></th>', 94, '2018-02-17 12:01:52', '2018-02-17 12:01:52'),
('experience_btn_remove', 'Remove', 95, '2018-02-17 12:05:57', '2018-02-17 12:05:57'),
('experience_btn_edit', 'Edit', 96, '2018-02-17 12:06:09', '2018-02-17 12:06:09'),
('experience_btn_save', 'Save', 97, '2018-02-17 12:07:45', '2018-02-17 12:07:45'),
('experience_btn_cancel', 'Cancel', 98, '2018-02-17 12:08:01', '2018-02-17 12:08:01'),
('signup_confirmation_message', '<h2>Thank You!</h2>       <p>Email has been sent to your account please verify your account before <a href=\"/signin\">Login</a></p>', 99, '2018-02-17 12:19:20', '2018-02-17 12:19:20'),
('Signup_card3_heading_student', '<h2>Your detail as a Student</h2>', 100, '2018-02-17 12:24:17', '2018-02-17 12:24:17'),
('brand_name', '<a class=\"navbar-brand\" routerLink=\"/a\">Vollage</a>', 101, '2018-02-17 14:03:11', '2018-02-17 14:03:11'),
('header_search_label', 'Search', 102, '2018-02-17 14:04:39', '2018-02-17 14:04:39'),
('header_menu_1', '<a href=\"/a/wall/classroom\">My Classes</a>', 103, '2018-02-17 14:05:55', '2018-02-17 14:05:55'),
('header_menu_2', '<a href=\"#\">My Groups</a>', 104, '2018-02-17 14:06:12', '2018-02-17 14:06:12'),
('forum_search_label', 'Advance Search', 105, '2018-02-17 19:08:55', '2018-02-17 19:08:55'),
('forum_heading', '<h3 class=\"wall-heading\"><i class=\"fa fa-users\"></i> Discussion Forum</h3>', 106, '2018-02-17 19:10:19', '2018-02-17 20:06:38'),
('Select_categories_label', 'Select Topic Categories', 107, '2018-02-17 20:03:05', '2018-02-17 20:03:05'),
('label_sort_by', 'Sort by', 108, '2018-02-17 20:04:15', '2018-02-17 20:04:15'),
('btn_create_forum', '<i class=\"fa fa-plus\"></i> Create Topic', 109, '2018-02-17 20:10:37', '2018-02-17 20:10:37'),
('text_no_forum', 'No forum', 110, '2018-02-17 20:11:29', '2018-02-17 20:11:29'),
('account_review', '<p>Your account is being reviewed by admin!</p>', 111, '2018-02-17 20:56:32', '2018-02-17 20:56:32'),
('forum_date_text', 'Date', 112, '2018-02-17 21:02:20', '2018-02-17 21:02:20'),
('create_new_topic_heading', '<h2 class=\"card-title\" style=\"text-align: center;\">Create New Topic</h2>', 113, '2018-02-17 21:04:41', '2018-02-17 21:04:41'),
('label_forum_title', 'Title', 114, '2018-02-17 21:47:05', '2018-02-17 21:47:05'),
('forum_select_categories_text', 'Select topic categories', 115, '2018-02-17 21:48:22', '2018-02-17 21:48:22'),
('forum_label_keyword', 'Keyword', 116, '2018-02-17 21:50:42', '2018-02-17 21:50:42'),
('forum_placeholder_keyword', 'Keyword1, keyword2, ...', 117, '2018-02-17 21:51:09', '2018-02-17 21:51:09'),
('forum_categories_label', 'Categories', 118, '2018-02-17 21:53:42', '2018-02-17 21:53:42'),
('forum_description_label', 'Description', 119, '2018-02-17 21:55:06', '2018-02-17 21:55:06'),
('forum_initialmessage_label', 'Message', 120, '2018-02-17 21:55:17', '2018-02-17 21:55:17'),
('forum_description_placeholder', 'Enter description', 121, '2018-02-17 21:56:51', '2018-02-17 21:56:51'),
('forum_initialmessage_placeholder', 'Enter starting message to initiate the discussion', 122, '2018-02-17 21:57:42', '2018-02-17 21:57:42'),
('forum_btn_cancel', 'Cancel', 123, '2018-02-17 22:00:59', '2018-02-17 22:00:59'),
('forum_btn_create', 'Create', 124, '2018-02-17 22:01:10', '2018-02-17 22:01:10'),
('forum_label_replies', 'Replies', 125, '2018-02-17 22:14:08', '2018-02-17 22:14:08'),
('forum_label_postedby', 'Posted by', 126, '2018-02-17 22:14:51', '2018-02-17 22:14:51'),
('forum_label_lastactive', 'Last Active', 127, '2018-02-17 22:15:16', '2018-02-17 22:15:16'),
('text_forum_nocomment', 'No Comments', 128, '2018-02-17 22:18:59', '2018-02-17 22:18:59'),
('forum_label_comment', 'Comment.....', 129, '2018-02-17 22:19:22', '2018-02-17 22:19:22'),
('label_review_profile', 'Reviews', 130, '2018-02-28 12:54:12', '2018-02-28 12:54:12'),
('label_oneliner_profile', '<a >Add One Liner</a>', 131, '2018-02-28 12:56:06', '2018-02-28 12:56:06'),
('label_male_profile', '<i class=\"fa fa-user\"></i> Male', 132, '2018-02-28 12:59:25', '2018-02-28 12:59:25'),
('label_female_profile', '<i class=\"fa fa-user\"></i> Female', 133, '2018-02-28 12:59:44', '2018-02-28 12:59:44'),
('label_upload_image_edit_profile', 'Upload Image', 134, '2018-02-28 13:01:54', '2018-02-28 13:01:54'),
('label_oneliner_edit_profile', 'One Liner', 135, '2018-02-28 13:04:35', '2018-02-28 13:04:35'),
('label_gender_edit_profile', 'Gender', 136, '2018-02-28 13:15:28', '2018-02-28 13:15:28'),
('label_institute_edit_profile', 'Institute', 137, '2018-02-28 13:15:43', '2018-02-28 13:15:43'),
('label_date_edit_profile', 'DOB', 138, '2018-02-28 13:15:56', '2018-02-28 13:15:56'),
('label_country_edit_profile', 'Country', 139, '2018-02-28 13:16:04', '2018-02-28 13:16:04'),
('label_save_edit_profile', 'Save', 140, '2018-02-28 13:23:09', '2018-02-28 13:23:09'),
('label_cancel_edit_profile', 'Cancel', 141, '2018-02-28 13:23:23', '2018-02-28 13:23:23'),
('label_classroom_profile', 'Class Room', 142, '2018-02-28 13:27:18', '2018-02-28 13:27:18'),
('label_viewall_profile', 'View All', 143, '2018-02-28 13:28:56', '2018-02-28 13:28:56'),
('label_advancesearch_file', 'Advance Search....', 144, '2018-02-28 17:00:15', '2018-02-28 17:00:15'),
('heading_file', '<i class=\"fa fa-users\"></i> Public Resources ', 145, '2018-02-28 17:03:36', '2018-02-28 17:03:36'),
('label_sortby_file', 'Sort by', 146, '2018-02-28 17:05:44', '2018-02-28 17:05:44'),
('btn_upload_file_', '<i class=\"glyphicon glyphicon-cloud-upload\"></i> Upload File', 147, '2018-02-28 17:06:49', '2018-02-28 17:06:49'),
('heading_nofile', 'No Files', 148, '2018-02-28 17:09:12', '2018-02-28 17:09:12'),
('heading_edit_file', '<h2 class=\"card-title\" style=\"text-align: center;\">Update File Details</h2>', 149, '2018-02-28 17:25:13', '2018-02-28 17:25:13'),
('label_title_edit_file', 'Enter Title', 150, '2018-02-28 17:26:14', '2018-02-28 17:26:14'),
('label_category_edit_file', 'Select Categories', 151, '2018-02-28 17:27:09', '2018-02-28 17:27:09'),
('btn_cancel_edit_file', 'Cancel', 152, '2018-02-28 18:02:45', '2018-02-28 18:02:45'),
('btn_save_edit_file', 'Save', 153, '2018-02-28 18:02:50', '2018-02-28 18:02:50'),
('btn_download_file', 'Download <span class=\"glyphicon glyphicon-download-alt\"></span>', 154, '2018-02-28 18:06:27', '2018-02-28 18:06:27'),
('label_postedby_file', 'Posted By:', 155, '2018-02-28 18:07:27', '2018-02-28 18:07:27'),
('label_uploadedat_file', 'Uploaded At:', 156, '2018-02-28 18:07:44', '2018-02-28 18:07:44'),
('label_downloads_file', 'Downloads', 157, '2018-02-28 18:08:20', '2018-02-28 18:08:20'),
('heading_upload_file', '<h2 class=\"card-title\" style=\"text-align: center;\">Upload new File</h2>', 158, '2018-02-28 18:18:29', '2018-02-28 18:18:29'),
('label_title_upload_file', 'Title', 159, '2018-02-28 18:21:05', '2018-02-28 18:21:05'),
('label_categories_upload_file', 'Select Topic Categories', 160, '2018-02-28 18:22:23', '2018-02-28 18:22:23'),
('label_uploadbtn_upload_file', 'Upload File', 161, '2018-02-28 18:24:37', '2018-02-28 18:24:37'),
('label_description_upload_file', 'Description', 162, '2018-02-28 18:24:49', '2018-02-28 18:24:49'),
('btn_cancel_upload_file', 'Cancel', 163, '2018-02-28 18:28:23', '2018-02-28 18:28:23'),
('btn_upload_file', 'Upload', 164, '2018-02-28 18:28:31', '2018-02-28 18:28:31'),
('heading_description_profile', '<h4 class=\" title card-title\" style=\"float:left\"> Description</h4>', 165, '2018-02-28 23:35:54', '2018-02-28 23:35:54'),
('label_add_description_profile', 'Add Description', 166, '2018-02-28 23:56:20', '2018-02-28 23:56:20'),
('label_no_description_profile', 'No Description', 167, '2018-02-28 23:56:44', '2018-02-28 23:56:44'),
('btn_cancel_description_profile', 'Cancel', 168, '2018-02-28 23:57:42', '2018-02-28 23:57:42'),
('btn_save_description_profile', 'Save', 169, '2018-02-28 23:57:59', '2018-02-28 23:57:59'),
('heading_education_profile', 'Education', 170, '2018-03-01 00:08:38', '2018-03-01 00:08:38'),
('label_no_education_profile', '<h4>No Education</h4>', 171, '2018-03-01 00:09:30', '2018-03-01 00:09:30'),
('label_to_profile', 'To', 172, '2018-03-01 00:10:36', '2018-03-01 00:10:36'),
('label_no_experience_profile', '<h4>No Experience</h4>', 173, '2018-03-01 00:15:23', '2018-03-01 00:15:23'),
('label_to_profile', 'To', 174, '2018-03-01 00:15:33', '2018-03-01 00:15:33'),
('label_experience_profile', 'Experience', 175, '2018-03-01 00:15:45', '2018-03-01 00:15:45'),
('heading_addititonal_details', 'Additional Details', 176, '2018-03-01 22:18:12', '2018-03-01 22:18:12'),
('addtoconnection_label_profile', '<i class=\"fa fa-user\"></i> ADD TO CONNECTIONS', 177, '2018-03-01 22:19:27', '2018-03-01 22:19:27'),
('label_student_additionaldetail_profile', 'Student', 178, '2018-03-01 22:19:56', '2018-03-01 22:19:56'),
('label_at_additionaldetail_profile', 'at', 179, '2018-03-01 22:20:20', '2018-03-01 22:20:20'),
('label_joinedon_additionaldetail_profile', '<h6 class=\"card-title\">Joined On</h6>', 180, '2018-03-01 22:21:10', '2018-03-01 22:21:10'),
('label_fullname_additional_detail_profile', 'Fullname', 181, '2018-03-01 22:21:55', '2018-03-01 22:21:55'),
('label_educationlevel_additional_detail_profile', 'Your current education level', 182, '2018-03-01 22:24:14', '2018-03-01 22:24:14'),
('label_job_additional_detail_profile', 'Your Current Job Position', 183, '2018-03-01 22:24:47', '2018-03-01 22:24:47'),
('btn_cancel_additionaldetail_profile', 'Cancel', 184, '2018-03-01 22:26:14', '2018-03-01 22:26:14'),
('btn_save_additionaldetail_profile', 'Save', 185, '2018-03-01 22:26:21', '2018-03-01 22:26:21'),
('title_interested_in', 'INTERESTED IN', 186, '2018-03-01 22:34:34', '2018-03-01 22:34:34'),
('title_master_in', 'MASTER IN', 187, '2018-03-01 22:34:55', '2018-03-01 22:34:55'),
('label_profile_navbar_overview', 'Overview', 188, '2018-03-01 22:57:46', '2018-03-01 22:57:46'),
('label_profile_navbar_connection', 'Connection', 189, '2018-03-01 22:57:57', '2018-03-01 22:57:57'),
('label_profile_navbar_experience', 'Experience', 190, '2018-03-01 22:58:06', '2018-03-01 22:58:06'),
('label_profile_navbar_uploads', 'Uploads', 191, '2018-03-01 22:58:20', '2018-03-01 22:58:20'),
('label_profile_navbar_education', 'Education', 192, '2018-03-01 22:58:30', '2018-03-01 22:58:30'),
('total_upload_heading', 'Total Uploads', 193, '2018-03-01 22:59:14', '2018-03-01 22:59:14'),
('upload_history_heading', 'Upload History', 194, '2018-03-01 22:59:29', '2018-03-01 22:59:29'),
('credit_earned_heading', 'Credit Earned', 195, '2018-03-01 22:59:50', '2018-03-01 22:59:50'),
('total_points_heading', 'Total points', 196, '2018-03-01 23:00:19', '2018-03-01 23:00:19'),
('label_uploaded_uploads_profile', 'Upload', 197, '2018-03-01 23:14:14', '2018-03-01 23:14:14'),
('label_nofile_uploads_profile', 'No files', 198, '2018-03-01 23:14:38', '2018-03-01 23:14:38'),
('label_download_uploads_profile', 'Download <span class=\"glyphicon glyphicon-download-alt\"></span>', 199, '2018-03-01 23:16:06', '2018-03-01 23:16:06'),
('label_edit_uploads_profile', 'Edit <span class=\"fa fa-pencil\"></span>', 200, '2018-03-01 23:16:47', '2018-03-01 23:16:47'),
('label_date_classroom', 'Date', 201, '2018-03-03 11:40:40', '2018-03-03 11:40:40'),
('heading_classroom_request', '<h2>Manage Classroom Request</h2>', 202, '2018-03-03 11:41:24', '2018-03-03 11:41:24'),
('label_request_classroom', 'Request', 203, '2018-03-03 11:41:45', '2018-03-03 11:41:45'),
('label_show_classroom', 'Show', 204, '2018-03-03 11:41:58', '2018-03-03 11:41:58'),
('label_activerequest_classroom', 'Active Request', 205, '2018-03-03 11:42:35', '2018-03-03 11:42:35'),
('heading_date_classroom', '<h6 class=\" date light-text\">24-Sep-2018</h6>', 206, '2018-03-03 11:43:28', '2018-03-03 11:43:28'),
('label_classsize_classroom', 'Class size:', 207, '2018-03-03 11:44:39', '2018-03-03 11:44:39'),
('label_budget_classroom', 'Budget', 208, '2018-03-03 11:44:54', '2018-03-03 11:44:54'),
('label_preferredtime_classroom', 'Preferred Time', 209, '2018-03-03 11:45:18', '2018-03-03 11:45:18'),
('label_preferreddate_classroom', 'Preferred  Date', 210, '2018-03-03 11:45:39', '2018-03-03 11:45:39'),
('label_teacher_btn_classroom', 'Teacher', 211, '2018-03-03 11:47:07', '2018-03-03 11:47:07'),
('label_student_btn_classroom', 'Student', 212, '2018-03-03 11:47:12', '2018-03-03 11:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `type` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `pictureFD` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `oneliner` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`type`, `fullname`, `country`, `gender`, `pictureFD`, `dob`, `phone`, `username`, `photo_url`, `isDeleted`, `description`, `oneliner`, `id`, `createdAt`, `updatedAt`) VALUES
('1', 'Ahsansam', 'Pakistan', 1, NULL, 'Sat Aug 17 1996', '923328287820', 'Ahsansam', '/user_images/1_icon.png', 0, NULL, NULL, 1, '2017-12-08 12:17:07', '2017-12-08 12:17:08'),
('2', 'Teachersdfafasdf', 'Pakistan', 1, NULL, 'Fri Aug 16 1996', '923328287820', 'ahsansam1', '/user_images/2_atomix_user31.png', 0, 'i am awesome', 'i am awesome', 2, '2017-12-08 15:25:16', '2017-12-10 16:30:19'),
('1', 'Sana Qureshi', 'Pakistan', 2, NULL, 'Wed Dec 15 2004', '923328287820', 'sam17896', '/user_images/3_790d2343.png', 0, NULL, 'i am super awesome', 3, '2017-12-08 15:27:56', '2018-02-28 13:25:02'),
('2', 'Ahsan Sohail', 'Pakistan', 1, NULL, 'Sat Aug 17 1996', '923328287820', 'k142109', '/user_images/default.png', 0, NULL, NULL, 4, '2017-12-10 18:41:24', '2017-12-10 18:41:24'),
('2', 'Ahsansam', 'Pakistan', 1, NULL, 'Sat Aug 17 1996', '923328287820', 'sam999', '/user_images/default.png', 0, NULL, NULL, 5, '2017-12-11 19:02:45', '2017-12-11 19:02:45'),
('1', 'Khadija Sohail', 'Pakistan', 2, NULL, 'Thu Dec 30 2004', '923328287820', 'khadija', '/user_images/6_listing-view img.jpg', 0, NULL, NULL, 6, '2017-12-11 23:01:31', '2017-12-11 23:01:31'),
('2', 'mailTest', 'Pakistan', 1, NULL, 'Thu Dec 30 2004', '923328287820', 'mailtest', '/user_images/7_profileImg.jpg', 0, NULL, NULL, 7, '2017-12-14 06:38:50', '2017-12-14 06:38:51'),
('2', 'mailTest', 'Pakistan', 1, NULL, 'Thu Dec 30 2004', '923328287820', 'mailtest', '/user_images/default.png', 0, NULL, NULL, 8, '2017-12-14 06:40:50', '2017-12-14 06:40:50'),
('2', 'mailtest', 'Pakistan', 1, NULL, 'Tue Dec 17 1996', '923328287820', 'maitest2', '/user_images/default.png', 0, 'i am awesome', 'i am awesome', 9, '2017-12-14 06:46:25', '2017-12-14 11:25:49'),
('1', 'sfap', 'Pakistan', 1, NULL, 'Thu Dec 30 2004', '923328287820', 'mailtest3', '/user_images/default.png', 0, NULL, NULL, 10, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
('2', 'ahsansam', 'Pakistan', 1, NULL, 'Thu Dec 30 2004', '923328287820', 'mailtest4', '/user_images/default.png', 0, NULL, NULL, 11, '2017-12-14 13:30:52', '2017-12-14 13:30:52'),
('1', 'asfp', 'Montserrat', 1, NULL, 'Thu Dec 30 2004', '923328287820', 'mailtest6', '/user_images/default.png', 0, NULL, NULL, 12, '2017-12-14 13:32:34', '2017-12-14 13:32:34'),
('1', 'fahad farooq', 'Pakistan', 1, NULL, 'Thu Dec 30 2004', '923124402650', 'fahad', '/user_images/default.png', 0, NULL, NULL, 13, '2018-02-28 03:10:38', '2018-02-28 03:10:38'),
('1', 'Hisham Ahmed', 'Pakistan', 1, NULL, 'Thu Sep 19 1996', '923322896908', 'hisham', '/user_images/default.png', 0, NULL, NULL, 14, '2018-03-08 04:07:47', '2018-03-08 04:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `name` varchar(255) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `combineRating` varchar(255) DEFAULT NULL,
  `downloadLink` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`name`, `person`, `description`, `combineRating`, `downloadLink`, `id`, `createdAt`, `updatedAt`) VALUES
('fsa', 5, 'fsa', NULL, '/uploads/sam999_BD-Proposal.docx', 5, '2017-12-11 21:35:49', '2017-12-11 21:35:49'),
('File', 6, 'update ho rahi hon?', NULL, '/uploads/6_BD-Proposal.docx', 6, '2017-12-12 14:31:42', '2017-12-14 04:25:17'),
('asfsda', 6, 'gfasd', NULL, '/uploads/6_BD-Proposal.docx', 7, '2017-12-12 14:37:12', '2017-12-12 14:37:12'),
('Fil', 6, 'hafh', NULL, '/uploads/6_FYP-I+Evaluation+Schedule.xlsx', 8, '2017-12-14 04:31:34', '2017-12-14 04:31:34'),
('tyry', 1, 'sfag', NULL, '/uploads/undefined_Around-You.docx', 9, '2018-03-05 00:25:58', '2018-03-05 00:25:58'),
('fdsfa', 1, 'saf', NULL, '/uploads/undefined_k142109.txt', 10, '2018-03-05 00:30:17', '2018-03-05 00:30:17'),
('adgsdg', 1, 'gsd', NULL, '/uploads/undefined_18x36 inch VInyal (4).jpg', 11, '2018-03-05 00:33:07', '2018-03-05 00:33:07'),
('rgdg', 1, 'sagdgd', NULL, '/uploads/undefined_k142109.txt', 12, '2018-03-05 00:34:19', '2018-03-05 00:34:19'),
('fhsdg', 1, 'asdas', NULL, '/uploads/undefined_Ahsan v2.pdf', 13, '2018-03-05 00:38:29', '2018-03-05 00:38:29'),
('fasf', 1, 'safasf', NULL, 'F:\\Vollage\\vollage-api\\assets\\uploads\\5cc29ddf-39c6-4707-a3ba-7e53a188fb39.pdf', 14, '2018-03-05 00:43:49', '2018-03-05 00:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `sidebar`
--

CREATE TABLE `sidebar` (
  `url` longtext,
  `name` longtext,
  `icon` varchar(200) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sidebar`
--

INSERT INTO `sidebar` (`url`, `name`, `icon`, `id`, `createdAt`, `updatedAt`) VALUES
('/a/profile/', 'My Profile', 'user', 1, '2018-02-17 13:54:52', '2018-02-17 13:54:52'),
('/a/wall/forum', 'Forums', 'comments', 2, '2018-02-17 13:54:52', '2018-02-17 13:54:52'),
('/a/wall/file', 'Pubic Uploads', 'file', 3, '2018-02-17 13:55:14', '2018-02-17 13:55:14'),
('/a/wall/classroom', 'Classroom Requests', 'align-justify', 4, '2018-03-02 12:51:11', '2018-03-02 12:51:11'),
('/a/videotest', 'Video Test', 'camera', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(10) UNSIGNED NOT NULL,
  `educationalLevel` int(11) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `deposited_amount` float DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `educationalLevel`, `institute`, `deposited_amount`, `personId`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'FAST', 0, 1, '2017-12-08 12:17:08', '2017-12-08 12:17:08'),
(3, 3, 'FAST', 0, 3, '2017-12-08 15:27:56', '2018-02-28 13:25:04'),
(6, 1, 'FAST', 0, 6, '2017-12-11 23:01:31', '2017-12-11 23:01:31'),
(10, 1, 'FAST', 0, 10, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
(12, 2, 'FAST', 0, 12, '2017-12-14 13:32:34', '2017-12-14 13:32:34'),
(13, 3, 'FAST ', 0, 13, '2018-02-28 03:10:40', '2018-02-28 03:10:40'),
(14, 3, 'Fast Nuces', 0, 14, '2018-03-08 04:07:48', '2018-03-08 04:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `isPublished` tinyint(1) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `position`, `institute`, `isPublished`, `personId`, `createdAt`, `updatedAt`) VALUES
(2, 6, 'Systems Limited', 1, 2, '2017-12-08 15:25:16', '2017-12-10 16:30:19'),
(4, 2, 'Folio3', 1, 4, '2017-12-10 18:41:25', '2017-12-14 06:54:41'),
(5, 3, 'Folio3', 1, 5, '2017-12-11 19:02:46', '2017-12-14 06:54:58'),
(7, 2, 'FAST', 1, 7, '2017-12-14 06:38:51', '2017-12-14 06:54:52'),
(9, 3, 'Meritorious', 1, 9, '2017-12-14 06:46:26', '2017-12-14 11:25:37'),
(11, 1, 'FAST', 0, 11, '2017-12-14 13:30:52', '2017-12-14 13:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `lastmessageid` int(11) DEFAULT NULL,
  `lastpersonid` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `roomid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`lastmessageid`, `lastpersonid`, `icon`, `roomid`, `name`, `id`, `createdAt`, `updatedAt`) VALUES
(11, 3, 'default', NULL, 'mailtest', 3, '2018-03-06 23:05:27', '2018-03-08 04:04:36'),
(4, 1, 'default', NULL, 'mailtest', 4, '2018-03-07 00:39:11', '2018-03-07 00:39:11'),
(6, 1, 'default', NULL, 'khadij', 5, '2018-03-07 12:28:17', '2018-03-07 12:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `threadmember`
--

CREATE TABLE `threadmember` (
  `thread` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threadmember`
--

INSERT INTO `threadmember` (`thread`, `student`, `image`, `username`, `status`, `id`, `createdAt`, `updatedAt`) VALUES
(3, 10, '/user_images/default.png', 'mailtest3', 1, 4, '2018-03-06 23:05:27', '2018-03-06 23:05:27'),
(4, 12, '/user_images/default.png', 'mailtest6', 1, 5, '2018-03-07 00:39:12', '2018-03-07 00:39:12'),
(5, 6, '/user_images/6_listing-view img.jpg', 'khadija', 1, 6, '2018-03-07 12:28:17', '2018-03-07 12:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `threadmessage`
--

CREATE TABLE `threadmessage` (
  `thread` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threadmessage`
--

INSERT INTO `threadmessage` (`thread`, `message`, `status`, `id`, `createdAt`, `updatedAt`) VALUES
(3, 3, NULL, 3, '2018-03-06 23:05:27', '2018-03-06 23:05:27'),
(4, 4, NULL, 4, '2018-03-07 00:39:12', '2018-03-07 00:39:12'),
(3, 5, 0, 5, '2018-03-07 00:44:03', '2018-03-07 00:44:03'),
(5, 6, NULL, 6, '2018-03-07 12:28:17', '2018-03-07 12:28:17'),
(3, 10, NULL, 7, '2018-03-07 14:05:51', '2018-03-07 14:05:51'),
(3, 11, NULL, 8, '2018-03-08 04:04:36', '2018-03-08 04:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `value` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `expiresAt` datetime DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`value`, `user`, `expiresAt`, `id`, `createdAt`, `updatedAt`) VALUES
('7f801fa9277ca5b9cf808302ecdc5872', 43, '2017-12-09 03:27:56', 43, '2017-12-08 15:27:56', '2017-12-08 15:27:56'),
('56e0be793a0b15f64bb88122ae9b611f', 41, '2017-12-10 13:54:54', 44, '2017-12-10 01:54:54', '2017-12-10 01:54:54'),
('bfdf80430e6d7be8847871503df9cce6', 42, '2017-12-10 14:10:00', 45, '2017-12-10 02:10:00', '2017-12-10 02:10:00'),
('3d57bb4d87aa1340bc1f6b8540ad72d7', 42, '2017-12-10 14:11:14', 46, '2017-12-10 02:11:14', '2017-12-10 02:11:14'),
('f8bc22dbbb245456d916ad467333220c', 47, '2017-12-14 18:38:50', 47, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
('78ec53a38e8b1769082cf4dbc2df846a', 50, '2017-12-15 01:10:30', 49, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
('8481cf77d04405da438e6258364a1381', 52, '2017-12-15 01:32:34', 51, '2017-12-14 13:32:34', '2017-12-14 13:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `provider` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `encryptedPassword` varchar(255) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `facebookId` varchar(255) DEFAULT NULL,
  `gmailId` varchar(255) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `personType` varchar(255) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`provider`, `username`, `email`, `encryptedPassword`, `isVerified`, `passwordResetToken`, `passwordResetExpires`, `facebookId`, `gmailId`, `personId`, `personType`, `id`, `createdAt`, `updatedAt`) VALUES
('Registeration', 'Ahsansam', 'ahsan.kai@gmail.co', '$2a$10$iubx8KSZdijIjptffpzIXut0tsqqCJXEKSrrGV1rvIJG1yQ8ZWs1K', 1, 'b8d2264fb4d206b205ccc32365ba270a', '2017-12-10 12:53:14', NULL, NULL, 1, '1', 41, '2017-12-08 12:17:07', '2017-12-10 00:53:14'),
('Registeration', 'ahsansam1', 'k142109@nu.edu', '$2a$10$8u6xbKOLmWNxypTvl2ojFODsd9RHvkxtY1WQByTz84NF1M.yrOqJy', 1, NULL, NULL, NULL, NULL, 2, '2', 42, '2017-12-08 15:25:16', '2017-12-10 02:14:00'),
('Registeration', 'sam17896', 'ahsan.kai@hotmail.co', '$2a$10$ZoAbM3bIUkHH1zo/Q.ghL.Jy.iyl7OGcx1k1/3qrITmQ06NIzA1vu', 1, NULL, NULL, NULL, NULL, 3, '1', 43, '2017-12-08 15:27:56', '2017-12-08 15:27:56'),
('Registeration', 'k142109', 'ahsan.kai@gmail.c', '$2a$10$aou8Bg2xuJJr6s/09ODoIeDKrM52z0YmWmMXsBDSyIv0LemBxl8OO', 1, NULL, NULL, NULL, NULL, 4, '2', 44, '2017-12-10 18:41:25', '2017-12-10 18:43:16'),
('Registeration', 'sam999', 'ahsan.kai@gmail.coma', '$2a$10$TfurrBlFufGFsphKCSpRWulF1fKh4LOd6Wj23N0DuEG3CO2S1Bvs6', 1, NULL, NULL, NULL, NULL, 5, '2', 45, '2017-12-11 19:02:46', '2017-12-11 19:03:53'),
('Registeration', 'khadija', 'ahsan.kai@gmail.combv', '$2a$10$oxDqbNR6EBWwT49WLAs83.II960DruJKrc0Cl86O942MP1SlJhN46', 1, NULL, NULL, NULL, NULL, 6, '1', 46, '2017-12-11 23:01:31', '2017-12-11 23:02:27'),
('Registeration', 'mailtest', 'ahsan.kai@gmail.comee', '$2a$10$UJQsGCJH58mknjhTMg.B0e6/gDlhjRf1iTomAxN41xHvM0dtrxOsy', 0, NULL, NULL, NULL, NULL, 7, '2', 47, '2017-12-14 06:38:50', '2017-12-14 06:38:50'),
('Registeration', 'maitest2', 'ahsan.kai@gmail.comas', '$2a$10$zDuYqAJ/CiT1CJ2NLodVMOl6AMfvhclgjyltYbxbWRUOU/iiP8cYG', 1, NULL, NULL, NULL, NULL, 9, '2', 49, '2017-12-14 06:46:25', '2017-12-14 06:49:00'),
('Registeration', 'mailtest3', 'k142081@nu.edu.pk', '$2a$10$GW2ov11Rs4FgSGmGY3DqhuGX4TnElxoqfhBN.D.GhhsXGATA3.J6G', 0, NULL, NULL, NULL, NULL, 10, '1', 50, '2017-12-14 13:10:30', '2017-12-14 13:10:30'),
('Registeration', 'mailtest4', 'k142109@nu.edu.pk', '$2a$10$MIHhHVSSPKo0D/D4glnHOu7atmBT..Z2L.vrliDeMiPPvU0vDsIoC', 1, NULL, NULL, NULL, NULL, 11, '2', 51, '2017-12-14 13:30:52', '2017-12-14 15:58:41'),
('Registeration', 'mailtest6', 'k142032@nu.edu.pk', '$2a$10$mzIzqovH5QuE5CtTbxWzYOEHaZ4xe0seJv3cnmkicX2sjH4Opa5IC', 0, NULL, NULL, NULL, NULL, 12, '1', 52, '2017-12-14 13:32:34', '2017-12-14 13:32:34'),
('Registeration', 'fahad', 'fahadfarooq54@gmail.com', '$2a$10$488CL72rM8bg3Vdeub3Ks.7qklvGs6X76Y4vFxi3Da3pmg.okUKt6', 1, NULL, NULL, NULL, NULL, 13, '1', 53, '2018-02-28 03:10:38', '2018-02-28 03:11:42'),
('Registeration', 'hisham', 'hisham.ahmed4@gmail.com', '$2a$10$Woh5FwKbQxAgCF/A.1mdw.1RLFpE6gzfbLSPy9nZi4YXTi3rIB4Bi', 1, NULL, NULL, NULL, NULL, 14, '1', 54, '2018-03-08 04:07:48', '2018-03-08 04:08:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educationlevel`
--
ALTER TABLE `educationlevel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filecategory`
--
ALTER TABLE `filecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filedownload`
--
ALTER TABLE `filedownload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filekeyword`
--
ALTER TABLE `filekeyword`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forumcategory`
--
ALTER TABLE `forumcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forumcomment`
--
ALTER TABLE `forumcomment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forumkeyword`
--
ALTER TABLE `forumkeyword`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forumtopic`
--
ALTER TABLE `forumtopic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_sort_option`
--
ALTER TABLE `forum_sort_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendrequest`
--
ALTER TABLE `friendrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `how_it_work`
--
ALTER TABLE `how_it_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interestedcourse`
--
ALTER TABLE `interestedcourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mastercourse`
--
ALTER TABLE `mastercourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metatag`
--
ALTER TABLE `metatag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sidebar`
--
ALTER TABLE `sidebar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personId` (`personId`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personId` (`personId`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threadmember`
--
ALTER TABLE `threadmember`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threadmessage`
--
ALTER TABLE `threadmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `personId` (`personId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `connection`
--
ALTER TABLE `connection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `educationlevel`
--
ALTER TABLE `educationlevel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filecategory`
--
ALTER TABLE `filecategory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `filedownload`
--
ALTER TABLE `filedownload`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `filekeyword`
--
ALTER TABLE `filekeyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `forumcategory`
--
ALTER TABLE `forumcategory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `forumcomment`
--
ALTER TABLE `forumcomment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `forumkeyword`
--
ALTER TABLE `forumkeyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `forumtopic`
--
ALTER TABLE `forumtopic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `forum_sort_option`
--
ALTER TABLE `forum_sort_option`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `friendrequest`
--
ALTER TABLE `friendrequest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `how_it_work`
--
ALTER TABLE `how_it_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `interestedcourse`
--
ALTER TABLE `interestedcourse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT for table `mastercourse`
--
ALTER TABLE `mastercourse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `metatag`
--
ALTER TABLE `metatag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sidebar`
--
ALTER TABLE `sidebar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `threadmember`
--
ALTER TABLE `threadmember`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `threadmessage`
--
ALTER TABLE `threadmessage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
