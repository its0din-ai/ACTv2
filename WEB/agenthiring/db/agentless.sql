-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2024 at 01:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agentless`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(300) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_used` varchar(255) NOT NULL,
  `roles` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `fullname`, `date_created`, `last_login`, `device_used`, `roles`) VALUES
('adm', 'b09c600fddc573f117449b3723f23d64', 'ADMON', '2024-02-23 11:44:34', '2024-02-23 12:04:12', 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', 'admin'),
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', '2024-02-23 11:08:14', '2024-02-23 12:04:00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4892.121 Safari/537.36', 'admin'),
('heker', 'bb71befab6a07312b61713e5a18ccb2f', 'heker pro', '2024-02-23 11:14:00', '2024-02-23 12:04:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ability`)),
  `free` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `ability`, `free`) VALUES
(1, 'vestiazeta1337', '{\n    \"speed\": 10,\n    \"stealth\": 5,\n    \"shooting\": 3,\n    \"hacking\": 10,\n    \"impersonating\": 8,\n    \"weapon\": [\n        \"sub machine\",\n        \"assault\",\n        \"sniper\",\n        \"melee\",\n        \"handgun\"\n    ]\n}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flag`
--

CREATE TABLE `flag` (
  `flag` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flag`
--

INSERT INTO `flag` (`flag`) VALUES
('Lorem ipsum dolor sit amet esse ad eiusmod aliqua ut eu labore sunt qui exercitation. Laborum ea laboris excepteur ad reprehenderit nisi commodo adipisicing do non irure sint. Voluptate incididunt Lorem pariatur nostrud irure ipsum incididunt ut tempor officia nostrud qui voluptate pariatur in aliqu'),
('FAKEFLAG{86dc40ab1c1a9544556eeebdbf588da3d72510734b43b4d47515c99d3bda568c}'),
('ACTCTF{cb12352bd9ba4fdc3d07925cee24f3a1b11ddaae0a59d5bde4ebcdb87bd9edef}'),
('Lorem ipsum dolor sit amet esse ad eiusmod aliqua ut eu labore sunt qui exercitation. Laborum ea laboris excepteur ad reprehenderit nisi commodo adipisicing do non irure sint. Voluptate incididunt Lorem pariatur nostrud irure ipsum incididunt ut tempor officia nostrud qui voluptate pariatur in aliqu');

-- --------------------------------------------------------

--
-- Table structure for table `user_agents`
--

CREATE TABLE `user_agents` (
  `id` int(11) NOT NULL,
  `user_agents` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_agents`
--

INSERT INTO `user_agents` (`id`, `user_agents`, `timestamp`, `username`) VALUES
(305, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:44:36', 'adm'),
(306, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:44:37', 'adm'),
(307, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:45:00', 'adm'),
(308, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:45:04', 'admin'),
(309, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:45:04', 'admin'),
(310, 'Mozilla/5.0 (X11; Linux Mint/19.3 x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Brave Chrome/81.0.4044.122 Safari/537.36', '2024-02-23 11:45:09', 'admin'),
(311, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:45:30', 'heker'),
(312, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:45:30', 'heker'),
(313, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:45:36', 'adm'),
(314, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:45:36', 'adm'),
(315, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:50:41', 'adm'),
(316, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:51:26', 'adm'),
(317, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 11:51:46', 'adm'),
(318, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:00', 'heker'),
(319, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:00', 'heker'),
(320, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:04', 'heker'),
(321, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:17', 'adm'),
(322, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:17', 'adm'),
(323, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:20', 'adm'),
(324, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:51', 'adm'),
(325, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:52', 'adm'),
(326, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:00:54', 'adm'),
(327, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:06', 'adm'),
(328, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:08', 'adm'),
(329, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:12', 'admin'),
(330, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:12', 'admin'),
(331, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:14', 'admin'),
(332, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:54', 'adm'),
(333, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:01:55', 'adm'),
(334, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:02:01', 'adm'),
(335, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:02:04', 'adm'),
(336, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:02:18', 'adm'),
(337, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:02:23', 'admin'),
(338, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:02:23', 'admin'),
(339, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:03:16', 'admin'),
(340, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:03:16', 'admin'),
(341, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:03:22', 'admin'),
(342, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:00', 'admin'),
(343, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:00', 'admin'),
(344, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:07', 'admin'),
(345, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:12', 'adm'),
(346, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:12', 'adm'),
(347, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:17', 'adm'),
(348, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:24', 'heker'),
(349, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:24', 'heker'),
(350, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5163.147 Safari/537.36', '2024-02-23 12:04:34', 'heker');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_agents`
--
ALTER TABLE `user_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username_logger` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_agents`
--
ALTER TABLE `user_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_agents`
--
ALTER TABLE `user_agents`
  ADD CONSTRAINT `username_logger` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
