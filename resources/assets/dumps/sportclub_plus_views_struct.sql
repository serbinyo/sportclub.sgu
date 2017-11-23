-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sportclub
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id_aдминистратор` int(11) NOT NULL AUTO_INCREMENT,
  `Спортзал_id_спортзал` int(11) NOT NULL,
  `фамилия` varchar(100) DEFAULT NULL,
  `имя` varchar(100) DEFAULT NULL,
  `отчество` varchar(100) DEFAULT NULL,
  `снилс` varchar(25) DEFAULT NULL,
  `улица` varchar(100) DEFAULT NULL,
  `дом` varchar(25) DEFAULT NULL,
  `квартира` varchar(10) DEFAULT NULL,
  `телефон` varchar(15) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pswd` varchar(45) DEFAULT NULL,
  `дата_приема_на_работу` date NOT NULL,
  PRIMARY KEY (`id_aдминистратор`,`Спортзал_id_спортзал`),
  KEY `fk_Администратор_Спортзал1_idx` (`Спортзал_id_спортзал`),
  CONSTRAINT `fk_Администратор_Спортзал1` FOREIGN KEY (`Спортзал_id_спортзал`) REFERENCES `gyms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `стаж_клиента` int(11) DEFAULT NULL,
  `фамилия` varchar(100) DEFAULT NULL,
  `имя` varchar(100) DEFAULT NULL,
  `отчество` varchar(100) DEFAULT NULL,
  `телефон` varchar(15) DEFAULT NULL,
  `баланс_счета` decimal(10,2) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pswd` varchar(45) DEFAULT NULL,
  `дата_вступления` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Клиент_Скидка1_idx` (`стаж_клиента`),
  CONSTRAINT `fk_clients_discounts` FOREIGN KEY (`стаж_клиента`) REFERENCES `discounts` (`стаж`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `стаж` int(11) NOT NULL COMMENT 'стаж указывается в месяцах',
  `скидка` int(11) DEFAULT NULL COMMENT 'скидка указывается в процентах',
  PRIMARY KEY (`стаж`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyms`
--

DROP TABLE IF EXISTS `gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(100) DEFAULT NULL,
  `улица` varchar(100) DEFAULT NULL,
  `дом` varchar(45) DEFAULT NULL,
  `телефон` varchar(15) DEFAULT NULL,
  `ставка_администратора` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sportsmanship_id` int(11) NOT NULL,
  `фамилия` varchar(100) DEFAULT NULL,
  `имя` varchar(100) DEFAULT NULL,
  `отчество` varchar(100) DEFAULT NULL,
  `снилс` varchar(25) DEFAULT NULL,
  `улица` varchar(100) DEFAULT NULL,
  `дом` varchar(25) DEFAULT NULL,
  `квартира` varchar(10) DEFAULT NULL,
  `телефон` varchar(15) DEFAULT NULL,
  `квалификация` varchar(100) DEFAULT NULL COMMENT 'В этом поле указывается диптом тренели и.иили спортивный разряд',
  `login` varchar(45) DEFAULT NULL,
  `pswd` varchar(45) DEFAULT NULL,
  `дата_приема_на_работу` date NOT NULL,
  PRIMARY KEY (`id`,`sportsmanship_id`),
  KEY `fk_Тренер_Спортивное направление_idx` (`sportsmanship_id`),
  CONSTRAINT `fk_instructors_sportsmanships` FOREIGN KEY (`sportsmanship_id`) REFERENCES `sportsmanships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occupation-gyms`
--

