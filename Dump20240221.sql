-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `changeuser`
--

DROP TABLE IF EXISTS `changeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changeuser` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `oldgrade` varchar(45) NOT NULL,
  `newgrade` varchar(45) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `foreign_key_changegrade_idx` (`userid`),
  KEY `foreign_key_changegrade2_idx` (`oldgrade`),
  CONSTRAINT `foreign_key_changegrade` FOREIGN KEY (`userid`) REFERENCES `user` (`mnum`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeuser`
--

LOCK TABLES `changeuser` WRITE;
/*!40000 ALTER TABLE `changeuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `mnum` int NOT NULL,
  `grade` double DEFAULT '0',
  `comment` longtext,
  `entry_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `foreign_key_mnum_idx` (`mnum`),
  KEY `foreign_key_userid_idx` (`userid`),
  CONSTRAINT `foreign_key_mnum` FOREIGN KEY (`mnum`) REFERENCES `movie` (`mnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreign_key_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`mnum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,3,1,3,'','2024-02-18 14:09:47'),(2,4,1,4,'움파룸파 둠피디둠~','2024-02-18 14:09:47'),(18,2,1,4,'','2024-02-20 09:46:39'),(24,5,1,5,'good~~~~!!!','2024-02-21 04:52:56'),(25,2,2,4,'또 보고싶어요!!','2024-02-21 06:29:53'),(26,2,3,4,NULL,'2024-02-21 07:25:22'),(27,4,5,4,'스릴 넘칩니다!!!!!!','2024-02-21 07:26:05');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `mnum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `summary` longtext,
  `grade` longtext NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `runningtime` int DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `actors` varchar(150) DEFAULT NULL,
  `startdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mnum`),
  UNIQUE KEY `mnum_UNIQUE` (`mnum`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'웡카','세상에서 가장 달콤한 여정 좋은 일은 모두 꿈에서부터 시작된다! 마법사이자 초콜릿 메이커 ‘윌리 웡카’의 꿈은 디저트의 성지, ‘달콤 백화점’에 자신만의 초콜릿 가게를 여는 것. 가진 것이라고는 낡은 모자 가득한 꿈과 단돈 12소버린 뿐이지만 특별한 마법의 초콜릿으로 사람들을 사로잡을 자신이 있다. 하지만 먹을 것도, 잠잘 곳도, 의지할 사람도 없는 상황 속에서 낡은 여인숙에 머물게 된 ‘웡카’는 ‘스크러빗 부인’과 ‘블리처’의 계략에 빠져 눈더미처럼 불어난 숙박비로 인해 순식간에 빚더미에 오른다. 게다가 밤마다 초콜릿을 훔쳐가는 작은 도둑 ‘움파 룸파’의 등장과 ‘달콤 백화점’을 독점한 초콜릿 카르텔의 강력한 견제까지. 세계 최고의 초콜릿 메이커가 되는 길은 험난하기만 한데…','전체관람가','https://i.namu.wiki/i/X1mqvMI1U7AS6FY9ro538aBhwpYhRO_5PB-dEWLt_NyVfbdGCCMcqYQrX4DOtF_L2yhgUTm2mQOBYqSUoUY6eQ.webp',116,'판타지','폴 킹','티모시 샬라메, 칼라 레인, 올리비아 콜맨','2024-01-31 15:00:00'),(2,'시민덕희','화재 사건으로 세탁소를 잃은 싱글맘 덕희는 어느날 선불 대출을 제안하는 은행의 전화를 받게 된다. 은행의 제안에 돈을 송금한 덕희, 그러나 얼마 지나지 않아 자신이 보이스 피싱의 피해자가 되었다는 사실을 깨닫게 된다. 망연자실한 덕희는 경찰에게 도움을 요청하며 돌아서지만, 자신의 돈을 찾을 방법이 없다는 사실에 더욱 좌절하는데...','15세 이상','https://i.namu.wiki/i/Jw0sUVobNhQaqLSOE1C7iSozBgLh6rRIv-MK-rQKDRIpZwEhZVtSnMTN1c_0FSEkVTksvl4y9rLBGDPJTMbaNg.webp',114,'드라마','박영주','라미란, 공명, 엄혜란','2024-01-23 15:00:00'),(3,'아가일','소설 내용이 현실 속 악당 스파이 조직의 활동을 그대로 묘사하자, 소심한 첩보 소설가 엘리 콘웨이와 반려 고양이는 그 무엇도, 그 누구도 믿을 수 없는 현실 스파이의 세계에 휘말리게 된다.','12세 이상','https://i.namu.wiki/i/Izml-FXeZ1Y3cmaMGloTidZ3x1XI8YF93oTnz0x33Z2NdOUiBjI1KoKAFcaSyEIzwRmVKuYlu-IRGE9RXMa9CA.webp',139,'액션, 코미디','매튜 본','헨리 카빌, 브라이스 달라스하워드, 샘 록웰','2024-02-06 15:00:00'),(4,'도그데이즈','깔끔한 성격의 계획형 싱글남 민상. 영끌까지 모아 산 건물을 개똥밭으로 만드는 세입자 수의사 진영 때문에 매일 머리가 아프다. 오늘도 진영과 티격태격하던 민상은 동물병원에서 한 성격하는 할머니를 만나는데, 다름 아닌 세계적 건축가 민서! 진행 중인 프로젝트를 위해 민서의 도움이 절실한 민상은 민서에게 잘 보이기 위해 진영과 그녀의 반려견 차장님을 공략하기 시작한다.','12세 이상','https://i.namu.wiki/i/d34ia1PPqaXu9ltJhIDqTXjC7F-O9kkydp6f0c5LYj2XRn4d3_ZWqdAo813IpSE0OPsOe1J_Ni1ti2Ur2ljD6Q.webp',120,'드라마','김덕민','윤여정, 유해진, 김윤진','2024-02-06 15:00:00'),(5,'데드맨','목숨값 단돈 500만원! 이름값 1000억?\n이름에 살고, 이름에 죽는다!\n \n인생 벼랑 끝, 살기 위해 이름까지 팔게 된 ‘이만재’.\n누구도 믿을 수 없는 바지사장 세계에서 탁월한 계산 능력 하나로 가늘고 길게 버텨온 그가 큰 거 한방 터뜨릴 절호의 기회를 잡는다.\n그러나 그에게 돌아온 것은 1천억 횡령 누명과 자신의 사망 기사!\n \n살아있지만 죽은 사람, 즉 ‘데드맨’이 되어 영문도 모른 채 중국의 사설감옥에 끌려간 ‘이만재’.\n정치 컨설턴트 ‘심여사’가 그의 앞에 나타나 목숨값을 담보로 위험한 제안을 하고,\n‘이만재’ 때문에 아버지가 죽었다고 주장하는 ‘공희주’가 등장하면서\n1천억짜리 설계판의 배후를 찾기 위해 의기투합한 세 사람의 추적이 시작되는데','15세 이상','https://i.namu.wiki/i/2WEezIqAXCUHEDoRZ0lzA7HXpYQ6GxdvepJXWJ1iCRj7KzMbeWmaepPAidJ6_cTjeqSxUDmDQe3vqjjsSA7ZUA.webp',109,'범죄','하준원','조진웅, 김희애, 이수경','2024-02-06 15:00:00'),(6,'이프 온리','눈앞에서 사랑하는 연인을 잃은 남자 ‘이안’ 그녀가 죽고 나서야 더 잘해주지 못했던 자신의 행동에 대해 후회한다','12세 이상','https://cf.lottecinema.co.kr//Media/MovieFile/MovieImg/202402/20792_103_1.jpg',96,'멜로','길 정거','제니퍼 러브 휴잇, 폴 니콜스, 다이아나 하드케슬','2024-02-20 15:00:00'),(7,'듄: 파트2','황제의 모략으로 멸문한 가문의 유일한 후계자 폴(티모시 샬라메). 어머니 레이디 제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다. 그곳에서 만난 반란군들과 숨어 지내다 그들과 함께 황제의 모든 것을 파괴할 전투를 준비한다. 한편 반란군들의 기세가 높아질수록 불안해진 황제와 귀족 가문은 잔혹한 암살자 페이드 로타(오스틴 버틀러)를 보내 반란군을 몰살하려 하는데… 2월, 운명의 반격이 시작된다!','12세 이상','https://cf.lottecinema.co.kr//Media/MovieFile/MovieImg/202402/20710_103_1.jpg',165,'액션','드니 빌뇌브','티모시 샬라메, 젠데이아, 레베카 퍼거슨, 조슈 브롤린','2024-02-27 15:00:00'),(11,'귀멸의 칼날','‘탄지로’와 상현 4 ‘한텐구’의 목숨을 건 혈투와, ‘무잔’과의 최종 국면을 앞둔 귀살대원들의 마지막 훈련을 그린','15세 이상','https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87985/87985_320.jpg',103,'애니메이션','소토자키 하루오','하나에 나츠키 ,  키토 아카리 ,  하나자와 카나 ,  카와니시 켄고','2024-02-13 15:00:00'),(14,'파묘','미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은기이한 병이 대물림되는 집안의 장손을 만난다.조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고,돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다.“전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지”절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘.‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만,‘화림’의 설득으로 결국 파묘가 시작되고…나와서는 안될 것이 나왔다.','15세 이상','https://cf.lottecinema.co.kr//Media/MovieFile/MovieImg/202402/20808_103_1.jpg',134,'미스터리','장재현','최민식, 김고은, 유해진, 이도현','2024-02-21 15:00:00');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mnum` int NOT NULL,
  `thnum` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `foreign_key_thnum_idx` (`mnum`),
  KEY `foreign_key_thnum_idx1` (`thnum`),
  CONSTRAINT `f_mnum` FOREIGN KEY (`mnum`) REFERENCES `movie` (`mnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_thnum` FOREIGN KEY (`thnum`) REFERENCES `theater` (`thnum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
