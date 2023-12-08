drop database if exists health_tracker;
SET FOREIGN_KEY_CHECKS = 0;

create database health_tracker;


use health_tracker;


CREATE TABLE `ha_category` (
  `catid` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_category`
--

INSERT INTO `ha_category` (`catid`, `name`) VALUES
(1, 'Weight'),
(2, 'Workout'),
(3, 'Sleep'),
(4, 'Steps'),
(5, 'Distance'),
(6, 'Powernap'),
(7, 'Calories');

-- --------------------------------------------------------

--
-- Table structure for table `ha_goals`
--

CREATE TABLE `ha_goals` (
  `gtid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `goal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_goals`
--

INSERT INTO `ha_goals` (`gtid`, `uid`, `goal`) VALUES
(1, 1, 30),
(2, 1, 30),
(3, 1, 8),
(4, 1, 1000),
(5, 1, 1000),
(6, 1, 8),
(7, 1, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `ha_goaltype`
--

CREATE TABLE `ha_goaltype` (
  `gtid` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `unit` int(10) UNSIGNED NOT NULL,
  `category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_goaltype`
--

INSERT INTO `ha_goaltype` (`gtid`, `name`, `unit`, `category`) VALUES
(1, 'Weight', 1, 1),
(2, 'Workout', 2, 2),
(3, 'Sleep', 3, 3),
(4, 'Steps', 4, 4),
(5, 'Distance', 5, 5),
(6, 'Powernap', 6, 6),
(7, 'Calories', 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ha_healthdata`
--

CREATE TABLE `ha_healthdata` (
  `hdid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `healthtype` int(10) UNSIGNED NOT NULL,
  `intensity` int(10) UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `timestart` datetime NOT NULL,
  `timeend` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_healthdata`
--

INSERT INTO `ha_healthdata` (`hdid`, `uid`, `healthtype`, `intensity`, `amount`, `timestart`, `timeend`) VALUES
(1, 1, 1, 0, 68, '2023-11-26 12:56:00', '2023-11-26 12:56:00'),
(2, 1, 3, 0, 1, '2023-11-26 12:57:00', '2023-11-26 12:58:00'),
(3, 1, 4, 0, 99, '2023-11-26 12:58:00', '2023-11-26 12:58:00'),
(4, 1, 5, 0, 1998, '2023-11-26 12:58:00', '2023-11-26 12:58:00'),
(5, 1, 7, 0, 30, '2023-11-17 12:58:00', '2023-11-26 12:59:00'),
(6, 1, 1, 0, 64, '2023-11-27 08:54:00', '2023-11-27 08:54:00'),
(7, 1, 4, 0, 100, '2023-11-27 08:54:00', '2023-11-27 08:54:00'),
(8, 1, 5, 0, 1000, '2023-11-27 08:54:00', '2023-11-27 08:55:00'),
(9, 1, 7, 0, 98, '2023-11-27 08:55:00', '2023-11-27 08:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `ha_healthtype`
--

CREATE TABLE `ha_healthtype` (
  `typeid` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `category` int(10) UNSIGNED NOT NULL,
  `unit` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_healthtype`
--

INSERT INTO `ha_healthtype` (`typeid`, `name`, `category`, `unit`) VALUES
(1, 'Weight', 1, 1),
(2, 'Workout', 2, 2),
(3, 'Sleep', 3, 3),
(4, 'Steps', 4, 4),
(5, 'Distance', 5, 5),
(6, 'Powernap', 6, 3),
(7, 'Calories', 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ha_intensity`
--

CREATE TABLE `ha_intensity` (
  `iid` int(10) UNSIGNED NOT NULL,
  `typeid` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `kcal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_intensity`
--

INSERT INTO `ha_intensity` (`iid`, `typeid`, `name`, `kcal`) VALUES
(1, 1, 'Low', 100),
(2, 1, 'Moderate', 200),
(3, 1, 'High', 300),
(4, 2, 'Low', 50),
(5, 2, 'Moderate', 100),
(6, 2, 'High', 150),
(7, 3, 'Low', 50),
(8, 3, 'Moderate', 100),
(9, 3, 'High', 150),
(10, 4, 'Low', 50),
(11, 4, 'Moderate', 100),
(12, 4, 'High', 150),
(13, 5, 'Low', 50),
(14, 5, 'Moderate', 100),
(15, 5, 'High', 150),
(16, 6, 'Low', 50),
(17, 6, 'Moderate', 100),
(18, 6, 'High', 150),
(19, 7, 'Low', 50),
(20, 7, 'Moderate', 100),
(21, 7, 'High', 150);

-- --------------------------------------------------------

--
-- Table structure for table `ha_lang`
--

CREATE TABLE `ha_lang` (
  `langid` int(10) UNSIGNED NOT NULL,
  `lang` varchar(20) NOT NULL,
  `code` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ha_logdata`
--

CREATE TABLE `ha_logdata` (
  `ldid` int(10) UNSIGNED NOT NULL,
  `ip` varchar(36) NOT NULL,
  `browser` varchar(25) NOT NULL,
  `platform` varchar(25) NOT NULL,
  `timedate` datetime NOT NULL,
  `page` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_logdata`
--

INSERT INTO `ha_logdata` (`ldid`, `ip`, `browser`, `platform`, `timedate`, `page`) VALUES
(1, '::1', 'Google Chrome', 'Windows', '2023-11-26 10:56:46', '/HealthApp/?page=addmeasurements'),
(2, '::1', 'Google Chrome', 'Windows', '2023-11-26 10:57:04', '/HealthApp/?page=addmeasurements'),
(3, '::1', 'Google Chrome', 'Windows', '2023-11-26 10:57:29', '/HealthApp/?page=addmeasurements'),
(4, '::1', 'Google Chrome', 'Windows', '2023-11-26 10:59:08', '/HealthApp/?page=addmeasurements'),
(5, '::1', 'Google Chrome', 'Windows', '2023-11-26 10:59:13', '/HealthApp/?page=home'),
(6, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:00:29', '/HealthApp/?page=addmeasurements'),
(7, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:02:00', '/HealthApp/?page=addmeasurements'),
(8, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:02:52', '/HealthApp/?page=addmeasurements'),
(9, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:03:29', '/HealthApp/?page=addmeasurements'),
(10, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:03:34', '/HealthApp/?page=addmeasurements'),
(11, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:03:53', '/HealthApp/?page=addmeasurements'),
(12, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:04:06', '/HealthApp/?page=addmeasurements'),
(13, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:04:10', '/HealthApp/?page=home'),
(14, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:04:48', '/HealthApp/?page=home'),
(15, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:05:36', '/HealthApp/?page=home'),
(16, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:05:57', '/HealthApp/?page=home'),
(17, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:05:58', '/HealthApp/?page=home'),
(18, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:05:59', '/HealthApp/?page=home'),
(19, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:06:00', '/HealthApp/?page=home'),
(20, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:06:12', '/HealthApp/?page=addmeasurements'),
(21, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:06:15', '/HealthApp/?page=home'),
(22, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:06:29', '/HealthApp/?page=home'),
(23, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:07:34', '/HealthApp/?page=home'),
(24, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:15', '/HealthApp/?page=home'),
(25, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:22', '/HealthApp/?page=home'),
(26, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:48', '/HealthApp/?page=home'),
(27, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:49', '/HealthApp/?page=home'),
(28, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:56', '/HealthApp/?page=home'),
(29, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:57', '/HealthApp/?page=home'),
(30, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:08:57', '/HealthApp/?page=home'),
(31, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:09:34', '/HealthApp/?page=home'),
(32, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:10:16', '/HealthApp/?page=home'),
(33, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:10:21', '/HealthApp/?page=usersettings'),
(34, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:10:24', '/HealthApp/?page=about'),
(35, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:10:28', '/HealthApp/?page=home'),
(36, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:11:23', '/HealthApp/?page=home'),
(37, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:11:59', '/HealthApp/?page=home'),
(38, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:12:31', '/HealthApp/?page=home'),
(39, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:14:01', '/HealthApp/?page=home'),
(40, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:14:08', '/HealthApp/?page=addmeasurements'),
(41, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:14:29', '/HealthApp/?page=addmeasurements'),
(42, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:14:57', '/HealthApp/?page=addmeasurements'),
(43, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:14:58', '/HealthApp/?page=addmeasurements'),
(44, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:15:05', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(45, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:15:05', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(46, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:15:42', '/HealthApp/?page=addmeasurements'),
(47, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:15:43', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(48, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:15:43', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(49, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:16:26', '/HealthApp/?page=addmeasurements'),
(50, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:16:28', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(51, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:16:28', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(52, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:16:57', '/HealthApp/?page=addmeasurements'),
(53, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:17:35', '/HealthApp/?page=addmeasurements'),
(54, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:10', '/HealthApp/?page=addmeasurements'),
(55, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:22', '/HealthApp/?page=addmeasurements'),
(56, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:36', '/HealthApp/?page=addmeasurements'),
(57, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:37', '/HealthApp/?page=addmeasurements'),
(58, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:46', '/HealthApp/?page=addmeasurements'),
(59, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:18:48', '/HealthApp/?page=addmeasurements'),
(60, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:19:08', '/HealthApp/?page=addmeasurements'),
(61, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:19:19', '/HealthApp/?page=home'),
(62, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:19:38', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(63, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:19:38', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(64, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:02', '/HealthApp/?page=usergoals'),
(65, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:03', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(66, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:03', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(67, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:26', '/HealthApp/?page=usergoals'),
(68, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:30', '/HealthApp/?page=home'),
(69, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:20:37', '/HealthApp/?page=about'),
(70, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:21:00', '/HealthApp/?page=about'),
(71, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:21:03', '/HealthApp/?page=home'),
(72, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:21:08', '/HealthApp/?page=usergoals'),
(73, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:21:12', '/HealthApp/?page=home'),
(74, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:21:23', '/HealthApp/?page=home'),
(75, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:24:11', '/HealthApp/?page=home'),
(76, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:24:37', '/HealthApp/?page=home'),
(77, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:24:38', '/HealthApp/?page=home'),
(78, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:25:31', '/HealthApp/?page=home'),
(79, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:26:09', '/HealthApp/?page=home'),
(80, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:26:26', '/HealthApp/?page=home'),
(81, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:27:05', '/HealthApp/?page=home'),
(82, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:27:29', '/HealthApp/?page=home'),
(83, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:03', '/HealthApp/?page=home'),
(84, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:12', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(85, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:12', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(86, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:28', '/HealthApp/?page=usergoals'),
(87, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:31', '/HealthApp/?page=usersettings'),
(88, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:38', '/HealthApp/?page=home'),
(89, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:41', '/HealthApp/?page=logout'),
(90, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:28:41', '/HealthApp/'),
(91, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:30:24', '/HealthApp/'),
(92, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:30:43', '/HealthApp/'),
(93, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:31:12', '/HealthApp/'),
(94, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:31:13', '/HealthApp/'),
(95, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:31:19', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(96, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:31:19', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(97, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:09', '/HealthApp/'),
(98, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:10', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(99, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:10', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(100, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:29', '/HealthApp/'),
(101, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:31', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(102, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:31', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(103, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:44', '/HealthApp/'),
(104, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:32:49', '/HealthApp/?page=register'),
(105, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:00', '/RealEstateManagement'),
(106, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/bootstrap/css/bootstrap.min.css'),
(107, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/css/styles.css'),
(108, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/js/jquery-3.6.0.min.js'),
(109, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/bootstrap/js/bootstrap.min.js'),
(110, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(111, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:01', '/assets/js/chart.min.js'),
(112, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:08', '/assets/bootstrap/css/bootstrap.min.css'),
(113, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:08', '/assets/css/styles.css'),
(114, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/RealEstateManagement'),
(115, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/css/styles.css'),
(116, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/bootstrap/css/bootstrap.min.css'),
(117, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(118, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/js/jquery-3.6.0.min.js'),
(119, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/js/chart.min.js'),
(120, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:41:19', '/assets/bootstrap/js/bootstrap.min.js'),
(121, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/login.php'),
(122, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(123, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/css/styles.css'),
(124, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(125, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(126, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(127, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:42:26', '/RealEstateManagement/assets/js/chart.min.js'),
(128, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/'),
(129, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(130, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/css/styles.css'),
(131, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/js/chart.min.js'),
(132, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(133, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(134, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:01', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(135, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:05', '/RealEstateManagement/'),
(136, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(137, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/css/styles.css'),
(138, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(139, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(140, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(141, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:06', '/RealEstateManagement/assets/js/chart.min.js'),
(142, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/'),
(143, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(144, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(145, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(146, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/css/styles.css'),
(147, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/js/chart.min.js'),
(148, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:09', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(149, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/'),
(150, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(151, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/css/styles.css'),
(152, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(153, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(154, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(155, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:43:52', '/RealEstateManagement/assets/js/chart.min.js'),
(156, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:01', '/HealthApp/'),
(157, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:03', '/HealthApp/assets/bootstrap/css/bootstrap.min.css.map'),
(158, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:03', '/HealthApp/assets/bootstrap/js/bootstrap.min.js.map'),
(159, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/'),
(160, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(161, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/css/styles.css'),
(162, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(163, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(164, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(165, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:13', '/RealEstateManagement/assets/js/chart.min.js'),
(166, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/'),
(167, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(168, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/css/styles.css'),
(169, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(170, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(171, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(172, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:47', '/RealEstateManagement/assets/js/chart.min.js'),
(173, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/'),
(174, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(175, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/css/styles.css'),
(176, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(177, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(178, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(179, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:55', '/RealEstateManagement/assets/js/chart.min.js'),
(180, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/'),
(181, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(182, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(183, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(184, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/css/styles.css'),
(185, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(186, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:57', '/RealEstateManagement/assets/js/chart.min.js'),
(187, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/'),
(188, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(189, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/css/styles.css'),
(190, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/js/chart.min.js'),
(191, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(192, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(193, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:45:59', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(194, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/'),
(195, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(196, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/css/styles.css'),
(197, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(198, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/js/chart.min.js'),
(199, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(200, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:41', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(201, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/'),
(202, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(203, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/css/styles.css'),
(204, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(205, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(206, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(207, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:56', '/RealEstateManagement/assets/js/chart.min.js'),
(208, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/'),
(209, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/css/styles.css'),
(210, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(211, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(212, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(213, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(214, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:58', '/RealEstateManagement/assets/js/chart.min.js'),
(215, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/'),
(216, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(217, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/js/chart.min.js'),
(218, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/css/styles.css'),
(219, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(220, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(221, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:46:59', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(222, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/'),
(223, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(224, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/css/styles.css'),
(225, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(226, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(227, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(228, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/chart.min.js'),
(229, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/'),
(230, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/css/styles.css'),
(231, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(232, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(233, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/chart.min.js'),
(234, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(235, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(236, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/'),
(237, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/css/bootstrap.min.css'),
(238, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/css/styles.css'),
(239, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery-3.6.0.min.js'),
(240, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(241, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/js/chart.min.js'),
(242, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:47:00', '/RealEstateManagement/assets/bootstrap/js/bootstrap.min.js'),
(243, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:50:52', '/RealEstateManagement/css/bootstrap.min.css.map'),
(244, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:54:18', '/RealEstateManagement/modules/tenants/css/bootstrap.min.css'),
(245, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:54:18', '/RealEstateManagement/modules/tenants/css/app.css'),
(246, '::1', 'Google Chrome', 'Windows', '2023-11-26 11:54:19', '/RealEstateManagement/modules/tenants/img/favicon.png'),
(247, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:35:19', '/RealEstateManagement/css/bootstrap.min.css.map'),
(248, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:38:40', '/RealEstateManagement/css/bootstrap.min.css.map'),
(249, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:40:08', '/RealEstateManagement/css/bootstrap.min.css.map'),
(250, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:40:44', '/RealEstateManagement/modules/tenants/css/bootstrap.min.css'),
(251, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:40:44', '/RealEstateManagement/modules/tenants/css/app.css'),
(252, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:40:45', '/RealEstateManagement/modules/tenants/img/favicon.png'),
(253, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:42:44', '/RealEstateManagement/modules/tenants/css/bootstrap.min.css'),
(254, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:42:44', '/RealEstateManagement/modules/tenants/css/app.css'),
(255, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:42:44', '/RealEstateManagement/modules/tenants/img/favicon.png'),
(256, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:06', '/RealEstateManagement/modules/tenants/css/bootstrap.min.css'),
(257, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:06', '/RealEstateManagement/modules/tenants/css/app.css'),
(258, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:06', '/RealEstateManagement/modules/tenants/img/favicon.png'),
(259, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:08', '/RealEstateManagement/modules/tenants/css/bootstrap.min.css'),
(260, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:08', '/RealEstateManagement/modules/tenants/css/app.css'),
(261, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:09', '/RealEstateManagement/modules/tenants/img/favicon.png'),
(262, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/add_maintenance_request.php'),
(263, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/bootstrap/css/bootstrap.min.css'),
(264, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/css/styles.css'),
(265, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/js/jquery-3.6.0.min.js'),
(266, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(267, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/bootstrap/js/bootstrap.min.js'),
(268, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:15', '/RealEstateManagement/modules/maintenance_request/assets/js/chart.min.js'),
(269, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:16', '/RealEstateManagement/modules/maintenance_request/assets/js/jquery.mCustomScrollbar.concat.min.js'),
(270, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:16', '/RealEstateManagement/modules/maintenance_request/assets/bootstrap/js/bootstrap.min.js'),
(271, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:16', '/RealEstateManagement/modules/maintenance_request/assets/js/jquery-3.6.0.min.js'),
(272, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:16', '/RealEstateManagement/modules/maintenance_request/assets/js/chart.min.js'),
(273, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:35', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(274, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:35', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(275, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:43:35', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(276, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:19', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(277, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:19', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(278, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:19', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(279, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:30', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(280, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:30', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(281, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:30', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(282, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:50', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(283, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:50', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(284, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:53:51', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(285, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:04', '/RealEstateManagement/modules/leases/css/bootstrap.min.css'),
(286, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:04', '/RealEstateManagement/modules/leases/css/app.css'),
(287, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:04', '/RealEstateManagement/modules/leases/img/favicon.png'),
(288, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:46', '/RealEstateManagement/modules/leases/css/bootstrap.min.css'),
(289, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:46', '/RealEstateManagement/modules/leases/css/app.css'),
(290, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:54:47', '/RealEstateManagement/modules/leases/img/favicon.png'),
(291, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:55:02', '/RealEstateManagement/modules/leases/css/app.css'),
(292, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:55:02', '/RealEstateManagement/modules/leases/css/bootstrap.min.css'),
(293, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:55:02', '/RealEstateManagement/modules/leases/img/favicon.png'),
(294, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:33', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(295, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:33', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(296, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:34', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(297, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:40', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(298, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:40', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(299, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:40', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(300, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:45', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(301, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:45', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(302, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:56:45', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(303, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:35', '/RealEstateManagement/modules/maintenance_requests/css/bootstrap.min.css'),
(304, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:35', '/RealEstateManagement/modules/maintenance_requests/css/app.css'),
(305, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:36', '/RealEstateManagement/modules/maintenance_requests/img/favicon.png'),
(306, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:42', '/RealEstateManagement/modules/properties/css/bootstrap.min.css'),
(307, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:42', '/RealEstateManagement/modules/properties/css/app.css'),
(308, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:42', '/RealEstateManagement/modules/properties/img/favicon.png'),
(309, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:46', '/RealEstateManagement/modules/properties/css/app.css'),
(310, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:46', '/RealEstateManagement/modules/properties/css/bootstrap.min.css'),
(311, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:47', '/RealEstateManagement/modules/properties/img/favicon.png'),
(312, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:57', '/RealEstateManagement/modules/properties/css/bootstrap.min.css'),
(313, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:57', '/RealEstateManagement/modules/properties/css/app.css'),
(314, '::1', 'Google Chrome', 'Windows', '2023-11-26 12:57:58', '/RealEstateManagement/modules/properties/img/favicon.png'),
(315, '::1', 'Google Chrome', 'Windows', '2023-11-26 13:07:13', '/RealEstateManagement/css/bootstrap.min.css.map'),
(316, '::1', 'Google Chrome', 'Windows', '2023-11-26 13:07:27', '/RealEstateManagement/css/bootstrap.min.css.map'),
(317, '::1', 'Google Chrome', 'Windows', '2023-11-26 13:08:00', '/RealEstateManagement/css/bootstrap.min.css.map'),
(318, '::1', 'Google Chrome', 'Windows', '2023-11-26 13:08:52', '/RealEstateManagement/css/bootstrap.min.css.map'),
(319, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:53:52', '/HealthApp/'),
(320, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:54:05', '/HealthApp/?page=login'),
(321, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:54:05', '/HealthApp/?page=home'),
(322, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:54:09', '/HealthApp/?page=addmeasurements'),
(323, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:55:33', '/HealthApp/?page=addmeasurements'),
(324, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:55:37', '/HealthApp/?page=home'),
(325, '::1', 'Google Chrome', 'Windows', '2023-11-27 06:55:53', '/HealthApp/?page=home');

-- --------------------------------------------------------

--
-- Table structure for table `ha_roles`
--

CREATE TABLE `ha_roles` (
  `rid` int(10) UNSIGNED NOT NULL,
  `userrole` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_roles`
--

INSERT INTO `ha_roles` (`rid`, `userrole`) VALUES
(1, 'admin'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `ha_uimode`
--

CREATE TABLE `ha_uimode` (
  `id` int(10) UNSIGNED NOT NULL,
  `uiname` varchar(10) NOT NULL,
  `css` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ha_units`
--

CREATE TABLE `ha_units` (
  `unitid` int(10) UNSIGNED NOT NULL,
  `name_short` varchar(10) NOT NULL,
  `name_long` varchar(15) NOT NULL,
  `unittype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_units`
--

INSERT INTO `ha_units` (`unitid`, `name_short`, `name_long`, `unittype`) VALUES
(1, 'KG', 'Kilograms', 'Weight'),
(2, 'Min', 'Minutes', 'Time'),
(3, 'Hrs', 'Hours', 'Time'),
(4, 'Cal', 'Calories', 'Servings'),
(5, 'Steps', 'Steps', 'Distance');

-- --------------------------------------------------------

--
-- Table structure for table `ha_userdata`
--

CREATE TABLE `ha_userdata` (
  `udid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `sex` int(1) NOT NULL,
  `height` int(4) NOT NULL,
  `ui_mode` int(10) UNSIGNED NOT NULL,
  `lang` int(10) UNSIGNED NOT NULL,
  `birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ha_userlog`
--

CREATE TABLE `ha_userlog` (
  `uid` int(10) UNSIGNED NOT NULL,
  `ldid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_userlog`
--

INSERT INTO `ha_userlog` (`uid`, `ldid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 321),
(1, 322),
(1, 323),
(1, 324),
(1, 325);

-- --------------------------------------------------------

--
-- Table structure for table `ha_users`
--

CREATE TABLE `ha_users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `passwd` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `urole` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ha_users`
--

INSERT INTO `ha_users` (`uid`, `username`, `passwd`, `email`, `urole`) VALUES
(1, 'tester', 'Qalt5425??', 'test@mail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `leases`
--

CREATE TABLE `leases` (
  `lease_id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rent_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('Pending','Paid') DEFAULT 'Pending',
  `renewal_notification_sent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `request_id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `request_description` text DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `resolution_description` text DEFAULT NULL,
  `resolution_date` date DEFAULT NULL,
  `status` enum('Pending','Resolved') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('Available','Rented') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenant_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rental_history` text DEFAULT NULL,
  `lease_terms` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ha_category`
--
ALTER TABLE `ha_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `ha_goals`
--
ALTER TABLE `ha_goals`
  ADD PRIMARY KEY (`gtid`,`uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ha_goaltype`
--
ALTER TABLE `ha_goaltype`
  ADD PRIMARY KEY (`gtid`),
  ADD KEY `unit` (`unit`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `ha_healthdata`
--
ALTER TABLE `ha_healthdata`
  ADD PRIMARY KEY (`hdid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `healthtype` (`healthtype`);

--
-- Indexes for table `ha_healthtype`
--
ALTER TABLE `ha_healthtype`
  ADD PRIMARY KEY (`typeid`),
  ADD KEY `unit` (`unit`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `ha_intensity`
--
ALTER TABLE `ha_intensity`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `typeid` (`typeid`);

--
-- Indexes for table `ha_lang`
--
ALTER TABLE `ha_lang`
  ADD PRIMARY KEY (`langid`);

--
-- Indexes for table `ha_logdata`
--
ALTER TABLE `ha_logdata`
  ADD PRIMARY KEY (`ldid`);

--
-- Indexes for table `ha_roles`
--
ALTER TABLE `ha_roles`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `ha_uimode`
--
ALTER TABLE `ha_uimode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_units`
--
ALTER TABLE `ha_units`
  ADD PRIMARY KEY (`unitid`);

--
-- Indexes for table `ha_userdata`
--
ALTER TABLE `ha_userdata`
  ADD PRIMARY KEY (`udid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ha_userlog`
--
ALTER TABLE `ha_userlog`
  ADD PRIMARY KEY (`uid`,`ldid`),
  ADD KEY `ldid` (`ldid`);

--
-- Indexes for table `ha_users`
--
ALTER TABLE `ha_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `ha_unique_keys` (`username`,`email`),
  ADD KEY `urole` (`urole`);

--
-- Indexes for table `leases`
--
ALTER TABLE `leases`
  ADD PRIMARY KEY (`lease_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ha_category`
--
ALTER TABLE `ha_category`
  MODIFY `catid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ha_goaltype`
--
ALTER TABLE `ha_goaltype`
  MODIFY `gtid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ha_healthdata`
--
ALTER TABLE `ha_healthdata`
  MODIFY `hdid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ha_healthtype`
--
ALTER TABLE `ha_healthtype`
  MODIFY `typeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ha_intensity`
--
ALTER TABLE `ha_intensity`
  MODIFY `iid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ha_lang`
--
ALTER TABLE `ha_lang`
  MODIFY `langid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_logdata`
--
ALTER TABLE `ha_logdata`
  MODIFY `ldid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT for table `ha_roles`
--
ALTER TABLE `ha_roles`
  MODIFY `rid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ha_uimode`
--
ALTER TABLE `ha_uimode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_units`
--
ALTER TABLE `ha_units`
  MODIFY `unitid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ha_userdata`
--
ALTER TABLE `ha_userdata`
  MODIFY `udid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_users`
--
ALTER TABLE `ha_users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leases`
--
ALTER TABLE `leases`
  MODIFY `lease_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `tenant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ha_goals`
--
ALTER TABLE `ha_goals`
  ADD CONSTRAINT `ha_goals_ibfk_1` FOREIGN KEY (`gtid`) REFERENCES `ha_goaltype` (`gtid`),
  ADD CONSTRAINT `ha_goals_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `ha_users` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `ha_goaltype`
--
ALTER TABLE `ha_goaltype`
  ADD CONSTRAINT `ha_goaltype_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `ha_units` (`unitid`),
  ADD CONSTRAINT `ha_goaltype_ibfk_2` FOREIGN KEY (`category`) REFERENCES `ha_category` (`catid`);

--
-- Constraints for table `ha_healthdata`
--
ALTER TABLE `ha_healthdata`
  ADD CONSTRAINT `ha_healthdata_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ha_users` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ha_healthdata_ibfk_2` FOREIGN KEY (`healthtype`) REFERENCES `ha_healthtype` (`typeid`);

--
-- Constraints for table `ha_healthtype`
--
ALTER TABLE `ha_healthtype`
  ADD CONSTRAINT `ha_healthtype_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `ha_units` (`unitid`),
  ADD CONSTRAINT `ha_healthtype_ibfk_2` FOREIGN KEY (`category`) REFERENCES `ha_category` (`catid`);

--
-- Constraints for table `ha_intensity`
--
ALTER TABLE `ha_intensity`
  ADD CONSTRAINT `ha_intensity_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `ha_healthtype` (`typeid`);

--
-- Constraints for table `ha_userdata`
--
ALTER TABLE `ha_userdata`
  ADD CONSTRAINT `ha_userdata_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ha_users` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `ha_userlog`
--
ALTER TABLE `ha_userlog`
  ADD CONSTRAINT `ha_userlog_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ha_users` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ha_userlog_ibfk_2` FOREIGN KEY (`ldid`) REFERENCES `ha_logdata` (`ldid`);

--
-- Constraints for table `ha_users`
--
ALTER TABLE `ha_users`
  ADD CONSTRAINT `ha_users_ibfk_1` FOREIGN KEY (`urole`) REFERENCES `ha_roles` (`rid`);

--
-- Constraints for table `leases`
--
ALTER TABLE `leases`
  ADD CONSTRAINT `leases_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`tenant_id`);

--
-- Constraints for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD CONSTRAINT `maintenance_requests_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`tenant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
