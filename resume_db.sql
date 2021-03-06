-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2021 at 03:58 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resume_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `country_table`
--

CREATE TABLE `country_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country_table`
--

INSERT INTO `country_table` (`id`, `name`, `nationality`) VALUES
(1, 'Azerbaijan', 'Azerbaijani'),
(2, 'Turkmenistan', 'Turkmen'),
(3, 'Russia', 'Russian'),
(4, 'Georgia', 'Georgian'),
(5, 'Hungary', 'Hungarian');

-- --------------------------------------------------------

--
-- Table structure for table `employment_history`
--

CREATE TABLE `employment_history` (
  `id` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employment_history`
--

INSERT INTO `employment_history` (`id`, `header`, `begin_date`, `end_date`, `job_description`, `user_id`) VALUES
(1, 'bank of baku', '2020-03-03', NULL, 'lorem ipsum content here', 1),
(2, 'backend dev', '2020-05-05', NULL, 'develop user interfaces', 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `name`) VALUES
(1, 'C++'),
(2, 'Javascript'),
(3, 'Java'),
(4, 'PHP'),
(5, 'Kubernets'),
(6, 'Python'),
(7, 'Docker');

-- --------------------------------------------------------

--
-- Table structure for table `user_skill`
--

CREATE TABLE `user_skill` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_skill`
--

INSERT INTO `user_skill` (`id`, `user_id`, `skill_id`, `skill_level`) VALUES
(3, 1, 1, 10),
(4, 1, 2, 10),
(6, 1, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `profile_desc` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplace_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `name`, `surname`, `email`, `phone`, `profile_desc`, `address`, `birthdate`, `birthplace_id`, `nationality_id`, `user_password`) VALUES
(1, 'rustem', 'gasimov', 'aziz@mail.ru', '+994552002020', 't is a long established fact that a reader will be distracted by the readable content of a \npage when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less\n normal distribution of letters, as opposed to using \'Content here, content here\', making it look \nlike readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum \nas their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. \nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose\n (injected humour and the like).', 'sumqayit', '2000-03-04', 4, 4, '12345'),
(6, 'ziya', 'gasimov', 'email@email.com', '+5878545454545', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 'baku', '1994-01-01', 4, 4, '12345'),
(13, 'test2', 'testov2', 'test2@mail.ru', '+994555955858', NULL, NULL, NULL, 1, 1, '$2a$04$x7YJfF7/S6gWxTfYkAto8eEQkaDXk8dJqiVwJva5Lw5nmtAd6RbSS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country_table`
--
ALTER TABLE `country_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_skill` (`user_id`),
  ADD KEY `fk_skill_id` (`skill_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nationality` (`nationality_id`),
  ADD KEY `fk_birthplace` (`birthplace_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country_table`
--
ALTER TABLE `country_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employment_history`
--
ALTER TABLE `employment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_skill`
--
ALTER TABLE `user_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`);

--
-- Constraints for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD CONSTRAINT `fk_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `fk_user_id_skill` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`);

--
-- Constraints for table `user_table`
--
ALTER TABLE `user_table`
  ADD CONSTRAINT `fk_birthplace` FOREIGN KEY (`birthplace_id`) REFERENCES `country_table` (`id`),
  ADD CONSTRAINT `fk_nationality` FOREIGN KEY (`nationality_id`) REFERENCES `country_table` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
