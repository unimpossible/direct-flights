CREATE DATABASE  IF NOT EXISTS `flights` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `flights`;
-- Server version	5.6.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlines` (
  `airline_id` int(11) NOT NULL,
  `airline` varchar(90) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `iata` varchar(4) DEFAULT NULL,
  `icaoo` varchar(4) DEFAULT NULL,
  `callsign` varchar(90) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airports` (
  `airport_id` int(11) NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `iata` varchar(4) DEFAULT NULL,
  `icao` varchar(4) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `altitude` int(11) DEFAULT NULL,
  `tz` int(11) DEFAULT NULL,
  `dst` varchar(4) DEFAULT NULL,
  `tz_db` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `airline` char(2) DEFAULT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `airport_src` varchar(4) DEFAULT NULL,
  `airport_src_id` int(11) DEFAULT NULL,
  `airport_dst` varchar(4) DEFAULT NULL,
  `airport_dst_id` int(11) DEFAULT NULL,
  `codeshare` char(1) DEFAULT "",
  `stops` int(11) DEFAULT NULL,
  `equipment` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!50001 DROP TABLE IF EXISTS `direct_flights`*/;
/*!50001 DROP VIEW IF EXISTS `direct_flights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `direct_flights` AS select `r`.`airport_src` AS `airport_src`,`r`.`airport_dst` AS `airport_dst`,`r`.`codeshare` AS `codeshare`,`r`.`stops` AS `stops`,`r`.`equipment` AS `equipment`,`a`.`airline` AS `airline`,`a`.`iata` AS `iata`,`a`.`icaoo` AS `icaoo`,`a`.`callsign` AS `callsign`,`a`.`country` AS `country` from (`routes` `r` join `airlines` `a` on((`r`.`airline_id` = `a`.`airline_id`))) where ((`r`.`stops` = 0) and (`r`.`codeshare` = '') and (`a`.`active` = 'Y')) */;
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

-- Dump completed on 2017-05-21 11:40:47