DROP TABLE IF EXISTS `occupation-gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupation-gyms` (
  `id` int(11) NOT NULL,
  `id_gym` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_gym`),
  KEY `fk_Занятие-спортзал_Спортзал1_idx` (`id_gym`),
  CONSTRAINT `fk1_o-g` FOREIGN KEY (`id_gym`) REFERENCES `gyms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occupation-instructors`
--

DROP TABLE IF EXISTS `occupation-instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupation-instructors` (
  `id` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `id_sportsmanship` int(11) NOT NULL,
  `дата` date NOT NULL,
  PRIMARY KEY (`id`,`id_instructor`,`id_sportsmanship`),
  KEY `fk1_inst` (`id_instructor`,`id_sportsmanship`),
  CONSTRAINT `fk1_inst` FOREIGN KEY (`id_instructor`, `id_sportsmanship`) REFERENCES `instructors` (`id`, `sportsmanship_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!50001 DROP VIEW IF EXISTS `schedules`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `schedules` AS SELECT 
 1 AS `дата`,
 1 AS `спортвное_направление`,
 1 AS `спортзал`,
 1 AS `спортзал_улица`,
 1 AS `спортзал_дом`,
 1 AS `фамилия_тренер`,
 1 AS `имя_тренер`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sportsmanships`
--

DROP TABLE IF EXISTS `sportsmanships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sportsmanships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(45) DEFAULT NULL,
  `описание` text,
  `стоимость` decimal(10,3) DEFAULT NULL,
  `ставка_тренера` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `visit_logs`
--

DROP TABLE IF EXISTS `visit_logs`;
/*!50001 DROP VIEW IF EXISTS `visit_logs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `visit_logs` AS SELECT 
 1 AS `Посещение`,
 1 AS `номер_клиента`,
 1 AS `фамилия`,
 1 AS `имя`,
 1 AS `отчество`,
 1 AS `номер_занятия`,
 1 AS `спортвное_направление`,
 1 AS `спортзал`,
 1 AS `дата`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitation-clients`
--

DROP TABLE IF EXISTS `visitation-clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitation-clients` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_client`),
  KEY `fk1_idx` (`id_client`),
  CONSTRAINT `fk1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitation-gyms`
--

DROP TABLE IF EXISTS `visitation-gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitation-gyms` (
  `id` int(11) NOT NULL,
  `id_occupation` int(11) NOT NULL,
  `id_gym` int(11) NOT NULL,
  PRIMARY KEY (`id_occupation`,`id_gym`,`id`),
  CONSTRAINT `fk1_vis-gyms1` FOREIGN KEY (`id_occupation`, `id_gym`) REFERENCES `occupation-gyms` (`id`, `id_gym`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `schedules`
--

/*!50001 DROP VIEW IF EXISTS `schedules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `schedules` AS select `occupation-instructors`.`дата` AS `дата`,`sportsmanships`.`название` AS `спортвное_направление`,`gyms`.`название` AS `спортзал`,`gyms`.`улица` AS `спортзал_улица`,`gyms`.`дом` AS `спортзал_дом`,`instructors`.`фамилия` AS `фамилия_тренер`,`instructors`.`имя` AS `имя_тренер` from ((((`sportsmanships` join `instructors`) join `occupation-instructors`) join `occupation-gyms`) join `gyms`) where ((`sportsmanships`.`id` = `instructors`.`sportsmanship_id`) and (`instructors`.`id` = `occupation-instructors`.`id_instructor`) and (`occupation-instructors`.`id` = `occupation-gyms`.`id`) and (`occupation-gyms`.`id_gym` = `gyms`.`id`)) order by `occupation-instructors`.`дата` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visit_logs`
--

/*!50001 DROP VIEW IF EXISTS `visit_logs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `visit_logs` AS select `visitation-clients`.`id` AS `Посещение`,`clients`.`id` AS `номер_клиента`,`clients`.`фамилия` AS `фамилия`,`clients`.`имя` AS `имя`,`clients`.`отчество` AS `отчество`,`occupation-gyms`.`id` AS `номер_занятия`,`sportsmanships`.`название` AS `спортвное_направление`,`gyms`.`название` AS `спортзал`,`occupation-instructors`.`дата` AS `дата` from (((((((`visitation-clients` join `visitation-gyms`) join `clients`) join `occupation-gyms`) join `gyms`) join `occupation-instructors`) join `instructors`) join `sportsmanships`) where ((`clients`.`id` = `visitation-clients`.`id_client`) and (`visitation-clients`.`id` = `visitation-gyms`.`id`) and (`visitation-gyms`.`id_occupation` = `occupation-gyms`.`id`) and (`occupation-gyms`.`id_gym` = `gyms`.`id`) and (`occupation-gyms`.`id` = `occupation-instructors`.`id`) and (`occupation-instructors`.`id_instructor` = `instructors`.`id`) and (`instructors`.`sportsmanship_id` = `sportsmanships`.`id`)) order by `visitation-clients`.`id` */;
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

-- Dump completed on 2017-11-22 23:46:30
