-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: smallplanet
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `ref` int NOT NULL,
  `is_comment` int NOT NULL,
  `is_comment_reply` int NOT NULL,
  `subject` varchar(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `writer` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `fileName` text,
  `fileSize` int DEFAULT '0',
  `uploadDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime DEFAULT NULL,
  `depth` int NOT NULL,
  `cnt` int DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (2,2,0,0,'일상','ㅇㄺㅇ','ㄴㅇㄹㅇㄴㄹ','ㄴㅇㄹㄴㅇㄹ',NULL,0,'2022-06-14 14:19:56',NULL,0,1),(3,3,0,0,'일상','ㄹㄴㄹㄴㅇㄹ','ㄴㄹㄴㅇㄹㄴ','ㄴㄹㅇㅇㄹ',NULL,0,'2022-06-14 14:32:36',NULL,0,2),(4,4,0,0,'공지사항','호ㅓ허','허호ㅓㄴ','호ㅓㅗㅓ호','111.PNG',1811,'2022-06-14 14:33:18',NULL,0,9),(5,5,0,0,'도움','test','fghfgh','<p>test</p>',NULL,0,'2022-06-14 17:57:40',NULL,0,0),(6,6,0,0,'도움','수정','null','<p></p><p>수정</p><p><img src=\"data:image/png;base64,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\" style=\"width: 933.344px;\" data-filename=\"modal_style.PNG\"></p>',NULL,0,'2022-06-15 17:27:38',NULL,0,0),(7,1,0,0,'도움','write','fff@qqq.com','<p>write</p>',NULL,0,'2022-06-18 13:31:10',NULL,0,0),(8,1,0,0,'도움','write','fff@qqq.com','<p>write</p>',NULL,0,'2022-06-18 13:34:41',NULL,0,0),(9,9,0,0,'도움','w','fff@qqq.com','<p>w</p>',NULL,0,'2022-06-18 13:36:45',NULL,0,0),(10,10,0,0,'도움','reply','fff@qqq.com','<p>reply</p>',NULL,0,'2022-06-18 15:01:26',NULL,0,0),(11,11,0,0,'도움','reply1','fff@qqq.com','<p>reply1</p>',NULL,0,'2022-06-18 15:17:08',NULL,0,0),(12,12,0,0,'도움','r2','fff@qqq.com','<p>r</p>',NULL,0,'2022-06-18 15:22:39','2022-06-18 17:44:23',0,0),(13,12,0,0,'도움','ttt','fff@qqq.com','<p>ttt</p>',NULL,0,'2022-06-18 15:34:10',NULL,1,0),(14,12,0,0,'도움','fff','fff@qqq.com','<p>fff</p>',NULL,0,'2022-06-18 15:34:25',NULL,1,0),(15,12,1,0,'공지사항',NULL,'fff@qqq.com','re',NULL,0,'2022-06-18 17:03:24',NULL,0,0),(16,12,1,0,'공지사항',NULL,'fff@qqq.com','rrrrrrr',NULL,0,'2022-06-18 17:08:52',NULL,0,0),(17,11,0,0,'도움','ggg','fff@qqq.com','<p>ggg</p>',NULL,0,'2022-06-19 11:55:00',NULL,1,0),(19,19,0,0,'일상','fsdfsdfdsf','fff@qqq.com','<p>fdsdfdsf</p>',NULL,0,'2022-06-20 18:23:31',NULL,0,0),(21,21,0,0,'일상','jkggjjh','fff@qqq.com','<p>jhgjghjghj</p>',NULL,0,'2022-06-20 18:23:51',NULL,0,0),(22,21,0,0,'일상','gsgf','fff@qqq.com','<p>fgfdgfgd</p>',NULL,0,'2022-06-20 18:24:55',NULL,1,0),(23,23,0,0,'일상','gdfgdfgfd','fff@qqq.com','<p>dfgfdfgfdgdf</p>',NULL,0,'2022-06-20 18:25:04',NULL,0,0),(24,23,0,0,'일상','hjtyryry','fff@qqq.com','<p>yrtyrtytr</p>',NULL,0,'2022-06-20 18:25:24',NULL,1,0),(25,23,0,0,'일상','trytfytry','fff@qqq.com','<p>fyfty</p>',NULL,0,'2022-06-20 18:25:34',NULL,1,2),(26,26,0,0,'일상','dsfsdf','fff@qqq.com','<p>fdsfdsfds</p>',NULL,0,'2022-06-20 18:26:32',NULL,0,7);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databoard`
--

DROP TABLE IF EXISTS `databoard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databoard` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `ref` int NOT NULL,
  `is_comment` int NOT NULL,
  `is_comment_reply` int NOT NULL,
  `subject` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `fileName` text,
  `fileSize` int DEFAULT '0',
  `uploadDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime DEFAULT NULL,
  `depth` int NOT NULL,
  `cnt` int DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databoard`
--

LOCK TABLES `databoard` WRITE;
/*!40000 ALTER TABLE `databoard` DISABLE KEYS */;
INSERT INTO `databoard` VALUES (1,1,0,0,'공지사항','ㅘㅑㅕ햐ㅏ','fff@qqq.com','<p>ㅏㅗㅓㅏㅗㅓㅏㅗㅓㅏ</p>','캡처.PNG',95842,'2022-06-20 20:10:56',NULL,0,0);
/*!40000 ALTER TABLE `databoard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiryboard`
--

DROP TABLE IF EXISTS `inquiryboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiryboard` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `fileName` text,
  `fileSize` int DEFAULT '0',
  `uploadDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` varchar(20) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiryboard`
--

LOCK TABLES `inquiryboard` WRITE;
/*!40000 ALTER TABLE `inquiryboard` DISABLE KEYS */;
INSERT INTO `inquiryboard` VALUES (2,'qqq','fff@qqq.com','1231456456','qqq',NULL,0,'2022-06-20 10:43:51','0:0:0:0:0:0:0:1'),(3,'jkjkl','fff@qqq.com','2323232','dgfdfg',NULL,0,'2022-06-21 17:13:06','0:0:0:0:0:0:0:1'),(4,'gff','vbn@ffff.com','665565','gfdg',NULL,0,'2022-06-21 17:13:51','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `inquiryboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnaboard`
--

DROP TABLE IF EXISTS `qnaboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qnaboard` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `ref` int NOT NULL,
  `is_comment` int NOT NULL,
  `is_comment_reply` int NOT NULL,
  `subject` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `fileName` text,
  `fileSize` int DEFAULT '0',
  `uploadDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime DEFAULT NULL,
  `depth` int NOT NULL,
  `cnt` int DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnaboard`
--

LOCK TABLES `qnaboard` WRITE;
/*!40000 ALTER TABLE `qnaboard` DISABLE KEYS */;
INSERT INTO `qnaboard` VALUES (1,1,0,0,'자료요청','question','fff@qqq.com','<p>qqq</p>',NULL,0,'2022-06-19 12:33:28',NULL,0,0),(2,1,0,0,'자료요청','ㅅㄳㄳ','fff@qqq.com','<p>ㅅㄳㅅㄳㅅ</p>',NULL,0,'2022-06-20 20:05:45',NULL,1,0);
/*!40000 ALTER TABLE `qnaboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `authority` varchar(10) NOT NULL DEFAULT 'guest',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aaa@aaa.com','asd','123asd!@','1999-02-23','2022-06-17 18:21:34','guest'),('fff@qqq.com','fff','a12345678!','2323-11-11','2022-06-10 16:25:49','admin'),('hhh@rrr.com','hhh','q12345678!','2020-01-01','2022-06-15 16:00:39','guest'),('rrrr@qqq.com','rrrr','1234','1414-11-12','2022-06-13 11:40:18','guest'),('ttt@qqq.com','ttt','1234','1515-12-22','2022-06-13 11:43:05','guest');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 17:23:56
