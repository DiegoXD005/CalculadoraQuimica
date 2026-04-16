-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-04-2026 a las 02:42:38
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `nombre`, `apellido`, `nacionalidad`, `fecha_nacimiento`) VALUES
(1, 'Gabriel', 'Garcia Marquez', 'Colombiano', '1927-03-06'),
(2, 'Mario', 'Vargas Llosa', 'Peruano', '1936-03-28'),
(3, 'Julio', 'Cortazar', 'Argentino', '1914-08-26'),
(4, 'Isabel', 'Allende', 'Chilena', '1942-08-02'),
(5, 'Jorge', 'Luis Borges', 'Argentino', '1899-08-24'),
(6, 'Octavio', 'Paz', 'Mexicano', '1914-03-31'),
(7, 'Carlos', 'Fuentes', 'Mexicano', '1928-11-11'),
(8, 'Pablo', 'Neruda', 'Chileno', '1904-07-12'),
(9, 'Miguel', 'de Cervantes', 'Español', '1547-09-29'),
(10, 'Juan', 'Rulfo', 'Mexicano', '1917-05-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `num_exterior` varchar(10) DEFAULT NULL,
  `num_interior` varchar(10) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `telefono`, `email`, `calle`, `num_exterior`, `num_interior`, `colonia`, `cp`, `ciudad`) VALUES
