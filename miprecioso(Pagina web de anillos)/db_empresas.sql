-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2018 a las 06:03:53
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_empresas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Autorizacion` int(2) NOT NULL DEFAULT '1',
  `usuario` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` int(9) NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `informacion` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`Autorizacion`, `usuario`, `password`, `empresa`, `telefono`, `direccion`, `informacion`) VALUES
(1, 'andy', 'geanpiero', 'Pepito', 0, '', ''),
(3, 'InKaRiNg', 'empresa_inkarings123', 'Inka_Rings', 964760654, 'Eduardo Lopez de Romaña 109 -Cercado', 'Todo lo que es bueno es para siempre, asi como nuestros anillos elaborados con aleaciones de plata y oro , usamos pedreira de rubi, esmeralda, diamante y las piedras preciosas\r\n    mas hermosas que te puedas imaginar , haz que tus recuerdos sean eternos, no dudes en nosotros.	'),
(1, 'DiamonPeru123', 'DiamondPeru_2018', 'Diamonds_Peru', 959560108, 'Filtro - Calle El Filtro 501 Plaza de Armas ', 'Somos una empresa con el unico proposito de plasmar tus sueños en un anillo, elaborandolos con aleaciones de oro y pplata , y con uestro sello caracteristico ,impregnar el diamante \r\n   en todas nuestras piezas, porque tu te mereces lo mejor.'),
(3, 'EternaPas_007', 'Eter_pass_admin', 'Eternal_Passion', 945046467, 'ODAC - Parque Lambramani Nivel -2 (costado de Metro)', 'Somos una empresa peruana, trabajando con aleaciones de oro y plata pura, porque un anillo refleja mucho de una persona, tenemos todo lo indicado para ti , porque sabemos que \r\n   es lo que te gusta, no dudes en solicitarnos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `stock` int(2) NOT NULL,
  `descuento` int(2) NOT NULL DEFAULT '0',
  `metal` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piedra` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quilates` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piedras` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diametro` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='productos';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`nombre`, `categoria`, `empresa`, `precio`, `stock`, `descuento`, `metal`, `peso`, `piedra`, `forma`, `quilates`, `piedras`, `diametro`) VALUES
('Begonia', 'Compromiso', 'Diamonds_Peru', 2246, 15, 0, 'Oro blanco & Rosa', '6.16 gramos', 'Diamante', 'Redondo', '0.084', '14', '1.1 mm'),
('Kabena', 'Compromiso', 'Diamonds_Peru', 2267, 10, 0, 'Oro Blanco 585', '3.53 gramos', 'Diamante', 'Redondo', '0.07', '17', '3.0 mm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DNI` int(8) NOT NULL,
  `producto` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
