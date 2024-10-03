-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2024 a las 19:06:33
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
-- Base de datos: `tidesk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `td_ticketdetalle`
--

CREATE TABLE `td_ticketdetalle` (
  `tickd_id` int(11) NOT NULL,
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `tickd_descrip` mediumtext NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `td_ticketdetalle`
--

INSERT INTO `td_ticketdetalle` (`tickd_id`, `tick_id`, `usu_id`, `tickd_descrip`, `fech_crea`, `est`) VALUES
(2, 1, 1, 'Prueba', '2024-08-08 16:23:23', 1),
(3, 1, 3, '<p>Duplicado</p>', '2024-08-08 17:05:35', 1),
(4, 1, 3, 'Duplicado 2', '2024-08-08 17:11:54', 1),
(5, 1, 3, 'Duplicado 3', '2024-08-08 17:12:24', 1),
(6, 3, 3, 'fsdf', '2024-08-14 14:24:23', 1),
(7, 3, 3, 'dsfsdfsd', '2024-08-14 14:24:26', 1),
(8, 3, 3, 'Ticket Cerrado...', '2024-08-14 14:24:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_categoria`
--

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(150) NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_categoria`
--

INSERT INTO `tm_categoria` (`cat_id`, `cat_nom`, `est`) VALUES
(1, 'Camaras', 1),
(2, 'Compras', 1),
(4, 'Documentacion', 1),
(6, 'Correo', 1),
(7, 'Software', 1),
(8, 'Equipo', 1),
(9, 'Hardware', 1),
(10, 'Impresora', 1),
(11, 'Infraestructura', 1),
(12, 'Respaldo', 1),
(13, 'Servidor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_ticket`
--

