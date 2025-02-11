-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2025 a las 14:26:25
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
-- Base de datos: `inmobiliaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilar`
--

CREATE TABLE `alquilar` (
  `id` int(2) NOT NULL,
  `habitaciones` int(2) NOT NULL,
  `coordenadas` varchar(45) NOT NULL,
  `anio` int(2) NOT NULL,
  `piscina` int(2) NOT NULL DEFAULT 1,
  `descripcion` varchar(255) NOT NULL,
  `location` varchar(2) NOT NULL,
  `tipo` int(1) NOT NULL,
  `superficie` varchar(15) NOT NULL,
  `ruta` varchar(45) NOT NULL,
  `alt` varchar(25) NOT NULL,
  `alquilar` int(1) NOT NULL DEFAULT 0 COMMENT 'Alquiler si= 1, no= 0\r\n',
  `venta` int(1) NOT NULL DEFAULT 0 COMMENT 'Venta si=1, no=0\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alquilar`
--

INSERT INTO `alquilar` (`id`, `habitaciones`, `coordenadas`, `anio`, `piscina`, `descripcion`, `location`, `tipo`, `superficie`, `ruta`, `alt`, `alquilar`, `venta`) VALUES
(1, 3, '41.43449748368697, 2.1766613314411707', 2000, 0, 'Hermoso piso, ubicado en Barcelona España en el centro de la ciudad.', 'es', 2, '3000 m²', 'img/imagenes/alquilar-españa.png', 'Esta es la imag', 1, 0),
(2, 5, '50.19901477797691, 8.527644543593544', 2005, 0, 'Lujoso piso ubicado en el centro De Francfort Alemania.', 'eu', 2, '4000 m²', 'img/imagenes/alquilar-europa.png', 'Esta es la imag', 1, 0),
(3, 4, '45.4943238049169, -75.77234783938118', 1998, 0, 'Excelente piso ubicado en Canadá en la capital Ottawa.', 'ww', 2, '3500 m²', '/img/imagenes/alquilar-mundo.png', 'Esta es la imag', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprar_vivienda`
--

CREATE TABLE `comprar_vivienda` (
  `id` int(10) NOT NULL,
  `habitaciones` int(2) NOT NULL,
  `coordenadas` varchar(45) NOT NULL,
  `anio` int(4) NOT NULL,
  `piscina` int(1) NOT NULL DEFAULT 0 COMMENT 'si no tiene piscina es 0\r\n',
  `descripcion` varchar(1000) NOT NULL,
  `ruta` varchar(60) NOT NULL,
  `location` varchar(2) NOT NULL COMMENT 'Location: es=España, eu=Europa, ww= Resto del mundo.\r\n',
  `tipo` int(1) NOT NULL COMMENT 'Tipo 1= villa, 2= piso, 3= apartamento.',
  `venta` int(1) NOT NULL DEFAULT 1,
  `alquilar` int(1) NOT NULL DEFAULT 0,
  `superficie` varchar(15) NOT NULL,
  `alt` varchar(45) NOT NULL,
  `titulo` varchar(41) NOT NULL,
  `parrafo` varchar(1200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprar_vivienda`
--

INSERT INTO `comprar_vivienda` (`id`, `habitaciones`, `coordenadas`, `anio`, `piscina`, `descripcion`, `ruta`, `location`, `tipo`, `venta`, `alquilar`, `superficie`, `alt`, `titulo`, `parrafo`) VALUES
(1, 4, '43.32514959548699, -1.9793779047195479', 2000, 1, 'Excelente villa, muy amplio, con 4 habitaciones en una ubicación exclusiva frente a las hermosas playas de Donostia a un precio espectacular!', 'img/imagenes/comprar/es/villa-galicia.png', 'es', 1, 1, 1, '30,000 m²', 'Esta es la imagen de una Villa en Galicia.', 'Descubre Propiedades Exclusivas en España', 'Bienvenido a CHOW-MOLINA REAL STATE, tu destino para encontrar las mejores propiedades en España. Desde las impresionantes costas del Mediterráneo hasta las encantadoras ciudades históricas, ofrecemos una selección incomparable de inmuebles en algunos de los destinos más codiciados de España.\r\n\r\nExplora nuestra amplia gama de propiedades que capturan la esencia y el encanto únicos de España. Ya sea que busques una villa de lujo en Marbella, un apartamento con vistas al mar en Barcelona o una casa señorial en el corazón de Madrid, estamos aquí para ayudarte a encontrar la propiedad perfecta que se adapte a tu estilo de vida y preferencias.\r\n\r\nEn [nombre de la empresa], nos enorgullecemos de ofrecer un servicio personalizado y profesional en cada paso del proceso de compra. Nuestro equipo de expertos en bienes raíces está dedicado a brindarte asesoramiento experto y asegurarse de que tu experiencia de compra sea lo más fluida y gratificante posible.\r\n\r\nEmpieza tu búsqueda hoy mismo y descubre el estilo de vida mediterráneo y la belleza atemporal de España con [nombre de la empresa].'),
(4, 5, '43.317063923349956, -2.0025962595227087', 1999, 1, 'Lujosa Villa, ubicada frente a las hermosas playas de Donostia en la zona exclusiva de Monte Igeldo.', 'img/imagenes/comprar/es/villa-igeldo-1.png', 'es', 1, 1, 0, '10,000 m²', 'Esta es la imagen de una villa en Monte Igeld', '', ''),
(5, 8, '43.321875547644716, -2.0097766908766816', 2001, 1, 'Hermosa Villa, ubicada frente a las hermosas playas de Donostia en la zona exclusiva de Monte Igeldo.', 'img/imagenes/comprar/es/villa-igeldo-2.png', 'es', 1, 0, 1, '25,000m²', 'Esta es la imagen de una villa en Monte Igeld', '', ''),
(6, 10, '43.320720345663574, -2.010892489813399', 2010, 1, 'Excelente Villa, ubicada en la zona mas exclusiva de Donostia, excelente vista a la Playa, cuenta con un bosque interno, fuente de agua, estacionamiento ideal par Hotel, terreno muy grande para continuar construyendo.', 'img/imagenes/comprar/es/villa-malaga.png', 'es', 1, 1, 0, '50,000 m²', 'Esta es la imagen de villa Málaga.', '', ''),
(7, 3, '43.32702908634991, -1.971742489143267', 2000, 1, 'Espectacular apartamento, muy amplio con 4 habitaciones, cocina, comedor, sala, terraza, aire acondicionado calefacción.', 'img/imagenes/comprar/es/apartamento1.png', 'es', 3, 1, 0, '40,000 m²', 'Esta es la imagen del apartamento 1.', '', ''),
(8, 8, '43.32852756689844, -1.971742489143267', 2005, 1, 'Lujoso apartamento, ubicado frente a las hermosas playas de Gross Donostia, cuenta con area de estacionamiento, lobbye, piscina, todas las habitaciones cuentan con baño, aire acondicionado y calefacción, amplia cocina, oficina, dos plantas, cancha de Tenis, basketball y fooball sala, Bar, auditorio.', 'img/imagenes/comprar/es/apartamento2.png', 'es', 3, 1, 0, '80,000 m²', 'Esta es la imagen del apartamento 2.', '', ''),
(9, 2, '43.326779335997806, -1.9719141505181466', 2001, 1, 'Bellísimo apartamento ideal para pequeña familia o pareja.', 'img/imagenes/comprar/es/apartamento3.png', 'es', 3, 1, 0, '60,000 m²', 'Esta es la imagen del apartamento 3.', '', ''),
(10, 2, '43.316819703878195, -1.9856899756384794', 1975, 0, 'Bonito piso, ubicado en el casco viejo de Donostia, cuenta con aire acondicionado, calefacción,  Calle Barcelona 4 piso número 5 Derecha.', 'img/imagenes/comprar/es/casa1.png', 'es', 2, 1, 0, '250 m²', 'Esta es la imagen del piso 1 en Donostia.', '', ''),
(11, 3, '43.317506627476206, -1.98491749942862', 1989, 0, 'Excelente piso, ubicado en el centro do Donostia, cuenta con dos baños, calefacción, estacionamiento y garaje privado,  Calle Málaga 6  piso 10 centro.', 'img/imagenes/comprar/es/casa2.png', 'es', 2, 1, 0, '350 m²', 'Esta es la imagen del piso 2 en Donostia.', '', ''),
(12, 4, '43.314626529363814, -1.9814256916969268', 1980, 0, 'Muy bonito piso, ubicado en Amara Donostia, cuenta con calefacción, dos baños y garaje,  Calle Madrid 8 piso número 3 Izquierda.', 'img/imagenes/comprar/es/casa3.png', 'es', 2, 1, 0, '350 m²', 'Esta es la imagen del piso 3 en Donostia.', '', ''),
(13, 3, '43.325242137129486, -1.9749025592581149', 1975, 1, 'Cómodo y acogedor Piso, ubicado en Gross, cuenta con aire acondicionado, calefacción, garaje,  Calle Felipe VI 4 piso número 5 Derecha.', 'img/imagenes/comprar/es/casa4.png', 'es', 2, 1, 0, '325 m²', 'Esta es la imagen del piso 4 en Donostia.', '', ''),
(14, 0, '', 0, 0, '', 'img/imagenes/comprar/eu/villa1.png', 'eu', 1, 1, 0, '', '', 'Explora Propiedades Exclusivas en Europa', 'Bienvenido a CHOW-MOLINA REAL STATE, tu guía para descubrir las mejores propiedades en Europa. Desde las majestuosas villas en la costa italiana hasta los encantadores apartamentos en París, ofrecemos una selección incomparable de inmuebles en algunos de los destinos más emblemáticos y buscados de Europa.\r\n\r\nExplora nuestra colección cuidadosamente seleccionada de propiedades que capturan la esencia y el encanto distintivo de Europa. Ya sea que estés buscando una casa de campo en la campiña inglesa, un ático con vistas panorámicas en Berlín o una finca histórica en la campiña francesa, estamos aquí para ayudarte a encontrar la propiedad perfecta que se adapte a tus gustos y necesidades.\r\n\r\nEn [nombre de la empresa], nos dedicamos a proporcionar un servicio excepcional y personalizado a nuestros clientes en toda Europa. Nuestro equipo de expertos en bienes raíces está comprometido a brindarte asesoramiento experto y apoyo en cada etapa del proceso de compra, garantizando una experiencia fluida y gratificante.\r\n\r\nEmpieza tu búsqueda hoy mismo y descubre la riqueza cultural, la elegancia atemporal y la belleza natural de Europa con [nombre de la empresa]. Te invitamos a explorar nuest'),
(15, 0, '', 0, 0, '', 'img/imagenes/comprar/eu/villa2.png', 'eu', 1, 1, 0, '', '', '', ''),
(16, 0, '', 0, 0, '', 'img/imagenes/comprar/eu/villa3.png', 'eu', 1, 1, 0, '', '', '', ''),
(17, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/casa1-nuevazelanda.png', 'ww', 1, 1, 0, '', '', '\"Bienvenido a CHOW-MOLINA REAL STATE\"', 'Tu fuente confiable para descubrir propiedades exclusivas en los destinos más deseados del planeta. Desde las icónicas calles de París hasta las exuberantes playas de las islas Maldivas, ofrecemos una extraordinaria selección de inmuebles de lujo que reflejan la diversidad y la belleza del mundo que nos rodea.\r\n\r\nNuestra colección curada de propiedades abarca una amplia gama de estilos arquitectónicos, ubicaciones impresionantes y comodidades de primera clase. Ya sea que estés buscando una elegante villa en la Toscana, una casa contemporánea en Los Ángeles o un retiro tranquilo en las montañas suizas, estamos aquí para hacer realidad tus sueños de propiedad global.\r\n\r\nEn [nombre de la empresa], nos apasiona proporcionar un servicio excepcional y personalizado a nuestros clientes en todo el mundo. Nuestro equipo de expertos en bienes raíces está comprometido a brindarte orientación experta y apoyo en cada paso del proceso de compra, asegurándonos de que tu experiencia sea gratificante y sin complicaciones.\r\n\r\nEmpieza tu viaje hacia la propiedad internacional de tus sueños hoy mismo con [nombre de la empresa]. Descubre un mundo de posibilidades y encuentra tu hogar perfecto donde sea'),
(18, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/casa2-china.png', 'ww', 1, 1, 0, '', '', '', ''),
(19, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/casa3-japon.png', 'ww', 1, 1, 0, '', '', '', ''),
(20, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso1.png', 'ww', 2, 1, 0, '', '', '', ''),
(21, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso2.png', 'ww', 2, 1, 0, '', '', '', ''),
(22, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso3.png', 'ww', 2, 1, 0, '', '', '', ''),
(23, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso4-dubai.png', 'ww', 2, 1, 0, '', '', '', ''),
(24, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso4-shangai.png', 'ww', 2, 1, 0, '', '', '', ''),
(25, 0, '', 0, 0, '', 'img/imagenes/comprar/ww/piso5-sidney.png', 'ww', 2, 1, 0, '', '', '', ''),
(26, 0, '', 0, 0, '', '', '', 0, 1, 0, '', '', 'Descubre Propiedades Exclusivas en España', 'Bienvenido a [nombre de la empresa], tu destino para encontrar las mejores propiedades en España. Desde las impresionantes costas del Mediterráneo hasta las encantadoras ciudades históricas, ofrecemos una selección incomparable de inmuebles en algunos de los destinos más codiciados de España.\r\n\r\nExplora nuestra amplia gama de propiedades que capturan la esencia y el encanto únicos de España. Ya sea que busques una villa de lujo en Marbella, un apartamento con vistas al mar en Barcelona o una casa señorial en el corazón de Madrid, estamos aquí para ayudarte a encontrar la propiedad perfecta que se adapte a tu estilo de vida y preferencias.\r\n\r\nEn [nombre de la empresa], nos enorgullecemos de ofrecer un servicio personalizado y profesional en cada paso del proceso de compra. Nuestro equipo de expertos en bienes raíces está dedicado a brindarte asesoramiento experto y asegurarse de que tu experiencia de compra sea lo más fluida y gratificante posible.\r\n\r\nEmpieza tu búsqueda hoy mismo y descubre el estilo de vida mediterráneo y la belleza atemporal de España con [nombre de la empresa].');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactar`
--

CREATE TABLE `contactar` (
  `id` int(1) NOT NULL,
  `ruta` varchar(28) NOT NULL,
  `alt` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactar`
--

INSERT INTO `contactar` (`id`, `ruta`, `alt`) VALUES
(1, 'img/imagenes/contactar.png', 'Esta es la imagen de contacto.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresahistoria`
--

CREATE TABLE `empresahistoria` (
  `id` int(2) NOT NULL,
  `ruta` varchar(40) NOT NULL,
  `alt` varchar(46) NOT NULL,
  `titulo` varchar(62) NOT NULL,
  `parrafo` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresahistoria`
--

INSERT INTO `empresahistoria` (`id`, `ruta`, `alt`, `titulo`, `parrafo`) VALUES
(3, 'img/imagenes/empresa - historia.png', 'Esta es la imagen de la historia de la empresa', 'Nuestra Historia: Más de 100 Años de Excelencia Inmobiliaria.', 'Desde nuestros humildes comienzos hace más de un siglo, en [año de fundación], en [ubicación], nuestra empresa se ha mantenido firme en su compromiso de ofrecer servicios inmobiliarios de primera clase y satisfacer las necesidades de nuestros clientes en todo el mundo.\r\n\r\nFundada por [nombre del fundador] con una visión clara y un espíritu emprendedor, nuestra empresa ha crecido y evolucionado a lo largo de los años, adaptándose a los cambios del mercado y las demandas de una clientela cada vez más diversa y exigente.\r\n\r\nDesde nuestros primeros días como una pequeña agencia local, hemos ampliado nuestro alcance y nuestras operaciones, convirtiéndonos en una marca reconocida internacionalmente con una reputación impecable en el sector inmobiliario de lujo.\r\n\r\nA lo largo de nuestra historia, hemos sido testigos de momentos de crecimiento, desafíos y logros significativos. Nos hemos enfrentado a crisis económicas, cambios legislativos y fluctuaciones del mercado, pero hemos perseverado con determinación y dedicación, siempre enfocados en brindar el mejor servicio a nuestros clientes.\r\n\r\nHoy en día, nos enorgullece ser líderes en el mercado inmobiliario global, con una amplia cartera de propiedades exclusivas y un equipo de profesionales altamente capacitados y comprometidos. Continuamos construyendo sobre los cimientos sólidos establecidos por nuestros fundadores, manteniendo los más altos estándares de excelencia y ética profesional en todo lo que hacemos.\r\n\r\nA medida que miram');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresaoficinas`
--

CREATE TABLE `empresaoficinas` (
  `id` int(2) NOT NULL,
  `ruta` varchar(35) NOT NULL,
  `alt` varchar(25) NOT NULL,
  `titulo` varchar(55) NOT NULL,
  `parrafo` varchar(1400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresaoficinas`
--

INSERT INTO `empresaoficinas` (`id`, `ruta`, `alt`, `titulo`, `parrafo`) VALUES
(0, 'img/imagenes/empresa-oficinas.png', 'Esta es la imagen de las ', 'Nuestra Presencia Global: Oficinas en Todo el Mundo', 'En [nombre de la empresa], nos enorgullece contar con una extensa red de oficinas estratégicamente ubicadas en todo el mundo, que nos permite brindar un servicio excepcional a nuestros clientes, dondequiera que estén.\r\n\r\nCon oficinas en [cantidad] ciudades de todo el mundo, estamos presentes en algunos de los destinos más importantes del mercado inmobiliario global. Desde Nueva York hasta París, desde Hong Kong hasta Londres, nuestras oficinas están convenientemente ubicadas para satisfacer las necesidades de nuestros clientes y proporcionarles un acceso fácil y conveniente a nuestra gama de servicios inmobiliarios de primer nivel.\r\n\r\nAdemás, nos enorgullece especialmente tener nuestra sede central ubicada en la hermosa ciudad de San Sebastián, en el norte de España. Esta encantadora ciudad costera, conocida por su belleza natural, cultura vibrante y excelente calidad de vida, sirve como el corazón de nuestras operaciones globales. Desde aquí, coordinamos nuestras actividades en todo el mundo, manteniendo los más altos estándares de excelencia y servicio al cliente en cada interacción.\r\n\r\nYa sea que estés buscando comprar, vender o alquilar una propiedad en cualquier parte del mundo, nuestro equipo experto en cada una de nuestras oficinas está listo para ayudarte a alcanzar tus objetivos inmobiliarios. Confía en nosotros para proporcionarte un servicio personalizado y profesion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'Ricardo', '123456', 'flexprricardojose@yahoo.com', '2024-12-19 20:08:12'),
(2, 'Cinthia Molina   ', '5678', 'cintihamolina882@gmail.com', '2024-12-19 20:39:29'),
(3, 'jonmircha', '987654', 'rj_chow25@hotmail.com', '2024-12-19 20:49:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vender`
--

CREATE TABLE `vender` (
  `id` int(2) NOT NULL,
  `titulo` varchar(34) NOT NULL,
  `parrafo` varchar(328) NOT NULL,
  `habitaciones` int(1) NOT NULL,
  `coordenadas` varchar(50) NOT NULL,
  `anio` int(1) NOT NULL,
  `piscina` int(1) NOT NULL DEFAULT 1 COMMENT 'si tiene piscina si=1, no=0\r\n',
  `location` int(1) NOT NULL,
  `alquiler` int(1) NOT NULL DEFAULT 0 COMMENT 'si esta en alquiler si=1, no=0',
  `ruta` varchar(50) NOT NULL,
  `alt` varchar(20) NOT NULL,
  `superficie` int(1) NOT NULL,
  `venta` int(1) NOT NULL DEFAULT 1 COMMENT 'Si está en venta si=1, no=0\r\n',
  `tipo` int(1) NOT NULL DEFAULT 1 COMMENT 'Villa=1,Piso=2,Apartamento=3',
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vender`
--

INSERT INTO `vender` (`id`, `titulo`, `parrafo`, `habitaciones`, `coordenadas`, `anio`, `piscina`, `location`, `alquiler`, `ruta`, `alt`, `superficie`, `venta`, `tipo`, `descripcion`) VALUES
(1, '¿Listo para Vender tu Propiedad?', 'Estamos aquí para ayudarte a dar el siguiente paso. Por favor, completa el siguiente formulario con los detalles de tu propiedad para que podamos evaluarla y concertar una cita contigo. Nos aseguraremos de que el proceso sea lo más sencillo y eficiente posible. ¡Es el momento de dar el primer paso hacia tu próxima aventura!', 0, '', 0, 1, 0, 0, '', 'Esta es la imagen de', 0, 1, 1, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquilar`
--
ALTER TABLE `alquilar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprar_vivienda`
--
ALTER TABLE `comprar_vivienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactar`
--
ALTER TABLE `contactar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresahistoria`
--
ALTER TABLE `empresahistoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresaoficinas`
--
ALTER TABLE `empresaoficinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vender`
--
ALTER TABLE `vender`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquilar`
--
ALTER TABLE `alquilar`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comprar_vivienda`
--
ALTER TABLE `comprar_vivienda`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `contactar`
--
ALTER TABLE `contactar`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresahistoria`
--
ALTER TABLE `empresahistoria`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vender`
--
ALTER TABLE `vender`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
