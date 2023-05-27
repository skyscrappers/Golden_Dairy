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
-- Table structure for table `New_order`
--

DROP TABLE IF EXISTS `New_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `New_order` (
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `New_order_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`Order_ID`),
  CONSTRAINT `New_order_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `New_order`
--

LOCK TABLES `New_order` WRITE;
/*!40000 ALTER TABLE `New_order` DISABLE KEYS */;
INSERT INTO `New_order` VALUES (22,17,5),(60,94,4),(27,95,8),(65,40,9),(80,40,4),(96,10,1),(12,90,5),(75,32,3),(3,70,7),(80,96,6),(38,63,2),(87,99,8),(58,29,10),(39,60,8),(40,10,5),(56,56,7),(71,26,3),(98,30,3),(27,27,8),(62,28,3),(67,77,10),(71,90,4),(44,13,1),(50,85,1),(36,26,3),(60,80,5),(84,94,8),(68,16,10),(34,22,5),(71,55,1),(53,44,1),(15,80,4),(26,29,5),(38,79,4),(20,34,7),(50,18,9),(54,3,2),(16,91,8),(60,47,2),(45,58,9),(58,19,9),(27,43,5),(94,16,4),(75,64,1),(44,47,6),(57,41,3),(74,21,9),(41,30,8),(49,85,4),(86,3,10),(66,82,2),(15,52,7),(41,87,3),(52,28,9),(84,11,3),(96,73,10),(42,92,2),(98,87,1),(80,46,10),(99,33,8),(97,76,2),(52,25,6),(24,61,7),(11,75,9),(21,4,8),(86,97,9),(69,82,7),(4,4,1),(8,12,10),(4,33,1),(13,36,8),(56,25,6),(31,49,10),(38,86,7),(59,59,10),(96,22,6),(80,30,2),(74,15,2),(58,17,6),(21,75,8),(15,51,4),(84,43,5),(84,94,5),(83,80,1),(99,4,6),(56,90,9),(72,31,10),(73,35,4),(63,82,4),(68,90,4),(59,46,3),(73,56,9),(87,97,6),(70,60,3),(92,15,9),(66,49,10),(89,20,7),(75,56,8),(37,42,5),(52,66,5),(79,83,1);
/*!40000 ALTER TABLE `New_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-25 23:52:46
