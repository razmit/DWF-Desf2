-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 02:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `authors`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `idAuthor` int(11) NOT NULL,
  `nameAuthor` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`idAuthor`, `nameAuthor`, `birthday`, `phoneNumber`, `gender`) VALUES
(1, 'George Orwell', '1903-06-25', 78779898, 'Masculino'),
(2, 'J.K. Rowling', '1965-07-31', 77889988, 'Femenino'),
(3, 'Gabriel García Márquez', '1927-03-06', 2251266, 'Masculino'),
(4, 'Virginia Woolf', '1882-01-25', 77121236, 'Femenino'),
(5, 'Haruki Murakami', '1949-01-12', 79963221, 'Femenino');

-- --------------------------------------------------------

--
-- Table structure for table `authorgenre`
--

CREATE TABLE `authorgenre` (
  `idAuthorGenre` int(11) NOT NULL,
  `idAuthor` int(11) NOT NULL,
  `idLitGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authorgenre`
--

INSERT INTO `authorgenre` (`idAuthorGenre`, `idAuthor`, `idLitGenre`) VALUES
(1, 1, 2),
(2, 3, 4),
(3, 5, 1),
(4, 2, 3),
(5, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `literarygenre`
--

CREATE TABLE `literarygenre` (
  `idLitGenre` int(11) NOT NULL,
  `nameLitGenre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `literarygenre`
--

INSERT INTO `literarygenre` (`idLitGenre`, `nameLitGenre`) VALUES
(1, 'Ciencia ficción'),
(2, 'Ficción histórica'),
(3, 'Fantasía'),
(4, 'Misterio'),
(5, 'Realismo mágico');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`idAuthor`);

--
-- Indexes for table `authorgenre`
--
ALTER TABLE `authorgenre`
  ADD PRIMARY KEY (`idAuthorGenre`),
  ADD KEY `fk_author` (`idAuthor`),
  ADD KEY `fk_litgenre` (`idLitGenre`);

--
-- Indexes for table `literarygenre`
--
ALTER TABLE `literarygenre`
  ADD PRIMARY KEY (`idLitGenre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `idAuthor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `authorgenre`
--
ALTER TABLE `authorgenre`
  MODIFY `idAuthorGenre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `literarygenre`
--
ALTER TABLE `literarygenre`
  MODIFY `idLitGenre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorgenre`
--
ALTER TABLE `authorgenre`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`idAuthor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_litgenre` FOREIGN KEY (`idLitGenre`) REFERENCES `literarygenre` (`idLitGenre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
