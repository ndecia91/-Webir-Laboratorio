-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2015 a las 16:50:15
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sistema_previas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE IF NOT EXISTS `carreras` (
  `idCarrera` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`idCarrera`, `nombre`) VALUES
('7200', 'Ingeniería en Computación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `instituto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `creditos` int(2) NOT NULL,
  `validez` int(3) NOT NULL,
  `semestre` int(2) NOT NULL,
  `exonerable` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `nota_promedio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `total_cursantes` int(10) NOT NULL,
  `aprobados` int(10) NOT NULL,
  `exonerados` int(10) NOT NULL,
  `porcentaje_aprobacion` float NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombre`, `descripcion`, `instituto`, `creditos`, `validez`, `semestre`, `exonerable`, `nota_promedio`, `total_cursantes`, `aprobados`, `exonerados`, `porcentaje_aprobacion`) VALUES
		('1011', 'TEORIA DE CODIGOS AVANZADO', '', '', 6, 999, 8, 'No', '0', 0, 0, 0, 0),
		('1012', 'COMBINATORIA ANALITICA', '', '', 8, 999, 5, 'No', '6.0', 4, 0, 4, 100),
		('1020', 'CALCULO 1', '', '', 16, 20, 1, 'Sí', '1.1', 1267, 499, 145, 11.4),
		('1022', 'CALCULO 2', '', '', 16, 20, 2, 'Sí', '1.6', 432, 261, 91, 21.1),
		('1023', 'MATEMATICA DISCRETA 1', '', '', 9, 20, 2, 'Sí', '2.0', 157, 106, 34, 21.7),
		('1024', 'CALCULO 3', '', '', 10, 20, 3, 'Sí', '3.2', 315, 286, 237, 75.2),
		('1025', 'PROBABILIDAD Y ESTADISTICA', '', '', 10, 20, 3, 'Sí', '2.6', 490, 376, 235, 48),
		('1026', 'MATEMATICA DISCRETA 2', '', '', 9, 20, 3, 'Sí', '2.1', 298, 209, 102, 34.2),
		('1027', 'LOGICA', '', '', 12, 20, 3, 'Sí', '1.3', 517, 291, 68, 13.2),
		('1028', 'ECUACIONES DIFERENCIALES', '', '', 12, 20, 4, 'Sí', '0', 0, 0, 0, 0),
		('1030', 'GEOMETRIA Y ALGEBRA LINEAL 1', '', '', 9, 20, 1, 'Sí', '1.5', 1237, 523, 216, 17.5),
		('1031', 'GEOMETRIA Y ALGEBRA LINEAL 2', '', '', 9, 20, 2, 'Sí', '1.4', 339, 164, 45, 13.3),
		('1033', 'METODOS NUMERICOS', '', '', 8, 20, 4, 'No', '0', 0, 0, 0, 0),
		('1042', 'TEORIA DE COD.ALGEBR.PARA CORREC.DE ERR', '', '', 7, 999, 6, 'No', '0', 0, 0, 0, 0),
		('1046', 'TEORIA DE CODIGOS', '', '', 12, 999, 6, 'No', '0', 0, 0, 0, 0),
		('1052', 'CALCULO 1 (ANUAL)', '', '', 16, 20, 1, 'Sí', '0', 0, 0, 0, 0),
		('1053', 'GEOMETRIA Y ALGEBRA LINEAL 1 (ANUAL)', '', '', 9, 20, 1, 'Sí', '0', 0, 0, 0, 0),
		('1057', 'METODOS MONTECARLO', '', '', 8, 999, 6, 'No', '6.5', 13, 0, 13, 100),
		('1059', 'CRIPTOGRAFIA:ASPECTOS TEOR. Y PRACTICOS', '', '', 12, 999, 3, 'No', '0', 0, 0, 0, 0),
