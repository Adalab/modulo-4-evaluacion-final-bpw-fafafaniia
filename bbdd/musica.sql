CREATE DATABASE  IF NOT EXISTS `musica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musica`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musica
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `cover` text NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_albums_artists_idx` (`artist_id`),
  CONSTRAINT `fk_albums_artists` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `nationality` varchar(45) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_has_songs`
--

DROP TABLE IF EXISTS `genres_has_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_has_songs` (
  `genres_genre_id` int NOT NULL,
  `songs_song_id` int NOT NULL,
  PRIMARY KEY (`genres_genre_id`,`songs_song_id`),
  KEY `fk_genres_has_songs_songs1_idx` (`songs_song_id`),
  KEY `fk_genres_has_songs_genres1_idx` (`genres_genre_id`),
  CONSTRAINT `fk_genres_has_songs_genres1` FOREIGN KEY (`genres_genre_id`) REFERENCES `genres` (`genre_id`),
  CONSTRAINT `fk_genres_has_songs_songs1` FOREIGN KEY (`songs_song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_has_songs`
--

LOCK TABLES `genres_has_songs` WRITE;
/*!40000 ALTER TABLE `genres_has_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres_has_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `idplaylist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`idplaylist_id`,`users_user_id`),
  KEY `fk_playlists_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_playlists_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `profile_pic` text,
  `biography` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`profile_id`,`user_id`),
  KEY `fk_profiles_users1_idx` (`user_id`),
  CONSTRAINT `fk_profiles_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `legth` time DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `embed_code` text,
  `albums_album_id` int NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `fk_songs_albums1_idx` (`albums_album_id`),
  CONSTRAINT `fk_songs_albums1` FOREIGN KEY (`albums_album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_has_playlists`
--

DROP TABLE IF EXISTS `songs_has_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs_has_playlists` (
  `song_id` int NOT NULL,
  `playlists_id` int NOT NULL,
  `playlists_users_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`playlists_id`,`playlists_users_id`),
  KEY `fk_songs_has_playlists_playlists1_idx` (`playlists_id`,`playlists_users_id`),
  KEY `fk_songs_has_playlists_songs1_idx` (`song_id`),
  CONSTRAINT `fk_songs_has_playlists_playlists1` FOREIGN KEY (`playlists_id`, `playlists_users_id`) REFERENCES `playlists` (`idplaylist_id`, `users_user_id`),
  CONSTRAINT `fk_songs_has_playlists_songs1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_has_playlists`
--

LOCK TABLES `songs_has_playlists` WRITE;
/*!40000 ALTER TABLE `songs_has_playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs_has_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'musica'
--

--
-- Dumping routines for database 'musica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 12:32:46
