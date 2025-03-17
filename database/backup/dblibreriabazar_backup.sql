-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dblibreria
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `idadministrador` int NOT NULL AUTO_INCREMENT,
  `user` varchar(60) NOT NULL,
  `password` varchar(120) NOT NULL,
  `estado` char(1) NOT NULL,
  `idrol` int DEFAULT NULL,
  `idpersonal` int DEFAULT NULL,
  PRIMARY KEY (`idadministrador`),
  UNIQUE KEY `user` (`user`),
  KEY `idrol` (`idrol`),
  KEY `idpersonal` (`idpersonal`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `administrador_ibfk_2` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'ataboada','ataboada','1',1,1),(2,'sreyes','sreyes','1',2,2),(3,'agarcia','agarcia','1',3,3);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(60) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bolígrafos y lápices','boligrafos-y-lapices'),(2,'Papel y sobres','papel-y-sobres'),(3,'Cuadernos y libretas','cuadernos-y-libretas'),(4,'Manualidades','manualidades'),(5,'Dibujo y Arte','dibujo-y-arte'),(6,'Escolar','escolar'),(7,'Oficina','oficina'),(8,'Libros','libros'),(9,'Otros','otros');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apaterno` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amaterno` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contraseña` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idgenero` int DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `email` (`email`),
  KEY `idgenero` (`idgenero`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`idgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('026ZI044','ZacarÃ­as','Inca','Quispe','912345678','zacarias@gmail.com','zacarias123!',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `iddistrito` int NOT NULL AUTO_INCREMENT,
  `distrito` varchar(60) NOT NULL,
  PRIMARY KEY (`iddistrito`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Ancón'),(2,'Ate'),(3,'Barranco'),(4,'Breña'),(5,'Carabayllo'),(6,'Cercado de Lima'),(7,'Chaclacayo'),(8,'Chorrillos'),(9,'Cieneguilla'),(10,'Comas'),(11,'El Agustino'),(12,'Independencia'),(13,'Jesús María'),(14,'La Molina'),(15,'La Victoria'),(16,'Lince'),(17,'Los Olivos'),(18,'Lurigancho'),(19,'Lurín'),(20,'Magdalena del Mar'),(21,'Miraflores'),(22,'Pachacámac'),(23,'Pucusana'),(24,'Pueblo Libre'),(25,'Puente Piedra'),(26,'Punta Hermosa'),(27,'Punta Negra'),(28,'Rímac'),(29,'San Bartolo'),(30,'San Borja'),(31,'San Isidro'),(32,'San Juan de Lurigancho'),(33,'San Juan de Miraflores'),(34,'San Luis'),(35,'San Martín de Porres'),(36,'San Miguel'),(37,'Santa Anita'),(38,'Santa María del Mar'),(39,'Santa Rosa'),(40,'Santiago de Surco'),(41,'Surquillo'),(42,'Villa El Salvador'),(43,'Villa María del Triunfo');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `identrega` int NOT NULL AUTO_INCREMENT,
  `entrega` varchar(60) NOT NULL,
  PRIMARY KEY (`identrega`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,'Recojo en tienda'),(2,'Delivery');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(30) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino'),(3,'No especificado');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idmarca` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(60) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Faber-Castell'),(2,'Artesco'),(3,'Layconsa'),(4,'3M'),(5,'Pilot'),(6,'Pelican'),(7,'Justus'),(8,'Staedtler'),(9,'Stabilo'),(10,'Surco'),(11,'Alpha'),(12,'Ove'),(13,'Otros');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idpago` int NOT NULL AUTO_INCREMENT,
  `pago` varchar(60) NOT NULL,
  PRIMARY KEY (`idpago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'Tarjeta de crédito/débito'),(2,'Transferencia bancaria');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `codigo` varchar(7) NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL,
  `idcliente` varchar(8) DEFAULT NULL,
  `iddistrito` int DEFAULT NULL,
  `idtienda` int DEFAULT NULL,
  `identrega` int DEFAULT NULL,
  `idpago` int DEFAULT NULL,
  `direccion` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idcliente` (`idcliente`),
  KEY `iddistrito` (`iddistrito`),
  KEY `idtienda` (`idtienda`),
  KEY `identrega` (`identrega`),
  KEY `idpago` (`idpago`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`iddistrito`) REFERENCES `distrito` (`iddistrito`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idtienda`) REFERENCES `tienda` (`idtienda`),
  CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`identrega`) REFERENCES `entrega` (`identrega`),
  CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES ('FLBB817','2025-03-04',174.3,'026ZI044',NULL,2,1,1,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_detalle`
--

DROP TABLE IF EXISTS `pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_detalle` (
  `idpedido_detalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `subtotal` float NOT NULL,
  `codigo` varchar(7) DEFAULT NULL,
  `SKU` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idpedido_detalle`),
  KEY `codigo` (`codigo`),
  KEY `SKU` (`SKU`),
  CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `pedido` (`codigo`),
  CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `producto` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
INSERT INTO `pedido_detalle` VALUES (1,1,174.3,'FLBB817','DIW56LGQ55');
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `idpersonal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apaterno` varchar(60) NOT NULL,
  `amaterno` varchar(60) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `profesion` varchar(60) NOT NULL,
  PRIMARY KEY (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Alejandro','Taboada','Sanchez','911275987',25,'Ingeniero de Sistemas'),(2,'Sofia','Reyes','Soto','934419031',21,'Ingeniera de Software'),(3,'Adam','García','Martínez','955922381',22,'Ingeniero Informático');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `SKU` varchar(10) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` text,
  `idmarca` int DEFAULT NULL,
  `precio` decimal(12,2) NOT NULL,
  `stock` int NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `idcategoria` int DEFAULT NULL,
  PRIMARY KEY (`SKU`),
  KEY `idcategoria` (`idcategoria`),
  KEY `idmarca` (`idmarca`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('2DKQ80CQ8I','Lápiz 2B Grafito Stabilo Con Borrador X 6 Und','Set de 6 lápices 2B de grafito con borrador incorporado. Ideal para bocetos y escritura.',9,5.00,100,'./images/product/lapiz-2b-grafito-stabilo-con-borrador-x-6-und.jpg',1),('5XI6LI2B63','Bolígrafo Faber Castell Trilux 031 Punta Fina Rojo X 1 Und','Bolígrafo Faber Castell Trilux 031 Punta Fina Rojo X 1 Und',1,0.62,100,'./images/product/boligrafo-faber-castell-trilux-031-punta-fina-rojo-x-1-und.jpg',1),('6EV8DVZ022','Lápiz 2Hb Amarillo Artesco Blíster X 3 Und + Borrador + Tajador','Incluye 3 lápices 2HB, un borrador y un tajador. Ideal para uso escolar y oficina.',2,5.90,100,'./images/product/lapiz-2hb-amarillo-artesco-blister-x-3-und-borrador-tajador.jpg',1),('8PA18ZXE5T','Lápiz 2B Jumbo Ove Sin Borrador Caja X 12 Und','Caja con 12 lápices 2B Jumbo sin borrador. Perfectos para niños y principiantes.',12,11.90,100,'./images/product/lapiz-2b-jumbo-ove-sin-borrador-caja-x-12-und.jpg',1),('A1X7M4T9Q2','Sobre 1','Sobre 1',2,9.90,100,'./images/product/default.jpg',2),('A2P8X7D9Y3','Dibujo Arte 5','Dibujo Arte 5',5,12.90,100,'./images/product/default.jpg',5),('A5X1P7Y6D2','Dibujo Arte 2','Dibujo Arte 2',5,12.90,100,'./images/product/default.jpg',5),('A6X9P1D7Y2','Dibujo Arte 8','Dibujo Arte 8',5,12.90,100,'./images/product/default.jpg',5),('A7P1X9D2Y6','Dibujo Arte 11','Dibujo Arte 11',5,12.90,100,'./images/product/default.jpg',5),('B9Q2M8X5N7','Sobre 2','Sobre 2',2,9.90,100,'./images/product/default.jpg',2),('C3M6N9T2Y8','Sobre 3','Sobre 3',2,9.90,100,'./images/product/default.jpg',2),('C3O5L9E1S8','Escolar 3','Escolar 3',6,8.90,100,'./images/product/default.jpg',6),('C8O1L7E4S2','Escolar 8','Escolar 8',6,8.90,100,'./images/product/default.jpg',6),('D1A2P8X9Y7','Dibujo Arte 10','Dibujo Arte 10',5,12.90,100,'./images/product/default.jpg',5),('D2A7X6Y1P9','Dibujo Arte 1','Dibujo Arte 1',5,12.90,100,'./images/product/default.jpg',5),('D3A5P7X9Y1','Dibujo Arte 7','Dibujo Arte 7',5,12.90,100,'./images/product/default.jpg',5),('D5T8X9P2M7','Sobre 4','Sobre 4',2,9.90,100,'./images/product/default.jpg',2),('D7X3P1A9Y2','Dibujo Arte 4','Dibujo Arte 4',5,12.90,100,'./images/product/default.jpg',5),('DIW56LGQ55','Pack Mochila Con Ruedas Xtrem Speedy 5Xt Rosado 3 Piezas','Pack Mochila Con Ruedas Xtrem Speedy 5Xt Rosado 3 Piezas',13,174.30,100,'./images/product/pack-mochila-con-ruedas-xtrem-speedy-5xt-rosado-3-piezas.jpg',9),('E1S3C7O9L5','Escolar 1','Escolar 1',6,8.90,100,'./images/product/default.jpg',6),('E3S4C9O7L5','Escolar 11','Escolar 11',6,8.90,100,'./images/product/default.jpg',6),('E4Q7T9X2Y6','Sobre 5','Sobre 5',2,9.90,100,'./images/product/default.jpg',2),('E6S8C4O2L7','Escolar 6','Escolar 6',6,8.90,100,'./images/product/default.jpg',6),('F8X2N9M5T7','Sobre 6','Sobre 6',2,9.90,100,'./images/product/default.jpg',2),('J4T9B1M7C2','Lapicero 1','Lapicero 1',1,9.90,100,'./images/product/default.jpg',1),('L1E2S8C4O6','Escolar 10','Escolar 10',6,8.90,100,'./images/product/default.jpg',6),('L5E7S3C1O8','Escolar 5','Escolar 5',6,8.90,100,'./images/product/default.jpg',6),('LIB01234JK','Libro 10','Libro 10',8,25.90,100,'./images/product/default.jpg',8),('LIB12345AB','Libro 1','Libro 1',8,25.90,100,'./images/product/default.jpg',8),('LIB12345KL','Libro 11','Libro 11',8,25.90,100,'./images/product/default.jpg',8),('LIB23456BC','Libro 2','Libro 2',8,25.90,100,'./images/product/default.jpg',8),('LIB23456LM','Libro 12','Libro 12',8,25.90,100,'./images/product/default.jpg',8),('LIB34567CD','Libro 3','Libro 3',8,25.90,100,'./images/product/default.jpg',8),('LIB45678DE','Libro 4','Libro 4',8,25.90,100,'./images/product/default.jpg',8),('LIB56789EF','Libro 5','Libro 5',8,25.90,100,'./images/product/default.jpg',8),('LIB67890FG','Libro 6','Libro 6',8,25.90,100,'./images/product/default.jpg',8),('LIB78901GH','Libro 7','Libro 7',8,25.90,100,'./images/product/default.jpg',8),('LIB89012HI','Libro 8','Libro 8',8,25.90,100,'./images/product/default.jpg',8),('LIB90123IJ','Libro 9','Libro 9',8,25.90,100,'./images/product/default.jpg',8),('M4Q7T9X2Y6','Papel 5','Papel 5',2,9.90,100,'./images/product/default.jpg',2),('M4X9T2Y8Q5','Cuaderno 6','Cuaderno 6',3,9.90,100,'./images/product/default.jpg',3),('M6X9P3T1Y7','Lapicero 4','Lapicero 4',1,9.90,100,'./images/product/default.jpg',1),('M8N2X4T9Y7','Manualidad 6','Manualidad 6',4,9.90,100,'./images/product/default.jpg',4),('M9T3X6Q2P7','Cuaderno 1','Cuaderno 1',3,9.90,100,'./images/product/default.jpg',3),('N5T8X9P2M7','Papel 4','Papel 4',2,9.90,100,'./images/product/default.jpg',2),('O4L6E2S7C9','Escolar 4','Escolar 4',6,8.90,100,'./images/product/default.jpg',6),('O9L3E5S1C7','Escolar 9','Escolar 9',6,8.90,100,'./images/product/default.jpg',6),('OFC01234JK','Oficina 10','Oficina 10',7,15.90,100,'./images/product/default.jpg',7),('OFC12345AB','Oficina 1','Oficina 1',7,15.90,100,'./images/product/default.jpg',7),('OFC12345KL','Oficina 11','Oficina 11',7,15.90,100,'./images/product/default.jpg',7),('OFC23456BC','Oficina 2','Oficina 2',7,15.90,100,'./images/product/default.jpg',7),('OFC23456LM','Oficina 12','Oficina 12',7,15.90,100,'./images/product/default.jpg',7),('OFC34567CD','Oficina 3','Oficina 3',7,15.90,100,'./images/product/default.jpg',7),('OFC45678DE','Oficina 4','Oficina 4',7,15.90,100,'./images/product/default.jpg',7),('OFC56789EF','Oficina 5','Oficina 5',7,15.90,100,'./images/product/default.jpg',7),('OFC67890FG','Oficina 6','Oficina 6',7,15.90,100,'./images/product/default.jpg',7),('OFC78901GH','Oficina 7','Oficina 7',7,15.90,100,'./images/product/default.jpg',7),('OFC89012HI','Oficina 8','Oficina 8',7,15.90,100,'./images/product/default.jpg',7),('OFC90123IJ','Oficina 9','Oficina 9',7,15.90,100,'./images/product/default.jpg',7),('OTR01234JK','Otro 10','Otro 10',9,12.90,100,'./images/product/default.jpg',9),('OTR12345AB','Otro 1','Otro 1',9,12.90,100,'./images/product/default.jpg',9),('OTR12345KL','Otro 11','Otro 11',9,12.90,100,'./images/product/default.jpg',9),('OTR23456BC','Otro 2','Otro 2',9,12.90,100,'./images/product/default.jpg',9),('OTR34567CD','Otro 3','Otro 3',9,12.90,100,'./images/product/default.jpg',9),('OTR45678DE','Otro 4','Otro 4',9,12.90,100,'./images/product/default.jpg',9),('OTR56789EF','Otro 5','Otro 5',9,12.90,100,'./images/product/default.jpg',9),('OTR67890FG','Otro 6','Otro 6',9,12.90,100,'./images/product/default.jpg',9),('OTR78901GH','Otro 7','Otro 7',9,12.90,100,'./images/product/default.jpg',9),('OTR89012HI','Otro 8','Otro 8',9,12.90,100,'./images/product/default.jpg',9),('OTR90123IJ','Otro 9','Otro 9',9,12.90,100,'./images/product/default.jpg',9),('P1X7M4T9Q2','Papel 1','Papel 1',2,9.90,100,'./images/product/default.jpg',2),('P3D2A9X7Y1','Dibujo Arte 12','Dibujo Arte 12',5,12.90,100,'./images/product/default.jpg',5),('P4D7X1A9Y6','Dibujo Arte 9','Dibujo Arte 9',5,12.90,100,'./images/product/default.jpg',5),('P54UL08VP0','Corrector De Escritura Artesco Para Lápiz Blíster X 4 Und','Pack de 4 correctores de escritura para lápiz. Secado rápido y cobertura uniforme.',2,12.50,100,'./images/product/corrector-escritura-artesco-lapiz-blister-x-4-und.jpg',1),('P5M7X9T2Y3','Manualidad 3','Manualidad 3',4,9.90,100,'./images/product/default.jpg',4),('P5X2Y7B9M4','Lapicero 7','Lapicero 7',1,9.90,100,'./images/product/default.jpg',1),('P7N9X6Q2T8','Cuaderno 5','Cuaderno 5',3,9.90,100,'./images/product/default.jpg',3),('P8A9X6Y3D1','Dibujo Arte 3','Dibujo Arte 3',5,12.90,100,'./images/product/default.jpg',5),('P8N3X6T9Y5','Manualidad 9','Manualidad 9',4,9.90,100,'./images/product/default.jpg',4),('P8N3X9T6Y5','Libreta 3','Libreta 3',3,9.90,100,'./images/product/default.jpg',3),('P9D1A6X3Y8','Dibujo Arte 6','Dibujo Arte 6',5,12.90,100,'./images/product/default.jpg',5),('Q2P7X9M6T3','Cuaderno 3','Cuaderno 3',3,9.90,100,'./images/product/default.jpg',3),('Q3P9X5M7T6','Libreta 5','Libreta 5',3,9.90,100,'./images/product/default.jpg',3),('Q3X5P7M9T6','Manualidad 11','Manualidad 11',4,9.90,100,'./images/product/default.jpg',4),('Q3X7P9T5M6','Manualidad 5','Manualidad 5',4,9.90,100,'./images/product/default.jpg',4),('Q8Y2N5Z4H3','Lapicero 3','Lapicero 3',1,9.90,100,'./images/product/default.jpg',1),('S2C4O8L6E7','Escolar 2','Escolar 2',6,8.90,100,'./images/product/default.jpg',6),('S5C6O2L8E9','Escolar 12','Escolar 12',6,8.90,100,'./images/product/default.jpg',6),('S7C9O5L3E1','Escolar 7','Escolar 7',6,8.90,100,'./images/product/default.jpg',6),('T1M8Q9X3Z6','Lapicero 6','Lapicero 6',1,9.90,100,'./images/product/default.jpg',1),('T5Q9M6X7Y2','Manualidad 7','Manualidad 7',4,9.90,100,'./images/product/default.jpg',4),('T6Q8N4X7M2','Manualidad 2','Manualidad 2',4,9.90,100,'./images/product/default.jpg',4),('T6Y8M3X4N9','Cuaderno 4','Cuaderno 4',3,9.90,100,'./images/product/default.jpg',3),('T9Q2M8X5N7','Papel 2','Papel 2',2,9.90,100,'./images/product/default.jpg',2),('T9Q5M7X3Y2','Libreta 1','Libreta 1',3,9.90,100,'./images/product/default.jpg',3),('X3M6N9T2Y8','Papel 3','Papel 3',2,9.90,100,'./images/product/default.jpg',2),('X4M7Y9T2Q6','Manualidad 8','Manualidad 8',4,9.90,100,'./images/product/default.jpg',4),('X4T9B1M7C2','Lapicero 2','Lapicero 2',1,9.90,100,'./images/product/default.jpg',1),('X6M4Y9T2Q7','Libreta 2','Libreta 2',3,9.90,100,'./images/product/default.jpg',3),('X8N2T6M4Y9','Manualidad 12','Manualidad 12',4,9.90,100,'./images/product/default.jpg',4),('X8N2T9M4Y7','Libreta 6','Libreta 6',3,9.90,100,'./images/product/default.jpg',3),('X8N5T4Y7Q2','Cuaderno 2','Cuaderno 2',3,9.90,100,'./images/product/default.jpg',3),('X9T3M6Y2Q7','Manualidad 1','Manualidad 1',4,9.90,100,'./images/product/default.jpg',4),('Y2T7M6X4Q9','Libreta 4','Libreta 4',3,9.90,100,'./images/product/default.jpg',3),('Y2T7M9X4Q6','Manualidad 10','Manualidad 10',4,9.90,100,'./images/product/default.jpg',4),('Y2T9X6M4Q8','Manualidad 4','Manualidad 4',4,9.90,100,'./images/product/default.jpg',4),('Y8X2N9M5T7','Papel 6','Papel 6',2,9.90,100,'./images/product/default.jpg',2),('Z2B7N4Y8X5','Lapicero 5','Lapicero 5',1,9.90,100,'./images/product/default.jpg',1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(60) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador general'),(2,'Administrador de ventas'),(3,'Administrador de contenido');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `idtienda` int NOT NULL AUTO_INCREMENT,
  `tienda` varchar(60) NOT NULL,
  PRIMARY KEY (`idtienda`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'TechOffice Surco'),(2,'TechOffice Jockey Plaza'),(3,'TechOffice San Isidro'),(4,'TechOffice Plaza Lima Sur'),(5,'TechOffice Miraflores'),(6,'TechOffice Mall del Sur'),(7,'TechOffice La Molina'),(8,'TechOffice San Miguel');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 19:40:21