('1131', 'INT. A LA FISICA MODERNA', '', '', 10, 20, 0, 'No', '0', 0, 0, 0, 0),
		('1151', 'FISICA 1', '', '', 10, 20, 1, 'Sí', '1.0', 1333, 391, 131, 9.8),
		('1152', 'FISICA 2', '', '', 10, 20, 2, 'Sí', '1.9', 265, 174, 72, 27.2),
		('1153', 'FISICA 3', '', '', 10, 20, 2, 'Sí', '1.8', 359, 205, 91, 25.3),
('1213', 'PLANIF.DE CLASES:DISEÑO DE UNID.DIDACT.', '', '', 2, 999, 0, 'No', '4.7', 3, 0, 3, 100),
		('1223', 'CIENCIA, TECNOLOGIA Y SOCIEDAD', '', '', 8, 999, 4, 'No', '0', 0, 0, 0, 0),
		('1224', 'ECONOMIA', '', '', 7, 20, 4, 'Sí', '0', 0, 0, 0, 0),
		('1225', 'POLITICAS CIENTIFICAS EN INF.Y COMP.', '', '', 3, 999, 4, 'No', '6.7', 6, 0, 6, 100),
('1316', 'INT. A LA COMPUTACION GRAFICA', '', '', 10, 999, 0, 'No', '2.2', 47, 0, 24, 51.1),
		('1321', 'PROGRAMACION 2', '', '', 12, 20, 3, 'Sí', '1.8', 429, 221, 128, 29.8),
		('1322', 'PROGRAMACION 1', '', '', 10, 20, 2, 'Sí', '0', 0, 0, 0, 0),
		('1323', 'PROGRAMACION 3', '', '', 15, 20, 4, 'Sí', '0', 0, 0, 0, 0),
		('1324', 'PROGRAMACION 4', '', '', 15, 20, 5, 'Sí', '2.7', 209, 192, 108, 51.7),
		('1325', 'TEORIA DE LENGUAJES', '', '', 12, 20, 5, 'Sí', '2.8', 190, 174, 101, 53.2),
		('1327', 'TALLER DE PROGRAMACION', '', '', 15, 999, 6, 'No', '0', 0, 0, 0, 0),
