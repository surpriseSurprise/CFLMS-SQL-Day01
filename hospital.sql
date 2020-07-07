-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 12:41
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `hospital`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admission`
--

CREATE TABLE `admission` (
  `adm_id` int(11) NOT NULL,
  `adm_date` date DEFAULT NULL,
  `fk_patient_id` int(11) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `specialisation` varchar(55) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `intervention`
--

CREATE TABLE `intervention` (
  `int_id` int(11) NOT NULL,
  `treatment` text DEFAULT NULL,
  `fk_patient_id` int(11) DEFAULT NULL,
  `fk_adm_id` int(11) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL,
  `fk_doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `SSN` varchar(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `main_symptom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`adm_id`),
  ADD KEY `fk_patient_id` (`fk_patient_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indizes für die Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indizes für die Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`int_id`),
  ADD KEY `fk_patient_id` (`fk_patient_id`),
  ADD KEY `fk_adm_id` (`fk_adm_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`),
  ADD KEY `fk_doctor_id` (`fk_doctor_id`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indizes für die Tabelle `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `admission`
--
ALTER TABLE `admission`
  ADD CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints der Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints der Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`fk_adm_id`) REFERENCES `admission` (`adm_id`),
  ADD CONSTRAINT `intervention_ibfk_3` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`),
  ADD CONSTRAINT `intervention_ibfk_4` FOREIGN KEY (`fk_doctor_id`) REFERENCES `doctor` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
