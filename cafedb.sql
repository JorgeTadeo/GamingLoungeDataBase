-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2020 at 05:47 AM
-- Server version: 8.0.20-0ubuntu0.20.04.1
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOTH`
--

CREATE TABLE `BOOTH` (
  `BoothID` int NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Seats` int NOT NULL,
  `Floor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BOOTH`
--

INSERT INTO `BOOTH` (`BoothID`, `Availability`, `Seats`, `Floor`) VALUES
(1, 2, 8, 1),
(2, 1, 6, 1),
(3, 3, 4, 1),
(4, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `CustomerID` int NOT NULL,
  `Username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Hours` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `BoothID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`CustomerID`, `Username`, `Password`, `FirstName`, `LastName`, `Hours`, `GameID`, `BoothID`) VALUES
(34532567, 'Brad49', '98765', 'Brad', 'Richards', NULL, NULL, 1),
(34543234, 'Kev97', '12345', 'Kevin', 'Aston', 2, NULL, 2),
(35284662, 'ChrisPaul', '12345678', 'Chris', 'Paul', 4, NULL, NULL),
(56345367, 'SteveWillDoIt', '$1234', 'Steve', 'CanDoIt', NULL, NULL, NULL),
(56745676, 'Dan98', '98752', 'Daniel', 'Ramerez', 3, NULL, 2),
(56886567, 'PerryG97', '87234', 'Perry', 'Lanister', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER_ORDER`
--

CREATE TABLE `CUSTOMER_ORDER` (
  `CustomerID` int NOT NULL,
  `OrderNum` int NOT NULL,
  `Cost` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CUSTOMER_ORDER`
--

INSERT INTO `CUSTOMER_ORDER` (`CustomerID`, `OrderNum`, `Cost`) VALUES
(34543234, 1, '9.99'),
(34543234, 2, '7.99'),
(35284662, 3, '8.99');

-- --------------------------------------------------------

--
-- Table structure for table `GAME`
--

CREATE TABLE `GAME` (
  `GameID` int NOT NULL,
  `PlayerNum` int DEFAULT NULL,
  `BoardName` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConsoleType` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ControllerAmnt` int DEFAULT NULL,
  `ComputerNum` int DEFAULT NULL,
  `GameType` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GAME`
--

INSERT INTO `GAME` (`GameID`, `PlayerNum`, `BoardName`, `ConsoleType`, `ControllerAmnt`, `ComputerNum`, `GameType`) VALUES
(345, NULL, NULL, 'Xbox One', 4, NULL, 'C'),
(834, NULL, NULL, 'Nintendo 64', 4, NULL, 'C'),
(934, 8, 'UNO', NULL, NULL, NULL, 'B'),
(1213, NULL, NULL, 'PS4', 4, NULL, 'C'),
(2343, NULL, NULL, 'Nintendo GameCube', 4, NULL, 'C'),
(2346, NULL, NULL, NULL, NULL, 3, 'P'),
(2389, 6, 'Monopoly', NULL, NULL, NULL, 'B'),
(2398, 2, 'Connect 4', NULL, NULL, NULL, 'B'),
(3456, NULL, NULL, NULL, NULL, 2, 'P'),
(5678, NULL, NULL, NULL, NULL, 1, 'P'),
(6780, NULL, NULL, NULL, NULL, 4, 'P'),
(9834, 4, 'Scrabble', NULL, NULL, NULL, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `MEMBER`
--

CREATE TABLE `MEMBER` (
  `CustomerID` int NOT NULL,
  `Points` int DEFAULT NULL,
  `MembershipType` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MEMBER`
--

INSERT INTO `MEMBER` (`CustomerID`, `Points`, `MembershipType`) VALUES
(34532567, 298, 'Bronze'),
(34543234, 100, 'Gold'),
(56886567, 0, 'Platinum');

-- --------------------------------------------------------

--
-- Table structure for table `MENU_ITEM`
--

CREATE TABLE `MENU_ITEM` (
  `ItemID` int NOT NULL,
  `Name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  `Alcohol` decimal(4,2) DEFAULT NULL,
  `Vegan` tinyint(1) DEFAULT NULL,
  `ItemType` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MENU_ITEM`
--

INSERT INTO `MENU_ITEM` (`ItemID`, `Name`, `Price`, `Alcohol`, `Vegan`, `ItemType`) VALUES
(182, 'Carne Asada Tacos', '2.99', NULL, 0, 'F'),
(1029, 'Pasta', '6.99', NULL, 0, 'F'),
(1398, 'Kamikaze', '7.64', '28.60', NULL, 'D'),
(2398, 'Gimlet', '8.13', '12.40', NULL, 'D'),
(4256, 'Jack n Coke', '6.45', '10.00', NULL, 'D'),
(5623, 'Dr.Pepper', '1.00', '0.00', NULL, 'D'),
(5675, 'Cheese Burger', '7.99', NULL, 0, 'F'),
(5732, 'Creamy Vegan Pasta', '6.99', NULL, 1, 'F'),
(6341, 'Coke', '1.00', '0.00', NULL, 'D'),
(7317, 'Steak and Potatoes', '8.99', NULL, 0, 'F'),
(7441, 'Sweet Potato & Black Bean Burger', '7.99', NULL, 1, 'F'),
(7731, 'Vegan Mac and Cheese', '2.99', NULL, 1, 'F'),
(7821, 'Sprite', '1.00', '0.00', NULL, 'D'),
(8213, 'Diet Coke', '1.00', '0.00', NULL, 'D'),
(8233, 'Martini', '6.99', '15.00', NULL, 'D'),
(8534, 'Cauliflower Tacos', '2.99', NULL, 1, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `ORDER_CONTENTS`
--

CREATE TABLE `ORDER_CONTENTS` (
  `CustomerID` int NOT NULL,
  `OrderNum` int NOT NULL,
  `ItemID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ORDER_CONTENTS`
--

INSERT INTO `ORDER_CONTENTS` (`CustomerID`, `OrderNum`, `ItemID`) VALUES
(34543234, 1, 5623),
(35284662, 3, 5623),
(35284662, 3, 5675),
(34543234, 2, 5732),
(34543234, 2, 6341),
(34543234, 1, 7317);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOTH`
--
ALTER TABLE `BOOTH`
  ADD PRIMARY KEY (`BoothID`);

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `CUSTOMER_GAME_fk` (`GameID`),
  ADD KEY `CUSTOMER_BOOTH_fk` (`BoothID`);

--
-- Indexes for table `CUSTOMER_ORDER`
--
ALTER TABLE `CUSTOMER_ORDER`
  ADD PRIMARY KEY (`CustomerID`,`OrderNum`);

--
-- Indexes for table `GAME`
--
ALTER TABLE `GAME`
  ADD PRIMARY KEY (`GameID`);

--
-- Indexes for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `MENU_ITEM`
--
ALTER TABLE `MENU_ITEM`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `ORDER_CONTENTS`
--
ALTER TABLE `ORDER_CONTENTS`
  ADD PRIMARY KEY (`CustomerID`,`OrderNum`,`ItemID`) USING BTREE,
  ADD KEY `ORDER_CONTENTS_MENU_ITEM_fk` (`ItemID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD CONSTRAINT `CUSTOMER_BOOTH_fk` FOREIGN KEY (`BoothID`) REFERENCES `BOOTH` (`BoothID`) ON DELETE SET NULL,
  ADD CONSTRAINT `CUSTOMER_GAME_fk` FOREIGN KEY (`GameID`) REFERENCES `GAME` (`GameID`) ON DELETE SET NULL;

--
-- Constraints for table `CUSTOMER_ORDER`
--
ALTER TABLE `CUSTOMER_ORDER`
  ADD CONSTRAINT `CUSTOMER_ORDER_CUSTID_fk` FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD CONSTRAINT `MEMBER_CUSTOMERID_fk` FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `ORDER_CONTENTS`
--
ALTER TABLE `ORDER_CONTENTS`
  ADD CONSTRAINT `ORDER_CONTENTS_CUSTOMER_fk` FOREIGN KEY (`CustomerID`,`OrderNum`) REFERENCES `CUSTOMER_ORDER` (`CustomerID`, `OrderNum`) ON DELETE CASCADE,
  ADD CONSTRAINT `ORDER_CONTENTS_MENU_ITEM_fk` FOREIGN KEY (`ItemID`) REFERENCES `MENU_ITEM` (`ItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
