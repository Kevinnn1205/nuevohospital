-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2024 a las 22:08:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospitalnuevo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` varchar(36) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cama` varchar(36) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `habitacion` varchar(36) NOT NULL,
  `id_medico` varchar(36) DEFAULT NULL,
  `id_paciente` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id_ingreso`, `estado`, `cama`, `fecha_ingreso`, `fecha_salida`, `habitacion`, `id_medico`, `id_paciente`) VALUES
('0df3ef56-e62e-11ee-9aa1-0a002700000a', 'H', '7', '2024-03-24', '2024-03-30', '23', '3c013809-04f8-405a-a3ef-80c071941c52', '9e611741-0415-476f-b5db-b852f4082ef9'),
('df4d2d1a-e62d-11ee-9aa1-0a002700000a', 'H', '123', '2024-03-19', '2024-03-23', '3', '43356563-7b64-4f0d-a655-51acdbeb13f5', '9e611741-0415-476f-b5db-b852f4082ef9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` varchar(36) NOT NULL,
  `celular` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `documento_identidad` varchar(11) NOT NULL,
  `primer_apellido` varchar(36) NOT NULL,
  `primer_nombre` varchar(36) NOT NULL,
  `segundo_apellido` varchar(36) NOT NULL,
  `segundo_nombre` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `celular`, `correo`, `estado`, `documento_identidad`, `primer_apellido`, `primer_nombre`, `segundo_apellido`, `segundo_nombre`) VALUES
('3c013809-04f8-405a-a3ef-80c071941c52', '3028275037', 'MANUELRIC1026@G,MAIL.COM', 'H', '1006519388', 'DIEZ', 'MANUEL', 'CORREDOR', 'RICARDO'),
('43356563-7b64-4f0d-a655-51acdbeb13f5', '3222606275', 'kevincamilo1211@gmaail.com', 'H', '1023370211', 'muñoz', 'kevin', 'campos', 'camilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` varchar(36) NOT NULL,
  `celular` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `documento_identidad` varchar(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `nombre_persona_contacto` varchar(36) NOT NULL,
  `primer_apellido` varchar(36) NOT NULL,
  `primer_nombre` varchar(36) NOT NULL,
  `segundo_apellido` varchar(36) NOT NULL,
  `segundo_nombre` varchar(36) NOT NULL,
  `telefono_persona_contacto` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `celular`, `correo`, `documento_identidad`, `estado`, `nombre_persona_contacto`, `primer_apellido`, `primer_nombre`, `segundo_apellido`, `segundo_nombre`, `telefono_persona_contacto`) VALUES
('9e611741-0415-476f-b5db-b852f4082ef9', '313458643', 'JUANPA@gmail.com', '1075223172', 'H', 'sebastian', 'BETANCOURT', 'JUAN ', 'GOMEZ', 'PABLO', '356798765'),
('ec73ebc5-cc16-47f5-bc7f-b7779355b798', '314456743', 'sebastian@gmail.com', '10765030330', 'H', 'adriana', 'penna', 'jhon', 'arias', 'sebastian', '3105743268');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `FKadjohbn8ptxr21e8i24i4mm1c` (`id_medico`),
  ADD KEY `FKcsr0av1uhvnl2krkly9q7904e` (`id_paciente`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `FKadjohbn8ptxr21e8i24i4mm1c` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `FKcsr0av1uhvnl2krkly9q7904e` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