CREATE TABLE `tm_ticket` (
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `tick_titulo` varchar(250) NOT NULL,
  `tick_descrip` varchar(9000) NOT NULL,
  `tick_estado` varchar(15) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_ticket`
--

INSERT INTO `tm_ticket` (`tick_id`, `usu_id`, `cat_id`, `tick_titulo`, `tick_descrip`, `tick_estado`, `fech_crea`, `est`) VALUES
(1, 1, 4, 'Test', '<p>Test</p>', 'Cerrado', '2024-07-30 14:08:11', 1),
(2, 1, 1, 'Prueba 2', '<p>Prueba 2</p>', 'Cerrado', '2024-07-30 14:09:13', 1),
(3, 1, 2, 'Au', '<p>Prueba&nbsp;<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAA+eSURBVHic7dixkVzXEYXhCyWAAJgClA4t+ZKpMGjKkcE4lISYAkNADCIphyOBJHCwuz0zr2/f76ta/72urfnPzFoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADTxbq31zdUPAQA8z7u11j/WWh/XWn+++FkAgCe4xf+XX/+MAAAY7vfxNwIAYLgvxd8IAIChvhZ/IwAAhnlp/I0AABjitfE3AgBgc2+NvxEAAJuqxt8IAIDN3Cv+RgAAbOLe8TcCAKC5R8XfCACAph4dfyMAAJp5VvyNAABo4tnxNwIA4GJXxd8IAICLXB1/IwAAnqxL/I0AAHiSbvE3AgDgwbrG3wgAgAfpHn8jAADubJf4GwEAcCe7xd8IAICiXeNvBADAG+0efyMAAF5pSvyNAAB4oWnxNwIA4Cumxt8IAIAvmB5/IwAAfueU+BsBAPCr0+JvBABwvFPjbwQAcKzT428EAHCcLvH/aa31Y4Pn+LjW+lC6KAA01yX+P6+1/rrWer/W+neD5/FLAABjdYv/jREAAA/SNf43RgAA3Fn3+N8YAQBwJ7vE/8YIAICi3eJ/YwQAwBvtGv8bIwAAXmn3+N8YAQDwQlPif2MEAMBXTIv/jREAAF8wNf43RgAA/M70+N8YAQDwq1Pif2MEAHC80+J/YwQAcKxT439jBABwnNPjf2MEAHAM8f8tIwCA8cT/84wAAMYS/8wIAGAc8X8ZIwCAMcT/dYwAALYn/m9jBACwLfGvMQIA2I7434cRAMA2xP++jAAA2hP/xzACAGhL/B/LCACgHfF/DiMAgDbE/7mMAAAuJ/7XMAIAuIz4X8sIAODpxL8HIwCApxH/XowAAB5O/HsyAgB4GPHvzQgA4O7Efw9GAAB3I/57MQIAKBP/PRkBALyZ+O/NCADg1cR/BiMAgBcT/1mMAAC+SvxnMgIA+CLxn80IAOAPxP8MRgAA/yP+ZzECABD/QxkBAAcT/7MZAQAHEn/WMgIAjiL+fMoIADiA+PM5RgDAcN+u6z/kf1lrff/oF+XV3q+1fljX/298XGt9ePC7Ahzn3Vrrn+v6D/n/rLX+8uB35fX8EgAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBAIMZASRGAMBgRgCJEQAwmBFAYgQADGYEkBgBXOpPVz8AAABM4ds/iW//AAOJP4n4Awwk/iTiDzCQ+JOIP8BA4k8i/gADiT+J+AMMJP4k4g8wkPiTiD/AQOJPIv4AA4k/ifgDDCT+JOIPMJD4k4g/wEDiTyL+AAOJP4n4Awwk/iTiDzCQ+JOIP8BA4k8i/gADiT+J+AMMJP4k4g8wkPiTiD/AQOJPIv4AA4k/ifgDDCT+JOJf836t9a+157MDg4k/ifjXfHq/Xd8BGEj8ScS/5nP32/VdgEHEn0T8a9L9dn0nYADxJxH/mpfcb9d3AzYm/iTiX/Oa++36jsCGxJ9E/Gvecr9d3xXYiPiTiH9N5X67vjOwAfEnEf+ae9xv13cHGhN/EvGvuef9dr0B0JD4k4h/zSPut+stgEbEn0T8ax55v11vAjQg/iTiX/OM++16G+BC4k8i/jXPvN+uNwIuIP4k4l9zxf12vRXwROJPIv41V95v15sBTyD+JOJf0+F+u94OeCDxJ+kQr50D5n5AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AS+JPIl417ge0JP4k4lXjfkBL4k8iXjXuB7Qk/iTiVeN+QEviTyJeNe4HtCT+JOJV435AW9+u6z+cfllrff/oF+XV3q+1fljX/298XGt9ePC7PoL7Ae19t67/kPp5rfW3R78oL+aba437AdswArgRrxr3A7ZjBCBeNe4HbMsIOJd41bgfsD0j4DziVeN+wBhGwDnEq8b9gHGMgPnEq8b9gLGMgLnEq8b9gPGMgHnEq8b9gGMYAXOIV437AccxAvYnXjXuBxzLCNiXeNW4H3A8I2A/4lXjfgC/MgL2IV417gfwO0ZAf+JV434AX2AE9CVeNe4H8BVGQD/iVeN+AC9kBPQhXjXuB/BKRsD1xKvG/QDeyAi4jnjVuB9AkRHwfOJV434Ad2IEPI941bgfwJ0ZAY8nXjXuB/AgRsDjiFeN+wE8mBFwf+JV434AT2IE3I941bgfwJMZAXXiVeN+ABcxAt5OvGrcD+BiRsDriVeN+wE0YQS8nHjVuB9AM0bA14lXjfsBNGUEfJl41bgfQHNGwB+JV437AWzCCPg/8apxP4DNGAHiVeV+AJs6eQSIV437AWzuxBEgXjXuBzDESSNAvGrcD2CYE0aAeNW4H8BQk0eAeNW4H8BwE0eAeNW4H8AhJo0A8apxP4DDTBgB4lXjfgCH2nkEiFeN+wEcbscRIF417gfAWmuvESBeNe4HwG/sMALEq8b9APisziNAvGrcD4Co4wgQrxr3A+BFOo0A8apxPwBe7N1a6x/r+mj8tNb6scFzfFxrfShd9Brv11o/LPcD4JU6/BJw9d+u31x98weg5OQRsGu8xB+AuzhxBOwaL/EH4K5OGgG7xkv8AXiIE0bArvESfwAeavII2DVe4g/AU0wcAbvGS/wBeKpJI2DXeIk/AJeYMAJ2jZf4A3CpnUfArvESfwBa2HEE7Bov8QeglZ1GwK7xEn8AWtphBOwaL/EHoLXOI2DXeIk/AFvoOAJ2jZf4A7CVTiNg13iJPwBb6jACdo2X+AOwtStHwK7xEn8ARrhiBOwaL/EHYJRnjoBd4yX+AIz0jBGwa7zEH4DRHjkCdo2X+ANwhEeMgF3jJf4AHOWeI2DXeIk/AEe6xwjYNV7iD8DRKiNg13iJPwCst42AXeMl/gDwideMgF3jJf4A8BkvGQG7xkv8ASBII2DXeIk/ALzA50bArvESfwB4hU9HwK7xEn8AeIPv1r7xEn8AeKN3a61vrn6IN3i/1vph9Yj/hwe/KwCwfPMHgOOIPwAcRvwB4DDiDwCHEX8AOIz4A8BhxB8ADiP+AHAY8QeAw4g/ABxG/AHgMOIPAIcRfwA4jPgDwGHEHwAOI/4AcBjxB4DDiD8AHEb8AeAw4g8AhxF/ADiM+APAgf6+esT/w6NfFAD4re+Wb/4AcKQrRoD4A0ADzxwB4g8AjTxjBIg/ADT0yBEg/gDQ2CNGgPgDwAbuOQLEHwA2co8RIP4AsKHKCBB/ANjYW0aA+APAAK8ZAeIPAIO8ZASIPwAMlEaA+APAYJ8bAeIPAAf4dASIPwAc5Lsl/gBwnHdrrW+ufggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOAP/gsSmqKgrIW9PQAAAABJRU5ErkJggg==\" data-filename=\"igual-a-mayor-que-simbolo.png\" style=\"width: 512px;\"></p>', 'Cerrado', '2024-08-06 13:43:49', 1),
(4, 1, 1, '', '<p><img src=\"data:image/png;base64,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', 'Cerrado', '2024-08-06 13:51:55', 1),
(5, 1, 1, 'asd', 'ad', 'Abierto', '2024-08-20 10:59:45', 1),
(6, 1, 7, 'wada', 'awd', 'Abierto', '2024-08-20 10:59:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usuario`
--

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` varchar(150) DEFAULT NULL,
  `usu_ape` varchar(150) DEFAULT NULL,
  `usu_correo` varchar(150) NOT NULL,
  `usu_pass` varchar(29) NOT NULL,
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
(1, 'Abel Alejandro', 'Carranza Sanchez', 'aacarranza@juridico.grupoccima.com.mx', 'carranza24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(2, 'Alan Gonzales', 'Montes de Oca', 'alan.gonzalez@grupoccima.com.mx', 'gonzalez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(3, 'Cesar Alonso', 'Herrera Barrera', 'caherrera@juridico.grupoccima.com.mx', 'herrera24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(4, 'Cruz Daniel', 'Garcia Martinez', 'cdgarcia@juridico.grupoccima.com.mx', 'daniel24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(5, 'Emmanuel Garcia', 'Garcia Roman', 'emmanuel.garcia@navetec.com.mx', 'emmanuel24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(6, 'Fernando Benjamin', 'Benjamin Cuacuas', 'f.cuacuas@grupoccima.com.mx', 'benjamin24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(7, 'Isabela Tellez', 'Tellez Olvera', 'isabela.tellez@grupoccima.com.mx', 'tellez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(8, 'Julio Xaco', 'Xaco Romero', 'julio.xaco@habitta.com.mx', 'xaco24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(9, 'Karina Fernanda', 'Bravo Ascencio', 'karina.bravo@grupoccima.com.mx', 'bravo24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(10, 'Katia Dennis', 'Aguilar Flores', 'katia.aguilar@navetec.com.mx', 'aguilar24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(11, 'Liu Yesenia', 'Velazquez Ricardez', 'liu.velazquez@habitta.com.mx', 'velazquez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(12, 'Maria Amparo', 'Ramirez Mendez', 'maramirez@juridico.grupoccima.com.mx', 'ramirez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(13, 'Maria Laura', 'Gonzalez Ramos', 'mlgonzalez@juridico.grupoccima.com.mx', 'gonzalez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(14, 'Marisol Guerrero', 'Guerrero Zea', 'marisol.guerrero@habitta.com.mx', 'guerrero24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(15, 'Paola Patricia', 'Gonzalez Vazquez', 'paola.gonzalez@grupoccima.com.mx', 'gonzalez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(16, 'Saul Morales', 'Morales Enriquez', 'saul.morales@habitta.com.mx', 'morales24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(17, 'Ivan Alexis', 'Lagunas Martinez', 'ialagunas@juridico.grupoccima.com.mx', 'lagunas24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(18, 'Fabiola De', 'La Rosa', 'fdelarosa@juridico.grupoccima.com.mx', 'fabiola24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(19, 'Brenda Paola', 'Rivera Velazquez', 'bprivera@grupoccima.com.mx', 'rivera24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(20, 'Karla Daniela', 'Ramirez Cruz', 'kdramirez@juridico.grupoccima.com.mx', 'ramirez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(21, 'Juan Ramon', 'Lira Hernandez', 'jrlira@grupoccima.com.mx', 'lira24.', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(22, 'Karla Lizzet', 'Delgado Almanza', 'kldelgado@juridico.grupoccima.com.mx', 'delgado24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(23, 'Bertha Osuna', 'Osuna Rios', 'bertha.osuna@grupoccima.com.mx', 'osuna24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(24, 'Jorge Alejandro', 'Garcia Rendon', 'jorge.garcia@capitalcc.com.mx', 'garcia24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(25, 'Frida Lorena', 'Garcia Vera', 'flgarcia@juridico.grupoccima.com.mx', 'lorena24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(26, 'Victor Manuel', 'Venegas', 'vmvenegas@juridico.grupoccima.com.mx', 'venegas24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(27, 'Yaressi Rodriguez', 'Del Angel', 'yrodriguez@grupoccima.com.mx', 'Yare1394', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(28, 'Hector Miguel', 'Ornelas Flores', 'mornelas@grupoccima.com.mx', 'ornelas24.', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(29, 'Carolina De', 'Rosa Garcia', 'cdelarosa@grupoccima.com.mx', 'carolina.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(30, 'Maria Guadalupe', 'Lara Romero', 'mglara@grupoccima.com.mx', 'lara.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(31, 'Erick Adrian', 'Pineda Carrillo', 'epineda@grupoccima.com.mx', 'pineda.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(32, 'Oscar Guerrero', 'Guerrero Arvizo', 'oguerrero@grupoccima.com.mx', 'oscar.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(33, 'Isaac Bernabe', 'Aguilar Rivera', 'iaguilar@grupoccima.com.mx', 'aguilar.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(34, 'Jhony Pacheco', 'Pacheco Garcia', 'jpacheco@grupoccima.com.mx', 'jhony.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(35, 'Jose Alfredo', 'Medellin Castillo', 'jmedellin@grupoccima.com.mx', 'medellin.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(36, 'Marco Antonio', 'Izquierdo Soto', 'maizquierdo@grupoccima.com.mx', 'izquierdo.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(37, 'Mauricio Rojano', 'Rojano Mata', 'mrojano@grupoccima.com.mx', 'mauricio.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(38, 'Sabina Gpe', 'Rubio Balderas', 'srubio@grupoccima.com.mx', 'rubio.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(39, 'Roberto Garcia', 'Garcia Magdaleno', 'rmagdaleno@grupoccima.com.mx', 'roberto.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(40, 'Samuel Martinez', 'Martinez Hernandez', 'smartinez@grupoccima.com.mx', 'samuel.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(41, 'Daniela Fernanda', 'Estrella Rosales', 'dfestrella@grupoccima.com.mx', 'estrella.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(42, 'Jorge Alberto', 'Hernandez Huerta', 'jahernandez@grupoccima.com.mx', 'hernandez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(43, 'Rosa Karina', 'Ramirez Patlan', 'rkramirez@grupoccima.com.mx', 'ramirez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(44, 'Victor Alfonso', 'Plata Lugo', 'vaplata@grupoccima.com.mx', 'plata.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(45, 'Alejandro Gonzalez', 'Gonzalez Gaytan', 'agonzalez@habitta.com.mx', 'alejandro.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(46, 'Francelia Atanacio', 'Atanacio Rios', 'fatanacio@habitta.com.mx', 'francelia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(47, 'Juan Daniel', 'Maldonado Moreno', 'jmaldonado@habitta.com.mx', 'maldonado.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(48, 'Maria Monserrat', 'Mendoza Avila', 'mmendoza@habitta.com.mx', 'mendoza.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(49, 'Yadira Jimenez', 'Jimenez Cervantes', 'yjimenez@habitta.com.mx', 'yadira.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(50, 'Yesenia Rodriguez', 'Rodriguez Ramirez', 'yrodriguez@habitta.com.mx', 'yesenia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(51, 'Anahi Ramirez', 'Ramirez Hernandez', 'aramirez@navetec.com.mx', 'anahi.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(52, 'Karla Maria', 'Figueroa Ruiz', 'kmfigueroa@navetec.com.mx', 'figueroa.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(53, 'Angel Gonzalez', 'Gonzalez Olguin', 'agonzalez@navetec.com.mx', 'angel.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(54, 'Jacobo Serrano', 'Serrano Garcia', 'jserrano@navetec.com.mx', 'jacobo.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(55, 'Leticia Esquivel', 'Esquivel Rufino', 'lesquivel@navetec.com.mx', 'leticia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(56, 'Victor Manuel', 'Velazquez Martinez', 'vmvelazquez@grupoccima.com.mx', 'velazquez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(57, 'Xitlaly Alondra', 'Garcia Alcantara', 'xagarcia@grupoccima.com.mx', 'garcia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(58, 'Ana Lucia', 'Montiel Juarez', 'lmontiel@grupoccima.com.mx', 'montiel.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(59, 'Andrea Yaret', 'Gonzalez Morales', 'aygonzalez@grupoccima.com.mx', 'gonzalez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(60, 'Claudia Gerorgina', 'Jimenez Lopez', 'cgjimenez@grupoccima.com.mx', 'jimenez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(61, 'Alvaro Gonzalez', 'Gonzalez Ibarra', 'agibarra@grupoccima.com.mx', 'alvaro.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(62, 'Hugo ', 'Zeled?n Aguilar', 'hzeledon_cad@habitta.com.mx', 'hugo.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(63, 'Lisset Gpe', 'Elizalde Alquisira', 'lgelizalde@grupoccima.com.mx ', 'elizalde.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(64, 'Jesus Ramon', 'Sanchez Chang', 'jrsanchez@grupoccima.com.mx', 'sanchez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(65, 'Marian Quiroz', 'Quiroz', 'mquiroz@grupoccima.com.mx', 'marian.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(66, 'Ulises Eduardo', 'Narvaez', 'rnarvaez@grupoccima.com.mx', 'rÃ­os.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(67, 'Diana Rocio', 'Herrejon Sanchez', 'drherrejon@grupoccima.com.mx', 'herrejon.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(68, 'Isaac Martinez', 'Martinez Alvarado', 'imartinez@grupoccima.com.mx', 'isaac.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(69, 'Alondra Cruz', 'Cruz Pichardo', 'acruz@grupoccima.com.mx', 'alondra.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(70, 'Montzerrat Moreno', 'Moreno Gonzalez', 'mmoreno@grupoccima.com.mx', 'montzerrat.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(71, 'Rosario Badillo', 'Badillo Padro', 'mrbadillo@grupoccima.com.mx', 'rosario.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(72, 'Cesar Tabares', 'Tabares Castellanos', 'ctabares@grupoccima.com.mx', 'cesar.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(73, 'Cinthia Vanessa', 'Gonzalez Gonzalez', 'cvgonzalez@grupoccima.com.mx', 'gonzalez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(74, 'Edgar Enrique', 'Gutierrez Garcia', 'egutierrez@grupoccima.com.mx', 'gutierrez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(75, 'Jennifer Alanis', 'Garcia Morales', 'jagarcia@grupoccima.com.mx', 'garcia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(76, 'Ma. Guadalupe', 'Lopez Campuzano', 'mglopez@grupoccima.com.mx', 'lopez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(77, 'Mario Davila', 'Davila Zacarias', 'mdavila@grupoccima.com.mx', 'mario.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(78, 'Marisela Mendoza', 'Mendoza Torres', 'mmendoza@grupoccima.com.mx', 'marisela.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(79, 'Nancy Morales', 'Morales Solis', 'nmorales@grupoccima.com.mx', 'nancy.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(80, 'Paola Anahi', 'Oca?a Rodea', 'paocana@grupoccima.com.mx', 'paola.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(81, 'Rafael Torres', 'Torres Ramirez', 'rtorres@grupoccima.com.mx', 'rafael.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(82, 'Ana Teresa', 'Gutierrez Garcia', 'atgutierrez@grupoccima.com.mx', 'gutierrez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(83, 'Brenda Jimena', 'Alarcon Vargas', 'bjalarcon@grupoccima.com.mx', 'alarcon.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(84, 'Jackelin Hernandez', 'Jackelin Hernandez', 'jyanez@grupoccima.com.mx', 'jackelin.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(85, 'Jesus Miguel', 'Garcia Ramirez', 'jmgarcia@grupoccima.com.mx', 'garcia.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(86, 'Jose Antonio', 'Renovato Hiedra', 'jarenovato@grupoccima.com.mx', 'renovato.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(87, 'Juan Pablo', 'Barcenas Iturbe', 'jpbarcenas@grupoccima.com.mx ', 'barcenas.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(88, 'administrador', '', 'administrador', 'Passw0rd', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(89, 'Roberto Neri', 'Sanchez Martinez', 'rnsanchez@grupoccima.com.mx', 'R34', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(90, 'Joselina Chavez', 'Chavez Quintana', 'jchavez@grupoccima.com.mx', 'chavez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(91, 'Vanessa Saray', 'Vargas Medina', 'vsvargas@grupoccima.com.mx', 'vargas.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(92, 'Valente Mendez', 'Mendez Gomex', 'vmendez@grupoccima.com.mx', 'mendez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(93, 'Amayrani Oricel', 'Olvera Jaimes', 'oolvera@grupoccima.com.mx', 'olvera.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(94, 'Isaac Velazquez', 'Velazquez Ponce', 'ivelazquez@grupoccima.com.mx', 'isaacv.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(95, 'David Herrejon', 'Herrejon Sanchez', 'dherrejon@grupoccima.com.mx', 'davidh.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(96, 'Saul Flore', 'Flore Avalos', 'sflores@grupoccima.com.mx', 'flores.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(97, 'Ana Isabel', 'Soberanes Hernandez', 'aisoberanes@grupoccima.com.mx', 'soberanes.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(98, 'Igancio Garcia', 'Garcia Guerrero', 'igarcia@grupoccima.com.mx', 'garciag.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(99, 'Miguel Angel', 'Rodriguez', 'marodriguez@grupoccima.com.mx', 'rodriguez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(100, 'Irma Lucero', 'Barrios Astudilla', 'ilbarrios@grupoccima.com.mx', 'barrios.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(101, 'Karol Joselin', 'Martinez Barrera', 'kjmartinez@grupoccima.com.mx', 'martinez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(102, 'Amayrani Oricel', 'Olvera Jaimes', 'aoolvera@grupoccima.com.mx', 'olvera.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(103, 'Daniela Sanchez', 'Sanchez Apaes', 'daniela.sanchez@capitalccima.com.mx', 'daniela.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(104, 'Jorge Alejandro', 'Garcia Rendon', 'jorge.garcia1900sf@capitalccima.com.mx', 'jorge.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(105, 'Luis Millan', 'Luis Millan', 'luis.millan@grupoccima.com.mx', 'millan24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(106, 'Nikte Gomez', 'Gomez Serrano', 'nikte.gomez1900sf@capitalcc.com.mx', 'nikte.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(107, 'Jose de', 'Hernandez Quiroz', 'jesus.hernandez@capitalcc.com.mx', 'jhernandez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(108, 'Cinthia Mayte', 'Conejo Placencia', 'cinthia.conejo1900sf@capitalcc.com.mx', 'conejo24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(109, 'Cecilia Haydee', 'Rodriguez Jimenez', 'chrodriguez@habitta.com.mx', 'cecilia.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(110, 'Brenda Paola', 'Paola Rivera', 'bprivera@juridico.grupoccima.com.mx', 'rivera24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(111, 'Angel Baldomero', 'Mendez Morales', 'abmendez@grupoccima.com.mx', 'mendez24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(112, 'Fabian Lopez', 'Lopez Avila', 'flopez@grupoccima.com.mx', 'fabian.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(113, 'Pablo Guadarrama', 'Guadarrama Ruiz', 'pguadarrama@grupoccima.com.mx', 'pablo.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(114, 'Hector Lozano', 'Hector Lozano', 'hector.lozano@navetec.com.mx', 'lozano24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(115, 'Efren Herrera', 'Herrera Lopez', 'eherrera@energyccima.com', 'efren.2024', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(116, 'CINTHIA VANESSA', 'GONZALEZ GONZALEZ', 'cvgonzalez@energyccima.com', 'cvanessa.2024', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(117, 'Paula Guadalupe', 'Trejo Gutierrez', 'ptrejo@grupoccima.com.mx', 'paula.24', 2, '0000-00-00 00:00:00', NULL, NULL, 1),
(118, 'KARINA LOPEZ', 'LOPEZ ROLDAN', 'customerservice@habitta.com.mx', 'karina24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(119, 'Andres Gabriel', 'Leyva Aguilera', 'agleyva@juridico.grupoccima.com.mx', 'Gabriel.2024', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(120, 'Rosa Aracely', 'Carrasco Angel', 'racarrasco@grupoccima.com.mx', 'carrasco.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(121, 'Bertha Lilia', 'Lilia Osuna', 'bertha.osuna@navetec.com.mx', 'Bertha.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(122, 'Abel Bernal', 'Bernal Felipe', 'abernal@grupoccima.com.mx', 'bernal.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(123, 'Manuel Alejandro', 'Contreras', 'macontreras@grupoccima.com.mx', 'contreras.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(124, 'Cristina Echeverria', 'Echeverria Rosas', 'cecheverria@navetec.com.mx', 'echeverria.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(125, 'Kennia Arellano', 'Arellano Zepeda', 'karellano@navetec.com.mx', 'arellano.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(126, 'Martin Rodriguez', 'Rodriguez Escobar', 'mrodriguez@energyccima.com', 'martin.2024', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(127, 'Jorge Alejandro', 'Garcia', 'jorge.garcia1900sf@capitalcc.com.mx ', 'Jorge.2024', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(128, 'CESAR TABARES', 'CESAR TABARES', 'teamleader.r@grupoccima.com', 'tabares.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(129, 'Ana Isabel', 'Sanchez Solorio', 'aisanchez@navetec.com.mx', 'sanchez.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(130, 'Michelle Andrea', 'Pacheco', 'mapacheco@juridico.grupoccima.com.mx', 'pacheco.24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(131, 'LESLIE FERNANDA', 'RUELAS LUNA', 'lfruelas@grupoccima.com.mx', 'lfernanda.24', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(132, 'Ana Laura', 'López', 'ana.vazquez@grupoccima.com.mx', 'ana.vazquez.24.', 1, '0000-00-00 00:00:00', NULL, NULL, 1),
(133, 'Laura', '', 'llopez@grupoccima.com.mx', 'ralpal24', 1, '0000-00-00 00:00:00', NULL, NULL, 1);

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
  MODIFY `tickd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tm_ticket`
--
ALTER TABLE `tm_ticket`
  MODIFY `tick_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
