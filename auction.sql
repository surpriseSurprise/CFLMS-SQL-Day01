-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 13:31
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
-- Datenbank: `auction`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auctionset`
--

CREATE TABLE `auctionset` (
  `auctionset_id` int(11) NOT NULL,
  `cat_nr` int(11) DEFAULT NULL,
  `lowest_price` int(11) DEFAULT NULL,
  `highest_price` bigint(20) DEFAULT NULL,
  `rem_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bid`
--

CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `biddate` date DEFAULT NULL,
  `hour` datetime DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `PW` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product1`
--

CREATE TABLE `product1` (
  `p1_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product2`
--

CREATE TABLE `product2` (
  `p2_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product3`
--

CREATE TABLE `product3` (
  `p3_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auctionset`
--
ALTER TABLE `auctionset`
  ADD PRIMARY KEY (`auctionset_id`);

--
-- Indizes für die Tabelle `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indizes für die Tabelle `product1`
--
ALTER TABLE `product1`
  ADD PRIMARY KEY (`p1_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Indizes für die Tabelle `product2`
--
ALTER TABLE `product2`
  ADD PRIMARY KEY (`p2_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Indizes für die Tabelle `product3`
--
ALTER TABLE `product3`
  ADD PRIMARY KEY (`p3_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`),
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints der Tabelle `product1`
--
ALTER TABLE `product1`
  ADD CONSTRAINT `product1_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);

--
-- Constraints der Tabelle `product2`
--
ALTER TABLE `product2`
  ADD CONSTRAINT `product2_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);

--
-- Constraints der Tabelle `product3`
--
ALTER TABLE `product3`
  ADD CONSTRAINT `product3_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
