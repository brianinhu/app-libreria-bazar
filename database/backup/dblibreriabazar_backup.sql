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
INSERT INTO `producto` VALUES ('2DKQ80CQ8I','Lápiz 2B Grafito Stabilo Con Borrador X 6 Und','Set de 6 lápices 2B de grafito con borrador incorporado. Ideal para bocetos y escritura.',9,5.00,100,'./images/product/lapiz-2b-grafito-stabilo-con-borrador-x-6-und.jpg',1),('5XI6LI2B63','Bolígrafo Faber Castell Trilux 031 Punta Fina Rojo X 1 Und','Bolígrafo Faber Castell Trilux 031 Punta Fina Rojo X 1 Und',1,0.62,100,'./images/product/boligrafo-faber-castell-trilux-031-punta-fina-rojo-x-1-und.jpg',1),('6EV8DVZ022','Lápiz 2Hb Amarillo Artesco Blíster X 3 Und + Borrador + Tajador','Incluye 3 lápices 2HB, un borrador y un tajador. Ideal para uso escolar y oficina.',2,5.90,100,'./images/product/lapiz-2hb-amarillo-artesco-blister-x-3-und-borrador-tajador.jpg',1),('8PA18ZXE5T','Lápiz 2B Jumbo Ove Sin Borrador Caja X 12 Und','Caja con 12 lápices 2B Jumbo sin borrador. Perfectos para niños y principiantes.',12,11.90,100,'./images/product/lapiz-2b-jumbo-ove-sin-borrador-caja-x-12-und.jpg',1),('DIW56LGQ55','Pack Mochila Con Ruedas Xtrem Speedy 5Xt Rosado 3 Piezas','Pack Mochila Con Ruedas Xtrem Speedy 5Xt Rosado 3 Piezas',13,174.30,100,'./images/product/pack-mochila-con-ruedas-xtrem-speedy-5xt-rosado-3-piezas.jpg',9),('P54UL08VP0','Corrector De Escritura Artesco Para Lápiz Blíster X 4 Und','Pack de 4 correctores de escritura para lápiz. Secado rápido y cobertura uniforme.',2,12.50,100,'./images/product/corrector-escritura-artesco-lapiz-blister-x-4-und.jpg',1);
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

-- Dump completed on 2025-03-10 17:23:30
