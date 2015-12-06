-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-12-2015 a las 00:49:46
-- Versión del servidor: 5.5.42
-- Versión de PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_previas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idCarrera` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
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

CREATE TABLE `cursos` (
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
  `porcentaje_aprobacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombre`, `descripcion`, `instituto`, `creditos`, `validez`, `semestre`, `exonerable`, `nota_promedio`, `total_cursantes`, `aprobados`, `exonerados`, `porcentaje_aprobacion`) VALUES
('1011', 'TEORIA DE CODIGOS AVANZADO', '', '', 6, 999, 8, 'No', '0', 0, 0, 0, 0),
('1012', 'COMBINATORIA ANALITICA', '', '', 8, 999, 7, 'No', '6.0', 4, 0, 4, 100),
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
('1131', 'INT. A LA FISICA MODERNA', '', '', 10, 20, 8, 'No', '0', 0, 0, 0, 0),
('1151', 'FISICA 1', '', '', 10, 20, 1, 'Sí', '1.0', 1333, 391, 131, 9.8),
('1152', 'FISICA 2', '', '', 10, 20, 2, 'Sí', '1.9', 265, 174, 72, 27.2),
('1153', 'FISICA 3', '', '', 10, 20, 2, 'Sí', '1.8', 359, 205, 91, 25.3),
('1213', 'PLANIF.DE CLASES:DISEÑO DE UNID.DIDACT.', '', '', 2, 999, 7, 'No', '4.7', 3, 0, 3, 100),
('1223', 'CIENCIA, TECNOLOGIA Y SOCIEDAD', '', '', 8, 999, 4, 'No', '0', 0, 0, 0, 0),
('1224', 'ECONOMIA', '', '', 7, 20, 4, 'Sí', '0', 0, 0, 0, 0),
('1225', 'POLITICAS CIENTIFICAS EN INF.Y COMP.', '', '', 3, 999, 4, 'No', '6.7', 6, 0, 6, 100),
('1316', 'INT. A LA COMPUTACION GRAFICA', '', '', 10, 999, 7, 'No', '2.2', 47, 0, 24, 51.1),
('1321', 'PROGRAMACION 2', '', '', 12, 20, 3, 'Sí', '1.8', 429, 221, 128, 29.8),
('1322', 'PROGRAMACION 1', '', '', 10, 20, 2, 'Sí', '0', 0, 0, 0, 0),
('1323', 'PROGRAMACION 3', '', '', 15, 20, 4, 'Sí', '0', 0, 0, 0, 0),
('1324', 'PROGRAMACION 4', '', '', 15, 20, 5, 'Sí', '2.7', 209, 192, 108, 51.7),
('1325', 'TEORIA DE LENGUAJES', '', '', 12, 20, 5, 'Sí', '2.8', 190, 174, 101, 53.2),
('1327', 'TALLER DE PROGRAMACION', '', '', 15, 999, 6, 'No', '0', 0, 0, 0, 0),
('1328', 'INT. A LA PROGRAMACION FUNCIONAL', '', '', 7, 999, 7, 'No', '2.2', 161, 0, 125, 77.6),
('1331', 'DISEÑO DE COMPILADORES', '', '', 12, 999, 7, 'No', '4.4', 63, 0, 61, 96.8),
('1333', 'INT. A LA PROGRAMACION GENERICA', '', '', 10, 999, 9, 'No', '0', 0, 0, 0, 0),
('1340', 'PROGRAMACION LOGICA', '', '', 10, 999, 7, 'No', '2.4', 68, 0, 58, 85.3),
('1347', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 12, 999, 8, 'No', '0', 0, 0, 0, 0),
('1350', 'PROGRAMACION FUNCIONAL AVANZADA', '', '', 12, 999, 8, 'No', '3.7', 7, 0, 7, 100),
('1351', 'COMBINATORIA ANALITICA Y APLICACIONES', '', '', 3, 999, 7, 'No', '0', 0, 0, 0, 0),
('1358', 'TEORIA DE LA COMPUTACION', '', '', 7, 999, 7, 'No', '5.3', 5, 0, 5, 100),
('1414', 'SISTEMAS DISTRIBUIDOS', '', '', 15, 999, 7, 'No', '0', 0, 0, 0, 0),
('1416', 'INT. A LA CRIPTOGRAFIA', '', '', 12, 999, 7, 'No', '0', 0, 0, 0, 0),
('1434', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1435', 'DISEÑO TOPOLOGICO DE REDES', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1437', 'TALLER DE SEGURIDAD INFORMATICA', '', '', 7, 999, 8, 'No', '0', 0, 0, 0, 0),
('1438', 'APL.DE TEORIA DE LA INF.AL PROC.DE IMAG.', '', '', 6, 999, 8, 'No', '0.5', 10, 0, 2, 20),
('1440', 'ANAL.Y DIS.DE ALGORIT.DISTRIB.EN REDES', '', '', 8, 999, 8, 'No', '3.8', 12, 0, 12, 100),
('1441', 'CURVAS ELIPTICAS EN CRIPTOGRAFIA', '', '', 3, 999, 7, 'No', '0', 0, 0, 0, 0),
('1442', 'ROBOTICA EMBEBIDA', '', '', 10, 999, 8, 'No', '3.9', 12, 0, 10, 83.3),
('1443', 'ARQUITECTURA DE COMPUTADORAS', '', '', 12, 56, 4, 'No', '0', 0, 0, 0, 0),
('1444', 'ASPECTOS AVANZ. DE ARQ.DE COMPUTADORAS', '', '', 8, 999, 7, 'No', '0.8', 12, 0, 3, 25),
('1445', 'TALLER DE ARQUITECTURA DE COMPUTADORAS', '', '', 3, 999, 7, 'No', '0.9', 54, 0, 23, 42.6),
('1446', 'REDES DE COMPUTADORAS', '', '', 12, 56, 6, 'No', '0', 0, 0, 0, 0),
('1447', 'COMPUT.DE PR.GRAL.EN UNID.DE PROC.GRAF.', '', '', 7, 999, 8, 'No', '0', 0, 0, 0, 0),
('1448', 'ASPECTOS AVANZ. DE REDES DE COMPUTADORAS', '', '', 8, 999, 7, 'No', '2.1', 21, 0, 14, 66.7),
('1449', 'TALLER DE GPGPU', '', '', 7, 999, 8, 'No', '3.0', 3, 0, 3, 100),
('1450', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 8, 999, 7, 'No', '1.4', 17, 0, 7, 41.2),
('1507', 'INT. A LAS ORGANIZACIONES', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1510', 'CONTROL DE CALIDAD', '', '', 8, 20, 8, 'No', '0', 0, 0, 0, 0),
('1519', 'INT. A LA ADMINISTRACION PARA INGENIEROS', '', '', 10, 20, 6, 'Sí', '0', 0, 0, 0, 0),
('1535', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1537', 'SISTEMAS OPERATIVOS', '', '', 12, 20, 5, 'Sí', '1.4', 349, 232, 38, 10.9),
('1543', 'INT. AL NEGOCIO DEL SOFTWARE', '', '', 6, 999, 8, 'No', '0', 0, 0, 0, 0),
('1610', 'INT. A LA INVESTIGACION DE OPERACIONES', '', '', 10, 20, 5, 'Sí', '3.2', 320, 304, 237, 74.1),
('1613', 'METAHEURISTICAS Y OPTIMIZ.SOBRE REDES', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1617', 'SIMULACION A EVENTOS DISCRETOS', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1624', 'MODELADO Y OPTIMIZACION', '', '', 6, 999, 8, 'No', '0', 0, 0, 0, 0),
('1628', 'ALGORITMOS EVOLUTIVOS', '', '', 9, 999, 7, 'No', '2.8', 69, 0, 49, 71),
('1629', 'INT. A LA OPTIMIZ.Y A LA PROG. CON RESTR', '', '', 6, 999, 7, 'No', '0', 0, 0, 0, 0),
('1630', 'INVESTIGACION DE OPER.Y GEST. DE RIESGOS', '', '', 6, 999, 8, 'No', '0', 0, 0, 0, 0),
('1631', 'FUNDAMENTOS DE PROGRAMACION ENTERA', '', '', 8, 999, 7, 'No', '0', 0, 0, 0, 0),
('1632', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 8, 999, 7, 'No', '2.4', 23, 0, 16, 69.6),
('1716', 'INT. A LA INGENIERIA DE SOFTWARE', '', '', 10, 20, 7, 'Sí', '2.5', 114, 109, 66, 57.9),
('1721', 'PROYECTO DE INGENIERIA DE SOFTWARE', '', '', 15, 999, 8, 'No', '0', 0, 0, 0, 0),
('1730', 'PROYECTO DE GRADO', '', '', 30, 999, 9, 'No', '10.8', 66, 0, 64, 97),
('1731', 'PASANTIA (COMPUTACION)', '', '', 10, 999, 7, 'No', 'S/N', 63, 0, 63, 100),
('1734', 'TALLER SISTEMAS DE INFORMACION 1', '', '', 6, 999, 7, 'No', '0', 0, 0, 0, 0),
('1735', 'TALLER SISTEMAS DE INFORMACION 2', '', '', 15, 999, 8, 'No', '0', 0, 0, 0, 0),
('1740', 'TALLER DE SISTEMAS DE INFORMACION 3', '', '', 8, 999, 9, 'No', '0', 0, 0, 0, 0),
('1741', 'TALLER DE SISTEMAS DE INFORMACION 4', '', '', 15, 999, 10, 'No', '0', 0, 0, 0, 0),
('1742', 'TALLER DE VERIFICACION DEL SOFTWARE', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1749', 'INTERACCION PERSONA COMPUTADORA', '', '', 12, 999, 7, 'No', '0', 0, 0, 0, 0),
('1751', 'TALLER DE SISTEMAS DE INFORMACION 1', '', '', 10, 999, 7, 'No', '3.9', 40, 0, 40, 100),
('1758', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 10, 999, 7, 'No', '2.3', 40, 0, 36, 90),
('1759', 'TALLER DE SIST. DE INF.GEOGRAF.EMPRESAR.', '', '', 8, 999, 7, 'No', '4.7', 40, 0, 40, 100),
('1766', 'TALLER DE GEST.Y TEC.PROC.NEGOCIO (TBPM)', '', '', 10, 999, 7, 'No', '4.5', 38, 0, 37, 97.4),
('1767', 'PRINC.Y FUND.DEL PROC.PERS.DE SOFTWARE', '', '', 7, 999, 7, 'No', 'S/N', 26, 0, 25, 96.2),
('1768', 'TALLER DE INTERACCION PERSONA COMPUTAD.', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1769', 'PROFESION EN INGENIERIA DE SOFTWARE', '', '', 4, 999, 8, 'No', '2.7', 34, 0, 30, 88.2),
('1827', 'APRENDIZAJE AUTOMATICO', '', '', 7, 999, 8, 'No', '0', 0, 0, 0, 0),
('1828', 'INT. AL PROCESAMIENTO DE LENG. NATURAL', '', '', 12, 999, 8, 'No', '0', 0, 0, 0, 0),
('1834', 'METODOS DE APRENDIZAJE AUTOMATICO', '', '', 9, 999, 8, 'No', '0', 0, 0, 0, 0),
('1835', 'GRAMATICAS FORMALES PARA EL LENG.NATURAL', '', '', 10, 999, 8, 'No', '1.3', 27, 0, 15, 55.6),
('1848', 'ROBOTICA BASADA EN COMPORTAMIENTOS', '', '', 15, 999, 8, 'No', '0', 0, 0, 0, 0),
('1849', 'BUTIA: ROBOTICA EDUCATIVA', '', '', 8, 999, 7, 'No', '3.6', 20, 0, 20, 100),
('1911', 'FUNDAMENTOS DE BASES DE DATOS', '', '', 15, 20, 6, 'Sí', '0', 0, 0, 0, 0),
('1918', 'ADMINISTRACION Y SEGURIDAD DE SISTEMAS', '', '', 10, 999, 7, 'No', '2.7', 47, 0, 43, 91.5),
('1926', 'INT. A LOS SIST. DE INFOR. GEOGRAFICA', '', '', 10, 999, 8, 'No', '3.4', 31, 0, 27, 87.1),
('1930', 'ORGANIZACIONES PARA INGENIEROS', '', '', 6, 20, 8, 'No', '0', 0, 0, 0, 0),
('1933', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 15, 999, 7, 'No', '4.2', 173, 0, 173, 100),
('1935', 'CALIDAD DE DATOS', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1936', 'INT. AL MIDDLEWARE', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1937', 'SISTEMAS DE INFORMACION EN SALUD', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1938', 'RECUP.DE INF.Y RECOMEND.EN LA WEB (WIR)', '', '', 10, 999, 8, 'No', '0', 0, 0, 0, 0),
('1939', 'DISEÑO Y CONSTRUCCION DE DATA WAREHOUSE', '', '', 10, 999, 7, 'No', '0', 0, 0, 0, 0),
('1940', 'GESTION DE CALIDAD', '', '', 6, 9, 8, 'No', '1.3', 102, 50, 15, 14.7),
('1941', 'INTEGRACION DE DATOS', '', '', 8, 999, 7, 'No', '2.6', 76, 0, 61, 80.3),
('1942', 'FUNDAMENTOS DE LA WEB SEMANTICA', '', '', 8, 999, 8, 'No', '0', 0, 0, 0, 0),
('1944', 'ADMINISTRACION GENERAL PARA INGENIEROS', '', '', 5, 20, 8, 'No', '1.8', 21, 11, 7, 33.3),
('1947', 'TALLER DE LENG.Y TEC.DE LA WEB SEMANTICA', '', '', 10, 999, 7, 'No', '0', 0, 0, 0, 0),
('2034', 'TALLER ENCARARE 1:CREATIVIDAD E INNOVAC.', '', '', 5, 999, 7, 'No', '3.6', 18, 0, 18, 100),
('2036', 'TALLER ENCARARE 2:PLANIF.DE LA FUT.EMPR.', '', '', 5, 999, 8, 'No', '0', 0, 0, 0, 0),
('5705', 'SEMINARIO DE INGENIERIA BIOMEDICA', '', '', 4, 999, 9, 'No', 'S/N', 17, 0, 17, 100),
('5707', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 8, 999, 9, 'No', '2.0', 5, 0, 3, 60),
('5914', 'ALGEBRA LINEAL NUMERICA', '', '', 9, 999, 7, 'No', '4.0', 2, 0, 2, 100),
('5916', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 12, 999, 7, 'No', '2.1', 39, 0, 27, 69.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_carrera`
--

