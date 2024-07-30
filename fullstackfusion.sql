-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2024 at 05:32 AM
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
-- Database: `fullstackfusion`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumidor`
--

CREATE TABLE `consumidor` (
  `Id_Consumidor` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Correo` varchar(80) NOT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumidor`
--

INSERT INTO `consumidor` (`Id_Consumidor`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Id_Producto`) VALUES
(1, 'Ernesto', 'Perez', 'ernest21@gmail.com', 3223847212, 1),
(2, 'Nabiy', 'Roa', 'nroa@gmail.com', 3213821212, 3),
(3, 'Carol', 'Torres', 'crolt@gmail.com', 3052847312, 2);

-- --------------------------------------------------------

--
-- Table structure for table `equipo`
--

CREATE TABLE `equipo` (
  `Id_Equipo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipo`
--

INSERT INTO `equipo` (`Id_Equipo`, `Nombre`, `Apellido`, `Telefono`, `Rol`) VALUES
(1, 'David', 'Quincha', 3173702186, 'UX/UI Designer'),
(2, 'Jhony', 'Arias', 3219859598, 'Web Developer'),
(3, 'Jose', 'Zipaquira', 3222825583, 'Developer'),
(4, 'Maria', 'Medina', 3123363205, 'Developer'),
(5, 'Laura', 'Sanchez', 3505261815, 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `pagina`
--

CREATE TABLE `pagina` (
  `Id_Pagina` int(11) NOT NULL,
  `Id_Equipo` int(11) DEFAULT NULL,
  `Id_Consumidor` int(11) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagina`
--

INSERT INTO `pagina` (`Id_Pagina`, `Id_Equipo`, `Id_Consumidor`, `Id_Producto`) VALUES
(1, 1, 2, 3),
(2, 2, 1, 2),
(3, 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id_Producto` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` decimal(10,3) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`Id_Producto`, `Nombre`, `Precio`, `Referencia`) VALUES
(1, 'Mouse Gamer', 90000.000, 'XP231423'),
(2, 'Teclado Gamer', 120000.000, 'TG2313'),
(3, 'Auriculares Gamer', 70000.000, 'AG26271');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumidor`
--
ALTER TABLE `consumidor`
  ADD PRIMARY KEY (`Id_Consumidor`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indexes for table `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`Id_Equipo`);

--
-- Indexes for table `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`Id_Pagina`),
  ADD KEY `Id_Equipo` (`Id_Equipo`),
  ADD KEY `Id_Consumidor` (`Id_Consumidor`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Producto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumidor`
--
ALTER TABLE `consumidor`
  MODIFY `Id_Consumidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `equipo`
--
ALTER TABLE `equipo`
  MODIFY `Id_Equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pagina`
--
ALTER TABLE `pagina`
  MODIFY `Id_Pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consumidor`
--
ALTER TABLE `consumidor`
  ADD CONSTRAINT `consumidor_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`);

--
-- Constraints for table `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `pagina_ibfk_1` FOREIGN KEY (`Id_Equipo`) REFERENCES `equipo` (`Id_Equipo`),
  ADD CONSTRAINT `pagina_ibfk_2` FOREIGN KEY (`Id_Consumidor`) REFERENCES `consumidor` (`Id_Consumidor`),
  ADD CONSTRAINT `pagina_ibfk_3` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
