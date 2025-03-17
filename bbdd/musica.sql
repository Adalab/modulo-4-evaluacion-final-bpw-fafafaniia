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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'HIT ME HARD AND SOFT','2024-05-17','https://i.scdn.co/image/ab67616d0000b27371d62ea7ea8a5be92d3c1f62',1);
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
  `biography` text,
  `picture` text,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Billie Eilish','2001-12-18','Estadounidense','Billie Eilish Pirate Baird O.Connell (nacida el 18 de diciembre de 2001 en Los Ángeles, California) es una cantante y compositora estadounidense que se hizo mundialmente conocida por su estilo único y su música ecléctica que abarca géneros como el pop, el electropop y el indie. Empezó a componer canciones a una edad temprana y, con solo 14 años, publicó su sencillo \"Ocean Eyes\" en 2015, que rápidamente ganó popularidad en plataformas como SoundCloud.\nEn 2019, Eilish lanzó su álbum debut, \"When We All Fall Asleep, Where Do We Go?\", que fue un éxito crítico y comercial, catapultándola a la fama global. Su estilo musical oscuro y su estética visual, junto con sus letras introspectivas, la hicieron destacar en la industria de la música. Billie Eilish ha ganado múltiples premios, incluidos varios Grammy en 2020, donde se llevó el premio a Álbum del Año, Canción del Año y Mejor Nuevo Artista, entre otros.\nA lo largo de su carrera, Eilish ha sido reconocida por su autenticidad, su imagen única y su influencia en la cultura pop moderna. Además de su música, también se ha destacado por sus posturas sobre la salud mental, el cuerpo y la imagen, y su enfoque en la autoaceptación.','https://www.totalisimo.com/wp-content/uploads/2024/08/billie-eilish-sconvierte-artista-mas-escuchada-mundo.jpeg');
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
  `description` text,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Bedroom pop','El Bedroom Pop es un subgénero del indie pop que se caracteriza por su producción lo-fi, a menudo grabada en un dormitorio o estudio casero . Se caracteriza por su sonido meloso y soñador, a menudo con guitarras acústicas, sintetizadores y voces suaves.'),(2,'Pop','Debe su nombre a la abreviación “popular music” que, como bien nos indica en inglés, hace referencia a los sonidos, temas y melodías para el público de masas. Las composiciones sencillas y los ritmos ligeros son algunas de las principales características más representativas del pop.'),(3,'Tech-house','El término tech house se desarrolló como un nombre abreviado en las tiendas de discos para una categoría de música electrónica de baile que combinaba aspectos musicales del techno, como \"líneas de bajo robustas\" y \"ritmos acerados\", con las armonías y los ritmos del house progresivo .'),(4,'Dream pop','El dream pop es un subgénero de la música pop que se desarrolló en la década de 1980. Se caracteriza por su sonido suave y etéreo, con influencias de la música electrónica y el rock psicodélico.'),(5,'Progressive R&B','El soul progresivo (a menudo abreviado como prog-soul; también llamado prog negro, rock negro y R&B progresivo) es un tipo de música afroamericana que utiliza un enfoque progresivo, particularmente en el contexto de los géneros soul y funk .'),(6,'Tech-house','El término tech house se desarrolló como un nombre abreviado en las tiendas de discos para una categoría de música electrónica de baile que combinaba aspectos musicales del techno, como \"líneas de bajo robustas\" y \"ritmos acerados\", con las armonías y los ritmos del house progresivo .');
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
INSERT INTO `genres_has_songs` VALUES (1,2),(2,2),(4,2),(3,4),(5,4);
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
  `length` time DEFAULT NULL,
  `embed_code` text,
  `albums_album_id` int NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `fk_songs_albums1_idx` (`albums_album_id`),
  CONSTRAINT `fk_songs_albums1` FOREIGN KEY (`albums_album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (2,'SKINNY','00:03:39','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/1CsMKhwEmNnmvHUuO5nryA?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(3,'LUNCH','00:02:59','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/629DixmZGHc7ILtEntuiWE?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(4,'CHIHIRO','00:05:03','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/7BRD7x5pt8Lqa1eGYC4dzj?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(5,'BIRDS OF A FEATHER','00:03:30','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/6dOtVTDdiauQNBQEDOtlAB?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(6,'WILDFLOWER','00:04:21','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/3QaPy1KgI7nu9FJEQUgn6h?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(7,'THE GREATEST','00:04:53','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/6TGd66r0nlPaYm3KIoI7ET?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(8,'L\'AMOUR DE MA VIE','00:05:33','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/6fPan2saHdFaIHuTSatORv?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(9,'THE DINER','00:03:06','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/1LLUoftvmTjVNBHZoQyveF?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(10,'BITTERSUITE','00:04:58','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/7DpUoxGSdlDHfqCYj0otzU?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1),(11,'BLUE','00:05:43','<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/track/2prqm9sPLj10B4Wg0wE5x9?utm_source=generator\" width=\"100%\" height=\"352\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>',1);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 22:37:20
