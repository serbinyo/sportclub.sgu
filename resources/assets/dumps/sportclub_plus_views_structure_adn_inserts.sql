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
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,1,'Гадалова','Вера','Петровна','548-6522-364-264','Кабанова','11','2','+79783521654','admin1','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(2,1,'Ждан','Сергей','Геннадьевич','548-6522-364-265','Доброва','49','6','+79783521655','admin2','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(3,2,'Сомова','Анастасия','Филипповна','548-6522-364-266','Солнца','35','15Б','+79783521656','admin3','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(4,2,'Глазунова','Рита','Павловна','548-6522-364-267','Краматорская','96','31','+79783521657','admin4','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(5,3,'Рыбин','Андрей','Егорович','548-6522-364-268','Зенитская','7','101','+79783521658','admin5','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(6,3,'Куприна','Светлана','Леонидовна','548-6522-364-269','Флотская','57','74','+79783521659','admin6','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(7,4,'Лизовец','Николя','Львович','548-6522-364-270','Рублева','34','19','+79783521660','admin7','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(8,4,'Ромова','Вероника','Романова','548-6522-364-271','Стояновская','6','32','+79783521661','admin8','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(9,5,'Гобан','Илья','Валерьевич','548-6522-364-272','Старый арбат','74','26-И','+79783521662','admin9','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(10,5,'Порохова','Галина','Николаевна','548-6522-364-273','Годноя','25','14','+79783521663','admin10','934b535800b1cba8f96a5d72f72f1611','2017-11-13'),(11,4,'Ласкунова','Ирина','Васильевна','548-6522-364-274','Любова','18','23','+79783521664','admin11','934b535800b1cba8f96a5d72f72f1611','2017-11-16');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,12,'Филипов','Кирилл','Евгеньевич','+7978-562-11-25',345.00,'client1','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(2,0,'Новиков','Максим','Альбертович','+7978-562-11-26',1200.00,'client2','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(3,2,'Малютина','Елена','Александровна','+7978-562-11-27',2500.00,'client3','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(4,0,'Кислова','Наталья','Владимировна','+7978-562-11-28',680.00,'client4','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(5,0,'Лаштувка','Ян','Дольфович','+7978-562-11-29',3900.00,'client5','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(6,2,'Онис','Дэниель',NULL,'+7978-562-11-30',650.00,'client6','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(7,0,'Краснов','Егор','Петрович','+7978-562-11-31',2210.00,'client7','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(8,0,'Рей-Лионард','Джордж',NULL,'+7978-562-11-32',1325.00,'client8','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(9,6,'Вайгалов','Никита','Федорович','+7978-562-11-33',1000.00,'client9','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(10,0,'Норман','Роман','Степанович','+7978-562-11-34',3680.00,'client10','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(11,6,'Козлова','Людмила','Николаевна','+7978-562-11-35',150.00,'client11','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(12,0,'Игнатьева','Ната','Дмитриевна','+7978-562-11-36',250.00,'client12','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(13,0,'Занозина','Виктория','Сергеевна','+7978-562-11-37',350.00,'client13','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(14,0,'Лампард','Фрэнк',NULL,'+7978-562-11-38',1250.00,'client14','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(15,0,'Большов','Илья','Олегович','+7978-562-11-39',150.00,'client15','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(16,6,'Силаева','Юлия','Захаровна','+7978-562-11-40',1300.00,'client16','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(17,0,'Рот','Герман','Эрихович','+7978-562-11-41',100.00,'client17','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(18,0,'Горловиза','Виниамин','Валентинович','+7978-562-11-42',240.00,'client18','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(19,24,'Петрова','Дарья','Ивановна','+7978-562-11-43',300.00,'client19','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00'),(20,0,'Смолова','Катерина','Петровна','+7978-562-11-44',250.00,'client20','4a7d1ed414474e4033ac29ccb8653d9b','0000-00-00');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (0,0),(2,5),(6,10),(12,15),(18,20),(24,25),(30,30),(36,35),(42,40),(48,45),(56,50);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (1,'оранжевый зал','ленина','1 строение 4','65-96-45',35000.00),(2,'зеленый зал','кирова','25','44-64-76',35000.00),(3,'красный зал','облачникова','123','145-845',38000.00),(4,'черный зал','островского','55','55-56-57',40000.00),(5,'центральный','гоголя','14-Б','35-62-56',35000.00);
/*!40000 ALTER TABLE `gyms` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,1,'Злобин','Иван','Андреевич','152-2563-451-541','Пушкина','12','1','+79788285545','диплом симфиропольского физиотерапевтического колледжа','instructor1','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(2,1,'Ликбер','Анатолий','Кириллович','152-2563-451-542','Лермонтова','65','456','+79788285546','кандитат в мастера спорта','instructor2','b59c67bf196a4758191e42f76670ceba','2017-11-14'),(3,1,'Игнатова','Ольга','Васильевна','152-2563-451-543','Толстого','34а','35','+79788285547','кандитат в мастера спорта','instructor3','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(4,2,'Мухина','Лера','Андревна','152-2563-451-544','Никрасова','14','69','+79788285548','кандитат в мастера спорта','instructor4','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(5,2,'Сембин','Алексей','Александрович','152-2563-451-545','Смлолва','1','1а','+79788285549','диплом симфиропольского физиотерапевтического колледжа','instructor5','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(6,2,'Крохов','Эдуарт','Денисович','152-2563-451-546','Победы правды','53','96','+79788285550','кандитат в мастера спорта, диплом Крандштадского спортивного Университета','instructor6','b59c67bf196a4758191e42f76670ceba','2017-11-17'),(7,3,'Торес','Фернандо',NULL,'152-2563-451-547','Чемпионов','78','47','+79788285551','мастер спорта международного класса','instructor7','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(8,3,'Торопов','Даниил','Федорович','152-2563-451-548','Рыжикова','36','4','+79788285552','диплом симфиропольского физиотерапевтического колледжа','instructor8','b59c67bf196a4758191e42f76670ceba','2017-11-15'),(9,4,'Степина','Елена','Владимировна','152-2563-451-549','Семятина','111','76','+79788285553','физиотерапвт','instructor9','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(10,4,'Суворова','Нэлли','Александровна','152-2563-451-550','Ластовая','23','36','+79788285554','медицинский морской институт','instructor10','b59c67bf196a4758191e42f76670ceba','2017-11-13'),(11,1,'Крыха','Леонид','Сергеевич','152-2563-451-551','Бастионная','36','12','+79788285555','саратовское цирковое училище','instructor11','b59c67bf196a4758191e42f76670ceba','2017-11-18');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `occupation-gyms`
--

LOCK TABLES `occupation-gyms` WRITE;
/*!40000 ALTER TABLE `occupation-gyms` DISABLE KEYS */;
INSERT INTO `occupation-gyms` VALUES (1,1),(5,1),(9,1),(13,1),(14,1),(17,1),(18,1),(2,2),(6,2),(10,2),(15,2),(16,2),(3,3),(7,3),(11,3),(19,3),(20,3),(21,3),(25,3),(4,4),(8,4),(12,4),(24,4),(22,5),(23,5);
/*!40000 ALTER TABLE `occupation-gyms` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `occupation-instructors`
--

LOCK TABLES `occupation-instructors` WRITE;
/*!40000 ALTER TABLE `occupation-instructors` DISABLE KEYS */;
INSERT INTO `occupation-instructors` VALUES (1,2,1,'2017-11-15'),(2,1,1,'2017-11-16'),(3,9,4,'2017-11-17'),(4,3,1,'2017-11-18'),(5,8,3,'2017-11-19'),(6,5,2,'2017-11-20'),(7,4,2,'2017-11-21'),(8,7,3,'2017-11-22'),(9,6,2,'2017-11-23'),(10,8,3,'2017-11-24'),(11,11,1,'2017-11-25'),(12,10,4,'2017-11-26'),(13,1,1,'2017-12-01'),(14,4,2,'2017-12-01'),(15,7,3,'2017-12-01'),(16,9,4,'2017-12-01'),(17,2,1,'2017-12-02'),(18,5,2,'2017-12-02'),(19,8,3,'2017-12-02'),(20,10,4,'2017-12-02'),(21,3,1,'2017-12-03'),(22,6,2,'2017-12-03'),(23,7,3,'2017-12-03'),(24,9,4,'2017-12-03'),(25,1,1,'2017-12-04'),(26,10,4,'2017-12-04');
/*!40000 ALTER TABLE `occupation-instructors` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sportsmanships`
--

LOCK TABLES `sportsmanships` WRITE;
/*!40000 ALTER TABLE `sportsmanships` DISABLE KEYS */;
INSERT INTO `sportsmanships` VALUES (1,'тренажерный зал','Тренажерный класс высокого уровня комфорта. Лучшие современные тренажеры. Квалифицированные тренера',150.000,'35000'),(2,'фитнесс','фитнесс зал с потрясающей энергетикой. Фитнесс поможет вам отдохнуть после повседневной рутины и попутно набрать форму',200.000,'40000'),(3,'танцы','Удивите всех на школьной дискотеке или корпоративном вечере. Запишись на танцы и станьте асом танцевального исскусства.',250.000,'60000'),(4,'бассейн','Бассейны для всех возрастов. Уроки плаванья для самых маленьких и общее оздаровление для взрослых людей. Дети до 5 лет на занятия допускаются только с родителями! Приходите у  нас весело и мокро! ',450.000,'50000');
/*!40000 ALTER TABLE `sportsmanships` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `visitation-clients`
--

LOCK TABLES `visitation-clients` WRITE;
/*!40000 ALTER TABLE `visitation-clients` DISABLE KEYS */;
INSERT INTO `visitation-clients` VALUES (8,1),(11,1),(37,1),(7,2),(14,2),(38,2),(9,3),(20,3),(31,3),(5,4),(15,4),(34,4),(4,5),(25,5),(40,5),(6,6),(28,6),(2,7),(26,7),(1,8),(22,8),(3,9),(19,9),(10,10),(17,10),(16,11),(32,11),(21,12),(35,12),(18,13),(33,13),(27,14),(36,14),(23,15),(39,15),(29,16),(30,17),(24,18),(13,19),(12,20);
/*!40000 ALTER TABLE `visitation-clients` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `visitation-gyms`
--

LOCK TABLES `visitation-gyms` WRITE;
/*!40000 ALTER TABLE `visitation-gyms` DISABLE KEYS */;
INSERT INTO `visitation-gyms` VALUES (1,1,1),(2,1,1),(3,1,1),(11,1,1),(25,1,1),(4,2,2),(22,2,2),(5,3,3),(6,3,3),(17,3,3),(21,3,3),(14,5,1),(27,5,1),(33,5,1),(39,5,1),(18,6,2),(24,6,2),(30,6,2),(36,6,2),(37,6,2),(8,7,3),(16,7,3),(35,7,3),(13,8,4),(26,8,4),(38,8,4),(9,9,1),(12,9,1),(15,9,1),(40,9,1),(7,10,2),(10,10,2),(19,11,3),(23,11,3),(29,11,3),(31,11,3),(20,12,4),(28,12,4),(32,12,4),(34,12,4);
/*!40000 ALTER TABLE `visitation-gyms` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2017-11-22 23:48:05
