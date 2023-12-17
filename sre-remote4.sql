-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (arm64)
--
-- Host: localhost    Database: SRE_Remote4
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `Location_Id` int NOT NULL,
  `Location_Title` varchar(50) DEFAULT NULL,
  `Location_City` varchar(50) DEFAULT NULL,
  `Location_Address` varchar(255) DEFAULT NULL,
  `Location_CreatedUser` varchar(255) DEFAULT 'sysadmin',
  `Location_CreatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Location_UpdatedUser` varchar(255) DEFAULT 'sysadmin',
  `Location_UpdatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Location_ValidFlag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Location_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'花蓮物流中⼼','花蓮市','花蓮市國聯⼀路100號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(3,'桃園物流中⼼','桃園市','桃園市中壢區中央⻄路三段150號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(4,'台南物流中⼼','台南市','台南市安平區建平路18號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(6,'宜蘭物流中⼼','宜蘭市','宜蘭市中⼭路⼆段58號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(7,'台北物流中⼼','台北市','台北市中正區忠孝東路100號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(8,'澎湖物流中⼼','澎湖縣','澎湖縣⾺公市中正路200號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(9,'彰化物流中⼼','彰化市','彰化市中⼭路⼆段250號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(11,'南投物流中⼼','南投市','南投市⾃由路67號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(13,'新⽵物流中⼼','新⽵市','新⽵市東區光復路⼀段101號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(14,'基隆物流中⼼','基隆市','基隆市信⼀路50號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(15,'嘉義物流中⼼','嘉義市','嘉義市東區⺠族路380號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(18,'⾼雄物流中⼼','⾼雄市','⾼雄市前⾦區成功⼀路82號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(19,'⾦⾨物流中⼼','⾦⾨縣','⾦⾨縣⾦城鎮⺠⽣路90號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(21,'屏東物流中⼼','屏東市','屏東市⺠⽣路300號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(23,'雲林物流中⼼','雲林市','雲林市中正路五段120號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1),(24,'台中物流中⼼','台中市','台中市⻄區⺠⽣路200號','sysadmin','2023-12-02 18:36:24','sysadmin','2023-12-02 18:36:24',1);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipient`
--

