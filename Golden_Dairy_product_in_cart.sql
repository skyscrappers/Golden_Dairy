-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Golden_Dairy
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `product_in_cart`
--

DROP TABLE IF EXISTS `product_in_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_in_cart` (
  `Product_ID` int DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `Product_ID` (`Product_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `product_in_cart_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`ID`),
  CONSTRAINT `product_in_cart_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `Customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_cart`
--

LOCK TABLES `product_in_cart` WRITE;
/*!40000 ALTER TABLE `product_in_cart` DISABLE KEYS */;
INSERT INTO `product_in_cart` VALUES (1,1,10),(2,1,8),(3,1,9),(3,2,7),(4,2,10),(5,3,10),(6,3,9),(1,70,4),(68,80,10),(60,53,5),(73,55,10),(55,84,6),(60,25,10),(4,40,6),(70,79,2),(60,93,1),(58,41,8),(60,91,8),(32,6,8),(46,68,3),(50,99,2),(21,72,6),(54,68,3),(92,24,5),(3,45,9),(68,57,4),(44,65,10),(85,9,6),(22,19,7),(71,20,2),(93,72,6),(1,75,5),(82,100,8),(37,83,10),(90,83,1),(11,85,4),(48,66,7),(88,62,5),(66,69,3),(68,22,1),(40,5,5),(62,30,8),(42,31,4),(23,93,1),(56,98,4),(64,2,5),(8,63,8),(47,4,7),(91,1,4),(67,41,6),(65,30,3),(47,24,6),(90,64,2),(10,63,8),(88,60,9),(68,31,1),(93,96,10),(76,10,1),(37,41,4),(43,72,5),(35,59,10),(33,32,10),(83,75,8),(50,85,9),(100,7,6),(13,75,8),(11,9,5),(80,66,5),(74,71,8),(46,75,2),(82,56,9),(79,22,8),(52,18,5),(30,24,1),(10,84,1),(74,84,4),(92,95,4),(36,45,5),(60,53,10),(41,34,10),(39,60,8),(36,66,10),(62,23,8),(79,30,2),(92,38,7),(48,21,10),(92,15,3),(44,58,4),(24,81,8),(93,84,10),(5,75,9),(6,59,10),(64,4,5),(42,51,9),(47,82,8),(90,80,2),(41,52,7),(51,59,7),(26,65,7),(15,3,7),(18,79,3),(88,32,9),(86,50,7),(76,23,3),(53,35,2),(25,55,5),(31,69,5);
/*!40000 ALTER TABLE `product_in_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 19:03:52
