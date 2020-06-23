-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2019 at 02:28 AM
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
(1, 'Attendee1', 'Attendee1', 'attendee1', 'attendee1@mail.com', '', '', '$2y$10$rEsDAwV.qr7X75LUiC2iUuEAqzb5ofhZDUg7JBlaI9QE7P/.J8/tO', ''),
(2, 'Attendee2', 'Attendee2', 'attendee2', 'attendee2@mail.com', '', '', '$2y$10$4VMPKtH5ckIzKNnSsQVsoOpIdGt51Ap/tjNEv.CogKmnkTGpCIhe.', ''),
(3, 'Attendee3', 'Attendee3', 'attendee3', 'attendee3@mail.com', '', '', '$2y$10$WIz5ZHqXk5sJgtkDt6s1qOx9Z1oIMHOXc5aSfw/aNF6WPtFh35ppa', ''),
(4, 'Attendee4', 'Attendee4', 'attendee4', 'attendee4@mail.com', '', '', '$2y$10$hr0jDVfVDgiRhgQUyE.2uueie757S3eLCySmB5U2TKvWSym20np5q', ''),
(5, 'Attendee5', 'Attendee5', 'attendee5', 'attendee5@mail.com', '', '', '$2y$10$UpDK660yh3lLJk6doBi1Z.Z3vJupYrDWt/Gjj22qNpsSem2muI3..', ''),
(6, 'Attendee6', 'Attendee6', 'attendee6', 'attendee6@mail.com', '', '', '$2y$10$9GTFlYC9KEdUJDw2baBaIOVsCaSZcdJ6HMCs7Fy4vtBGRBhQ7q.uW', ''),
(7, 'Attendee7', 'Attendee7', 'attendee7', 'attendee7@mail.com', '', '', '$2y$10$zCBtbnztNAa1L.qNV1F9KOuw3y1pi.dxCOOkqoq7uALpSp8H/XHDu', ''),
(8, 'Attendee8', 'Attendee8', 'attendee8', 'attendee8@mail.com', '', '', '$2y$10$enaKZgBg5iJ0JKXl5O6Fy.j2iHsz12.335Wg3UHMPkuVAKGdrXEyG', ''),
(9, 'Attendee9', 'Attendee9', 'attendee9', 'attendee9@mail.com', '', '', '$2y$10$oHFqlqcBy/TRkXb2EM5.ueRxpQ2khAed7lpFwRcjjje7EtKBoLOSW', ''),
(10, 'Attendee10', 'Attendee10', 'attendee10', 'attendee10@mail.com', '', '', '$2y$10$2AaNIpAVPEAi2IEvD77Rre9KzZeDreXu6DK0QMj.Jrg1iTcRE7MN.', '');

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
(1, 'Web conference', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', '2019-08-15', '08:00:00', 1, 'Floor1', 500, 250),
(2, 'Fishing experience', 'Lorem ipsum dolor sit amet, sadipscing consetetur elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', '2019-08-30', '08:00:00', 1, 'Garden Area', 100, 30);

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
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2019_06_26_000653_create_attendees_table', 1),
(18, '2019_06_26_000811_create_registrations_table', 1);

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
  `event_rating` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `event_id`, `user_id`, `registration_type`, `registration_date`, `calculated_price`, `event_rating`) VALUES
(1, 1, 2, 'vip', '2019-06-26 00:26:02', '600.00', 0),
(2, 1, 3, 'early_bird', '2019-06-26 00:26:02', '425.00', 0),
(3, 1, 4, 'general', '2019-06-26 00:26:02', '500.00', 0),
(4, 1, 5, 'vip', '2019-06-26 00:26:02', '600.00', 0),
(5, 1, 6, 'early_bird', '2019-06-26 00:26:02', '425.00', 0),
(6, 1, 7, 'general', '2019-06-26 00:26:02', '500.00', 0),
(7, 1, 8, 'vip', '2019-06-26 00:26:02', '600.00', 0),
(8, 1, 9, 'early_bird', '2019-06-26 00:26:02', '425.00', 0),
(9, 1, 10, 'general', '2019-06-26 00:26:02', '500.00', 0);

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
(1, 1, 'CSS applied at 8:30', 'R05', 'Mac Entyre'),
(2, 1, 'JS advanced at 10:00', 'R06', 'Ann Codelle'),
(3, 2, 'fishing in troubled waters', NULL, NULL),
(4, 2, 'preparing fish for dish', NULL, NULL);

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
(1, 'Admin', 'adminuser1', '$2y$10$DqmUL5QWTUz4gxB5KiwGOO9br5KPnZTWuS5one1R0BJPjpSqW.Kwa', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
