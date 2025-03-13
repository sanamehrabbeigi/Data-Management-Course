-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2024 at 04:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `F1_Drivers`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `enginemanufacturer` varchar(50) DEFAULT NULL,
  `tiremanufacturer` varchar(50) DEFAULT NULL,
  `chassistype` varchar(50) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  `driverid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `enginemanufacturer`, `tiremanufacturer`, `chassistype`, `teamid`, `driverid`) VALUES
(1, 'Red Bull', 'Pirelli', 'Type D', 1, 1),
(2, 'Ferrari', 'Pirelli', 'Type B', 1, 2),
(3, 'Ferrari', 'Pirelli', 'Type A', 2, 3),
(4, 'Renault', 'Pirelli', 'Type B', 2, 4),
(5, 'Red Bull', 'Pirelli', 'Type C', 3, 5),
(6, 'Renault', 'Pirelli', 'Type C', 3, 6),
(7, 'Ferrari', 'Pirelli', 'Type C', 4, 7),
(8, 'Ferrari', 'Pirelli', 'Type B', 4, 8),
(9, 'Renault', 'Pirelli', 'Type B', 5, 9),
(10, 'Red Bull', 'Pirelli', 'Type E', 5, 10),
(11, 'Renault', 'Pirelli', 'Type A', 6, 11),
(12, 'Red Bull', 'Pirelli', 'Type C', 6, 12),
(13, 'Renault', 'Pirelli', 'Type A', 7, 13),
(14, 'Ferrari', 'Pirelli', 'Type B', 7, 14),
(15, 'Ferrari', 'Pirelli', 'Type C', 8, 15),
(16, 'Mercedes', 'Pirelli', 'Type E', 8, 16),
(17, 'Renault', 'Pirelli', 'Type D', 9, 17),
(18, 'Red Bull', 'Pirelli', 'Type E', 9, 18),
(19, 'Renault', 'Pirelli', 'Type E', 10, 19),
(20, 'Renault', 'Pirelli', 'Type E', 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `drivername` varchar(50) DEFAULT NULL,
  `experiencerating` int(11) DEFAULT NULL,
  `specialskills` varchar(255) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `drivername`, `experiencerating`, `specialskills`, `teamid`) VALUES
(1, 'Lewis Hamilton', 14, 'wet driving, tire management', 1),
(2, 'Max Verstappen', 15, 'aggressive driving, overtaking', 1),
(3, 'Charles Leclerc', 12, 'precision, qualifying pace', 2),
(4, 'Lando Norris', 11, 'wet driving, adaptability', 2),
(5, 'Sebastian Vettel', 13, 'tire management, strategy', 3),
(6, 'George Russell', 13, 'consistency, qualifying', 3),
(7, 'Carlos Sainz', 12, 'overtaking, pace management', 4),
(8, 'Sergio Perez', 10, 'defensive driving, experience', 4),
(9, 'Fernando Alonso', 14, 'tire management, aggression', 5),
(10, 'Pierre Gasly', 10, 'consistency, racecraft', 5),
(11, 'Esteban Ocon', 9, 'defense, adaptability', 6),
(12, 'Nicholas Latifi', 6, 'experience, tire management', 6),
(13, 'Yuki Tsunoda', 7, 'aggression, racecraft', 7),
(14, 'Mick Schumacher', 8, 'learning curve, racecraft', 7),
(15, 'Valtteri Bottas', 13, 'experience, qualifying', 8),
(16, 'Kevin Magnussen', 9, 'aggression, consistency', 8),
(17, 'Alexander Albon', 8, 'adaptability, qualifying', 9),
(18, 'Zhou Guanyu', 6, 'pace development, learning', 9),
(19, 'Lance Stroll', 8, 'wet driving, racecraft', 10),
(20, 'Nico Hulkenberg', 11, 'defensive driving, adaptability', 10);

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `id` int(11) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `race`
--

INSERT INTO `race` (`id`, `location`, `date`) VALUES
(1, 'Monaco', '2023-03-05'),
(2, 'Silverstone', '2023-03-19'),
(3, 'Monza', '2023-04-02'),
(4, 'Spa', '2023-04-16'),
(5, 'Suzuka', '2023-04-30'),
(6, 'Melbourne', '2023-05-14'),
(7, 'Bahrain', '2023-05-28'),
(8, 'Abu Dhabi', '2023-06-11'),
(9, 'Austin', '2023-06-25'),
(10, 'Miami', '2023-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `race_detail`
--

CREATE TABLE `race_detail` (
  `raceid` int(11) NOT NULL,
  `carid` int(11) NOT NULL,
  `driverid` int(11) DEFAULT NULL,
  `startingposition` int(11) DEFAULT NULL,
  `numberoflaps` int(11) DEFAULT NULL,
  `resultposition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `race_detail`