(1, 'Luis', 'Martinez', '5511111111', 'luis@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Ana', 'Lopez', '5522222222', 'ana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Carlos', 'Ramirez', '5533333333', 'carlos@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Maria', 'Hernandez', '5544444444', 'maria@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Pedro', 'Sanchez', '5555555555', 'pedro@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Laura', 'Torres', '5566666666', 'laura@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Jose', 'Gomez', '5577777777', 'jose@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Sofia', 'Castro', '5588888888', 'sofia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Daniel', 'Morales', '5599999999', 'daniel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Elena', 'Vargas', '5500000000', 'elena@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `id_proveedor`, `id_empleado`, `fecha`, `total`) VALUES
(1, 1, 2, '2026-03-12 07:45:19', 2000.00),
(2, 2, 4, '2026-03-12 07:45:19', 1800.00),
(3, 3, 3, '2026-03-12 07:45:19', 1500.00),
(4, 4, 5, '2026-03-12 07:45:19', 2200.00),
(5, 5, 6, '2026-03-12 07:45:19', 1700.00),
(6, 6, 1, '2026-03-12 07:45:19', 1400.00),
(7, 7, 7, '2026-03-12 07:45:19', 1900.00),
(8, 8, 9, '2026-03-12 07:45:19', 1600.00),
(9, 9, 10, '2026-03-12 07:45:19', 2100.00),
(10, 10, 8, '2026-03-12 07:45:19', 1300.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `id_compra` int NOT NULL,
  `id_libro` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra`,`id_libro`),
  KEY `id_compra` (`id_compra`),
  KEY `id_libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_compra`, `id_libro`, `cantidad`, `costo_unitario`, `subtotal`) VALUES
(1, 11, 10, 200.00, 2000.00),
(2, 12, 10, 180.00, 1800.00),
(3, 13, 10, 150.00, 1500.00),
(4, 14, 10, 220.00, 2200.00),
(5, 15, 10, 170.00, 1700.00),
(6, 16, 10, 140.00, 1400.00),
(7, 17, 10, 190.00, 1900.00),
(8, 18, 10, 160.00, 1600.00),
(9, 19, 10, 210.00, 2100.00),
(10, 20, 10, 130.00, 1300.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_venta` int NOT NULL,
  `id_libro` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta`,`id_libro`),
  KEY `id_venta` (`id_venta`),
  KEY `id_libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_venta`, `id_libro`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 11, 1, 350.00, 350.00),
(2, 12, 1, 280.00, 280.00),
(3, 13, 1, 300.00, 300.00),
(4, 14, 1, 320.00, 320.00),
(5, 15, 1, 260.00, 260.00),
(6, 16, 1, 250.00, 250.00),
(7, 17, 1, 200.00, 200.00),
(8, 18, 1, 150.00, 150.00),
(9, 19, 1, 400.00, 400.00),
(10, 20, 1, 220.00, 220.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `puesto`, `telefono`, `email`) VALUES
(1, 'Juan', 'Perez', 'Vendedor', '5512345678', 'juan@libreria.com'),
(2, 'Laura', 'Diaz', 'Cajero', '5523456789', 'laura@libreria.com'),
(3, 'Mario', 'Santos', 'Gerente', '5534567890', 'mario@libreria.com'),
(4, 'Lucia', 'Reyes', 'Vendedor', '5545678901', 'lucia@libreria.com'),
(5, 'Pedro', 'Ortega', 'Almacen', '5556789012', 'pedro@libreria.com'),
(6, 'Andrea', 'Cruz', 'Vendedor', '5567890123', 'andrea@libreria.com'),
(7, 'Carlos', 'Rojas', 'Almacen', '5578901234', 'carlos@libreria.com'),
(8, 'Daniela', 'Flores', 'Cajero', '5589012345', 'daniela@libreria.com'),
(9, 'Miguel', 'Salas', 'Vendedor', '5590123456', 'miguel@libreria.com'),
(10, 'Patricia', 'Mendez', 'Administracion', '5511112222', 'patricia@libreria.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

DROP TABLE IF EXISTS `libro`;
CREATE TABLE IF NOT EXISTS `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `categoria` varchar(5) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `año_publicacion` year DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`categoria`)
) ;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `categoria`, `precio`, `stock`, `año_publicacion`) VALUES
(11, 'Cien años de soledad', 'N', 350.00, 20, '1967'),
(12, 'La ciudad y los perros', 'N', 280.00, 15, '1963'),
(13, 'Rayuela', 'N', 300.00, 10, '1963'),
(14, 'La casa de los espiritus', 'N', 320.00, 12, '1982'),
(15, 'Ficciones', 'N', 260.00, 18, '1944'),
(16, 'El laberinto de la soledad', 'E', 250.00, 8, '1950'),
(17, 'Aura', 'T', 200.00, 14, '1962'),
(18, 'Veinte poemas de amor', 'E', 150.00, 25, '1924'),
(19, 'La fiesta del Chivo', 'A', 400.00, 9, '2000'),
(20, 'Pedro Paramo', 'T', 220.00, 13, '1955');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
CREATE TABLE IF NOT EXISTS `libro_autor` (
  `id_libro` int NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`id_libro`,`id_autor`),
  KEY `id_autor` (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libro_autor`
--

INSERT INTO `libro_autor` (`id_libro`, `id_autor`) VALUES
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `num_exterior` varchar(10) DEFAULT NULL,
  `num_interior` varchar(10) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `calle`, `num_exterior`, `num_interior`, `colonia`, `cp`, `ciudad`) VALUES
(1, 'Editorial Planeta', '5551112233', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Penguin Random House', '5552223344', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Editorial Alfaguara', '5553334455', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Editorial Santillana', '5554445566', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Editorial Porrua', '5555556677', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Editorial Trillas', '5556667788', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Editorial Anagrama', '5557778899', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Editorial Fondo Cultura', '5558889900', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Editorial Océano', '5559990011', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Editorial Siglo XXI', '5550001122', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `id_cliente`, `id_empleado`, `fecha`, `total`) VALUES
(1, 1, 1, '2026-03-12 07:44:14', 350.00),
(2, 2, 2, '2026-03-12 07:44:14', 280.00),
(3, 3, 3, '2026-03-12 07:44:14', 300.00),
(4, 4, 4, '2026-03-12 07:44:14', 320.00),
(5, 5, 5, '2026-03-12 07:44:14', 260.00),
(6, 6, 6, '2026-03-12 07:44:14', 250.00),
(7, 7, 7, '2026-03-12 07:44:14', 200.00),
(8, 8, 8, '2026-03-12 07:44:14', 150.00),
(9, 9, 9, '2026-03-12 07:44:14', 400.00),
(10, 10, 10, '2026-03-12 07:44:14', 220.00);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_libros`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_libros`;
CREATE TABLE IF NOT EXISTS `vista_libros` (
`titulo` varchar(100)
,`stock` int
,`precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_libros`
--
DROP TABLE IF EXISTS `vista_libros`;

DROP VIEW IF EXISTS `vista_libros`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_libros`  AS SELECT `libro`.`titulo` AS `titulo`, `libro`.`stock` AS `stock`, `libro`.`precio` AS `precio` FROM `libro` ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_detalle_compra_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `fk_detalle_compra_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