DROP TABLE IF EXISTS `Recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipient` (
  `Recipient_Id` int NOT NULL,
  `Recipient_Name` varchar(100) DEFAULT NULL,
  `Recipient_Address` varchar(255) DEFAULT NULL,
  `Recipient_Phone` varchar(15) DEFAULT NULL,
  `Recipient_CreatedUser` varchar(255) DEFAULT 'sysadmin',
  `Recipient_CreatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Recipient_UpdatedUser` varchar(255) DEFAULT 'sysadmin',
  `Recipient_Updated_Datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Recipient_ValidFlag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Recipient_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipient`
--

LOCK TABLES `Recipient` WRITE;
/*!40000 ALTER TABLE `Recipient` DISABLE KEYS */;
INSERT INTO `Recipient` VALUES (1234,'賴⼩賴','台北市中正區仁愛路⼆段99號','091234567','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1235,'陳⼤明','新北市板橋區⽂化路⼀段100號','092345678','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1236,'林⼩芳','台中市⻄區⺠⽣路200號','093456789','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1237,'張美玲','⾼雄市前⾦區成功⼀路82號','094567890','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1238,'王⼩明','台南市安平區建平路18號','095678901','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1239,'劉⼤華','新⽵市東區光復路⼀段101號','096789012','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1240,'⿈⼩琳','彰化市中⼭路⼆段250號','097890123','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1241,'吳美美','花蓮市國聯⼀路100號','098901234','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1242,'蔡⼩虎','屏東市⺠⽣路300號','099012345','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1243,'鄭⼤勇','基隆市信⼀路50號','091123456','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1244,'謝⼩珍','嘉義市東區⺠族路380號','092234567','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1245,'潘⼤為','宜蘭市中⼭路⼆段58號','093345678','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1246,'趙⼩梅','南投市⾃由路67號','094456789','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1247,'周⼩⿓','雲林市中正路五段120號','095567890','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1248,'李⼤同','澎湖縣⾺公市中正路200號','096678901','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1249,'陳⼩凡','⾦⾨縣⾦城鎮⺠⽣路90號','097789012','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1250,'楊⼤明','台北市信義區松仁路50號','098890123','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1),(1251,'吳⼩雯','新北市中和區景平路100號','099901234','sysadmin','2023-12-02 18:37:24','sysadmin','2023-12-02 18:37:24',1);
/*!40000 ALTER TABLE `Recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipping_Info`
--

DROP TABLE IF EXISTS `Shipping_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipping_Info` (
  `ShippingInfo_Id` int NOT NULL AUTO_INCREMENT,
  `ShippingInfo_SNO` varchar(20) DEFAULT NULL,
  `ShippingInfo_RecipientId` int DEFAULT NULL,
  `ShippingInfo_CreatedUser` varchar(255) DEFAULT 'sysadmin',
  `ShippingInfo_CreatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ShippingInfo_UpdatedUser` varchar(255) DEFAULT 'sysadmin',
  `ShippingInfo_Updated_Datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ShippingInfo_ValidFlag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ShippingInfo_Id`),
  UNIQUE KEY `ShippingInfo_SNO` (`ShippingInfo_SNO`),
  KEY `ShippingInfo_RecipientId` (`ShippingInfo_RecipientId`),
  CONSTRAINT `shipping_info_ibfk_1` FOREIGN KEY (`ShippingInfo_RecipientId`) REFERENCES `Recipient` (`Recipient_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipping_Info`
--

LOCK TABLES `Shipping_Info` WRITE;
/*!40000 ALTER TABLE `Shipping_Info` DISABLE KEYS */;
INSERT INTO `Shipping_Info` VALUES (1,'SNO1',1234,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(2,'SNO2',1235,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(3,'SNO3',1236,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(4,'SNO4',1237,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(5,'SNO5',1238,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(6,'SNO6',1239,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(7,'SNO7',1240,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(8,'SNO8',1241,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(9,'SNO9',1242,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(10,'SNO10',1243,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(11,'SNO11',1244,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(12,'SNO12',1245,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(13,'SNO13',1246,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(14,'SNO14',1247,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(15,'SNO15',1248,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(16,'SNO16',1249,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(17,'SNO17',1250,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(18,'SNO18',1251,'sysadmin','2023-12-03 06:31:50','sysadmin','2023-12-03 06:31:50',1),(20,'SNO94',1238,'sysadmin','2023-12-03 11:12:36','sysadmin','2023-12-03 11:12:36',1),(21,'SNO69',1239,'sysadmin','2023-12-03 11:14:11','sysadmin','2023-12-03 11:14:11',1),(22,'SNO52',1238,'sysadmin','2023-12-03 11:17:22','sysadmin','2023-12-03 11:17:22',1),(24,'SNO59',1235,'sysadmin','2023-12-03 15:20:18','sysadmin','2023-12-03 15:20:18',1);
/*!40000 ALTER TABLE `Shipping_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Test` (
  `id` int NOT NULL,
  `Test_Col1` varchar(50) DEFAULT NULL,
  `Col2` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES (1,'FakeData1',100),(2,'FakeData2',200),(3,'FakeData3',300),(4,'FakeData4',400),(5,'FakeData5',500);
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test_Taker`
--

DROP TABLE IF EXISTS `Test_Taker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Test_Taker` (
  `TestTaker_Id` int NOT NULL AUTO_INCREMENT,
  `TestTaker_Name` varchar(50) DEFAULT NULL,
  `TestTaker_Gender` varchar(50) DEFAULT NULL,
  `TestTaker_CreatedUser` varchar(255) DEFAULT 'sysadmin',
  `TestTaker_CreatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `TestTaker_UpdatedUser` varchar(255) DEFAULT 'sysadmin',
  `TestTaker_UpdatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `TestTaker_ValidFlag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`TestTaker_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test_Taker`
--

LOCK TABLES `Test_Taker` WRITE;
/*!40000 ALTER TABLE `Test_Taker` DISABLE KEYS */;
INSERT INTO `Test_Taker` VALUES (1,'John Doe','Male','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(2,'Jane Smith','Female','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(3,'Alex Johnson','Male','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(4,'Emily Davis','Female','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(5,'Michael Brown','Male','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(6,'Sophia White','Female','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(7,'David Miller','Male','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(8,'Olivia Taylor','Female','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(9,'William Wilson','Male','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1),(10,'Ava Anderson','Female','sysadmin','2023-12-03 06:58:18','sysadmin','2023-12-03 06:58:18',1);
/*!40000 ALTER TABLE `Test_Taker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tracking_Event`
--

DROP TABLE IF EXISTS `Tracking_Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tracking_Event` (
  `TrackingEvent_Id` int NOT NULL AUTO_INCREMENT,
  `TrackingEvent_ShippingInfoSNO` varchar(20) DEFAULT NULL,
  `TrackingEvent_Date` date DEFAULT NULL,
  `TrackingEvent_Time` time DEFAULT NULL,
  `TrackingEvent_status` varchar(50) DEFAULT NULL,
  `TrackingEvent_LocationId` int DEFAULT NULL,
  `TrackingEvent_CreatedUser` varchar(255) DEFAULT 'sysadmin',
  `TrackingEvent_CreatedDatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `TrackingEvent_UpdatedUser` varchar(255) DEFAULT 'sysadmin',
  `TrackingEvent_Updated_Datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `TrackingEvent_ValidFlag` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`TrackingEvent_Id`),
  KEY `TrackingEvent_LocationId` (`TrackingEvent_LocationId`),
  CONSTRAINT `tracking_event_ibfk_1` FOREIGN KEY (`TrackingEvent_LocationId`) REFERENCES `Location` (`Location_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tracking_Event`
--

LOCK TABLES `Tracking_Event` WRITE;
/*!40000 ALTER TABLE `Tracking_Event` DISABLE KEYS */;
INSERT INTO `Tracking_Event` VALUES (1,'SNO1','2023-01-01','08:00:00','Created',1,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(2,'SNO1','2023-01-02','09:30:00','Package Received',3,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(3,'SNO1','2023-01-03','12:45:00','In Transit',4,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(4,'SNO1','2023-01-04','15:20:00','Out for Delivery',6,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(5,'SNO1','2023-01-05','17:45:00','Delivery Attempted',7,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(6,'SNO1','2023-01-06','18:30:00','Delivered',8,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(7,'SNO1','2023-01-07','19:15:00','Returned to Sender',9,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(8,'SNO1','2023-01-08','20:00:00','Exception',11,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(9,'SNO2','2023-01-01','08:00:00','Created',1,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(10,'SNO2','2023-01-02','09:30:00','Package Received',3,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(11,'SNO2','2023-01-03','12:45:00','In Transit',4,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(12,'SNO2','2023-01-04','15:20:00','Out for Delivery',6,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(13,'SNO2','2023-01-05','17:45:00','Delivery Attempted',7,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(14,'SNO2','2023-01-06','18:30:00','Delivered',8,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(15,'SNO2','2023-01-07','19:15:00','Returned to Sender',9,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(16,'SNO2','2023-01-08','20:00:00','Exception',11,'sysadmin','2023-12-02 19:32:10','sysadmin','2023-12-02 19:32:10',1),(17,'SNO52','2023-04-04','01:40:52','Delivered',3,'sysadmin','2023-12-03 11:17:22','sysadmin','2023-12-03 11:17:22',1),(19,'SNO59','2023-06-01','22:51:57','Delivered',9,'sysadmin','2023-12-03 15:20:18','sysadmin','2023-12-03 15:20:18',1);
/*!40000 ALTER TABLE `Tracking_Event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11  2:13:24
