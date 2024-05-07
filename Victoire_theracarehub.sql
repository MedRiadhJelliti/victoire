-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 10:46 AM
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
-- Database: `theracarehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `ergotherpeute`
--

CREATE TABLE `ergotherpeute` (
  `idErgotherpeute` int(11) NOT NULL,
  `Specialite` varchar(30) NOT NULL,
  `NumeroLicense` varchar(30) NOT NULL,
  `ListeSeance` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `DateDeNaissance` date NOT NULL,
  `AntecedantsMedicaux` varchar(30) NOT NULL,
  `ListeSeance` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seance_therapi`
--

CREATE TABLE `seance_therapi` (
  `Attribute1IdSeance` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Objectifs` varchar(30) NOT NULL,
  `Progres` varchar(30) NOT NULL,
  `Absences` tinyint(1) NOT NULL,
  `JustificationAbsence` varchar(30) NOT NULL,
  `IdPatient` int(11) NOT NULL,
  `IdErgotherapeute` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `MotDePasse` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ergotherpeute`
--
ALTER TABLE `ergotherpeute`
  ADD PRIMARY KEY (`idErgotherpeute`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`);

--
-- Indexes for table `seance_therapi`
--
ALTER TABLE `seance_therapi`
  ADD PRIMARY KEY (`Attribute1IdSeance`),
  ADD KEY `IdPatient` (`IdPatient`),
  ADD KEY `IdErgotherapeute` (`IdErgotherapeute`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seance_therapi`
--
ALTER TABLE `seance_therapi`
  ADD CONSTRAINT `seance_therapi_ibfk_1` FOREIGN KEY (`IdPatient`) REFERENCES `patient` (`idPatient`),
  ADD CONSTRAINT `seance_therapi_ibfk_2` FOREIGN KEY (`IdErgotherapeute`) REFERENCES `ergotherpeute` (`idErgotherpeute`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
