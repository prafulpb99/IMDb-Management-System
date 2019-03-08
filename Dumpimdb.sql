CREATE DATABASE  IF NOT EXISTS `imdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `imdb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: imdb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `awards` (
  `awardId` int(11) NOT NULL,
  `movie_Id` int(11) NOT NULL,
  `movie_title` varchar(45) DEFAULT NULL,
  `award_title` varchar(150) DEFAULT NULL,
  `award_year` year(4) DEFAULT NULL,
  PRIMARY KEY (`awardId`,`movie_Id`),
  KEY `movie_Id` (`movie_Id`),
  CONSTRAINT `movie_Id` FOREIGN KEY (`movie_Id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,1,'Iron Man','Top Box Office Films',2009),(2,2,'Batman Begins','Actor of the Year',2009),(3,1,'Iron Man','Outstanding Achievement in Sound Mixing for Motion Pictures',2009),(4,2,'Batman Begins','Best Fantasy Film',2006),(5,2,'Batman Begins','Saturn Award Best Actor',2006),(6,3,'The Incredible Hulk','Best Supporting Actor',2008),(7,5,'Ant-Man','Top Box Office Films',2006),(8,4,'Spider-Man','Best Cinematography',2005);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cast` (
  `castId` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`castId`),
  UNIQUE KEY `name_UNIQUE` (`Fname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (1,'Robert','Downey Jr.','1965-4-4','M'),(2,'Gwyneth','Paltrow','1972-08-27','F'),(3,'Christian','Bale','1974-01-30','M'),(4,'Katie','Holmes','1978-12-18','F'),(5,'Praful','Badami','1995-04-20','M'),(6,'Pranav','Badami','1999-07-19','M');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_bridge`
--

DROP TABLE IF EXISTS `cast_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cast_bridge` (
  `movie_id` int(11) NOT NULL,
  `castId` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`castId`),
  KEY `actor_id_idx` (`castId`),
  CONSTRAINT `cast_id` FOREIGN KEY (`castId`) REFERENCES `cast` (`castid`),
  CONSTRAINT `cast_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_bridge`
--

LOCK TABLES `cast_bridge` WRITE;
/*!40000 ALTER TABLE `cast_bridge` DISABLE KEYS */;
INSERT INTO `cast_bridge` VALUES (1,1),(3,1),(1,2),(2,3),(2,4),(5,4),(3,5),(1,6),(5,6);
/*!40000 ALTER TABLE `cast_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_role_bridge`
--

DROP TABLE IF EXISTS `cast_role_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cast_role_bridge` (
  `castid` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`castid`,`roleId`),
  KEY `castId_idx` (`castid`),
  KEY `roleId_idx` (`roleId`),
  CONSTRAINT `castId` FOREIGN KEY (`castid`) REFERENCES `cast` (`castid`) ON UPDATE CASCADE,
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_role_bridge`
--

LOCK TABLES `cast_role_bridge` WRITE;
/*!40000 ALTER TABLE `cast_role_bridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `cast_role_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_UNIQUE` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (7,'ARGENTINA'),(6,'BRAZIL'),(9,'CHINA'),(5,'ENGLAND'),(3,'GERMANY'),(2,'INDIA'),(4,'ITALY'),(8,'JAPAN'),(1,'USA');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director_bridge`
--

DROP TABLE IF EXISTS `director_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `director_bridge` (
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `fk_director_id_idx` (`director_id`),
  CONSTRAINT `dir_director_id` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`),
  CONSTRAINT `dir_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director_bridge`
--

LOCK TABLES `director_bridge` WRITE;
/*!40000 ALTER TABLE `director_bridge` DISABLE KEYS */;
INSERT INTO `director_bridge` VALUES (1,1),(2,1),(3,4),(4,6),(5,10);
/*!40000 ALTER TABLE `director_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (8,'\n Akira Kurosowa'),(3,'\n Ang Lee'),(6,'\n Chris Nolan'),(5,'\n David Lean'),(9,'\n John Ford'),(10,'\n Sergio Leone'),(4,'\n Stanley Kubrick'),(7,'\n Stephen Spielberg'),(2,'Cecil B. Demille'),(1,'Frank Capra');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_bridge`
--

DROP TABLE IF EXISTS `genre_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genre_bridge` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `fk_genre_id_idx` (`genre_id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genreid`),
  CONSTRAINT `genre_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_bridge`
--

LOCK TABLES `genre_bridge` WRITE;
/*!40000 ALTER TABLE `genre_bridge` DISABLE KEYS */;
INSERT INTO `genre_bridge` VALUES (1,1),(2,1),(5,1),(1,2),(5,2),(1,3),(2,3),(4,3),(5,3),(3,4),(5,4),(3,5),(4,5),(3,6),(4,7),(1,10);
/*!40000 ALTER TABLE `genre_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `genreName` varchar(45) NOT NULL,
  `genreDesc` tinytext,
  PRIMARY KEY (`genreId`),
  UNIQUE KEY `name_UNIQUE` (`genreName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'ROMANCE','ROMANCE and and and ROMANCE'),(2,'\nDRAMA','DRAMA and and and DRAMA'),(3,'\nCOMMEDY','COMEDY and and and COMEDY'),(4,'\nACTION','Action and nand and Action'),(5,'\nADVENTURE','adventure and and adv'),(6,'\nSCI-FI','hello scifi'),(7,'\nMUSICAL','i love music'),(8,'THRILLER','thrilled'),(9,'HORROR','do not watch alone'),(10,'FANTASY','wow wow wow');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_bridge`
--

DROP TABLE IF EXISTS `language_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `language_bridge` (
  `movie_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_id`),
  KEY `fk_language_id_idx` (`language_id`),
  CONSTRAINT `lan_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `lan_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_bridge`
--

LOCK TABLES `language_bridge` WRITE;
/*!40000 ALTER TABLE `language_bridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_UNIQUE` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (5,'Arabic'),(7,'Bengali'),(1,'Chinese'),(3,'English'),(4,'Hindi'),(9,'Japanese'),(6,'Portuguese'),(8,'Russian'),(2,'Spanish');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movie_award_view`
--

DROP TABLE IF EXISTS `movie_award_view`;
/*!50001 DROP VIEW IF EXISTS `movie_award_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `movie_award_view` AS SELECT 
 1 AS `movie_Id`,
 1 AS `title`,
 1 AS `award_title`,
 1 AS `award_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `movie_cast_view`
--

DROP TABLE IF EXISTS `movie_cast_view`;
/*!50001 DROP VIEW IF EXISTS `movie_cast_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `movie_cast_view` AS SELECT 
 1 AS `movie_id`,
 1 AS `title`,
 1 AS `Fname`,
 1 AS `lname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `movie_countries_view`
--

DROP TABLE IF EXISTS `movie_countries_view`;
/*!50001 DROP VIEW IF EXISTS `movie_countries_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `movie_countries_view` AS SELECT 
 1 AS `movie_id`,
 1 AS `title`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie_country`
--

DROP TABLE IF EXISTS `movie_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_country` (
  `movie_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`country_id`),
  KEY `fk_country_id_idx` (`country_id`),
  CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `country_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_country`
--

LOCK TABLES `movie_country` WRITE;
/*!40000 ALTER TABLE `movie_country` DISABLE KEYS */;
INSERT INTO `movie_country` VALUES (1,1),(4,1),(2,2),(3,2),(5,5);
/*!40000 ALTER TABLE `movie_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movies` (
  `movie_Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `released` date DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `votes` int(11) NOT NULL,
  PRIMARY KEY (`movie_Id`),
  KEY `by_movies_name` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Iron Man','2008-05-02','02:06:00','4',821158),(2,'Batman Begins','2005-06-15','02:20:00','5',1157091),(3,'The Incredible Hulk','2018-06-13','01:52:00','4',382639),(4,'Spider-Man','2002-05-03','02:01:00','4',622355),(5,'Ant-Man','2015-07-17','01:57:00','4',460748),(6,'Wonder Women','2017-06-02','02:21:00','5',451075),(7,'Wonder Women','2017-06-02','02:21:00','5',451075),(8,'Wonder Women','2017-06-02','02:21:00','5',451075),(9,'Wonder Women','2017-06-02','02:21:00','5',451075),(10,'iron man 2','2017-06-02','02:21:00','5',451075),(11,'Dr Strange','2019-06-02','02:21:00','3',451075),(12,'Dr Strange','2019-05-02','02:06:00','4',921158);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tblmoviesauditInsert` BEFORE INSERT ON `movies` FOR EACH ROW Begin
 
insert into tblmoviesaudit
(
 movie_Id,
actionPerformed ,
updatedBy,
updatedOn) values (NEW.movie_Id,"INSERT",user(),now());
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tblmoviesauditUpdate` BEFORE UPDATE ON `movies` FOR EACH ROW Begin
 
insert into tblmoviesaudit
(
 movie_Id,
actionPerformed ,
updatedBy,
updatedOn) values (OLD.movie_Id,"UPDATE",user(),now());
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tblmoviesauditDetete` BEFORE DELETE ON `movies` FOR EACH ROW Begin
 
insert into tblmoviesaudit
(
 movie_Id,
actionPerformed ,
updatedBy,
updatedOn) values (OLD.movie_Id,"DELETE",user(),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plots`
--

DROP TABLE IF EXISTS `plots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plots` (
  `plotId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `plot` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`plotId`,`movieId`),
  KEY `plot_movie_id` (`movieId`),
  CONSTRAINT `plot_movie_id` FOREIGN KEY (`movieId`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plots`
--

LOCK TABLES `plots` WRITE;
/*!40000 ALTER TABLE `plots` DISABLE KEYS */;
INSERT INTO `plots` VALUES (1,1,'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.'),(2,1,'ony Stark. Genius, billionaire, playboy, philanthropist. Son of legendary inventor and weapons contractor Howard Stark.'),(3,2,'After being kidnapped by a powerful terrorist organization, brilliant industrialist'),(4,2,'Upon returning home, he devotes all of his time and resources to perfecting the iron man suit, and using it to fight evil, sometimes in the place where he least expects it.'),(5,2,'with a chest full of shrapnel and a car battery attached to his heart. In order to survive he comes up with a way to miniaturize the battery and figures out that the battery can power something else. ');
/*!40000 ALTER TABLE `plots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posters` (
  `poster_id` varchar(45) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`poster_id`,`movie_id`),
  KEY `poster_movie_id` (`movie_id`),
  CONSTRAINT `poster_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES ('1',1,'http://www.TopBoxOfficeFilms.com'),('2',2,'http://www.Tsbfksvnksvksvksk.com'),('3',1,'http://www.akdbvbudyvbkksk.com'),('4',2,'http://www.akdbjsfbjsbvjsmk.com'),('5',2,'http://www.qwweerjsmk.com'),('6',3,'http://www.sbvvsbv ,zs.com'),('7',5,'http://www.qdfndkjndkfkdk.com'),('8',4,'http://www.sbfuebfksdkbskv.com');
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_desc` tinytext,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmoviesaudit`
--

DROP TABLE IF EXISTS `tblmoviesaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblmoviesaudit` (
  `movieAuditID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_Id` int(11) DEFAULT NULL,
  `actionPerformed` varchar(20) DEFAULT NULL,
  `updatedBy` varchar(20) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`movieAuditID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmoviesaudit`
--

LOCK TABLES `tblmoviesaudit` WRITE;
/*!40000 ALTER TABLE `tblmoviesaudit` DISABLE KEYS */;
INSERT INTO `tblmoviesaudit` VALUES (1,12,'DELETE','root@localhost','2018-12-13 01:21:37'),(2,12,'INSERT','root@localhost','2018-12-13 01:22:17'),(3,11,'UPDATE','root@localhost','2018-12-13 01:24:59');
/*!40000 ALTER TABLE `tblmoviesaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer_bridge`
--

DROP TABLE IF EXISTS `writer_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `writer_bridge` (
  `movie_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`writer_id`),
  KEY `fk_writer_id_idx` (`writer_id`),
  CONSTRAINT `writer_id` FOREIGN KEY (`writer_id`) REFERENCES `writers` (`id`),
  CONSTRAINT `writer_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer_bridge`
--

LOCK TABLES `writer_bridge` WRITE;
/*!40000 ALTER TABLE `writer_bridge` DISABLE KEYS */;
INSERT INTO `writer_bridge` VALUES (1,1),(4,1),(2,2),(3,2),(5,4);
/*!40000 ALTER TABLE `writer_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writers`
--

DROP TABLE IF EXISTS `writers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `writers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writers`
--

LOCK TABLES `writers` WRITE;
/*!40000 ALTER TABLE `writers` DISABLE KEYS */;
INSERT INTO `writers` VALUES (3,'Ingmar Bergman'),(4,'Jeffrey Boam'),(2,'Judd Apatow'),(1,'Pedro Almodovar');
/*!40000 ALTER TABLE `writers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'imdb'
--

--
-- Dumping routines for database 'imdb'
--
/*!50003 DROP FUNCTION IF EXISTS `CastAge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CastAge`(dob date) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE age varchar(10);
 
   
   set age=Date_format( From_Days( To_Days(Curdate()) - To_Days(dob) ), '%Y' ) + 0 ;
 
 RETURN (age);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `MovieRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `MovieRating`(movie_class ENUM('1','2','3','4','5')) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE rating varchar(10);
 
    IF movie_class = '5'THEN
 SET rating = 'PLATINUM';
    ELSEIF (movie_class ='4' AND movie_class = '5') THEN
        SET rating = 'GOLD';
    ELSE  
        SET rating = 'SILVER';
    END IF;
 
 RETURN (rating);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Award_set_Movie_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Award_set_Movie_name`()
BEGIN
 DECLARE done INT DEFAULT 0;
 DECLARE id INT;
 DECLARE set_title CURSOR FOR SELECT movie_Id from awards WHERE movie_title IS NULL; 
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN set_title;

search_loop: LOOP
 IF done THEN
 LEAVE search_loop;
 END IF;
 FETCH set_title INTO id;
 UPDATE awards SET movie_title = (SELECT title from movies WHERE movie_Id = id)
WHERE movie_Id = id;
 END LOOP;

close set_title;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_movie_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_movie_list`(INOUT movie_list varchar(4000))
BEGIN
 
 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_movie varchar(100) DEFAULT "";
 
 -- declare cursor for employee email
 DEClARE movie_cursor CURSOR FOR 
 SELECT title FROM movies;
 
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 OPEN movie_cursor;
 
 get_movie: LOOP
 
 FETCH movie_cursor INTO v_movie;
 
 IF v_finished = 1 THEN 
 LEAVE get_movie;
 END IF;
 
 -- build email list
 SET movie_list = CONCAT(v_movie,";",movie_list);
 
 END LOOP get_movie;
 
 CLOSE movie_cursor;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(IN user_nm CHAR(20), IN user_ps CHAR(20))
BEGIN

 SET @host_name := 'localhost';
 SET @user_name := user_nm;
 SET @pass := user_ps;

 SET @db_nm:='imdb';

SET @sql:= CONCAT("CREATE USER ", QUOTE(@user_name), "@", QUOTE(@host_name), "IDENTIFIED BY ", QUOTE(@pass));
PREPARE stmt FROM @sql;
EXECUTE stmt;

SET @GRANT_PERMISSIONS = CONCAT("GRANT ALL  ON ", @db_nm, ".* TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
PREPARE statement FROM @GRANT_PERMISSIONS;
EXECUTE statement;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Report_Awards_Year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Report_Awards_Year`(IN yr year)
BEGIN
SELECT movies.movie_Id, movies.title, awards.award_title,awards.award_year
FROM movies
INNER JOIN awards
 on movies.movie_Id = awards.movie_Id where award_year=yr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Search_movie_bytitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_movie_bytitle`(IN m varchar(45))
BEGIN
  SELECT title,rating
  FROM movies
  WHERE title = m;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `movie_award_view`
--

/*!50001 DROP VIEW IF EXISTS `movie_award_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_award_view` AS select `movies`.`movie_Id` AS `movie_Id`,`movies`.`title` AS `title`,`awards`.`award_title` AS `award_title`,`awards`.`award_year` AS `award_year` from (`movies` join `awards` on((`movies`.`movie_Id` = `awards`.`movie_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_cast_view`
--

/*!50001 DROP VIEW IF EXISTS `movie_cast_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_cast_view` AS select `movies`.`movie_Id` AS `movie_id`,`movies`.`title` AS `title`,`cast`.`Fname` AS `Fname`,`cast`.`lname` AS `lname` from ((`movies` left join `cast_bridge` on((`movies`.`movie_Id` = `cast_bridge`.`movie_id`))) left join `cast` on((`cast_bridge`.`castId` = `cast`.`castId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_countries_view`
--

/*!50001 DROP VIEW IF EXISTS `movie_countries_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_countries_view` AS select `movies`.`movie_Id` AS `movie_id`,`movies`.`title` AS `title`,`countries`.`country` AS `country` from ((`movies` left join `movie_country` on((`movies`.`movie_Id` = `movie_country`.`movie_id`))) left join `countries` on((`movie_country`.`country_id` = `countries`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 10:55:44
