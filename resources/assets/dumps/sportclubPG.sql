-- File name: C:\Users\Serbinyo\Documents\dumps\sportclubPG.sql
-- Created by DBConvert http://www.dbconvert.com


--
-- Table structure for table `спортзал`
--

CREATE TABLE "спортзал" (  "id_спортзал" SERIAL NOT NULL ,
  "название" VARCHAR NULL ,
  "улица" VARCHAR NULL ,
  "дом" VARCHAR NULL ,
  "телефон" VARCHAR NULL ,
  "ставка_администратора" NUMERIC NULL ,
  PRIMARY KEY ("id_спортзал")
); 


--
-- Table structure for table `занятие_спортзал`
--

CREATE TABLE "занятие_спортзал" (  "id_занятие" INTEGER NOT NULL ,
  "Спортзал_id_спортзал" INTEGER NOT NULL ,
  PRIMARY KEY ("id_занятие","Спортзал_id_спортзал"),FOREIGN KEY ("Спортзал_id_спортзал") REFERENCES "спортзал" ( "id_спортзал" ) ON UPDATE CASCADE ON DELETE CASCADE
); 
CREATE INDEX "занятие_спортзал_fk_Занятие-спортзал_Спортзал1_idx" ON "занятие_спортзал" ("Спортзал_id_спортзал");


--
-- Table structure for table `спортивное_направление`
--

CREATE TABLE "спортивное_направление" (  "id_cпортивное_направление" SERIAL NOT NULL ,
  "название" VARCHAR NULL ,
  "описание" TEXT NULL ,
  "стоимость" NUMERIC NULL ,
  "ставка_тренера" VARCHAR NULL ,
  PRIMARY KEY ("id_cпортивное_направление")
); 


--
-- Table structure for table `скидка`
--

CREATE TABLE "скидка" (  "стаж" INTEGER NOT NULL ,
  "скидка" INTEGER NULL ,
  PRIMARY KEY ("стаж")
); 


--
-- Table structure for table `клиент`
--

CREATE TABLE "клиент" (  "id_клиент" INTEGER NOT NULL ,
  "Скидка_стаж" INTEGER NULL ,
  "фамилия" VARCHAR NULL ,
  "имя" VARCHAR NULL ,
  "отчество" VARCHAR NULL ,
  "телефон" VARCHAR NULL ,
  "баланс_счета" NUMERIC NULL ,
  PRIMARY KEY ("id_клиент"),FOREIGN KEY ("Скидка_стаж") REFERENCES "скидка" ( "стаж" ) ON UPDATE SET NULL ON DELETE SET NULL
); 
CREATE INDEX "клиент_fk_Клиент_Скидка1_idx" ON "клиент" ("Скидка_стаж");


--
-- Table structure for table `посещение_спортзал`
--

CREATE TABLE "посещение_спортзал" (  "id_посещение" INTEGER NOT NULL ,
  "Занятие_спортзал_id_занятие" INTEGER NOT NULL ,
  "Занятие_спортзал_Спортзал_id_спортзал" INTEGER NOT NULL ,
  PRIMARY KEY ("Занятие_спортзал_id_занятие","Занятие_спортзал_Спортзал_id_спортзал","id_посещение")
); 


--
-- Table structure for table `посещение_клиент`
--