INSERT INTO `screen` VALUES (1,1,1,'2024-02-02','2024-03-02','2024-02-15 11:27:50','2024-02-21 16:37:04'),(2,1,2,'2024-01-31','2024-03-03','2024-02-15 11:27:50','2024-02-15 11:27:50'),(4,2,1,'2024-01-24','2024-02-29','2024-02-15 11:34:15','2024-02-15 11:34:15'),(5,2,2,'2024-01-24','2024-03-03','2024-02-15 11:34:15','2024-02-15 11:34:15'),(6,2,3,'2024-01-24','2024-03-05','2024-02-15 11:34:15','2024-02-15 11:34:15'),(7,3,1,'2024-02-07','2024-03-10','2024-02-15 11:37:15','2024-02-15 11:37:15'),(8,3,2,'2024-02-07','2024-03-01','2024-02-15 11:37:15','2024-02-15 11:37:15'),(9,3,3,'2024-02-07','2024-02-25','2024-02-15 11:37:15','2024-02-15 11:37:15'),(13,4,1,'2024-02-07','2024-03-15','2024-02-15 11:41:54','2024-02-15 11:41:54'),(14,4,2,'2024-02-07','2024-03-23','2024-02-15 11:41:54','2024-02-15 11:41:54'),(15,4,3,'2024-02-07','2024-04-05','2024-02-15 11:41:54','2024-02-15 11:41:54'),(16,5,1,'2024-02-07','2024-03-10','2024-02-15 11:42:04','2024-02-15 11:42:04'),(17,5,2,'2024-02-07','2024-03-01','2024-02-15 11:42:04','2024-02-15 11:42:04'),(18,5,3,'2024-02-07','2024-02-25','2024-02-15 11:42:04','2024-02-15 11:42:04'),(19,6,1,'2024-02-21','2024-03-23','2024-02-16 11:11:12','2024-02-16 11:11:12'),(20,6,2,'2024-02-21','2024-04-01','2024-02-16 11:11:12','2024-02-16 11:11:12'),(21,7,1,'2024-02-28','2024-05-03','2024-02-16 11:11:12','2024-02-16 11:11:12'),(22,7,2,'2024-02-28','2024-05-01','2024-02-16 11:11:12','2024-02-16 11:11:12'),(23,7,3,'2024-02-28','2024-05-09','2024-02-16 11:11:12','2024-02-16 11:11:12'),(25,11,1,'2024-02-19','2024-03-30','2024-02-20 15:44:41','2024-02-20 15:47:59'),(26,1,3,'2024-02-01','2024-03-09','2024-02-21 08:02:41','2024-02-21 08:02:41'),(29,14,7,'2024-02-22','2024-04-05','2024-02-21 16:36:03','2024-02-21 16:36:03');
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `thnum` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `loc` longtext NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`thnum`),
  UNIQUE KEY `thnum_UNIQUE` (`thnum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'롯데시네마 판교','경기 성남시 수정구 창업로 18','1544-8855','2024-02-15 11:21:40','2024-02-21 16:34:39'),(2,'CGV 판교','경기 성남시 분당구 판교역로146번길 20 현대백화점 5층','1544-1122','2024-02-15 11:22:44','2024-02-20 13:48:30'),(3,'메가박스 분당','경기 성남시 분당구 황새울로 332 분당문화센터','1544-0070','2024-02-15 11:22:44','2024-02-15 11:22:44'),(6,'롯데시네마 도곡','서울특별시 강남구 남부순환로 2753','1544-8855','2024-02-20 13:49:17','2024-02-20 13:49:17'),(7,'메가박스 코엑스','서울특별시 강남구 봉은사로 524','1544-0070','2024-02-21 16:35:14','2024-02-21 16:35:14');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `mnum` int NOT NULL AUTO_INCREMENT,
  `id` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `position` varchar(45) NOT NULL DEFAULT '일반회원',
  PRIMARY KEY (`mnum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','adminadmin','관리자','관리자'),(2,'a','a','사용자 A','전문평론가'),(3,'b','b','사용자 B','일반회원'),(4,'c','c','사용자 C','전문평론가'),(5,'d','d','사용자 D','전문평론가');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-21 16:40:25
