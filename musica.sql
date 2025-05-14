-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2025 a las 20:27:03
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
-- Base de datos: `musica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(5) UNSIGNED NOT NULL,
  `usuario_id` int(5) UNSIGNED NOT NULL,
  `producto_id` int(5) UNSIGNED NOT NULL,
  `cantidad` int(5) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `usuario_id`, `producto_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, '2025-05-12 15:54:58', '2025-05-12 15:54:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(5) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `imagen`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Rock', NULL, 'Rock clásico y moderno', NULL, NULL),
(2, 'Pop', NULL, 'Pop internacional', NULL, NULL),
(3, 'Jazz', NULL, 'Jazz tradicional y moderno', NULL, NULL),
(4, 'Clásica', NULL, 'Música clásica', NULL, NULL),
(5, 'Electrónica', NULL, 'EDM y música electrónica', NULL, NULL),
(6, 'J-Pop', NULL, 'Pop japonés con artistas como Atarashii Gakko y Ado', NULL, NULL),
(7, 'J-Rock', NULL, 'Rock japonés con grupos como Babymetal y Hanabie', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(50, '2025-04-27-230221', 'App\\Database\\Migrations\\CreateCategoriasTable', 'default', 'App', 1746252177, 1),
(51, '2025-04-27-230221', 'App\\Database\\Migrations\\CreateProductosTable', 'default', 'App', 1746252177, 1),
(52, '2025-04-27-230222', 'App\\Database\\Migrations\\CreateCarritoTable', 'default', 'App', 1746252177, 1),
(53, '2025-04-28-000424', 'App\\Database\\Migrations\\AddImageAndDescriptionToCategorias', 'default', 'App', 1746252177, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(5) UNSIGNED NOT NULL,
  `categoria_id` int(5) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `artista` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `stock` int(5) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `artista`, `descripcion`, `precio`, `imagen`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 'The Dark Side of the Moon', 'Pink Floyd', 'Álbum clásico de rock progresivo', 24.99, 'img/pinkfloyd.jpg', 50, NULL, NULL),
(2, 2, 'Thriller', 'Michael Jackson', 'El álbum más vendido de todos los tiempos', 19.99, 'img/michaeljackson.jpeg', 30, NULL, NULL),
(3, 3, 'Kind of Blue', 'Miles Davis', 'Obra maestra del jazz modal', 22.50, 'img/milesdavis.jpeg', 20, NULL, NULL),
(4, 1, 'Back in Black', 'AC/DC', 'Clásico del hard rock', 18.75, 'img/acdc.jpg', 40, NULL, NULL),
(5, 4, 'Symphony No. 9', 'Ludwig van Beethoven', 'Incluye la famosa \"Oda a la Alegría\"', 15.99, 'img/beethoven.jpg', 25, NULL, NULL),
(6, 6, 'Drama', 'Atarashii Gakko', 'Canción rítmica de vanguardia', 35.99, 'img/atarashi.jpeg', 23, NULL, NULL),
(7, 7, 'Megitsune', 'Babymetal', 'Fusión única de metal y pop', 55.23, 'img/babymetal.jpeg', 40, NULL, NULL),
(8, 7, 'お先に失礼します。', 'Hanabie', 'Combinación de metalcore y elementos kawaii', 60.12, 'img/hanabie.jpeg', 26, NULL, NULL),
(9, 6, 'Odo', 'Ado', 'J-Pop moderno con influencias urbanas', 55.76, 'img/ado.jpg', 33, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrito_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