CREATE TABLE "посещение_клиент" (  "id_посещение" INTEGER NOT NULL ,
  "Клиент_id_клиент" INTEGER NOT NULL ,
  PRIMARY KEY ("id_посещение","Клиент_id_клиент"),FOREIGN KEY ("Клиент_id_клиент") REFERENCES "клиент" ( "id_клиент" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "посещение_клиент_fk_Посещение-клиент_Клиент1_idx" ON "посещение_клиент" ("Клиент_id_клиент");


--
-- Table structure for table `администратор`
--

CREATE TABLE "администратор" (  "id_aдминистратор" SERIAL NOT NULL ,
  "Спортзал_id_спортзал" INTEGER NOT NULL ,
  "фамилия" VARCHAR NULL ,
  "имя" VARCHAR NULL ,
  "отчество" VARCHAR NULL ,
  "снилс" VARCHAR NULL ,
  "улица" VARCHAR NULL ,
  "дом" VARCHAR NULL ,
  "квартира" VARCHAR NULL ,
  "телефон" VARCHAR NULL ,
  "дата_приема_на_работу" DATE NOT NULL ,
  PRIMARY KEY ("id_aдминистратор","Спортзал_id_спортзал"),FOREIGN KEY ("Спортзал_id_спортзал") REFERENCES "спортзал" ( "id_спортзал" ) ON UPDATE CASCADE ON DELETE CASCADE
); 
CREATE INDEX "администратор_fk_Администратор_Спортзал1_idx" ON "администратор" ("Спортзал_id_спортзал");


--
-- Table structure for table `тренер`
--

CREATE TABLE "тренер" (  "id_тренер" SERIAL NOT NULL ,
  "Спортивное_направление_id_cпортивное_направление" INTEGER NOT NULL ,
  "фамилия" VARCHAR NULL ,
  "имя" VARCHAR NULL ,
  "отчество" VARCHAR NULL ,
  "снилс" VARCHAR NULL ,
  "улица" VARCHAR NULL ,
  "дом" VARCHAR NULL ,
  "квартира" VARCHAR NULL ,
  "телефон" VARCHAR NULL ,
  "квалификация" VARCHAR NULL ,
  "дата_приема_на_работу" DATE NOT NULL ,
  PRIMARY KEY ("id_тренер","Спортивное_направление_id_cпортивное_направление"),FOREIGN KEY ("Спортивное_направление_id_cпортивное_направление") REFERENCES "спортивное_направление" ( "id_cпортивное_направление" ) ON UPDATE CASCADE ON DELETE CASCADE
); 
CREATE INDEX "тренер_fk_Тренер_Спортивное направление_idx" ON "тренер" ("Спортивное_направление_id_cпортивное_направление");


--
-- Table structure for table `занятие_тренер`
--

CREATE TABLE "занятие_тренер" (  "id_занятие" INTEGER NOT NULL ,
  "Тренер_id_тренер" INTEGER NOT NULL ,
  "Тренер_Спортивное направление_id_cпортивное направление" INTEGER NOT NULL ,
  "дата" DATE NOT NULL ,
  PRIMARY KEY ("id_занятие","Тренер_id_тренер","Тренер_Спортивное направление_id_cпортивное направление"),FOREIGN KEY ("Тренер_id_тренер","Тренер_Спортивное направление_id_cпортивное направление") REFERENCES "тренер" ( "id_тренер","Спортивное_направление_id_cпортивное_направление" ) ON UPDATE CASCADE ON DELETE CASCADE
); 
CREATE INDEX "занятие_тренер_fk_Занятие-тренер_Тренер1_idx" ON "занятие_тренер" ("Тренер_id_тренер","Тренер_Спортивное направление_id_cпортивное направление");


--
-- Dumping data for table `спортзал`
--

INSERT INTO "спортзал" ("id_спортзал","название","улица","дом","телефон","ставка_администратора") VALUES (1,'оранжевый зал','ленина','1 строение 4','65-96-45',35000.00),(2,'зеленый зал','кирова','25','44-64-76',35000.00),(3,'красный зал','облачникова','123','145-845',38000.00),(4,'черный зал','островского','55','55-56-57',40000.00),(5,'центральный','гоголя','14-Б','35-62-56',35000.00);
SELECT setval('public."спортзал_id_спортзал_seq"', max("id_спортзал") ) FROM "спортзал"; 


--
-- Dumping data for table `занятие_спортзал`
--

INSERT INTO "занятие_спортзал" ("id_занятие","Спортзал_id_спортзал") VALUES (1,1),(5,1),(9,1),(2,2),(6,2),(10,2),(3,3),(7,3),(11,3),(4,4),(8,4),(12,4);

--
-- Dumping data for table `спортивное_направление`
--

INSERT INTO "спортивное_направление" ("id_cпортивное_направление","название","описание","стоимость","ставка_тренера") VALUES (1,'тренажерный зал','Тренажерный класс высокого уровня комфорта. Лучшие современные тренажеры. Квалифицированные тренера',150.000,'35000'),(2,'фитнес','фитнесс зал с потрясающей энергетикой. Фитнесс поможет вам отдохнуть после повседневной рутины и попутно набрать форму',200.000,'40000'),(3,'танцы','Удивите всех на школьной дискотеке или корпоративном вечере. Запишись на танцы и станьте асом танцевального исскусства.',250.000,'60000'),(4,'бассейн','Бассейны для всех возрастов. Уроки плаванья для самых маленьких и общее оздаровление для взрослых людей. Дети до 5 лет на занятия допускаются только с родителями! Приходите у  нас весело и мокро! ',450.000,'50000');
SELECT setval('public."спортивное_направление_id_cпортивное_направление_seq"', max("id_cпортивное_направление") ) FROM "спортивное_направление"; 


--
-- Dumping data for table `скидка`
--

INSERT INTO "скидка" ("стаж","скидка") VALUES (0,0),(2,5),(6,10),(12,15),(18,20),(24,25),(30,30),(36,35),(42,40),(48,45),(56,50);

--
-- Dumping data for table `клиент`
--

INSERT INTO "клиент" ("id_клиент","Скидка_стаж","фамилия","имя","отчество","телефон","баланс_счета") VALUES (1,12,'Филипов','Кирилл','Евгеньевич','+7978-562-11-25',345.00),(2,0,'Новиков','Максим','Альбертович','+7978-562-11-26',1200.00),(3,2,'Малютина','Елена','Александровна','+7978-562-11-27',2500.00),(4,0,'Кислова','Наталья','Владимировна','+7978-562-11-28',680.00),(5,0,'Лаштувка','Ян','Дольфович','+7978-562-11-29',3900.00),(6,2,'Онис','Дэниель',NULL,'+7978-562-11-30',650.00),(7,56,'Краснов','Егор','Петрович','+7978-562-11-31',2210.00),(8,0,'Рей-Лионард','Джордж',NULL,'+7978-562-11-32',1325.00),(9,6,'Вайгалов','Никита','Федорович','+7978-562-11-33',1000.00),(10,0,'Норман','Роман','Степанович','+7978-562-11-34',3680.00),(11,6,'Козлова','Людмила','Николаевна','+7978-562-11-35',150.00),(12,0,'Игнатьева','Ната','Дмитриевна','+7978-562-11-36',250.00),(13,0,'Занозина','Виктория','Сергеевна','+7978-562-11-37',350.00),(14,0,'Лампард','Фрэнк',NULL,'+7978-562-11-38',1250.00),(15,0,'Большов','Илья','Олегович','+7978-562-11-39',150.00),(16,6,'Силаева','Юлия','Захаровна','+7978-562-11-40',1300.00),(17,0,'Рот','Герман','Эрихович','+7978-562-11-41',100.00),(18,0,'Горловиза','Виниамин','Валентинович','+7978-562-11-42',240.00),(19,24,'Петрова','Дарья','Ивановна','+7978-562-11-43',300.00),(20,0,'Смолова','Катерина','Петровна','+7978-562-11-44',250.00);

--
-- Dumping data for table `посещение_спортзал`
--

INSERT INTO "посещение_спортзал" ("id_посещение","Занятие_спортзал_id_занятие","Занятие_спортзал_Спортзал_id_спортзал") VALUES (1,1,1),(2,1,1),(3,1,1),(11,1,1),(25,1,1),(4,2,2),(22,2,2),(5,3,3),(6,3,3),(17,3,3),(21,3,3),(14,5,1),(27,5,1),(33,5,1),(39,5,1),(18,6,2),(24,6,2),(30,6,2),(36,6,2),(37,6,2),(8,7,3),(16,7,3),(35,7,3),(13,8,4),(26,8,4),(38,8,4),(9,9,1),(12,9,1),(15,9,1),(40,9,1),(7,10,2),(10,10,2),(19,11,3),(23,11,3),(29,11,3),(31,11,3),(20,12,4),(28,12,4),(32,12,4),(34,12,4);

--
-- Dumping data for table `посещение_клиент`
--

INSERT INTO "посещение_клиент" ("id_посещение","Клиент_id_клиент") VALUES (8,1),(11,1),(37,1),(7,2),(14,2),(38,2),(9,3),(20,3),(31,3),(5,4),(15,4),(34,4),(4,5),(25,5),(40,5),(6,6),(28,6),(2,7),(26,7),(1,8),(22,8),(3,9),(19,9),(10,10),(17,10),(16,11),(32,11),(21,12),(35,12),(18,13),(33,13),(27,14),(36,14),(23,15),(39,15),(29,16),(30,17),(24,18),(13,19),(12,20);

--
-- Dumping data for table `администратор`
--

INSERT INTO "администратор" ("id_aдминистратор","Спортзал_id_спортзал","фамилия","имя","отчество","снилс","улица","дом","квартира","телефон","дата_приема_на_работу") VALUES (1,1,'Гадалова','Вера','Петровна','548-6522-364-264','Кабанова','11','2','+79783521654','2017-11-13 00:00:00'),(2,1,'Ждан','Сергей','Геннадьевич','548-6522-364-265','Доброва','49','6','+79783521655','2017-11-13 00:00:00'),(3,2,'Сомова','Анастасия','Филипповна','548-6522-364-266','Солнца','35','15Б','+79783521656','2017-11-13 00:00:00'),(4,2,'Глазунова','Рита','Павловна','548-6522-364-267','Краматорская','96','31','+79783521657','2017-11-13 00:00:00'),(5,3,'Рыбин','Андрей','Егорович','548-6522-364-268','Зенитская','7','101','+79783521658','2017-11-13 00:00:00'),(6,3,'Куприна','Светлана','Леонидовна','548-6522-364-269','Флотская','57','74','+79783521659','2017-11-13 00:00:00'),(7,4,'Лизовец','Николя','Львович','548-6522-364-270','Рублева','34','19','+79783521660','2017-11-13 00:00:00'),(8,4,'Ромова','Вероника','Романова','548-6522-364-271','Стояновская','6','32','+79783521661','2017-11-13 00:00:00'),(9,5,'Гобан','Илья','Валерьевич','548-6522-364-272','Старый арбат','74','26-И','+79783521662','2017-11-13 00:00:00'),(10,5,'Порохова','Галина','Николаевна','548-6522-364-273','Годноя','25','14','+79783521663','2017-11-13 00:00:00'),(11,4,'Ласкунова','Ирина','Васильевна','548-6522-364-274','Любова','18','23','+79783521664','2017-11-16 00:00:00');
SELECT setval('public."администратор_id_aдминистратор_seq"', max("id_aдминистратор") ) FROM "администратор"; 


--
-- Dumping data for table `тренер`
--

INSERT INTO "тренер" ("id_тренер","Спортивное_направление_id_cпортивное_направление","фамилия","имя","отчество","снилс","улица","дом","квартира","телефон","квалификация","дата_приема_на_работу") VALUES (1,1,'Злобин','Иван','Андреевич','152-2563-451-541','Пушкина','12','1','+79788285545','диплом симфиропольского физиотерапевтического колледжа','2017-11-13 00:00:00'),(2,1,'Ликбер','Анатолий','Кириллович','152-2563-451-542','Лермонтова','65','456','+79788285546','кандитат в мастера спорта','2017-11-14 00:00:00'),(3,1,'Игнатова','Ольга','Васильевна','152-2563-451-543','Толстого','34а','35','+79788285547','кандитат в мастера спорта','2017-11-13 00:00:00'),(4,2,'Мухина','Лера','Андревна','152-2563-451-544','Никрасова','14','69','+79788285548','кандитат в мастера спорта','2017-11-13 00:00:00'),(5,2,'Сембин','Алексей','Александрович','152-2563-451-545','Смлолва','1','1а','+79788285549','диплом симфиропольского физиотерапевтического колледжа','2017-11-13 00:00:00'),(6,2,'Крохов','Эдуарт','Денисович','152-2563-451-546','Победы правды','53','96','+79788285550','кандитат в мастера спорта, диплом Крандштадского спортивного Университета','2017-11-17 00:00:00'),(7,3,'Торес','Фернандо',NULL,'152-2563-451-547','Чемпионов','78','47','+79788285551','мастер спорта международного класса','2017-11-13 00:00:00'),(8,3,'Торопов','Даниил','Федорович','152-2563-451-548','Рыжикова','36','4','+79788285552','диплом симфиропольского физиотерапевтического колледжа','2017-11-15 00:00:00'),(9,4,'Степина','Елена','Владимировна','152-2563-451-549','Семятина','111','76','+79788285553','физиотерапвт','2017-11-13 00:00:00'),(10,4,'Суворова','Нэлли','Александровна','152-2563-451-550','Ластовая','23','36','+79788285554','медицинский морской институт','2017-11-13 00:00:00'),(11,1,'Крыха','Леонид','Сергеевич','152-2563-451-551','Бастионная','36','12','+79788285555','саратовское цирковое училище','2017-11-18 00:00:00');
SELECT setval('public."тренер_id_тренер_seq"', max("id_тренер") ) FROM "тренер"; 


--
-- Dumping data for table `занятие_тренер`
--

INSERT INTO "занятие_тренер" ("id_занятие","Тренер_id_тренер","Тренер_Спортивное направление_id_cпортивное направление","дата") VALUES (1,2,1,'2017-11-15 00:00:00'),(2,1,1,'2017-11-16 00:00:00'),(3,9,4,'2017-11-16 00:00:00'),(4,3,1,'2017-11-18 00:00:00'),(5,8,3,'2017-11-19 00:00:00'),(6,5,2,'2017-11-20 00:00:00'),(7,4,2,'2017-11-21 00:00:00'),(8,7,3,'2017-11-22 00:00:00'),(9,6,2,'2017-11-23 00:00:00'),(10,8,3,'2017-11-24 00:00:00'),(11,11,1,'2017-11-25 00:00:00'),(12,10,4,'2017-11-26 00:00:00');