CREATE TABLE `curso_carrera` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso_carrera`
--

INSERT INTO `curso_carrera` (`idCarrera`, `idCurso`) VALUES
('7200', '1011'),
('7200', '1012'),
('7200', '1020'),
('7200', '1022'),
('7200', '1023'),
('7200', '1024'),
('7200', '1025'),
('7200', '1026'),
('7200', '1027'),
('7200', '1028'),
('7200', '1030'),
('7200', '1031'),
('7200', '1033'),
('7200', '1042'),
('7200', '1046'),
('7200', '1052'),
('7200', '1053'),
('7200', '1057'),
('7200', '1059'),
('7200', '1131'),
('7200', '1151'),
('7200', '1152'),
('7200', '1153'),
('7200', '1213'),
('7200', '1223'),
('7200', '1224'),
('7200', '1225'),
('7200', '1316'),
('7200', '1321'),
('7200', '1322'),
('7200', '1323'),
('7200', '1324'),
('7200', '1325'),
('7200', '1327'),
('7200', '1328'),
('7200', '1331'),
('7200', '1333'),
('7200', '1340'),
('7200', '1347'),
('7200', '1350'),
('7200', '1351'),
('7200', '1358'),
('7200', '1414'),
('7200', '1416'),
('7200', '1434'),
('7200', '1435'),
('7200', '1437'),
('7200', '1438'),
('7200', '1440'),
('7200', '1441'),
('7200', '1442'),
('7200', '1443'),
('7200', '1444'),
('7200', '1445'),
('7200', '1446'),
('7200', '1447'),
('7200', '1448'),
('7200', '1449'),
('7200', '1450'),
('7200', '1507'),
('7200', '1510'),
('7200', '1519'),
('7200', '1535'),
('7200', '1537'),
('7200', '1543'),
('7200', '1610'),
('7200', '1613'),
('7200', '1617'),
('7200', '1624'),
('7200', '1628'),
('7200', '1629'),
('7200', '1630'),
('7200', '1631'),
('7200', '1632'),
('7200', '1716'),
('7200', '1721'),
('7200', '1730'),
('7200', '1731'),
('7200', '1734'),
('7200', '1735'),
('7200', '1740'),
('7200', '1741'),
('7200', '1742'),
('7200', '1749'),
('7200', '1751'),
('7200', '1758'),
('7200', '1759'),
('7200', '1766'),
('7200', '1767'),
('7200', '1768'),
('7200', '1769'),
('7200', '1827'),
('7200', '1828'),
('7200', '1834'),
('7200', '1835'),
('7200', '1848'),
('7200', '1849'),
('7200', '1911'),
('7200', '1918'),
('7200', '1926'),
('7200', '1930'),
('7200', '1933'),
('7200', '1935'),
('7200', '1936'),
('7200', '1937'),
('7200', '1938'),
('7200', '1939'),
('7200', '1940'),
('7200', '1941'),
('7200', '1942'),
('7200', '1944'),
('7200', '1947'),
('7200', '2034'),
('7200', '2036'),
('7200', '5705'),
('7200', '5707'),
('7200', '5914'),
('7200', '5916');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_grupo`
--