('1328', 'INT. A LA PROGRAMACION FUNCIONAL', '', '', 7, 999, 0, 'No', '2.2', 161, 0, 125, 77.6),
('1331', 'DISEÑO DE COMPILADORES', '', '', 12, 999, 0, 'No', '4.4', 63, 0, 61, 96.8),
('1333', 'INT. A LA PROGRAMACION GENERICA', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1340', 'PROGRAMACION LOGICA', '', '', 10, 999, 0, 'No', '2.4', 68, 0, 58, 85.3),
('1347', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 12, 999, 0, 'No', '0', 0, 0, 0, 0),
('1350', 'PROGRAMACION FUNCIONAL AVANZADA', '', '', 12, 999, 0, 'No', '3.7', 7, 0, 7, 100),
('1351', 'COMBINATORIA ANALITICA Y APLICACIONES', '', '', 3, 999, 0, 'No', '0', 0, 0, 0, 0),
('1358', 'TEORIA DE LA COMPUTACION', '', '', 7, 999, 0, 'No', '5.3', 5, 0, 5, 100),
('1414', 'SISTEMAS DISTRIBUIDOS', '', '', 15, 999, 0, 'No', '0', 0, 0, 0, 0),
('1416', 'INT. A LA CRIPTOGRAFIA', '', '', 12, 999, 0, 'No', '0', 0, 0, 0, 0),
('1434', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1435', 'DISEÑO TOPOLOGICO DE REDES', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1437', 'TALLER DE SEGURIDAD INFORMATICA', '', '', 7, 999, 0, 'No', '0', 0, 0, 0, 0),
('1438', 'APL.DE TEORIA DE LA INF.AL PROC.DE IMAG.', '', '', 6, 999, 0, 'No', '0.5', 10, 0, 2, 20),
('1440', 'ANAL.Y DIS.DE ALGORIT.DISTRIB.EN REDES', '', '', 8, 999, 0, 'No', '3.8', 12, 0, 12, 100),
('1441', 'CURVAS ELIPTICAS EN CRIPTOGRAFIA', '', '', 3, 999, 0, 'No', '0', 0, 0, 0, 0),
('1442', 'ROBOTICA EMBEBIDA', '', '', 10, 999, 0, 'No', '3.9', 12, 0, 10, 83.3),
		('1443', 'ARQUITECTURA DE COMPUTADORAS', '', '', 12, 56, 4, 'No', '0', 0, 0, 0, 0),
('1444', 'ASPECTOS AVANZ. DE ARQ.DE COMPUTADORAS', '', '', 8, 999, 0, 'No', '0.8', 12, 0, 3, 25),
('1445', 'TALLER DE ARQUITECTURA DE COMPUTADORAS', '', '', 3, 999, 0, 'No', '0.9', 54, 0, 23, 42.6),
		('1446', 'REDES DE COMPUTADORAS', '', '', 12, 56, 6, 'No', '0', 0, 0, 0, 0),
('1447', 'COMPUT.DE PR.GRAL.EN UNID.DE PROC.GRAF.', '', '', 7, 999, 0, 'No', '0', 0, 0, 0, 0),
('1448', 'ASPECTOS AVANZ. DE REDES DE COMPUTADORAS', '', '', 8, 999, 0, 'No', '2.1', 21, 0, 14, 66.7),
('1449', 'TALLER DE GPGPU', '', '', 7, 999, 0, 'No', '3.0', 3, 0, 3, 100),
('1450', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 8, 999, 0, 'No', '1.4', 17, 0, 7, 41.2),
('1453', 'COMPL.ARQUITECTURA DE COMPUTADORAS', '', '', 5, 999, 0, 'No', '0', 0, 0, 0, 0),
('1507', 'INT. A LAS ORGANIZACIONES', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1510', 'CONTROL DE CALIDAD', '', '', 8, 20, 0, 'No', '0', 0, 0, 0, 0),
('1519', 'INT. A LA ADMINISTRACION PARA INGENIEROS', '', '', 10, 20, 0, 'No', '0', 0, 0, 0, 0),
('1535', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 8, 999, '0', 'No', 0, 0, 0, 0, 0),
		('1537', 'SISTEMAS OPERATIVOS', '', '', 12, 20, 5, 'Sí', '1.4', 349, 232, 38, 10.9),
('1543', 'INT. AL NEGOCIO DEL SOFTWARE', '', '', 6, 999, 0, 'No', '0', 0, 0, 0, 0),
		('1610', 'INT. A LA INVESTIGACION DE OPERACIONES', '', '', 10, 20, 5, 'Sí', '3.2', 320, 304, 237, 74.1),
('1613', 'METAHEURISTICAS Y OPTIMIZ.SOBRE REDES', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1617', 'SIMULACION A EVENTOS DISCRETOS', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1624', 'MODELADO Y OPTIMIZACION', '', '', 6, 999, 0, 'No', '0', 0, 0, 0, 0),
('1628', 'ALGORITMOS EVOLUTIVOS', '', '', 9, 999, 0, 'No', '2.8', 69, 0, 49, 71),
('1629', 'INT. A LA OPTIMIZ.Y A LA PROG. CON RESTR', '', '', 6, 999, 0, 'No', '0', 0, 0, 0, 0),
('1630', 'INVESTIGACION DE OPER.Y GEST. DE RIESGOS', '', '', 6, 999, 0, 'No', '0', 0, 0, 0, 0),
('1631', 'FUNDAMENTOS DE PROGRAMACION ENTERA', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1632', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 8, 999, 0, 'No', '2.4', 23, 0, 16, 69.6),
		('1716', 'INT. A LA INGENIERIA DE SOFTWARE', '', '', 10, 20, 7, 'Sí', '2.5', 114, 109, 66, 57.9),
		('1721', 'PROYECTO DE INGENIERIA DE SOFTWARE', '', '', 15, 999, 8, 'No', '0', 0, 0, 0, 0),
		('1730', 'PROYECTO DE GRADO', '', '', 30, 999, 9, 'No', '10.8', 66, 0, 64, 97),
('1731', 'PASANTIA (COMPUTACION)', '', '', 10, 999, 0, 'No', 'S/N', 63, 0, 63, 100),
('1734', 'TALLER SISTEMAS DE INFORMACION 1', '', '', 6, 999, 0, 'No', '0', 0, 0, 0, 0),
('1735', 'TALLER SISTEMAS DE INFORMACION 2', '', '', 15, 999, 0, 'No', '0', 0, 0, 0, 0),
('1740', 'TALLER DE SISTEMAS DE INFORMACION 3', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1741', 'TALLER DE SISTEMAS DE INFORMACION 4', '', '', 15, 999, 0, 'No', '0', 0, 0, 0, 0),
('1742', 'TALLER DE VERIFICACION DEL SOFTWARE', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1749', 'INTERACCION PERSONA COMPUTADORA', '', '', 12, 999, 0, 'No', '0', 0, 0, 0, 0),
('1751', 'TALLER DE SISTEMAS DE INFORMACION 1', '', '', 10, 999, 0, 'No', '3.9', 40, 0, 40, 100),
('1758', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 10, 999, 0, 'No', '2.3', 40, 0, 36, 90),
('1759', 'TALLER DE SIST. DE INF.GEOGRAF.EMPRESAR.', '', '', 8, 999, 0, 'No', '4.7', 40, 0, 40, 100),
('1766', 'TALLER DE GEST.Y TEC.PROC.NEGOCIO (TBPM)', '', '', 10, 999, 0, 'No', '4.5', 38, 0, 37, 97.4),
('1767', 'PRINC.Y FUND.DEL PROC.PERS.DE SOFTWARE', '', '', 7, 999, 0, 'No', 'S/N', 26, 0, 25, 96.2),
('1768', 'TALLER DE INTERACCION PERSONA COMPUTAD.', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1769', 'PROFESION EN INGENIERIA DE SOFTWARE', '', '', 4, 999, 0, 'No', '2.7', 34, 0, 30, 88.2),
('1827', 'APRENDIZAJE AUTOMATICO', '', '', 7, 999, 0, 'No', '0', 0, 0, 0, 0),
('1828', 'INT. AL PROCESAMIENTO DE LENG. NATURAL', '', '', 12, 999, 0, 'No', '0', 0, 0, 0, 0),
('1834', 'METODOS DE APRENDIZAJE AUTOMATICO', '', '', 9, 999, 0, 'No', '0', 0, 0, 0, 0),
('1835', 'GRAMATICAS FORMALES PARA EL LENG.NATURAL', '', '', 10, 999, 0, 'No', '1.3', 27, 0, 15, 55.6),
('1848', 'ROBOTICA BASADA EN COMPORTAMIENTOS', '', '', 15, 999, 0, 'No', '0', 0, 0, 0, 0),
('1849', 'BUTIA: ROBOTICA EDUCATIVA', '', '', 8, 999, 0, 'No', '3.6', 20, 0, 20, 100),
		('1911', 'FUNDAMENTOS DE BASES DE DATOS', '', '', 15, 20, 6, 'Sí', '0', 0, 0, 0, 0),
('1918', 'ADMINISTRACION Y SEGURIDAD DE SISTEMAS', '', '', 10, 999, 0, 'No', '2.7', 47, 0, 43, 91.5),
('1926', 'INT. A LOS SIST. DE INFOR. GEOGRAFICA', '', '', 10, 999, 0, 'No', '3.4', 31, 0, 27, 87.1),
('1930', 'ORGANIZACIONES PARA INGENIEROS', '', '', 6, 20, 0, 'No', '0', 0, 0, 0, 0),
('1933', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 15, 999, 0, 'No', '4.2', 173, 0, 173, 100),
('1935', 'CALIDAD DE DATOS', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1936', 'INT. AL MIDDLEWARE', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1937', 'SISTEMAS DE INFORMACION EN SALUD', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1938', 'RECUP.DE INF.Y RECOMEND.EN LA WEB (WIR)', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1939', 'DISEÑO Y CONSTRUCCION DE DATA WAREHOUSE', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('1940', 'GESTION DE CALIDAD', '', '', 6, 9, 0, 'No', '1.3', 102, 50, 15, 14.7),
('1941', 'INTEGRACION DE DATOS', '', '', 8, 999, 0, 'No', '2.6', 76, 0, 61, 80.3),
('1942', 'FUNDAMENTOS DE LA WEB SEMANTICA', '', '', 8, 999, 0, 'No', '0', 0, 0, 0, 0),
('1944', 'ADMINISTRACION GENERAL PARA INGENIEROS', '', '', 5, 20, 0, 'No', '1.8', 21, 11, 7, 33.3),
('1947', 'TALLER DE LENG.Y TEC.DE LA WEB SEMANTICA', '', '', 10, 999, 0, 'No', '0', 0, 0, 0, 0),
('2034', 'TALLER ENCARARE 1:CREATIVIDAD E INNOVAC.', '', '', 5, 999, 0, 'No', '3.6', 18, 0, 18, 100),
('2036', 'TALLER ENCARARE 2:PLANIF.DE LA FUT.EMPR.', '', '', 5, 999, 0, 'No', '0', 0, 0, 0, 0),
('5705', 'SEMINARIO DE INGENIERIA BIOMEDICA', '', '', 4, 999, 0, 'No', 'S/N', 17, 0, 17, 100),
('5707', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 8, 999, 0, 'No', '2.0', 5, 0, 3, 60),
('5914', 'ALGEBRA LINEAL NUMERICA', '', '', 9, 999, 0, 'No', '4.0', 2, 0, 2, 100),
('5916', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 12, 999, 0, 'No', '2.1', 39, 0, 27, 69.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_carrera`
--

CREATE TABLE IF NOT EXISTS `curso_carrera` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`,`idCurso`),
  KEY `idCurso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso_carrera`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_grupo`
--

CREATE TABLE IF NOT EXISTS `curso_grupo` (
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `puntaje` int(2) NOT NULL,
  `actividad` enum('Curso aprobado','Examen aprobado') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idGrupo`,`idCurso`),
  KEY `idCurso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso_grupo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `min` int(2) NOT NULL,
  `max` int(2) NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_cursos`
--

CREATE TABLE IF NOT EXISTS `previas_cursos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idPrevia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `actividad` enum('curso','examen') COLLATE utf8_spanish_ci NOT NULL,
  `actividadPrevia` enum('curso','examen') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`,`idCurso`,`idPrevia`),
  KEY `idCurso` (`idCurso`),
  KEY `idPrevia` (`idPrevia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_grupos`
--

CREATE TABLE IF NOT EXISTS `previas_grupos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `actividad` enum('curso','examen') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`,`idCurso`,`idGrupo`),
  KEY `idCurso` (`idCurso`),
  KEY `idGrupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso_carrera`
--
ALTER TABLE `curso_carrera`
  ADD CONSTRAINT `curso_carrera_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  ADD CONSTRAINT `curso_carrera_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `curso_grupo`
--
ALTER TABLE `curso_grupo`
  ADD CONSTRAINT `curso_grupo_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `curso_grupo_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `previas_cursos`
--
ALTER TABLE `previas_cursos`
  ADD CONSTRAINT `previas_cursos_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  ADD CONSTRAINT `previas_cursos_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`),
  ADD CONSTRAINT `previas_cursos_ibfk_3` FOREIGN KEY (`idPrevia`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `previas_grupos`
--
ALTER TABLE `previas_grupos`
  ADD CONSTRAINT `previas_grupos_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  ADD CONSTRAINT `previas_grupos_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`),
  ADD CONSTRAINT `previas_grupos_ibfk_3` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
