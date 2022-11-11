-- CREATE DATABASE  IF NOT EXISTS `0521ptc3n1db_grupo4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `0521PTC3N1db_GRUPO4`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: digitalhouse.cluster-cnyqegjgetrv.us-east-2.rds.amazonaws.com    Database: 0521ptc3n1db_grupo4
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Drops
--
DROP TABLE IF EXISTS `producto_caracteristica`;
DROP TABLE IF EXISTS `imagen`;
DROP TABLE IF EXISTS `producto`;
DROP TABLE IF EXISTS `caracteristica`;
DROP TABLE IF EXISTS `categoria`;
DROP TABLE IF EXISTS `ciudad`;


--
-- Table structure for table `caracteristica`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icono` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `disponible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
INSERT INTO `caracteristica` VALUES (1,'icono1','Piscina',NULL),(2,'icono2','Parrilla',NULL),(3,'icono3','Aire Acondicionado',NULL),(4,'icono4','Wi Fi',NULL);
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'807.105','Casita','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/categorias/casa.jpeg'),(2,'139.578','Departamento','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/categorias/departamento.jpeg'),(3,'567.406','Cabaña','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/categorias/cabana.jpeg'),(4,'89.766','Casa de playa','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/categorias/casa-de-playa.jpeg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Santa Fe','Argentina'),(2,'Ciudad Autónoma de Buenos Aires','Argentina'),(3,'Santa Fe','Argentina'),(4,'Ciudad Autónoma de Buenos Aires','Argentina'),(5,'Mendoza','Argentina'),(6,'Tucumán','Argentina'),(7,'Entre Ríos','Argentina'),(8,'Salta','Argentina'),(9,'Misiones','Argentina'),(10,'Chaco','Argentina'),(11,'Corrientes','Argentina'),(12,'Santiago del Estero','Argentina'),(13,'San Juan','Argentina'),(14,'Jujuy','Argentina'),(15,'Río Negro','Argentina'),(16,'Neuquén','Argentina'),(17,'Formosa','Argentina'),(18,'Chubut','Argentina'),(19,'San Luis','Argentina'),(20,'Catamarca','Argentina'),(21,'La Rioja','Argentina'),(22,'La Pampa','Argentina'),(23,'Santa Cruz','Argentina'),(24,'Tierra del Fuego','Argentina');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `producto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `politica_de_cancelacion` varchar(255) DEFAULT NULL,
  `politica_de_salud_y_seguridad` varchar(255) DEFAULT NULL,
  `politica_de_uso` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria_id` bigint NOT NULL,
  `ciudad_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKodqr7965ok9rwquj1utiamt0m` (`categoria_id`),
  KEY `FKl5u48oo6p0ip3a6y4uv1mts4l` (`ciudad_id`),
  CONSTRAINT `FKl5u48oo6p0ip3a6y4uv1mts4l` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `FKodqr7965ok9rwquj1utiamt0m` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','sf','sdf','sdf','sdf','sdf','Alójate en el corazón de',1,1),(2,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',2,1),(3,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 \n no mascotas','Alójate en el corazón de',3,1),(4,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 \n no mascotas','Alójate en el corazón de',4,2),(5,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 \'\n\' no mascotas','Alójate en el corazón de',1,1),(6,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Cupidatat','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',2,6),(7,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Ullamco','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',3,7),(8,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Tempora','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',4,8),(9,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Suscipit','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',1,9),(10,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Enim','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',2,10),(11,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Odit','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',3,11),(12,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Beatae','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',4,12),(13,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Velitesse','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',1,13),(14,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Commodo','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',2,14),(15,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 \n no mascotas','Alójate en el corazón de',2,1),(16,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','\'checkin a las\', \'no mascotas\'','Alójate en el corazón de',3,1),(17,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Dolor','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',1,17),(18,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Exercitation','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',2,18),(19,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',4,1),(20,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(21,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Cillum','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',1,21),(22,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Vitae','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',2,22),(23,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','A 940 m del centro','Fugiat','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus, Detector de humo, Depósito de seguridad','Check-out: 10:00, No se permiten fiestas, No fumar','Alójate en el corazón de',3,23),(24,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',2,1),(25,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',3,1),(26,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',4,1),(30,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(31,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(32,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(33,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(34,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1),(35,'Lorem consequatur. Si proident but ullam eiusmod. Suscipit quisquam dolore adipisci so nihil ratione and quaerat.','Calle falsa 123','Un Nombre','No se puede cancelar, no hay devolucion','No prender fuego, no fumar','checkin a las 10 no mascotas','Alójate en el corazón de',1,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKckk7k36sck5o201icob6wkc2u` (`producto_id`),
  CONSTRAINT `FKckk7k36sck5o201icob6wkc2u` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (1,'imagen_1','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-1396122.jpeg',35),(2,'imagen_2','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-271618.jpeg',35),(3,'imagen_3','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-10882330.jpeg',35),(4,'imagen_4','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-2476632.jpeg',2),(5,'imagen_5','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-259588.jpeg',3),(6,'imagen_6','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-813692.jpeg',3),(7,'imagen_7','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-9056663.jpeg',4),(8,'imagen_8','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-271643.jpeg',4),(9,'imagen_9','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-5661016.jpeg',5),(10,'imagen_10','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-1910472.jpeg',5),(11,'imagen_11','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-4210373.jpeg',6),(12,'imagen_12','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-1571452.jpeg',6),(13,'imagen_13','https://0521ptc3n1-grupo4-img.s3.us-east-2.amazonaws.com/pexels-photo-6908372.jpeg',7);
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `producto_caracteristica`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_caracteristica` (
  `producto_id` bigint NOT NULL,
  `caracteristica_id` bigint NOT NULL,
  KEY `FKnvjtxia0m1lkhwxkinsyll6ew` (`caracteristica_id`),
  KEY `FKnscvtbxrba4cw9xeop9xsw4et` (`producto_id`),
  CONSTRAINT `FKnscvtbxrba4cw9xeop9xsw4et` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FKnvjtxia0m1lkhwxkinsyll6ew` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_caracteristica`
--

LOCK TABLES `producto_caracteristica` WRITE;
/*!40000 ALTER TABLE `producto_caracteristica` DISABLE KEYS */;
INSERT INTO `producto_caracteristica` VALUES (20,1),(20,2),(20,3),(24,1),(24,2),(24,3),(25,1),(25,2),(25,3),(26,1),(26,2),(26,3),(30,1),(30,2),(30,3),(31,1),(31,2),(31,3),(32,1),(32,2),(32,3),(33,1),(33,2),(33,3),(34,1),(34,2),(34,3),(35,1),(35,2),(35,3);
/*!40000 ALTER TABLE `producto_caracteristica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 18:54:52