CREATE TABLE `curso_grupo` (
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `puntaje` int(2) NOT NULL,
  `actividad` enum('CURSO','EXAMEN') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso_grupo`
--

INSERT INTO `curso_grupo` (`idGrupo`, `idCurso`, `puntaje`, `actividad`) VALUES
('1000', '1030', 1, 'EXAMEN'),
('1000', '1031', 1, 'EXAMEN'),
('1000', '1053', 1, 'EXAMEN'),
('1001', '1020', 3, 'EXAMEN'),
('1001', '1022', 1, 'CURSO'),
('1001', '1052', 3, 'EXAMEN'),
('1002', '1030', 1, 'EXAMEN'),
('1002', '1053', 1, 'EXAMEN'),
('1012', '1322', 1, 'EXAMEN'),
('1013', '1321', 1, 'CURSO'),
('1020', '1020', 1, 'EXAMEN'),
('1020', '1052', 1, 'EXAMEN'),
('1020C', '1020', 1, 'CURSO'),
('1020C', '1020', 1, 'EXAMEN'),
('1020C', '1052', 1, 'CURSO'),
('1020C', '1052', 1, 'EXAMEN'),
('1020E', '1020', 1, 'EXAMEN'),
('1020E', '1052', 1, 'EXAMEN'),
('1022', '1020', 1, 'EXAMEN'),
('1022', '1052', 1, 'EXAMEN'),
('1023', '1023', 3, 'CURSO'),
('1023C', '1023', 5, 'CURSO'),
('1023E', '1023', 1, 'EXAMEN'),
('1023E', '1026', 1, 'EXAMEN'),
('1025C', '1025', 1, 'CURSO'),
('1025E', '1025', 1, 'EXAMEN'),
('1026', '1026', 5, 'EXAMEN'),
('1029', '1023', 5, 'EXAMEN'),
('1030', '1030', 1, 'EXAMEN'),
('1030', '1053', 1, 'EXAMEN'),
('1030C', '1030', 1, 'CURSO'),
('1030C', '1030', 1, 'EXAMEN'),
('1030C', '1053', 1, 'CURSO'),
('1030C', '1053', 1, 'EXAMEN'),
('1030E', '1030', 1, 'EXAMEN'),
('1030E', '1053', 1, 'EXAMEN'),
('1031A', '1030', 1, 'EXAMEN'),
('1031A', '1031', 1, 'CURSO'),
('1031A', '1053', 1, 'EXAMEN'),
('1031E', '1031', 1, 'EXAMEN'),
('1033E', '1033', 1, 'EXAMEN'),
('1042', '1042', 1, 'CURSO'),
('1042', '1046', 1, 'CURSO'),
('1121E', '1153', 1, 'EXAMEN'),
('1320', '1322', 1, 'CURSO'),
('1321', '1321', 1, 'EXAMEN'),
('1322E', '1322', 1, 'EXAMEN'),
('1323', '1323', 1, 'CURSO'),
('1324', '1323', 2, 'EXAMEN'),
('1324', '1324', 2, 'CURSO'),
('1324', '1324', 4, 'EXAMEN'),
('1324C', '1324', 2, 'CURSO'),
('1324E', '1324', 2, 'EXAMEN'),
('1325E', '1325', 1, 'EXAMEN'),
('1327', '1327', 2, 'CURSO'),
('1328', '1328', 1, 'CURSO'),
('1328', '1340', 1, 'CURSO'),
('1403C', '1443', 1, 'CURSO'),
('1403E', '1443', 1, 'EXAMEN'),
('1403E', '1444', 1, 'CURSO'),
('1403E', '1445', 1, 'CURSO'),
('1406C', '1446', 1, 'CURSO'),
('1406E', '1446', 1, 'EXAMEN'),
('1424E', '1443', 1, 'EXAMEN'),
('1425C', '1444', 1, 'CURSO'),
('1425C', '1445', 1, 'CURSO'),
('1425C', '1446', 1, 'CURSO'),
('1511', '1537', 1, 'CURSO'),
('1511E', '1537', 1, 'EXAMEN'),
('1610E', '1610', 1, 'EXAMEN'),
('1716C', '1716', 1, 'CURSO'),
('1716E', '1716', 1, 'EXAMEN'),
('1721', '1721', 1, 'CURSO'),
('1734', '1734', 1, 'CURSO'),
('1734', '1735', 1, 'CURSO'),
('1734', '1751', 1, 'CURSO'),
('1911C', '1911', 1, 'CURSO'),
('1911E', '1911', 1, 'EXAMEN'),
('1918', '1507', 10, 'EXAMEN'),
('1918', '1510', 8, 'EXAMEN'),
('1918', '1519', 10, 'CURSO'),
('1918', '1519', 10, 'EXAMEN'),
('2LOG', '1027', 1, 'CURSO'),
('C1020', '1020', 1, 'CURSO'),
('C1020', '1052', 1, 'CURSO'),
('C1425', '1443', 1, 'CURSO'),
('C1425', '1444', 1, 'CURSO'),
('C1425', '1445', 1, 'CURSO'),
('CA1Y2', '1020', 1, 'EXAMEN'),
('CA1Y2', '1022', 1, 'EXAMEN'),
('CA1Y2', '1052', 1, 'EXAMEN'),
('CP29', '1323', 1, 'EXAMEN'),
('CP30', '1324', 4, 'EXAMEN'),
('CP30', '1327', 2, 'CURSO'),
('CP4', '1027', 1, 'EXAMEN'),
('E1403', '1446', 1, 'EXAMEN'),
('E1403', '1911', 1, 'EXAMEN'),
('F1C', '1151', 1, 'CURSO'),
('F1E', '1151', 1, 'EXAMEN'),
('FIS', '1151', 1, 'CURSO'),
('FIS', '1151', 2, 'EXAMEN'),
('FIS', '1152', 1, 'CURSO'),
('FISIC', '1151', 1, 'EXAMEN'),
('LOGIC', '1023', 1, 'EXAMEN'),
('LOGIC', '1027', 1, 'EXAMEN'),
('MATD1', '1023', 1, 'EXAMEN'),
('PR1', '1322', 1, 'EXAMEN'),
('PROBA', '1025', 1, 'EXAMEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `min` int(2) NOT NULL,
  `max` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idGrupo`, `nombre`, `min`, `max`) VALUES
