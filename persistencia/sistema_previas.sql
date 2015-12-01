-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2015 a las 23:46:35
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
-- Estructura de tabla para la tabla `previas_grupos`
--

CREATE TABLE IF NOT EXISTS `previas_grupos` (
  `idCarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idCurso` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idGrupo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `actividad` enum('curso','examen') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`,`idCurso`,`idGrupo`,`actividad`),
  KEY `idCurso` (`idCurso`),
  KEY `idGrupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `previas_grupos`
--

INSERT INTO `previas_grupos` (`idCarrera`, `idCurso`, `idGrupo`, `actividad`) VALUES
('7200', '1011', '1042', 'curso'),
('7200', '1012', '1026', 'curso'),
('7200', '1012', '1029', 'curso'),
('7200', '1012', '1031E', 'curso'),
('7200', '1012', 'CP29', 'curso'),
('7200', '1022', '1020E', 'examen'),
('7200', '1022', 'C1020', 'curso'),
('7200', '1024', '1001', 'curso'),
('7200', '1024', '1030', 'curso'),
('7200', '1025', '1001', 'curso'),
('7200', '1025', '1002', 'curso'),
('7200', '1026', '1030', 'curso'),
('7200', '1027', '1023', 'curso'),
('7200', '1028', '1000', 'curso'),
('7200', '1028', '1001', 'curso'),
('7200', '1031', '1030C', 'curso'),
('7200', '1031', '1030E', 'examen'),
('7200', '1033', '1000', 'curso'),
('7200', '1033', 'CA1Y2', 'curso'),
('7200', '1033', 'PR1', 'curso'),
('7200', '1042', '1000', 'curso'),
('7200', '1042', '1026', 'curso'),
('7200', '1042', '1029', 'curso'),
('7200', '1042', 'CA1Y2', 'curso'),
('7200', '1042', 'CP29', 'curso'),
('7200', '1042', 'PROBA', 'curso'),
('7200', '1046', '1000', 'curso'),
('7200', '1046', '1023E', 'curso'),
('7200', '1046', '1025E', 'curso'),
('7200', '1046', 'CA1Y2', 'curso'),
('7200', '1046', 'CP29', 'curso'),
('7200', '1057', '1025E', 'curso'),
('7200', '1057', '1033E', 'curso'),
('7200', '1057', '1610E', 'curso'),
('7200', '1059', '1020E', 'curso'),
('7200', '1059', '1029', 'curso'),
('7200', '1059', '1030', 'curso'),
('7200', '1059', '1322E', 'curso'),
('7200', '1131', '1121E', 'curso'),
('7200', '1152', '1020C', 'curso'),
('7200', '1152', '1022', 'examen'),
('7200', '1152', 'F1C', 'curso'),
('7200', '1152', 'F1E', 'examen'),
('7200', '1153', '1020C', 'curso'),
('7200', '1153', '1022', 'examen'),
('7200', '1153', 'F1E', 'examen'),
('7200', '1153', 'FIS', 'curso'),
('7200', '1316', '1031A', 'curso'),
('7200', '1316', '1324E', 'curso'),
('7200', '1316', 'CP29', 'curso'),
('7200', '1321', '1320', 'curso'),
('7200', '1323', '1012', 'curso'),
('7200', '1323', '1013', 'curso'),
('7200', '1323', '1029', 'curso'),
('7200', '1324', '1020', 'curso'),
('7200', '1324', '1030', 'curso'),
('7200', '1324', '1321', 'curso'),
('7200', '1324', '1323', 'curso'),
('7200', '1324', 'MATD1', 'curso'),
('7200', '1325', '1020', 'curso'),
('7200', '1325', '1030', 'curso'),
('7200', '1325', '1323', 'curso'),
('7200', '1325', 'LOGIC', 'curso'),
('7200', '1327', '1324', 'curso'),
('7200', '1328', '1029', 'curso'),
('7200', '1328', '1321', 'curso'),
('7200', '1328', '1325E', 'curso'),
('7200', '1328', 'CP4', 'curso'),
('7200', '1331', '1325E', 'curso'),
('7200', '1331', 'CP29', 'curso'),
('7200', '1331', 'CP30', 'curso'),
('7200', '1340', '1026', 'curso'),
('7200', '1340', '1325E', 'curso'),
('7200', '1340', 'CP29', 'curso'),
('7200', '1340', 'CP4', 'curso'),
('7200', '1347', '1328', 'curso'),
('7200', '1347', 'CP4', 'curso'),
('7200', '1351', '1000', 'curso'),
('7200', '1351', '1025E', 'curso'),
('7200', '1351', '1026', 'curso'),
('7200', '1351', '1029', 'curso'),
('7200', '1351', '1323', 'curso'),
('7200', '1358', '1325E', 'curso'),
('7200', '1414', '1321', 'curso'),
('7200', '1414', '1325E', 'curso'),
('7200', '1414', '1403E', 'curso'),
('7200', '1414', '1406C', 'curso'),
('7200', '1414', '1511E', 'curso'),
('7200', '1414', '1911E', 'curso'),
('7200', '1414', 'CP29', 'curso'),
('7200', '1414', 'CP30', 'curso'),
('7200', '1414', 'CP4', 'curso'),
('7200', '1414', 'PR1', 'curso'),
('7200', '1416', '1025E', 'curso'),
('7200', '1416', '1026', 'curso'),
('7200', '1416', '1029', 'curso'),
('7200', '1416', 'CP29', 'curso'),
('7200', '1434', '1324C', 'curso'),
('7200', '1434', '1403C', 'curso'),
('7200', '1434', '1406C', 'curso'),
('7200', '1434', '1511', 'curso'),
('7200', '1435', '1610E', 'curso'),
('7200', '1437', '1406C', 'curso'),
('7200', '1437', '1911E', 'curso'),
('7200', '1437', 'CP29', 'curso'),
('7200', '1438', '1025E', 'curso'),
('7200', '1440', '1406E', 'curso'),
('7200', '1440', 'CP29', 'curso'),
('7200', '1441', '1000', 'curso'),
('7200', '1441', '1025E', 'curso'),
('7200', '1441', '1026', 'curso'),
('7200', '1441', '1029', 'curso'),
('7200', '1441', '1323', 'curso'),
('7200', '1442', '1424E', 'curso'),
('7200', '1442', '1425C', 'curso'),
('7200', '1442', '1511', 'curso'),
('7200', '1442', 'CP29', 'curso'),
('7200', '1443', '1013', 'curso'),
('7200', '1443', '1020', 'curso'),
('7200', '1443', '1023C', 'curso'),
('7200', '1443', '1322E', 'curso'),
('7200', '1443', '2 LOG', 'curso'),
('7200', '1444', '1424E', 'curso'),
('7200', '1444', '1511', 'curso'),
('7200', '1445', '1424E', 'curso'),
('7200', '1445', '1511', 'curso'),
('7200', '1446', '1020', 'curso'),
('7200', '1446', '1403C', 'curso'),
('7200', '1446', '1511', 'curso'),
('7200', '1446', 'CP29', 'curso'),
('7200', '1447', '1324C', 'curso'),
('7200', '1447', '1424E', 'curso'),
('7200', '1447', 'CP29', 'curso'),
('7200', '1448', '1406C', 'curso'),
('7200', '1450', 'PROBA', 'curso'),
('7200', '1453', '1424E', 'examen'),
('7200', '1453', '1511', 'examen'),
('7200', '1535', '1324E', 'curso'),
('7200', '1535', '1511E', 'curso'),
('7200', '1537', '1020', 'curso'),
('7200', '1537', '1029', 'curso'),
('7200', '1537', '1030', 'curso'),
('7200', '1537', '1321', 'curso'),
('7200', '1537', '1323', 'curso'),
('7200', '1537', '1403C', 'curso'),
('7200', '1543', '1716C', 'curso'),
('7200', '1610', '1000', 'curso'),
('7200', '1610', 'CA1Y2', 'curso'),
('7200', '1610', 'PROBA', 'curso'),
('7200', '1613', '1000', 'curso'),
('7200', '1613', '1025E', 'curso'),
('7200', '1613', '1026', 'curso'),
('7200', '1613', '1029', 'curso'),
('7200', '1613', '1610E', 'curso'),
('7200', '1613', 'CA1Y2', 'curso'),
('7200', '1613', 'CP29', 'curso'),
('7200', '1617', '1025E', 'curso'),
('7200', '1617', '1610E', 'curso'),
('7200', '1617', 'CP29', 'curso'),
('7200', '1624', '1610E', 'curso'),
('7200', '1628', '1324E', 'curso'),
('7200', '1628', '1610E', 'curso'),
('7200', '1628', 'PROBA', 'curso'),
('7200', '1629', '1610E', 'curso'),
('7200', '1630', '1610E', 'curso'),
('7200', '1631', '1610E', 'curso'),
('7200', '1632', '1610E', 'curso'),
('7200', '1716', '1324C', 'curso'),
('7200', '1716', '1327', 'curso'),
('7200', '1716', '1911C', 'curso'),
('7200', '1721', '1324E', 'curso'),
('7200', '1721', '1327', 'curso'),
('7200', '1731', '1000', 'curso'),
('7200', '1731', '1012', 'curso'),
('7200', '1731', '1026', 'curso'),
('7200', '1731', '1029', 'curso'),
('7200', '1731', '1321', 'curso'),
('7200', '1731', 'CA1Y2', 'curso'),
('7200', '1731', 'CP4', 'curso'),
('7200', '1731', 'E1403', 'curso'),
('7200', '1731', 'PROBA', 'curso'),
('7200', '1734', '1324E', 'curso'),
('7200', '1734', '1327', 'curso'),
('7200', '1734', '1511', 'curso'),
('7200', '1734', '1911E', 'curso'),
('7200', '1735', '1511', 'curso'),
('7200', '1735', '1911E', 'curso'),
('7200', '1735', 'CP30', 'curso'),
('7200', '1740', '1511E', 'curso'),
('7200', '1740', '1721', 'curso'),
('7200', '1740', '1734', 'curso'),
('7200', '1740', '1911E', 'curso'),
('7200', '1740', 'CP30', 'curso'),
('7200', '1741', '1511E', 'curso'),
('7200', '1741', '1721', 'curso'),
('7200', '1741', '1734', 'curso'),
('7200', '1741', '1911E', 'curso'),
('7200', '1742', '1716C', 'curso'),
('7200', '1742', '1911E', 'curso'),
('7200', '1749', '1324E', 'curso'),
('7200', '1751', '1324E', 'curso'),
('7200', '1751', '1327', 'curso'),
('7200', '1751', '1511', 'curso'),
('7200', '1751', '1911E', 'curso'),
('7200', '1758', '1716C', 'curso'),
('7200', '1759', '1327', 'curso'),
('7200', '1759', '1911E', 'curso'),
('7200', '1766', '1327', 'curso'),
('7200', '1767', '1324C', 'curso'),
('7200', '1768', '1716E', 'curso'),
('7200', '1769', '1324E', 'curso'),
('7200', '1769', '1716E', 'curso'),
('7200', '1827', '1026', 'curso'),
('7200', '1827', 'CP29', 'curso'),
('7200', '1827', 'CP4', 'curso'),
('7200', '1827', 'PROBA', 'curso'),
('7200', '1828', '1325E', 'curso'),
('7200', '1828', 'CP29', 'curso'),
('7200', '1828', 'CP30', 'curso'),
('7200', '1828', 'CP4', 'curso'),
('7200', '1828', 'PROBA', 'curso'),
('7200', '1834', '1025E', 'curso'),
('7200', '1834', '1026', 'curso'),
('7200', '1834', 'CP29', 'curso'),
('7200', '1834', 'CP4', 'curso'),
('7200', '1835', '1025E', 'curso'),
('7200', '1835', '1026', 'curso'),
('7200', '1835', '1325E', 'curso'),
('7200', '1835', 'CP29', 'curso'),
('7200', '1835', 'CP4', 'curso'),
('7200', '1848', '1327', 'curso'),
('7200', '1848', 'CP4', 'curso'),
('7200', '1848', 'FISIC', 'curso'),
('7200', '1849', '1322E', 'curso'),
('7200', '1911', '1026', 'curso'),
('7200', '1911', '1511', 'curso'),
('7200', '1911', 'CP29', 'curso'),
('7200', '1911', 'CP4', 'curso'),
('7200', '1918', '1406C', 'curso'),
('7200', '1918', '1511', 'curso'),
('7200', '1918', '1716C', 'curso'),
('7200', '1918', '1911C', 'curso'),
('7200', '1918', '1918', 'curso'),
('7200', '1918', 'C1425', 'curso'),
('7200', '1926', '1911E', 'curso'),
('7200', '1926', 'CP30', 'curso'),
('7200', '1933', '1406C', 'curso'),
('7200', '1933', '1911E', 'curso'),
('7200', '1935', '1025C', 'curso'),
('7200', '1935', '1324E', 'curso'),
('7200', '1935', '1327', 'curso'),
('7200', '1935', '1911E', 'curso'),
('7200', '1936', '1327', 'curso'),
('7200', '1936', '1511E', 'curso'),
('7200', '1936', '1911E', 'curso'),
('7200', '1937', '1911E', 'curso'),
('7200', '1938', '1911E', 'curso'),
('7200', '1938', 'CP29', 'curso'),
('7200', '1939', '1324E', 'curso'),
('7200', '1939', '1327', 'curso'),
('7200', '1939', '1911E', 'curso'),
('7200', '1941', '1911E', 'curso'),
('7200', '1942', '1716E', 'curso'),
('7200', '1942', '1911E', 'curso'),
('7200', '1947', '1406C', 'curso'),
('7200', '1947', '1911C', 'curso'),
('7200', '5707', '1406C', 'curso'),
('7200', '5707', '1721', 'curso'),
('7200', '5914', '1033E', 'curso'),
('7200', '5914', '1324C', 'curso'),
('7200', '5914', 'CP29', 'curso'),
('7200', '5916', '1406E', 'curso'),
('7200', '5916', '1511E', 'curso'),
('7200', '5916', '1911E', 'curso'),
('7200', '5916', 'CP29', 'curso'),
('7200', '5916', 'CP4', 'curso');

--
-- Restricciones para tablas volcadas
--

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
