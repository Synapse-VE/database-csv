/**----------------------------------------------------
    --                                               --
    --      GGE Tracker MariaDB Database Schema      --
    --                                               --
    --        https://gge-tracker.com (c) 2025       --
    --                                               --
    --  [ x ] Environment: MariaDB  11+              --
    --  [ x ] Patch date: 2025-09                    --
    --  [ x ] Patch version: 1.11.2                  --
    --                                               --
    --------------------------------------------------*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `empire-ranking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empire-ranking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `empire-ranking`;

--
-- Table structure for table `dungeon_player_state`
--

DROP TABLE IF EXISTS `dungeon_player_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeon_player_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` tinyint(3) NOT NULL,
  `position_x` smallint(5) NOT NULL,
  `position_y` smallint(5) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `last_attack_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `kid` (`kid`,`position_x`,`position_y`,`player_id`) USING BTREE,
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=612751 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeons` (
  `kid` tinyint(3) unsigned NOT NULL,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `attack_cooldown` mediumint(8) unsigned DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `total_attack_count` mediumint(9) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kid`,`position_x`,`position_y`),
  KEY `kid` (`kid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_type` varchar(50) NOT NULL,
  `offer_type` varchar(100) NOT NULL,
  `offer` smallint(5) unsigned NOT NULL,
  `world_type` varchar(255) NOT NULL,
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'empire-ranking'
--

--
-- Dumping routines for database 'empire-ranking'
--

--
-- Current Database: `empire-ranking-cz1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empire-ranking-cz1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `empire-ranking-cz1`;

--
-- Table structure for table `dungeon_player_state`
--

DROP TABLE IF EXISTS `dungeon_player_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeon_player_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` tinyint(3) NOT NULL,
  `position_x` smallint(5) NOT NULL,
  `position_y` smallint(5) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `last_attack_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `kid` (`kid`,`position_x`,`position_y`,`player_id`) USING BTREE,
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212874 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeons` (
  `kid` tinyint(3) unsigned NOT NULL,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `attack_cooldown` mediumint(8) unsigned DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `total_attack_count` mediumint(9) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kid`,`position_x`,`position_y`),
  KEY `kid` (`kid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'empire-ranking-cz1'
--

--
-- Dumping routines for database 'empire-ranking-cz1'
--

--
-- Current Database: `empire-ranking-it1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empire-ranking-it1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `empire-ranking-it1`;

--
-- Table structure for table `dungeon_player_state`
--

DROP TABLE IF EXISTS `dungeon_player_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeon_player_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` tinyint(3) NOT NULL,
  `position_x` smallint(5) NOT NULL,
  `position_y` smallint(5) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `last_attack_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `kid` (`kid`,`position_x`,`position_y`,`player_id`) USING BTREE,
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157644 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeons` (
  `kid` tinyint(3) unsigned NOT NULL,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `attack_cooldown` mediumint(8) unsigned DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `total_attack_count` mediumint(9) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kid`,`position_x`,`position_y`),
  KEY `kid` (`kid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'empire-ranking-it1'
--

--
-- Dumping routines for database 'empire-ranking-it1'
--

--
-- Current Database: `empire-ranking-ro1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empire-ranking-ro1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `empire-ranking-ro1`;

--
-- Table structure for table `dungeon_player_state`
--

DROP TABLE IF EXISTS `dungeon_player_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeon_player_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` tinyint(3) NOT NULL,
  `position_x` smallint(5) NOT NULL,
  `position_y` smallint(5) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `last_attack_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `kid` (`kid`,`position_x`,`position_y`,`player_id`) USING BTREE,
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319903 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeons` (
  `kid` tinyint(3) unsigned NOT NULL,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `attack_cooldown` mediumint(8) unsigned DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `total_attack_count` mediumint(9) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kid`,`position_x`,`position_y`),
  KEY `kid` (`kid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'empire-ranking-ro1'
--

--
-- Dumping routines for database 'empire-ranking-ro1'
--

--
-- Current Database: `empire-ranking-sa1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empire-ranking-sa1` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `empire-ranking-sa1`;

--
-- Table structure for table `dungeon_player_state`
--

DROP TABLE IF EXISTS `dungeon_player_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeon_player_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` tinyint(3) NOT NULL,
  `position_x` smallint(5) NOT NULL,
  `position_y` smallint(5) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `last_attack_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `kid` (`kid`,`position_x`,`position_y`,`player_id`) USING BTREE,
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dungeons` (
  `kid` tinyint(3) unsigned NOT NULL,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `attack_cooldown` mediumint(8) unsigned DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `total_attack_count` mediumint(9) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kid`,`position_x`,`position_y`),
  KEY `kid` (`kid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'empire-ranking-sa1'
--

--
-- Dumping routines for database 'empire-ranking-sa1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
