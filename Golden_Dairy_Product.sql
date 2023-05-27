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
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Name` varchar(50) DEFAULT NULL,
  `ID` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Protein` float DEFAULT NULL,
  `Energy` float DEFAULT NULL,
  `Fat` float DEFAULT NULL,
  `Carbohydrate` float DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Availability` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('Full Cream',1,'Milk',33,5,3.5,75,4.5,5,500,500),('Toned Milk',2,'Milk',27,4.2,3.5,35,3,5,500,500),('Cow Milk',3,'Milk',28,4.3,3.1,64,3.6,4.8,500,500),('Buffalo Milk',4,'Milk',35,4,4.5,57.5,1.5,6.5,500,500),('Slim N trim',5,'Milk',24,4,3.5,35,0.1,5,500,500),('Butter',6,'Paneer, Cheese and Butter',56,4.1,0.5,722,80,0,100,500),('Cream cheese',7,'Cream',80,4.1,8,325,32,1.2,200,500),('Processed Cream',8,'Cream',73,4.2,20,314,26,0,200,500),('Processed cheese',9,'Paneer, Cheese and Butter',127,4.1,20,314,26,0,200,500),('Malai Paneer',10,'Paneer, Cheese and Butter',91,3.9,20,323,25,4.5,200,500),('Fresh Paneer',11,'Paneer, Cheese and Butter',87,4,20,296,22,4.5,200,500),('Dahi',12,'Curd',22,4,4,61.5,3.1,4.4,250,500),('Mishti Doi',13,'Curd',20,4.2,3.9,166,6,24.2,80,500),('Premium curd',14,'Curd',60,4.2,1,74.1,4.5,4.4,400,500),('Butterschotch cone',15,'Ice cream',25,4.3,4.9,331,19.9,32.9,120,500),('Choco Crunch cone',16,'Ice Cream',30,4.2,5.1,338,19.5,35.7,120,500),('Two in one cone',17,'Ice Cream',30,3.8,5.1,330,20.3,31.8,120,500),('Black Currant cone',18,'Ice Cream',30,4,5.1,330,20.3,31.8,120,500),('Full Cream',19,'Milk',66,5,3.5,75,4.5,5,1000,500),('Toned Milk',20,'Milk',54,4.2,3.5,35,3,5,1000,500),('Cow Milk',21,'Milk',56,4.3,3.1,64,3.6,4.8,1000,500),('Buffalo Milk ',22,'Milk',70,4,4.5,67.5,1.5,6.5,1000,500),('Slim N Trim',23,'Milk',48,4,3.5,35,0.1,5,1000,500),('Lactose free milk',24,'Milk',25,4.3,3,59,3.1,4.8,250,500),('Lassi',25,'Lassi',23,4.3,2.3,79,2.1,12.8,250,500),('Lassi',26,'Lassi',15,4.3,2.3,79,2.1,12.8,200,500),('Lassi ',27,'Lassi',80,4.3,2.3,79,2.1,12.8,1000,500),('Lassi',28,'Lassi',42,4.3,2.3,79,2.1,12.8,500,500),('Kesar Milk',29,'Flavoured Milkshake',22,4.5,3.2,89,3.1,12,180,500),('Kesar Milk',30,'Flavoured Milkshake',43,4.5,3.2,89,3.1,12,360,500),('Kesar Elaichi',31,'Flavoured Milk',22,4.5,3.2,89,3.1,12,180,500),('Kesar Elaichi',32,'Flavoured Milk',43,4.5,3.2,89,3.1,12,360,500),('Kesar Milk',33,'Flavoured Milk',75,4.5,3.2,89,3.1,12,750,500),('Kesar Elaichi',34,'Flavoured Milk',75,4.5,3.2,89,3.1,12,750,500),('Badam',35,'Flavoured Milk',22,4.1,3.2,89,3.1,12,180,500),('Badam',36,'Flavoured Milk',43,4.1,3.2,89,3.1,12,360,500),('Badam',37,'Flavoured Milk',75,4.1,3.2,89,3.1,12,750,500),('Mango Lassi',38,'Lassi',15,3.9,1.8,76,1.7,13.5,200,500),('Mango Lassi',39,'Lassi',23,3.9,1.8,76,1.7,13.5,250,500),('Mango Lassi ',40,'Lassi ',42,3.9,1.8,76,1.7,13.5,500,500),('Mango Lassi',41,'Lassi',80,3.9,1.8,76,1.7,13.5,1000,500),('Strawberry Lassi',42,'Lassi',15,4.4,1.8,76,1.7,13.5,200,500),('Strawberry Lassi',43,'Lassi ',23,4.4,1.8,76,1.7,13.5,250,500),('Strawberry Lassi',44,'Lassi ',42,4.4,1.8,76,1.7,13.5,500,500),('Strawberry Lassi',45,'Lassi ',80,3.9,1.8,76,1.7,13.5,1000,500),('Rose Lassi',46,'Lassi ',15,3.9,1.8,76,1.7,13.5,200,500),('Rose Lassi',47,'Lassi ',23,3.9,1.8,76,1.7,13.5,250,500),('Rose Lassi',48,'Lassi ',42,3.9,1.8,76,1.7,13.5,500,500),('Rose Lassi',49,'Lassi ',80,3.9,1.8,76,1.7,13.5,1000,500),('Mango milk',50,'Flavoured Milk',22,4,3.2,89,3.1,12,180,500),('Mango milk',51,'Flavoured Milk',43,4,3.2,89,3.1,12,360,500),('Mango milk',52,'Flavoured Milk',75,4,3.2,89,3.1,12,750,500),('Vanilla milkshake',53,'Milkshake',22,3.6,3.2,89,3.1,12,180,500),('Vanilla milkshake',54,'Milkshake',43,3.6,3.2,89,3.1,12,360,500),('Vanilla milkshake',55,'Milkshake',75,3.6,3.2,89,3.1,12,750,500),('Chocolate Milkshake',56,'Milkshake',22,4.8,3.2,89,3.1,12,180,500),('Chocolate Milkshake',57,'Milkshake',43,4.8,3.2,89,3.1,12,360,500),('Chocolate Milkshake',58,'Milkshake',75,4.8,3.2,89,3.1,12,750,500),('Strawberry Milkshake',59,'Milkshake',22,4.3,3.2,89,3.1,12,180,500),('Strawberry Milkshake',60,'Milkshake',43,4.3,3.2,89,3.1,12,360,500),('Strawberry Milkshake',61,'Milkshake',75,4.3,3.2,89,3.1,12,750,500),('Cold coffee',62,'Flavoured Milk',22,4.6,3.2,89,3.1,12,180,500),('Cold coffee',63,'Flavoured Milk',43,4.6,3.2,89,3.1,12,360,500),('Cold coffee',64,'Flavoured Milk',75,4.6,3.2,89,3.1,12,750,500),('Dahi',65,'Curd',36,4,4,61.5,3.1,4.4,400,500),('Mishti Doi',66,'Curd',40,4.2,3.9,166,6,24.2,200,500),('Premium Curd',67,'Curd',100,4.2,1,74.1,4.5,4.4,750,500),('Dahi',68,'Curd',64,4,4,62.5,3.1,4.4,800,500),('Pista Badam Cone',69,'Ice Cream',30,4.4,4.9,331,19.9,32.9,120,500),('Butterschotch Cone',70,'Ice Cream',15,4.3,4.9,331,19.9,32.9,50,500),('Kesar Pista Cone',71,'Ice Cream',30,4.4,4.6,320,19.2,32.2,120,500),('Belgian Chocolate Cone',72,'Ice Cream',40,4.9,4.4,245,12.8,28.2,120,500),('Choco Vanilla Cone',73,'Ice Cream',20,4,4.7,312,16.6,36.1,120,500),('Chocolate Brownie',74,'Ice Cream',30,4.5,4.4,245,12.8,28.2,125,500),('Fruit N Nut Fantasy',75,'Ice Cream',30,4.2,3.9,235,13.5,24.3,125,500),('Choco Truffle ',76,'Ice Cream',40,4.2,4.1,255,14,28.3,80,500),('Choco Almond',77,'Ice Cream',40,4.4,4.7,242,15.2,21.8,80,500),('Choco Cappuccino',78,'Ice Cream',40,4,4.4,251,14.6,24.6,80,500),('Strawberry Twist',79,'Ice Cream',40,4,4.1,230,15.1,24.2,80,500),('Butterscotch Cone',80,'Ice Cream',20,4.3,4.9,331,19.9,32.9,100,500),('Choco Crunch Cone',81,'Ice Cream',20,4.2,5.1,338,19.5,35.7,100,500),('Choco Crunch Cone',82,'Ice Cream',15,4.2,5.1,338,19.5,35.7,50,500),('Two in one cone',83,'Ice Cream',20,3.8,5.1,330,20.3,31.8,100,500),('Two in one cone',84,'Ice Cream',15,3.8,5.1,330,20.3,31.8,50,500),('Black Currant cone',85,'Ice Cream',20,4,5.1,330,20.3,31.8,100,500),('Black Currant cone',86,'Ice Cream',15,4,5.1,330,20.3,31.8,50,500),('Chocobar',87,'Ice Cream',10,4.3,3.7,329,24,24,40,500),('Chocobar',88,'Ice Cream',15,4.3,3.7,329,24,24,60,500),('Mango Ice Cream',89,'Ice Cream',10,3.9,3.5,211,11.7,23.3,40,500),('Orange Ice Cream',90,'Ice Cream',10,3.9,3.5,211,11.7,23.3,40,500),('Mango Ice Cream',91,'Ice Cream',15,3.9,3.5,211,11.7,23.3,60,500),('Orange Ice Cream',92,'Ice Cream',15,3.9,3.5,211,11.7,23.3,60,500),('Chocolate Tub',93,'Ice Cream',150,4.3,4.1,255,14,28.3,1250,500),('Chocolate Tub',94,'Ice Cream',250,4.3,4.1,255,14,28.3,2000,500),('Vanilla Royale',95,'Ice Cream',140,3.8,3.7,219,13,21.8,1250,500),('Vanilla Royale',96,'Ice Cream',230,3.8,3.7,219,13,21.8,2000,500),('Choco Chip Tub',97,'Ice Cream',200,4.4,4.1,255,14,28.3,1250,500),('Choco Chip Tub',98,'Ice Cream',300,4.4,4.1,255,14,28.3,2000,500),('Milk Powder',99,'Milk',26,4,3,71.3,4.5,4.7,50,500),('Milk Powder',100,'Milk',365,4,3,71.3,4.5,4.7,1000,500);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
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
