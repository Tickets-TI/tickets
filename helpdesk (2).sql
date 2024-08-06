-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2023 a las 20:49:24
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `helpdesk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `td_ticketdetalle`
--

CREATE TABLE `td_ticketdetalle` (
  `tickd_id` int(11) NOT NULL,
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `tickd_descrip` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `td_ticketdetalle`
--

INSERT INTO `td_ticketdetalle` (`tickd_id`, `tick_id`, `usu_id`, `tickd_descrip`, `fech_crea`, `est`) VALUES
(1, 1, 3, 'Te respondo', '2023-01-11 18:11:41', 1),
(2, 1, 1, 'Usuario respondiendo', '2023-01-11 11:12:17', 1),
(3, 1, 3, 'Resolución', '2023-01-11 18:12:44', 1),
(4, 1, 1, 'Gracias', '2023-01-11 18:13:11', 1),
(5, 1, 3, 'Favor de cerrar ticket', '2023-01-11 18:13:57', 1),
(6, 1, 3, 'Duplicado', '2023-01-11 18:13:57', 1),
(7, 1, 1, 'Duplicado', '2023-01-11 18:13:11', 1),
(8, 1, 1, 'Duplicado 2', '2023-01-11 18:13:11', 1),
(9, 2, 3, 'Hola', '2023-01-11 18:11:41', 1),
(10, 2, 1, 'Adios', '2023-01-11 18:13:11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_categoria`
--

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_categoria`
--

INSERT INTO `tm_categoria` (`cat_id`, `cat_nom`, `est`) VALUES
(1, 'Hardware', 1),
(2, 'Software', 1),
(4, 'Desarrollo', 1),
(6, 'Infraestructura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_ticket`
--

CREATE TABLE `tm_ticket` (
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `tick_titulo` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `tick_descrip` varchar(9000) COLLATE utf8_spanish_ci NOT NULL,
  `tick_estado` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `resolutor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_ticket`
--

INSERT INTO `tm_ticket` (`tick_id`, `usu_id`, `cat_id`, `tick_titulo`, `tick_descrip`, `tick_estado`, `fech_crea`, `resolutor`, `est`) VALUES
(1, 1, 1, 'Test', 'Test', 'Abierto', '2023-01-03 14:53:04', 'Yare', 1),
(2, 1, 1, 'Test2', '<p>El reno</p>', 'Abierto', '1900-01-04 14:53:47', 'Yare', 1),
(3, 1, 1, 'Test2', '<p>El reno</p>', 'Abierto', '1900-01-09 00:00:00', 'Yare', 1),
(4, 1, 1, 'Mouse', '<p><span style=\"font-weight: 700; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas \"Letraset\", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', 'Abierto', '1900-01-10 14:53:14', 'Yare', 1),
(5, 1, 4, 'sdfg', '<p>asdfghjbkl</p>', 'Abierto', '1900-01-11 14:53:19', 'Reno', 1),
(6, 1, 1, 'oñlikujyhgf', '<p>oiuyjhtgrfd</p>', 'Abierto', '1900-01-16 14:53:22', 'Yare', 1),
(7, 1, 6, 'oñlikujyhgf', '<p><b>Hola</b></p>', 'Cerrado', '2023-01-06 08:33:32', 'Ale', 1),
(8, 1, 4, 'Tickets', '<p><b>Jimena1</b></p>', 'Abierto', '2023-01-06 11:41:02', 'Reno', 1),
(9, 1, 6, 'sdfg', '<p>Fallo internet</p>', 'Abierto', '2023-01-10 17:03:02', 'Manu', 1),
(10, 1, 6, 'Manu', '<p>Manu</p>', 'Abierto', '2023-01-16 13:14:16', NULL, 1),
(11, 1, 6, 'Manu', '<p>Manito</p>', 'Abierto', '2023-01-16 13:15:47', NULL, 1),
(12, 1, 1, 'Mouse', '<p>zxcfvbnm</p>', 'Abierto', '2023-01-31 11:46:45', NULL, 1),
(13, 1, 4, 'rtgyhjk', '<p>fghjk</p>', 'Abierto', '2023-01-31 11:47:08', NULL, 1),
(14, 1, 2, 'fghjk', '<p>rfghjjjjjjjjjjjjjjjjj</p>', 'Abierto', '2023-01-31 11:47:17', NULL, 1),
(15, 1, 4, 'fghjkl.', '<p>fghjkl</p>', 'Abierto', '2023-01-31 11:47:22', NULL, 1),
(16, 1, 4, 'fghnjm', '<p>dfghjnm,</p>', 'Abierto', '2023-01-31 11:47:28', NULL, 1),
(17, 1, 6, 'fcvbnm', '<p>vbnm</p>', 'Abierto', '2023-01-31 11:47:32', NULL, 1),
(18, 1, 2, 'fvgbn', '<p>vbnm</p>', 'Abierto', '2023-01-31 11:47:37', NULL, 1),
(19, 1, 4, 'fghjkl.', '<p>fghjkm,.</p>', 'Abierto', '2023-01-31 11:47:56', NULL, 1),
(20, 1, 6, 'sdcfvgb', '<p>dcfgbdcvbngvbh</p>', 'Abierto', '2023-01-31 11:48:02', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usuario`
--

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_ape` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_pass` varchar(29) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `fecha_modi` datetime DEFAULT NULL,
  `fecha_eli` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla Mantenedor de Usuarios';

--
-- Volcado de datos para la tabla `tm_usuario`
--

INSERT INTO `tm_usuario` (`usu_id`, `usu_nom`, `usu_ape`, `usu_correo`, `usu_pass`, `rol_id`, `fecha_crea`, `fecha_modi`, `fecha_eli`, `est`) VALUES
(1, 'Juan', 'Lira', 'enoysan_11@hotmail.com', '123456', 1, '2022-12-20 14:08:44', NULL, NULL, 1),
(3, 'Juan', 'Hernandez', 'enoysan_12@hotmail.com', '123456', 2, '2022-12-20 14:08:44', NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `td_ticketdetalle`
--
ALTER TABLE `td_ticketdetalle`
  ADD PRIMARY KEY (`tickd_id`);

--
-- Indices de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `tm_ticket`
--
ALTER TABLE `tm_ticket`
  ADD PRIMARY KEY (`tick_id`);

--
-- Indices de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `td_ticketdetalle`
--
ALTER TABLE `td_ticketdetalle`
  MODIFY `tickd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tm_ticket`
--
ALTER TABLE `tm_ticket`
  MODIFY `tick_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
