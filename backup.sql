-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: jobconnectionsystem
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `apply_info`
--

DROP TABLE IF EXISTS `apply_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apply_content` varchar(255) DEFAULT NULL,
  `apply_image` varchar(255) DEFAULT NULL,
  `jobpost_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKif7y1upoqr751c4kofs2uqlmx` (`jobpost_id`),
  KEY `FKpmjfrmnoxf26v333mfj8ovqhq` (`user_id`),
  CONSTRAINT `FKif7y1upoqr751c4kofs2uqlmx` FOREIGN KEY (`jobpost_id`) REFERENCES `job_posts` (`id`),
  CONSTRAINT `FKpmjfrmnoxf26v333mfj8ovqhq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply_info`
--

LOCK TABLES `apply_info` WRITE;
/*!40000 ALTER TABLE `apply_info` DISABLE KEYS */;
INSERT INTO `apply_info` VALUES (3,'i want apply','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731954919/ng4wq5eetoiustlespgk.jpg',46,22),(7,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731998177/hlgaunbc6yrvyozaynm6.jpg',50,24),(8,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731998227/hdzoknlkmrkkr8u3bajt.jpg',50,24),(9,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731998229/lghcnd3ltoh1lpdzk3dp.jpg',50,24),(12,'i want to apply','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732133072/brsy46ognqpz0hnvdgoc.jpg',51,20),(13,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732133336/c1zrxrc24kruk5r0vx4w.jpg',51,26),(14,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732133441/zkoaej6cdsze8ntpnkv8.jpg',51,26),(15,'i want to apply this job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732134923/swflvlzremedsm1ah6cp.jpg',51,20),(16,'apply content','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732136712/qpxmwbc0z4ppe63upixw.jpg',51,23),(17,'i want to apply','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732136997/hixkrqgzubw6rgkljotc.jpg',51,20),(18,'i like ur job','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732137151/ewmfsuuqnfbae4zfd7um.jpg',51,24),(19,'no comment','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732137584/mhw86izlggwag1tsbeqw.jpg',51,24);
/*!40000 ALTER TABLE `apply_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applyinfo`
--

DROP TABLE IF EXISTS `applyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applyinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jobpost_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `applyContent` text,
  `applyImage` text,
  PRIMARY KEY (`id`),
  KEY `fk_job_post` (`jobpost_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_job_post` FOREIGN KEY (`jobpost_id`) REFERENCES `job_posts` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applyinfo`
--

LOCK TABLES `applyinfo` WRITE;
/*!40000 ALTER TABLE `applyinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `applyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_id` bigint NOT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `deposit_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcux7d49tfnkidhgm00up2j7ig` (`payment_id`),
  CONSTRAINT `FKcux7d49tfnkidhgm00up2j7ig` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posts`
--

DROP TABLE IF EXISTS `job_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` decimal(38,2) DEFAULT NULL,
  `postPhoto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_photo` varchar(255) DEFAULT NULL,
  `dateWork` date DEFAULT NULL,
  `date_work` varchar(255) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_posts_user` (`user_id`),
  CONSTRAINT `FKrgr4unojokbjyl9tmgpj7yu78` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posts`
--

LOCK TABLES `job_posts` WRITE;
/*!40000 ALTER TABLE `job_posts` DISABLE KEYS */;
INSERT INTO `job_posts` VALUES (35,20,'Đăng thử','Đăng thử',NULL,'Đăng thử',12.00,NULL,'2024-11-15 11:39:46','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731674538/yqs7ynrst7xklsukovhj.jpg',NULL,NULL,NULL,'2024-11-15 18:42:00.000000','Active'),(37,20,'ABV','ABV',NULL,'ABV',12.00,NULL,'2024-11-15 11:47:43','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731674708/gtqi799taebarrjfpwx1.jpg',NULL,NULL,NULL,'2024-11-15 18:47:00.000000','Active'),(39,20,'bai viet 1','upload',NULL,'binh dinh',123.00,NULL,'2024-11-15 12:16:11','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731672973/j0rgzdudiu6u9gyzlkls.jpg',NULL,NULL,NULL,'2024-11-09 22:15:00.000000','Active'),(40,20,'up bai','kkkkkk',NULL,'binh dinh',850000.00,NULL,'2024-11-15 14:30:19','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731681022/hz3ajqprzgezbzeb2jif.jpg',NULL,NULL,NULL,'2024-11-08 21:29:00.000000','Active'),(41,20,'Bai dang moi','upload hinh anh',NULL,'Binh Dinh',280000.00,NULL,'2024-11-15 18:09:46','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731694189/r41awamn9bn59udsobmy.jpg',NULL,NULL,NULL,'2024-11-20 01:09:00.000000','Active'),(42,21,'New post about make up autumn','activity of make up',NULL,'Thành phố Hồ Chí Minh',1232.00,NULL,'2024-11-16 03:34:34','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728076/xakbnkhztaqwzjq4anob.jpg',NULL,NULL,NULL,'2024-11-20 00:33:00.000000','Active'),(44,22,'Cinematic makeup for contemporary films','Work with natural makeup looks for contemporary films, or may provide more in-depth looks for glamorous or supernatural characters.',NULL,'quận 9',12321.00,NULL,'2024-11-16 03:44:09','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728652/o0qnrrmuotqppincpcef.jpg',NULL,NULL,NULL,'2024-11-15 10:43:00.000000','Active'),(45,22,'Makeup to models in a way that complements their outfits','Work at a fashion show to help models prepare to model clothing.',NULL,'quận 7',12000.00,NULL,'2024-11-16 03:46:52','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728815/j0tacizin0yw1q8k1mfr.jpg',NULL,NULL,NULL,'2024-10-03 10:46:00.000000','Active'),(46,22,'Specific makeup counter','Work behind a specific makeup counter or within a store that specializes in beauty products.',NULL,'quận 6',10.00,NULL,'2024-11-16 03:48:51','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728933/bub7mnntuumgt9vvntad.jpg',NULL,NULL,NULL,'2024-11-17 01:51:00.000000','Active'),(48,23,'winter make new job','activity of job',NULL,'quan 8 TPHCM',320000.00,NULL,'2024-11-19 04:20:50','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731990058/uwja1dg1z3j3jyiay8bl.jpg',NULL,NULL,NULL,'2024-11-15 11:20:00.000000','Active'),(49,24,'Retail make for professional','These artists model products by helping customers try different types of makeup. The retail artist encourages the customer to purchase the product.',NULL,'Nha Be, Ho Chi Minh city',10.00,NULL,'2024-11-19 05:51:53','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731995516/mqcqgvhteo7p3yej800q.jpg',NULL,NULL,NULL,'2024-11-08 12:50:00.000000','Active'),(50,24,'Theatrical Make up for a theater or travel','Theatrical makeup artists create makeup looks that accentuate features for viewers can see them from the stage. This often includes exaggerated makeup for the brows and lips so viewers can better see the facial expressions of the actors.',NULL,'District 1, HCM',2000.00,NULL,'2024-11-19 06:19:56','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731997201/ydaiynym0uglfavdqfzt.jpg',NULL,NULL,NULL,'2024-11-15 17:18:00.000000','Active'),(51,25,'Cinematic makeup artists are those who work with actors','A cinematic makeup artist may work with natural makeup looks for contemporary films, or may provide more in-depth looks for glamorous or supernatural characters.',NULL,'district 12, HCM',20000.00,NULL,'2024-11-19 06:45:03','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731998705/uk3ivucodtpecsabobzq.jpg',NULL,NULL,NULL,'2024-11-13 04:45:00.000000','Active'),(52,24,'Retail makeup works in a store and helps sell products','hey may work behind a specific makeup counter or within a store that specializes in beauty products. These artists model products by helping customers try different types of makeup.',NULL,'district 10',30000.00,NULL,'2024-11-21 03:57:54','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732161478/btm0ubjfkphskl8yr57a.jpg',NULL,NULL,NULL,'2024-11-13 12:58:00.000000','Active'),(53,22,'Lastterm ESDC ','Lastterm ESDC ',NULL,'quận 8 TPHCM',10000.00,NULL,'2024-11-21 04:48:46','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732164530/h3zezvz9k7bjt6cxvtoj.jpg',NULL,NULL,NULL,'2024-11-20 11:48:00.000000','Active');
/*!40000 ALTER TABLE `job_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender_id` bigint NOT NULL,
  `receiver_id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `message_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_messages_user` (`sender_id`,`receiver_id`),
  KEY `FKt05r0b6n0iis8u7dfna4xdh73` (`receiver_id`),
  CONSTRAINT `FK4ui4nnwntodh6wjvck53dbk9m` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKt05r0b6n0iis8u7dfna4xdh73` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_flagged` bit(1) NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKblo52npbjoiycxkrktfrep0d3` (`post_id`),
  KEY `FKnk4ftb5am9ubmkv1661h15ds9` (`user_id`),
  CONSTRAINT `FKblo52npbjoiycxkrktfrep0d3` FOREIGN KEY (`post_id`) REFERENCES `job_posts` (`id`),
  CONSTRAINT `FKnk4ftb5am9ubmkv1661h15ds9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (10,_binary '\0',48,24),(11,_binary '\0',48,25),(16,_binary '\0',46,20),(17,_binary '\0',52,22),(18,_binary '\0',53,27);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `job_post_id` bigint DEFAULT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_payments_user` (`user_id`),
  KEY `FKctrc2og24cfda07r8j21p2agt` (`job_post_id`),
  CONSTRAINT `FKctrc2og24cfda07r8j21p2agt` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`id`),
  CONSTRAINT `FKj94hgy9v5fw1munb90tar2eje` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `birth_date` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `portfolio_photo` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_profile` (`user_id`),
  CONSTRAINT `FK410q61iev7klncmpqfuo85ivh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (9,14,'Khuong','2024-11-17','Male','kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk','tp HCM','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731428528/i6ovurygm7k1zgehtjkd.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731428530/sn4t4k8vatzqyjokwquk.jpg'),(10,16,'kh kh','2024-11-16','Female','kkkkkkkkkkkkkkkkkkkkkkkk','hcm','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731476991/xwvxesu0b2wxsmu8lzbs.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731476993/fpm8sdrljg7iq44lcdcm.jpg'),(11,17,'kh kh kh','2024-11-08','Male','aaaaaaaaaaaaaaaaaaaaaaa','hcm','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731589290/ugry1c0rkjbvmqrkk9gd.png','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731490493/b2sjvx6ortkxn8gkwne6.jpg'),(13,19,'Khuong','2024-11-01','Male','jjjjjjjjjjjjj','123131132','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731478573/kiaa9sa9agjql7kvdnjw.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731478575/gvd9sadaxgtqml9gdmir.jpg'),(14,20,'Nguyen Van A','2024-11-13','Male','No bio yet','Le Van Luong','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731721141/idgtwzjeecqe7xf5w89e.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731725267/mlj3dxodzb5xkmrhvbuo.jpg'),(15,21,'tvanb','2024-11-21','Male','no bio yet','Binh Dinh','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731727975/e2iu3juhx8i0whppja8f.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731727977/c4qwgjp9odxqv4cmggh6.jpg'),(16,22,'Truong Vinh Khuong','2024-11-02','Male','my bio','TP HCM','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728508/rpce1gaq2y3no2402b3s.webp','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731728510/a3pqrosgqn6z4wm2bxbr.jpg'),(17,23,'Nguyen Cao Ky','2024-11-06','Female','my bio here','district 2','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731989663/gejhlqrjhi6xkqo0n1r2.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731989673/lyazzhvydmreht5vxpeb.jpg'),(18,24,'Nguyen Tra Anh Khoa','2024-11-02','Female','','district 9','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731995302/dzysazmrkxwsoortgqlt.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731995305/gpbhrzg8af0xhmymig1t.jpg'),(19,25,'Gia Khanh','2024-11-16','Male','my bio here','district 10','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731994665/xzubxns2lyq62ylnzspx.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1731994669/iun1z8bmsjaqmqy6bhfd.jpg'),(20,26,'Ly Hai','2024-11-22','Male','bio here','tp HCM','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732133300/urjahewakxeqrz2ia6nq.jpg','http://res.cloudinary.com/dhp7ylyvh/image/upload/v1732133303/te0vabvma7hmfjkx7vdf.jpg'),(21,27,'vanb',NULL,NULL,NULL,NULL,'https://res.cloudinary.com/dhp7ylyvh/image/upload/v1731477517/qljywamnvnwb8mi0rqjt.jpg','https://res.cloudinary.com/dhp7ylyvh/image/upload/v1731477640/jthwtgc7gir7vczbloch.png');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `income` decimal(38,2) DEFAULT NULL,
  `expenses` decimal(38,2) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_statistics_user` (`user_id`),
  CONSTRAINT `FKgubpcsln9g1fvbi3f5sgt5def` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `cccd` varchar(255) DEFAULT NULL,
  `portrait_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `cccd` (`cccd`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'kh','123','kkk@gmail','0123456789','Model','123456789012',NULL,'2024-11-12 05:38:50'),(13,'kkk','123','khkh@gmail','0987654321','Customer','987654321098',NULL,'2024-11-12 05:38:50'),(14,'user','123','kkkkk@29',NULL,'Customer',NULL,NULL,NULL),(16,'user2','123','k1212@gmail',NULL,'model-artist',NULL,NULL,NULL),(17,'user3','123','khuongkkk@gmail',NULL,'makeup-artist',NULL,NULL,NULL),(18,'user4','123','kakaka@gmail',NULL,'model-artist',NULL,NULL,NULL),(19,'user5','123','kkkkkkk@mail',NULL,'model-artist',NULL,NULL,NULL),(20,'nva','123','nva@gmail.com',NULL,'customer',NULL,NULL,NULL),(21,'tvanb','123','tvb@gmail',NULL,'model-artist',NULL,NULL,NULL),(22,'trvinhkhuong','123','nguyentc@gmail',NULL,'makeup-artist',NULL,NULL,NULL),(23,'caoky','123','kykk@gmail',NULL,'customer',NULL,NULL,NULL),(24,'anhkhoa','123','anhkhoa@gmail',NULL,'model-artist',NULL,NULL,NULL),(25,'giakhanh','123','gk@gmail',NULL,'customer',NULL,NULL,NULL),(26,'lyhai','123','lyhai@gmail',NULL,'model-artist',NULL,NULL,NULL),(27,'vanb','123','vanb@gmail.com',NULL,'model-artist',NULL,NULL,NULL);
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

-- Dump completed on 2024-12-06 21:59:56
