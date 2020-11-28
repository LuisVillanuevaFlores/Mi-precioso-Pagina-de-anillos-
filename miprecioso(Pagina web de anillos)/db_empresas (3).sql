-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2018 a las 03:14:01
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
('Kabena', 'Compromiso', 'Diamonds_Peru', 2267, 9, 0, 'Oro Blanco 585', '3.53 gramos', 'Diamante', 'Redondo', '0.07', '17', '3.0 mm'),
('Empire', 'Compromiso', 'Diamonds_Peru', 1866, 15, 0, 'Oro Blanco  585', '1.16 gramos', 'Diamante', 'Redondo', '0.09', '18', '1.0mm'),
('Pure_Love', 'Bodas', 'Diamonds_Peru', 1135, 15, 0, 'Oro Amarillo 585', '5.87 gramos', 'Circonita(SOLO MUJER)', 'Redondo', '0.018', '1(SOLO MUJER)', '1.6 mm'),
('Natural_Sensation', 'Bodas', 'Diamonds_Peru', 1221, 15, 0, 'Oro Amarillo 585', '4.43 gramos', 'Circonita(SOLO MUJER)', 'Redondo', '0.018', '1(SOLO MUJER)', '1.6 mm'),
('Unique_Luxury', 'Bodas', 'Diamonds_Peru', 1201, 12, 0, 'Oro Amarillo 585', '4.22 gramos', 'Circonita(SOLO MUJER)', 'Redondo', '0.018', '1(SOLO MUJER)', '1.6 mm'),
('Harriet', 'Eternidad', 'Diamonds_Peru', 1713, 15, 0, 'Oro Blanco  585', '1.37', 'Diamante', 'Redondo', '0.04', '8', '2.0 mm'),
('Mila', 'Eternidad', 'Diamonds_Peru', 1832, 15, 0, 'Oro Blanco  585', '3.51', 'Diamante', 'Redondo', '0.162', '99', '1.6 mm'),
('Sonne', 'Amistad', 'Diamonds_Peru', 5783, 15, 0, 'Oro Blanco 375', '5.10', 'Diamante', 'Baguette', '0.33', '3', '4.0 x 2.0 mm'),
('Losse', 'Amistad', 'Diamonds_Peru', 635, 10, 0, 'Oro Amarillo & Blanco  375', '3.40 gramos', '-', 'Acorde al estilo', '-', '-', '1.1 mm'),
('Estelle', 'Compromiso', 'Eternal_Passion', 4206, 8, 0, 'Oro Blanco  585', '3.62 gramos', 'Diamante', 'Redondo', '0.195', '28', '4.0 mm'),
('Ring_Auretta', 'Compromiso', 'Eternal_Passion', 4303, 10, 0, 'Oro Blanco  585', '3.89 gramos', 'Diamante Verde ', 'Redondo', '0.033', '1', '4.0 mm'),
('Hissa', 'Compromiso', 'Eternal_Passion', 4540, 19, 0, 'Oro Blanco  585', '6.50 gramos', 'Diamante', 'Marquesa', '0.40', '4', '5.3 mm'),
('Universe_Uranus', 'Bodas', 'Eternal_Passion', 4756, 5, 0, 'Oro Rosa 585', '17.44 gramos', 'Circonita(SOLO MUJER)', 'Redondo', '0.162', '102(SOLO MUJER)', '1.6 mm'),
('Golden_Miracle', 'Bodas', 'Eternal_Passion', 5590, 9, 0, 'Oro Blanco & Rosa 585', '22.69 gramos', 'Circonita(SOLO MUJER)', 'Redondo', '0.57', '38(SOLO MUJER)', '1.1 mm'),
('Mystic_Winter', 'Bodas', 'Eternal_Passion', 2982, 7, 0, 'Oro Blanco 375', '15.57 gramos', 'Diamante(SOLO MUJER)', 'Redondo', '0.23', '25(SOLO MUJER)', '1.1 mm'),
('Ring_Elisha', 'Eternidad', 'Eternal_Passion', 1837, 2, 0, 'Oro Blanco  585', '4.14 gramos', 'Cristal de Swarovski', 'Redondo', '0.75', '3', '4.0 mm'),
('Loronda', 'Eternidad', 'Eternal_Passion', 1919, 3, 0, 'Oro Blanco  585', '4.67 gramos', 'Cristal de Swarovski', 'Redondo', '0.558', '31', '1.6 mm'),
('Smolare', 'Amistad', 'Eternal_Passion', 445, 18, 0, 'Oro Blanco & Rosa 375', '1.90 gramos', '-', 'Acorde al estilo', '-', '-', ''),
('Hark', 'Amistad', 'Eternal_Passion', 460, 10, 0, 'Oro Blanco & Rosa 375', '2.10 gramos', '-', 'a', '', '', ''),
('Gratia', 'Compromiso', 'Inka_Rings', 1380, 11, 0, 'Oro Blanco & Rosa 585', '2.96 gramos', 'Diamante', 'Redondo', '0.073', '3', '2.0 mm'),
('Alidia', 'Compromiso', 'Inka_Rings', 1745, 10, 0, 'Oro Blanco & Rosa 585', '3.31 gramos', 'Diamante', 'Redondo', '0.033', '4', '1.3 mm'),
('Hibiscus', 'Compromiso', 'Inka_Rings', 1773, 15, 0, 'Oro Blanco & Rosa 585', '4.45 gramos', 'Diamante', 'Redondo', '0.09', '2', '2.3 mm'),
('Bright_Youth', 'Bodas', 'Inka_Rings', 6560, 5, 0, 'Platino 950', '12.78', 'Diamante(SOLO MUJER)', 'Redondo', '-', '', ''),
('Classic_Choice', 'Bodas', 'Inka_Rings', 6822, 8, 0, 'Platino 950', '13.28 gramos', 'Diamante(SOLO MUJER)', 'Redondo', '0.24', '23(SOLO MUJER)', '1.1 mm'),
('Dinamic_Structure', 'Bodas', 'Inka_Rings', 4175, 5, 0, 'Oro Blanco & Rosa 585', '24.151 gramos', 'Diamante(SOLO MUJER)', 'Redondo', '0.05', '5(SOLO MUJER)', '1.3 mm'),
('Sifnas', 'Eternidad', 'Inka_Rings', 5533, 11, 0, 'Oro Blanco 750', '4.43 gramos', 'Esmeralda', 'Redondo', '0.45', '30', '1.5 mm'),
('Bretha', 'Eternidad', 'Inka_Rings', 2172, 3, 0, 'Oro Blanco 750', '2.21 gramos', 'Rubi', 'Redondo', '0.74', '37', '1.6 mm'),
('Cannestee', 'Amistad', 'Inka_Rings', 790, 14, 0, 'Oro Rosa 585', '2.60 gramos', '-', '', '', '', ''),
('Ruacanna', 'Amistad', 'Inka_Rings', 997, 10, 0, 'Oro Rosa 585', '3.77 gramos', '-', 'Acorde al estilo', '0.09', '-', '1.1 mm');

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

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`nombre`, `apellido`, `DNI`, `producto`) VALUES
('Andy', 'Ñaca', 74423584, 'Begonia');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
