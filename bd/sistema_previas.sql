-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2015 a las 23:28:48
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
  `porcentaje_aprobacion` float NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombre`, `descripcion`, `instituto`, `creditos`, `validez`, `porcentaje_aprobacion`) VALUES
('1010', 'LOGICA Y COMPUTACION', '', '', 0, 0, 0),
('1011', 'TEORIA DE CODIGOS AVANZADO', '', '', 0, 0, 0),
('1012', 'COMBINATORIA ANALITICA', '', '', 0, 0, 0),
('1020', 'CALCULO 1', '', '', 0, 0, 0),
('1022', 'CALCULO 2', '', '', 0, 0, 0),
('1023', 'MATEMATICA DISCRETA 1', '', '', 0, 0, 0),
('1024', 'CALCULO 3', '', '', 0, 0, 0),
('1025', 'PROBABILIDAD Y ESTADISTICA', '', '', 0, 0, 0),
('1026', 'MATEMATICA DISCRETA 2', '', '', 0, 0, 0),
('1027', 'LOGICA', '', '', 0, 0, 0),
('1028', 'ECUACIONES DIFERENCIALES', '', '', 0, 0, 0),
('1030', 'GEOMETRIA Y ALGEBRA LINEAL 1', '', '', 0, 0, 0),
('1031', 'GEOMETRIA Y ALGEBRA LINEAL 2', '', '', 0, 0, 0),
('1033', 'METODOS NUMERICOS', '', '', 0, 0, 0),
('1037', 'TEORIA DE JUEGOS Y PROG. FUNCIONAL', '', '', 0, 0, 0),
('1041', 'MET. NUM. PARA LA RESOL. DE ECUAC. DIF.', '', '', 0, 0, 0),
('1042', 'TEORIA DE COD.ALGEBR.PARA CORREC.DE ERR', '', '', 0, 0, 0),
('1046', 'TEORIA DE CODIGOS', '', '', 0, 0, 0),
('1048', 'TEORIA COMPUTACIONAL DE LA GESTALT', '', '', 0, 0, 0),
('1049', 'INFERENCIA II  (ESTADISTICA BAYESIANA)', '', '', 0, 0, 0),
('1052', 'CALCULO 1 (ANUAL)', '', '', 0, 0, 0),
('1053', 'GEOMETRIA Y ALGEBRA LINEAL 1 (ANUAL)', '', '', 0, 0, 0),
('1054', 'ANALISIS DE FOURIER PARA TRATAM.DE IMAGE', '', '', 0, 0, 0),
('1055', 'METODOS DE MONTE CARLO', '', '', 0, 0, 0),
('1057', 'METODOS MONTECARLO', '', '', 0, 0, 0),
('1059', 'CRIPTOGRAFIA:ASPECTOS TEOR. Y PRACTICOS', '', '', 0, 0, 0),
('1131', 'INT. A LA FISICA MODERNA', '', '', 0, 0, 0),
('1151', 'FISICA 1', '', '', 0, 0, 0),
('1152', 'FISICA 2', '', '', 0, 0, 0),
('1153', 'FISICA 3', '', '', 0, 0, 0),
('1213', 'PLANIF.DE CLASES:DISEÑO DE UNID.DIDACT.', '', '', 0, 0, 0),
('1223', 'CIENCIA, TECNOLOGIA Y SOCIEDAD', '', '', 0, 0, 0),
('1224', 'ECONOMIA', '', '', 0, 0, 0),
('1225', 'POLITICAS CIENTIFICAS EN INF.Y COMP.', '', '', 0, 0, 0),
('1229', 'ANALISIS DE INNOVACIONES', '', '', 0, 0, 0),
('1233', 'TUTORIA EN MATEMATICA', '', '', 0, 0, 0),
('1304', 'TECNOLOGIAS INTERACTIVAS Y VIDEOJUEGOS', '', '', 0, 0, 0),
('1314', 'TALLER DE PRODUCCION DE PROG.SIN FALLAS', '', '', 0, 0, 0),
('1316', 'INT. A LA COMPUTACION GRAFICA', '', '', 0, 0, 0),
('1321', 'PROGRAMACION 2', '', '', 0, 0, 0),
('1322', 'PROGRAMACION 1', '', '', 0, 0, 0),
('1323', 'PROGRAMACION 3', '', '', 0, 0, 0),
('1324', 'PROGRAMACION 4', '', '', 0, 0, 0),
('1325', 'TEORIA DE LENGUAJES', '', '', 0, 0, 0),
('1327', 'TALLER DE PROGRAMACION', '', '', 0, 0, 0),
('1328', 'INT. A LA PROGRAMACION FUNCIONAL', '', '', 0, 0, 0),
('1329', 'INT. A LA PROGRAMACION LOGICA', '', '', 0, 0, 0),
('1330', 'LOGICA DE LA PROGRAMACION IMPERATIVA', '', '', 0, 0, 0),
('1331', 'DISEÑO DE COMPILADORES', '', '', 0, 0, 0),
('1332', 'INT. A LA PROGR.PARA DISEÑO GRAFICO', '', '', 0, 0, 0),
('1333', 'INT. A LA PROGRAMACION GENERICA', '', '', 0, 0, 0),
('1334', 'ANALISIS DE ALGORITMOS', '', '', 0, 0, 0),
('1335', 'TRANSDUCTORES DE ESTADO FINITO', '', '', 0, 0, 0),
('1336', 'TEORIA DE LA COMPUTACION', '', '', 0, 0, 0),
('1337', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 0, 0, 0),
('1338', 'INT. A LOS FUND.DE LOS LENG.DE PR.OR. OB', '', '', 0, 0, 0),
('1339', 'VERIFICACION Y LOGICA', '', '', 0, 0, 0),
('1340', 'PROGRAMACION LOGICA', '', '', 0, 0, 0),
('1341', 'LOGICA DE LA PROGRAMACION IMPERATIVA', '', '', 0, 0, 0),
('1342', 'TALLER DE COMPUTACION GRAFICA', '', '', 0, 0, 0),
('1343', 'BIO-COMPUTACION PARALELA', '', '', 0, 0, 0),
('1345', 'DESARROLLO WEB', '', '', 0, 0, 0),
('1346', 'VERIFICACION DE MODELOS', '', '', 0, 0, 0),
('1347', 'CONST.FORMAL DE PROGR.EN TEORIA DE TIPOS', '', '', 0, 0, 0),
('1348', 'MODELOS Y VERIF. DE SIST. DE TIEMPO REAL', '', '', 0, 0, 0),
('1349', 'COMPUTACION GRAFICA AVANZADA', '', '', 0, 0, 0),
('1350', 'PROGRAMACION FUNCIONAL AVANZADA', '', '', 0, 0, 0),
('1351', 'COMBINATORIA ANALITICA Y APLICACIONES', '', '', 0, 0, 0),
('1352', 'COMPRESION DE DATOS SIN PERDIDA', '', '', 0, 0, 0),
('1358', 'TEORIA DE LA COMPUTACION', '', '', 0, 0, 0),
('1403', 'INT. A LA ARQUITECTURA DE COMPUTADORES', '', '', 0, 0, 0),
('1414', 'SISTEMAS DISTRIBUIDOS', '', '', 0, 0, 0),
('1416', 'INT. A LA CRIPTOGRAFIA', '', '', 0, 0, 0),
('1426', 'TRAF.RESTRIC.T. REAL REDES BEST EFFORT', '', '', 0, 0, 0),
('1427', 'COMPUTACION CUANTICA', '', '', 0, 0, 0),
('1428', 'TALLER DE FIRMWARE', '', '', 0, 0, 0),
('1431', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 0, 0, 0),
('1432', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 0, 0, 0),
('1434', 'COMPUTACION DE ALTA PERFORMANCE', '', '', 0, 0, 0),
('1435', 'DISEÑO TOPOLOGICO DE REDES', '', '', 0, 0, 0),
('1436', 'FUND.PARA LA INVEST.EN REDES DE COMPUTAD', '', '', 0, 0, 0),
('1437', 'TALLER DE SEGURIDAD INFORMATICA', '', '', 0, 0, 0),
('1438', 'APL.DE TEORIA DE LA INF.AL PROC.DE IMAG.', '', '', 0, 0, 0),
('1440', 'ANAL.Y DIS.DE ALGORIT.DISTRIB.EN REDES', '', '', 0, 0, 0),
('1441', 'CURVAS ELIPTICAS EN CRIPTOGRAFIA', '', '', 0, 0, 0),
('1442', 'ROBOTICA EMBEBIDA', '', '', 0, 0, 0),
('1443', 'ARQUITECTURA DE COMPUTADORAS', '', '', 0, 0, 0),
('1444', 'ASPECTOS AVANZ. DE ARQ.DE COMPUTADORAS', '', '', 0, 0, 0),
('1445', 'TALLER DE ARQUITECTURA DE COMPUTADORAS', '', '', 0, 0, 0),
('1446', 'REDES DE COMPUTADORAS', '', '', 0, 0, 0),
('1447', 'COMPUT.DE PR.GRAL.EN UNID.DE PROC.GRAF.', '', '', 0, 0, 0),
('1448', 'ASPECTOS AVANZ. DE REDES DE COMPUTADORAS', '', '', 0, 0, 0),
('1449', 'TALLER DE GPGPU', '', '', 0, 0, 0),
('1450', 'INT. A LA TEORIA DE LA INFORMACION', '', '', 0, 0, 0),
('1453', 'COMPL.ARQUITECTURA DE COMPUTADORAS', '', '', 0, 0, 0),
('1454', 'ASPECTOS BASICOS DE REDES DE COMP.', '', '', 0, 0, 0),
('1507', 'INT. A LAS ORGANIZACIONES', '', '', 0, 0, 0),
('1510', 'CONTROL DE CALIDAD', '', '', 0, 0, 0),
('1513C', 'INT. A LOS MICROPROCESADORES', '', '', 0, 0, 0),
('1514', 'ORGANIZACIONES Y SU ADMINISTRACION', '', '', 0, 0, 0),
('1519', 'INT. A LA ADMINISTRACION PARA INGENIEROS', '', '', 0, 0, 0),
('1535', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 0, 0, 0),
('1537', 'SISTEMAS OPERATIVOS', '', '', 0, 0, 0),
('1542', 'TALLER DE SISTEMAS OPERATIVOS', '', '', 0, 0, 0),
('1543', 'INT. AL NEGOCIO DEL SOFTWARE', '', '', 0, 0, 0),
('1610', 'INT. A LA INVESTIGACION DE OPERACIONES', '', '', 0, 0, 0),
('1613', 'METAHEURISTICAS Y OPTIMIZ.SOBRE REDES', '', '', 0, 0, 0),
('1617', 'SIMULACION A EVENTOS DISCRETOS', '', '', 0, 0, 0),
('1621', 'EXTENS. DE PROG. LINEAL Y PROG. ENTERA', '', '', 0, 0, 0),
('1623', 'INVEST. DE OPER. EN COMERCIO ELECTRONICO', '', '', 0, 0, 0),
('1624', 'MODELADO Y OPTIMIZACION', '', '', 0, 0, 0),
('1625', 'ALGORITMOS GENETICOS', '', '', 0, 0, 0),
('1626', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 0, 0, 0),
('1627', 'SEMINARIO:ELEMENTOS DE METAHEURISTICAS', '', '', 0, 0, 0),
('1628', 'ALGORITMOS EVOLUTIVOS', '', '', 0, 0, 0),
('1629', 'INT. A LA OPTIMIZ.Y A LA PROG. CON RESTR', '', '', 0, 0, 0),
('1630', 'INVESTIGACION DE OPER.Y GEST. DE RIESGOS', '', '', 0, 0, 0),
('1631', 'FUNDAMENTOS DE PROGRAMACION ENTERA', '', '', 0, 0, 0),
('1632', 'OPTIMIZACION BAJO INCERTIDUMBRE', '', '', 0, 0, 0),
('1716', 'INT. A LA INGENIERIA DE SOFTWARE', '', '', 0, 0, 0),
('1721', 'PROYECTO DE INGENIERIA DE SOFTWARE', '', '', 0, 0, 0),
('1728', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 0, 0, 0),
('1730', 'PROYECTO DE GRADO', '', '', 0, 0, 0),
('1731', 'PASANTIA (COMPUTACION)', '', '', 0, 0, 0),
('1732', 'ARQUITECTURA DE SOFTWARE', '', '', 0, 0, 0),
('1733', 'TALLER DE DESARROLLO CLIENTE/SERVIDOR', '', '', 0, 0, 0),
('1734', 'TALLER SISTEMAS DE INFORMACION 1', '', '', 0, 0, 0),
('1735', 'TALLER SISTEMAS DE INFORMACION 2', '', '', 0, 0, 0),
('1736', 'INT. A LA INTERAC. PERSONA COMPUTADORA', '', '', 0, 0, 0),
('1737', 'GESTION DE SOFTWARE', '', '', 0, 0, 0),
('1739', 'TALLER DE GESTION DE SOFTWARE', '', '', 0, 0, 0),
('1740', 'TALLER DE SISTEMAS DE INFORMACION 3', '', '', 0, 0, 0),
('1741', 'TALLER DE SISTEMAS DE INFORMACION 4', '', '', 0, 0, 0),
('1742', 'TALLER DE VERIFICACION DEL SOFTWARE', '', '', 0, 0, 0),
('1743', 'ARQUITECTURA DE SOFTWARE', '', '', 0, 0, 0),
('1748', 'SEMINARIO DE PROCESAM. PARALELO APLICADO', '', '', 0, 0, 0),
('1749', 'INTERACCION PERSONA COMPUTADORA', '', '', 0, 0, 0),
('1750', 'TALLER DE ARQUITECTURA DE SOFTWARE', '', '', 0, 0, 0),
('1751', 'TALLER DE SISTEMAS DE INFORMACION 1', '', '', 0, 0, 0),
('1752', 'TALLER DE PSP', '', '', 0, 0, 0),
('1758', 'RELAC.PERS.EN ING.DE SOFT.Y GER.DE PROY.', '', '', 0, 0, 0),
('1759', 'TALLER DE SIST. DE INF.GEOGRAF.EMPRESAR.', '', '', 0, 0, 0),
('1766', 'TALLER DE GEST.Y TEC.PROC.NEGOCIO (TBPM)', '', '', 0, 0, 0),
('1767', 'PRINC.Y FUND.DEL PROC.PERS.DE SOFTWARE', '', '', 0, 0, 0),
('1768', 'TALLER DE INTERACCION PERSONA COMPUTAD.', '', '', 0, 0, 0),
('1769', 'PROFESION EN INGENIERIA DE SOFTWARE', '', '', 0, 0, 0),
('1820', 'APRENDIZAJE AUTOMATICO', '', '', 0, 0, 0),
('1821', 'EXTRACCION Y CATEGORIZACION DE INFORM.', '', '', 0, 0, 0),
('1827', 'APRENDIZAJE AUTOMATICO', '', '', 0, 0, 0),
('1828', 'INT. AL PROCESAMIENTO DE LENG. NATURAL', '', '', 0, 0, 0),
('1829', 'I.A. Y ROBOTICA', '', '', 0, 0, 0),
('1832', 'CONST.DE MOD.PROB.DEL LENGUAJE NATURAL', '', '', 0, 0, 0),
('1834', 'METODOS DE APRENDIZAJE AUTOMATICO', '', '', 0, 0, 0),
('1835', 'GRAMATICAS FORMALES PARA EL LENG.NATURAL', '', '', 0, 0, 0),
('1848', 'ROBOTICA BASADA EN COMPORTAMIENTOS', '', '', 0, 0, 0),
('1849', 'BUTIA: ROBOTICA EDUCATIVA', '', '', 0, 0, 0),
('1911', 'FUNDAMENTOS DE BASES DE DATOS', '', '', 0, 0, 0),
('1916', 'DESCUBRIMIENTO DE INF.EN BASES DE DATOS', '', '', 0, 0, 0),
('1917', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 0, 0, 0),
('1918', 'ADMINISTRACION Y SEGURIDAD DE SISTEMAS', '', '', 0, 0, 0),
('1919', 'INTEROPERABILIDAD', '', '', 0, 0, 0),
('1921', 'GESTION DE CALIDAD', '', '', 0, 0, 0),
('1926', 'INT. A LOS SIST. DE INFOR. GEOGRAFICA', '', '', 0, 0, 0),
('1929', 'WEB Y BASE DE DATOS', '', '', 0, 0, 0),
('1930', 'ORGANIZACIONES PARA INGENIEROS', '', '', 0, 0, 0),
('1931', 'SISTEMAS MULTIFUENTES', '', '', 0, 0, 0),
('1932', 'METADATA EN SISTEMAS DE INFORMACION', '', '', 0, 0, 0),
('1933', 'TEC.AVANZ.PARA LA GEST.DE SIST.DE INF.', '', '', 0, 0, 0),
('1934', 'INTEROPERABILIDAD SEMANTICA', '', '', 0, 0, 0),
('1935', 'CALIDAD DE DATOS', '', '', 0, 0, 0),
('1936', 'INT. AL MIDDLEWARE', '', '', 0, 0, 0),
('1937', 'SISTEMAS DE INFORMACION EN SALUD', '', '', 0, 0, 0),
('1938', 'RECUP.DE INF.Y RECOMEND.EN LA WEB (WIR)', '', '', 0, 0, 0),
('1939', 'DISEÑO Y CONSTRUCCION DE DATA WAREHOUSE', '', '', 0, 0, 0),
('1940', 'GESTION DE CALIDAD', '', '', 0, 0, 0),
('1941', 'INTEGRACION DE DATOS', '', '', 0, 0, 0),
('1942', 'FUNDAMENTOS DE LA WEB SEMANTICA', '', '', 0, 0, 0),
('1943', 'SEMINARIO RECUP.DE INF.Y REC.EN LA WEB', '', '', 0, 0, 0),
('1944', 'ADMINISTRACION GENERAL PARA INGENIEROS', '', '', 0, 0, 0),
('1945', 'PRACTICA DE ADMINIST. PARA INGENIEROS', '', '', 0, 0, 0),
('1947', 'TALLER DE LENG.Y TEC.DE LA WEB SEMANTICA', '', '', 0, 0, 0),
('1948', 'INTRODUCCION AL MIDDLEWARE', '', '', 0, 0, 0),
('2034', 'TALLER ENCARARE 1:CREATIVIDAD E INNOVAC.', '', '', 0, 0, 0),
('2036', 'TALLER ENCARARE 2:PLANIF.DE LA FUT.EMPR.', '', '', 0, 0, 0),
('5705', 'SEMINARIO DE INGENIERIA BIOMEDICA', '', '', 0, 0, 0),
('5707', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 0, 0, 0),
('5709', 'IMAGENES MEDICAS:ADQ. INSTRUM. Y GESTION', '', '', 0, 0, 0),
('5823', 'TALLER DE TELEMATICA', '', '', 0, 0, 0),
('5831', 'INT. AL RECONOCIMIENTO DE PATRONES', '', '', 0, 0, 0),
('5912', 'SISTEMAS NEURO FUZZY', '', '', 0, 0, 0),
('5914', 'ALGEBRA LINEAL NUMERICA', '', '', 0, 0, 0),
('5915', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 0, 0, 0),
('5916', 'FUNDAMENTOS DE SEGURIDAD INFORMATICA', '', '', 0, 0, 0);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_grupo`
--

CREATE TABLE IF NOT EXISTS `curso_grupo` (
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `puntaje` int(2) NOT NULL,
  PRIMARY KEY (`idGrupo`,`idCurso`),
  KEY `idCurso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `previas_cursos`
--

CREATE TABLE IF NOT EXISTS `previas_cursos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idPrevia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `tipoActividad` enum('curso','examen') COLLATE utf8_spanish_ci NOT NULL,
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
