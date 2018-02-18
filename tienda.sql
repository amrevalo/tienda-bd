-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-02-2018 a las 15:46:04
-- Versión del servidor: 5.6.38
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `descripcion`) VALUES
(1, 'mayu shinjo'),
(2, 'Akira Toriyama'),
(3, 'Yoshihiro Togashi'),
(4, 'Masashi Kishimoto'),
(5, 'Eiichiro Oda'),
(6, 'Takehiko Inoue'),
(7, 'nulo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provincia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `direccion`, `provincia`, `email`, `telefono`) VALUES
(1, 'Alberto', 'Maverick', 'Vervelo', 'Calle rio haliel', 'Valencia', 'mave@gmail.com', '963217624'),
(2, 'Toni', 'Belenguer', 'Garcia', 'Calle pintor machado', 'Valencia', 'beleng@gmail.com', '963426751'),
(3, 'Fernando', 'Martin', 'Gustov', 'calle guarderia buala', 'Valencia', 'martin@gmail.com', '963126754'),
(4, 'Ismael', 'Proye', 'Restau', 'calle gridis alto', 'Valencia', 'proyecisma@gmail.com', '963459912'),
(5, 'Julian', 'Guerri', 'Llero', 'calle oftal mologo', 'Valencia', 'julgue@gmail.com', '963992323'),
(6, 'Anonimo', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `importe` double DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `importe`, `fecha_factura`, `descripcion`, `forma_pago`, `observaciones`, `iva`, `id_pedido`) VALUES
(1, 89.9, '2018-01-11 00:00:00', 'Arcadia quest nuevo', 'Efectivo', NULL, 21, 1),
(2, 23.95, '2018-01-02 00:00:00', 'nendoroid, manga', 'Tarjeta', NULL, 21, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `descripcion`) VALUES
(1, 'Shonen'),
(2, 'Spokon'),
(3, 'Gekiga'),
(4, 'Maho Shojo'),
(5, 'Yuri'),
(6, 'Yaoi'),
(7, 'Harem'),
(8, 'Mecha'),
(9, 'Ecchi'),
(10, 'Gore'),
(11, 'nulo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `descripcion`, `imagen`, `id_producto`) VALUES
(1, 'Imagen hunter', 'http://127.0.0.1:8081/images/hunterxhunter.png', 1),
(32, 'Contraportada', 'http://127.0.0.1:8081/images/contraportadahunterxhunter.jpg', 1),
(42, 'Arcadia imagen 1', 'http://127.0.0.1:8081/images/arcadia1.jpg', 3),
(43, 'Arcadia imagen 2', 'http://127.0.0.1:8081/images/arcadia2.png', 3),
(44, 'Slam dunk imagen tomo 2', 'http://127.0.0.1:8081/images/slamdunktomo1.jpg', 2),
(45, 'Imagen descent', 'http://127.0.0.1:8081/images/descent1.png', 4),
(46, 'Imagen nenderoid link 1', 'http://127.0.0.1:8081/images/nenderoidlink.jpg', 5),
(47, 'Imagen nenderoid link 2', 'http://127.0.0.1:8081/images/nenderoidlink2.jpg', 5),
(48, 'Imagen nenderoid edward 1', 'http://127.0.0.1:8081/images/nendeoirdedward1.jpg', 6),
(49, 'Imagen nenderoid edward 2', 'http://127.0.0.1:8081/images/nenderoidedwar2.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

CREATE TABLE `lineapedido` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `lineapedido`
--

INSERT INTO `lineapedido` (`id`, `id_producto`, `id_pedido`, `descripcion`, `precio`, `cantidad`) VALUES
(1, 3, 1, 'Linea 1', 89.99, 1),
(2, 2, 2, 'Linea 1', 9, 2),
(3, 5, 2, 'Linea  2', 15.95, 1),
(4, 6, 2, 'Linea pedido 5', 45.32, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `id_cliente`, `descripcion`) VALUES
(1, 1, 'Pedido 1 de Alberto'),
(2, 2, 'Pedido 1 de Toni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_tipoproducto` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `fabricanteoeditorial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `informacion_adicional` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `id_usuario`, `id_tipoproducto`, `id_genero`, `id_autor`, `descripcion`, `codigo`, `existencias`, `precio`, `fabricanteoeditorial`, `publico`, `informacion_adicional`) VALUES
(1, 1, 1, 1, 3, 'Hunter X Hunter tomo 1', 'A2345', 5, 7.95, 'Panini', '+8', 'Aventura y superacion personal'),
(2, 1, 1, 2, 6, 'Slam Dunk tomo 2', NULL, 3, 8, 'ivrea', '+12', 'historia de jugador de basket'),
(3, 1, 3, 11, 7, 'Arcadia Quest', NULL, 2, 89.9, 'Edge', '+10', 'Juego de mesa de jugador contra jugador, dungeon crawler.'),
(4, 1, 3, 11, 7, 'Descent: Viaje a las tinieblas', NULL, 6, 75, 'Edge', '+12', 'Tipico juego de dungeon crawler'),
(5, 1, 2, 11, 7, 'Nendoroid Link: Majora\'s Mask 553', NULL, 12, 15.95, 'GoodSmile', '+4', 'Figura del personaje link'),
(6, 1, 2, 11, 7, 'Nendoroid Edward Elric 788', NULL, 10, 15.95, 'GoodSmile', '+4', 'Figura de la serie de animacion Full Metal alchemmist.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodxproveedor`
--

CREATE TABLE `prodxproveedor` (
  `id` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `prodxproveedor`
--

INSERT INTO `prodxproveedor` (`id`, `id_proveedor`, `id_producto`, `descripcion`) VALUES
(1, 4, 1, NULL),
(2, 3, 3, NULL),
(3, 3, 4, NULL),
(4, 1, 6, NULL),
(5, 1, 5, NULL),
(6, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `descripcion`, `direccion`, `telefono`, `email`, `codigo_postal`) VALUES
(1, 'SD DISTRIBUCIONES-nendoroids', 'Calle Montsia, 9-11 - P.I. Can Bernades, Barcelona ', '933001022', 'info@sddistribuciones.com', '08130'),
(2, 'Editorial Ivrea Sl-manga', 'Calle Ciutat de Granada, 163 - P. 1 PTA. 3 ,Barcelona\r\n', 'desconocido', 'ventasgenerales@editorialivrea.com', '08018'),
(3, 'Asmodee Editions Ibérica SLU-juegos de mesa', 'C/ Petróleo 24\r\nPoligono Industrial San José de Valderas, Madrid', '918270071', 'pedidos@asmodee.es', '28918'),
(4, 'Panini España S.A.', 'Calle Vallespí, 20 - 17257 - Torroella de Montgrí Registro Mercantil de Gerona', '972 757411', 'desconocido', '17257');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`id`, `descripcion`) VALUES
(1, 'Manga'),
(2, 'Merchandising'),
(3, 'Juego de mesa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `validado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_tipousuario`, `nombre`, `primer_apellido`, `segundo_apellido`, `login`, `password`, `email`, `activo`, `fecha_alta`, `validado`) VALUES
(1, 1, 'admin', '', '', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'adminproye@gmail.com', 1, '2018-01-16 00:00:00', 1),
(2, 2, 'Carlos', 'Gutierrez', 'Velazquez', 'carlos', '7b85175b455060e3237e925f023053ca9515e8682a83c8b09911c724a1f8b75f', 'gutie@gmail.com', 1, '2018-01-23 00:00:00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_pedido1_idx` (`id_pedido`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imagen_producto1_idx` (`id_producto`);

--
-- Indices de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_producto1_idx` (`id_producto`),
  ADD KEY `fk_lineapedido_pedido1_idx` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_cliente1_idx` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_usuario1_idx` (`id_usuario`),
  ADD KEY `fk_producto_tipoproducto1_idx` (`id_tipoproducto`),
  ADD KEY `fk_producto_genero1_idx` (`id_genero`),
  ADD KEY `fk_producto_autor1_idx` (`id_autor`);

--
-- Indices de la tabla `prodxproveedor`
--
ALTER TABLE `prodxproveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prodxproveedor_proveedor1_idx` (`id_proveedor`),
  ADD KEY `fk_prodxproveedor_producto1_idx` (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipo_usuario_idx` (`id_tipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prodxproveedor`
--
ALTER TABLE `prodxproveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `fk_imagen_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `fk_lineapedido_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_autor1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_genero1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_tipoproducto1` FOREIGN KEY (`id_tipoproducto`) REFERENCES `tipoproducto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `prodxproveedor`
--
ALTER TABLE `prodxproveedor`
  ADD CONSTRAINT `fk_prodxproveedor_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prodxproveedor_proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tipousuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
