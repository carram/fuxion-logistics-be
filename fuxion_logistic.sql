-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2017 a las 12:01:52
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fuxion_logistic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` text NOT NULL,
  `ubicacion` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `prefijo_facturacion` varchar(20) NOT NULL,
  `alias` varchar(150) NOT NULL,
  `ubicacion_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`id`, `nombre`, `prefijo_facturacion`, `alias`, `ubicacion_id`, `created_at`, `updated_at`) VALUES
(1, 'Bogota Fuxion', 'Bog01', 'S0021 - BOGOTA', 1, '2017-10-24 23:19:20', '2017-10-24 23:19:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `nombre`, `departamento_id`) VALUES
(1, 'EL ENCANTO', 1),
(2, 'LA CHORRERA', 1),
(3, 'LA PEDRERA', 1),
(4, 'LA VICTORIA', 1),
(5, 'LETICIA', 1),
(6, 'MIRITI', 1),
(7, 'PUERTO ALEGRIA', 1),
(8, 'PUERTO ARICA', 1),
(9, 'PUERTO NARIÑO', 1),
(10, 'PUERTO SANTANDER', 1),
(11, 'TURAPACA', 1),
(12, 'ABEJORRAL', 2),
(13, 'ABRIAQUI', 2),
(14, 'ALEJANDRIA', 2),
(15, 'AMAGA', 2),
(16, 'AMALFI', 2),
(17, 'ANDES', 2),
(18, 'ANGELOPOLIS', 2),
(19, 'ANGOSTURA', 2),
(20, 'ANORI', 2),
(21, 'ANTIOQUIA', 2),
(22, 'ANZA', 2),
(23, 'APARTADO', 2),
(24, 'ARBOLETES', 2),
(25, 'ARGELIA', 2),
(26, 'ARMENIA', 2),
(27, 'BARBOSA', 2),
(28, 'BELLO', 2),
(29, 'BELMIRA', 2),
(30, 'BETANIA', 2),
(31, 'BETULIA', 2),
(32, 'BOLIVAR', 2),
(33, 'BRICEÑO', 2),
(34, 'BURITICA', 2),
(35, 'CACERES', 2),
(36, 'CAICEDO', 2),
(37, 'CALDAS', 2),
(38, 'CAMPAMENTO', 2),
(39, 'CANASGORDAS', 2),
(40, 'CARACOLI', 2),
(41, 'CARAMANTA', 2),
(42, 'CAREPA', 2),
(43, 'CARMEN DE VIBORAL', 2),
(44, 'CAROLINA DEL PRINCIPE', 2),
(45, 'CAUCASIA', 2),
(46, 'CHIGORODO', 2),
(47, 'CISNEROS', 2),
(48, 'COCORNA', 2),
(49, 'CONCEPCION', 2),
(50, 'CONCORDIA', 2),
(51, 'COPACABANA', 2),
(52, 'DABEIBA', 2),
(53, 'DONMATIAS', 2),
(54, 'EBEJICO', 2),
(55, 'EL BAGRE', 2),
(56, 'EL PENOL', 2),
(57, 'EL RETIRO', 2),
(58, 'ENTRERRIOS', 2),
(59, 'ENVIGADO', 2),
(60, 'FREDONIA', 2),
(61, 'FRONTINO', 2),
(62, 'GIRALDO', 2),
(63, 'GIRARDOTA', 2),
(64, 'GOMEZ PLATA', 2),
(65, 'GRANADA', 2),
(66, 'GUADALUPE', 2),
(67, 'GUARNE', 2),
(68, 'GUATAQUE', 2),
(69, 'HELICONIA', 2),
(70, 'HISPANIA', 2),
(71, 'ITAGUI', 2),
(72, 'ITUANGO', 2),
(73, 'JARDIN', 2),
(74, 'JERICO', 2),
(75, 'LA CEJA', 2),
(76, 'LA ESTRELLA', 2),
(77, 'LA PINTADA', 2),
(78, 'LA UNION', 2),
(79, 'LIBORINA', 2),
(80, 'MACEO', 2),
(81, 'MARINILLA', 2),
(82, 'MEDELLIN', 2),
(83, 'MONTEBELLO', 2),
(84, 'MURINDO', 2),
(85, 'MUTATA', 2),
(86, 'NARINO', 2),
(87, 'NECHI', 2),
(88, 'NECOCLI', 2),
(89, 'OLAYA', 2),
(90, 'PEQUE', 2),
(91, 'PUEBLORRICO', 2),
(92, 'PUERTO BERRIO', 2),
(93, 'PUERTO NARE', 2),
(94, 'PUERTO TRIUNFO', 2),
(95, 'REMEDIOS', 2),
(96, 'RIONEGRO', 2),
(97, 'SABANALARGA', 2),
(98, 'SABANETA', 2),
(99, 'SALGAR', 2),
(100, 'SAN ANDRES DE CUERQUIA', 2),
(101, 'SAN CARLOS', 2),
(102, 'SAN FRANCISCO', 2),
(103, 'SAN JERONIMO', 2),
(104, 'SAN JOSE DE LA MONTAÑA', 2),
(105, 'SAN JUAN DE URABA', 2),
(106, 'SAN LUIS', 2),
(107, 'SAN PEDRO DE LOS MILAGROS', 2),
(108, 'SAN PEDRO DE URABA', 2),
(109, 'SAN RAFAEL', 2),
(110, 'SAN ROQUE', 2),
(111, 'SAN VICENTE', 2),
(112, 'SANTA BARBARA', 2),
(113, 'SANTA ROSA DE OSOS', 2),
(114, 'SANTO DOMINGO', 2),
(115, 'SANTUARIO', 2),
(116, 'SEGOVIA', 2),
(117, 'SONSON', 2),
(118, 'SOPETRAN', 2),
(119, 'TAMESIS', 2),
(120, 'TARAZA', 2),
(121, 'TARSO', 2),
(122, 'TITIRIBI', 2),
(123, 'TOLEDO', 2),
(124, 'TURBO', 2),
(125, 'URAMITA', 2),
(126, 'URRAO', 2),
(127, 'VALDIVIA', 2),
(128, 'VALPARAISO', 2),
(129, 'VEGACHI', 2),
(130, 'VENECIA', 2),
(131, 'VIGIA DEL FUERTE', 2),
(132, 'YALI', 2),
(133, 'YARUMAL', 2),
(134, 'YOLOMBO', 2),
(135, 'YONDO', 2),
(136, 'ZARAGOZA', 2),
(137, 'ARAUCA', 3),
(138, 'ARAUQUITA', 3),
(139, 'CRAVO NORTE', 3),
(140, 'FORTUL', 3),
(141, 'PUERTO RONDON', 3),
(142, 'SARAVENA', 3),
(143, 'TAME', 3),
(144, 'BARANOA', 4),
(145, 'BARRANQUILLA', 4),
(146, 'CAMPO DE LA CRUZ', 4),
(147, 'CANDELARIA', 4),
(148, 'GALAPA', 4),
(149, 'JUAN DE ACOSTA', 4),
(150, 'LURUACO', 4),
(151, 'MALAMBO', 4),
(152, 'MANATI', 4),
(153, 'PALMAR DE VARELA', 4),
(154, 'PIOJO', 4),
(155, 'POLO NUEVO', 4),
(156, 'PONEDERA', 4),
(157, 'PUERTO COLOMBIA', 4),
(158, 'REPELON', 4),
(159, 'SABANAGRANDE', 4),
(160, 'SABANALARGA', 4),
(161, 'SANTA LUCIA', 4),
(162, 'SANTO TOMAS', 4),
(163, 'SOLEDAD', 4),
(164, 'SUAN', 4),
(165, 'TUBARA', 4),
(166, 'USIACURI', 4),
(167, 'ACHI', 5),
(168, 'ALTOS DEL ROSARIO', 5),
(169, 'ARENAL', 5),
(170, 'ARJONA', 5),
(171, 'ARROYOHONDO', 5),
(172, 'BARRANCO DE LOBA', 5),
(173, 'BRAZUELO DE PAPAYAL', 5),
(174, 'CALAMAR', 5),
(175, 'CANTAGALLO', 5),
(176, 'CARTAGENA DE INDIAS', 5),
(177, 'CICUCO', 5),
(178, 'CLEMENCIA', 5),
(179, 'CORDOBA', 5),
(180, 'EL CARMEN DE BOLIVAR', 5),
(181, 'EL GUAMO', 5),
(182, 'EL PENION', 5),
(183, 'HATILLO DE LOBA', 5),
(184, 'MAGANGUE', 5),
(185, 'MAHATES', 5),
(186, 'MARGARITA', 5),
(187, 'MARIA LA BAJA', 5),
(188, 'MONTECRISTO', 5),
(189, 'MORALES', 5),
(190, 'MORALES', 5),
(191, 'NOROSI', 5),
(192, 'PINILLOS', 5),
(193, 'REGIDOR', 5),
(194, 'RIO VIEJO', 5),
(195, 'SAN CRISTOBAL', 5),
(196, 'SAN ESTANISLAO', 5),
(197, 'SAN FERNANDO', 5),
(198, 'SAN JACINTO', 5),
(199, 'SAN JACINTO DEL CAUCA', 5),
(200, 'SAN JUAN DE NEPOMUCENO', 5),
(201, 'SAN MARTIN DE LOBA', 5),
(202, 'SAN PABLO', 5),
(203, 'SAN PABLO NORTE', 5),
(204, 'SANTA CATALINA', 5),
(205, 'SANTA CRUZ DE MOMPOX', 5),
(206, 'SANTA ROSA', 5),
(207, 'SANTA ROSA DEL SUR', 5),
(208, 'SIMITI', 5),
(209, 'SOPLAVIENTO', 5),
(210, 'TALAIGUA NUEVO', 5),
(211, 'TUQUISIO', 5),
(212, 'TURBACO', 5),
(213, 'TURBANA', 5),
(214, 'VILLANUEVA', 5),
(215, 'ZAMBRANO', 5),
(216, 'AQUITANIA', 6),
(217, 'ARCABUCO', 6),
(218, 'BELÉN', 6),
(219, 'BERBEO', 6),
(220, 'BETÉITIVA', 6),
(221, 'BOAVITA', 6),
(222, 'BOYACÁ', 6),
(223, 'BRICEÑO', 6),
(224, 'BUENAVISTA', 6),
(225, 'BUSBANZÁ', 6),
(226, 'CALDAS', 6),
(227, 'CAMPO HERMOSO', 6),
(228, 'CERINZA', 6),
(229, 'CHINAVITA', 6),
(230, 'CHIQUINQUIRÁ', 6),
(231, 'CHÍQUIZA', 6),
(232, 'CHISCAS', 6),
(233, 'CHITA', 6),
(234, 'CHITARAQUE', 6),
(235, 'CHIVATÁ', 6),
(236, 'CIÉNEGA', 6),
(237, 'CÓMBITA', 6),
(238, 'COPER', 6),
(239, 'CORRALES', 6),
(240, 'COVARACHÍA', 6),
(241, 'CUBARA', 6),
(242, 'CUCAITA', 6),
(243, 'CUITIVA', 6),
(244, 'DUITAMA', 6),
(245, 'EL COCUY', 6),
(246, 'EL ESPINO', 6),
(247, 'FIRAVITOBA', 6),
(248, 'FLORESTA', 6),
(249, 'GACHANTIVÁ', 6),
(250, 'GÁMEZA', 6),
(251, 'GARAGOA', 6),
(252, 'GUACAMAYAS', 6),
(253, 'GÜICÁN', 6),
(254, 'IZA', 6),
(255, 'JENESANO', 6),
(256, 'JERICÓ', 6),
(257, 'LA UVITA', 6),
(258, 'LA VICTORIA', 6),
(259, 'LABRANZA GRANDE', 6),
(260, 'MACANAL', 6),
(261, 'MARIPÍ', 6),
(262, 'MIRAFLORES', 6),
(263, 'MONGUA', 6),
(264, 'MONGUÍ', 6),
(265, 'MONIQUIRÁ', 6),
(266, 'MOTAVITA', 6),
(267, 'MUZO', 6),
(268, 'NOBSA', 6),
(269, 'NUEVO COLÓN', 6),
(270, 'OICATÁ', 6),
(271, 'OTANCHE', 6),
(272, 'PACHAVITA', 6),
(273, 'PÁEZ', 6),
(274, 'PAIPA', 6),
(275, 'PAJARITO', 6),
(276, 'PANQUEBA', 6),
(277, 'PAUNA', 6),
(278, 'PAYA', 6),
(279, 'PAZ DE RÍO', 6),
(280, 'PESCA', 6),
(281, 'PISBA', 6),
(282, 'PUERTO BOYACA', 6),
(283, 'QUÍPAMA', 6),
(284, 'RAMIRIQUÍ', 6),
(285, 'RÁQUIRA', 6),
(286, 'RONDÓN', 6),
(287, 'SABOYÁ', 6),
(288, 'SÁCHICA', 6),
(289, 'SAMACÁ', 6),
(290, 'SAN EDUARDO', 6),
(291, 'SAN JOSÉ DE PARE', 6),
(292, 'SAN LUÍS DE GACENO', 6),
(293, 'SAN MATEO', 6),
(294, 'SAN MIGUEL DE SEMA', 6),
(295, 'SAN PABLO DE BORBUR', 6),
(296, 'SANTA MARÍA', 6),
(297, 'SANTA ROSA DE VITERBO', 6),
(298, 'SANTA SOFÍA', 6),
(299, 'SANTANA', 6),
(300, 'SATIVANORTE', 6),
(301, 'SATIVASUR', 6),
(302, 'SIACHOQUE', 6),
(303, 'SOATÁ', 6),
(304, 'SOCHA', 6),
(305, 'SOCOTÁ', 6),
(306, 'SOGAMOSO', 6),
(307, 'SORA', 6),
(308, 'SORACÁ', 6),
(309, 'SOTAQUIRÁ', 6),
(310, 'SUSACÓN', 6),
(311, 'SUTARMACHÁN', 6),
(312, 'TASCO', 6),
(313, 'TIBANÁ', 6),
(314, 'TIBASOSA', 6),
(315, 'TINJACÁ', 6),
(316, 'TIPACOQUE', 6),
(317, 'TOCA', 6),
(318, 'TOGÜÍ', 6),
(319, 'TÓPAGA', 6),
(320, 'TOTA', 6),
(321, 'TUNJA', 6),
(322, 'TUNUNGUÁ', 6),
(323, 'TURMEQUÉ', 6),
(324, 'TUTA', 6),
(325, 'TUTAZÁ', 6),
(326, 'UMBITA', 6),
(327, 'VENTA QUEMADA', 6),
(328, 'VILLA DE LEYVA', 6),
(329, 'VIRACACHÁ', 6),
(330, 'ZETAQUIRA', 6),
(331, 'AGUADAS', 7),
(332, 'ANSERMA', 7),
(333, 'ARANZAZU', 7),
(334, 'BELALCAZAR', 7),
(335, 'CHINCHINÁ', 7),
(336, 'FILADELFIA', 7),
(337, 'LA DORADA', 7),
(338, 'LA MERCED', 7),
(339, 'MANIZALES', 7),
(340, 'MANZANARES', 7),
(341, 'MARMATO', 7),
(342, 'MARQUETALIA', 7),
(343, 'MARULANDA', 7),
(344, 'NEIRA', 7),
(345, 'NORCASIA', 7),
(346, 'PACORA', 7),
(347, 'PALESTINA', 7),
(348, 'PENSILVANIA', 7),
(349, 'RIOSUCIO', 7),
(350, 'RISARALDA', 7),
(351, 'SALAMINA', 7),
(352, 'SAMANA', 7),
(353, 'SAN JOSE', 7),
(354, 'SUPÍA', 7),
(355, 'VICTORIA', 7),
(356, 'VILLAMARÍA', 7),
(357, 'VITERBO', 7),
(358, 'ALBANIA', 8),
(359, 'BELÉN ANDAQUIES', 8),
(360, 'CARTAGENA DEL CHAIRA', 8),
(361, 'CURILLO', 8),
(362, 'EL DONCELLO', 8),
(363, 'EL PAUJIL', 8),
(364, 'FLORENCIA', 8),
(365, 'LA MONTAÑITA', 8),
(366, 'MILÁN', 8),
(367, 'MORELIA', 8),
(368, 'PUERTO RICO', 8),
(369, 'SAN  VICENTE DEL CAGUAN', 8),
(370, 'SAN JOSÉ DE FRAGUA', 8),
(371, 'SOLANO', 8),
(372, 'SOLITA', 8),
(373, 'VALPARAÍSO', 8),
(374, 'AGUAZUL', 9),
(375, 'CHAMEZA', 9),
(376, 'HATO COROZAL', 9),
(377, 'LA SALINA', 9),
(378, 'MANÍ', 9),
(379, 'MONTERREY', 9),
(380, 'NUNCHIA', 9),
(381, 'OROCUE', 9),
(382, 'PAZ DE ARIPORO', 9),
(383, 'PORE', 9),
(384, 'RECETOR', 9),
(385, 'SABANA LARGA', 9),
(386, 'SACAMA', 9),
(387, 'SAN LUIS DE PALENQUE', 9),
(388, 'TAMARA', 9),
(389, 'TAURAMENA', 9),
(390, 'TRINIDAD', 9),
(391, 'VILLANUEVA', 9),
(392, 'YOPAL', 9),
(393, 'ALMAGUER', 10),
(394, 'ARGELIA', 10),
(395, 'BALBOA', 10),
(396, 'BOLÍVAR', 10),
(397, 'BUENOS AIRES', 10),
(398, 'CAJIBIO', 10),
(399, 'CALDONO', 10),
(400, 'CALOTO', 10),
(401, 'CORINTO', 10),
(402, 'EL TAMBO', 10),
(403, 'FLORENCIA', 10),
(404, 'GUAPI', 10),
(405, 'INZA', 10),
(406, 'JAMBALÓ', 10),
(407, 'LA SIERRA', 10),
(408, 'LA VEGA', 10),
(409, 'LÓPEZ', 10),
(410, 'MERCADERES', 10),
(411, 'MIRANDA', 10),
(412, 'MORALES', 10),
(413, 'PADILLA', 10),
(414, 'PÁEZ', 10),
(415, 'PATIA (EL BORDO)', 10),
(416, 'PIAMONTE', 10),
(417, 'PIENDAMO', 10),
(418, 'POPAYÁN', 10),
(419, 'PUERTO TEJADA', 10),
(420, 'PURACE', 10),
(421, 'ROSAS', 10),
(422, 'SAN SEBASTIÁN', 10),
(423, 'SANTA ROSA', 10),
(424, 'SANTANDER DE QUILICHAO', 10),
(425, 'SILVIA', 10),
(426, 'SOTARA', 10),
(427, 'SUÁREZ', 10),
(428, 'SUCRE', 10),
(429, 'TIMBÍO', 10),
(430, 'TIMBIQUÍ', 10),
(431, 'TORIBIO', 10),
(432, 'TOTORO', 10),
(433, 'VILLA RICA', 10),
(434, 'AGUACHICA', 11),
(435, 'AGUSTÍN CODAZZI', 11),
(436, 'ASTREA', 11),
(437, 'BECERRIL', 11),
(438, 'BOSCONIA', 11),
(439, 'CHIMICHAGUA', 11),
(440, 'CHIRIGUANÁ', 11),
(441, 'CURUMANÍ', 11),
(442, 'EL COPEY', 11),
(443, 'EL PASO', 11),
(444, 'GAMARRA', 11),
(445, 'GONZÁLEZ', 11),
(446, 'LA GLORIA', 11),
(447, 'LA JAGUA IBIRICO', 11),
(448, 'MANAURE BALCÓN DEL CESAR', 11),
(449, 'PAILITAS', 11),
(450, 'PELAYA', 11),
(451, 'PUEBLO BELLO', 11),
(452, 'RÍO DE ORO', 11),
(453, 'ROBLES (LA PAZ)', 11),
(454, 'SAN ALBERTO', 11),
(455, 'SAN DIEGO', 11),
(456, 'SAN MARTÍN', 11),
(457, 'TAMALAMEQUE', 11),
(458, 'VALLEDUPAR', 11),
(459, 'ACANDI', 12),
(460, 'ALTO BAUDO (PIE DE PATO)', 12),
(461, 'ATRATO', 12),
(462, 'BAGADO', 12),
(463, 'BAHIA SOLANO (MUTIS)', 12),
(464, 'BAJO BAUDO (PIZARRO)', 12),
(465, 'BOJAYA (BELLAVISTA)', 12),
(466, 'CANTON DE SAN PABLO', 12),
(467, 'CARMEN DEL DARIEN', 12),
(468, 'CERTEGUI', 12),
(469, 'CONDOTO', 12),
(470, 'EL CARMEN', 12),
(471, 'ISTMINA', 12),
(472, 'JURADO', 12),
(473, 'LITORAL DEL SAN JUAN', 12),
(474, 'LLORO', 12),
(475, 'MEDIO ATRATO', 12),
(476, 'MEDIO BAUDO (BOCA DE PEPE)', 12),
(477, 'MEDIO SAN JUAN', 12),
(478, 'NOVITA', 12),
(479, 'NUQUI', 12),
(480, 'QUIBDO', 12),
(481, 'RIO IRO', 12),
(482, 'RIO QUITO', 12),
(483, 'RIOSUCIO', 12),
(484, 'SAN JOSE DEL PALMAR', 12),
(485, 'SIPI', 12),
(486, 'TADO', 12),
(487, 'UNGUIA', 12),
(488, 'UNIÓN PANAMERICANA', 12),
(489, 'AYAPEL', 13),
(490, 'BUENAVISTA', 13),
(491, 'CANALETE', 13),
(492, 'CERETÉ', 13),
(493, 'CHIMA', 13),
(494, 'CHINÚ', 13),
(495, 'CIENAGA DE ORO', 13),
(496, 'COTORRA', 13),
(497, 'LA APARTADA', 13),
(498, 'LORICA', 13),
(499, 'LOS CÓRDOBAS', 13),
(500, 'MOMIL', 13),
(501, 'MONTELÍBANO', 13),
(502, 'MONTERÍA', 13),
(503, 'MOÑITOS', 13),
(504, 'PLANETA RICA', 13),
(505, 'PUEBLO NUEVO', 13),
(506, 'PUERTO ESCONDIDO', 13),
(507, 'PUERTO LIBERTADOR', 13),
(508, 'PURÍSIMA', 13),
(509, 'SAHAGÚN', 13),
(510, 'SAN ANDRÉS SOTAVENTO', 13),
(511, 'SAN ANTERO', 13),
(512, 'SAN BERNARDO VIENTO', 13),
(513, 'SAN CARLOS', 13),
(514, 'SAN PELAYO', 13),
(515, 'TIERRALTA', 13),
(516, 'VALENCIA', 13),
(517, 'AGUA DE DIOS', 14),
(518, 'ALBAN', 14),
(519, 'ANAPOIMA', 14),
(520, 'ANOLAIMA', 14),
(521, 'ARBELAEZ', 14),
(522, 'BELTRÁN', 14),
(523, 'BITUIMA', 14),
(524, 'BOGOTÁ DC', 14),
(525, 'BOJACÁ', 14),
(526, 'CABRERA', 14),
(527, 'CACHIPAY', 14),
(528, 'CAJICÁ', 14),
(529, 'CAPARRAPÍ', 14),
(530, 'CAQUEZA', 14),
(531, 'CARMEN DE CARUPA', 14),
(532, 'CHAGUANÍ', 14),
(533, 'CHIA', 14),
(534, 'CHIPAQUE', 14),
(535, 'CHOACHÍ', 14),
(536, 'CHOCONTÁ', 14),
(537, 'COGUA', 14),
(538, 'COTA', 14),
(539, 'CUCUNUBÁ', 14),
(540, 'EL COLEGIO', 14),
(541, 'EL PEÑÓN', 14),
(542, 'EL ROSAL1', 14),
(543, 'FACATATIVA', 14),
(544, 'FÓMEQUE', 14),
(545, 'FOSCA', 14),
(546, 'FUNZA', 14),
(547, 'FÚQUENE', 14),
(548, 'FUSAGASUGA', 14),
(549, 'GACHALÁ', 14),
(550, 'GACHANCIPÁ', 14),
(551, 'GACHETA', 14),
(552, 'GAMA', 14),
(553, 'GIRARDOT', 14),
(554, 'GRANADA2', 14),
(555, 'GUACHETÁ', 14),
(556, 'GUADUAS', 14),
(557, 'GUASCA', 14),
(558, 'GUATAQUÍ', 14),
(559, 'GUATAVITA', 14),
(560, 'GUAYABAL DE SIQUIMA', 14),
(561, 'GUAYABETAL', 14),
(562, 'GUTIÉRREZ', 14),
(563, 'JERUSALÉN', 14),
(564, 'JUNÍN', 14),
(565, 'LA CALERA', 14),
(566, 'LA MESA', 14),
(567, 'LA PALMA', 14),
(568, 'LA PEÑA', 14),
(569, 'LA VEGA', 14),
(570, 'LENGUAZAQUE', 14),
(571, 'MACHETÁ', 14),
(572, 'MADRID', 14),
(573, 'MANTA', 14),
(574, 'MEDINA', 14),
(575, 'MOSQUERA', 14),
(576, 'NARIÑO', 14),
(577, 'NEMOCÓN', 14),
(578, 'NILO', 14),
(579, 'NIMAIMA', 14),
(580, 'NOCAIMA', 14),
(581, 'OSPINA PÉREZ', 14),
(582, 'PACHO', 14),
(583, 'PAIME', 14),
(584, 'PANDI', 14),
(585, 'PARATEBUENO', 14),
(586, 'PASCA', 14),
(587, 'PUERTO SALGAR', 14),
(588, 'PULÍ', 14),
(589, 'QUEBRADANEGRA', 14),
(590, 'QUETAME', 14),
(591, 'QUIPILE', 14),
(592, 'RAFAEL REYES', 14),
(593, 'RICAURTE', 14),
(594, 'SAN  ANTONIO DEL  TEQUENDAMA', 14),
(595, 'SAN BERNARDO', 14),
(596, 'SAN CAYETANO', 14),
(597, 'SAN FRANCISCO', 14),
(598, 'SAN JUAN DE RIOSECO', 14),
(599, 'SASAIMA', 14),
(600, 'SESQUILÉ', 14),
(601, 'SIBATÉ', 14),
(602, 'SILVANIA', 14),
(603, 'SIMIJACA', 14),
(604, 'SOACHA', 14),
(605, 'SOPO', 14),
(606, 'SUBACHOQUE', 14),
(607, 'SUESCA', 14),
(608, 'SUPATÁ', 14),
(609, 'SUSA', 14),
(610, 'SUTATAUSA', 14),
(611, 'TABIO', 14),
(612, 'TAUSA', 14),
(613, 'TENA', 14),
(614, 'TENJO', 14),
(615, 'TIBACUY', 14),
(616, 'TIBIRITA', 14),
(617, 'TOCAIMA', 14),
(618, 'TOCANCIPÁ', 14),
(619, 'TOPAIPÍ', 14),
(620, 'UBALÁ', 14),
(621, 'UBAQUE', 14),
(622, 'UBATÉ', 14),
(623, 'UNE', 14),
(624, 'UTICA', 14),
(625, 'VERGARA', 14),
(626, 'VIANI', 14),
(627, 'VILLA GOMEZ', 14),
(628, 'VILLA PINZÓN', 14),
(629, 'VILLETA', 14),
(630, 'VIOTA', 14),
(631, 'YACOPÍ', 14),
(632, 'ZIPACÓN', 14),
(633, 'ZIPAQUIRÁ', 14),
(634, 'BARRANCO MINAS', 15),
(635, 'CACAHUAL', 15),
(636, 'INÍRIDA', 15),
(637, 'LA GUADALUPE', 15),
(638, 'MAPIRIPANA', 15),
(639, 'MORICHAL', 15),
(640, 'PANA PANA', 15),
(641, 'PUERTO COLOMBIA', 15),
(642, 'SAN FELIPE', 15),
(643, 'CALAMAR', 16),
(644, 'EL RETORNO', 16),
(645, 'MIRAFLOREZ', 16),
(646, 'SAN JOSÉ DEL GUAVIARE', 16),
(647, 'ACEVEDO', 17),
(648, 'AGRADO', 17),
(649, 'AIPE', 17),
(650, 'ALGECIRAS', 17),
(651, 'ALTAMIRA', 17),
(652, 'BARAYA', 17),
(653, 'CAMPO ALEGRE', 17),
(654, 'COLOMBIA', 17),
(655, 'ELIAS', 17),
(656, 'GARZÓN', 17),
(657, 'GIGANTE', 17),
(658, 'GUADALUPE', 17),
(659, 'HOBO', 17),
(660, 'IQUIRA', 17),
(661, 'ISNOS', 17),
(662, 'LA ARGENTINA', 17),
(663, 'LA PLATA', 17),
(664, 'NATAGA', 17),
(665, 'NEIVA', 17),
(666, 'OPORAPA', 17),
(667, 'PAICOL', 17),
(668, 'PALERMO', 17),
(669, 'PALESTINA', 17),
(670, 'PITAL', 17),
(671, 'PITALITO', 17),
(672, 'RIVERA', 17),
(673, 'SALADO BLANCO', 17),
(674, 'SAN AGUSTÍN', 17),
(675, 'SANTA MARIA', 17),
(676, 'SUAZA', 17),
(677, 'TARQUI', 17),
(678, 'TELLO', 17),
(679, 'TERUEL', 17),
(680, 'TESALIA', 17),
(681, 'TIMANA', 17),
(682, 'VILLAVIEJA', 17),
(683, 'YAGUARA', 17),
(684, 'ALBANIA', 18),
(685, 'BARRANCAS', 18),
(686, 'DIBULLA', 18),
(687, 'DISTRACCIÓN', 18),
(688, 'EL MOLINO', 18),
(689, 'FONSECA', 18),
(690, 'HATO NUEVO', 18),
(691, 'LA JAGUA DEL PILAR', 18),
(692, 'MAICAO', 18),
(693, 'MANAURE', 18),
(694, 'RIOHACHA', 18),
(695, 'SAN JUAN DEL CESAR', 18),
(696, 'URIBIA', 18),
(697, 'URUMITA', 18),
(698, 'VILLANUEVA', 18),
(699, 'ALGARROBO', 19),
(700, 'ARACATACA', 19),
(701, 'ARIGUANI', 19),
(702, 'CERRO SAN ANTONIO', 19),
(703, 'CHIVOLO', 19),
(704, 'CIENAGA', 19),
(705, 'CONCORDIA', 19),
(706, 'EL BANCO', 19),
(707, 'EL PIÑON', 19),
(708, 'EL RETEN', 19),
(709, 'FUNDACION', 19),
(710, 'GUAMAL', 19),
(711, 'NUEVA GRANADA', 19),
(712, 'PEDRAZA', 19),
(713, 'PIJIÑO DEL CARMEN', 19),
(714, 'PIVIJAY', 19),
(715, 'PLATO', 19),
(716, 'PUEBLO VIEJO', 19),
(717, 'REMOLINO', 19),
(718, 'SABANAS DE SAN ANGEL', 19),
(719, 'SALAMINA', 19),
(720, 'SAN SEBASTIAN DE BUENAVISTA', 19),
(721, 'SAN ZENON', 19),
(722, 'SANTA ANA', 19),
(723, 'SANTA BARBARA DE PINTO', 19),
(724, 'SANTA MARTA', 19),
(725, 'SITIONUEVO', 19),
(726, 'TENERIFE', 19),
(727, 'ZAPAYAN', 19),
(728, 'ZONA BANANERA', 19),
(729, 'ACACIAS', 20),
(730, 'BARRANCA DE UPIA', 20),
(731, 'CABUYARO', 20),
(732, 'CASTILLA LA NUEVA', 20),
(733, 'CUBARRAL', 20),
(734, 'CUMARAL', 20),
(735, 'EL CALVARIO', 20),
(736, 'EL CASTILLO', 20),
(737, 'EL DORADO', 20),
(738, 'FUENTE DE ORO', 20),
(739, 'GRANADA', 20),
(740, 'GUAMAL', 20),
(741, 'LA MACARENA', 20),
(742, 'LA URIBE', 20),
(743, 'LEJANÍAS', 20),
(744, 'MAPIRIPÁN', 20),
(745, 'MESETAS', 20),
(746, 'PUERTO CONCORDIA', 20),
(747, 'PUERTO GAITÁN', 20),
(748, 'PUERTO LLERAS', 20),
(749, 'PUERTO LÓPEZ', 20),
(750, 'PUERTO RICO', 20),
(751, 'RESTREPO', 20),
(752, 'SAN  JUAN DE ARAMA', 20),
(753, 'SAN CARLOS GUAROA', 20),
(754, 'SAN JUANITO', 20),
(755, 'SAN MARTÍN', 20),
(756, 'VILLAVICENCIO', 20),
(757, 'VISTA HERMOSA', 20),
(758, 'ALBAN', 21),
(759, 'ALDAÑA', 21),
(760, 'ANCUYA', 21),
(761, 'ARBOLEDA', 21),
(762, 'BARBACOAS', 21),
(763, 'BELEN', 21),
(764, 'BUESACO', 21),
(765, 'CHACHAGUI', 21),
(766, 'COLON (GENOVA)', 21),
(767, 'CONSACA', 21),
(768, 'CONTADERO', 21),
(769, 'CORDOBA', 21),
(770, 'CUASPUD', 21),
(771, 'CUMBAL', 21),
(772, 'CUMBITARA', 21),
(773, 'EL CHARCO', 21),
(774, 'EL PEÑOL', 21),
(775, 'EL ROSARIO', 21),
(776, 'EL TABLÓN', 21),
(777, 'EL TAMBO', 21),
(778, 'FUNES', 21),
(779, 'GUACHUCAL', 21),
(780, 'GUAITARILLA', 21),
(781, 'GUALMATAN', 21),
(782, 'ILES', 21),
(783, 'IMUES', 21),
(784, 'IPIALES', 21),
(785, 'LA CRUZ', 21),
(786, 'LA FLORIDA', 21),
(787, 'LA LLANADA', 21),
(788, 'LA TOLA', 21),
(789, 'LA UNION', 21),
(790, 'LEIVA', 21),
(791, 'LINARES', 21),
(792, 'LOS ANDES', 21),
(793, 'MAGUI', 21),
(794, 'MALLAMA', 21),
(795, 'MOSQUEZA', 21),
(796, 'NARIÑO', 21),
(797, 'OLAYA HERRERA', 21),
(798, 'OSPINA', 21),
(799, 'PASTO', 21),
(800, 'PIZARRO', 21),
(801, 'POLICARPA', 21),
(802, 'POTOSI', 21),
(803, 'PROVIDENCIA', 21),
(804, 'PUERRES', 21),
(805, 'PUPIALES', 21),
(806, 'RICAURTE', 21),
(807, 'ROBERTO PAYAN', 21),
(808, 'SAMANIEGO', 21),
(809, 'SAN BERNARDO', 21),
(810, 'SAN LORENZO', 21),
(811, 'SAN PABLO', 21),
(812, 'SAN PEDRO DE CARTAGO', 21),
(813, 'SANDONA', 21),
(814, 'SANTA BARBARA', 21),
(815, 'SANTACRUZ', 21),
(816, 'SAPUYES', 21),
(817, 'TAMINANGO', 21),
(818, 'TANGUA', 21),
(819, 'TUMACO', 21),
(820, 'TUQUERRES', 21),
(821, 'YACUANQUER', 21),
(822, 'ABREGO', 22),
(823, 'ARBOLEDAS', 22),
(824, 'BOCHALEMA', 22),
(825, 'BUCARASICA', 22),
(826, 'CÁCHIRA', 22),
(827, 'CÁCOTA', 22),
(828, 'CHINÁCOTA', 22),
(829, 'CHITAGÁ', 22),
(830, 'CONVENCIÓN', 22),
(831, 'CÚCUTA', 22),
(832, 'CUCUTILLA', 22),
(833, 'DURANIA', 22),
(834, 'EL CARMEN', 22),
(835, 'EL TARRA', 22),
(836, 'EL ZULIA', 22),
(837, 'GRAMALOTE', 22),
(838, 'HACARI', 22),
(839, 'HERRÁN', 22),
(840, 'LA ESPERANZA', 22),
(841, 'LA PLAYA', 22),
(842, 'LABATECA', 22),
(843, 'LOS PATIOS', 22),
(844, 'LOURDES', 22),
(845, 'MUTISCUA', 22),
(846, 'OCAÑA', 22),
(847, 'PAMPLONA', 22),
(848, 'PAMPLONITA', 22),
(849, 'PUERTO SANTANDER', 22),
(850, 'RAGONVALIA', 22),
(851, 'SALAZAR', 22),
(852, 'SAN CALIXTO', 22),
(853, 'SAN CAYETANO', 22),
(854, 'SANTIAGO', 22),
(855, 'SARDINATA', 22),
(856, 'SILOS', 22),
(857, 'TEORAMA', 22),
(858, 'TIBÚ', 22),
(859, 'TOLEDO', 22),
(860, 'VILLA CARO', 22),
(861, 'VILLA DEL ROSARIO', 22),
(862, 'COLÓN', 23),
(863, 'MOCOA', 23),
(864, 'ORITO', 23),
(865, 'PUERTO ASÍS', 23),
(866, 'PUERTO CAYCEDO', 23),
(867, 'PUERTO GUZMÁN', 23),
(868, 'PUERTO LEGUÍZAMO', 23),
(869, 'SAN FRANCISCO', 23),
(870, 'SAN MIGUEL', 23),
(871, 'SANTIAGO', 23),
(872, 'SIBUNDOY', 23),
(873, 'VALLE DEL GUAMUEZ', 23),
(874, 'VILLAGARZÓN', 23),
(875, 'ARMENIA', 24),
(876, 'BUENAVISTA', 24),
(877, 'CALARCÁ', 24),
(878, 'CIRCASIA', 24),
(879, 'CÓRDOBA', 24),
(880, 'FILANDIA', 24),
(881, 'GÉNOVA', 24),
(882, 'LA TEBAIDA', 24),
(883, 'MONTENEGRO', 24),
(884, 'PIJAO', 24),
(885, 'QUIMBAYA', 24),
(886, 'SALENTO', 24),
(887, 'APIA', 25),
(888, 'BALBOA', 25),
(889, 'BELÉN DE UMBRÍA', 25),
(890, 'DOS QUEBRADAS', 25),
(891, 'GUATICA', 25),
(892, 'LA CELIA', 25),
(893, 'LA VIRGINIA', 25),
(894, 'MARSELLA', 25),
(895, 'MISTRATO', 25),
(896, 'PEREIRA', 25),
(897, 'PUEBLO RICO', 25),
(898, 'QUINCHÍA', 25),
(899, 'SANTA ROSA DE CABAL', 25),
(900, 'SANTUARIO', 25),
(901, 'PROVIDENCIA', 26),
(902, 'SAN ANDRES', 26),
(903, 'SANTA CATALINA', 26),
(904, 'AGUADA', 27),
(905, 'ALBANIA', 27),
(906, 'ARATOCA', 27),
(907, 'BARBOSA', 27),
(908, 'BARICHARA', 27),
(909, 'BARRANCABERMEJA', 27),
(910, 'BETULIA', 27),
(911, 'BOLÍVAR', 27),
(912, 'BUCARAMANGA', 27),
(913, 'CABRERA', 27),
(914, 'CALIFORNIA', 27),
(915, 'CAPITANEJO', 27),
(916, 'CARCASI', 27),
(917, 'CEPITA', 27),
(918, 'CERRITO', 27),
(919, 'CHARALÁ', 27),
(920, 'CHARTA', 27),
(921, 'CHIMA', 27),
(922, 'CHIPATÁ', 27),
(923, 'CIMITARRA', 27),
(924, 'CONCEPCIÓN', 27),
(925, 'CONFINES', 27),
(926, 'CONTRATACIÓN', 27),
(927, 'COROMORO', 27),
(928, 'CURITÍ', 27),
(929, 'EL CARMEN', 27),
(930, 'EL GUACAMAYO', 27),
(931, 'EL PEÑÓN', 27),
(932, 'EL PLAYÓN', 27),
(933, 'ENCINO', 27),
(934, 'ENCISO', 27),
(935, 'FLORIÁN', 27),
(936, 'FLORIDABLANCA', 27),
(937, 'GALÁN', 27),
(938, 'GAMBITA', 27),
(939, 'GIRÓN', 27),
(940, 'GUACA', 27),
(941, 'GUADALUPE', 27),
(942, 'GUAPOTA', 27),
(943, 'GUAVATÁ', 27),
(944, 'GUEPSA', 27),
(945, 'HATO', 27),
(946, 'JESÚS MARIA', 27),
(947, 'JORDÁN', 27),
(948, 'LA BELLEZA', 27),
(949, 'LA PAZ', 27),
(950, 'LANDAZURI', 27),
(951, 'LEBRIJA', 27),
(952, 'LOS SANTOS', 27),
(953, 'MACARAVITA', 27),
(954, 'MÁLAGA', 27),
(955, 'MATANZA', 27),
(956, 'MOGOTES', 27),
(957, 'MOLAGAVITA', 27),
(958, 'OCAMONTE', 27),
(959, 'OIBA', 27),
(960, 'ONZAGA', 27),
(961, 'PALMAR', 27),
(962, 'PALMAS DEL SOCORRO', 27),
(963, 'PÁRAMO', 27),
(964, 'PIEDECUESTA', 27),
(965, 'PINCHOTE', 27),
(966, 'PUENTE NACIONAL', 27),
(967, 'PUERTO PARRA', 27),
(968, 'PUERTO WILCHES', 27),
(969, 'RIONEGRO', 27),
(970, 'SABANA DE TORRES', 27),
(971, 'SAN ANDRÉS', 27),
(972, 'SAN BENITO', 27),
(973, 'SAN GIL', 27),
(974, 'SAN JOAQUÍN', 27),
(975, 'SAN JOSÉ DE MIRANDA', 27),
(976, 'SAN MIGUEL', 27),
(977, 'SAN VICENTE DE CHUCURÍ', 27),
(978, 'SANTA BÁRBARA', 27),
(979, 'SANTA HELENA', 27),
(980, 'SIMACOTA', 27),
(981, 'SOCORRO', 27),
(982, 'SUAITA', 27),
(983, 'SUCRE', 27),
(984, 'SURATA', 27),
(985, 'TONA', 27),
(986, 'VALLE SAN JOSÉ', 27),
(987, 'VÉLEZ', 27),
(988, 'VETAS', 27),
(989, 'VILLANUEVA', 27),
(990, 'ZAPATOCA', 27),
(991, 'BUENAVISTA', 28),
(992, 'CAIMITO', 28),
(993, 'CHALÁN', 28),
(994, 'COLOSO', 28),
(995, 'COROZAL', 28),
(996, 'EL ROBLE', 28),
(997, 'GALERAS', 28),
(998, 'GUARANDA', 28),
(999, 'LA UNIÓN', 28),
(1000, 'LOS PALMITOS', 28),
(1001, 'MAJAGUAL', 28),
(1002, 'MORROA', 28),
(1003, 'OVEJAS', 28),
(1004, 'PALMITO', 28),
(1005, 'SAMPUES', 28),
(1006, 'SAN BENITO ABAD', 28),
(1007, 'SAN JUAN DE BETULIA', 28),
(1008, 'SAN MARCOS', 28),
(1009, 'SAN ONOFRE', 28),
(1010, 'SAN PEDRO', 28),
(1011, 'SINCÉ', 28),
(1012, 'SINCELEJO', 28),
(1013, 'SUCRE', 28),
(1014, 'TOLÚ', 28),
(1015, 'TOLUVIEJO', 28),
(1016, 'ALPUJARRA', 29),
(1017, 'ALVARADO', 29),
(1018, 'AMBALEMA', 29),
(1019, 'ANZOATEGUI', 29),
(1020, 'ARMERO (GUAYABAL)', 29),
(1021, 'ATACO', 29),
(1022, 'CAJAMARCA', 29),
(1023, 'CARMEN DE APICALÁ', 29),
(1024, 'CASABIANCA', 29),
(1025, 'CHAPARRAL', 29),
(1026, 'COELLO', 29),
(1027, 'COYAIMA', 29),
(1028, 'CUNDAY', 29),
(1029, 'DOLORES', 29),
(1030, 'ESPINAL', 29),
(1031, 'FALÁN', 29),
(1032, 'FLANDES', 29),
(1033, 'FRESNO', 29),
(1034, 'GUAMO', 29),
(1035, 'HERVEO', 29),
(1036, 'HONDA', 29),
(1037, 'IBAGUÉ', 29),
(1038, 'ICONONZO', 29),
(1039, 'LÉRIDA', 29),
(1040, 'LÍBANO', 29),
(1041, 'MARIQUITA', 29),
(1042, 'MELGAR', 29),
(1043, 'MURILLO', 29),
(1044, 'NATAGAIMA', 29),
(1045, 'ORTEGA', 29),
(1046, 'PALOCABILDO', 29),
(1047, 'PIEDRAS PLANADAS', 29),
(1048, 'PRADO', 29),
(1049, 'PURIFICACIÓN', 29),
(1050, 'RIOBLANCO', 29),
(1051, 'RONCESVALLES', 29),
(1052, 'ROVIRA', 29),
(1053, 'SALDAÑA', 29),
(1054, 'SAN ANTONIO', 29),
(1055, 'SAN LUIS', 29),
(1056, 'SANTA ISABEL', 29),
(1057, 'SUÁREZ', 29),
(1058, 'VALLE DE SAN JUAN', 29),
(1059, 'VENADILLO', 29),
(1060, 'VILLAHERMOSA', 29),
(1061, 'VILLARRICA', 29),
(1062, 'ALCALÁ', 30),
(1063, 'ANDALUCÍA', 30),
(1064, 'ANSERMA NUEVO', 30),
(1065, 'ARGELIA', 30),
(1066, 'BOLÍVAR', 30),
(1067, 'BUENAVENTURA', 30),
(1068, 'BUGA', 30),
(1069, 'BUGALAGRANDE', 30),
(1070, 'CAICEDONIA', 30),
(1071, 'CALI', 30),
(1072, 'CALIMA (DARIEN)', 30),
(1073, 'CANDELARIA', 30),
(1074, 'CARTAGO', 30),
(1075, 'DAGUA', 30),
(1076, 'EL AGUILA', 30),
(1077, 'EL CAIRO', 30),
(1078, 'EL CERRITO', 30),
(1079, 'EL DOVIO', 30),
(1080, 'FLORIDA', 30),
(1081, 'GINEBRA GUACARI', 30),
(1082, 'JAMUNDÍ', 30),
(1083, 'LA CUMBRE', 30),
(1084, 'LA UNIÓN', 30),
(1085, 'LA VICTORIA', 30),
(1086, 'OBANDO', 30),
(1087, 'PALMIRA', 30),
(1088, 'PRADERA', 30),
(1089, 'RESTREPO', 30),
(1090, 'RIO FRÍO', 30),
(1091, 'ROLDANILLO', 30),
(1092, 'SAN PEDRO', 30),
(1093, 'SEVILLA', 30),
(1094, 'TORO', 30),
(1095, 'TRUJILLO', 30),
(1096, 'TULÚA', 30),
(1097, 'ULLOA', 30),
(1098, 'VERSALLES', 30),
(1099, 'VIJES', 30),
(1100, 'YOTOCO', 30),
(1101, 'YUMBO', 30),
(1102, 'ZARZAL', 30),
(1103, 'CARURÚ', 31),
(1104, 'MITÚ', 31),
(1105, 'PACOA', 31),
(1106, 'PAPUNAUA', 31),
(1107, 'TARAIRA', 31),
(1108, 'YAVARATÉ', 31),
(1109, 'CUMARIBO', 32),
(1110, 'LA PRIMAVERA', 32),
(1111, 'PUERTO CARREÑO', 32),
(1112, 'SANTA ROSALIA', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE `correos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` enum('programado','prioritario') NOT NULL DEFAULT 'prioritario',
  `fecha_programada` date DEFAULT NULL,
  `estado` enum('pendiente','enviado','cancelado') NOT NULL DEFAULT 'pendiente',
  `titulo` varchar(150) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `boton` enum('si','no') NOT NULL DEFAULT 'no',
  `texto_boton` varchar(20) DEFAULT NULL,
  `url_boton` text,
  `plantilla_correo_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id`, `tipo`, `fecha_programada`, `estado`, `titulo`, `mensaje`, `boton`, `texto_boton`, `url_boton`, `plantilla_correo_id`, `created_at`, `updated_at`) VALUES
(1, 'prioritario', NULL, 'pendiente', 'Estimad@ MARTHA ELISA MELO AVILA', 'Fuxión le informa que su pedido con número de factura <strong>72316410</strong>ha cambiadao su estado a "pedido en cola".', 'no', NULL, NULL, 2, '2017-10-26 16:04:01', '2017-10-26 16:04:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes`
--

CREATE TABLE `cortes` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL,
  `estado` enum('transmitido','enviado') NOT NULL DEFAULT 'transmitido',
  `guias_asignadas` enum('si','no') NOT NULL DEFAULT 'no',
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cortes`
--

INSERT INTO `cortes` (`id`, `numero`, `estado`, `guias_asignadas`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 1, 'transmitido', 'no', 11, '2017-10-30 16:19:50', '2017-10-30 16:19:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `pais_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `pais_id`) VALUES
(1, 'AMAZONAS', 1),
(2, 'ANTIOQUIA', 1),
(3, 'ARAUCA', 1),
(4, 'ATLÁNTICO', 1),
(5, 'BOLÍVAR', 1),
(6, 'BOYACÁ', 1),
(7, 'CALDAS', 1),
(8, 'CAQUETÁ', 1),
(9, 'CASANARE', 1),
(10, 'CAUCA', 1),
(11, 'CESAR', 1),
(12, 'CHOCÓ', 1),
(13, 'CÓRDOBA', 1),
(14, 'CUNDINAMARCA', 1),
(15, 'GUAINÍA', 1),
(16, 'GUAVIARE', 1),
(17, 'HUILA', 1),
(18, 'LA GUAJIRA', 1),
(19, 'MAGDALENA', 1),
(20, 'META', 1),
(21, 'NARIÑO', 1),
(22, 'NORTE DE SANTANDER', 1),
(23, 'PUTUMAYO', 1),
(24, 'QUINDÍO', 1),
(25, 'RISARALDA', 1),
(26, 'SAN ANDRÉS Y ROVIDENCIA', 1),
(27, 'SANTANDER', 1),
(28, 'SUCRE', 1),
(29, 'TOLIMA', 1),
(30, 'VALLE DEL CAUCA', 1),
(31, 'VAUPÉS', 1),
(32, 'VICHADA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresarios`
--

CREATE TABLE `empresarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `kit` enum('si','no') NOT NULL DEFAULT 'no',
  `direccion` varchar(250) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `empresario_id` int(10) UNSIGNED DEFAULT NULL,
  `enroler_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresarios`
--

INSERT INTO `empresarios` (`id`, `tipo`, `kit`, `direccion`, `ciudad`, `departamento`, `empresario_id`, `enroler_id`, `user_id`, `created_at`, `updated_at`) VALUES
(99, 'FuXion Independent Entrepreneur', 'si', 'Carrera 30 # 46-32 Apto 101 Barrio La Grama - Vill', 'VILLAVICENCIO', 'MET', 224401, 63210, 110, '2017-10-24 23:36:24', '2017-10-24 23:36:24'),
(100, 'FuXion Independent Entrepreneur', 'si', 'TRANSVERSAL 9B # 34- 246  URBANIZACION EL BOSQUE MAMATOCO|URBANIZACION EL BOSQUE MAMATOCO', 'SANTA MARTA', 'MAG', 849557, 817615, 111, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(101, 'FuXion Independent Entrepreneur', 'no', 'calle 22b No 63 24', 'BOGOTA', 'CUN', 615502, 605930, 112, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(102, 'FuXion Independent Entrepreneur', 'no', 'cra 7A N 17-84 APTO 401 BARRIO SIRATA', 'DUITAMA', 'BOY', 339377, 324693, 113, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(103, 'FuXion Independent Entrepreneur', 'si', 'CL 14A # 69 141', 'CALI', 'VAC', 849692, 842504, 114, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(104, 'FuXion Independent Entrepreneur', 'si', 'CRA 3 NÂº 45 - 36 EDIFICIO PORTO CASTELLO APTO 709 BARRIO: EL CABRERO', 'CARTAGENA', 'BOL', 849707, 848654, 115, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(105, 'FuXion Independent Entrepreneur', 'si', 'Barrio Mirador de la Bahia  Manzana O  Bloque 11', 'CARTAGENA', 'BOL', 756401, 512869, 116, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(106, 'Preferred Customer', 'no', 'Calle 34 # 44 - 55 Barrio Alicanto', 'PALMIRA', 'VAC', 837365, 788525, 117, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(107, 'FuXion Independent Entrepreneur', 'no', 'CARRERA 6 # 13C-30 CAÃ‘AHUATE', 'VALLEDUPAR', 'CES', 827144, 720091, 118, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(108, 'FuXion Independent Entrepreneur', 'no', 'Urbanizacion Terraza Calicanto Sector 1 Torre 4 Apto 605', 'CARTAGENA', 'BOL', 841281, 841238, 119, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(109, 'FuXion Independent Entrepreneur', 'no', 'colores de la villa bloque habano casa 8', 'PEREIRA', 'RIS', 308563, 308553, 120, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(110, 'FuXion Independent Entrepreneur', 'no', 'Carrera 55#91-45 casa ', 'BARRANQUILLA', 'ATL', 613739, 611944, 121, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(111, 'FuXion Independent Entrepreneur', 'no', 'CARRERA 7A NO 29-104 - TAMINAKA', 'SANTA MARTA', 'MAG', 206388, 204301, 122, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(112, 'FuXion Independent Entrepreneur', 'no', 'CALLE 5 No. 7 - 29', 'RIOHACHA', 'LAG', 619479, 615065, 123, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(113, 'FuXion Independent Entrepreneur', 'si', 'Kilometro 17 via las palmas|mall indiana local 156 ', 'ENVIGADO', 'ANT', 849758, 847500, 124, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(114, 'FuXion Independent Entrepreneur', 'no', 'transversal9b#34-246 urbanizacion el bosque mamatoco', 'SANTA MARTA', 'MAG', 817615, 206388, 125, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(115, 'FuXion Independent Entrepreneur', 'no', 'calle 14c NÂ° 19-39 | barrio las flores', 'VALLEDUPAR', 'CES', 445765, 431973, 126, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(116, 'FuXion Independent Entrepreneur', 'si', 'CALLE 40 # 1A- 45', 'TUNJA', 'BOY', 849453, 25446, 127, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(117, 'FuXion Independent Entrepreneur', 'no', 'Calle 11A # 45-25 Villa JardÃ­n Bloque 1 Apto 302', 'MANIZALES', 'CAL', 423590, 423526, 128, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(118, 'FuXion Independent Entrepreneur', 'no', 'Carrera 13 #106-30 Apto305 Interior2 Ed.Tenerife', 'BOGOTA', 'CUN', 28244, 26475, 129, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(119, 'FuXion Independent Entrepreneur', 'no', 'Carrera 13#106-30 apt 305 Int.2', 'BOGOTA', 'CUN', 129339, 28244, 130, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(120, 'FuXion Independent Entrepreneur', 'si', 'Carrera 13 A # 7B - 39 San Carlos', 'VALLEDUPAR', 'CES', 775421, 770070, 131, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(121, 'FuXion Independent Entrepreneur', 'si', 'Calle 30 #5-88 - Manzanares', 'SANTA MARTA', 'MAG', 808758, 206388, 132, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(122, 'FuXion Independent Entrepreneur', 'no', 'Calle 100 Cra 7 # 100-42 Barrio el portal. ', 'MONTERIA', 'COR', 700432, 687500, 133, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(123, 'FuXion Independent Entrepreneur', 'si', 'Carrera 4, 73-80 apartamento 302 edificio Saint George|Barrio de Rosales', 'BOGOTA', 'CUN', 849315, 835099, 134, '2017-10-24 23:32:01', '2017-10-24 23:32:01'),
(124, 'FuXion Independent Entrepreneur', 'no', 'AV KRA 72 # 24B-34 TORRE 2 APTO 901 | Gran Reserva de Navarra', 'BOGOTA', 'CUN', 420026, 112188, 135, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(125, 'FuXion Independent Entrepreneur', 'si', 'Cll 12 #58-13 apto 201 torre C prados de la castellana ', 'MONTERIA', 'COR', 784303, 777306, 136, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(126, 'FuXion Independent Entrepreneur', 'no', 'CALLE 17 #31-81  CASA 16  LA ARBOLEDA', 'PEREIRA', 'RIS', 373797, 301709, 137, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(127, 'FuXion Independent Entrepreneur', 'no', 'CARRERA 6 # 13C - 30 BARRIO CAÃ‘AHUATE', 'VALLEDUPAR', 'CES', 821160, 798732, 138, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(128, 'FuXion Independent Entrepreneur', 'no', 'canarias manzana4 casa57 etapa1', 'SANTA MARTA', 'MAG', 832112, 752268, 139, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(129, 'FuXion Independent Entrepreneur', 'si', 'Calle 8 # 11 - 01 Conjunto Quintas de Celta, I Etapa - Casa 103 ', 'FUNZA', 'CUN', 784401, 774931, 140, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(130, 'Preferred Customer', 'no', 'Cra 31 N. 27-18|Calle peatonal', 'URRAO', 'ANT', 842843, 803094, 141, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(131, 'FuXion Independent Entrepreneur', 'no', 'CALLE 5 G # 38 - 06|CASA BLANCA', 'VALLEDUPAR', 'CES', 841326, 821160, 142, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(132, 'FuXion Independent Entrepreneur', 'si', 'CALLE 18 B SUR # 38 54 APTO 12 04  Unidad portÃ³n del campestre', 'MEDELLIN', 'ANT', 796435, 112188, 143, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(133, 'FuXion Independent Entrepreneur', 'no', 'calle 32 #  12-23 las americas', 'SANTA MARTA', 'MAG', 670689, 659041, 144, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(134, 'FuXion Independent Entrepreneur', 'no', 'carrera 6 numero 9-49 conjunto residencial iberica bloque 2 apartamento 101', 'ARMENIA', 'QUI', 700954, 675996, 145, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(135, 'FuXion Independent Entrepreneur', 'no', 'TRANSVERSAL 9B # 34-246|URBANIZACION EL BOSQUE MAMATOCO', 'SANTA MARTA', 'MAG', 849481, 817615, 146, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(136, 'FuXion Independent Entrepreneur', 'no', 'Carrera 86c #53c - 41 apt 903', 'MEDELLIN', 'ANT', 640694, 565830, 147, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(137, 'Preferred Customer', 'no', 'Calle 29 N 6-26 Hotel Casa Real ', 'MONTERIA', 'COR', 846912, 826645, 148, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(138, 'FuXion Independent Entrepreneur', 'no', 'Calle 64 #22-56 Barrio El Parnaso', 'BARRANCABERMEJA', 'SAN', 181119, 164219, 149, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(139, 'FuXion Independent Entrepreneur', 'no', 'calle 6 #2-11 barrio la coquera', 'MONTERIA', 'COR', 688021, 687500, 150, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(140, 'FuXion Independent Entrepreneur', 'no', 'CR 15 #31-50 AP 902 CONJUNTO PLAZA CENTRAL', 'BOGOTA', 'CUN', 813589, 672574, 151, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(141, 'FuXion Independent Entrepreneur', 'no', 'TRANSVERSAL 77 # 162-08 T 2 APT 501', 'BOGOTA', 'CUN', 480658, 129207, 152, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(142, 'FuXion Independent Entrepreneur', 'no', 'cr43 No 95A 148 casa 18', 'BARRANQUILLA', 'ATL', 832227, 57430, 153, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(143, 'FuXion Independent Entrepreneur', 'no', 'Manzana I Casa 15 Barrio Villa Maria|Casa de rejas blancas', 'GUAMAL', 'MET', 848720, 846643, 154, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(144, 'FuXion Independent Entrepreneur', 'si', 'CARRERA 13 A No 7B -39 SAN CARLOS ', 'VALLEDUPAR', 'CES', 772748, 768121, 155, '2017-10-24 23:36:25', '2017-10-24 23:36:25'),
(145, 'FuXion Independent Entrepreneur', 'no', 'CALLE 46 #64-48 EL CISNE|CONJUNTO PARQUES DE BOLIVAR II ETAPA, TORRE 20 APARTAMENTO 103', 'SANTA MARTA', 'MAG', 840270, 832112, 156, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(146, 'FuXion Independent Entrepreneur', 'no', 'carrera 7 no 40-59 yopal', 'YOPAL', 'CAS', 831121, 196115, 157, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(147, 'FuXion Independent Entrepreneur', 'no', 'cra 81 # 31 - 64 Urbanizacion los alamos, Barrio el Recreo, Sector  El Eden', 'CARTAGENA', 'BOL', 841238, 543439, 158, '2017-10-24 23:22:35', '2017-10-24 23:22:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_operadores_logisticos`
--

CREATE TABLE `estados_operadores_logisticos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `notificacion_push` enum('si','no') NOT NULL DEFAULT 'no',
  `notificacion_correo` enum('si','no') DEFAULT 'no',
  `cambio_estado_pedido_id` int(10) UNSIGNED DEFAULT NULL,
  `plantilla_correo_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_pedidos`
--

CREATE TABLE `estados_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `notificacion_push` enum('si','no') NOT NULL DEFAULT 'no',
  `notificacion_correo` enum('si','no') NOT NULL DEFAULT 'no',
  `no_asignacion_corte` enum('si','no') NOT NULL DEFAULT 'no',
  `asignacion_corte` enum('si','no') NOT NULL DEFAULT 'no',
  `plantilla_correo_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados_pedidos`
--

INSERT INTO `estados_pedidos` (`id`, `nombre`, `descripcion`, `notificacion_push`, `notificacion_correo`, `no_asignacion_corte`, `asignacion_corte`, `plantilla_correo_id`, `created_at`, `updated_at`) VALUES
(8, 'Pendiente', 'Pedido pendiente por kit o flete', 'si', 'si', 'si', 'no', 1, '2017-10-24 20:15:34', '2017-10-24 20:15:34'),
(9, 'En cola', 'Pedido en cola con corte', 'si', 'no', 'no', 'si', NULL, '2017-10-24 20:16:06', '2017-10-24 20:16:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `identificador` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`id`, `nombre`, `identificador`, `created_at`, `updated_at`) VALUES
(3, 'Crear', 1, '2017-09-01 00:32:36', '2017-09-01 00:32:36'),
(4, 'Editar', 2, '2017-09-01 00:32:44', '2017-09-01 00:32:44'),
(5, 'Eliminar', 3, '2017-09-01 00:32:54', '2017-09-01 00:32:54'),
(6, 'Ver', 4, '2017-09-01 00:32:59', '2017-09-01 00:32:59'),
(7, 'Uploads', 5, '2017-09-11 20:32:03', '2017-09-11 20:32:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias`
--

CREATE TABLE `guias` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(150) DEFAULT NULL,
  `estado` enum('registrada','enviada','entregada') NOT NULL DEFAULT 'registrada',
  `malla_cobertura_id` int(10) UNSIGNED NOT NULL,
  `operador_logistico_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `guias`
--

INSERT INTO `guias` (`id`, `numero`, `estado`, `malla_cobertura_id`, `operador_logistico_id`, `created_at`, `updated_at`) VALUES
(81, NULL, 'registrada', 2, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(82, NULL, 'registrada', 3, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(83, NULL, 'registrada', 4, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(84, NULL, 'registrada', 4, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(85, NULL, 'registrada', 5, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(86, NULL, 'registrada', 7, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(87, NULL, 'registrada', 8, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(88, NULL, 'registrada', 5, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(89, NULL, 'registrada', 9, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(90, NULL, 'registrada', 9, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(91, NULL, 'registrada', 10, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(92, NULL, 'registrada', 11, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(93, NULL, 'registrada', 1, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19'),
(94, NULL, 'registrada', 8, 1, '2017-10-30 16:20:19', '2017-10-30 16:20:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias_pedidos`
--

CREATE TABLE `guias_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `guia_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `foto_1` int(10) UNSIGNED DEFAULT NULL,
  `foto_2` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_pedidos`
--

CREATE TABLE `historial_estados_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `estado_pedido_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `historial_estados_pedidos`
--

INSERT INTO `historial_estados_pedidos` (`id`, `pedido_id`, `estado_pedido_id`, `created_at`, `updated_at`) VALUES
(217, 325, 9, '2017-10-30 16:19:53', NULL),
(218, 326, 8, '2017-10-30 16:19:53', NULL),
(219, 327, 8, '2017-10-30 16:19:53', NULL),
(220, 328, 8, '2017-10-30 16:19:53', NULL),
(221, 329, 8, '2017-10-30 16:19:53', NULL),
(222, 330, 9, '2017-10-30 16:19:53', NULL),
(223, 331, 8, '2017-10-30 16:19:53', NULL),
(224, 332, 9, '2017-10-30 16:19:53', NULL),
(225, 333, 9, '2017-10-30 16:19:53', NULL),
(226, 334, 8, '2017-10-30 16:19:53', NULL),
(227, 335, 8, '2017-10-30 16:19:53', NULL),
(228, 336, 8, '2017-10-30 16:19:53', NULL),
(229, 337, 8, '2017-10-30 16:19:53', NULL),
(230, 338, 9, '2017-10-30 16:19:53', NULL),
(231, 339, 8, '2017-10-30 16:19:53', NULL),
(232, 340, 8, '2017-10-30 16:19:53', NULL),
(233, 341, 8, '2017-10-30 16:19:53', NULL),
(234, 342, 8, '2017-10-30 16:19:53', NULL),
(235, 343, 8, '2017-10-30 16:19:53', NULL),
(236, 344, 9, '2017-10-30 16:19:53', NULL),
(237, 345, 8, '2017-10-30 16:19:53', NULL),
(238, 346, 8, '2017-10-30 16:19:53', NULL),
(239, 347, 8, '2017-10-30 16:19:53', NULL),
(240, 348, 8, '2017-10-30 16:19:53', NULL),
(241, 349, 8, '2017-10-30 16:19:53', NULL),
(242, 350, 9, '2017-10-30 16:19:53', NULL),
(243, 351, 9, '2017-10-30 16:19:53', NULL),
(244, 352, 8, '2017-10-30 16:19:53', NULL),
(245, 353, 9, '2017-10-30 16:19:53', NULL),
(246, 354, 9, '2017-10-30 16:19:53', NULL),
(247, 355, 8, '2017-10-30 16:19:53', NULL),
(248, 356, 9, '2017-10-30 16:19:53', NULL),
(249, 357, 8, '2017-10-30 16:19:53', NULL),
(250, 358, 8, '2017-10-30 16:19:53', NULL),
(251, 359, 8, '2017-10-30 16:19:53', NULL),
(252, 360, 9, '2017-10-30 16:19:53', NULL),
(253, 361, 8, '2017-10-30 16:19:53', NULL),
(254, 362, 8, '2017-10-30 16:19:53', NULL),
(255, 363, 9, '2017-10-30 16:19:53', NULL),
(256, 364, 8, '2017-10-30 16:19:53', NULL),
(257, 365, 8, '2017-10-30 16:19:53', NULL),
(258, 366, 8, '2017-10-30 16:19:53', NULL),
(259, 367, 8, '2017-10-30 16:19:53', NULL),
(260, 368, 8, '2017-10-30 16:19:53', NULL),
(261, 369, 8, '2017-10-30 16:19:53', NULL),
(262, 370, 8, '2017-10-30 16:19:53', NULL),
(263, 371, 8, '2017-10-30 16:19:53', NULL),
(264, 372, 8, '2017-10-30 16:19:53', NULL),
(265, 373, 8, '2017-10-30 16:19:53', NULL),
(266, 374, 8, '2017-10-30 16:19:53', NULL),
(267, 375, 9, '2017-10-30 16:19:53', NULL),
(268, 376, 8, '2017-10-30 16:19:53', NULL),
(269, 377, 8, '2017-10-30 16:19:53', NULL),
(270, 378, 8, '2017-10-30 16:19:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kit_empresarios`
--

CREATE TABLE `kit_empresarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `inicio` int(10) UNSIGNED NOT NULL,
  `fin` int(10) UNSIGNED NOT NULL,
  `excepciones` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `kit_empresarios`
--

INSERT INTO `kit_empresarios` (`id`, `inicio`, `fin`, `excepciones`, `created_at`, `updated_at`) VALUES
(1, 224401, 224401, NULL, '2017-10-24 23:36:00', '2017-10-24 23:36:00'),
(2, 756401, 808758, '808000_808055', '2017-10-24 23:36:00', '2017-10-24 23:36:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mallas_cobertura`
--

CREATE TABLE `mallas_cobertura` (
  `id` int(10) UNSIGNED NOT NULL,
  `origen` varchar(150) NOT NULL,
  `destino` varchar(150) NOT NULL,
  `tiempo_entrega` int(10) UNSIGNED NOT NULL,
  `operador_logistico_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mallas_cobertura`
--

INSERT INTO `mallas_cobertura` (`id`, `origen`, `destino`, `tiempo_entrega`, `operador_logistico_id`, `created_at`, `updated_at`) VALUES
(1, 'BOGOTA', 'MEDELLIN', 3, 1, '2017-10-25 18:56:15', '2017-10-25 18:56:15'),
(2, 'BOGOTA', 'VILLAVICENCIO', 4, 1, '2017-10-25 18:56:48', '2017-10-25 18:56:48'),
(3, 'BOGOTA', 'CALI', 3, 1, '2017-10-25 19:00:32', '2017-10-25 19:00:32'),
(4, 'BOGOTA', 'CARTAGENA', 4, 1, '2017-10-25 19:00:56', '2017-10-25 19:00:56'),
(5, 'BOGOTA', 'SANTA MARTA', 4, 1, '2017-10-25 19:01:35', '2017-10-25 19:01:35'),
(7, 'BOGOTA', 'ENVIGADO', 2, 1, '2017-10-25 19:04:10', '2017-10-25 19:04:10'),
(8, 'BOGOTA', 'VALLEDUPAR', 3, 1, '2017-10-25 19:23:10', '2017-10-25 19:23:10'),
(9, 'BOGOTA', 'BOGOTA', 1, 1, '2017-10-25 19:23:24', '2017-10-25 19:23:24'),
(10, 'BOGOTA', 'MONTERIA', 3, 1, '2017-10-25 19:23:38', '2017-10-25 19:23:38'),
(11, 'BOGOTA', 'FUNZA', 3, 1, '2017-10-25 19:23:51', '2017-10-25 19:23:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_11_155458_create_sessions_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `identificador` int(11) NOT NULL,
  `etiqueta` varchar(150) NOT NULL,
  `url` varchar(150) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `identificador`, `etiqueta`, `url`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Módulos y funciones', 1, 'Módulos y funciones', '/modulos-funciones', 'Activo', '2017-08-31 20:02:23', '2017-09-01 01:02:23'),
(2, 'Roles', 2, 'Roles', '/rol', 'Activo', '2017-09-01 01:04:57', '2017-09-01 01:04:57'),
(3, 'Usuarios', 3, 'Usuarios', '/usuario', 'Activo', '2017-09-01 01:05:19', '2017-09-01 01:05:19'),
(4, 'Cortes', 4, 'Cortes', '/corte', 'Activo', '2017-10-18 19:27:48', '2017-10-18 19:27:48'),
(5, 'Bodega', 5, 'Bodega', '/bodega', 'Activo', '2017-10-17 13:45:52', '2017-10-17 13:45:52'),
(6, 'Empresario', 6, 'Empresario', '/empresario', 'Activo', '2017-10-17 21:59:18', '2017-10-17 21:59:18'),
(7, 'Operadores logisticos', 7, 'Operadores logísticos', '/operador-logistico', 'Activo', '2017-10-20 14:13:26', '2017-10-20 14:13:26'),
(8, 'Malla cobertura', 8, 'Malla de cobertura', '/malla-cobertura', 'Activo', '2017-10-20 23:03:07', '2017-10-20 23:03:07'),
(9, 'Plantillas de correo', 9, 'Plantillas de correo', '/plantilla-correo', 'Activo', '2017-10-23 14:26:10', '2017-10-23 14:26:10'),
(10, 'Estados de pedidos', 10, 'Estados de pedidos', '/estado-pedido', 'Activo', '2017-10-23 18:01:19', '2017-10-23 18:01:19'),
(11, 'Estados de operadores logisticos', 11, 'Estados de operadores logísticos', '/estado-operador-logistico', 'Activo', '2017-10-23 20:12:31', '2017-10-23 20:12:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos_funciones`
--

CREATE TABLE `modulos_funciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `modulo_id` int(10) UNSIGNED NOT NULL,
  `funcion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulos_funciones`
--

INSERT INTO `modulos_funciones` (`id`, `modulo_id`, `funcion_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 2, 3),
(6, 2, 4),
(7, 2, 5),
(8, 2, 6),
(9, 3, 3),
(11, 3, 5),
(12, 3, 6),
(13, 4, 3),
(15, 4, 5),
(16, 4, 6),
(18, 3, 4),
(19, 4, 7),
(20, 5, 3),
(21, 5, 4),
(22, 5, 6),
(23, 6, 3),
(24, 6, 4),
(25, 6, 5),
(26, 6, 6),
(27, 6, 7),
(28, 7, 3),
(29, 7, 4),
(30, 7, 6),
(31, 7, 5),
(32, 8, 3),
(33, 8, 4),
(34, 8, 5),
(35, 8, 7),
(36, 8, 6),
(37, 9, 3),
(38, 9, 4),
(39, 9, 5),
(40, 9, 6),
(41, 10, 3),
(42, 10, 4),
(43, 10, 5),
(44, 10, 6),
(45, 11, 3),
(46, 11, 4),
(47, 11, 5),
(48, 11, 6),
(49, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres_estados_operadores_logisticos`
--

CREATE TABLE `nombres_estados_operadores_logisticos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `operador_logistico_id` int(10) UNSIGNED NOT NULL,
  `estado_operador_logistico_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(3, 11, 'Prueba api', 'ohGN3IuuyFa48zsP6SxKsECFEQhbi24eKNodtEa2', 'http://192.168.0.101', 0, 1, 1, '2017-10-07 22:02:51', '2017-10-07 22:35:15'),
(5, 11, 'Prueba', 'MbjVKDcYpaLZBg8r2lcoUJN7fvinr4N0uv58mgoP', 'http://192.168.0.18:8000', 0, 1, 0, '2017-10-13 17:56:26', '2017-10-13 17:56:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2017-10-07 18:58:07', '2017-10-07 18:58:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('026282e3d0787e22f060233c0fc408afa79cbdd6b8f2080bd4ea26f3a01e3f9f7541132859150870', '7e99b84147740dad2932b7fa2b6d956b926bb7bf5794f4fa648af347cd58169fa7d6579a6cc9cd37', 0, '2018-10-13 14:03:34'),
('0f23529bf459925b2b98f755bd62d7bd054f215d0793c508b64245c8b3755ece7398f04a80b96237', 'ef7793566350f8fc70623a3ea0528c31a9426c6a4bcff21f53d58979b946363be5e47898f7b21821', 0, '2018-10-07 17:34:02'),
('247dbe2d7a01755d9f59c5860af3c33d17c570a82490c5c7742a63df21f5268069824789b5397ff5', '561ee8f033b8f8ac2f6e7e89cdee93c37242592a7d3593de14556e1779895c8f5166f8a06e01b20e', 0, '2018-10-13 14:45:57'),
('2cd61b99327ed237ea9aa3187eb2d43e3a7e25738d67203972b4a2da06c638e83f11f30fbc932d52', '694d39991fa9d064336bc28c92fe5734bab4b89593eba91e8794239496cd17c138780366f22b1039', 0, '2018-10-13 14:09:09'),
('3b78c6cab0a1f56e21ab768495cf6503f440e61b7f14ce88001d1eb03e6561b5d77900c0f2eec4e9', '636cb849597dc0942957eb345f226feb5a5ba16ccdba24320e424ff8b29d8a02de761c2b8a6ffcb5', 0, '2018-10-13 14:17:27'),
('4207e9b58695eb6583bf3a94fbd08544f91ebc8ad696d1da296b99fd971936b227cc033adb3d94e6', 'e50df7a7981d0459d65973d8acbe991c9b561895ea161b58e89b0c4ed69b1d9112c042daa2c4b16d', 0, '2018-10-13 14:13:51'),
('4e73b03686d6e001fffb5b4b87cd10a30424ecb49ef875a3979d9662a90a66a8e86de2a193a5ccb3', 'eee57c5a454adf3593f9655fd40c35dfe80bb544413ad2a14eb108dcfa8a11839ec2bc7696887ba8', 0, '2018-10-13 14:02:53'),
('67cccf30a91a2018bba8a4c957c97cdcd8007b1f86453c637f1e288aac819c03b558d45fcf56e0c7', 'b437eef59f8df28dd602ebef74f0e98e78d8e9d3f47280fc45c3675aafafbd3bf7dd43ac55cf4260', 0, '2018-10-13 14:04:16'),
('82ce62970612f715813bc3864c9e4f8ffaabea1d3bc28c2359177e3f4ec9ffeec2b98d2ec9ad51e6', '86e2b6bda2da7520c965fb05b6eaf4a7f014371197c745572e17c74c1ec43ffafff0d5e0d979a2d2', 0, '2018-10-13 14:03:03'),
('89294cde069c1730b3932e3ea96cd7ed9915b1e13a935dbf81539b8914c854f00efc35d21201266e', '9f0f0f2ad2a46fed47db981033fb01da3a4251bac80141fb4ba55a6a1ebf1f029789173309b3d04f', 0, '2018-10-13 14:59:44'),
('931fe4e7dfff2fe1d034df2f40e93cbd5952c3e5d28e63a6f8a4d2b8284231ac691797eb59ce1364', '9fd518d5893db58924ba1669e832debebf5a07044cc7e913fb3298349bbf032974547af1e9f3b2b8', 0, '2018-10-13 14:14:00'),
('9615adaf1c37248be6b3d2cac771fae462bc9f256ead8a393b6e681e5ca830e86af5b54008094898', '01170dfd7055ef05bc4e96cfa188810d5b89fea814d2a41ba59d649c4a93baf1676940cc2750b854', 0, '2018-10-13 13:01:10'),
('9bd039e40744f79f6f587ea132f5bd4c8eb9266d1171109941a070e6c52aebcc6401017a76151242', '44bf8ee6d0c7e07e18f0c4b0456e6976bd22634ac2acf80602ec1c459ea5c13c997175f0afe94740', 0, '2018-10-13 13:45:10'),
('9d48072c1f471b9aa656c85bb968badc1add5f55bae1f7d78d5cc4c829b8bbb27a877c9a5e380c36', '998803fc979ac0b85188a65ffbfe1c84a800ac95ecdfe1abe9063ed31dd494715f14b5d58caaee7f', 0, '2018-10-07 17:22:29'),
('a294032efb6eaef10f086829c066e6b00fa189c4885f2fd18eedcc166982a18317480cfe84b93753', '72b132ca085e5088db7bd5b895fd7fa195174e54a26922b8340c4833d08fd85517d3a5c8ef9155c4', 0, '2018-10-13 13:00:17'),
('a561e8f359434b47d776f5fb9c6d9b079a6bc98b158cba40018277544d3d31355860f1bbfd61fa88', '9825c06d9349605def39ab1cb79afa83c56e819fc5e4e982ad431a1b2888bc0661b89f9e5fdf9608', 0, '2018-10-13 14:03:20'),
('ac5e6dbafb3302af5e1dd8c4267016535acae50dd0e797cdccdc867f22e08bc3aff660c9d47d1f7d', '62bd1c658a968b83e1a772892038b5fff430ee5aa260616f2b319e23b2196b2ed5037fb7eace54f6', 0, '2018-10-13 13:59:03'),
('c15f3c69e6330c548939b117e1747264649375688640f3df9159a774ced86c66ec1b9504eea9142d', '7ebb700a512f656e8a652b12cd62fb5900ef0d864dde8b917ec0d21f579e29e2374c8ef3d106278d', 0, '2018-10-13 14:03:42'),
('ca53f238823508cee736a86245d5f605c0aaf86ec802df0b78e11be0b398ad2da9d58c3e18fea842', '05e5c9831a15bacd6ff04653525aa0078f5883bbfccec50bb2b852e411028b9f669dea076680ce14', 0, '2018-10-13 14:56:28'),
('d1e8479bf1c11e8e9a4c13fd2ac3b1060ddc642654180376b0acb430112f9fa9b99aa9ff5648e7d4', '5dff0388b98a06077a23ab44b7bbde3d390226a1421b2b0eff4da6586efed51cdb0ae40a2ff030c5', 0, '2018-10-13 14:30:53'),
('df021050dce19301480d3015263b4421c4a3892a4ebd9631425263248f3fadae1daf0a0dfaf588dd', '7fae4eb338f4c0f17c26dfb60fa305fdcef240f6440154c7ed0c87377715e666be761e9ca8f254eb', 0, '2018-10-13 14:11:51'),
('f23a43caf04e039ba169def4b979c8ce5fe06f7ff8db127cef9ba02475822246e35c9814919deb0b', '2b04d2d21858c3d1ee0779f3dae218f277f60dd40ed419438d40db247ec4e7c82ae569c29e8dbc56', 0, '2018-10-13 14:11:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operadores_logisticos`
--

CREATE TABLE `operadores_logisticos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `prefijo` varchar(20) DEFAULT NULL,
  `contacto` varchar(150) DEFAULT NULL,
  `ws` enum('si','no') NOT NULL DEFAULT 'no',
  `ubicacion_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `operadores_logisticos`
--

INSERT INTO `operadores_logisticos` (`id`, `nombre`, `prefijo`, `contacto`, `ws`, `ubicacion_id`, `created_at`, `updated_at`) VALUES
(1, 'Deprisa', 'DP', 'deprisa@deprisa.com', 'si', 2, '2017-10-25 18:56:08', '2017-10-25 18:56:08'),
(2, 'Servientrega', 'Sv', 'servientrega@servientrega.co', 'si', 3, '2017-10-25 21:07:48', '2017-10-25 21:07:48'),
(3, 'Domina', 'Dm', 'domina@domina.co', 'no', 4, '2017-10-25 21:08:32', '2017-10-25 21:08:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `nombre`, `codigo`) VALUES
(1, 'Colombia\r\n', '57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jlcapote@misena.edu.co', '$2y$10$2OZIowiDTxXwS6x/AoIw6u9pZKzVcicCKPiTZUA0D16ho8Y6Bov5a', '2017-10-11 23:38:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha_orden` timestamp NULL DEFAULT NULL,
  `fecha_impresion` timestamp NULL DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `impreso_por` varchar(150) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `costo_envio` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `descuento` double DEFAULT '0',
  `tipo_pago` varchar(150) DEFAULT NULL,
  `volumen_comisionable` double DEFAULT NULL,
  `empresario_id` int(10) UNSIGNED NOT NULL,
  `corte_id` int(10) UNSIGNED DEFAULT NULL,
  `bodega_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha_orden`, `fecha_impresion`, `serie`, `correlativo`, `orden_id`, `impreso_por`, `subtotal`, `total_tax`, `costo_envio`, `total`, `descuento`, `tipo_pago`, `volumen_comisionable`, `empresario_id`, `corte_id`, `bodega_id`, `created_at`, `updated_at`) VALUES
(325, '2017-04-10 12:05:30', '2017-04-10 12:13:25', 723, 16410, 4858931, 'admin', 301386.54, 57263.44, 15000, 373649.98, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 80, 99, 8, 1, '2017-10-30 16:19:50', '2017-10-30 16:20:19'),
(326, '2017-04-10 14:12:06', '2017-04-10 15:43:25', 723, 16411, 4859038, 'admin', 41428.57, 7871.43, 0, 49300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 100, NULL, 1, '2017-10-30 16:19:50', '2017-10-30 16:19:53'),
(327, '2017-04-10 17:03:55', '2017-04-10 17:10:09', 723, 16412, 4859638, 'co_porozco', 226039.9, 42947.58, 8000, 276987.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 101, NULL, 1, '2017-10-30 16:19:50', '2017-10-30 16:19:53'),
(328, '2017-04-10 13:18:19', '2017-04-10 17:43:25', 723, 16413, 4858976, 'admin', 80369.74, 15270.25, 15000, 110639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 102, NULL, 1, '2017-10-30 16:19:50', '2017-10-30 16:19:53'),
(329, '2017-04-10 18:25:14', '2017-04-10 18:43:25', 723, 16414, 4859991, 'admin', 41428.57, 7871.43, 0, 49300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 103, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(330, '2017-04-10 18:48:25', '2017-04-10 18:58:28', 723, 16415, 4860079, 'admin', 249989.49, 47498, 12000, 309487.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 66, 103, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(331, '2017-04-10 18:56:11', '2017-04-10 19:10:55', 723, 16416, 4860103, 'co_porozco', 41428.57, 7871.43, 0, 49300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 104, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(332, '2017-04-10 19:06:11', '2017-04-10 19:13:31', 723, 16417, 4860132, 'admin', 226039.9, 42947.58, 12000, 280987.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 105, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(333, '2017-04-10 19:06:30', '2017-04-10 19:13:34', 723, 16418, 4860133, 'admin', 226039.9, 42947.58, 12000, 280987.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 104, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(334, '2017-04-10 05:00:00', '2017-04-10 19:43:26', 723, 16419, 4859269, 'admin', 131638.65, 25011.34, 25000, 181649.99, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 26, 106, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(335, '2017-03-10 20:26:32', '2017-04-10 19:58:26', 723, 16420, 4857654, 'admin', 256355.04, 48707.46, 15000, 320062.5, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 64, 107, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(336, '2017-04-10 14:03:32', '2017-04-10 19:58:28', 723, 16421, 4859016, 'admin', 80369.74, 15270.25, 12000, 107639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 108, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(337, '2017-04-10 12:15:51', '2017-04-10 20:13:27', 723, 16422, 4858935, 'admin', 138117.65, 26242.35, 12000, 176360, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 34, 109, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(338, '2017-04-10 20:01:41', '2017-04-10 20:13:34', 723, 16423, 4860363, 'admin', 705829.82, 134107.66, 15000, 854937.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 113, 100, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(339, '2017-04-10 20:05:35', '2017-04-10 20:13:37', 723, 16424, 4860386, 'admin', 233571.42, 44378.57, 8000, 285949.99, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 62, 110, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(340, '2017-04-10 18:55:48', '2017-04-10 20:43:26', 723, 16425, 4860100, 'admin', 263014.68, 49972.79, 15000, 327987.47, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 111, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(341, '2017-04-10 19:29:10', '2017-04-10 20:43:28', 723, 16426, 4860217, 'admin', 226039.9, 42947.58, 25000, 293987.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 112, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(342, '2017-04-10 20:25:28', '2017-04-10 20:43:32', 723, 16427, 4860470, 'admin', 41428.57, 7871.43, 0, 49300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 113, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(343, '2017-04-10 20:48:20', '2017-04-10 20:58:36', 723, 16428, 4860568, 'admin', 301386.54, 57263.44, 15000, 373649.98, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 80, 114, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(344, '2017-04-10 21:06:48', '2017-04-10 21:13:28', 723, 16429, 4860676, 'admin', 437762.58, 83174.89, 12000, 532937.47, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 105, 113, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(345, '2017-04-10 14:15:00', '2017-04-10 21:28:29', 723, 16430, 4859043, 'admin', 92470.58, 17569.41, 15000, 125039.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 22, 115, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(346, '2017-03-11 01:04:33', '2017-04-10 21:58:25', 723, 16431, 4858591, 'admin', 41428.57, 7871.43, 0, 49300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 116, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(347, '2017-04-10 18:36:04', '2017-04-10 21:58:28', 723, 16432, 4860030, 'admin', 197310.93, 37489.08, 15000, 249800.01, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 49, 117, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(348, '2017-04-10 21:41:05', '2017-04-10 21:58:30', 723, 16433, 4860893, 'admin', 80369.74, 15270.25, 8000, 103639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 118, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(349, '2017-04-10 21:46:53', '2017-04-10 21:58:33', 723, 16434, 4860933, 'admin', 80369.74, 15270.25, 8000, 103639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 119, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(350, '2017-04-10 22:09:09', '2017-04-10 22:13:37', 723, 16435, 4861073, 'admin', 257176.46, 48863.53, 15000, 321039.99, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 64, 120, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(351, '2017-04-10 22:36:59', '2017-04-10 22:58:30', 723, 16436, 4861251, 'admin', 80369.74, 15270.25, 15000, 110639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 121, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(352, '2017-03-11 01:27:06', '2017-04-10 23:43:26', 723, 16437, 4858647, 'admin', 283613.44, 53886.55, 12000, 349499.99, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 70, 122, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(353, '2017-04-10 23:27:32', '2017-04-10 23:43:28', 723, 16438, 4861569, 'admin', 41428.57, 7871.43, 8000, 57300, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 0, 123, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(354, '2017-04-10 23:45:13', '2017-04-10 23:58:35', 723, 16439, 4861682, 'admin', 245262.6, 46599.89, 8000, 299862.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 65, 123, 8, 1, '2017-10-30 16:19:51', '2017-10-30 16:20:19'),
(355, '2017-04-10 23:48:36', '2017-04-10 23:58:40', 723, 16440, 4861702, 'admin', 260042.01, 49407.98, 8000, 317449.99, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 68, 124, NULL, 1, '2017-10-30 16:19:51', '2017-10-30 16:19:53'),
(356, '2017-04-10 23:27:20', '2017-04-11 00:13:29', 723, 16441, 4861565, 'admin', 80369.74, 15270.25, 12000, 107639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 125, 8, 1, '2017-10-30 16:19:52', '2017-10-30 16:20:19'),
(357, '2017-04-11 00:11:13', '2017-04-11 00:28:29', 723, 16442, 4861857, 'admin', 197008.4, 37431.6, 12000, 246440, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 48, 126, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(358, '2017-04-10 21:04:41', '2017-04-11 00:58:26', 723, 16443, 4860660, 'admin', 269590.33, 51222.16, 15000, 335812.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 70, 127, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(359, '2017-04-11 00:34:26', '2017-04-11 00:58:31', 723, 16444, 4862019, 'admin', 318970.58, 60604.41, 15000, 394574.99, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 84, 128, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(360, '2017-04-11 00:47:19', '2017-04-11 00:58:41', 723, 16446, 4862108, 'admin', 234296.22, 44516.28, 15000, 293812.5, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 62, 129, 8, 1, '2017-10-30 16:19:52', '2017-10-30 16:20:19'),
(361, '2017-04-10 16:50:00', '2017-04-11 00:58:36', 723, 16445, 4862061, 'admin', 234537.8, 44562.18, 25000, 304099.98, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 42, 130, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(362, '2017-04-10 21:06:05', '2017-04-11 01:13:27', 723, 16447, 4860669, 'admin', 277027.3, 52635.19, 15000, 344662.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 65, 131, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(363, '2017-04-11 00:58:07', '2017-04-11 01:13:32', 723, 16448, 4862213, 'admin', 80369.74, 15270.25, 12000, 107639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 132, 8, 1, '2017-10-30 16:19:52', '2017-10-30 16:20:19'),
(364, '2017-04-11 01:16:17', '2017-04-11 01:28:31', 723, 16449, 4862342, 'admin', 271102.93, 51509.56, 15000, 337612.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 66, 133, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(365, '2017-04-11 01:28:21', '2017-04-11 01:43:26', 723, 16450, 4862419, 'admin', 80369.74, 15270.25, 15000, 110639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 134, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(366, '2017-04-11 00:19:05', '2017-04-11 01:58:26', 723, 16451, 4861921, 'admin', 265115.54, 50371.95, 15000, 330487.49, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 70, 135, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(367, '2017-04-11 01:41:52', '2017-04-11 01:58:30', 723, 16452, 4862505, 'admin', 291869.74, 55455.25, 12000, 359324.99, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 77, 136, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(368, '2017-04-10 16:50:00', '2017-04-11 01:58:33', 723, 16453, 4862527, 'admin', 114327.72, 21722.27, 12000, 148049.99, 0, 'Pago En Linea CrÃ©dito/DÃ©bito', 16, 137, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(369, '2017-04-11 01:51:21', '2017-04-11 01:58:36', 723, 16454, 4862555, 'admin', 301386.54, 57263.44, 25000, 383649.98, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 80, 138, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(370, '2017-04-11 01:35:26', '2017-04-11 02:13:26', 723, 16455, 4862451, 'admin', 80369.74, 15270.25, 12000, 107639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 139, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(371, '2017-04-11 02:28:18', '2017-04-11 02:43:26', 723, 16456, 4862735, 'admin', 80369.74, 15270.25, 8000, 103639.99, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 20, 140, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(372, '2017-04-11 02:33:35', '2017-04-11 02:43:28', 723, 16457, 4862749, 'admin', 38420.17, 7299.83, 8000, 53720, 20, 'Pago En Linea CrÃ©dito/DÃ©bito', 8, 141, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(373, '2017-04-11 03:39:50', '2017-04-11 03:58:32', 723, 16458, 4863007, 'admin', 262058.81, 49791.17, 8000, 319849.98, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 68, 142, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(374, '2017-04-11 03:42:26', '2017-04-11 03:58:36', 723, 16459, 4863022, 'admin', 747331.9, 141993.06, 25000, 914324.96, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 186, 143, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(375, '2017-04-11 04:31:18', '2017-04-11 04:43:26', 723, 16460, 4863177, 'admin', 249201.68, 47348.32, 15000, 311550, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 62, 144, 8, 1, '2017-10-30 16:19:52', '2017-10-30 16:20:19'),
(376, '2017-04-11 02:48:46', '2017-05-10 06:43:27', 723, 16461, 4862809, 'admin', 262058.81, 49791.17, 15000, 326849.98, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 68, 145, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(377, '2017-04-11 02:22:38', '2017-05-10 13:21:28', 723, 16462, 4862715, 'co_porozco', 255661.75, 48575.73, 25000, 329237.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 64, 146, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53'),
(378, '2017-04-10 14:11:16', '2017-05-10 13:58:28', 723, 16463, 4859035, 'admin', 226039.9, 42947.58, 12000, 280987.48, 25, 'Pago En Linea CrÃ©dito/DÃ©bito', 60, 147, NULL, 1, '2017-10-30 16:19:52', '2017-10-30 16:19:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cantidad` double DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`id`, `cantidad`, `precio_unitario`, `total`, `pedido_id`, `producto_id`) VALUES
(1159, 4, 100462.18, 401848.72, 325, 851),
(1160, -1, 100462.18, -100462.18, 325, 852),
(1161, 1, 41428.57, 41428.57, 326, 853),
(1162, 2, 100462.18, 200924.36, 327, 851),
(1163, 1, 100462.18, 100462.18, 327, 854),
(1164, -1, 75346.635, -75346.635, 327, 852),
(1165, 1, 100462.18, 100462.18, 328, 851),
(1166, -1, 20092.436, -20092.436, 328, 852),
(1167, 1, 41428.57, 41428.57, 329, 853),
(1168, 1, 100462.18, 100462.18, 330, 851),
(1169, 1, 100462.18, 100462.18, 330, 855),
(1170, 1, 80294.12, 80294.12, 330, 856),
(1171, 1, 52100.84, 52100.84, 330, 857),
(1172, -1, 83329.83, -83329.83, 330, 852),
(1173, 1, 41428.57, 41428.57, 331, 853),
(1174, 1, 100462.18, 100462.18, 332, 858),
(1175, 1, 100462.18, 100462.18, 332, 859),
(1176, 1, 100462.18, 100462.18, 332, 860),
(1177, -1, 75346.635, -75346.635, 332, 852),
(1178, 1, 100462.18, 100462.18, 333, 851),
(1179, 1, 100462.18, 100462.18, 333, 855),
(1180, 1, 100462.18, 100462.18, 333, 859),
(1181, -1, 75346.635, -75346.635, 333, 852),
(1182, 1, 131638.65, 131638.65, 334, 861),
(1183, 1, 126092.44, 126092.44, 335, 862),
(1184, 1, 115588.23, 115588.23, 335, 863),
(1185, 1, 48025.21, 48025.21, 335, 864),
(1186, 1, 52100.84, 52100.84, 335, 865),
(1187, -1, 85451.68, -85451.68, 335, 852),
(1188, 1, 100462.18, 100462.18, 336, 851),
(1189, -1, 20092.436, -20092.436, 336, 852),
(1190, 1, 52100.84, 52100.84, 337, 865),
(1191, 1, 120546.22, 120546.22, 337, 866),
(1192, -1, 34529.412, -34529.412, 337, 852),
(1193, 1, 80294.12, 80294.12, 338, 856),
(1194, 1, 135756.3, 135756.3, 338, 867),
(1195, 1, 100462.18, 100462.18, 338, 855),
(1196, 1, 85840.34, 85840.34, 338, 868),
(1197, 1, 48025.21, 48025.21, 338, 864),
(1198, 1, 24789.92, 24789.92, 338, 869),
(1199, 2, 100462.18, 200924.36, 338, 859),
(1200, 1, 18487.39, 18487.39, 338, 870),
(1201, 1, 131638.65, 131638.65, 338, 861),
(1202, 1, 100462.18, 100462.18, 338, 858),
(1203, 1, 0, 0, 338, 871),
(1204, -1, 220850.835, -220850.835, 338, 852),
(1205, 1, 110504.2, 110504.2, 339, 872),
(1206, 1, 100462.18, 100462.18, 339, 851),
(1207, 1, 100462.18, 100462.18, 339, 873),
(1208, -1, 77857.14, -77857.14, 339, 852),
(1209, 2, 100462.18, 200924.36, 340, 859),
(1210, 1, 100462.18, 100462.18, 340, 851),
(1211, 2, 18487.39, 36974.78, 340, 870),
(1212, -1, 75346.635, -75346.635, 340, 852),
(1213, 3, 100462.18, 301386.54, 341, 859),
(1214, -1, 75346.635, -75346.635, 341, 852),
(1215, 1, 41428.57, 41428.57, 342, 853),
(1216, 2, 100462.18, 200924.36, 343, 858),
(1217, 2, 100462.18, 200924.36, 343, 859),
(1218, -1, 100462.18, -100462.18, 343, 852),
(1219, 1, 115588.23, 115588.23, 344, 863),
(1220, 1, 110504.2, 110504.2, 344, 874),
(1221, 1, 100462.18, 100462.18, 344, 875),
(1222, 1, 100462.18, 100462.18, 344, 859),
(1223, 1, 110504.2, 110504.2, 344, 872),
(1224, 1, 17310.92, 17310.92, 344, 876),
(1225, 1, 17310.92, 17310.92, 344, 877),
(1226, -1, 134380.2475, -134380.2475, 344, 852),
(1227, 1, 115588.23, 115588.23, 345, 878),
(1228, -1, 23117.646, -23117.646, 345, 852),
(1229, 1, 41428.57, 41428.57, 346, 853),
(1230, 1, 126092.44, 126092.44, 347, 862),
(1231, 1, 120546.22, 120546.22, 347, 866),
(1232, -1, 49327.732, -49327.732, 347, 852),
(1233, 1, 100462.18, 100462.18, 348, 858),
(1234, -1, 20092.436, -20092.436, 348, 852),
(1235, 1, 100462.18, 100462.18, 349, 858),
(1236, -1, 20092.436, -20092.436, 349, 852),
(1237, 1, 120546.22, 120546.22, 350, 866),
(1238, 1, 100462.18, 100462.18, 350, 855),
(1239, 1, 100462.18, 100462.18, 350, 858),
(1240, 1, -64294.116, -64294.116, 350, 879),
(1241, 1, 100462.18, 100462.18, 351, 855),
(1242, -1, 20092.436, -20092.436, 351, 852),
(1243, 1, 378151.26, 378151.26, 352, 880),
(1244, -1, 94537.815, -94537.815, 352, 852),
(1245, 1, 41428.57, 41428.57, 353, 853),
(1246, 1, 126092.44, 126092.44, 354, 862),
(1247, 1, 100462.18, 100462.18, 354, 859),
(1248, 1, 100462.18, 100462.18, 354, 855),
(1249, -1, 81754.2, -81754.2, 354, 852),
(1250, 1, 135756.3, 135756.3, 355, 881),
(1251, 1, 110504.2, 110504.2, 355, 872),
(1252, 1, 100462.18, 100462.18, 355, 851),
(1253, -1, 86680.67, -86680.67, 355, 852),
(1254, 1, 100462.18, 100462.18, 356, 851),
(1255, -1, 20092.436, -20092.436, 356, 852),
(1256, 1, 110504.2, 110504.2, 357, 882),
(1257, 1, 135756.3, 135756.3, 357, 867),
(1258, -1, 49252.1, -49252.1, 357, 852),
(1259, 1, 110504.2, 110504.2, 358, 882),
(1260, 1, 100462.18, 100462.18, 358, 859),
(1261, 1, 100462.18, 100462.18, 358, 858),
(1262, 1, 48025.21, 48025.21, 358, 864),
(1263, -1, 89863.4425, -89863.4425, 358, 852),
(1264, 1, 2521.01, 2521.01, 359, 883),
(1265, 2, 100462.18, 200924.36, 359, 855),
(1266, 1, 120546.22, 120546.22, 359, 866),
(1267, 1, 100462.18, 100462.18, 359, 859),
(1268, 1, 4369.75, 4369.75, 359, 884),
(1269, 1, 0, 0, 359, 885),
(1270, 1, 0, 0, 359, 885),
(1271, -1, 4369.75, -4369.75, 359, 886),
(1272, -1, 105483.19, -105483.19, 359, 852),
(1273, 1, 85840.34, 85840.34, 360, 868),
(1274, 1, 100462.18, 100462.18, 360, 851),
(1275, 1, 126092.44, 126092.44, 360, 862),
(1276, -1, 78098.74, -78098.74, 360, 852),
(1277, 1, 100462.18, 100462.18, 361, 859),
(1278, 1, 18487.39, 18487.39, 361, 870),
(1279, 1, 115588.23, 115588.23, 361, 878),
(1280, 1, 115588.23, 115588.23, 362, 863),
(1281, 3, 48025.21, 144075.63, 362, 864),
(1282, 1, 100462.18, 100462.18, 362, 859),
(1283, 1, 6932.77, 6932.77, 362, 887),
(1284, -1, 90031.51, -90031.51, 362, 852),
(1285, 1, 100462.18, 100462.18, 363, 851),
(1286, -1, 20092.436, -20092.436, 363, 852),
(1287, 1, 100462.18, 100462.18, 364, 854),
(1288, 1, 100462.18, 100462.18, 364, 873),
(1289, 1, 3193.28, 3193.28, 364, 888),
(1290, 1, 18487.39, 18487.39, 364, 870),
(1291, 1, 131638.65, 131638.65, 364, 861),
(1292, -1, 83140.7525, -83140.7525, 364, 852),
(1293, 1, 100462.18, 100462.18, 365, 851),
(1294, -1, 20092.436, -20092.436, 365, 852),
(1295, 1, 52100.84, 52100.84, 366, 865),
(1296, 1, 100462.18, 100462.18, 366, 855),
(1297, 1, 100462.18, 100462.18, 366, 873),
(1298, 1, 100462.18, 100462.18, 366, 851),
(1299, -1, 88371.845, -88371.845, 366, 852),
(1300, 1, 110504.2, 110504.2, 367, 882),
(1301, 1, 126092.44, 126092.44, 367, 889),
(1302, 1, 52100.84, 52100.84, 367, 857),
(1303, 1, 100462.18, 100462.18, 367, 875),
(1304, -1, 97289.915, -97289.915, 367, 852),
(1305, 1, 100462.18, 100462.18, 368, 851),
(1306, 2, 6932.77, 13865.54, 368, 887),
(1307, 1, 100462.18, 100462.18, 369, 851),
(1308, 1, 100462.18, 100462.18, 369, 859),
(1309, 1, 100462.18, 100462.18, 369, 875),
(1310, 1, 100462.18, 100462.18, 369, 860),
(1311, -1, 100462.18, -100462.18, 369, 852),
(1312, 1, 100462.18, 100462.18, 370, 859),
(1313, -1, 20092.436, -20092.436, 370, 852),
(1314, 1, 100462.18, 100462.18, 371, 851),
(1315, -1, 20092.436, -20092.436, 371, 852),
(1316, 1, 48025.21, 48025.21, 372, 864),
(1317, -1, 9605.042, -9605.042, 372, 852),
(1318, 1, 100462.18, 100462.18, 373, 859),
(1319, 1, 100462.18, 100462.18, 373, 875),
(1320, 1, 48025.21, 48025.21, 373, 864),
(1321, 1, 100462.18, 100462.18, 373, 858),
(1322, -1, 87352.9375, -87352.9375, 373, 852),
(1323, 1, 48025.21, 48025.21, 374, 864),
(1324, 2, 100462.18, 200924.36, 374, 859),
(1325, 1, 80294.12, 80294.12, 374, 856),
(1326, 1, 115588.23, 115588.23, 374, 878),
(1327, 1, 100462.18, 100462.18, 374, 875),
(1328, 2, 18487.39, 36974.78, 374, 870),
(1329, 1, 100462.18, 100462.18, 374, 855),
(1330, 1, 100462.18, 100462.18, 374, 873),
(1331, 2, 100462.18, 200924.36, 374, 851),
(1332, -1, 236785.705, -236785.705, 374, 852),
(1333, 1, 135756.3, 135756.3, 375, 881),
(1334, 2, 48025.21, 96050.42, 375, 864),
(1335, 1, 100462.18, 100462.18, 375, 851),
(1336, -1, 83067.225, -83067.225, 375, 852),
(1337, 1, 100462.18, 100462.18, 376, 851),
(1338, 1, 100462.18, 100462.18, 376, 875),
(1339, 1, 100462.18, 100462.18, 376, 855),
(1340, 1, 48025.21, 48025.21, 376, 864),
(1341, -1, 87352.9375, -87352.9375, 376, 852),
(1342, 1, 100462.18, 100462.18, 377, 859),
(1343, 1, 6932.77, 6932.77, 377, 887),
(1344, 2, 115588.23, 231176.46, 377, 878),
(1345, 1, 0, 0, 377, 885),
(1346, 1, 0, 0, 377, 885),
(1347, -1, 82909.66, -82909.66, 377, 852),
(1348, 1, 100462.18, 100462.18, 378, 854),
(1349, 1, 100462.18, 100462.18, 378, 875),
(1350, 1, 100462.18, 100462.18, 378, 859),
(1351, -1, 75346.635, -75346.635, 378, 852);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas_correos`
--

CREATE TABLE `plantillas_correos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `asunto` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantillas_correos`
--

INSERT INTO `plantillas_correos` (`id`, `nombre`, `asunto`, `created_at`, `updated_at`) VALUES
(1, 'Pedido pendiente', 'Estado de pedido pendiente', '2017-10-24 19:57:35', '2017-10-24 19:57:35'),
(2, 'Pedido en cola', 'Estado de pedido en cola', '2017-10-24 19:57:55', '2017-10-24 19:57:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(851, '141995', 'VITA ENERGIA EXTRA T COLOMBIA', '2017-10-30 16:19:50', '2017-10-30 16:19:50'),
(852, 'DSCT', 'Discount', '2017-10-30 16:19:50', '2017-10-30 16:19:50'),
(853, '141925', 'KIT DE AFILIACION COLOMBIA', '2017-10-30 16:19:50', '2017-10-30 16:19:50'),
(854, '141863', 'ACTIVAMENTE FUXION CO', '2017-10-30 16:19:50', '2017-10-30 16:19:50'),
(855, '141907', 'ELIXIR HGH COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(856, '141928', 'LIQUID FIBRA COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(857, '141974', 'TE GANOMAS COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(858, '141989', 'VITA ENERGIA CHICHA COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(859, '141980', 'TERMO TE COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(860, '141941', 'PASSION DRINK COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(861, '141986', 'VERAMAS COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(862, '141882', 'BIOPRO TEC (20x25GR) COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(863, '141889', 'BIOPRO+SPORT VAINILLA (15x25GR) COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(864, '141963', 'RGX 1 COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(865, '141899', 'CAFE CAPPUCCINO GANOMAS COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(866, '141913', 'FLORA LIV COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(867, '141870', 'BERRY BALANCE COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(868, '141935', 'ON COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(869, '142332', 'SISTEMA X DE NEGOCIO CO', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(870, '142662', 'TOMATODO NUEVA IMAGEN', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(871, 'SPL60', 'SPLITVOLUME60', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(872, '141951', 'PRE SPORT COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(873, '141919', 'FLX TE COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(874, '141945', 'POST SPORT COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(875, '141975', 'TE NOCARB COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(876, '142155', 'TOMATODO FUCSIA CON MEZCLADOR COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(877, '141160', 'TOMATODO CON MEZCLADOR COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(878, '141874', 'BIOPRO + FIT VAINILLA (20x25 GR)COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(879, 'DSCG', 'Discount', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(880, '141939', 'PACK 5/14 FUXION COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(881, '141906', 'CAFÃ‰ & CAFE FIT FUXION X 28 COLOMBIA', '2017-10-30 16:19:51', '2017-10-30 16:19:51'),
(882, '141932', 'OFF COLOMBIA', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(883, '142394', 'Catalogo de Productos unidad', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(884, '131143', 'CD VARIOS COLOMBIA', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(885, '142848', 'BIOPRO TEC (20x25GR) FUXION CO', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(886, 'DSCP', 'Descuento Promocional', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(887, '131058', 'TOMALIFE FUXION', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(888, '142393', 'Set Hojas presentacion Sistema X', '2017-10-30 16:19:52', '2017-10-30 16:19:52'),
(889, '141957', 'PROBAL COLOMBIA', '2017-10-30 16:19:52', '2017-10-30 16:19:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_enviados`
--

CREATE TABLE `productos_enviados` (
  `id` int(10) UNSIGNED NOT NULL,
  `cantidad` double DEFAULT '0',
  `producto_id` int(10) UNSIGNED NOT NULL,
  `guia_pedido_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `superadministrador` enum('si','no') NOT NULL DEFAULT 'no',
  `nombre` varchar(100) NOT NULL,
  `privilegios` text,
  `empresarios` enum('si','no') DEFAULT 'no',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `superadministrador`, `nombre`, `privilegios`, `empresarios`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'si', 'Superadministrador', NULL, 'no', NULL, '2017-08-31 14:08:41', '2017-08-31 14:08:41'),
(2, 'no', 'Bodega Fuxion', '(4,1)_(4,3)_(4,4)_(4,5)', 'no', 11, '2017-10-12 21:31:03', '2017-10-12 21:31:03'),
(3, 'no', 'Administrador', '(4,1)_(4,3)_(4,4)_(4,5)_(1,1)_(1,2)', 'no', 11, '2017-09-11 15:33:40', '2017-09-11 20:33:40'),
(6, 'no', 'Empresario', '(4,1)_(4,3)_(4,4)_(4,5)', 'si', 11, '2017-10-13 20:05:22', '2017-10-13 20:05:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4VM04Th12nvjAn4NNssWNetUI54jVVSV19E01Z49', 11, '192.168.0.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieXlUWnpqUXJyRkMzYmd0NG9Xdjk2b0I3ZVlUVDIzZ1JnNUVWWnZMTCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xOTIuMTY4LjAuMTg6ODAwMC9jb3J0ZS9ndWlhcy1vcGVyYWRvci1sb2dpc3RpY28vOC8xIjt9czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1509381088),
('f0aoX0Fldsc47nGR32BLSMHBt5N01U0Bnfwc17h1', 11, '192.168.0.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiajRXVEhqaUlOWjN2eFdvQ0pLY0pUcUhrSDNZaXV0cUptd05La1dRVCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xOTIuMTY4LjAuMTg6ODAwMC9wcnVlYmEtZ3V6emxlIjt9czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1509139997),
('QdGgnKDK1XfJscOoTGJMnPsXPuIMMrGFEqSGZuUj', 11, '192.168.0.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNURMdVdQNDBRVmN5VjZjRnJCOWtxbU1ZM1BvTHY2Z1didEIzYkxnYSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xOTIuMTY4LjAuMTg6ODAwMC91c3VhcmlvL2NyZWF0ZSI7fXM6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1509036618),
('vxRiC8khwErQX5svVvKZk7mAzy43bPBXCffpkMfh', 11, '192.168.0.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic2xuN3N0c1BYOGFBb0R1YUx0YjYwQmRjeE5jZFQ3NDZGazBVeUxZVyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xOTIuMTY4LjAuMTg6ODAwMC9wbGFudGlsbGEtY29ycmVvIjt9czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1508978606);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `carrera` varchar(20) DEFAULT NULL,
  `numero` varchar(20) NOT NULL,
  `barrio` varchar(250) NOT NULL,
  `especificaciones` varchar(250) DEFAULT NULL,
  `ciudad_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `calle`, `carrera`, `numero`, `barrio`, `especificaciones`, `ciudad_id`) VALUES
(1, 'Avenida 19', NULL, '123-86', 'Santa Barbara', NULL, 524),
(2, '5', NULL, '100-45', 'Deprisa', NULL, 418),
(3, '15', NULL, '19-45', 'Servientrega', NULL, 524),
(4, '15', NULL, '15-15', 'Domina', NULL, 799);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_identificacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identificacion` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombres` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` enum('masculino','femenino') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `sesion_web` enum('si','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `sesion_fuxion_track` enum('si','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `sesion_fuxion_trax` enum('si','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `archivo_id` int(10) UNSIGNED DEFAULT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `bodega_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `tipo_identificacion`, `identificacion`, `nombres`, `apellidos`, `telefono`, `fecha_nacimiento`, `email`, `genero`, `password`, `remember_token`, `token`, `sesion_web`, `sesion_fuxion_track`, `sesion_fuxion_trax`, `archivo_id`, `rol_id`, `bodega_id`, `user_id`, `created_at`, `updated_at`) VALUES
(11, NULL, NULL, 'Superadministrador', 'Initial Fire', NULL, NULL, 'jcapotem@sena.edu.co', NULL, '$2y$10$iQtJWmwevqfrdKhl54/uYeXT8qtKNzrljPDVLxEvimjMdQMTBkydC', 'QHCRZ5G4Zi5AWU4TTyr1NEP5VWHefRyrGj5lIXEaJLEwps2qJZJeqUc7JBJZ', NULL, 'si', 'no', 'no', NULL, 1, NULL, NULL, '2017-08-31 14:09:49', '2017-10-11 20:44:24'),
(110, 'C.C', '22', 'MARTHA ELISA', 'MELO AVILA', '86846765', NULL, 'jlcapote@misena.edu.co', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:31', '2017-10-24 23:22:31'),
(111, 'C.C', NULL, 'LORENA', 'LOPEZ', '4331189', NULL, 'lotalovi@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(112, 'C.C', NULL, 'Paola Andrea ', 'Leal Lopez', '3102659822', NULL, 'paolaleal@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(113, 'C.C', NULL, 'ANA', 'MONTANA ROSAS', NULL, NULL, 'nanamontanarosas@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(114, 'C.C', NULL, 'Marta', 'Acevedo', '3113302274', NULL, 'gerenciaclo@tyc-asociados.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(115, 'C.C', NULL, 'Laura', 'Rueda', '3008509510', NULL, 'lauraruedasierra@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(116, 'C.C', NULL, 'Patricia Cilena', 'Galvis Monterrosa', '6675472', NULL, 'patriciagalvismon@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(117, 'C.C', NULL, 'Adriana ', 'Lopez Ussa', '3173687062', NULL, 'nana21992@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(118, 'C.C', NULL, 'ERIKA  PATRICIA', 'MONTERO  BRITO', '3015930935', NULL, 'erikapatriciamontero@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(119, 'C.C', NULL, 'Luz Amanda', 'Gomez Orozco', '3186397090', NULL, 'luzamanditi2017@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(120, 'C.C', '42071109', 'LILIANA', 'MUNERA LOPEZ', NULL, NULL, 'liliana_munera@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:32', '2017-10-24 23:22:32'),
(121, 'C.C', NULL, 'Ema  Cande ', 'Maldonado Meza', '3135353381', NULL, 'emalmeza@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(122, 'C.C', NULL, 'LEONARDO ENRIQUE', 'MEZA DE LA HOZ', '3008040662', NULL, 'LEONARDO.MEZA@OUTLOOK.COM', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(123, 'C.C', NULL, 'NATALIE JHOANA', 'AVILA SIERRA', '7272284', NULL, 'natajoha0503@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(124, 'C.C', NULL, 'Jualia ', 'Uribe Sanchez', '3017568775', NULL, 'Usjuly@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(125, 'C.C', NULL, 'mayra julieth', 'lopez olivero', '4331189', NULL, 'marjulieth1987@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(126, 'C.C', '56076021', 'NASLY', 'BERARDINELLY GONZALEZ', NULL, NULL, 'nasly.paula@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(127, 'C.C', NULL, 'ELKIN ', 'PINILLA', '3014190662', NULL, 'elkin.78@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(128, 'C.C', NULL, 'DIANA MARCELA', 'MORALES QUINTERO', NULL, NULL, 'dianam.fuxion@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(129, 'C.C', '52385621', 'MARIA CECILIA', 'GALVIS GALEANO', '3166906229', NULL, 'galvismc@yahoo.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(130, 'C.C', NULL, 'MARTHA JULIANA', 'GALVIS GALEANO', NULL, NULL, 'MJGG78@HOTMAIL.COM', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(131, 'C.C', NULL, 'BERNARDO ', 'TOLEDO ARIAS', '7742195', NULL, 'berna.told@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(132, 'C.C', NULL, 'YOLANDA DEL SOCORRO', 'VELASQUEZ VARELA', '3016921274', NULL, 'lisyomar@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(133, 'C.C', NULL, 'luz dary', 'zapa tirado', '3137865478', NULL, 'luzhijas1114@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(134, 'C.C', NULL, 'Tatiana ', 'Villacorta Madrid', '3166230869', NULL, 'tatianavm28@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(135, 'C.C', NULL, 'JUAN MANUEL', 'MORENO ABELLO', NULL, NULL, 'jmmamoreno@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(136, 'C.C', NULL, 'Stefany Isabel', 'Diez Cogollo', '7854310', NULL, 'stefanydiez.j@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(137, 'C.C', NULL, 'MIRIAN', 'SANTORO DE BUITRAGO', NULL, NULL, 'monica.p.buitrago@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:33', '2017-10-24 23:22:33'),
(138, 'C.C', NULL, 'YORNALDI DAVID', 'BENJUMEA JIMENEZ', '3104404556', NULL, 'yornaldidavid@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(139, 'C.C', NULL, 'maria monica', 'moreno casas', '4392484', NULL, 'miguebero@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(140, 'C.C', NULL, 'Maria Del pilar', 'Valero Cubillos', '8269232', NULL, 'pilarvaler@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(141, 'C.C', NULL, 'ELIZABETH', 'Aguirre Escobar', NULL, NULL, 'crica15@yahoo.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(142, 'C.C', NULL, 'YULIBETH ', 'QUINTERO RAMIREZ', '3162347744', NULL, 'daniangeljuan123@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(143, 'C.C', NULL, 'LUZ MERY ', 'PORRAS', '9018194', NULL, 'sandra.diaz@chevyplan.com.co', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(144, 'C.C', NULL, 'JENNIFER BEATRIZ', 'PERTUZ FERNANDE DE CASTRO', '3043539474', NULL, 'jenniferpertuz@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(145, 'C.C', NULL, 'JUAN  CARLOS', 'GIRALDO  GARCIA', '3207958006', NULL, 'juanchogarcia1@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(146, 'C.C', NULL, 'HEIDER  ENRIQUE', 'OVIEDO  CASTRO', '3232866507', NULL, 'marjulieth1987@yahoo.es', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(147, 'C.C', NULL, 'Edwin De Jesus', 'Bustamante Gonzalez', '573193416804', NULL, 'edwinbte@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(148, 'C.C', NULL, 'Linda  Rosa', 'Medina Ortega', '3145915427', NULL, 'lindaamedin@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(149, 'C.C', NULL, 'PRINCIPE GABRIEL', 'GONZALEZ ARANGO', '+57 3115596182', NULL, 'gabo.intos@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(150, 'C.C', NULL, 'victoria del carmen', 'vidal de ordoÃ±ez', '3505980610', NULL, 'sandraordonezvidal@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(151, 'C.C', NULL, 'Yuri ', 'Gereda ', '3103663411', NULL, 'yuri@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:34', '2017-10-24 23:22:34'),
(152, 'C.C', NULL, 'CESAR RAUL', 'GRANADOS VASQUEZ', '3052604433', NULL, 'xprofuxion@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(153, 'C.C', NULL, 'carlos german', 'parraga guarnizo', '3006141', NULL, 'carlosg.parraga@outlook.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(154, 'C.C', NULL, 'Fanny Patricia', 'CarreÃ±o Devia', '3203068437', NULL, 'fanicita3105@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(155, 'C.C', NULL, 'MARBELYS  LEONOR', 'RODRIGUEZ CUJIA', '3017648515', NULL, 'marbe0409@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(156, 'C.C', NULL, 'JULIETH  NATALIA', 'PEREA GOMEZ', '3012261022', NULL, 'jnpg01@hotmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(157, 'C.C', NULL, 'fernando ', 'avila gonzalez', '3118353863', NULL, 'capacidades.fernando@gmail.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35'),
(158, 'C.C', NULL, 'Maritza ', 'Trujillo Palencia', '6629562', NULL, 'maritrujillo23@outlook.com', NULL, NULL, NULL, NULL, 'no', 'no', 'no', NULL, 6, NULL, NULL, '2017-10-24 23:22:35', '2017-10-24 23:22:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_correos`
--

CREATE TABLE `users_correos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `correo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users_correos`
--

INSERT INTO `users_correos` (`id`, `user_id`, `correo_id`) VALUES
(1, 110, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
  ADD UNIQUE KEY `prefijo_facturacion_UNIQUE` (`prefijo_facturacion`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_bodegas_ubicaciones1_idx` (`ubicacion_id`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ciudades_departamentos1_idx` (`departamento_id`);

--
-- Indices de la tabla `correos`
--
ALTER TABLE `correos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_correos_plantillas_correos1_idx` (`plantilla_correo_id`);

--
-- Indices de la tabla `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_importaciones_users1_idx` (`user_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamentos_paises1_idx` (`pais_id`);

--
-- Indices de la tabla `empresarios`
--
ALTER TABLE `empresarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_users1_idx` (`user_id`);

--
-- Indices de la tabla `estados_operadores_logisticos`
--
ALTER TABLE `estados_operadores_logisticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estados_operadores_logisticos_estados_pedidos1_idx` (`cambio_estado_pedido_id`),
  ADD KEY `fk_estados_operadores_logisticos_plantillas_correos1_idx` (`plantilla_correo_id`);

--
-- Indices de la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_estados_pedidos_plantillas_correos1_idx` (`plantilla_correo_id`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guias`
--
ALTER TABLE `guias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_guias_mallas_cobertura1_idx` (`malla_cobertura_id`),
  ADD KEY `fk_guias_operadores_logisticos1_idx` (`operador_logistico_id`);

--
-- Indices de la tabla `guias_pedidos`
--
ALTER TABLE `guias_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_guias_has_pedidos_pedidos1_idx` (`pedido_id`),
  ADD KEY `fk_guias_has_pedidos_guias1_idx` (`guia_id`),
  ADD KEY `fk_guias_pedidos_archivos1_idx` (`foto_1`),
  ADD KEY `fk_guias_pedidos_archivos2_idx` (`foto_2`);

--
-- Indices de la tabla `historial_estados_pedidos`
--
ALTER TABLE `historial_estados_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estados_pedidos_has_pedidos_pedidos1_idx` (`pedido_id`),
  ADD KEY `fk_historial_estados_pedidos_estados_pedidos1_idx` (`estado_pedido_id`);

--
-- Indices de la tabla `kit_empresarios`
--
ALTER TABLE `kit_empresarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inicio_UNIQUE` (`inicio`),
  ADD UNIQUE KEY `fin_UNIQUE` (`fin`);

--
-- Indices de la tabla `mallas_cobertura`
--
ALTER TABLE `mallas_cobertura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mallas_cobertura_operadores_logisticos1_idx` (`operador_logistico_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos_funciones`
--
ALTER TABLE `modulos_funciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modulos_has_funciones_funciones1_idx` (`funcion_id`),
  ADD KEY `fk_modulos_has_funciones_modulos1_idx` (`modulo_id`);

--
-- Indices de la tabla `nombres_estados_operadores_logisticos`
--
ALTER TABLE `nombres_estados_operadores_logisticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_operadores_logisticos_has_estados_operadores_logisticos__idx` (`estado_operador_logistico_id`),
  ADD KEY `fk_operadores_logisticos_has_estados_operadores_logisticos__idx1` (`operador_logistico_id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `operadores_logisticos`
--
ALTER TABLE `operadores_logisticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_operdores_logicos_ubicaciones1_idx` (`ubicacion_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orden_id_UNIQUE` (`orden_id`),
  ADD KEY `fk_ordenes_clientes1_idx` (`empresario_id`),
  ADD KEY `fk_ordenes_importaciones1_idx` (`corte_id`),
  ADD KEY `fk_pedidos_bodegas1_idx` (`bodega_id`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordenes_has_items_items1_idx` (`producto_id`),
  ADD KEY `fk_ordenes_has_items_ordenes1_idx` (`pedido_id`);

--
-- Indices de la tabla `plantillas_correos`
--
ALTER TABLE `plantillas_correos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_enviados`
--
ALTER TABLE `productos_enviados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_envios_productos1_idx` (`producto_id`),
  ADD KEY `fk_envios_guias_pedidos1_idx` (`guia_pedido_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_roles_users1_idx` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ubicaciones_ciudades1_idx` (`ciudad_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_identificacion_unique` (`identificacion`),
  ADD KEY `fk_users_roles1_idx` (`rol_id`),
  ADD KEY `fk_users_users1_idx` (`user_id`),
  ADD KEY `fk_users_archivos1_idx` (`archivo_id`),
  ADD KEY `fk_users_bodegas1_idx` (`bodega_id`);

--
-- Indices de la tabla `users_correos`
--
ALTER TABLE `users_correos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_has_correos_correos1_idx` (`correo_id`),
  ADD KEY `fk_users_has_correos_users1_idx` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1113;
--
-- AUTO_INCREMENT de la tabla `correos`
--
ALTER TABLE `correos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cortes`
--
ALTER TABLE `cortes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `empresarios`
--
ALTER TABLE `empresarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT de la tabla `estados_operadores_logisticos`
--
ALTER TABLE `estados_operadores_logisticos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `funciones`
--
ALTER TABLE `funciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `guias`
--
ALTER TABLE `guias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT de la tabla `guias_pedidos`
--
ALTER TABLE `guias_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historial_estados_pedidos`
--
ALTER TABLE `historial_estados_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
--
-- AUTO_INCREMENT de la tabla `kit_empresarios`
--
ALTER TABLE `kit_empresarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mallas_cobertura`
--
ALTER TABLE `mallas_cobertura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `modulos_funciones`
--
ALTER TABLE `modulos_funciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `nombres_estados_operadores_logisticos`
--
ALTER TABLE `nombres_estados_operadores_logisticos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `operadores_logisticos`
--
ALTER TABLE `operadores_logisticos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;
--
-- AUTO_INCREMENT de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1352;
--
-- AUTO_INCREMENT de la tabla `plantillas_correos`
--
ALTER TABLE `plantillas_correos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=890;
--
-- AUTO_INCREMENT de la tabla `productos_enviados`
--
ALTER TABLE `productos_enviados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT de la tabla `users_correos`
--
ALTER TABLE `users_correos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD CONSTRAINT `fk_bodegas_ubicaciones1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `fk_ciudades_departamentos1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `correos`
--
ALTER TABLE `correos`
  ADD CONSTRAINT `fk_correos_plantillas_correos1` FOREIGN KEY (`plantilla_correo_id`) REFERENCES `plantillas_correos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cortes`
--
ALTER TABLE `cortes`
  ADD CONSTRAINT `fk_importaciones_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_departamentos_paises1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresarios`
--
ALTER TABLE `empresarios`
  ADD CONSTRAINT `fk_clientes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estados_operadores_logisticos`
--
ALTER TABLE `estados_operadores_logisticos`
  ADD CONSTRAINT `fk_estados_operadores_logisticos_estados_pedidos1` FOREIGN KEY (`cambio_estado_pedido_id`) REFERENCES `estados_pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estados_operadores_logisticos_plantillas_correos1` FOREIGN KEY (`plantilla_correo_id`) REFERENCES `plantillas_correos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  ADD CONSTRAINT `fk_estados_pedidos_plantillas_correos1` FOREIGN KEY (`plantilla_correo_id`) REFERENCES `plantillas_correos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `fk_guias_mallas_cobertura1` FOREIGN KEY (`malla_cobertura_id`) REFERENCES `mallas_cobertura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guias_operadores_logisticos1` FOREIGN KEY (`operador_logistico_id`) REFERENCES `operadores_logisticos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `guias_pedidos`
--
ALTER TABLE `guias_pedidos`
  ADD CONSTRAINT `fk_guias_has_pedidos_guias1` FOREIGN KEY (`guia_id`) REFERENCES `guias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guias_has_pedidos_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guias_pedidos_archivos1` FOREIGN KEY (`foto_1`) REFERENCES `archivos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_guias_pedidos_archivos2` FOREIGN KEY (`foto_2`) REFERENCES `archivos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `historial_estados_pedidos`
--
ALTER TABLE `historial_estados_pedidos`
  ADD CONSTRAINT `fk_estados_pedidos_has_pedidos_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_historial_estados_pedidos_estados_pedidos1` FOREIGN KEY (`estado_pedido_id`) REFERENCES `estados_pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mallas_cobertura`
--
ALTER TABLE `mallas_cobertura`
  ADD CONSTRAINT `fk_mallas_cobertura_operadores_logisticos1` FOREIGN KEY (`operador_logistico_id`) REFERENCES `operadores_logisticos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modulos_funciones`
--
ALTER TABLE `modulos_funciones`
  ADD CONSTRAINT `fk_modulos_has_funciones_funciones1` FOREIGN KEY (`funcion_id`) REFERENCES `funciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_modulos_has_funciones_modulos1` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nombres_estados_operadores_logisticos`
--
ALTER TABLE `nombres_estados_operadores_logisticos`
  ADD CONSTRAINT `fk_operadores_logisticos_has_estados_operadores_logisticos_es1` FOREIGN KEY (`estado_operador_logistico_id`) REFERENCES `estados_operadores_logisticos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_operadores_logisticos_has_estados_operadores_logisticos_op1` FOREIGN KEY (`operador_logistico_id`) REFERENCES `operadores_logisticos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `operadores_logisticos`
--
ALTER TABLE `operadores_logisticos`
  ADD CONSTRAINT `fk_operdores_logicos_ubicaciones1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_ordenes_clientes1` FOREIGN KEY (`empresario_id`) REFERENCES `empresarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ordenes_importaciones1` FOREIGN KEY (`corte_id`) REFERENCES `cortes` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_pedidos_bodegas1` FOREIGN KEY (`bodega_id`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD CONSTRAINT `fk_ordenes_has_items_items1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ordenes_has_items_ordenes1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_enviados`
--
ALTER TABLE `productos_enviados`
  ADD CONSTRAINT `fk_envios_guias_pedidos1` FOREIGN KEY (`guia_pedido_id`) REFERENCES `guias_pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_envios_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_roles_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `fk_ubicaciones_ciudades1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_archivos1` FOREIGN KEY (`archivo_id`) REFERENCES `archivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_bodegas1` FOREIGN KEY (`bodega_id`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_roles1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_correos`
--
ALTER TABLE `users_correos`
  ADD CONSTRAINT `fk_users_has_correos_correos1` FOREIGN KEY (`correo_id`) REFERENCES `correos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_has_correos_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
