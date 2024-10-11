-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2024 a las 02:41:52
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `latitud` varchar(250) DEFAULT NULL,
  `longitud` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`id`, `nombre`, `direccion`, `latitud`, `longitud`) VALUES
(1, 'Almacen A', 'Calle 1, Ciudad', '10.1234', '-75.1234'),
(2, 'Almacen B', 'Calle 2, Ciudad', '10.5678', '-75.5678'),
(3, 'Almacen C', 'Calle 3, Ciudad', '10.9101', '-75.9101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes_habilitados`
--

CREATE TABLE `almacenes_habilitados` (
  `id` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `idalmacen` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacenes_habilitados`
--

INSERT INTO `almacenes_habilitados` (`id`, `idusuario`, `idalmacen`) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Electrónica'),
(2, 'Ropa'),
(3, 'Alimentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_operaciones`
--

CREATE TABLE `detalles_operaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `idoperacion` int(10) UNSIGNED NOT NULL,
  `idproducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalles_operaciones`
--

INSERT INTO `detalles_operaciones` (`id`, `idoperacion`, `idproducto`, `cantidad`) VALUES
(1, 1, 1, 10),
(2, 1, 2, 5),
(3, 2, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(1, 'MarcaX'),
(2, 'MarcaY'),
(3, 'MarcaZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `idtipo_operacion` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `urlimagen` varchar(250) DEFAULT NULL,
  `idalmacen` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`id`, `idtipo_operacion`, `idusuario`, `idproveedor`, `fecha`, `hora`, `urlimagen`, `idalmacen`) VALUES
(1, 1, 1, 1, '2024-10-10', '10:00:00', 'http://example.com/imagen1.jpg', 1),
(2, 2, 2, 2, '2024-10-11', '11:30:00', 'http://example.com/imagen2.jpg', 2),
(3, 1, 3, NULL, '2024-10-12', '14:15:00', 'http://example.com/imagen3.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `minicodigo` varchar(50) NOT NULL,
  `urlimagen` varchar(250) DEFAULT NULL,
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `idmarca` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `minicodigo`, `urlimagen`, `idcategoria`, `idmarca`) VALUES
(1, 'Teléfono', 'T123', 'http://example.com/tel.jpg', 1, 1),
(2, 'Camisa', 'C456', 'http://example.com/camisa.jpg', 2, 2),
(3, 'Galletas', 'G789', 'http://example.com/galletas.jpg', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `ruc` int(10) UNSIGNED NOT NULL,
  `urlimagen` varchar(250) DEFAULT NULL,
  `nombre_gerente` varchar(250) NOT NULL,
  `apellido_gerente` varchar(250) NOT NULL,
  `dni_gerente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `ruc`, `urlimagen`, `nombre_gerente`, `apellido_gerente`, `dni_gerente`) VALUES
(1, 'Proveedor A', 123456789, 'http://example.com/provA.jpg', 'Juan', 'Pérez', 12345678),
(2, 'Proveedor B', 987654321, 'http://example.com/provB.jpg', 'Ana', 'García', 87654321),
(3, 'Proveedor C', 112233445, 'http://example.com/provC.jpg', 'Luis', 'Martínez', 11223344);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_contactos`
--

CREATE TABLE `proveedores_contactos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `codigopais` int(10) UNSIGNED NOT NULL,
  `numero` int(11) NOT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `latitud` varchar(250) DEFAULT NULL,
  `longitud` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores_contactos`
--

INSERT INTO `proveedores_contactos` (`id`, `idproveedor`, `codigopais`, `numero`, `correo`, `direccion`, `latitud`, `longitud`) VALUES
(1, 1, 51, 123456789, 'contacto1@proveedor.com', 'Av. Principal 123', '10.1234', '-75.1234'),
(2, 2, 52, 987654321, 'contacto2@proveedor.com', 'Calle Secundaria 456', '10.5678', '-75.5678'),
(3, 3, 53, 456789123, 'contacto3@proveedor.com', 'Calle Tercera 789', '10.9101', '-75.9101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_operaciones`
--

CREATE TABLE `tipos_operaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_operaciones`
--

INSERT INTO `tipos_operaciones` (`id`, `nombre`) VALUES
(1, 'Ingreso'),
(2, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Operario', 'Responsable de las operaciones diarias en el almacén.'),
(2, 'Jefe de Almacén', 'Encargado de supervisar todas las actividades del almacén.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `dni` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  `urlimagen` varchar(250) DEFAULT NULL,
  `idtipo_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `dni`, `nombre`, `apellido`, `username`, `contraseña`, `urlimagen`, `idtipo_usuario`) VALUES
(1, 12345678, 'Carlos', 'López', 'carlitos', '123', 'imgpepe.png', 1),
(2, 87654321, 'María', 'Torres', 'maria', 'contraseña2', 'http://example.com/user2.jpg', 2),
(3, 11223344, 'Pedro', 'Hernández', 'pedro', 'contraseña3', 'http://example.com/user3.jpg', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `almacenes_habilitados`
--
ALTER TABLE `almacenes_habilitados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `detalles_operaciones`
--
ALTER TABLE `detalles_operaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idproducto_UNIQUE` (`id`),
  ADD UNIQUE KEY `minicodigo_UNIQUE` (`minicodigo`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`),
  ADD UNIQUE KEY `ruc_UNIQUE` (`ruc`);

--
-- Indices de la tabla `proveedores_contactos`
--
ALTER TABLE `proveedores_contactos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indices de la tabla `tipos_operaciones`
--
ALTER TABLE `tipos_operaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcategoria_UNIQUE` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idusuario_UNIQUE` (`id`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `urlimagen_UNIQUE` (`urlimagen`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `almacenes_habilitados`
--
ALTER TABLE `almacenes_habilitados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalles_operaciones`
--
ALTER TABLE `detalles_operaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores_contactos`
--
ALTER TABLE `proveedores_contactos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos_operaciones`
--
ALTER TABLE `tipos_operaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