('1000', 'GEOMETRIA', 2, 4),
('1001', 'CALCULOS Y ANALISIS', 4, 6),
('1002', 'ALGEBRA Y GEOMETRIA', 1, 1),
('1012', 'TALLER Y PROGRAMACION', 1, 3),
('1013', 'PROGRAMACION 2', 1, 1),
('1020', 'CALCULO 1 Y ANALISIS MATEM.I', 1, 1),
('1020C', 'CALCULO 1', 1, 3),
('1020E', 'CALCULO 1 SEM. O ANUAL', 1, 1),
('1022', 'CALCULO 1 Y ANALISIS', 1, 2),
('1023', 'ADAPTACION MAT.DISCRETA 1', 3, 6),
('1023C', 'MAT.DISCRETA 1', 5, 5),
('1023E', 'MAT.DISCRETA 1 Y 2', 2, 2),
('1025C', 'PROBABILIDAD Y ESTADISTICA', 1, 1),
('1025E', 'PROB.YEST.-ANAL.MAT.II', 1, 1),
('1026', 'MAT.DISCRETA 2 Y ADAPTACIONES', 5, 11),
('1029', 'MAT.DIS.1-GEOM.Y ALG.-ANAL.1Y2', 5, 11),
('1030', 'GEOM Y ALG 1 Y ALG LINEAL', 1, 2),
('1030C', 'GEOM. 1 SEM. O ANUAL', 1, 3),
('1030E', 'GEOM. 1 SEM O ANUAL', 1, 1),
('1031A', 'GEOMETRIA 2C Y 1E', 2, 2),
('1031E', 'GEOM.Y ALG.LINEAL 2', 1, 1),
('1033E', 'MET.NUMERICOS O CAL. NUM.', 1, 1),
('1042', 'TEORIA DE CODIGOS O T.COD.ALG.', 1, 1),
('1121E', 'FIS.GRAL.2 Ã’ ELECTROMAG.P89', 1, 2),
('1320', 'PROGR.Y TALLER', 1, 2),
('1321', 'PROGRAMACION 2-PROGRAMACION II', 1, 1),
('1322E', 'PROGRAM. 1', 1, 1),
('1323', 'PROGRAMACION3-PROGRAMACION III', 1, 1),
('1324', 'PROGRAMACION 3 Y 4', 4, 4),
('1324C', 'PROGR.4 C O TALLER III', 2, 2),
('1324E', 'PROGR.4 - TALLER III', 2, 2),
('1325E', 'TEORIA DE LENG. O TEO. PROG.I', 1, 1),
('1327', 'TALLER DE PROGR.Y TALLER III', 2, 2),
('1328', 'PROGR.FUNC. O PROGR.LOGICA', 1, 1),
('1403C', 'INTR.ARQ.COMP.- ARQ.DE SIST.', 1, 1),
('1403E', 'INT.ARQ.COMP. O ARQ.COMP.2', 1, 1),
('1406C', 'INT.REDES COMP. O COM.DE DATOS', 1, 1),
('1406E', 'INT.REDES COMP. O COM.DE DATOS', 1, 1),
('1424E', 'ARQ.COMP.1 O INT.ARQ.COMP.', 1, 1),
('1425C', 'ARQ.COMP.2 O INT.ARQ.COMP.', 1, 1),
('1511', 'SISTEMAS OPERATIVOS', 1, 1),
('1511E', 'SISTEMAS OPERATIVOS', 1, 1),
('1610E', 'INTR.INVESTIG.OPER- INV.OPERAT', 1, 1),
('1716C', 'INT.ING.SOFT.O TALLER IV', 1, 1),
('1716E', 'INT.ING.SOFT.O TALLER IV', 1, 1),
('1721', 'PROY.ING.SOFT.O TALLER IV', 1, 1),
('1734', 'TALLER SIST.DE INF. 1 O 2', 1, 2),
('1911C', 'FUND.BASE DATOS O BASE DATOS', 1, 1),
('1911E', 'FUND.BASE DATOS O BASE DATOS', 1, 1),
('1918', 'GESTION EN ORGANIZACIONES', 8, 46),
('2LOG', 'LOGICA CP4(E)-LOGICA1027(C)', 1, 1),
('C1020', 'CALCULO 1', 1, 1),
('C1425', 'ARQUITECTURAS', 1, 1),
('CA1Y2', 'CAL 1 Y 2 Y ANAL 1', 2, 4),
('CP29', 'PROGRAMACION III O 3', 1, 1),
('CP30', 'TALIII - PROG.4 Y TALL.PROGRAM', 6, 6),
('CP4', 'LOGICA (87) Y LOGICA (97)', 1, 1),
('E1403', 'ARQUITECTURAS', 1, 1),
('F1C', 'FISICA 1 O FISICA GRAL 1', 1, 1),
('F1E', 'FISICA 1 O FISICA GRAL.1', 1, 1),
('FIS', 'FISICAS', 2, 4),
('FISIC', 'FISICA GENERAL 1 O 2', 1, 1),
('LOGIC', 'MATEMATICA DISCRETA 1-LOGICAS', 2, 3),
('MATD1', 'MAT.DISCRETA 1 Y LOGICA', 1, 2),
('PR1', 'PROGRAMACION 1', 1, 2),
('PROBA', 'PROB.Y ESTAD.Y ANAL.MATEM.II', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_creditos`
--

CREATE TABLE `previas_creditos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `area` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `creditos` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `previas_creditos`
--

INSERT INTO `previas_creditos` (`idCarrera`, `idCurso`, `area`, `creditos`) VALUES
('7200', '1213', 'CARRERA', 100),
('7200', '1507', 'CARRERA', 100),
('7200', '1510', 'CARRERA', 80),
('7200', '1519', 'CARRERA', 100),
('7200', '1730', 'CARRERA', 330),
('7200', '1769', 'CARRERA', 250),
('7200', '1849', 'CARRERA', 100),
('7200', '1941', 'CARRERA', 250),
('7200', '1944', 'CARRERA', 250),
('7200', '2034', 'CARRERA', 250),
('7200', '2036', 'CARRERA', 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_cursos`
--

CREATE TABLE `previas_cursos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idPrevia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `actividad` enum('CURSO','EXAMEN') COLLATE utf8_spanish_ci NOT NULL,
  `actividadPrevia` enum('CURSO','EXAMEN') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `previas_cursos`
--

INSERT INTO `previas_cursos` (`idCarrera`, `idCurso`, `idPrevia`, `actividad`, `actividadPrevia`) VALUES
('7200', '1020', '1020', 'EXAMEN', 'CURSO'),
('7200', '1022', '1022', 'EXAMEN', 'CURSO'),
('7200', '1023', '1023', 'EXAMEN', 'CURSO'),
('7200', '1024', '1024', 'EXAMEN', 'CURSO'),
('7200', '1025', '1025', 'EXAMEN', 'CURSO'),
('7200', '1026', '1023', 'CURSO', 'CURSO'),
('7200', '1026', '1026', 'EXAMEN', 'CURSO'),
('7200', '1027', '1027', 'EXAMEN', 'CURSO'),
('7200', '1028', '1028', 'EXAMEN', 'CURSO'),
('7200', '1030', '1030', 'EXAMEN', 'CURSO'),
('7200', '1031', '1031', 'EXAMEN', 'CURSO'),
('7200', '1033', '1033', 'EXAMEN', 'CURSO'),
('7200', '1052', '1052', 'EXAMEN', 'CURSO'),
('7200', '1053', '1053', 'EXAMEN', 'CURSO'),
('7200', '1131', '1131', 'EXAMEN', 'CURSO'),
('7200', '1151', '1151', 'EXAMEN', 'CURSO'),
('7200', '1152', '1152', 'EXAMEN', 'CURSO'),
('7200', '1153', '1153', 'EXAMEN', 'CURSO'),
('7200', '1224', '1224', 'EXAMEN', 'CURSO'),
('7200', '1321', '1321', 'EXAMEN', 'CURSO'),
('7200', '1322', '1322', 'EXAMEN', 'CURSO'),
('7200', '1323', '1323', 'EXAMEN', 'CURSO'),
('7200', '1324', '1324', 'EXAMEN', 'CURSO'),
('7200', '1325', '1325', 'EXAMEN', 'CURSO'),
('7200', '1333', '1328', 'CURSO', 'CURSO'),
('7200', '1350', '1328', 'CURSO', 'CURSO'),
('7200', '1442', '1151', 'CURSO', 'EXAMEN'),
('7200', '1443', '1443', 'EXAMEN', 'CURSO'),
('7200', '1446', '1446', 'EXAMEN', 'CURSO'),
('7200', '1449', '1447', 'CURSO', 'CURSO'),
('7200', '1507', '1507', 'EXAMEN', 'CURSO'),
('7200', '1510', '1510', 'EXAMEN', 'CURSO'),
('7200', '1519', '1519', 'EXAMEN', 'CURSO'),
('7200', '1537', '1537', 'EXAMEN', 'CURSO'),
('7200', '1610', '1610', 'EXAMEN', 'CURSO'),
('7200', '1716', '1716', 'EXAMEN', 'CURSO'),
('7200', '1721', '1716', 'CURSO', 'CURSO'),
('7200', '1730', '1033', 'CURSO', 'EXAMEN'),
('7200', '1730', '1224', 'CURSO', 'EXAMEN'),
('7200', '1730', '1225', 'CURSO', 'EXAMEN'),
('7200', '1730', '1446', 'CURSO', 'EXAMEN'),
('7200', '1730', '1610', 'CURSO', 'EXAMEN'),
('7200', '1730', '1721', 'CURSO', 'EXAMEN'),
('7200', '1730', '1911', 'CURSO', 'EXAMEN'),
('7200', '1768', '1749', 'CURSO', 'CURSO'),
('7200', '1911', '1911', 'EXAMEN', 'CURSO'),
('7200', '1930', '1930', 'EXAMEN', 'CURSO'),
('7200', '1940', '1940', 'EXAMEN', 'CURSO'),
('7200', '5705', '1721', 'CURSO', 'CURSO'),
('7200', '5707', '1151', 'CURSO', 'EXAMEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_grupos`
--

CREATE TABLE `previas_grupos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `actividad` enum('CURSO','EXAMEN') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `previas_grupos`
--

INSERT INTO `previas_grupos` (`idCarrera`, `idCurso`, `idGrupo`, `actividad`) VALUES
('7200', '1011', '1042', 'CURSO'),
('7200', '1012', '1026', 'CURSO'),
('7200', '1012', '1029', 'CURSO'),
('7200', '1012', '1031E', 'CURSO'),
('7200', '1012', 'CP29', 'CURSO'),
('7200', '1022', '1020E', 'EXAMEN'),
('7200', '1022', 'C1020', 'CURSO'),
('7200', '1024', '1001', 'CURSO'),
('7200', '1024', '1030', 'CURSO'),
('7200', '1025', '1001', 'CURSO'),
('7200', '1025', '1002', 'CURSO'),
('7200', '1026', '1030', 'CURSO'),
('7200', '1027', '1023', 'CURSO'),
('7200', '1028', '1000', 'CURSO'),
('7200', '1028', '1001', 'CURSO'),
('7200', '1031', '1030C', 'CURSO'),
('7200', '1031', '1030E', 'EXAMEN'),
('7200', '1033', '1000', 'CURSO'),
('7200', '1033', 'CA1Y2', 'CURSO'),
('7200', '1033', 'PR1', 'CURSO'),
('7200', '1042', '1000', 'CURSO'),
('7200', '1042', '1026', 'CURSO'),
('7200', '1042', '1029', 'CURSO'),
('7200', '1042', 'CA1Y2', 'CURSO'),
('7200', '1042', 'CP29', 'CURSO'),
('7200', '1042', 'PROBA', 'CURSO'),
('7200', '1046', '1000', 'CURSO'),
('7200', '1046', '1023E', 'CURSO'),
('7200', '1046', '1025E', 'CURSO'),
('7200', '1046', 'CA1Y2', 'CURSO'),
('7200', '1046', 'CP29', 'CURSO'),
('7200', '1057', '1025E', 'CURSO'),
('7200', '1057', '1033E', 'CURSO'),
('7200', '1057', '1610E', 'CURSO'),
('7200', '1059', '1020E', 'CURSO'),
('7200', '1059', '1029', 'CURSO'),
('7200', '1059', '1030', 'CURSO'),
('7200', '1059', '1322E', 'CURSO'),
('7200', '1131', '1121E', 'CURSO'),
('7200', '1152', '1020C', 'CURSO'),
('7200', '1152', '1022', 'EXAMEN'),
('7200', '1152', 'F1C', 'CURSO'),
('7200', '1152', 'F1E', 'EXAMEN'),
('7200', '1153', '1020C', 'CURSO'),
('7200', '1153', '1022', 'EXAMEN'),
('7200', '1153', 'F1E', 'EXAMEN'),
('7200', '1153', 'FIS', 'CURSO'),
('7200', '1316', '1031A', 'CURSO'),
('7200', '1316', '1324E', 'CURSO'),
('7200', '1316', 'CP29', 'CURSO'),
('7200', '1321', '1320', 'CURSO'),
('7200', '1323', '1012', 'CURSO'),
('7200', '1323', '1013', 'CURSO'),
('7200', '1323', '1029', 'CURSO'),
('7200', '1324', '1020', 'CURSO'),
('7200', '1324', '1030', 'CURSO'),
('7200', '1324', '1321', 'CURSO'),
('7200', '1324', '1323', 'CURSO'),
('7200', '1324', 'MATD1', 'CURSO'),
('7200', '1325', '1020', 'CURSO'),
('7200', '1325', '1030', 'CURSO'),
('7200', '1325', '1323', 'CURSO'),
('7200', '1325', 'LOGIC', 'CURSO'),
('7200', '1327', '1324', 'CURSO'),
('7200', '1328', '1029', 'CURSO'),
('7200', '1328', '1321', 'CURSO'),
('7200', '1328', '1325E', 'CURSO'),
('7200', '1328', 'CP4', 'CURSO'),
('7200', '1331', '1325E', 'CURSO'),
('7200', '1331', 'CP29', 'CURSO'),
('7200', '1331', 'CP30', 'CURSO'),
('7200', '1340', '1026', 'CURSO'),
('7200', '1340', '1325E', 'CURSO'),
('7200', '1340', 'CP29', 'CURSO'),
('7200', '1340', 'CP4', 'CURSO'),
('7200', '1347', '1328', 'CURSO'),
('7200', '1347', 'CP4', 'CURSO'),
('7200', '1351', '1000', 'CURSO'),
('7200', '1351', '1025E', 'CURSO'),
('7200', '1351', '1026', 'CURSO'),
('7200', '1351', '1029', 'CURSO'),
('7200', '1351', '1323', 'CURSO'),
('7200', '1358', '1325E', 'CURSO'),
('7200', '1414', '1321', 'CURSO'),
('7200', '1414', '1325E', 'CURSO'),
('7200', '1414', '1403E', 'CURSO'),
('7200', '1414', '1406C', 'CURSO'),
('7200', '1414', '1511E', 'CURSO'),
('7200', '1414', '1911E', 'CURSO'),
('7200', '1414', 'CP29', 'CURSO'),
('7200', '1414', 'CP30', 'CURSO'),
('7200', '1414', 'CP4', 'CURSO'),
('7200', '1414', 'PR1', 'CURSO'),
('7200', '1416', '1025E', 'CURSO'),
('7200', '1416', '1026', 'CURSO'),
('7200', '1416', '1029', 'CURSO'),
('7200', '1416', 'CP29', 'CURSO'),
('7200', '1434', '1324C', 'CURSO'),
('7200', '1434', '1403C', 'CURSO'),
('7200', '1434', '1406C', 'CURSO'),
('7200', '1434', '1511', 'CURSO'),
('7200', '1435', '1610E', 'CURSO'),
('7200', '1437', '1406C', 'CURSO'),
('7200', '1437', '1911E', 'CURSO'),
('7200', '1437', 'CP29', 'CURSO'),
('7200', '1438', '1025E', 'CURSO'),
('7200', '1440', '1406E', 'CURSO'),
('7200', '1440', 'CP29', 'CURSO'),
('7200', '1441', '1000', 'CURSO'),
('7200', '1441', '1025E', 'CURSO'),
('7200', '1441', '1026', 'CURSO'),
('7200', '1441', '1029', 'CURSO'),
('7200', '1441', '1323', 'CURSO'),
('7200', '1442', '1424E', 'CURSO'),
('7200', '1442', '1425C', 'CURSO'),
('7200', '1442', '1511', 'CURSO'),
('7200', '1442', 'CP29', 'CURSO'),
('7200', '1443', '1013', 'CURSO'),
('7200', '1443', '1020', 'CURSO'),
('7200', '1443', '1023C', 'CURSO'),
('7200', '1443', '1322E', 'CURSO'),
('7200', '1444', '1424E', 'CURSO'),
('7200', '1444', '1511', 'CURSO'),
('7200', '1445', '1424E', 'CURSO'),
('7200', '1445', '1511', 'CURSO'),
('7200', '1446', '1020', 'CURSO'),
('7200', '1446', '1403C', 'CURSO'),
('7200', '1446', '1511', 'CURSO'),
('7200', '1446', 'CP29', 'CURSO'),
('7200', '1447', '1324C', 'CURSO'),
('7200', '1447', '1424E', 'CURSO'),
('7200', '1447', 'CP29', 'CURSO'),
('7200', '1448', '1406C', 'CURSO'),
('7200', '1450', 'PROBA', 'CURSO'),
('7200', '1535', '1324E', 'CURSO'),
('7200', '1535', '1511E', 'CURSO'),
('7200', '1537', '1020', 'CURSO'),
('7200', '1537', '1029', 'CURSO'),
('7200', '1537', '1030', 'CURSO'),
('7200', '1537', '1321', 'CURSO'),
('7200', '1537', '1323', 'CURSO'),
('7200', '1537', '1403C', 'CURSO'),
('7200', '1543', '1716C', 'CURSO'),
('7200', '1610', '1000', 'CURSO'),
('7200', '1610', 'CA1Y2', 'CURSO'),
('7200', '1610', 'PROBA', 'CURSO'),
('7200', '1613', '1000', 'CURSO'),
('7200', '1613', '1025E', 'CURSO'),
('7200', '1613', '1026', 'CURSO'),
('7200', '1613', '1029', 'CURSO'),
('7200', '1613', '1610E', 'CURSO'),
('7200', '1613', 'CA1Y2', 'CURSO'),
('7200', '1613', 'CP29', 'CURSO'),
('7200', '1617', '1025E', 'CURSO'),
('7200', '1617', '1610E', 'CURSO'),
('7200', '1617', 'CP29', 'CURSO'),
('7200', '1624', '1610E', 'CURSO'),
('7200', '1628', '1324E', 'CURSO'),
('7200', '1628', '1610E', 'CURSO'),
('7200', '1628', 'PROBA', 'CURSO'),
('7200', '1629', '1610E', 'CURSO'),
('7200', '1630', '1610E', 'CURSO'),
('7200', '1631', '1610E', 'CURSO'),
('7200', '1632', '1610E', 'CURSO'),
('7200', '1716', '1324C', 'CURSO'),
('7200', '1716', '1327', 'CURSO'),
('7200', '1716', '1911C', 'CURSO'),
('7200', '1721', '1324E', 'CURSO'),
('7200', '1721', '1327', 'CURSO'),
('7200', '1731', '1000', 'CURSO'),
('7200', '1731', '1012', 'CURSO'),
('7200', '1731', '1026', 'CURSO'),
('7200', '1731', '1029', 'CURSO'),
('7200', '1731', '1321', 'CURSO'),
('7200', '1731', 'CA1Y2', 'CURSO'),
('7200', '1731', 'CP4', 'CURSO'),
('7200', '1731', 'E1403', 'CURSO'),
('7200', '1731', 'PROBA', 'CURSO'),
('7200', '1734', '1324E', 'CURSO'),
('7200', '1734', '1327', 'CURSO'),
('7200', '1734', '1511', 'CURSO'),
('7200', '1734', '1911E', 'CURSO'),
('7200', '1735', '1511', 'CURSO'),
('7200', '1735', '1911E', 'CURSO'),
('7200', '1735', 'CP30', 'CURSO'),
('7200', '1740', '1511E', 'CURSO'),
('7200', '1740', '1721', 'CURSO'),
('7200', '1740', '1734', 'CURSO'),
('7200', '1740', '1911E', 'CURSO'),
('7200', '1740', 'CP30', 'CURSO'),
('7200', '1741', '1511E', 'CURSO'),
('7200', '1741', '1721', 'CURSO'),
('7200', '1741', '1734', 'CURSO'),
('7200', '1741', '1911E', 'CURSO'),
('7200', '1742', '1716C', 'CURSO'),
('7200', '1742', '1911E', 'CURSO'),
('7200', '1749', '1324E', 'CURSO'),
('7200', '1751', '1324E', 'CURSO'),
('7200', '1751', '1327', 'CURSO'),
('7200', '1751', '1511', 'CURSO'),
('7200', '1751', '1911E', 'CURSO'),
('7200', '1758', '1716C', 'CURSO'),
('7200', '1759', '1327', 'CURSO'),
('7200', '1759', '1911E', 'CURSO'),
('7200', '1766', '1327', 'CURSO'),
('7200', '1767', '1324C', 'CURSO'),
('7200', '1768', '1716E', 'CURSO'),
('7200', '1769', '1324E', 'CURSO'),
('7200', '1769', '1716E', 'CURSO'),
('7200', '1827', '1026', 'CURSO'),
('7200', '1827', 'CP29', 'CURSO'),
('7200', '1827', 'CP4', 'CURSO'),
('7200', '1827', 'PROBA', 'CURSO'),
('7200', '1828', '1325E', 'CURSO'),
('7200', '1828', 'CP29', 'CURSO'),
('7200', '1828', 'CP30', 'CURSO'),
('7200', '1828', 'CP4', 'CURSO'),
('7200', '1828', 'PROBA', 'CURSO'),
('7200', '1834', '1025E', 'CURSO'),
('7200', '1834', '1026', 'CURSO'),
('7200', '1834', 'CP29', 'CURSO'),
('7200', '1834', 'CP4', 'CURSO'),
('7200', '1835', '1025E', 'CURSO'),
('7200', '1835', '1026', 'CURSO'),
('7200', '1835', '1325E', 'CURSO'),
('7200', '1835', 'CP29', 'CURSO'),
('7200', '1835', 'CP4', 'CURSO'),
('7200', '1848', '1327', 'CURSO'),
('7200', '1848', 'CP4', 'CURSO'),
('7200', '1848', 'FISIC', 'CURSO'),
('7200', '1849', '1322E', 'CURSO'),
('7200', '1911', '1026', 'CURSO'),
('7200', '1911', '1511', 'CURSO'),
('7200', '1911', 'CP29', 'CURSO'),
('7200', '1911', 'CP4', 'CURSO'),
('7200', '1918', '1406C', 'CURSO'),
('7200', '1918', '1511', 'CURSO'),
('7200', '1918', '1716C', 'CURSO'),
('7200', '1918', '1911C', 'CURSO'),
('7200', '1918', '1918', 'CURSO'),
('7200', '1918', 'C1425', 'CURSO'),
('7200', '1926', '1911E', 'CURSO'),
('7200', '1926', 'CP30', 'CURSO'),
('7200', '1933', '1406C', 'CURSO'),
('7200', '1933', '1911E', 'CURSO'),
('7200', '1935', '1025C', 'CURSO'),
('7200', '1935', '1324E', 'CURSO'),
('7200', '1935', '1327', 'CURSO'),
('7200', '1935', '1911E', 'CURSO'),
('7200', '1936', '1327', 'CURSO'),
('7200', '1936', '1511E', 'CURSO'),
('7200', '1936', '1911E', 'CURSO'),
('7200', '1937', '1911E', 'CURSO'),
('7200', '1938', '1911E', 'CURSO'),
('7200', '1938', 'CP29', 'CURSO'),
('7200', '1939', '1324E', 'CURSO'),
('7200', '1939', '1327', 'CURSO'),
('7200', '1939', '1911E', 'CURSO'),
('7200', '1941', '1911E', 'CURSO'),
('7200', '1942', '1716E', 'CURSO'),
('7200', '1942', '1911E', 'CURSO'),
('7200', '1947', '1406C', 'CURSO'),
('7200', '1947', '1911C', 'CURSO'),
('7200', '5707', '1406C', 'CURSO'),
('7200', '5707', '1721', 'CURSO'),
('7200', '5914', '1033E', 'CURSO'),
('7200', '5914', '1324C', 'CURSO'),
('7200', '5914', 'CP29', 'CURSO'),
('7200', '5916', '1406E', 'CURSO'),
('7200', '5916', '1511E', 'CURSO'),
('7200', '5916', '1911E', 'CURSO'),
('7200', '5916', 'CP29', 'CURSO'),
('7200', '5916', 'CP4', 'CURSO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idCarrera`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indices de la tabla `curso_carrera`
--
ALTER TABLE `curso_carrera`
  ADD PRIMARY KEY (`idCarrera`,`idCurso`),
  ADD KEY `idCurso` (`idCurso`);

--
-- Indices de la tabla `curso_grupo`
--
ALTER TABLE `curso_grupo`
  ADD PRIMARY KEY (`idGrupo`,`idCurso`,`actividad`),
  ADD KEY `idCurso` (`idCurso`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `previas_creditos`
--
ALTER TABLE `previas_creditos`
  ADD PRIMARY KEY (`idCarrera`,`idCurso`,`area`),
  ADD KEY `idCurso` (`idCurso`);

--
-- Indices de la tabla `previas_cursos`
--
ALTER TABLE `previas_cursos`
  ADD PRIMARY KEY (`idCarrera`,`idCurso`,`idPrevia`,`actividad`),
  ADD KEY `idCurso` (`idCurso`),
  ADD KEY `idPrevia` (`idPrevia`);

--
-- Indices de la tabla `previas_grupos`
--
ALTER TABLE `previas_grupos`
  ADD PRIMARY KEY (`idCarrera`,`idCurso`,`idGrupo`,`actividad`),
  ADD KEY `idCurso` (`idCurso`),
  ADD KEY `idGrupo` (`idGrupo`);

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
-- Filtros para la tabla `previas_creditos`
--
ALTER TABLE `previas_creditos`
  ADD CONSTRAINT `previas_creditos_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  ADD CONSTRAINT `previas_creditos_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

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
