CREATE DATABASE  IF NOT EXISTS `hospital_general_8a_idgs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_general_8a_idgs`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: integradora-hospital-2024.online    Database: hospital_general_8a_idgs
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `Persona_ID` int unsigned NOT NULL,
  `NSS` varchar(15) DEFAULT NULL,
  `Tipo_Seguro` varchar(50) NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_UltimaCita` datetime NOT NULL,
  `Estatus_Medico` varchar(100) DEFAULT 'Normal',
  `Estatus_Vida` enum('Vivo','Finado','Coma','Vegetativo') NOT NULL DEFAULT 'Vivo',
  `Estatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Persona_ID`),
  UNIQUE KEY `NSS_UNIQUE` (`NSS`),
  CONSTRAINT `fk_Persona_2` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_pacientes`
--

LOCK TABLES `tbb_pacientes` WRITE;
/*!40000 ALTER TABLE `tbb_pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personal_medico`
--

DROP TABLE IF EXISTS `tbb_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal_medico` (
  `Persona_ID` int unsigned NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Especialidad` varchar(50) DEFAULT NULL,
  `Tipo` enum('Médico','Enfermero','Administrativo','Directivo','Apoyo','Residente','Interno') NOT NULL,
  `Cedula_Profesional` int(8) unsigned zerofill DEFAULT NULL,
  `Estatus` enum('Activo','Inactivo','Jubilado','Permiso') NOT NULL DEFAULT 'Activo',
  `Fecha_Contratacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Terminacion_Contrato` datetime DEFAULT NULL,
  PRIMARY KEY (`Persona_ID`),
  UNIQUE KEY `Cedula_Profesional_UNIQUE` (`Cedula_Profesional`),
  KEY `fk_area_medica` (`Departamento_ID`),
  CONSTRAINT `fk_departamento_2` FOREIGN KEY (`Departamento_ID`) REFERENCES `tbc_departamentos` (`ID`),
  CONSTRAINT `fk_personas_1` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personal_medico`
--

LOCK TABLES `tbb_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_personal_medico` DISABLE KEYS */;
INSERT INTO `tbb_personal_medico` VALUES (1,53,'Medicina General','Médico',05453705,'Activo','2023-11-12 15:13:04',NULL),(2,56,NULL,'Directivo',29677616,'Activo','2020-08-11 19:35:26',NULL),(3,14,NULL,'Apoyo',08091669,'Activo','2018-03-07 11:07:09',NULL),(4,21,NULL,'Apoyo',88524904,'Activo','2017-02-01 10:18:39',NULL),(5,45,'Medicina General','Residente',04116240,'Activo','2020-04-20 09:16:54',NULL);
/*!40000 ALTER TABLE `tbb_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(20) DEFAULT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Primer_Apellido` varchar(80) NOT NULL,
  `Segundo_Apellido` varchar(80) DEFAULT NULL,
  `CURP` varchar(18) DEFAULT NULL,
  `Genero` enum('M','F','N/B') NOT NULL,
  `Grupo_Sanguineo` enum('A','B','AB','O') NOT NULL,
  `Tipo_Sanguineo` enum('+','-') NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CURP_UNIQUE` (`CURP`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla base que almacenara la informacion los datos personales de  EMPLEADOS y PACIENTES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
INSERT INTO `tbb_personas` VALUES (1,'Dra.','Fabiola Refugio','Padilla','Velazquez','PAVF741231MSPDLB00','F','O','+','1974-12-31',_binary '','2019-09-03 08:23:53','2024-03-24 20:48:10'),(2,NULL,'Vicente','Sampayo','Pacheco','SAPV770801HGTMCC00','M','O','+','1977-08-01',_binary '','2020-05-06 18:18:35','2024-03-24 20:48:10'),(3,NULL,'Claudio Lenin','Muñoz','Peña','MUPC760226HSRNNL00','M','A','+','1976-02-26',_binary '','2010-02-21 18:30:41','2024-03-24 20:48:10'),(4,NULL,'Iris Edith','Valdéz','Juárez','VAJI790519MSRLRR00','F','A','+','1979-05-19',_binary '','2016-04-07 13:26:37','2024-03-24 20:48:10'),(5,NULL,'Nora Concepción','Alvarado','Rosas','AARN731228MCCLSR00','F','AB','+','1973-12-28',_binary '','2001-10-12 19:22:26','2024-03-24 20:48:10');
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_personas_after_insert` AFTER INSERT ON `tbb_personas` FOR EACH ROW BEGIN
    DECLARE nombre_persona VARCHAR(255);

    -- Obtener el nombre de la persona recién insertada
    SET nombre_persona = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                         FROM tbb_personas p
                         WHERE p.id = NEW.ID);

    -- Registrar en la bitácora la inserción de una nueva persona
    INSERT INTO tbi_bitacora VALUES (
       DEFAULT, 'tbb_personas', USER(), 'Insert',
       CONCAT_WS(" ", 'Se ha agregado una nueva PERSONA con el ID: ', NEW.ID,
                         ', Nombre: ', nombre_persona,
                         ', Titulo: ', NEW.Titulo,
                         ', Primer Apellido: ', NEW.Primer_Apellido,
                         ', Segundo Apellido: ', NEW.Segundo_Apellido,
                         ', CURP: ', NEW.CURP,
                         ', Genero: ', NEW.Genero,
                         ', Grupo Sanguineo: ', NEW.Grupo_Sanguineo,
                         ', Tipo Sanguineo: ', NEW.Tipo_Sanguineo,
                         ', Fecha de Nacimiento: ', NEW.Fecha_Nacimiento,
                         ', Estatus: ', NEW.Estatus),
       NOW()
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_personas_before_update` BEFORE UPDATE ON `tbb_personas` FOR EACH ROW BEGIN
     SET NEW.Fecha_Actualizacion = current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_personas_after_update` AFTER UPDATE ON `tbb_personas` FOR EACH ROW BEGIN
    DECLARE nombre_persona_old VARCHAR(255);
    DECLARE nombre_persona_new VARCHAR(255);

    -- Obtener el nombre de la persona antes y después de la actualización
    SET nombre_persona_old = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                              FROM tbb_personas p
                              WHERE p.id = OLD.ID);
    
    SET nombre_persona_new = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                              FROM tbb_personas p
                              WHERE p.id = NEW.ID);

    -- Registrar en la bitácora la actualización de una persona
    INSERT INTO tbi_bitacora VALUES (
       DEFAULT, 'tbb_personas', USER(), 'Update',
       CONCAT_WS(" ", 'Se ha actualizado los datos de la PERSONA con el ID: ', OLD.ID,
                         ', Nombre Antiguo: ', nombre_persona_old,
                         ', Nombre Nuevo: ', nombre_persona_new,
                         ', Titulo: ', NEW.Titulo,
                         ', Primer Apellido: ', NEW.Primer_Apellido,
                         ', Segundo Apellido: ', NEW.Segundo_Apellido,
                         ', CURP: ', NEW.CURP,
                         ', Genero: ', NEW.Genero,
                         ', Grupo Sanguineo: ', NEW.Grupo_Sanguineo,
                         ', Tipo Sanguineo: ', NEW.Tipo_Sanguineo,
                         ', Fecha de Nacimiento: ', NEW.Fecha_Nacimiento,
                         ', Estatus: ', NEW.Estatus),NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tbb_personas_after_delete` AFTER DELETE ON `tbb_personas` FOR EACH ROW BEGIN


    -- Registrar en la bitácora la eliminación de una persona
    INSERT INTO tbi_bitacora VALUES (
       DEFAULT, 'personas', USER(), 'Delete',
       CONCAT_WS(" ", 'Se ha eliminado la PERSONA con el ID:', OLD.ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_areas_medicas`
--

DROP TABLE IF EXISTS `tbc_areas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'DESCRIPCION: Atributo clave primaria autoincremental que identificara cada registro del AREA MEDICA.\\nNATURALEZA: Cuantitativo\\nTIPO: Numérico\\nDOMINIO: Número Enteros Positivos\\nCOMPOSICION: \nID =  1{0-9}*',
  `Nombre` varchar(150) NOT NULL COMMENT 'DESCRIPCION: Denominación del Area Medica a la que pertenece el Departamento \\nNATURALEZA: Cualitativo\\nTIPO: Alfanumerico\\nDOMINIO: Letras y Numeros \\nCOMPOSICION: 1{a-Z| |0-9}150\\n',
  `Descripcion` text COMMENT 'DESCRIPCION: Redaccion extensa del AREA MEDICA\nNATURALEZA: Cualitativo\nTIPO: Alfanumerico\nDOMINIO: Letras y Numeros \nCOMPOSICION:  0{a-Z| |0-9}*\n',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'DESCRIPCION: Valor actual del estado del registro.\nNATURALEZA: Cuantitativo\nTIPO: Booleano\nDOMINIO: 0 para Inactivo, 1 para Activo\nCOMPOSICION:  [0|1]\n',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'DESCRIPCION: Fecha en formato  AAAA-MM-DD hh:mm:ss, en la que se registro el area medica\nNATURALEZA: Cualitativo\nTIPO: Alfanumerico\nDOMINIO: Letras y Numeros \nCOMPOSICION:  \nAAAA =  [1000|...|9999]   #Se restringiran con una restriccion del tipo CHECK, para permitir solo las fecha validas para el contexto del Hospital\nMM = [01|...|12]\nDD = [01|...|31]  #El SGBD valida la correspondencia entre MES y DIA para evita los errores de captura, y AÑO en caso de bisiestos.\nhh = [00|...|23]\nmm = [00|...|59]\nss =[00|...|59]\nFecha_Regustri =  AAAA+''-''+MM+''-''+DD+'' ''+hh+'':''+mm+'':''+ss',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'DESCRIPCION: Fecha en formato  AAAA-MM-DD hh:mm:ss, en la que se realizaron los últimos cambios al area medica\nTIPO: Alfanumerico\nDOMINIO: Letras y Numeros \nCOMPOSICION:  \nAAAA =  [1000|...|9999]   #Se restringiran con una restriccion del tipo CHECK, para permitir solo las fecha validas para el contexto del Hospital\nMM = [01|...|12]\nDD = [01|...|31]  #El SGBD valida la correspondencia entre MES y DIA para evita los errores de captura, y AÑO en caso de bisiestos.\nhh = [00|...|23]\nmm = [00|...|59]\nss =[00|...|59]\nFecha_Regustri =  AAAA+''-''+MM+''-''+DD+'' ''+hh+'':''+mm+'':''+ss',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla catalogo que almacenara la informacion de cada area medica del hospital, agrupando aquellas que por servicios comparten responsabilidades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_areas_medicas`
--

LOCK TABLES `tbc_areas_medicas` WRITE;
/*!40000 ALTER TABLE `tbc_areas_medicas` DISABLE KEYS */;
INSERT INTO `tbc_areas_medicas` VALUES (1,'Servicios Médicos','Por definir',_binary '','2024-01-19 13:45:45',NULL),(2,'Servicios de Apoyo','Por definir',_binary '','2024-01-19 13:47:14',NULL),(3,'Servicios Médico - Administrativos','Por definir',_binary '','2024-01-19 13:47:14',NULL),(4,'Servicios de Enfermería','Por definir',_binary '','2024-01-19 13:47:14',NULL),(5,'Departamentos Administrativos','Por definir',_binary '','2024-01-19 13:47:14',NULL),(7,'Servicios de Gobierno','Por definir',_binary '\0','2024-02-13 10:55:00','2024-02-13 10:55:12');
/*!40000 ALTER TABLE `tbc_areas_medicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_areas_medicas_after_insert` AFTER INSERT ON `tbc_areas_medicas` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES (
   DEFAULT, "tbc_areas_medicas", user(), 
   "Insert",
   CONCAT_WS(" ","Se ha agregado una nueva AREA_MEDICA con el ID:",
   NEW.id,", con los siguientes datos; NOMBRE:",
   NEW.nombre,", DESCRIPCION:",NEW.descripcion, 
   ", ESTATUS:", NEW.estatus), 
   now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_areas_medicas_before_update` BEFORE UPDATE ON `tbc_areas_medicas` FOR EACH ROW BEGIN
     SET NEW.Fecha_Actualizacion = current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_areas_medicas_after_update` AFTER UPDATE ON `tbc_areas_medicas` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES (
   DEFAULT, "tbc_areas_medicas", user(), 
   "Update",
   CONCAT_WS(" ","Se ha modificado una AREA_MEDICA con  ID:", OLD.id,", con los siguientes cambios: ----",
   "NOMBRE:", OLD.nombre,"-", NEW.nombre, ",",
   "DESCRIPCION:", OLD.descripcion,"-",NEW.descripcion, ",", 
   "ESTATUS:", OLD.estatus,"-",NEW.estatus), 
   now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_areas_medicas_delete` AFTER DELETE ON `tbc_areas_medicas` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES (
   DEFAULT, "tbc_areas_medicas", user(), 
   "Delete",
   CONCAT_WS(" ","Se eliminado los datos del AREA_MEDICA con ID:",
   OLD.id),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_departamentos`
--

DROP TABLE IF EXISTS `tbc_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'DESCRIPCION: Atributo clave primaria autoincremental que identificara cada registro del DEPARTAMENTO\nNATURALEZA: Cuantitativo\nTIPO: Numérico\nDOMINIO: Número Enteros Positivos\nCOMPOSICION:  1{0-9}*\n',
  `Nombre` varchar(100) NOT NULL COMMENT 'DESCRIPCION: Denominación del DEPARTAMENTO (Unidad de Negocio)\nNATURALEZA: Cualitativo\nTIPO: Alfanumerico\nDOMINIO: Letras y Numeros \nCOMPOSICION: 1{a-Z| |0-9}100',
  `AreaMedica_ID` int unsigned DEFAULT NULL,
  `Departamento_Superior_ID` int unsigned DEFAULT NULL,
  `Responsable_ID` int unsigned DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_area_medica_1` (`AreaMedica_ID`),
  KEY `fk_departamento_1` (`Departamento_Superior_ID`),
  CONSTRAINT `fk_area_medica_1` FOREIGN KEY (`AreaMedica_ID`) REFERENCES `tbc_areas_medicas` (`ID`),
  CONSTRAINT `fk_departamento_1` FOREIGN KEY (`Departamento_Superior_ID`) REFERENCES `tbc_departamentos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla catalogo que almacenara la informacion de cada departamento del hospital, en base a su estructura organizacional.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_departamentos`
--

LOCK TABLES `tbc_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_departamentos` DISABLE KEYS */;
INSERT INTO `tbc_departamentos` VALUES (1,'Dirección General',NULL,NULL,NULL,_binary '','2024-01-24 00:15:10','2024-03-24 00:51:34'),(2,'Junta de Gobierno',NULL,1,NULL,_binary '','2024-01-24 00:15:12',NULL),(3,'Comités Hospitalarios',NULL,1,NULL,_binary '','2024-01-24 00:15:14',NULL),(4,'Comité de Transplante',NULL,1,NULL,_binary '','2024-01-24 00:15:14',NULL),(5,'Departamento de Calidad',NULL,1,NULL,_binary '','2024-01-24 00:15:14',NULL),(6,'Sub-Dirección Médica',NULL,1,NULL,_binary '','2024-01-24 00:15:14',NULL),(7,'Sub-Dirección Administrativa',NULL,1,NULL,_binary '','2024-01-24 00:15:14',NULL),(8,'Atención a Quejas',NULL,5,NULL,_binary '','2024-01-24 00:15:19',NULL),(9,'Seguridad del Paciente',NULL,5,NULL,_binary '','2024-01-24 00:15:19',NULL),(10,'Programación Quirúrgica',NULL,5,NULL,_binary '','2024-01-24 00:15:19',NULL),(11,'División de Medicina Interna',1,6,NULL,_binary '','2024-01-24 00:21:35',NULL),(12,'Terapia Intermedia',1,11,NULL,_binary '','2024-01-24 00:21:35',NULL),(13,'División de Pediatría',1,6,NULL,_binary '','2024-01-24 00:21:35',NULL),(14,'Servicio de Urgencias Pediátricas',1,13,NULL,_binary '','2024-01-24 00:21:35',NULL),(15,'Servicio de Traumatología',1,6,NULL,_binary '','2024-01-24 00:25:44',NULL),(16,'División de Cirugía',1,6,NULL,_binary '','2024-01-24 00:25:44',NULL),(17,'Servicio de Urgencias Adultos',1,6,NULL,_binary '','2024-01-24 00:25:44',NULL),(18,'Terapia Intensiva',1,6,NULL,_binary '','2024-01-24 00:25:44',NULL),(19,'Quirófano y Anestesiología',1,6,NULL,_binary '','2024-01-24 00:25:44',NULL),(20,'Centro de Mezclas',2,6,NULL,_binary '','2024-02-06 10:23:28',NULL),(21,'Radiología e Imagen',2,6,NULL,_binary '','2024-02-06 10:23:30',NULL),(22,'Genética',2,6,NULL,_binary '','2024-02-06 10:23:31',NULL),(23,'Laboratorio de Análisis Clínicos',2,6,NULL,_binary '','2024-02-06 10:23:32',NULL),(24,'Laboratorio de Histocompatibilidad',2,23,NULL,_binary '','2024-02-06 10:23:32',NULL),(25,'Hemodialisis',2,6,NULL,_binary '','2024-02-06 10:23:33',NULL),(26,'Laboratorio de Patología',2,6,NULL,_binary '','2024-02-06 20:23:00',NULL),(27,'Rehabilitación Pulmonar',2,6,NULL,_binary '','2024-02-06 20:23:00',NULL),(28,'Medicina Genómica',2,6,NULL,_binary '','2024-02-06 20:23:00',NULL),(29,'Banco de Sangre',2,6,NULL,_binary '','2024-02-06 20:23:00',NULL),(30,'Aféresis',2,29,NULL,_binary '','2024-02-06 20:23:00',NULL),(31,'Tele-Robótica',NULL,6,NULL,_binary '','2024-02-06 20:24:15',NULL),(32,'Jefatura de Enseñanza Médica',NULL,6,NULL,_binary '','2024-02-06 20:24:15',NULL),(33,'Ética e Investigación',NULL,6,NULL,_binary '','2024-02-06 20:24:15',NULL),(34,'Medicinal Legal',NULL,NULL,NULL,_binary '','2024-02-06 20:59:37',NULL),(35,'Violencia Intrafamiliar',3,34,NULL,_binary '','2024-02-06 20:59:37',NULL),(36,'Trabajo Social',3,6,NULL,_binary '','2024-02-06 20:59:37',NULL),(37,'Unidad de Vigilancia Epidemiológica Hospitalaria',3,6,NULL,_binary '','2024-02-06 20:59:37',NULL),(38,'Centro de Investigación de Estudios de la Salud',3,6,NULL,_binary '','2024-02-06 20:59:37',NULL),(39,'Comunicación Social',3,6,NULL,_binary '','2024-02-06 20:59:37',NULL),(40,'Consulta Externa',NULL,6,NULL,_binary '','2024-02-06 21:00:25',NULL),(41,'Terapia y Rehabilitación Física',NULL,40,NULL,_binary '','2024-02-06 21:00:25',NULL),(42,'Jefatura de Enfermería',4,6,NULL,_binary '','2024-02-06 21:55:48',NULL),(43,'Subjefatura de Enfermeras',4,42,NULL,_binary '','2024-02-06 21:55:48',NULL),(44,'Coordinación Enseñanza Enfermería',4,42,NULL,_binary '','2024-02-06 21:55:48',NULL),(45,'Supervisoras de Turno',4,43,NULL,_binary '','2024-02-06 21:55:48',NULL),(46,'Jefas de Servicio',4,45,NULL,_binary '','2024-02-06 21:55:48',NULL),(47,'Clínicas y Programas',4,45,NULL,_binary '','2024-02-06 21:55:48',NULL),(48,'Recursos Humanos',5,7,NULL,_binary '','2024-02-06 21:57:55',NULL),(49,'Archivo y Correspondencia',5,48,NULL,_binary '','2024-02-06 21:57:55',NULL),(50,'Dietética',5,7,NULL,_binary '','2024-02-06 21:57:55',NULL),(51,'Farmacia Intrahospitalaria',5,7,NULL,_binary '','2024-02-06 21:57:55',NULL),(52,'Coordinación de Asuntos Jurídicos y Administrativos',5,7,NULL,_binary '','2024-02-06 21:57:55',NULL),(53,'Vigilancia',5,52,NULL,_binary '','2024-02-06 21:57:55',NULL),(54,'Biomédica Conservación y Mantenimiento',5,7,NULL,_binary '','2024-02-06 22:04:44',NULL),(55,'Validación ',5,7,NULL,_binary '','2024-02-06 22:04:44',NULL),(56,'Recursos Materiales',5,7,NULL,_binary '','2024-02-06 22:04:44',NULL),(57,'Almacén',5,56,NULL,_binary '','2024-02-06 22:04:44',NULL),(58,'Insumos Especializados',5,56,NULL,_binary '','2024-02-06 22:04:44',NULL),(59,'Servicios Generales',5,7,NULL,_binary '','2024-02-06 22:04:44',NULL),(60,'Intendencia',5,59,NULL,_binary '','2024-02-06 22:04:44',NULL),(61,'Ropería',5,59,NULL,_binary '','2024-02-06 22:04:44',NULL),(62,'Recursos Financieros',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(63,'Departamento Administrativo Hemodinamia',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(64,'Relaciones Públicas',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(65,'Nivel 7',5,64,NULL,_binary '\0','2024-02-13 10:38:19','2024-02-13 10:52:46'),(66,'Farmacia del Seguro Popular',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(67,'Enlace Administrativo',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(68,'Control de Gastos Catastróficos',5,67,NULL,_binary '','2024-02-13 10:38:19',NULL),(69,'Informática',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL),(70,'Tecnología en la Salud',5,69,NULL,_binary '','2024-02-13 10:38:19',NULL),(71,'Registros Médicos',5,7,NULL,_binary '','2024-02-13 10:38:19',NULL);
/*!40000 ALTER TABLE `tbc_departamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_departamentos_after_insert` AFTER INSERT ON `tbc_departamentos` FOR EACH ROW BEGIN
   DECLARE nombre_aream VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus VARCHAR(50) DEFAULT NULL;
   
   SET nombre_aream = (SELECT IFNULL((SELECT Nombre FROM tbc_areas_medicas WHERE id = NEW.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto = (SELECT IFNULL((SELECT Nombre FROM tbc_departamentos WHERE id = NEW.Departamento_Superior_ID), "Sin Departamento Superior"));
   /*SET nombre_resp = (SELECT IFNULL((SELECT p.Nombre FROM tbc_personal_medico pm 
   JOIN personas p ON p.id = p.id WHERE pm.persona_id = NEW.Responsable_ID), "Sin Responsable"));
   */
   
   IF NEW.estatus THEN
		SET val_estatus = "Activo";
   ELSE
        SET val_estatus = "Inactivo";
	END IF;
   
INSERT INTO tbi_bitacora VALUES (
   DEFAULT, "tbc_departamentos", user(), 
   "Insert",
   CONCAT_WS(" ","Se ha agregado un nuevo DEPARTAMENTO con el ID:", NEW.id,",",
   "con los siguientes datos; NOMBRE:", NEW.nombre,",",
   "AREA_MEDICA:", nombre_aream,",",
   "DEPARTAMENTO_SUPERIOR:", nombre_depto,",",
   "RESPONSABLE:", nombre_resp,",",
   "ESTATUS:", val_estatus), 
   now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_departamentos_before_update` BEFORE UPDATE ON `tbc_departamentos` FOR EACH ROW BEGIN
    SET NEW.Fecha_Actualizacion = current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_departamentos_after_update` AFTER UPDATE ON `tbc_departamentos` FOR EACH ROW BEGIN
   DECLARE nombre_aream VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus VARCHAR(50) DEFAULT NULL;
   DECLARE nombre_aream2 VARCHAR(150) DEFAULT NULL;
   DECLARE nombre_depto2 VARCHAR(100) DEFAULT NULL;
   DECLARE nombre_resp2 VARCHAR(50) DEFAULT NULL;
   DECLARE val_estatus2 VARCHAR(50) DEFAULT NULL;
   
   
   SET nombre_aream = (SELECT IFNULL((SELECT Nombre FROM tbc_areas_medicas WHERE id = NEW.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto = (SELECT IFNULL((SELECT Nombre FROM tbc_departamentos WHERE id = NEW.Departamento_Superior_ID), "Sin Departamento Superior"));
   /*SET nombre_resp = (SELECT IFNULL((SELECT CONCAT_Ws(" ", p.titulo, p.Nombre, p.primer_apellido, p.segundo_apellido) FROM personal_medico pe JOIN personas p ON p.id = pe.persona_id WHERE id = NEW.Responsable_ID), "Sin Responsable"));*/
   
   SET nombre_aream2= (SELECT IFNULL((SELECT Nombre FROM tbc_areas_medicas WHERE id = OLD.AreaMedica_ID), "Sin Área Médica"));
   SET nombre_depto2 = (SELECT IFNULL((SELECT Nombre FROM tbc_departamentos WHERE id = OLD.Departamento_Superior_ID), "Sin Departamento Superior"));
   /*   SET nombre_resp2 = (SELECT IFNULL((SELECT CONCAT_Ws(" ", p.titulo, p.Nombre, p.primer_apellido, p.segundo_apellido) FROM personal_medico pe JOIN personas p ON p.id = pe.persona_id WHERE id = OLD.Responsable_ID), "Sin Responsable"));*/
   
   IF NEW.estatus THEN
		SET val_estatus = "Activo";
   ELSE
        SET val_estatus = "Inactivo";
	END IF;
    
    IF OLD.estatus THEN
		SET val_estatus2 = "Activo";
   ELSE
        SET val_estatus2 = "Inactivo";
	END IF;
   
   
INSERT INTO tbi_bitacora VALUES (
   DEFAULT, "departamentos", user(), 
   "Update",
   CONCAT_WS(" ","Se ha modificado el  DEPARTAMENTO con el ID:", NEW.id,",",
   "con los siguientes datos; NOMBRE:", OLD.nombre," - ",  NEW.nombre ,",",
   "AREA_MEDICA:", nombre_aream2," - ", nombre_aream, ",",
   "DEPARTAMENTO_SUPERIOR:", nombre_depto2," - ", nombre_depto ,",",
   "RESPONSABLE:", nombre_resp2," - ", nombre_resp,",",
   "ESTATUS:", val_estatus2," - ", val_estatus), 
   now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Prof.Marco`@`%`*/ /*!50003 TRIGGER `tr_departamentos_after_delete` AFTER DELETE ON `tbc_departamentos` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES (
	DEFAULT, "tbc_departamentos", user(), 
   "Delete",
   CONCAT_WS(" ","Se eliminado los datos del DEPARTAMENTO con ID:",
   OLD.id),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 1 , con los siguientes datos; NOMBRE: Servicios Médicos , DESCRIPCION: Por definir , ESTATUS: ','2024-03-23 22:53:42'),(2,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 2 , con los siguientes datos; NOMBRE: Servicios de Apoyo , DESCRIPCION: Por definir , ESTATUS: ','2024-03-23 22:53:42'),(3,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 3 , con los siguientes datos; NOMBRE: Servicios Médico - Administrativos , DESCRIPCION: Por definir , ESTATUS: ','2024-03-23 22:53:42'),(4,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 4 , con los siguientes datos; NOMBRE: Servicios de Enfermería , DESCRIPCION: Por definir , ESTATUS: ','2024-03-23 22:53:42'),(5,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 5 , con los siguientes datos; NOMBRE: Departamentos Administrativos , DESCRIPCION: Por definir , ESTATUS: ','2024-03-23 22:53:42'),(6,'tbc_areas_medicas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva AREA_MEDICA con el ID: 7 , con los siguientes datos; NOMBRE: Servicios de Gobierno , DESCRIPCION: Por definir , ESTATUS: \0','2024-03-23 22:53:42'),(7,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 1 , con los siguientes datos; NOMBRE: Dirección General , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sin Departamento Superior , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(8,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 2 , con los siguientes datos; NOMBRE: Junta de Gobierno , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(9,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 3 , con los siguientes datos; NOMBRE: Comités Hospitalarios , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(10,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 4 , con los siguientes datos; NOMBRE: Comité de Transplante , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(11,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 5 , con los siguientes datos; NOMBRE: Departamento de Calidad , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(12,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 6 , con los siguientes datos; NOMBRE: Sub-Dirección Médica , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(13,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 7 , con los siguientes datos; NOMBRE: Sub-Dirección Administrativa , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Dirección General , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(14,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 8 , con los siguientes datos; NOMBRE: Atención a Quejas , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Departamento de Calidad , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(15,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 9 , con los siguientes datos; NOMBRE: Seguridad del Paciente , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Departamento de Calidad , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(16,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 10 , con los siguientes datos; NOMBRE: Programación Quirúrgica , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Departamento de Calidad , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(17,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 11 , con los siguientes datos; NOMBRE: División de Medicina Interna , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(18,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 12 , con los siguientes datos; NOMBRE: Terapia Intermedia , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: División de Medicina Interna , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(19,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 13 , con los siguientes datos; NOMBRE: División de Pediatría , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(20,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 14 , con los siguientes datos; NOMBRE: Servicio de Urgencias Pediátricas , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: División de Pediatría , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(21,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 15 , con los siguientes datos; NOMBRE: Servicio de Traumatología , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(22,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 16 , con los siguientes datos; NOMBRE: División de Cirugía , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(23,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 17 , con los siguientes datos; NOMBRE: Servicio de Urgencias Adultos , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(24,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 18 , con los siguientes datos; NOMBRE: Terapia Intensiva , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(25,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 19 , con los siguientes datos; NOMBRE: Quirófano y Anestesiología , AREA_MEDICA: Servicios Médicos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(26,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 20 , con los siguientes datos; NOMBRE: Centro de Mezclas , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(27,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 21 , con los siguientes datos; NOMBRE: Radiología e Imagen , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(28,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 22 , con los siguientes datos; NOMBRE: Genética , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(29,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 23 , con los siguientes datos; NOMBRE: Laboratorio de Análisis Clínicos , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(30,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 24 , con los siguientes datos; NOMBRE: Laboratorio de Histocompatibilidad , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Laboratorio de Análisis Clínicos , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(31,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 25 , con los siguientes datos; NOMBRE: Hemodialisis , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(32,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 26 , con los siguientes datos; NOMBRE: Laboratorio de Patología , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(33,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 27 , con los siguientes datos; NOMBRE: Rehabilitación Pulmonar , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(34,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 28 , con los siguientes datos; NOMBRE: Medicina Genómica , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(35,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 29 , con los siguientes datos; NOMBRE: Banco de Sangre , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(36,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 30 , con los siguientes datos; NOMBRE: Aféresis , AREA_MEDICA: Servicios de Apoyo , DEPARTAMENTO_SUPERIOR: Banco de Sangre , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(37,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 31 , con los siguientes datos; NOMBRE: Tele-Robótica , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(38,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 32 , con los siguientes datos; NOMBRE: Jefatura de Enseñanza Médica , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(39,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 33 , con los siguientes datos; NOMBRE: Ética e Investigación , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(40,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 34 , con los siguientes datos; NOMBRE: Medicinal Legal , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sin Departamento Superior , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(41,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 35 , con los siguientes datos; NOMBRE: Violencia Intrafamiliar , AREA_MEDICA: Servicios Médico - Administrativos , DEPARTAMENTO_SUPERIOR: Medicinal Legal , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(42,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 36 , con los siguientes datos; NOMBRE: Trabajo Social , AREA_MEDICA: Servicios Médico - Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(43,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 37 , con los siguientes datos; NOMBRE: Unidad de Vigilancia Epidemiológica Hospitalaria , AREA_MEDICA: Servicios Médico - Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(44,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 38 , con los siguientes datos; NOMBRE: Centro de Investigación de Estudios de la Salud , AREA_MEDICA: Servicios Médico - Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(45,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 39 , con los siguientes datos; NOMBRE: Comunicación Social , AREA_MEDICA: Servicios Médico - Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(46,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 40 , con los siguientes datos; NOMBRE: Consulta Externa , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(47,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 41 , con los siguientes datos; NOMBRE: Terapia y Rehabilitación Física , AREA_MEDICA: Sin Área Médica , DEPARTAMENTO_SUPERIOR: Consulta Externa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(48,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 42 , con los siguientes datos; NOMBRE: Jefatura de Enfermería , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Sub-Dirección Médica , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(49,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 43 , con los siguientes datos; NOMBRE: Subjefatura de Enfermeras , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Jefatura de Enfermería , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(50,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 44 , con los siguientes datos; NOMBRE: Coordinación Enseñanza Enfermería , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Jefatura de Enfermería , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(51,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 45 , con los siguientes datos; NOMBRE: Supervisoras de Turno , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Subjefatura de Enfermeras , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(52,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 46 , con los siguientes datos; NOMBRE: Jefas de Servicio , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Supervisoras de Turno , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(53,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 47 , con los siguientes datos; NOMBRE: Clínicas y Programas , AREA_MEDICA: Servicios de Enfermería , DEPARTAMENTO_SUPERIOR: Supervisoras de Turno , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(54,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 48 , con los siguientes datos; NOMBRE: Recursos Humanos , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(55,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 49 , con los siguientes datos; NOMBRE: Archivo y Correspondencia , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Recursos Humanos , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(56,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 50 , con los siguientes datos; NOMBRE: Dietética , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(57,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 51 , con los siguientes datos; NOMBRE: Farmacia Intrahospitalaria , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(58,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 52 , con los siguientes datos; NOMBRE: Coordinación de Asuntos Jurídicos y Administrativos , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(59,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 53 , con los siguientes datos; NOMBRE: Vigilancia , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Coordinación de Asuntos Jurídicos y Administrativos , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(60,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 54 , con los siguientes datos; NOMBRE: Biomédica Conservación y Mantenimiento , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(61,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 55 , con los siguientes datos; NOMBRE: Validación  , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(62,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 56 , con los siguientes datos; NOMBRE: Recursos Materiales , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(63,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 57 , con los siguientes datos; NOMBRE: Almacén , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Recursos Materiales , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(64,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 58 , con los siguientes datos; NOMBRE: Insumos Especializados , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Recursos Materiales , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(65,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 59 , con los siguientes datos; NOMBRE: Servicios Generales , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(66,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 60 , con los siguientes datos; NOMBRE: Intendencia , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Servicios Generales , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(67,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 61 , con los siguientes datos; NOMBRE: Ropería , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Servicios Generales , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(68,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 62 , con los siguientes datos; NOMBRE: Recursos Financieros , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(69,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 63 , con los siguientes datos; NOMBRE: Departamento Administrativo Hemodinamia , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(70,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 64 , con los siguientes datos; NOMBRE: Relaciones Públicas , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(71,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 65 , con los siguientes datos; NOMBRE: Nivel 7 , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Relaciones Públicas , RESPONSABLE: , ESTATUS: Inactivo','2024-03-24 00:54:21'),(72,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 66 , con los siguientes datos; NOMBRE: Farmacia del Seguro Popular , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(73,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 67 , con los siguientes datos; NOMBRE: Enlace Administrativo , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(74,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 68 , con los siguientes datos; NOMBRE: Control de Gastos Catastróficos , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Enlace Administrativo , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(75,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 69 , con los siguientes datos; NOMBRE: Informática , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(76,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 70 , con los siguientes datos; NOMBRE: Tecnología en la Salud , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Informática , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(77,'tbc_departamentos','Prof.Marco@189.134.254.216','Insert','Se ha agregado un nuevo DEPARTAMENTO con el ID: 71 , con los siguientes datos; NOMBRE: Registros Médicos , AREA_MEDICA: Departamentos Administrativos , DEPARTAMENTO_SUPERIOR: Sub-Dirección Administrativa , RESPONSABLE: , ESTATUS: Activo','2024-03-24 00:54:21'),(78,'tbb_personas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva PERSONA con el ID:  1 , Nombre:  Fabiola Refugio Padilla Velazquez , Titulo:  , Primer Apellido:  Padilla , Segundo Apellido:  Velazquez , CURP:  PAVF741231MSPDLB00 , Genero:  F , Grupo Sanguineo:  O , Tipo Sanguineo:  + , Fecha de Nacimiento:  1974-12-31 , Estatus:  ','2024-03-24 20:48:10'),(79,'tbb_personas','Prof.Marco@189.134.254.216','Update','Se ha actualizado los datos de la PERSONA con el ID:  1 , Nombre Antiguo:  Fabiola Refugio Padilla Velazquez , Nombre Nuevo:  Fabiola Refugio Padilla Velazquez , Titulo:  Dra. , Primer Apellido:  Padilla , Segundo Apellido:  Velazquez , CURP:  PAVF741231MSPDLB00 , Genero:  F , Grupo Sanguineo:  O , Tipo Sanguineo:  + , Fecha de Nacimiento:  1974-12-31 , Estatus:  ','2024-03-24 20:48:10'),(80,'tbb_personas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva PERSONA con el ID:  2 , Nombre:  Vicente Sampayo Pacheco , Titulo:  , Primer Apellido:  Sampayo , Segundo Apellido:  Pacheco , CURP:  SAPV770801HGTMCC00 , Genero:  M , Grupo Sanguineo:  O , Tipo Sanguineo:  + , Fecha de Nacimiento:  1977-08-01 , Estatus:  ','2024-03-24 20:48:10'),(81,'tbb_personas','Prof.Marco@189.134.254.216','Update','Se ha actualizado los datos de la PERSONA con el ID:  2 , Nombre Antiguo:  Vicente Sampayo Pacheco , Nombre Nuevo:  Vicente Sampayo Pacheco , Titulo:  , Primer Apellido:  Sampayo , Segundo Apellido:  Pacheco , CURP:  SAPV770801HGTMCC00 , Genero:  M , Grupo Sanguineo:  O , Tipo Sanguineo:  + , Fecha de Nacimiento:  1977-08-01 , Estatus:  ','2024-03-24 20:48:10'),(82,'tbb_personas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva PERSONA con el ID:  3 , Nombre:  Claudio Lenin Muñoz Peña , Titulo:  , Primer Apellido:  Muñoz , Segundo Apellido:  Peña , CURP:  MUPC760226HSRNNL00 , Genero:  M , Grupo Sanguineo:  A , Tipo Sanguineo:  + , Fecha de Nacimiento:  1976-02-26 , Estatus:  ','2024-03-24 20:48:10'),(83,'tbb_personas','Prof.Marco@189.134.254.216','Update','Se ha actualizado los datos de la PERSONA con el ID:  3 , Nombre Antiguo:  Claudio Lenin Muñoz Peña , Nombre Nuevo:  Claudio Lenin Muñoz Peña , Titulo:  , Primer Apellido:  Muñoz , Segundo Apellido:  Peña , CURP:  MUPC760226HSRNNL00 , Genero:  M , Grupo Sanguineo:  A , Tipo Sanguineo:  + , Fecha de Nacimiento:  1976-02-26 , Estatus:  ','2024-03-24 20:48:10'),(84,'tbb_personas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva PERSONA con el ID:  4 , Nombre:  Iris Edith Valdéz Juárez , Titulo:  , Primer Apellido:  Valdéz , Segundo Apellido:  Juárez , CURP:  VAJI790519MSRLRR00 , Genero:  F , Grupo Sanguineo:  A , Tipo Sanguineo:  + , Fecha de Nacimiento:  1979-05-19 , Estatus:  ','2024-03-24 20:48:10'),(85,'tbb_personas','Prof.Marco@189.134.254.216','Update','Se ha actualizado los datos de la PERSONA con el ID:  4 , Nombre Antiguo:  Iris Edith Valdéz Juárez , Nombre Nuevo:  Iris Edith Valdéz Juárez , Titulo:  , Primer Apellido:  Valdéz , Segundo Apellido:  Juárez , CURP:  VAJI790519MSRLRR00 , Genero:  F , Grupo Sanguineo:  A , Tipo Sanguineo:  + , Fecha de Nacimiento:  1979-05-19 , Estatus:  ','2024-03-24 20:48:10'),(86,'tbb_personas','Prof.Marco@189.134.254.216','Insert','Se ha agregado una nueva PERSONA con el ID:  5 , Nombre:  Nora Concepción Alvarado Rosas , Titulo:  , Primer Apellido:  Alvarado , Segundo Apellido:  Rosas , CURP:  AARN731228MCCLSR00 , Genero:  F , Grupo Sanguineo:  AB , Tipo Sanguineo:  + , Fecha de Nacimiento:  1973-12-28 , Estatus:  ','2024-03-24 20:48:10'),(87,'tbb_personas','Prof.Marco@189.134.254.216','Update','Se ha actualizado los datos de la PERSONA con el ID:  5 , Nombre Antiguo:  Nora Concepción Alvarado Rosas , Nombre Nuevo:  Nora Concepción Alvarado Rosas , Titulo:  , Primer Apellido:  Alvarado , Segundo Apellido:  Rosas , CURP:  AARN731228MCCLSR00 , Genero:  F , Grupo Sanguineo:  AB , Tipo Sanguineo:  + , Fecha de Nacimiento:  1973-12-28 , Estatus:  ','2024-03-24 20:48:10');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital_general_8a_idgs'
--

--
-- Dumping routines for database 'hospital_general_8a_idgs'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_bandera_porcentaje`(v_porcentaje INT) RETURNS int
    DETERMINISTIC
BEGIN
   /* Declaración de una variable con un valor aleatorio de entre 0 y 100*/
   DECLARE v_valor INT DEFAULT (fn_numero_aleatorio_rangos(0,100));
   /* Declaración de una variable booleana con valor inicial de falso */
   DECLARE v_bandera BOOLEAN DEFAULT false;
   
   IF v_valor <= v_porcentaje THEN 
      SET v_bandera = true;
   END IF;
   RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcula_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_calcula_edad`(v_fecha_nacimiento DATE) RETURNS int
    DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR, v_fecha_nacimiento, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcula_edad_especifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_calcula_edad_especifica`(fecha_nacimiento DATE) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE fecha_actual DATE;
    DECLARE anios INT;
    DECLARE meses INT;
    DECLARE semanas INT;
    DECLARE dias INT;
    DECLARE edad VARCHAR(200);

    -- Obtenemos la fecha actual
    SET fecha_actual = CURDATE();

    -- Calculamos la diferencia en años, meses, semanas y días
    SET anios = TIMESTAMPDIFF(YEAR, fecha_nacimiento, fecha_actual);
    SET meses = TIMESTAMPDIFF(MONTH, fecha_nacimiento, fecha_actual) - (12 * anios);
    SET dias = DATEDIFF(fecha_actual, DATE_ADD(fecha_nacimiento, INTERVAL anios YEAR) + INTERVAL meses MONTH);
    SET semanas = dias / 7;
    SET dias = dias % 7;

    -- Construimos el mensaje de la edad
    SET edad = CONCAT_WS(" ",anios, 'años, ', meses, 'meses, ', semanas, 'semanas y ', dias, 'días');

	RETURN edad;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcula_edad_fecha_especifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_calcula_edad_fecha_especifica`(v_fecha_nacimiento DATE, v_fechareferencia DATE) RETURNS int
    DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR, v_fecha_nacimiento,v_fechareferencia);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_elimina_acentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_elimina_acentos`(textvalue varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin
set @textvalue = textvalue;
set @withaccents = 'ŠšŽžÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖØÙÚÛÜÝŸÞàáâãäåæçèéêëìíîïñòóôõöøùúûüýÿþƒ';
set @withoutaccents = 'SsZzAAAAAAACEEEEIIIINOOOOOOUUUUYYBaaaaaaaceeeeiiiinoooooouuuuyybf';
set @count = length(@withaccents);
while @count > 0 do
    set @textvalue = replace(@textvalue, substring(@withaccents, @count, 1), substring(@withoutaccents, @count, 1));
    set @count = @count - 1;
end while;
set @special = '!@#$%¨&*()_+=§¹²³£¢¬"`´{[^~}]<,>.:;?/°ºª+*|\\''';
set @count = length(@special);
while @count > 0 do
    set @textvalue = replace(@textvalue, substring(@special, @count, 1), '');
    set @count = @count - 1;
end while;
return @textvalue;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_fechahora_aleatoria_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_fechahora_aleatoria_rangos`( fechaInicio DATE, fechaFin DATE, horaInicio TIME, horaFin TIME) RETURNS datetime
    DETERMINISTIC
BEGIN
    DECLARE fechaAleatoria DATE;
    DECLARE horaEntrada TIME;
    DECLARE horaSalida TIME;
    DECLARE horaRegistro TIME;
    DECLARE fechaHoraGenerada DATETIME;
    
   -- Generar fecha aleatoria dentro del rango dado
    SET fechaAleatoria = DATE_ADD(fechaInicio, INTERVAL FLOOR(RAND() * (DATEDIFF(fechaFin, fechaInicio) + 1)) DAY);

    -- Generar hora de registro aleatoria dentro del rango de hora de entrada y salida
    SET horaRegistro = ADDTIME(horaInicio, SEC_TO_TIME(FLOOR(RAND() * TIME_TO_SEC(TIMEDIFF(horaFin, horaInicio)))));
    
    SET fechaHoraGenerada = CONCAT(fechaAleatoria," ",horaRegistro);
  
RETURN fechaHoraGenerada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_apellido`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_apellido_generado VARCHAR(50) DEFAULT NULL;
    SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100), 
			"Álvarez","Briones","Cruz","Díaz","Estrada", "Fuentes","Gayosso","Hernández","Ibarra","Jiménez",
			"Kuno","López","Martínez","Ortíz","Paredes", "Quiróz","Ramírez","Sampayo","Téllez","Urbina",
			"Vargas","Wurtz","Ximénez","Yañez","Zapata", "García","González","Pérez","Rodríguez","Sánchez",
            "Romero","Gómez","Flores","Morales","Vázquez", "Reyes","Torres","Gutiérrez","Ruíz","Mendoza",
            "Aguilar","Moreno","Castillo","Méndez","Chávez", "Rivera","Juárez","Ramos","Domínguez","Herrera",
            "Medina","Castro","Vargas","Guzmán","Velazquez", "Muñoz","Rojas","de la Cruz","Contreras","Salazar",
            "Luna","Ortega","Santiago","Guerrero","Bautista", "Cortés","Soto","Alvarado","Espinoza","Lara",
            "Ávila","Ríos","Cervantes","Silva","Delgado", "Vega","Márquez","Sandoval","Carrillo","León",
            "Mejía","Solís","Rosas","Valdéz","Nuñez", "Campos","Santos","Camacho","Navarro","Peña",
            "Maldonado","Rosales","Acosta","Miranda","Trejo", "Valencia","Nava","Pacheco","Huerta","Padilla");
            
    
RETURN v_apellido_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_cedula_profesional` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_cedula_profesional`() RETURNS int
    DETERMINISTIC
BEGIN
       DECLARE v_cedula_generada INT(8) DEFAULT 0;
       DECLARE v_bandera_cedula_valida BOOLEAN DEFAULT FALSE;
       
       WHILE NOT v_bandera_cedula_valida DO 
			SET v_cedula_generada = fn_numero_aleatorio_rangos(1,99999999);
            IF (SELECT COUNT(*) FROM tbb_personal_medico WHERE cedula_profesional = v_cedula_generada) = 0 THEN
				SET v_bandera_cedula_valida = TRUE;
            END IF;
       END WHILE;
RETURN v_cedula_generada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_curp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_curp`(v_nombre VARCHAR(60), v_primer_apellido VARCHAR(45) ,v_segundo_apellido VARCHAR(45), 
															v_fecha_nacimiento DATE, v_genero CHAR(1), v_entidad_federativa VARCHAR(45)) RETURNS char(18) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
     DECLARE v_curp CHAR(18) DEFAULT NULL;
     DECLARE v_sexo CHAR(1) DEFAULT NULL;
     DECLARE v_efn  CHAR(2) DEFAULT NULL;  /*Entidad Federativa de Nacimiento*/
     DECLARE v_dv   CHAR(2) DEFAULT NULL;  /* Dígito Verificador */
     IF v_genero = "M" THEN 
        SET v_sexo = "H";
	 ELSEIF v_genero = "F" THEN 
        SET v_sexo = "M";
	 END IF;
     SET v_nombre = fn_elimina_acentos(v_nombre);
     SET v_primer_apellido = fn_elimina_acentos(v_primer_apellido);
     SET v_segundo_apellido = fn_elimina_acentos(v_segundo_apellido);
     IF v_entidad_federativa = "Aguascalientes" THEN
	    SET v_efn = "AS";
	 ELSEIF v_entidad_federativa = "Baja California" THEN
		SET v_efn = "BC";
	 ELSEIF v_entidad_federativa = "Baja California Sur" THEN
		SET v_efn = "BS";
     ELSEIF v_entidad_federativa = "Campeche" THEN
		SET v_efn = "CC";
	 ELSEIF v_entidad_federativa = "Coahuila" THEN
		SET v_efn = "CL";
	 ELSEIF v_entidad_federativa = "Colima" THEN
		SET v_efn = "CM";
	 ELSEIF v_entidad_federativa = "Chiapas" THEN
		SET v_efn = "CS";
     ELSEIF v_entidad_federativa = "Chihuahua" THEN
		SET v_efn = "CH";
	 ELSEIF v_entidad_federativa = "Distrito Federal" THEN
		SET v_efn = "DF";
     ELSEIF v_entidad_federativa = "Durango" THEN
		SET v_efn = "DG";
	 ELSEIF v_entidad_federativa = "Guanajuato" THEN
		SET v_efn = "GT";
	 ELSEIF v_entidad_federativa = "Guerrero" THEN
		SET v_efn = "GR";
     ELSEIF v_entidad_federativa = "Hidalgo" THEN
		SET v_efn = "HG";
	 ELSEIF v_entidad_federativa = "Jalisco" THEN
		SET v_efn = "JC";
     ELSEIF v_entidad_federativa = "México" THEN
		SET v_efn = "MC";
	 ELSEIF v_entidad_federativa = "Michoacán" THEN
		SET v_efn = "MN";
	 ELSEIF v_entidad_federativa = "Morelos" THEN
		SET v_efn = "MS";
     ELSEIF v_entidad_federativa = "Nayarit" THEN
		SET v_efn = "NT";
	 ELSEIF v_entidad_federativa = "Nuevo León" THEN
		SET v_efn = "NL";
     ELSEIF v_entidad_federativa = "Oaxaca" THEN
		SET v_efn = "OC";
     ELSEIF v_entidad_federativa = "Puebla" THEN
		SET v_efn = "PL";
	 ELSEIF v_entidad_federativa = "Querétaro" THEN
		SET v_efn = "QT";
	 ELSEIF v_entidad_federativa = "Quintana Roo" THEN
		SET v_efn = "QR";
     ELSEIF v_entidad_federativa = "San Luis Potosí" THEN
		SET v_efn = "SP";
	 ELSEIF v_entidad_federativa = "Sinaloa" THEN
		SET v_efn = "SL";
     ELSEIF v_entidad_federativa = "Sonora" THEN
		SET v_efn = "SR";
     ELSEIF v_entidad_federativa = "Tabasco" THEN
		SET v_efn = "TC";
	 ELSEIF v_entidad_federativa = "Tamaulipas" THEN
		SET v_efn = "TS";
     ELSEIF v_entidad_federativa = "Tlaxcala" THEN
		SET v_efn = "TL";
	 ELSEIF v_entidad_federativa = "Veracruz" THEN
		SET v_efn = "VZ";
     ELSEIF v_entidad_federativa = "Yucatán" THEN
		SET v_efn = "YN";   
     ELSEIF v_entidad_federativa = "Zacatecas" THEN
		SET v_efn = "ZS";
     ELSEIF v_entidad_federativa = "Nacido en el Extranjero" THEN
		SET v_efn = "NE"; 
	 END IF;
     SET v_curp = CONCAT(UPPER(SUBSTR(v_primer_apellido,1,1)), fn_primer_vocalinterna(v_primer_apellido),
						 UPPER(SUBSTR(v_segundo_apellido,1,1)), UPPER(SUBSTR(v_nombre,1,1)), SUBSTR(year(v_fecha_nacimiento),3,2), 
                         LPAD(MONTH(v_fecha_nacimiento),2,'0'), LPAD(DAY(v_fecha_nacimiento),2,'0'), v_sexo, v_efn, 
                         fn_primer_consonanteinterna(v_primer_apellido), fn_primer_consonanteinterna(v_segundo_apellido), fn_primer_consonanteinterna(v_nombre));
     SET v_dv =  LPAD((SELECT COUNT(*) FROM tbb_personas WHERE curp like CONCAT(v_curp, "%")),2,'0');
     SET v_curp = CONCAT(v_curp, v_dv);
RETURN v_curp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_especialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_especialidad`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 DECLARE especialidad_generada VARCHAR(60) DEFAULT NULL;
 SET especialidad_generada  = ELT(FLOOR(1 + RAND() * 50), 
            "Alergología", "Anestesiología", "Cardiología", "Gastroenterología", "Endocrinología ", "Geriatría", "Hematología y Hemoterapia",
            "Hidrología Médica", "Infectología", "Medicina Aeroespacial", "Medicina del Deporte", "Medicina del Trabajo", "Medicina de Urgencias",
            "Medicina Familiar y Comunitaria", "Medicina Física y Rehabilitación", "Medicina Intensiva", "Medicina Interna", "Medicina Legal y Forense",
            "Medicina Preventiva y Salud Pública", "Nefrología", "Neumología", "Neurología", "Nutriología", "Odontología", "Oftalmología", "Oncología Médica",
            "Oncología Radioterápica","Otorrinolaringología", "Pediatría", "Proctología", "Psiquiatría", "Rehabilitación", "Reumatología", "Traumatología",
            "Toxicología", "Urología", "Cirugía Cardiovascular", "Cirugía General", "Cirugía Oral y Maxilofacial", "Cirugía Ortopédica","Traumatología",
            "Cirugía Pediátrica", "Cirugía Plástica, Estética y Reparadora", "Cirugía Torácica", "Neurocirugía", "Angiología y Cirugía Vascular", "Dermatología Médico-Quirúrgica y Venereología",
            "Estomatología", "Ginecología y Obstetricia", "Oftalmología", "Urología", "Análisis Clínicos", "Anatomía Patológica",
            "Bioquímica Clínica", "Farmacología Clínica", "Genética Médica", "Inmunología" , "Medicina Nuclear", "Microbiología y Parasitología", "Neurofisiología Clínica",
            "Radiología");
RETURN especialidad_generada ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_fecha_nacimiento`(fecha_inicio DATE, fecha_fin DATE) RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET min_dias = DATEDIFF(fecha_inicio, '1900-01-01');
    SET max_dias = DATEDIFF(fecha_fin, '1900-01-01');
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);
    SET fecha_aleatoria = DATE_ADD('1900-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_nombre`(v_genero CHAR(1)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(50) DEFAULT NULL;
    DECLARE v_nombre2_generado VARCHAR(50) DEFAULT NULL;    

    DECLARE v_bandera_nombrecompuesto BOOLEAN DEFAULT (fn_bandera_porcentaje(35));
    
   	SET v_nombre_generado = fn_genera_nombre_simple(v_genero);
    
    IF v_bandera_nombrecompuesto THEN 
		WHILE v_nombre2_generado IS NULL OR v_nombre2_generado = v_nombre_generado DO
             SET v_nombre2_generado = fn_genera_nombre_simple(v_genero);
        END WHILE;
        SET v_nombre_generado = CONCAT(v_nombre_generado," ", v_nombre2_generado);
	END IF;
    
    RETURN v_nombre_generado;
RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_nombre_simple`(v_genero CHAR(1)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_nombre_generado VARCHAR(60) DEFAULT NULL;
    IF v_genero = 'M' THEN 
		SET v_nombre_generado = ELT( fn_numero_aleatorio_rangos(1,255), "Aarón", "Abel", "Abelardo", "Abraham", "Adalberto",
		"Adán", "Adolfo","Adrián","Agustín","Alán", "Alberto","Aldo","Alejandro","Alfonso","Alfredo",
        "Alonso","Álvaro","Amado","Andrés","Ángel","Anselmo","Antonio","Apolinar","Ariel","Aristeo",
        "Armando", "Arnoldo","Arnulfo","Artemio","Arturo","Augusto", "Aureliano", "Aurelio", "Baltazar","Benito",
        "Benjamin","Bernabe","Bernardino","Bernardo","Candelario","Candido","Carlos", "Carmelo", "Cecilio", "César",
        "Christian","Cirilo","Claudio","Clemente","Concepción","Constantino","Cristian","Cristobal", "Cruz","Cuauhtémoc",
        "Dagoberto", "Damián","Daniel","Dario","David","Delfino","Demetrio","Diego","Domingo","Edgar",
        "Edgardo","Edmundo","Eduardo","Edwin","Efrain","Efrén","Eleazar","Elías","Eligio","Eliseo",
        "Eloy","Emiliano","Emilio","Emmanuel","Enrique","Erasmo","Eric","Erick","Erik","Ernesto",
        "Esteban","Eugenio","Eusebio","Evaristo","Everardo","Ezequiel","Fabián","Faustino","Fausto","Federico",
        "Feliciano","Felipe","Froylan", "Félix","Fermín","Fernando","Fidel","Filiberto","Florencio","Florentino",
        "Fortino","Francisco","Fredy","Gabino","Gabriel","Gamaliel","Genaro","Gerardo","Germán","Gilberto",
        "Gildardo","Gonzálo","Gregorio","Guadalupe","Guillermo","Gustavo","Héctor","Heriberto","Hernán","Hilario",
        "Hipólito","Homero","Horacio","Hugo","Humberto","Ignacio","Isaac","Irvin", "Isaías","Isidro",
        "Ismael","Israel","Ivan","Jacinto","Jacobo","Jaime","Javier","Jeronimo","Jesús","Joaquín",
        "Joel","Jonathan","Jorge","José","Jose María","Josué", "Juan","Juan de Dios","Julián","Julio",
        "Justino","Juventino","Lázaro","Lenin","Leobardo","Leonardo","Leonel","Leopoldo","Lorenzo","Luciano",
        "Lucio","Luis","Manuel","Matías","Marcelino","Marcelo","Marco","Marcos","Margarito","Tobías",
        "Mariano","Mario","Martín","Mateo","Mauricio","Mauro","Maximíno","Máximo","Miguel","Milton",
        "Misael","Modesto","Moisés","Nestor","Nicolás","Noé","Noel","Norberto","Octavio","Omar",
        "Orlando","Oscar","Osvaldo","Oswaldo","Pablo","Pascual","Patricio","Pedro","Porfirio","Rafael",
        "Ramiro","Ramón","Raúl","Raymundo","Refugio","René","Rey","Reyes","Reynaldo","Ricardo",
        "Rigoberto","Roberto","Rodolfo","Rodrigo","Rogelio","Roger","Rolando","Román","Rosalio","Rosario",
        "Rosendo","Rubén","Sabino","Salomón","Salvador","Samuel","Santiago","Santos","Saúl","Sebastián", 
        "Sergio","Silvestre","Simón","Teodoro","Tomás","Trinidad", "Ubaldo", "Ulises", "Uriel", "Valentin",
        "Vicente","Víctor","Virgilio","Vladimir","Wilbert","Zahid","Zacarías", "Yahir", "Yael", "Yoshua");
    ELSEIF v_genero= 'F' THEN 
        SET v_nombre_generado = ELT( fn_numero_aleatorio_rangos(1,255), "Abigail", "Adela", "Adriana", "Agustina", "Aida", 
        "Aide","Alba","Alejandra","Alejandrina","Alícia","Alma","Amalia","Amelia","América","Ampáro", 
        "Ana","Anabel","Andrea", "Anel","Angela", "Ángeles", "Angélica", "Angelina", "Antonia", "Antonieta", 
        "Araceli","Aracely", "Areli", "Arely", "Asunción","Aurelia", "Aurora","Azucena", "Beatríz", "Berenice", 
        "Bertha","Blanca","Brenda","Candelaria","Carmen","Carolina","Catalina", "Cecilia","Celia", "Clara",
        "Claudia","Concepción","Consuelo","Cristina","Cruz","Cynthia","Dalia","Dalila","Daniela","Delia",
        "Denisse","Diana","Dolores","Dora","Dulce","Edith","Edna","Elba","Elda","Elena",
        "Elia","Elisa","Elizabeth","Eloisa","Elsa","Elva","Elvia","Elvira","Emilia","Emma",
        "Enedina","Enriqueta","Erendira","Erika","Ernestina","Esmeralda","Esperanza","Estela","Esthela","Esther",
        "Eugenia","Eva","Evangelina","Evelia","Evelyn","Fabiola","Fatima","Fernanda","Flor","Francisca",
        "Gabriela","Genoveva","Georgina","Gisela","Gladys","Gloria","Graciela","Griselda","Guadalupe","Guillermina",
        "Herlinda","Hermelinda","Hilda","Hortencia","Idalia","Iliana","Iliria","Imelda","Inés","Irene",
        "Iris","Irma","Isabel","Isela","Itzel","Ivana","Ivette", "Ivonne","Janet","Janeth",
        "Jaqueline","Jazmín","Jessica","María José","Josefina", "Juana","Judith","Julia","Julieta","Karen",
        "Karina","Karla","Laura","Leonor","Leticia","Lidia","Lilia","Liliana","Lizbeth","Lizeth",
        "Lorena","Lourdes","Lucero","Lucia","Lucila","Lucina","Luisa","Luz","Magdalena","Manuela",
        "Marcela","Margarita","María","Mariana","Maribel","Maricela","Mariela","Marina","Marisela","Marisol",
        "Maritza","Marlene","Marta","Martha","Martina","Matilde","Mayra","Mercedes","Micaela","Minerva",
        "Mireya","Miriam","Mirna","Mónica","Monserrat","Nadia","Nallely","Nancy","Natalia","Natividad",
        "Nayeli","Nelly","Nidia","Noemí","Nohemi","Nora","Norma","Ofelia","Olga","Olivia",
        "Oralia","Paola","Patricia","Paula","Paulina","Perla","Petra","Pilar","Ramona","Raquel", 
        "Rebeca","Refugio","Reyna","Rita","Rocío","Rosa","Rosalba","Rosalia","Rosalinda","Rosario", 
        "Rosaura","Rubí","Ruth","Sandra","Santa","Sara","Selene","Silvia","Socorro","Sofía",
        "Soledad","Sonia","Susana","Tania","Tanya","Teresa","Teresita","Tomasa","Trinidad","Valeria",
        "Vanessa","Veronica", "Victoria", "Violeta", "Virginia","Viridiana", "Wendy","Xcaret","Xochitl","Xandra", 
        "Yadira", "Yanet", "Yazmín","Yesenia", "Yolanda","Zara","Zaira", "Zoila","Tamara","Ariel");
	END IF;
RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nss` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_genera_nss`() RETURNS varchar(15) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
       DECLARE v_nss_generado VARCHAR(15) DEFAULT '';
       DECLARE v_bandera_nss_valida BOOLEAN DEFAULT FALSE;
       DECLARE characters VARCHAR(100) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	   DECLARE i INT DEFAULT 1;
		
	   WHILE NOT v_bandera_nss_valida DO 
		WHILE i <= 15 DO
			SET v_nss_generado = CONCAT(v_nss_generado, SUBSTRING(characters, FLOOR(1 + RAND() * LENGTH(characters)), 1));
			SET i = i + 1;
		END WHILE;
           
		IF (SELECT COUNT(*) FROM tbb_pacientes WHERE nss = v_nss_generado) = 0 THEN
			SET v_bandera_nss_valida = TRUE;
        END IF;
       END WHILE;
RETURN v_nss_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE v_numero_generado INT 
     DEFAULT FLOOR(Rand()* (v_limite_superior-v_limite_inferior+1)+v_limite_inferior);
     SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_primer_consonante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_primer_consonante`(v_palabra VARCHAR(100)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
      DECLARE v_consonante CHAR(1) DEFAULT NULL; 
      DECLARE v_bandera BOOLEAN DEFAULT FALSE;
      DECLARE v_pos INT DEFAULT 1; 
      WHILE v_bandera = FALSE DO
            SET v_consonante = UPPER(substr(v_palabra, v_pos,1));
            IF v_consonante IN ('B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','W','X','Y','Z') THEN
            SET v_bandera = TRUE;
            ELSEIF v_pos = CHAR_LENGTH(v_palabra) THEN
            SET v_consonante = NULL;
            SET v_bandera = TRUE;
            ELSE
            SET v_pos = v_pos + 1;
            END IF;
      END WHILE;
RETURN v_consonante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_primer_consonanteinterna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` FUNCTION `fn_primer_consonanteinterna`(v_palabra VARCHAR(100)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
      DECLARE v_consonante CHAR(1) DEFAULT NULL; 
      DECLARE v_bandera BOOLEAN DEFAULT FALSE;
      DECLARE v_pos INT DEFAULT 1; 
      WHILE v_bandera = FALSE DO
            SET v_consonante = UPPER(substr(v_palabra, v_pos,1));
            IF v_consonante IN ('B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','W','X','Y','Z') AND v_pos > 1 THEN
            SET v_bandera = TRUE;
            ELSEIF v_pos = CHAR_LENGTH(v_palabra) THEN
            SET v_consonante = NULL;
            SET v_bandera = TRUE;
            ELSE
            SET v_pos = v_pos + 1;
            END IF;
      END WHILE;
RETURN v_consonante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_primer_vocalinterna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_primer_vocalinterna`(v_palabra VARCHAR(100)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
      DECLARE v_vocal CHAR(1) DEFAULT NULL; 
      DECLARE v_bandera BOOLEAN DEFAULT FALSE;
      DECLARE v_pos INT DEFAULT 1; 
      SET v_palabra = fn_elimina_acentos(v_palabra);
      WHILE v_bandera = FALSE DO
            SET v_vocal = UPPER(substr(v_palabra, v_pos,1));
            IF v_vocal IN ('A','E','I','O','U') AND v_pos > 1 THEN
            SET v_bandera = TRUE;
            ELSEIF v_pos = CHAR_LENGTH(v_palabra) THEN
            SET v_vocal = NULL;
            SET v_bandera = TRUE;
            ELSE
            SET v_pos = v_pos + 1;
            END IF;
      END WHILE;
RETURN v_vocal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_estatus_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` PROCEDURE `sp_estatus_bd`(v_password VARCHAR(20))
BEGIN  
	
    IF v_password = "xYz$123" THEN
	-- Subquery / Subconsultas
    
	(SELECT "TABLAS CATALOGO" as Tabla, "--------------------" as TotalRegistros, 
    "--------------" as TipoTabla, "--------------" as Jerarquia, "--------------" as UDN_Owner, "--------------"  as UDN_Editors,  "--------------" as UDN_Readers)
    UNION
    (SELECT "tbc_areas_medicas" as Tabla,   
    (SELECT COUNT(*) FROM  tbc_areas_medicas) as TotalRegistros, "Tabla Fuerte", "Genérica", "Dirección General", "-", "-")
    UNION
    (SELECT "tbc_departamentos" as Tabla, 
    (SELECT COUNT(*) FROM  tbc_departamentos) as TotalRegistros, "Tabla Débil" , "Genérica", "Dirección General", "-", "-")
    /*UNION
    (SELECT "medicamentos" as Tabla, 
    (SELECT COUNT(*) FROM  medicamentos) as TotalRegistros, "Tabla Fuerte")*/
	UNION
    (SELECT "TABLAS BASE" as Tabla, "--------------------" as TotalRegistros
    , "--------------" as TipoTabla, "--------------" as Jerarquia, "--------------" as UDN_Owner, "--------------"  as UDN_Editors,  "--------------" as UDN_Readers)
    UNION
    (SELECT "tbb_personas" as Tabla, 
    (SELECT COUNT(*) FROM  tbb_personas) as TotalRegistros, "Tabla Fuerte", "Super-Entidad", "Registros", "-", "-"  )
    UNION
    (SELECT "pacientes" as Tabla, 
    (SELECT COUNT(*) FROM  tbb_pacientes) as TotalRegistros, "Tabla Débil", "Sub-Entidad", "Registros", "-", "-"  )
    UNION
    (SELECT "personal_medico" as Tabla, 
    (SELECT COUNT(*) FROM  tbb_personal_medico) as TotalRegistros, "Tabla Débil", "Sub-Entidad", "Recursos Humanos", "-", "-" )
    /*UNION
    (SELECT "receta_medica" as Tabla, 
    (SELECT COUNT(*) FROM  receta_medica) as TotalRegistros, "Tabla Débil" )
    UNION
    (SELECT "receta_medica_detalle" as Tabla, 
    (SELECT COUNT(*) FROM  receta_medica_detalle) as TotalRegistros, "Tabla Débil")*/
    UNION
    (SELECT "TABLAS ISLA" as Tabla, "--------------------" as TotalRegistros,
    "--------------" as TipoTabla, "--------------" as Jerarquia, "--------------" as UDN_Owner, "--------------"  as UDN_Editors,  "--------------" as UDN_Readers)
    UNION
    (SELECT "tbi_bitacora" as Tabla, 
    (SELECT COUNT(*) FROM  tbi_bitacora) as TotalRegistros, "Tabla Isla", "Genérica", "Dirección General", "-", "-");
    
    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` PROCEDURE `sp_insertar_pacientes`(v_cantidad int, v_genero char(1), v_tipo varchar(20))
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE v_fecha_nacimiento DATE;
    DECLARE v_fecha_actual DATETIME;
    DECLARE v_efn VARCHAR(500);
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_primer_apellido VARCHAR(100);
    DECLARE v_segundo_apellido VARCHAR(100);
    DECLARE v_curp CHAR(18) DEFAULT NULL;
    DECLARE v_tipo_sangre VARCHAR(50);
    DECLARE v_grupo_sanguineo VARCHAR(50);
    DECLARE v_pivote_sangre INT DEFAULT 0;
    DECLARE v_persona_id INT DEFAULT 0;
    DECLARE v_bandera_titulo BOOLEAN DEFAULT FALSE;
    DECLARE v_titulo VARCHAR(20) DEFAULT NULL;
    DECLARE v_fecha_registro DATETIME DEFAULT NULL;
    DECLARE v_bandera_fechar_valida BOOLEAN DEFAULT FALSE;
    DECLARE v_fecha_inicio_actividades_hospital DATE DEFAULT "2001-01-01";
    DECLARE v_bandera_porcentaje_registro_nocturno BOOLEAN DEFAULT FALSE;
    DECLARE v_fecha_rango_edad_superior DATE DEFAULT NULL;
    DECLARE v_fecha_rango_edad_inferior DATE DEFAULT NULL;
    DECLARE v_bandera_tipo_paciente BOOLEAN DEFAULT NULL;
    DECLARE v_bandera_fecha_ultima_cita_valida BOOLEAN DEFAULT FALSE;
    DECLARE v_fecha_ultima_cita DATETIME DEFAULT NULL;
    DECLARE v_bandera_atencion_nocturna BOOLEAN DEFAULT NULL;
    DECLARE v_nss VARCHAR(15) DEFAULT NULL;
    DECLARE v_pivote_estatus_vida INT DEFAULT NULL;
    DECLARE v_pivote_estatus_medico INT DEFAULT NULL;
    DECLARE v_pivote_tipo_paciente INT DEFAULT NULL;
    DECLARE v_estatus_vida VARCHAR(15) DEFAULT NULL;
    DECLARE v_estatus_medico VARCHAR(15) DEFAULT NULL;
    DECLARE v_tipo_seguro VARCHAR(20) DEFAULT NULL;
    DECLARE v_tipo_paciente VARCHAR(20) DEFAULT NULL;
    DECLARE v_genero_2 CHAR(1) DEFAULT NULL;
       
	WHILE(i <= v_cantidad) DO
		/* SELECT CONCAT_WS(" ", "-- Calculando los datos para insertar al paciente No.:", i,"--" ) as WarningMessage;*/
		-- Definimos la Fecha Actual
        SET v_fecha_actual= CURDATE();
        SET v_tipo_paciente = v_tipo;
        SET v_genero_2 = v_genero;
        
        
        SET v_pivote_tipo_paciente  = fn_numero_aleatorio_rangos(0,100);
		
        IF v_pivote_tipo_paciente BETWEEN 0 AND 3 THEN
			SET v_tipo_paciente = "Geriátrico";
		ELSEIF v_pivote_tipo_paciente BETWEEN 4 AND 10 THEN
			SET v_tipo_paciente = "Neonatal";
        ELSEIF v_pivote_tipo_paciente BETWEEN 11 AND 40 THEN
			SET v_tipo_paciente = "Pediátrico";
        ELSEIF v_pivote_tipo_paciente BETWEEN 41 AND 100 THEN
			SET v_tipo_paciente = "Adulto";
        
        END IF;      
    
		/*SELECT CONCAT_WS(" ", "Tipo Paciente :",v_tipo_paciente) as WarningMessage;  */
		-- Generar el genero de la persona
		IF v_genero IS NULL THEN 
		SET v_genero_2 = ELT(fn_numero_aleatorio_rangos(1,2), "M", "F");
		END IF;
    
    
    -- Generar Nombre
    SET v_nombre = fn_genera_nombre(v_genero_2);
    SET v_primer_apellido = fn_genera_apellido();
    SET v_segundo_apellido = fn_genera_apellido();
    
   /* SELECT CONCAT_WS(" ", "Insertando a un paciente del tipo:", v_tipo ) as WarningMessage;*/
    -- En base al tipo de paciente definir los rangos límites de fechas de nacimiento.
    CASE v_tipo_paciente 
		WHEN "Neonatal" THEN 
			SET v_fecha_rango_edad_superior = v_fecha_actual;  
			SET v_fecha_rango_edad_inferior = DATE_SUB(v_fecha_actual, INTERVAL 4 WEEK); 
            SET v_nombre = "Bebé";
        WHEN "Pediátrico" THEN 
		  SET v_fecha_rango_edad_superior = DATE_ADD(DATE_SUB(v_fecha_actual, INTERVAL 18 YEAR), INTERVAL -1 DAY); 
		  SET v_fecha_rango_edad_inferior = DATE_ADD(DATE_SUB(v_fecha_actual, INTERVAL 1 MONTH), INTERVAL 1 DAY); 
        WHEN "Adulto" THEN 
		  SET v_fecha_rango_edad_superior = DATE_ADD(DATE_SUB(v_fecha_actual, INTERVAL 80 YEAR), INTERVAL -1 DAY); 
		  SET v_fecha_rango_edad_inferior = DATE_SUB(v_fecha_actual, INTERVAL 18 YEAR); 
        WHEN "Geriátrico" THEN 
		  SET v_fecha_rango_edad_superior = DATE_SUB(v_fecha_actual, INTERVAL 110 YEAR); 
		  SET v_fecha_rango_edad_inferior = DATE_ADD(DATE_SUB(v_fecha_actual, INTERVAL 80 YEAR), INTERVAL 1 DAY); 
    END CASE;
    
    -- Generar el fecha de nacimiento de la persona
    SET v_fecha_nacimiento = fn_genera_fecha_nacimiento(v_fecha_rango_edad_superior, v_fecha_rango_edad_inferior);
	/*SELECT CONCAT_WS(" ", "El paciente nacio:", v_fecha_nacimiento ) as WarningMessage;*/

    
    
    -- Generar la entidad federativa de nacimiento de la persona
    SET v_efn =  ELT(fn_numero_aleatorio_rangos(1,32),
    "Aguascalientes", "Baja California","Baja California Sur", "Campeche", "Coahuila", "Colima", "Chiapas", "Chihuahua",
    "Distrito Federal", "Durango","Guanajuato", "Guerrero", "Hidalgo" , "Jalisco", "México", "Michoacán", "Morelos", 
    "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", 
    "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas", "Nacido en el Extranjero");
    
    --  Genera CURP si no es un Bebe recién nacido
     IF v_tipo_paciente <> "Neonatal" THEN
		set v_curp= fn_genera_curp(v_nombre, v_primer_apellido,v_segundo_apellido,  v_fecha_nacimiento, v_genero, v_efn) ;
     END IF;
     
     
    -- Generar Grupo y Tipo Sanguíneo 
    SET v_pivote_sangre = fn_numero_aleatorio_rangos(0,1000);
    
    IF v_pivote_sangre BETWEEN 0 AND 3 THEN 
      SET v_grupo_sanguineo = "AB";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 4 AND 10 THEN 
	  SET v_grupo_sanguineo = "B";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 11 AND 21 THEN 
	  SET v_grupo_sanguineo = "A";
      SET v_tipo_sangre = "-";
    ELSEIF v_pivote_sangre BETWEEN 21 AND 34 THEN 
	  SET v_grupo_sanguineo = "O";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 35 AND 106 THEN 
	  SET v_grupo_sanguineo = "AB";
      SET v_tipo_sangre = "+";
    ELSEIF v_pivote_sangre BETWEEN 107 AND 357 THEN 
	  SET v_grupo_sanguineo = "B";
      SET v_tipo_sangre = "+";
	ELSEIF v_pivote_sangre BETWEEN 358 AND 633 THEN 
	  SET v_grupo_sanguineo = "A";
      SET v_tipo_sangre = "+";
	ELSE
	  SET v_grupo_sanguineo = "O";
      SET v_tipo_sangre = "+";
    END IF;
    
    
    -- Calcular la fecha de registro de la persona considernado la regla de negocio que las personas no pueden ser registradas antes de haber nacido  y ninguna 
    -- fecha superior a la fecha actual 
    
    WHILE NOT v_bandera_fechar_valida DO
        -- Determinar si el paciente se registro en horario nocturno (20%)
		SET v_bandera_porcentaje_registro_nocturno = fn_bandera_porcentaje(20);
        
        IF v_bandera_porcentaje_registro_nocturno THEN
			SET v_fecha_registro = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital, v_fecha_actual, "21:00:00", "05:59:59");
		ELSE 
			SET v_fecha_registro = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital, v_fecha_actual, "06:00:00", "20:59:59");
		END IF;
        
		IF v_fecha_registro > v_fecha_nacimiento AND v_fecha_registro < v_fecha_actual  THEN 
           SET v_bandera_fechar_valida = TRUE; 
		END IF;
        
	END WHILE; 
    
    
        
    INSERT INTO tbb_personas VALUES (DEFAULT,null, v_nombre , v_primer_apellido , v_segundo_apellido, v_curp, v_genero_2,v_grupo_sanguineo,v_tipo_sangre , v_fecha_nacimiento, DEFAULT, v_fecha_registro, NULL);
    -- Almacenamos el ID asignado a la persona
    SET v_persona_id= last_insert_id();
    
    --  Definir si la ultima cita que recibió el paciente fué en horario nocturno;
    SET v_bandera_atencion_nocturna = fn_bandera_porcentaje(20);
    
    /*SELECT CONCAT_WS(" ", "Calculando la fecha de la última cita para el paciente:",v_genero, v_fecha_nacimiento, v_fecha_registro) as WarningMessage;*/
    
    
      WHILE NOT v_bandera_fecha_ultima_cita_valida DO 
         
		-- Calcular la fecha de la ultima cita que debe ser superior a la fecha de inicio de 
        -- actividades, superior o igual a la fecha de registro del paciente e inferior o igual
        -- a la fecha actual.
        IF v_bandera_atencion_nocturna THEN 
			SET v_fecha_ultima_cita = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital,v_fecha_actual, "08:00:00", "19:59:59" );
		ELSE 
			SET v_fecha_ultima_cita = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital,v_fecha_actual, "20:00:00", "07:59:59");
		END IF;
		IF v_fecha_ultima_cita >= v_fecha_registro THEN
			SET v_bandera_fecha_ultima_cita_valida = TRUE;
        END IF;
       END WHILE;
	/*SELECT CONCAT_WS(" ", "la última cita del paciente fue:", v_fecha_ultima_cita ) as WarningMessage;*/
    
   
    -- Definimos su tipo de Seguro
    SET v_tipo_seguro = ELT(fn_numero_aleatorio_rangos(1,5), 
    "Seguro Privado", "IMSS", "ISSSTE", "Seguro Popular", "Sin Seguro");
    -- En caso de que tenga seguro , generar un código único de seguro
    IF v_tipo_seguro <> "Sin Seguro" THEN 
		-- Definimos el nss del paciente
		SET v_nss= fn_genera_nss();
	END IF;
    
    -- Definimos sus estado de vida, bajo el siguiente esquema:  80% vivo, 15% finado, 4% Vegetativo, 1% Coma
    SET v_pivote_estatus_vida = fn_numero_aleatorio_rangos(0,100);
    
    IF v_pivote_estatus_vida BETWEEN 0 AND 80 THEN 
			SET v_estatus_vida = "Vivo";
	ELSEIF v_pivote_estatus_vida BETWEEN 81 AND 95 THEN 
			SET v_estatus_vida = "Finado";
	ELSEIF v_pivote_estatus_vida BETWEEN 96 AND 99 THEN 
			SET v_estatus_vida = "Vegetativo";
    ELSEIF v_pivote_estatus_vida = 100 THEN
			SET v_estatus_vida = "Coma";
    END IF;
    
    
    
    -- Definimos su estado médico, bajo el siguiente escenario, si el paciente no esta finado será No Aplica, 
    -- En caso de que se encuentre con vida: 75% Bien, 10% Estable, 1% Crítico, 2% Grave, 3% Indeterminado, 2% en Recuperación, 7% En observacion
    
    
    IF v_estatus_vida <> "Finado" THEN
		SET v_pivote_estatus_medico = fn_numero_aleatorio_rangos(0,75);
		IF v_estatus_medico BETWEEN 0 AND 75 THEN 
			SET v_estatus_medico = "Bien";
		ELSEIF v_pivote_estatus_medico BETWEEN 76 AND 85 THEN 
			SET v_estatus_medico = "Estable";
		ELSEIF v_pivote_estatus_medico = 86  THEN 
			SET v_estatus_medico = "Crítico";
		ELSEIF v_pivote_estatus_medico BETWEEN 87 AND 88 THEN 
			SET v_estatus_medico = "Grave";
		ELSEIF v_pivote_estatus_medico BETWEEN 89 AND 91 THEN 
			SET v_estatus_medico = "Indeterminado";
		ELSEIF v_pivote_estatus_medico BETWEEN 92 AND 93 THEN 
			SET v_estatus_medico = "Recuperación";
		ELSEIF v_pivote_estatus_medico BETWEEN 94 AND 100 THEN 
			SET v_estatus_medico = "En Observación";
		END IF;
	ELSE 
		SET v_estatus_medico = "No Aplica";
	END IF; 
    
      
  /*  SET v_estatus_medico = ELT(fn_numero_aleatorio_rangos(1,9), 
    "Crítico", "Estable", "Indeterminado", "Recuperacion", "En Cirugía", "Grave", "No Aplica", "En Observación",  "Bien");*/
    
    -- Insertar los datos del paciente
    INSERT INTO pacientes VALUES(v_persona_id, v_nss, 
    v_tipo_seguro, v_fecha_registro, v_fecha_ultima_cita, v_estatus_medico, v_estatus_vida, DEFAULT);
    
    SET v_tipo_paciente = NULL;
    SET v_titulo = NULL;
    SET v_nss = NULL;
    SET v_bandera_fechar_valida = FALSE;
    SET v_bandera_tipo_paciente = FALSE;
    SET v_bandera_fecha_ultima_cita_valida = FALSE;
    SET v_tipo_seguro = NULL;
    SET v_curp = NULL;
    SET i =i +1;
    
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_personal_medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` PROCEDURE `sp_insertar_personal_medico`(v_cantidad int, v_tipo VARCHAR(50))
BEGIN

	DECLARE i INT DEFAULT 1;
    DECLARE v_genero CHAR DEFAULT NULL;
    DECLARE v_fecha_actual DATE;
    DECLARE v_fecha_limite_27 DATE;
    DECLARE v_fecha_limite_65 DATE;
    DECLARE v_fecha_nacimiento DATE;
    DECLARE v_efn VARCHAR(500);
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_primer_apellido VARCHAR(100);
    DECLARE v_segundo_apellido VARCHAR(100);
    DECLARE v_tipo_sangre VARCHAR(50);
    DECLARE v_grupo_sanguineo VARCHAR(50);
    DECLARE v_pivote_sangre INT DEFAULT 0;
    DECLARE v_persona_id INT DEFAULT 0;
    DECLARE v_total_departamentos INT DEFAULT (SELECT COUNT(*) FROM tbc_departamentos WHERE estatus = b'1');
    DECLARE v_pos_departamento INT DEFAULT NULL;
    DECLARE v_departamento_id INT DEFAULT NULL;
    DECLARE v_fecha_contratacion DATETIME DEFAULT NULL;
    DECLARE v_bandera_tiene_especialidad BOOLEAN DEFAULT NULL;
    DECLARE v_nombre_especialidad VARCHAR(60) DEFAULT NULL;
    DECLARE v_titulo VARCHAR(20) DEFAULT NULL;
    DECLARE v_fecha_registro DATETIME DEFAULT NULL;
    DECLARE v_bandera_fechar_valida BOOLEAN DEFAULT FALSE;
    DECLARE v_fecha_inicio_actividades_hospital DATE DEFAULT "2001-01-01";
    DECLARE v_bandera_fecha_contratacion_valida BOOLEAN DEFAULT FALSE;
    DECLARE v_edad_contratacion INT DEFAULT NULL;
    DECLARE v_edad_registro INT DEFAULT NULL;
    
    -- Obtener la fecha actual
    SET v_fecha_actual = CURDATE();
    
    -- Calcular la fecha límite para 27 años atrás
    SET v_fecha_limite_27 = DATE_SUB(v_fecha_actual, INTERVAL 27 YEAR);
    
    -- Calcular la fecha límite para 65 años atrás
    SET v_fecha_limite_65 = DATE_SUB(v_fecha_actual, INTERVAL 65 YEAR);
            
    WHILE(i <= v_cantidad) DO
	
    --  En caso de que no se defina el tipo de personal médico , elegir uno aleatorio
    IF v_tipo IS NULL THEN 
		SET v_tipo = ELT(fn_numero_aleatorio_rangos(1,7), "Médico", "Enfermero", "Administrativo", 
        "Directivo", "Apoyo", "Residente", "Interno");
    END IF;
    
    -- Generar el genero de la persona
    SET v_genero = ELT(fn_numero_aleatorio_rangos(1,2), "M", "F");
    
    -- Generar el fecha de nacimiento de la persona
    SET v_fecha_nacimiento = fn_genera_fecha_nacimiento(v_fecha_limite_65, v_fecha_limite_27);
    SET v_nombre = fn_genera_nombre(v_genero);
    SET v_primer_apellido = fn_genera_apellido();
    SET v_segundo_apellido = fn_genera_apellido();
    
    
    -- Generar la entidad federativa de nacimiento de la persona
    SET v_efn =  ELT(fn_numero_aleatorio_rangos(1,32),
    "Aguascalientes", "Baja California","Baja California Sur", "Campeche", "Coahuila", "Colima", "Chiapas", "Chihuahua", "Distrito Federal", "Durango",
    "Guanajuato", "Guerrero", "Hidalgo" , "Jalisco", "México", "Michoacán", "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo",
    "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas", "Nacido en el Extranjero");
    
    -- Generar Grupo y Tipo Sanguíneo 
    SET v_pivote_sangre = fn_numero_aleatorio_rangos(0,1000);
    
    IF v_pivote_sangre BETWEEN 0 AND 3 THEN 
      SET v_grupo_sanguineo = "AB";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 4 AND 10 THEN 
	  SET v_grupo_sanguineo = "B";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 11 AND 21 THEN 
	  SET v_grupo_sanguineo = "A";
      SET v_tipo_sangre = "-";
    ELSEIF v_pivote_sangre BETWEEN 21 AND 34 THEN 
	  SET v_grupo_sanguineo = "O";
      SET v_tipo_sangre = "-";
	ELSEIF v_pivote_sangre BETWEEN 35 AND 106 THEN 
	  SET v_grupo_sanguineo = "AB";
      SET v_tipo_sangre = "+";
    ELSEIF v_pivote_sangre BETWEEN 107 AND 357 THEN 
	  SET v_grupo_sanguineo = "B";
      SET v_tipo_sangre = "+";
	ELSEIF v_pivote_sangre BETWEEN 358 AND 633 THEN 
	  SET v_grupo_sanguineo = "A";
      SET v_tipo_sangre = "+";
	ELSE
	  SET v_grupo_sanguineo = "O";
      SET v_tipo_sangre = "+";
    END IF;
    
    
    -- Calcular la fecha de registro de la persona considernado la regla de negocio que las personas no pueden ser registradas antes de haber nacido  y ninguna 
    -- fecha superior a la fecha actual 
    
    WHILE NOT v_bandera_fechar_valida DO
   		SET v_fecha_registro = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital, v_fecha_actual, "08:00:00", "20:00:00");
		SET v_edad_registro = fn_calcula_edad_fecha_especifica(v_fecha_nacimiento, v_fecha_registro);
		IF v_fecha_registro > v_fecha_nacimiento  AND v_edad_registro >= 27 THEN 
           SET v_bandera_fechar_valida = TRUE; 
		END IF;
        
	END WHILE; 
        
    
    
    -- Insertar los datos personales del empleado
    INSERT INTO tbb_personas VALUES (DEFAULT,null, v_nombre , v_primer_apellido , v_segundo_apellido, fn_genera_curp(v_nombre, v_primer_apellido,v_segundo_apellido,  v_fecha_nacimiento
    , v_genero, v_efn) , v_genero,v_grupo_sanguineo,v_tipo_sangre , v_fecha_nacimiento, DEFAULT, v_fecha_registro, NULL);
    
    -- Guardamos el ID de la persona insertada para reutilizarlo.
    SET v_persona_id = last_insert_id();
    
    -- Insertar los datos laborales del empleado
    -- Elegimos el id del departamento al que esta adscrito el empleado 
    SET v_pos_departamento = fn_numero_aleatorio_rangos(1, v_total_departamentos)-1;
    SET v_departamento_id = (SELECT id FROM tbc_departamentos ORDER BY id LIMIT v_pos_departamento,1);
    
    -- Considerando que el 25% de los Médicos contratados  y el 10% residentes tienen especialidad
    IF v_tipo = "Médico" THEN 
		SET v_bandera_tiene_especialidad = fn_bandera_porcentaje(25);
		IF v_bandera_tiene_especialidad THEN 
            SET v_nombre_especialidad = fn_genera_especialidad();
		ELSE 
			SET v_nombre_especialidad = "Medicina General";
		END IF;
        IF v_genero = "M" THEN
			SET v_titulo = "Dr.";
		ELSE
			SET v_titulo = "Dra.";
		END IF;
	ELSEIF v_tipo ="Residente" THEN   -- Alumnos de Posgrado que ya tiene la carrera de medicina general
        --  y estan en fase de termino de su especialidad
		SET v_bandera_tiene_especialidad = fn_bandera_porcentaje(10);
		IF v_bandera_tiene_especialidad THEN 
            SET v_nombre_especialidad = fn_genera_especialidad();
            IF v_genero = "M" THEN
				SET v_titulo = "Dr.";
			ELSE
				SET v_titulo = "Dra.";
			END IF;
		ELSE 
			SET v_nombre_especialidad = "Medicina General";
		END IF;
	ELSEIF v_tipo ="Interno" THEN 
		SET v_nombre_especialidad ="Medicina General";   -- Los médicos internos son estudiantes sin graduarse
        -- de la carrera de medicina
        SET v_titulo = "Pste.";
    
	ELSE 
		SET v_nombre_especialidad = NULL;
	END IF; 
    
    WHILE NOT v_bandera_fecha_contratacion_valida DO 
		-- Calcular la fecha de contratación
		SET v_fecha_contratacion = fn_fechahora_aleatoria_rangos(v_fecha_inicio_actividades_hospital,v_fecha_actual, "08:00:00", "20:00:00" );
        SET v_edad_contratacion  =  fn_calcula_edad_fecha_especifica(v_fecha_nacimiento, v_fecha_contratacion);
        
        IF (v_edad_contratacion BETWEEN 27 AND 65) AND (v_edad_contratacion >= 27) AND (v_fecha_contratacion >= v_fecha_inicio_actividades_hospital) 
        AND  (v_fecha_contratacion >= v_fecha_registro) THEN
			SET v_bandera_fecha_contratacion_valida=TRUE;
		END IF;
	END WHILE;
    -- Le actualizamos el titulo al médico
    UPDATE tbb_personas SET titulo = v_titulo WHERE id = v_persona_id;
    
    INSERT INTO tbb_personal_medico VALUES(v_persona_id, v_departamento_id, v_nombre_especialidad,
    v_tipo, fn_genera_cedula_profesional(), DEFAULT, v_fecha_contratacion, NULL);
    SET v_tipo = NULL;
    SET v_titulo = NULL;
    SET v_bandera_fechar_valida = FALSE;
    SET v_bandera_fecha_contratacion_valida=FALSE;
    SET i =i +1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_limpia_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` PROCEDURE `sp_limpia_bd`(v_password VARCHAR(20))
BEGIN  

	IF v_password = "xYz$123" THEN
	START TRANSACTION;
        
        DELETE FROM tbb_personal_medico;  -- Tabla Débil
        DELETE FROM tbb_pacientes;  -- Tabla Débil
        DELETE FROM tbb_personas;  -- Tabla Fuerte 
        ALTER TABLE tbb_personas auto_increment = 1;  -- Resetear Autoincremento
        
        /* Borrar registros de la BITACORA de todas menos de las Tablas Catálogos */
        DELETE FROM tbi_bitacora WHERE nombre_tabla NOT IN("tbc_areas_medicas", "tbc_departamentos");
	COMMIT;

	ELSE 
		SELECT ("La contraseña es incorrecta.") AS ErrorMessage;
        
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pobla_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Prof.Marco`@`%` PROCEDURE `sp_pobla_bd`(v_password VARCHAR(20))
BEGIN  IF v_password = "xYz$123" THEN
		
        -- Poblar la base de datos en base al siguiente escenario de simulación
        -- Empleados
        -- 70 empleados en general
        CALL sp_insertar_personal_medico(70, NULL);
        -- 60 médicos 
        CALL sp_insertar_personal_medico(60, "Médico");
        -- 80 enfermeros
        CALL sp_insertar_personal_medico(80, "Enfermero");
		-- 25 administrativos
        CALL sp_insertar_personal_medico(25, "Administrativo");
        -- 15 apoyos
        CALL sp_insertar_personal_medico(15, "Apoyo");
		-- 10 directivos 
        CALL sp_insertar_personal_medico(10, "Directivo");
        -- 30 residentes
        CALL sp_insertar_personal_medico(30, "Residente");
        -- 10 internos
        CALL sp_insertar_personal_medico(10, "Interno");

		-- Pacientes
        -- 1500 pacientes generales
        CALL sp_insertar_pacientes(1500, NULL, NULL);
		-- 300 Mujeres de cualquier edad
		CALL sp_insertar_pacientes(300, "F", NULL);
        --  150 Hombres de cualquier edad
        CALL sp_insertar_pacientes(150, "M", NULL);
		-- 15 pacientes Neonatales de cualquier género
        CALL sp_insertar_pacientes(15, NULL, "Neonatal");
        -- 250 Pediatricos de cualquier género
        CALL sp_insertar_pacientes(250 ,NULL, "Pediátrico");
        -- 450 Adultos de cualquier género
        CALL sp_insertar_pacientes(450 ,NULL, "Adulto");
        -- 40 Geriátricos de Femeninos
		CALL sp_insertar_pacientes(40 ,"F", "Geriátrico");
        -- 10 Geriátricos de Masculinos
		CALL sp_insertar_pacientes(10 ,"M", "Geriátrico");
ELSE
		SELECT ("La contraseña es incorrecta.") AS ErrorMessage;
        
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24 14:52:39
