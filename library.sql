-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-12-2022 a las 15:47:56
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `library`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dep_id` int(11) NOT NULL,
  `dep_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dep_id`, `dep_nombre`) VALUES
(1, 'Futbol'),
(2, 'Basquetbol'),
(3, 'Voleivol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `equ_id` int(11) NOT NULL,
  `equ_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`equ_id`, `equ_nombre`) VALUES
(1, 'Santa Fe'),
(2, 'Millonarios'),
(3, 'Nacional'),
(4, 'America'),
(5, 'Junior'),
(6, 'Medellin');
(7, 'Pereira'),
(8, 'Bucaramanga'),
(9, 'Alianza'),
(10, 'Huila'),
(11, 'Equidad'),
(12, 'Aguilas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `eve_id` int(11) NOT NULL,
  `eve_fecha` date NOT NULL,
  `equ_equipo1` int(11) NOT NULL COMMENT 'foranea a equipos id',
  `equ_equipo2` int(11) NOT NULL COMMENT 'foranea a equipos id',
  `eve_marca1` int(11) NOT NULL DEFAULT 0,
  `eve_marca2` int(11) NOT NULL DEFAULT 0,
  `dep_id` int(11) NOT NULL DEFAULT 0 COMMENT 'foranea a deportes id',
  `eve_descrip` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`eve_id`, `eve_fecha`, `equ_equipo1`, `equ_equipo2`, `eve_marca1`, `eve_marca2`, `dep_id`, `eve_descrip`) VALUES
(1, '2022-12-01', 3, 4, 2, 1, 1, 'COPA LIBERTADORES'),
(2, '2022-12-06', 1, 2, 40, 36, 2, 'MUNDIAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_email` varchar(200) NOT NULL,
  `usu_clave` varchar(20) NOT NULL,
  `usu_nombres` varchar(200) NOT NULL,
  `usu_apellidos` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_email`, `usu_clave`, `usu_nombres`, `usu_apellidos`) VALUES
(1, 'bryan.espinosa@gmail.com', '123', 'Bryan', 'Espinosa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`equ_id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`eve_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `equ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `eve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
