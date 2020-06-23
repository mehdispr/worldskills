-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2019 at 10:55 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db01_competitor_day2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE `attendees` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `linkedin_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password_hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`id`, `firstname`, `lastname`, `username`, `email`, `photo_path`, `linkedin_url`, `password_hash`, `token`) VALUES
(1, 'Attendee1', 'Attendee1', 'attendee1', 'attendee1@mail.com', '', '', '$2y$10$XFu/pe1v/bWv/1h.OHYcaeZyvPTw3GmrfEId5KSmJbpUyQb8KqMve', '6fcf38dfc3b9d4c1816cc536efa7dcca'),
(2, 'Attendee2', 'Attendee2', 'attendee2', 'attendee2@mail.com', '', '', '$2y$10$2AdnbtpyqBu8t.4j4P5Vb.DFj/cj4qwK.YEpIJfKJfjz4g06Jys7C', ''),
(3, 'Attendee3', 'Attendee3', 'attendee3', 'attendee3@mail.com', '', '', '$2y$10$UlFa.Uq/F7ZLk0eHTtptv.bibciDHytVdLBslSVXOzuEI5n9DMKJq', ''),
(4, 'Attendee4', 'Attendee4', 'attendee4', 'attendee4@mail.com', '', '', '$2y$10$af8K/BvkOy2Z/yF7gHTYP.rxtJKBOUj5gfpyEqufKolZAF1W7SkYe', ''),
(5, 'Attendee5', 'Attendee5', 'attendee5', 'attendee5@mail.com', '', '', '$2y$10$w8knEOPYuc2swrW2TWgS/eGedb6QwPL6dFM/qT.8DGe0tDYfykAqa', ''),
(6, 'Attendee6', 'Attendee6', 'attendee6', 'attendee6@mail.com', '', '', '$2y$10$JRfYNuWlKHKJeM6vqcPY4uVBooTiNk9Zispl.LknE5AOeloYa48Wu', ''),
(7, 'Attendee7', 'Attendee7', 'attendee7', 'attendee7@mail.com', '', '', '$2y$10$aZUnvfvcs/Mn2/qevnaKOus/fhRtqtUfxDUABixf.uKt2TLeuMEXu', ''),
(8, 'Attendee8', 'Attendee8', 'attendee8', 'attendee8@mail.com', '', '', '$2y$10$n.G1sahqCJGcfkqPYsiGpe.Xjoli7EpC.TiTgFAgLBP.lEBMpF3mq', ''),
(9, 'Attendee9', 'Attendee9', 'attendee9', 'attendee9@mail.com', '', '', '$2y$10$j8J915NFU2PeRnC6bjZS0eVyYSrpW61JfO3PWEUyYuUmBQ4sXsreK', ''),
(10, 'Attendee10', 'Attendee10', 'attendee10', 'attendee10@mail.com', '', '', '$2y$10$b87e86IgfbksmZfHMWLhzOE9p9u8o2Q2Ov12szmsGVMMNkWEbIkYC', ''),
(11, 'someText', 'someText', 'someText', 'some@Text', 'public/img/avatar/CEn54w8gLwAx6qxu7ONvPV6Ywg6d2z3Ygy5xmIOP.jpeg', 'someText', '$2y$10$HwqEGn9df355DaX.lc7Oe.CkrgATaXzySdPE.rkSPPNnU5LymlMdi', ''),
(12, 'someText2', 'someText2', 'someText2', 'some@Text2', 'public/img/avatar/6PnMLzPfCq6POMLydhsoHyAyYxJ05g5cbvB5Y5Qi.png', 'someText2', '$2y$10$.gYwTA2AeQFFhYW9oifN7OALhckJQockRfCOXxO8ZSf.pXf0G9SyC', '937cb2c3a243ebd2772d9c12d8cc37b1'),
(13, 'first', 'last', 'newuser1', 'some@text3', '', '', '$2y$10$et.va02qlRLGNazEV7nbZOlU6iELKZpQQa0fPbtc1I9nZ4vgp21BW', ''),
(14, 'first', 'last', 'newuser2', 'some@text4', 'public/img/avatar/sAzLzdyDqttpxvTOecV9RwpiDCSf7VCEXrgmtgPM.jpeg', 'http://www.linkedin.com/in/newuser', '$2y$10$J16oIyT1RLLGUTHScvzhC.wJmKvjiGeO2RvIRackeHaX3diP2tSYy', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration_days` smallint(5) UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard_price` double NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `date`, `time`, `duration_days`, `location`, `standard_price`, `capacity`) VALUES
(1, 'Web conference Update', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', '2019-08-15', '08:00:00', 1, 'Floor1', 500, 250),
(2, 'Fishing experience', 'Lorem ipsum dolor sit amet, sadipscing consetetur elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', '2019-08-30', '08:00:00', 1, 'Garden Area', 100, 30),
(3, 'dsaf', 'asdfsdfsdfdfd', '2019-06-26', '10:58:31', 1, 'safsfdfs', 1, 1),
(4, 'tt1', 'dd1', '2019-06-26', '17:31:20', 10, 'LL', 12, 15),
(5, 'new Title', 'new Description', '2019-06-26', '17:31:56', 1, 'Location', 1, 1),
(6, 'TW title', 'TW Desc', '2019-06-26', '18:20:25', 1, 'TW & KR', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(37, '2014_10_12_000000_create_users_table', 1),
(38, '2019_06_26_000653_create_attendees_table', 1),
(39, '2019_06_26_000811_create_registrations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registration_type` enum('early_bird','general','vip') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `registration_date` datetime NOT NULL,
  `calculated_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `event_rating` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `event_id`, `user_id`, `registration_type`, `registration_date`, `calculated_price`, `event_rating`) VALUES
(1, 1, 2, 'vip', '2019-06-26 13:47:15', '600.00', 2),
(2, 1, 3, 'early_bird', '2019-06-26 13:47:15', '425.00', 1),
(3, 1, 4, 'general', '2019-06-26 13:47:15', '500.00', 1),
(4, 1, 5, 'vip', '2019-06-26 13:47:15', '600.00', 2),
(5, 1, 6, 'early_bird', '2019-06-26 13:47:15', '425.00', 1),
(6, 1, 7, 'general', '2019-06-26 13:47:15', '500.00', 1),
(7, 1, 8, 'vip', '2019-06-26 13:47:15', '600.00', 2),
(8, 1, 9, 'early_bird', '2019-06-26 13:47:15', '425.00', 1),
(9, 1, 10, 'general', '2019-06-26 13:47:15', '500.00', 1),
(10, 1, 1, 'early_bird', '2019-06-26 13:57:10', '425.00', 2),
(11, 1, 11, 'early_bird', '2019-06-26 17:35:18', '425.00', 0),
(12, 2, 11, 'early_bird', '2019-06-26 17:41:08', '85.00', 1),
(13, 1, 12, 'vip', '2019-06-26 17:56:05', '600.00', NULL),
(14, 2, 12, 'early_bird', '2019-06-26 17:57:01', '85.00', NULL),
(15, 3, 11, 'general', '2019-06-26 18:21:12', '1.00', 2),
(16, 4, 11, 'early_bird', '2019-06-26 18:21:18', '10.20', 0),
(17, 5, 11, 'vip', '2019-06-26 18:21:22', '1.20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speaker` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `event_id`, `title`, `room`, `speaker`) VALUES
(3, 2, 'fishing in troubled waters', NULL, NULL),
(4, 2, 'preparing fish for dish', NULL, NULL),
(5, 3, 'fsadf at sdfs', 'dfds', 'afsd'),
(6, 5, 'Title at 10:00', 'Location', 'Speaker'),
(7, 5, 'Title2 at 11:00', 'Location2', 'Speaker2'),
(8, 1, 'CSS applied at 8:30', 'R05', 'Mac Entyre'),
(9, 1, 'JS advanced at 10:00', 'R06', 'Ann Codelle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember_token`) VALUES
(1, 'Admin', 'adminuser1', '$2y$10$NO4b9SZC2Uwxadd3W361XuZ7vS5USYuFihOXpPxong3HPib1IrWtq', '88TrRhJLcBAA1ZL0uA3pa1QU1ID1XuC4yefYsomCLofj3kySNZgynY1h3aMi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendees_username_unique` (`username`),
  ADD UNIQUE KEY `attendees_email_unique` (`email`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registrations_event_id_foreign` (`event_id`),
  ADD KEY `registrations_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_event_id_foreign` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendees`
--
ALTER TABLE `attendees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `attendees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
