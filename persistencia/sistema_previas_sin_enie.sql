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

CREATE TABLE IF NOT EXISTS `cursos` (
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `instituto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `creditos` int(2) NOT NULL,
  `validez` int(3) NOT NULL,
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

INSERT INTO `cursos` (`idCurso`, `nombre`, `descripcion`, `instituto`, `creditos`, `validez`, `nota_promedio`, `total_cursantes`, `aprobados`, `exonerados`, `porcentaje_aprobacion`) VALUES
('1010', 'LOGICA Y COMPUTACION', '', '', 12, 2, '0', 0, 0, 0, 0),
('1011', 'TEORIA DE CODIGOS AVANZADO', '', '', 6, 999, '0', 0, 0, 0, 0),
('1012', 'COMBINATORIA ANALITICA', '', '', 8, 999, '6.0', 4, 0, 4, 100),
('1020', 'CALCULO 1', '', '', 16, 20, '1.1', 1267, 499, 145, 11.4),
('1022', 'CALCULO 2', '', '', 16, 20, '1.6', 432, 261, 91, 21.1),
('1023', 'MATEMATICA DISCRETA 1', '', '', 9, 20, '2.0', 157, 106, 34, 21.7),
('1024', 'CALCULO 3', '', '', 10, 20, '3.2', 315, 286, 237, 75.2),
('1025', 'PROBABILIDAD Y ESTADISTICA', '', '', 10, 20, '2.6', 490, 376, 235, 48),
('1026', 'MATEMATICA DISCRETA 2', '', '', 9, 20, '2.1', 298, 209, 102, 34.2),
('1027', 'LOGICA', '', '', 12, 20, '1.3', 517, 291, 68, 13.2),
('1028', 'ECUACIONES DIFERENCIALES', '', '', 12, 20, '0', 0, 0, 0, 0),
('1030', 'GEOMETRIA Y ALGEBRA LINEAL 1', '', '', 9, 20, '1.5', 1237, 523, 216, 17.5),
('1031', 'GEOMETRIA Y ALGEBRA LINEAL 2', '', '', 9, 20, '1.4', 339, 164, 45, 13.3),
('1033', 'METODOS NUMERICOS', '', '', 8, 20, '0', 0, 0, 0, 0),
('1037', 'TEORIA DE JUEGOS Y PROG. FUNCIONAL', '', '', 7, 999, '0', 0, 0, 0, 0),
('1040', 'ALGEBRA LINEAL NUMERICA', '', '', 4, 999, '0', 0, 0, 0, 0),
('1041', 'MET. NUM. PARA LA RESOL. DE ECUAC. DIF.', '', '', 5, 999, '0', 0, 0, 0, 0),
('1042', 'TEORIA DE COD.ALGEBR.PARA CORREC.DE ERR', '', '', 7, 999, '0', 0, 0, 0, 0),
('1046', 'TEORIA DE CODIGOS', '', '', 12, 999, '0', 0, 0, 0, 0),
('1048', 'TEORIA COMPUTACIONAL DE LA GESTALT', '', '', 8, 999, '0', 0, 0, 0, 0),
('1049', 'INFERENCIA II  (ESTADISTICA BAYESIANA)', '', '', 10, 18, '0', 0, 0, 0, 0),
('1052', 'CALCULO 1 (ANUAL)', '', '', 16, 20, '0', 0, 0, 0, 0),
('1053', 'GEOMETRIA Y ALGEBRA LINEAL 1 (ANUAL)', '', '', 9, 20, '0', 0, 0, 0, 0),
('1054', 'ANALISIS DE FOURIER PARA TRATAM.DE IMAGE', '', '', 10, 999, '0', 0, 0, 0, 0),
('1055', 'METODOS DE MONTE CARLO', '', '', 6, 999, '0', 0, 0, 0, 0),
('1057', 'METODOS MONTECARLO', '', '', 8, 999, '6.5', 13, 0, 13, 100),
('1059', 'CRIPTOGRAFIA:ASPECTOS TEOR. Y PRACTICOS', '', '', 12, 999, '0', 0, 0, 0, 0),
('1120', 'FISICA GENERAL 1', '', '', 13, 20, '0', 0, 0, 0, 0),
('1121', 'FISICA GENERAL 2', '', '', 13, 20, '0', 0, 0, 0, 0),
('1131', 'INT. A LA FISICA MODERNA', '', '', 10, 20, '0', 0, 0, 0, 0),
('1151', 'FISICA 1', '', '', 10, 20, '1.0', 1333, 391, 131, 9.8),
('1152', 'FISICA 2', '', '', 10, 20, '1.9', 265, 174, 72, 27.2),
('1153', 'FISICA 3', '', '', 10, 20, '1.8', 359, 205, 91, 25.3),
('1213', 'PLANIF.DE CLASES:DISENIO DE UNID.DIDACT.', '', '', 2, 999, '4.7', 3, 0, 3, 100),
('1223', 'CIENCIA, TECNOLOGIA Y SOCIEDAD', '', '', 8, 999, '0', 0, 0, 0, 0),
('1224', 'ECONOMIA', '', '', 7, 20, '0', 0, 0, 0, 0),
('1225', 'POLITICAS CIENTIFICAS EN INF.Y COMP.', '', '', 3, 999, '6.7', 6, 0, 6, 100),
('1229', 'ANALISIS DE INNOVACIONES', '', '', 6, 20, '0', 0, 0, 0, 0),
('1233', 'TUTORIA EN MATEMATICA', '', '', 4, 999, '0', 0, 0, 0, 0),
('1304', 'TECNOLOGIAS INTERACTIVAS Y VIDEOJUEGOS', '', '', 4, 999, '0', 0, 0, 0, 0),
('1314', 'TALLER DE PRODUCCION DE PROG.SIN FALLAS', '', '', 12, 999, '0', 0, 0, 0, 0),
('1315', 'INT. A LA COMPUTACION GRAFICA', '', '', 10, 8, '0', 0, 0, 0, 0),
('1316', 'INT. A LA COMPUTACION GRAFICA', '', '', 10, 999, '2.2', 47, 0, 24, 51.1),
('1321', 'PROGRAMACION 2', '', '', 12, 20, '1.8', 429, 221, 128, 29.8),
('1322', 'PROGRAMACION 1', '', '', 10, 20, '0', 0, 0, 0, 0),
('1323', 'PROGRAMACION 3', '', '', 15, 20, '0', 0, 0, 0, 0),
('1324', 'PROGRAMACION 4', '', '', 15, 20, '2.7', 209, 192, 108, 51.7),
('1325', 'TEORIA DE LENGUAJES', '', '', 12, 20, '2.8', 190, 174, 101, 53.2),
('1327', 'TALLER DE PROGRAMACION', '', '', 15, 999, '0', 0, 0, 0, 0),
('1328', 'INT. A LA PROGRAMACION FUNCIONAL', '', '', 7, 999, '2.2', 161, 0, 125, 77.6),
('1329', 'INT. A LA PROGRAMACION LOGICA', '', '', 7, 999, '0', 0, 0, 0, 0),
('1330', 'LOGICA DE LA PROGRAMACION IMPERATIVA', '', '', 12, 999, '0', 0, 0, 0, 0),
('1331', 'DISENIO DE COMPILADORES', '', '', 12, 999, '4.4', 63, 0, 61, 96.8),
('1332', 'INT. A LA PROGR.PARA DISENIO GRAFICO', '', '', 12, 999, '0', 0, 0, 0, 0),
('1333', 'INT. A LA PROGRAMACION GENERICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1334', 'ANALISIS DE ALGORITMOS', '', '', 15, 999, '0', 0, 0, 0, 0),
('1335', 'TRANSDUCTORES DE ESTADO FINITO', '', '', 7, 999, '0', 0, 0, 0, 0),
('1336', 'TEORIA DE LA COMPUTACION', '', '', 4, 999, '0', 0, 0, 0, 0),
('1337', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 12, 20, '0', 0, 0, 0, 0),
('1338', 'INT. A LOS FUND.DE LOS LENG.DE PR.OR. OB', '', '', 6, 999, '0', 0, 0, 0, 0),
('1339', 'VERIFICACION Y LOGICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1340', 'PROGRAMACION LOGICA', '', '', 10, 999, '2.4', 68, 0, 58, 85.3),
('1341', 'LOGICA DE LA PROGRAMACION IMPERATIVA', '', '', 8, 999, '0', 0, 0, 0, 0),
('1342', 'TALLER DE COMPUTACION GRAFICA', '', '', 7, 999, '0', 0, 0, 0, 0),
('1343', 'BIO-COMPUTACION PARALELA', '', '', 6, 999, '0', 0, 0, 0, 0),
('1345', 'DESARROLLO WEB', '', '', 8, 999, '0', 0, 0, 0, 0),
('1346', 'VERIFICACION DE MODELOS', '', '', 10, 999, '0', 0, 0, 0, 0),
('1347', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 12, 999, '0', 0, 0, 0, 0),
('1348', 'MODELOS Y VERIF. DE SIST. DE TIEMPO REAL', '', '', 10, 999, '0', 0, 0, 0, 0),
('1349', 'COMPUTACION GRAFICA AVANZADA', '', '', 12, 999, '0', 0, 0, 0, 0),
('1350', 'PROGRAMACION FUNCIONAL AVANZADA', '', '', 12, 999, '3.7', 7, 0, 7, 100),
('1351', 'COMBINATORIA ANALITICA Y APLICACIONES', '', '', 3, 999, '0', 0, 0, 0, 0),
('1352', 'COMPRESION DE DATOS SIN PERDIDA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1358', 'TEORIA DE LA COMPUTACION', '', '', 7, 999, '5.3', 5, 0, 5, 100),
('1403', 'INT. A LA ARQUITECTURA DE COMPUTADORES', '', '', 15, 20, '0', 0, 0, 0, 0),
('1406', 'INT. A LAS REDES DE COMPUTADORES', '', '', 15, 999, '0', 0, 0, 0, 0),
('1414', 'SISTEMAS DISTRIBUIDOS', '', '', 15, 999, '0', 0, 0, 0, 0),
('1415', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 5, 999, '0', 0, 0, 0, 0),
('1416', 'INT. A LA CRIPTOGRAFIA', '', '', 12, 999, '0', 0, 0, 0, 0),
('1424', 'ARQUITECTURA DE COMPUTADORES 1', '', '', 10, 56, '0', 0, 0, 0, 0),
('1425', 'ARQUITECTURA DE COMPUTADORES 2', '', '', 10, 56, '0', 0, 0, 0, 0),
('1426', 'TRAF.RESTRIC.T. REAL REDES BEST EFFORT', '', '', 6, 999, '0', 0, 0, 0, 0),
('1427', 'COMPUTACION CUANTICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1428', 'TALLER DE FIRMWARE', '', '', 10, 999, '0', 0, 0, 0, 0),
('1429', 'DISENIO TOPOLOGICO DE REDES', '', '', 5, 999, '0', 0, 0, 0, 0),
('1430', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 7, 999, '0', 0, 0, 0, 0),
('1431', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 6, 999, '0', 0, 0, 0, 0),
('1432', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 8, 999, '0', 0, 0, 0, 0),
('1433', 'INT. A LAS REDES DE COMPUTADORAS', '', '', 15, 56, '0', 0, 0, 0, 0),
('1434', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 10, 999, '0', 0, 0, 0, 0),
('1435', 'DISENIO TOPOLOGICO DE REDES', '', '', 10, 999, '0', 0, 0, 0, 0),
('1436', 'FUND.PARA LA INVEST.EN REDES DE COMPUTAD', '', '', 8, 999, '0', 0, 0, 0, 0),
('1437', 'TALLER DE SEGURIDAD INFORMATICA', '', '', 7, 999, '0', 0, 0, 0, 0),
('1438', 'APL.DE TEORIA DE LA INF.AL PROC.DE IMAG.', '', '', 6, 999, '0.5', 10, 0, 2, 20),
('1440', 'ANAL.Y DIS.DE ALGORIT.DISTRIB.EN REDES', '', '', 8, 999, '3.8', 12, 0, 12, 100),
('1441', 'CURVAS ELIPTICAS EN CRIPTOGRAFIA', '', '', 3, 999, '0', 0, 0, 0, 0),
('1442', 'ROBOTICA EMBEBIDA', '', '', 10, 999, '3.9', 12, 0, 10, 83.3),
('1443', 'ARQUITECTURA DE COMPUTADORAS', '', '', 12, 56, '0', 0, 0, 0, 0),
('1444', 'ASPECTOS AVANZ. DE ARQ.DE COMPUTADORAS', '', '', 8, 999, '0.8', 12, 0, 3, 25),
('1445', 'TALLER DE ARQUITECTURA DE COMPUTADORAS', '', '', 3, 999, '0.9', 54, 0, 23, 42.6),
('1446', 'REDES DE COMPUTADORAS', '', '', 12, 56, '0', 0, 0, 0, 0),
('1447', 'COMPUT.DE PR.GRAL.EN UNID.DE PROC.GRAF.', '', '', 7, 999, '0', 0, 0, 0, 0),
('1448', 'ASPECTOS AVANZ. DE REDES DE COMPUTADORAS', '', '', 8, 999, '2.1', 21, 0, 14, 66.7),
('1449', 'TALLER DE GPGPU', '', '', 7, 999, '3.0', 3, 0, 3, 100),
('1450', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 8, 999, '1.4', 17, 0, 7, 41.2),
('1453', 'COMPL.ARQUITECTURA DE COMPUTADORAS', '', '', 5, 999, '0', 0, 0, 0, 0),
('1454', 'ASPECTOS BASICOS DE REDES DE COMP.', '', '', 12, 999, '0', 0, 0, 0, 0),
('1507', 'INT. A LAS ORGANIZACIONES', '', '', 10, 999, '0', 0, 0, 0, 0),
('1510', 'CONTROL DE CALIDAD', '', '', 8, 20, '0', 0, 0, 0, 0),
('1511', 'SISTEMAS OPERATIVOS', '', '', 12, 20, '0', 0, 0, 0, 0),
('1513C', 'INT. A LOS MICROPROCESADORES', '', '', 11, 20, '0', 0, 0, 0, 0),
('1514', 'ORGANIZACIONES Y SU ADMINISTRACION', '', '', 10, 20, '0', 0, 0, 0, 0),
('1518', 'SISTEMAS OPERATIVOS', '', '', 15, 20, '0', 0, 0, 0, 0),
('1519', 'INT. A LA ADMINISTRACION PARA INGENIEROS', '', '', 10, 20, '0', 0, 0, 0, 0),
('1532', 'SISTEMAS OPERATIVOS', '', '', 15, 56, '0', 0, 0, 0, 0),
('1535', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 8, 999, '0', 0, 0, 0, 0),
('1537', 'SISTEMAS OPERATIVOS', '', '', 12, 20, '1.4', 349, 232, 38, 10.9),
('1542', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 10, 999, '0', 0, 0, 0, 0),
('1543', 'INT. AL NEGOCIO DEL SOFTWARE', '', '', 6, 999, '0', 0, 0, 0, 0),
('1610', 'INT. A LA INVESTIGACION DE OPERACIONES', '', '', 10, 20, '3.2', 320, 304, 237, 74.1),
('1613', 'METAHEURISTICAS Y OPTIMIZ.SOBRE REDES', '', '', 10, 999, '0', 0, 0, 0, 0),
('1617', 'SIMULACION A EVENTOS DISCRETOS', '', '', 10, 999, '0', 0, 0, 0, 0),
('1621', 'EXTENS. DE PROG. LINEAL Y PROG. ENTERA', '', '', 15, 999, '0', 0, 0, 0, 0),
('1623', 'INVEST. DE OPER. EN COMERCIO ELECTRONICO', '', '', 6, 999, '0', 0, 0, 0, 0),
('1624', 'MODELADO Y OPTIMIZACION', '', '', 6, 999, '0', 0, 0, 0, 0),
('1625', 'ALGORITMOS GENETICOS', '', '', 6, 999, '0', 0, 0, 0, 0),
('1626', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 6, 999, '0', 0, 0, 0, 0),
('1627', 'SEMINARIO:ELEMENTOS DE METAHEURISTICAS', '', '', 10, 999, '0', 0, 0, 0, 0),
('1628', 'ALGORITMOS EVOLUTIVOS', '', '', 9, 999, '2.8', 69, 0, 49, 71),
('1629', 'INT. A LA OPTIMIZ.Y A LA PROG. CON RESTR', '', '', 6, 999, '0', 0, 0, 0, 0),
('1630', 'INVESTIGACION DE OPER.Y GEST. DE RIESGOS', '', '', 6, 999, '0', 0, 0, 0, 0),
('1631', 'FUNDAMENTOS DE PROGRAMACION ENTERA', '', '', 8, 999, '0', 0, 0, 0, 0),
('1632', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 8, 999, '2.4', 23, 0, 16, 69.6),
('1716', 'INT. A LA INGENIERIA DE SOFTWARE', '', '', 10, 20, '2.5', 114, 109, 66, 57.9),
('1721', 'PROYECTO DE INGENIERIA DE SOFTWARE', '', '', 15, 999, '0', 0, 0, 0, 0),
('1728', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 7, 999, '0', 0, 0, 0, 0),
('1730', 'PROYECTO DE GRADO', '', '', 30, 999, '10.8', 66, 0, 64, 97),
('1731', 'PASANTIA (COMPUTACION)', '', '', 10, 999, 'S/N', 63, 0, 63, 100),
('1732', 'ARQUITECTURA DE SOFTWARE', '', '', 8, 999, '0', 0, 0, 0, 0),
('1733', 'TALLER DE DESARROLLO CLIENTE/SERVIDOR', '', '', 21, 999, '0', 0, 0, 0, 0),
('1734', 'TALLER SISTEMAS DE INFORMACION 1', '', '', 6, 999, '0', 0, 0, 0, 0),
('1735', 'TALLER SISTEMAS DE INFORMACION 2', '', '', 15, 999, '0', 0, 0, 0, 0),
('1736', 'INT. A LA INTERAC. PERSONA COMPUTADORA', '', '', 6, 999, '0', 0, 0, 0, 0),
('1737', 'GESTION DE SOFTWARE', '', '', 7, 999, '0', 0, 0, 0, 0),
('1739', 'TALLER DE GESTION DE SOFTWARE', '', '', 15, 999, '0', 0, 0, 0, 0),
('1740', 'TALLER DE SISTEMAS DE INFORMACION 3', '', '', 8, 999, '0', 0, 0, 0, 0),
('1741', 'TALLER DE SISTEMAS DE INFORMACION 4', '', '', 15, 999, '0', 0, 0, 0, 0),
('1742', 'TALLER DE VERIFICACION DEL SOFTWARE', '', '', 8, 999, '0', 0, 0, 0, 0),
('1743', 'ARQUITECTURA DE SOFTWARE', '', '', 12, 999, '0', 0, 0, 0, 0),
('1748', 'SEMINARIO DE PROCESAM. PARALELO APLICADO', '', '', 3, 999, '0', 0, 0, 0, 0),
('1749', 'INTERACCION PERSONA COMPUTADORA', '', '', 12, 999, '0', 0, 0, 0, 0),
('1750', 'TALLER DE ARQUITECTURA DE SOFTWARE', '', '', 6, 999, '0', 0, 0, 0, 0),
('1751', 'TALLER DE SISTEMAS DE INFORMACION 1', '', '', 10, 999, '3.9', 40, 0, 40, 100),
('1752', 'TALLER DE PSP', '', '', 7, 999, '0', 0, 0, 0, 0),
('1758', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 10, 999, '2.3', 40, 0, 36, 90),
('1759', 'TALLER DE SIST. DE INF.GEOGRAF.EMPRESAR.', '', '', 8, 999, '4.7', 40, 0, 40, 100),
('1766', 'TALLER DE GEST.Y TEC.PROC.NEGOCIO (TBPM)', '', '', 10, 999, '4.5', 38, 0, 37, 97.4),
('1767', 'PRINC.Y FUND.DEL PROC.PERS.DE SOFTWARE', '', '', 7, 999, 'S/N', 26, 0, 25, 96.2),
('1768', 'TALLER DE INTERACCION PERSONA COMPUTAD.', '', '', 8, 999, '0', 0, 0, 0, 0),
('1769', 'PROFESION EN INGENIERIA DE SOFTWARE', '', '', 4, 999, '2.7', 34, 0, 30, 88.2),
('1820', 'APRENDIZAJE AUTOMATICO', '', '', 6, 999, '0', 0, 0, 0, 0),
('1821', 'EXTRACCION Y CATEGORIZACION DE INFORM.', '', '', 10, 999, '0', 0, 0, 0, 0),
('1827', 'APRENDIZAJE AUTOMATICO', '', '', 7, 999, '0', 0, 0, 0, 0),
('1828', 'INT. AL PROCESAMIENTO DE LENG. NATURAL', '', '', 12, 999, '0', 0, 0, 0, 0),
('1829', 'I.A. Y ROBOTICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1832', 'CONST.DE MOD.PROB.DEL LENGUAJE NATURAL', '', '', 6, 999, '0', 0, 0, 0, 0),
('1834', 'METODOS DE APRENDIZAJE AUTOMATICO', '', '', 9, 999, '0', 0, 0, 0, 0),
('1835', 'GRAMATICAS FORMALES PARA EL LENG.NATURAL', '', '', 10, 999, '1.3', 27, 0, 15, 55.6),
('1848', 'ROBOTICA BASADA EN COMPORTAMIENTOS', '', '', 15, 999, '0', 0, 0, 0, 0),
('1849', 'BUTIA: ROBOTICA EDUCATIVA', '', '', 8, 999, '3.6', 20, 0, 20, 100),
('1911', 'FUNDAMENTOS DE BASES DE DATOS', '', '', 15, 20, '0', 0, 0, 0, 0),
('1916', 'DESCUBRIMIENTO DE INF.EN BASES DE DATOS', '', '', 8, 999, '0', 0, 0, 0, 0),
('1917', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 12, 999, '0', 0, 0, 0, 0),
('1918', 'ADMINISTRACION Y SEGURIDAD DE SISTEMAS', '', '', 10, 999, '2.7', 47, 0, 43, 91.5),
('1919', 'INTEROPERABILIDAD', '', '', 13, 999, '0', 0, 0, 0, 0),
('1921', 'GESTION DE CALIDAD', '', '', 8, 20, '0', 0, 0, 0, 0),
('1926', 'INT. A LOS SIST. DE INFOR. GEOGRAFICA', '', '', 10, 999, '3.4', 31, 0, 27, 87.1),
('1929', 'WEB Y BASE DE DATOS', '', '', 6, 999, '0', 0, 0, 0, 0),
('1930', 'ORGANIZACIONES PARA INGENIEROS', '', '', 6, 20, '0', 0, 0, 0, 0),
('1931', 'SISTEMAS MULTIFUENTES', '', '', 13, 999, '0', 0, 0, 0, 0),
('1932', 'METADATA EN SISTEMAS DE INFORMACION', '', '', 13, 999, '0', 0, 0, 0, 0),
('1933', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 15, 999, '4.2', 173, 0, 173, 100),
('1934', 'INTEROPERABILIDAD SEMANTICA', '', '', 11, 999, '0', 0, 0, 0, 0),
('1935', 'CALIDAD DE DATOS', '', '', 8, 999, '0', 0, 0, 0, 0),
('1936', 'INT. AL MIDDLEWARE', '', '', 8, 999, '0', 0, 0, 0, 0),
('1937', 'SISTEMAS DE INFORMACION EN SALUD', '', '', 10, 999, '0', 0, 0, 0, 0),
('1938', 'RECUP.DE INF.Y RECOMEND.EN LA WEB (WIR)', '', '', 10, 999, '0', 0, 0, 0, 0),
('1939', 'DISENIO Y CONSTRUCCION DE DATA WAREHOUSE', '', '', 10, 999, '0', 0, 0, 0, 0),
('1940', 'GESTION DE CALIDAD', '', '', 6, 9, '1.3', 102, 50, 15, 14.7),
('1941', 'INTEGRACION DE DATOS', '', '', 8, 999, '2.6', 76, 0, 61, 80.3),
('1942', 'FUNDAMENTOS DE LA WEB SEMANTICA', '', '', 8, 999, '0', 0, 0, 0, 0),
('1943', 'SEMINARIO RECUP.DE INF.Y REC.EN LA WEB', '', '', 6, 999, '0', 0, 0, 0, 0),
('1944', 'ADMINISTRACION GENERAL PARA INGENIEROS', '', '', 5, 20, '1.8', 21, 11, 7, 33.3),
('1945', 'PRACTICA DE ADMINIST. PARA INGENIEROS', '', '', 5, 20, '0', 0, 0, 0, 0),
('1947', 'TALLER DE LENG.Y TEC.DE LA WEB SEMANTICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('1948', 'INTRODUCCION AL MIDDLEWARE', '', '', 10, 999, '0', 0, 0, 0, 0),
('2034', 'TALLER ENCARARE 1:CREATIVIDAD E INNOVAC.', '', '', 5, 999, '3.6', 18, 0, 18, 100),
('2036', 'TALLER ENCARARE 2:PLANIF.DE LA FUT.EMPR.', '', '', 5, 999, '0', 0, 0, 0, 0),
('5705', 'SEMINARIO DE INGENIERIA BIOMEDICA', '', '', 4, 999, 'S/N', 17, 0, 17, 100),
('5707', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 8, 999, '2.0', 5, 0, 3, 60),
('5709', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 6, 999, '0', 0, 0, 0, 0),
('5823', 'TALLER DE TELEMATICA', '', '', 12, 999, '0', 0, 0, 0, 0),
('5831', 'INT. AL RECONOCIMIENTO DE PATRONES', '', '', 8, 999, '0', 0, 0, 0, 0),
('5912', 'SISTEMAS NEURO FUZZY', '', '', 8, 999, '0', 0, 0, 0, 0),
('5914', 'ALGEBRA LINEAL NUMERICA', '', '', 9, 999, '4.0', 2, 0, 2, 100),
('5915', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 10, 999, '0', 0, 0, 0, 0),
('5916', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 12, 999, '2.1', 39, 0, 27, 69.2);

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

INSERT INTO `curso_carrera` (`idCarrera`, `idCurso`) VALUES
('7200', '1010'),
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
('7200', '1037'),
('7200', '1040'),
('7200', '1041'),
('7200', '1042'),
('7200', '1046'),
('7200', '1048'),
('7200', '1049'),
('7200', '1052'),
('7200', '1053'),
('7200', '1054'),
('7200', '1055'),
('7200', '1057'),
('7200', '1059'),
('7200', '1120'),
('7200', '1121'),
('7200', '1131'),
('7200', '1151'),
('7200', '1152'),
('7200', '1153'),
('7200', '1213'),
('7200', '1223'),
('7200', '1224'),
('7200', '1225'),
('7200', '1229'),
('7200', '1233'),
('7200', '1304'),
('7200', '1314'),
('7200', '1315'),
('7200', '1316'),
('7200', '1321'),
('7200', '1322'),
('7200', '1323'),
('7200', '1324'),
('7200', '1325'),
('7200', '1327'),
('7200', '1328'),
('7200', '1329'),
('7200', '1330'),
('7200', '1331'),
('7200', '1332'),
('7200', '1333'),
('7200', '1334'),
('7200', '1335'),
('7200', '1336'),
('7200', '1337'),
('7200', '1338'),
('7200', '1339'),
('7200', '1340'),
('7200', '1341'),
('7200', '1342'),
('7200', '1343'),
('7200', '1345'),
('7200', '1346'),
('7200', '1347'),
('7200', '1348'),
('7200', '1349'),
('7200', '1350'),
('7200', '1351'),
('7200', '1352'),
('7200', '1358'),
('7200', '1403'),
('7200', '1406'),
('7200', '1414'),
('7200', '1415'),
('7200', '1416'),
('7200', '1424'),
('7200', '1425'),
('7200', '1426'),
('7200', '1427'),
('7200', '1428'),
('7200', '1429'),
('7200', '1430'),
('7200', '1431'),
('7200', '1432'),
('7200', '1433'),
('7200', '1434'),
('7200', '1435'),
('7200', '1436'),
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
('7200', '1453'),
('7200', '1454'),
('7200', '1507'),
('7200', '1510'),
('7200', '1511'),
('7200', '1513C'),
('7200', '1514'),
('7200', '1518'),
('7200', '1519'),
('7200', '1532'),
('7200', '1535'),
('7200', '1537'),
('7200', '1542'),
('7200', '1543'),
('7200', '1610'),
('7200', '1613'),
('7200', '1617'),
('7200', '1621'),
('7200', '1623'),
('7200', '1624'),
('7200', '1625'),
('7200', '1626'),
('7200', '1627'),
('7200', '1628'),
('7200', '1629'),
('7200', '1630'),
('7200', '1631'),
('7200', '1632'),
('7200', '1716'),
('7200', '1721'),
('7200', '1728'),
('7200', '1730'),
('7200', '1731'),
('7200', '1732'),
('7200', '1733'),
('7200', '1734'),
('7200', '1735'),
('7200', '1736'),
('7200', '1737'),
('7200', '1739'),
('7200', '1740'),
('7200', '1741'),
('7200', '1742'),
('7200', '1743'),
('7200', '1748'),
('7200', '1749'),
('7200', '1750'),
('7200', '1751'),
('7200', '1752'),
('7200', '1758'),
('7200', '1759'),
('7200', '1766'),
('7200', '1767'),
('7200', '1768'),
('7200', '1769'),
('7200', '1820'),
('7200', '1821'),
('7200', '1827'),
('7200', '1828'),
('7200', '1829'),
('7200', '1832'),
('7200', '1834'),
('7200', '1835'),
('7200', '1848'),
('7200', '1849'),
('7200', '1911'),
('7200', '1916'),
('7200', '1917'),
('7200', '1918'),
('7200', '1919'),
('7200', '1921'),
('7200', '1926'),
('7200', '1929'),
('7200', '1930'),
('7200', '1931'),
('7200', '1932'),
('7200', '1933'),
('7200', '1934'),
('7200', '1935'),
('7200', '1936'),
('7200', '1937'),
('7200', '1938'),
('7200', '1939'),
('7200', '1940'),
('7200', '1941'),
('7200', '1942'),
('7200', '1943'),
('7200', '1944'),
('7200', '1945'),
('7200', '1947'),
('7200', '1948'),
('7200', '2034'),
('7200', '2036'),
('7200', '5705'),
('7200', '5707'),
('7200', '5709'),
('7200', '5823'),
('7200', '5831'),
('7200', '5912'),
('7200', '5914'),
('7200', '5915'),
('7200', '5916');

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

INSERT INTO `curso_grupo` (`idGrupo`, `idCurso`, `puntaje`, `actividad`) VALUES
('1012', '1322', 1, 'Examen aprobado'),
('1013', '1321', 1, 'Curso aprobado'),
('1020', '1020', 1, 'Examen aprobado'),
('1020', '1052', 1, 'Examen aprobado'),
('1029', '1023', 5, 'Examen aprobado'),
('1511', '1511', 1, 'Curso aprobado'),
('1511', '1518', 1, 'Curso aprobado'),
('1511', '1532', 1, 'Curso aprobado'),
('1511', '1537', 1, 'Curso aprobado');

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

INSERT INTO `grupos` (`idGrupo`, `nombre`, `min`, `max`) VALUES
('1012', 'TALLER Y PROGRAMACION', 1, 3),
('1013', 'PROGRAMACION 2', 1, 1),
('1020', 'CALCULO 1 Y ANALISIS MATEM.I', 1, 1),
('1029', 'MAT.DIS.1-GEOM.Y ALG.-ANAL.1Y2', 5, 11),
('1511', 'SISTEMAS OPERATIVOS', 1, 1);

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