--

INSERT INTO `race_detail` (`raceid`, `carid`, `driverid`, `startingposition`, `numberoflaps`, `resultposition`) VALUES
(1, 1, 1, 6, 60, 7),
(1, 2, 2, 12, 55, 16),
(1, 3, 3, 1, 61, 15),
(1, 4, 4, 17, 67, 2),
(1, 5, 5, 16, 59, 20),
(1, 6, 6, 20, 55, 12),
(1, 7, 7, 5, 58, 18),
(1, 8, 8, 19, 58, 15),
(1, 9, 9, 3, 63, 1),
(1, 10, 10, 2, 56, 18),
(1, 11, 11, 15, 64, 20),
(1, 12, 12, 9, 57, 2),
(1, 13, 13, 18, 52, 2),
(1, 14, 14, 10, 70, 19),
(1, 15, 15, 11, 67, 2),
(1, 16, 16, 8, 67, 10),
(1, 17, 17, 4, 57, 11),
(1, 18, 18, 14, 60, 8),
(1, 19, 19, 7, 68, 9),
(1, 20, 20, 13, 54, 3),
(2, 1, 1, 12, 51, 9),
(2, 2, 2, 6, 68, 13),
(2, 3, 3, 3, 61, 13),
(2, 4, 4, 5, 53, 4),
(2, 5, 5, 20, 61, 10),
(2, 6, 6, 17, 65, 8),
(2, 7, 7, 14, 67, 7),
(2, 8, 8, 1, 69, 14),
(2, 9, 9, 4, 66, 18),
(2, 10, 10, 18, 53, 12),
(2, 11, 11, 2, 68, 14),
(2, 12, 12, 15, 67, 10),
(2, 13, 13, 9, 55, 2),
(2, 14, 14, 7, 58, 18),
(2, 15, 15, 19, 58, 7),
(2, 16, 16, 11, 56, 15),
(2, 17, 17, 10, 68, 7),
(2, 18, 18, 13, 58, 6),
(2, 19, 19, 8, 64, 17),
(2, 20, 20, 16, 52, 7),
(3, 1, 1, 9, 67, 19),
(3, 2, 2, 8, 69, 16),
(3, 3, 3, 18, 63, 10),
(3, 4, 4, 16, 66, 18),
(3, 5, 5, 13, 58, 1),
(3, 6, 6, 17, 65, 11),
(3, 7, 7, 20, 67, 1),
(3, 8, 8, 7, 61, 11),
(3, 9, 9, 10, 69, 12),
(3, 10, 10, 3, 61, 11),
(3, 11, 11, 19, 64, 19),
(3, 12, 12, 14, 65, 8),
(3, 13, 13, 11, 66, 7),
(3, 14, 14, 15, 66, 8),
(3, 15, 15, 6, 62, 9),
(3, 16, 16, 4, 54, 20),
(3, 17, 17, 5, 62, 5),
(3, 18, 18, 12, 65, 16),
(3, 19, 19, 2, 63, 11),
(3, 20, 20, 1, 53, 8),
(4, 1, 1, 17, 63, 19),
(4, 2, 2, 9, 68, 1),
(4, 3, 3, 8, 55, 11),
(4, 4, 4, 19, 64, 18),
(4, 5, 5, 6, 60, 16),
(4, 6, 6, 18, 70, 1),
(4, 7, 7, 16, 68, 4),
(4, 8, 8, 2, 61, 6),
(4, 9, 9, 14, 53, 11),
(4, 10, 10, 5, 62, 5),
(4, 11, 11, 10, 70, 7),
(4, 12, 12, 3, 59, 10),
(4, 13, 13, 7, 52, 13),
(4, 14, 14, 13, 53, 15),
(4, 15, 15, 1, 51, 18),
(4, 16, 16, 20, 56, 6),
(4, 17, 17, 4, 58, 12),
(4, 18, 18, 11, 70, 15),
(4, 19, 19, 15, 70, 2),
(4, 20, 20, 12, 70, 2),
(5, 1, 1, 5, 67, 20),
(5, 2, 2, 8, 65, 14),
(5, 3, 3, 3, 57, 3),
(5, 4, 4, 17, 66, 16),
(5, 5, 5, 13, 67, 20),
(5, 6, 6, 4, 54, 2),
(5, 7, 7, 11, 54, 14),
(5, 8, 8, 12, 67, 11),
(5, 9, 9, 19, 58, 2),
(5, 10, 10, 14, 59, 14),
(5, 11, 11, 15, 50, 1),
(5, 12, 12, 1, 51, 13),
(5, 13, 13, 16, 57, 11),
(5, 14, 14, 6, 58, 20),
(5, 15, 15, 20, 62, 17),
(5, 16, 16, 9, 56, 19),
(5, 17, 17, 7, 63, 6),
(5, 18, 18, 18, 53, 5),
(5, 19, 19, 2, 64, 16),
(5, 20, 20, 10, 69, 11),
(6, 1, 1, 20, 70, 15),
(6, 2, 2, 8, 67, 15),
(6, 3, 3, 13, 68, 18),
(6, 4, 4, 6, 64, 2),
(6, 5, 5, 3, 56, 4),
(6, 6, 6, 9, 64, 6),
(6, 7, 7, 11, 70, 5),
(6, 8, 8, 5, 53, 10),
(6, 9, 9, 16, 61, 14),
(6, 10, 10, 15, 61, 2),
(6, 11, 11, 12, 61, 3),
(6, 12, 12, 18, 56, 4),
(6, 13, 13, 10, 68, 4),
(6, 14, 14, 4, 51, 19),
(6, 15, 15, 14, 55, 18),
(6, 16, 16, 17, 67, 11),
(6, 17, 17, 7, 53, 9),
(6, 18, 18, 1, 59, 2),
(6, 19, 19, 19, 62, 20),
(6, 20, 20, 2, 62, 18),
(7, 1, 1, 7, 67, 1),
(7, 2, 2, 4, 57, 19),
(7, 3, 3, 9, 67, 13),
(7, 4, 4, 12, 50, 8),
(7, 5, 5, 8, 55, 7),
(7, 6, 6, 10, 66, 19),
(7, 7, 7, 11, 53, 17),
(7, 8, 8, 14, 69, 11),
(7, 9, 9, 1, 54, 9),
(7, 10, 10, 2, 52, 17),
(7, 11, 11, 18, 52, 18),
(7, 12, 12, 15, 67, 6),
(7, 13, 13, 17, 64, 8),
(7, 14, 14, 3, 50, 6),
(7, 15, 15, 6, 51, 9),
(7, 16, 16, 19, 57, 14),
(7, 17, 17, 16, 65, 12),
(7, 18, 18, 13, 69, 18),
(7, 19, 19, 5, 62, 17),
(7, 20, 20, 20, 70, 10),
(8, 1, 1, 6, 54, 17),
(8, 2, 2, 2, 69, 6),
(8, 3, 3, 9, 52, 16),
(8, 4, 4, 3, 50, 19),
(8, 5, 5, 13, 50, 17),
(8, 6, 6, 17, 53, 13),
(8, 7, 7, 19, 59, 20),
(8, 8, 8, 10, 60, 13),
(8, 9, 9, 16, 66, 13),
(8, 10, 10, 11, 64, 1),
(8, 11, 11, 15, 67, 9),
(8, 12, 12, 12, 65, 5),
(8, 13, 13, 14, 55, 5),
(8, 14, 14, 20, 50, 10),
(8, 15, 15, 4, 50, 4),
(8, 16, 16, 1, 66, 5),
(8, 17, 17, 18, 67, 2),
(8, 18, 18, 7, 69, 17),
(8, 19, 19, 5, 56, 16),
(8, 20, 20, 8, 69, 15),
(9, 1, 1, 1, 63, 14),
(9, 2, 2, 19, 52, 5),
(9, 3, 3, 20, 67, 10),
(9, 4, 4, 12, 61, 5),
(9, 5, 5, 6, 59, 14),
(9, 6, 6, 8, 58, 11),
(9, 7, 7, 7, 63, 12),
(9, 8, 8, 18, 68, 7),
(9, 9, 9, 11, 59, 6),
(9, 10, 10, 14, 57, 1),
(9, 11, 11, 16, 61, 16),
(9, 12, 12, 3, 55, 6),
(9, 13, 13, 5, 62, 17),
(9, 14, 14, 9, 55, 15),
(9, 15, 15, 2, 65, 19),
(9, 16, 16, 13, 69, 2),
(9, 17, 17, 4, 54, 2),
(9, 18, 18, 17, 54, 9),
(9, 19, 19, 10, 57, 18),
(9, 20, 20, 15, 62, 16),
(10, 1, 1, 17, 60, 16),
(10, 2, 2, 1, 66, 6),
(10, 3, 3, 12, 64, 15),
(10, 4, 4, 6, 54, 1),
(10, 5, 5, 16, 50, 7),
(10, 6, 6, 19, 57, 3),
(10, 7, 7, 14, 67, 13),
(10, 8, 8, 20, 59, 12),
(10, 9, 9, 3, 66, 2),
(10, 10, 10, 4, 68, 13),
(10, 11, 11, 10, 54, 11),
(10, 12, 12, 7, 69, 3),
(10, 13, 13, 8, 64, 11),
(10, 14, 14, 2, 63, 17),
(10, 15, 15, 15, 55, 9),
(10, 16, 16, 18, 70, 13),
(10, 17, 17, 9, 65, 1),
(10, 18, 18, 11, 54, 12),
(10, 19, 19, 13, 51, 12),
(10, 20, 20, 5, 57, 8);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `teamname` varchar(50) DEFAULT NULL,
  `principal` varchar(50) DEFAULT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `enginemanufacturer` varchar(50) DEFAULT NULL,
  `tiremanufacturer` varchar(50) DEFAULT NULL,
  `chassistype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `teamname`, `principal`, `budget`, `enginemanufacturer`, `tiremanufacturer`, `chassistype`) VALUES
(1, 'Mercedes', 'Toto Wolff', 389000000.00, 'Ferrari', 'Pirelli', 'Type A'),
(2, 'Red Bull', 'Christian Horner', 337000000.00, 'Ferrari', 'Pirelli', 'Type A'),
(3, 'McLaren', 'Andreas Seidl', 257000000.00, 'Ferrari', 'Pirelli', 'Type D'),
(4, 'Ferrari', 'Frédéric Vasseur', 330000000.00, 'Renault', 'Pirelli', 'Type D'),
(5, 'Alpine', 'Otmar Szafnauer', 225000000.00, 'Red Bull', 'Pirelli', 'Type C'),
(6, 'Haas', 'Guenther Steiner', 171000000.00, 'Renault', 'Pirelli', 'Type C'),
(7, 'Williams', 'Jost Capito', 265000000.00, 'Renault', 'Pirelli', 'Type E'),
(8, 'AlphaTauri', 'Franz Tost', 374000000.00, 'Red Bull', 'Pirelli', 'Type E'),
(9, 'Aston Martin', 'Lawrence Stroll', 236000000.00, 'Red Bull', 'Pirelli', 'Type A'),
(10, 'Alfa Romeo', 'Mike Krack', 298000000.00, 'Mercedes', 'Pirelli', 'Type B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teamid` (`teamid`),
  ADD KEY `driverid` (`driverid`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teamid` (`teamid`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `race_detail`
--
ALTER TABLE `race_detail`
  ADD PRIMARY KEY (`raceid`,`carid`),
  ADD KEY `carid` (`carid`),
  ADD KEY `driverid` (`driverid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`driverid`) REFERENCES `driver` (`id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`);

--
-- Constraints for table `race_detail`
--
ALTER TABLE `race_detail`
  ADD CONSTRAINT `race_detail_ibfk_1` FOREIGN KEY (`raceid`) REFERENCES `race` (`id`),
  ADD CONSTRAINT `race_detail_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `car` (`id`),
  ADD CONSTRAINT `race_detail_ibfk_3` FOREIGN KEY (`driverid`) REFERENCES `driver` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
