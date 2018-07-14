-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2018 at 08:21 PM
-- Server version: 5.6.38
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `aston`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_contact`
--

CREATE TABLE `tbl_admin_contact` (
  `user_id` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(20) NOT NULL DEFAULT '-',
  `address` varchar(120) NOT NULL DEFAULT '-',
  `city` varchar(60) NOT NULL DEFAULT '-',
  `province` varchar(60) NOT NULL DEFAULT '-',
  `zip_code` int(11) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_contact`
--

INSERT INTO `tbl_admin_contact` (`user_id`, `order`, `phone`, `address`, `city`, `province`, `zip_code`, `country_id`, `created_date`, `updated_date`) VALUES
('ADM_1', 1, '0274 - 123123', 'Jalan Tendean no.30A', 'Yogyakarta', 'Yogyakarta', 552334, 1, '2018-07-14 18:11:27', '2018-07-14 18:11:27'),
('ADM_1', 2, '0856123123', '-', '-', '-', 0, 0, '2018-07-14 18:11:27', '2018-07-14 18:11:27'),
('ADM_2', 1, '0271 555444 ', 'Jl. Selamet no.27', 'Surakarta', 'Jawa Tengah', 33231, 1, '2018-07-14 18:13:31', '2018-07-14 18:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_login`
--

CREATE TABLE `tbl_admin_login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apikey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_login`
--

INSERT INTO `tbl_admin_login` (`id`, `user_id`, `email`, `password`, `apikey`) VALUES
(1, 'ADM_1', 'root@alamanda.co', 'root', 'gUkXp2s5v8y/B?E(H+MbQeShVmYq3t6w'),
(2, 'ADM_2', 'admin@alamanda.co', 'admin', 'VkYp3s6v9y$B?E(H+MbQeThWmZq4t7w!');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_position`
--

CREATE TABLE `tbl_admin_position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_position`
--

INSERT INTO `tbl_admin_position` (`position_id`, `position_name`) VALUES
(1, 'root'),
(2, 'admin'),
(3, 'General Manager'),
(4, 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_profile`
--

CREATE TABLE `tbl_admin_profile` (
  `user_id` varchar(60) NOT NULL,
  `position_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `gender` int(11) NOT NULL,
  `idcard_number` varchar(60) NOT NULL,
  `nationality` varchar(60) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_profile`
--

INSERT INTO `tbl_admin_profile` (`user_id`, `position_id`, `username`, `first_name`, `last_name`, `gender`, `idcard_number`, `nationality`, `created_date`, `updated_date`) VALUES
('ADM_1', 1, 'root', 'root', 'alamanda', 1, '123001233123', 'Indonesian', '2018-07-15 01:17:57', '2018-07-14 18:19:26'),
('ADM_2', 2, 'admin', 'admin', 'alamanda', 2, '32432002352', 'Indonesian', '2018-07-15 01:17:57', '2018-07-14 18:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gender`
--

CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gender`
--

INSERT INTO `tbl_gender` (`gender_id`, `gender_name`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin_contact`
--
ALTER TABLE `tbl_admin_contact`
  ADD KEY `admin_contact_login_cons` (`user_id`);

--
-- Indexes for table `tbl_admin_login`
--
ALTER TABLE `tbl_admin_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `apikey` (`apikey`);

--
-- Indexes for table `tbl_admin_position`
--
ALTER TABLE `tbl_admin_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `tbl_admin_profile`
--
ALTER TABLE `tbl_admin_profile`
  ADD UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `admin_profile_position_cons` (`position_id`),
  ADD KEY `admin_profile_gender_cons` (`gender`);

--
-- Indexes for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_login`
--
ALTER TABLE `tbl_admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_admin_position`
--
ALTER TABLE `tbl_admin_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_gender`
--
ALTER TABLE `tbl_gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin_contact`
--
ALTER TABLE `tbl_admin_contact`
  ADD CONSTRAINT `admin_contact_login_cons` FOREIGN KEY (`user_id`) REFERENCES `tbl_admin_login` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_admin_profile`
--
ALTER TABLE `tbl_admin_profile`
  ADD CONSTRAINT `admin_profile_gender_cons` FOREIGN KEY (`gender`) REFERENCES `tbl_gender` (`gender_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_profile_login_cons` FOREIGN KEY (`user_id`) REFERENCES `tbl_admin_login` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_profile_position_cons` FOREIGN KEY (`position_id`) REFERENCES `tbl_admin_position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;
