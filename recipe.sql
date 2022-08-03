-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- project 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `project`;

-- 테이블 project.a_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `a_board` (
  `ansr_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ansr_ctnt` varchar(1000) NOT NULL,
  `m_no` int(10) unsigned NOT NULL,
  `qust_no` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT curtime(),
  PRIMARY KEY (`ansr_no`),
  KEY `m_no` (`m_no`),
  KEY `qust_no` (`qust_no`),
  CONSTRAINT `a_board_ibfk_1` FOREIGN KEY (`m_no`) REFERENCES `manager` (`m_no`),
  CONSTRAINT `a_board_ibfk_2` FOREIGN KEY (`qust_no`) REFERENCES `q_board` (`qust_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.a_board:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `a_board` DISABLE KEYS */;
INSERT IGNORE INTO `a_board` (`ansr_no`, `ansr_ctnt`, `m_no`, `qust_no`, `created_at`) VALUES
	(11, '회원가입은 우측상단 로그인 옆에 버튼을 클릭하여 필수정보 입력후 가입 진행해주시면 됩니다.^^', 1, 11, '2022-05-19 11:33:48'),
	(12, '영상은 유튜브에 업로드하셔서 주소만 동영상URL입력창에 복사하여주시면 업로드 가능합니다.^^', 1, 9, '2022-05-19 11:34:45'),
	(13, '동남아 카테고리는 현재 준비중에 있습니다. 추후 일정발표 공지사항으로 남겨드리겠스니다. 감사합니다.^^', 1, 8, '2022-05-19 11:35:15'),
	(14, '흐흐흐흐', 1, 12, '2022-05-19 12:15:20'),
	(15, 'ㅓㅓㅗㅓㅗㅗㅓㅗㅓㅗㅓㅗㅓㅗㅓㅗ', 1, 8, '2022-05-19 12:16:47'),
	(16, 'ㅀㄹㄹㄹㄹㄹ', 1, 7, '2022-05-19 12:17:09'),
	(17, '오늘 점심은 지지고', 1, 13, '2022-05-19 12:28:24'),
	(18, '오늘 점심은 지지고', 1, 13, '2022-05-19 12:28:25'),
	(19, 'ㅁㄴㅇㅁㄴㅇㄹㄴㅁㅇㄹ', 1, 9, '2022-05-19 12:29:21'),
	(20, 'ㄱㄱ', 1, 13, '2022-08-03 14:56:44'),
	(21, '안녕하세요\r\n', 1, 16, '2022-08-03 14:58:04'),
	(22, '안녕하세요2', 1, 16, '2022-08-03 14:58:19'),
	(23, '', 1, 16, '2022-08-03 14:58:20'),
	(24, 'ㅁㄴ어라더\r\n', 1, 11, '2022-08-03 15:09:21');
/*!40000 ALTER TABLE `a_board` ENABLE KEYS */;

-- 테이블 project.c_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `c_board` (
  `ctgr_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctgr_nm` varchar(10) NOT NULL,
  PRIMARY KEY (`ctgr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.c_board:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `c_board` DISABLE KEYS */;
INSERT IGNORE INTO `c_board` (`ctgr_no`, `ctgr_nm`) VALUES
	(1, '한식'),
	(2, '양식'),
	(3, '일식'),
	(4, '중식');
/*!40000 ALTER TABLE `c_board` ENABLE KEYS */;

-- 테이블 project.f_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `f_board` (
  `food_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `food_img` varchar(100) DEFAULT NULL,
  `food_title` varchar(100) NOT NULL,
  `food_url` varchar(1000) DEFAULT NULL,
  `food_ctnt` varchar(3000) NOT NULL,
  `food_view` int(11) DEFAULT 0,
  `user_no` int(10) unsigned NOT NULL,
  `ctgr_no` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT curtime(),
  PRIMARY KEY (`food_no`),
  KEY `user_no` (`user_no`),
  KEY `ctgr_no` (`ctgr_no`),
  CONSTRAINT `f_board_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `t_user` (`user_no`),
  CONSTRAINT `f_board_ibfk_2` FOREIGN KEY (`ctgr_no`) REFERENCES `c_board` (`ctgr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.f_board:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `f_board` DISABLE KEYS */;
INSERT IGNORE INTO `f_board` (`food_no`, `food_img`, `food_title`, `food_url`, `food_ctnt`, `food_view`, `user_no`, `ctgr_no`, `created_at`) VALUES
	(52, '097610c4-7066-43fc-8536-6a6059d28b01.jpg', '콘스프', 'https://youtu.be/Gc3xenZfKoI', ' 일식집st콘치즈 초간단 레시피!고소함 폭발!홈파티 맥주안주로 강\r\n추\r\n일식집 가면 항상 리필해 먹게 되는 것 중 하나가 콘치즈인데요. 고소\r\n하면서 입에서 톡톡 터지는 식감이 참 좋지요. 간단한 맥주안주로 추\r\n천드립니다^0^\r\n\r\n[재료]\r\n캔옥수수 1캔 버터 1T(크게) 설탕 1/2T 마요네즈 취향것 피자치즈 \r\n취향것 파슬리가루 톡톡', 0, 1, 2, '2022-06-22 16:16:40'),
	(53, 'f90e094e-0637-4937-b4d9-e4fe1c0c9e06.jpg', '텐동', 'https://youtu.be/xjTUFxJ2de8', ' 집에서 만드는 일본식 튀김덮밥 텐동 만들기 바삭한 튀김 만드는\r\n법과 텐동소스레시피까지 ~ 맛있는 한그릇요리\r\n\r\n[텐동만들기 재료 ]\r\n두릅 3~4개\r\n고구마 1개\r\n가지 1/3개\r\n깻잎 2장\r\n새우 3마리\r\n계란 1개\r\n밥 1인분 \r\n[바삭한 튀김옷 만들기]\r\n튀김가루 4큰술\r\n감자전분 2큰술\r\n물 적당량\r\n얼음 2~3개\r\n식용유 1티스푼 \r\n[텐동간장소스 재료]\r\n물 60g\r\n간장 35g\r\n쯔유 15g\r\n설탕 2큰술\r\n맛술 1큰술', 0, 2, 3, '2022-06-22 16:19:48'),
	(54, 'cf4e0ef5-5c3c-4651-a1a7-2f03f327ec86.jpg', '크림파스타', 'https://youtu.be/JBkHgyyTBlM', ' 크림파스타 만들기 크림스파게티 만드는 법 생각보다 간단해요 :)\r\n\r\n[재료]\r\n올리브유 약간 파스타면 1인분 베이컨 작은 거 4장 체다치즈 2장 \r\n소금 약간 후추 약간 흰우유 180ml 양송이버섯 2개 다진 마늘 1\r\n스푼 버터 1숟갈 채 썬 양파 적당량\r\n\r\n크림파스타를 만들기 위해\r\n필요한 재료들을 알려드릴게요.\r\n올리브유 약간, 파스타 건면 1인분, 베이컨 작은 거 4장, 체다치즈 \r\n2장, 소금 약간, 후추 약간, 흰우유 180ml, 양송이버섯 2개, 다진 \r\n마늘 한 스푼, 버터 한 숟갈, 채 썬 양파 적당량\r\n\r\n\r\n먼저 베이컨을 먹기 좋은 크기로 잘라주세요.\r\n양송이버섯도 씻어서 잘라주세요.	\r\n오늘 크림파스타는 1인분만 만들 거라 100원 동전 크기 정도의 크\r\n림파스타를 만들게요.\r\n보기엔 양이 적어 보여도 면을 익히고 크림소스가 추가되면 양이 \r\n딱 좋을 것 같아요.	\r\n끓는 물에 소금을 약간 넣어서 팔팔 끓여주세요.	\r\n파스타 건면을 골고루 펼쳐 넣어주세요.	\r\n젓가락으로 면을 끓는 물 안으로 넣어서 2분 정도만 익혀주세요.\r\n크림소스에 다시 면을 넣어서 같이 익혀줄 거라서 2분 정도가 적당\r\n해요!	\r\n끓는 물에서 2분 정도 익힌 파스타면을 채반에 옮겨주세요.\r\n★이때!!!★\r\n찬물에 헹구시지 마시고 그냥 이대로 파스타면을 식혀주세요.	\r\n이제 크림파스타 소스를 만들 거예요!\r\n달궈진 프라이팬에 올리브유를 적당히 넣고 다진 마늘을 넣고 볶아\r\n주세요.	\r\n다진 마늘이 어느 정도 볶아졌으면 버터를 넣어주세요.\r\n그리고 버터가 다 녹았으면 양송이버섯을 넣고 볶아주세요.	\r\n양송이버섯이 어느 정도 노릇하게 익었으면 채썬 양파와 베이컨을 \r\n넣어주세용	\r\n채썬 양파와 베이컨이 잘 익을 때까지 볶아볶아줍니당!	\r\n그리고 흰우유 180ml를 넣고 보글보글 끓여주세요!	\r\n체다 치즈 2장을 넣어 크림파스타 소스를 진하게 만들어줍니다.\r\n더욱 진한 크림파스타를 드시고 싶으시면 체다 치즈를 더 넣으셔도 \r\n좋아요!	\r\n체다 치즈가 잘 녹을 때까지 보글보글 계속 끓여줍니다.\r\n크림소스를 끓일수록 색깔이 점점 진해져요!\r\n그리고 중간에 크림소스 간을 보셔서 소금으로 간을 맞춰주세요.\r\n저도 크림소스가 밍밍해서 소금을 조금씩 넣어가면서 간을 맞췄어\r\n요!	\r\n채반에서 쉬고 있었던 파스타면을 넣어주세요.	\r\n파스타면과 크림소스를 잘 섞어주세요.\r\n걸쭉하게 드시고 싶으시면 오래 끓이시면 되고,\r\n그냥 묽게 드시고 싶으시면 잠깐만 끓이셔서 바로 드시면 돼요!\r\n저는 걸쭉한 크림파스타를 좋아하기 때문에 오래 끓여줄 거예용!\r\n이쯤에서 그릇에 옮겨 담아줄게요.	\r\n완성된 크림파스타 위에 후추를 솔솔 뿌려주면 완성입니당!\r\n', 0, 1, 2, '2022-06-22 17:04:34'),
	(56, '476d35a5-f303-49de-b33a-63b87d4b6892.jpg', '계란찜', 'https://youtu.be/3lgdOYUqeqU', ' 식당에서 먹던 맛과 비주얼 그대로, 폭탄 계란찜 만드는 법\r\n\r\n[재료]\r\n계란 3개 소금 1/3큰술 설탕 1/3큰술 대파 또는 쪽파 적당량폭탄\r\n계란찜을 만들기 전 재료부터 준비해줍니다.\r\n\r\n계란 3개, 참기름 1 큰 술, 소금 1/3 큰 술, 설탕 1/3 큰 술, 대파 \r\n또는 쪽파 약간, 통깨 조금, 물 100ml	\r\n작은 뚝배기에 계란 3개를 깨뜨려 넣은 뒤 거품기로 계란을 풀어줍\r\n니다	\r\n설탕 1/3 큰 술, 소금 1/3 큰 술을 넣고 한 번 더 거품기로 잘 섞어\r\n주기!	\r\n그리고 나서 물 100ml를 넣어주고 또 한 번 거품기로 휘리릭 ~	\r\n뚝배기를 가스레인지에 올린 뒤 계란이 몽글몽글 익을 때까지 젓가\r\n락으로 저어줍니다.\r\n이때 불은 중불!	\r\n이렇게 계란이 몽글몽글해지면,	\r\n송송 썰어둔 쪽파를 투척한 뒤 뚜껑을 닫고 4-5분가량 익혀주세\r\n요.\r\n뚜껑을 닫고 나서는 약불로 줄여줍니다.	\r\n4-5분 후 뚜껑을 열어보면, 아주 먹음직스럽게 부풀어 오른 계란\r\n찜을 만나볼 수 있다는!!! +_+	\r\n부풀어 오른 계란찜 위에 적당량의 통깨와 참기름을 뿌려주면 폭탄 \r\n계란찜 만드는 법은 이렇게 간단하게 끝이 나요!	\r\n계란찜 만들기가 이렇게 쉬운 거였나 싶을 정도로 넘나 쉬웠던 폭\r\n탄 계란찜 만들기 ♥	\r\n뜨거운 계란찜을 한 숟가락 퍼서 맛을 보니, 대박 ㅠㅠㅠㅠㅠㅠㅠ\r\nㅠ\r\n이거 진짜 식당에서 먹던 바로 그 계란찜 맛이네요 ㅎㅎㅎ\r\n역시 백주부님 레시피는 진짜 최고 최고 ♪ 통깨 적당량 참기름 1\r\n큰술 물 100ml', 0, 3, 1, '2022-06-22 17:38:27'),
	(57, 'bab18c34-26ca-496b-a4ef-7cbb5d3a1363.jpg', '된장찌개', 'https://youtu.be/J4vEoFVcguw', '매콤 된장찌개, 채소와 두부만 넣은 초간단 초스피드 된장찌개\r\n\r\n[재료]\r\n느타리버섯 1줌\r\n양파 1/2개\r\n애호박 1/4개\r\n청양고추 2개\r\n두부 1/4모\r\n물 1.5종이컵 \r\n[양념]\r\n된장 2T\r\n진간장 1T\r\n고추가루 1.5T\r\n다진마늘 0.5T\r\n설탕 0.5티스푼\r\n소금 마지막간\r\n\r\n물1.5종이컵에 된장,고추가루,다진마늘,설탕,간장을 한데넣고 한\r\n소끔 끓여줍니다.	\r\n그사이 양파,버섯,애호박,청양고추,두부는 적당한 크기로 썰어줍\r\n니다.	\r\n한소끔 끓은 된장물에 양파,버섯,애호박,청양고추,두부를 넣어 줍\r\n니다.	\r\n애호박이 익을때까지 끓여주어 간을보아 부족한간은 소금으로 해\r\n주어 완성. 저는 부족한간이 없어 소금은 넣지 않았습니다.', 0, 3, 1, '2022-06-22 17:40:05');
/*!40000 ALTER TABLE `f_board` ENABLE KEYS */;

-- 테이블 project.manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager` (
  `m_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(10) NOT NULL,
  `mpw` varchar(10) NOT NULL,
  `m_nm` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT curtime(),
  PRIMARY KEY (`m_no`),
  UNIQUE KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.manager:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT IGNORE INTO `manager` (`m_no`, `mid`, `mpw`, `m_nm`, `created_at`) VALUES
	(1, '123', '123', '관리자', '2022-05-17 17:21:38');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 테이블 project.q_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `q_board` (
  `qust_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qust_title` varchar(100) NOT NULL,
  `qust_ctnt` varchar(1000) NOT NULL,
  `user_no` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT curtime(),
  PRIMARY KEY (`qust_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `q_board_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `t_user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.q_board:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `q_board` DISABLE KEYS */;
INSERT IGNORE INTO `q_board` (`qust_no`, `qust_title`, `qust_ctnt`, `user_no`, `created_at`) VALUES
	(6, '레시피올리기', '동영상은 어떻게 올리나요?', 6, '2022-05-19 10:49:56'),
	(7, '글쓰기관련', '글쓰기는 어떻게 하는건가요? ', 3, '2022-05-19 11:26:19'),
	(8, '카테고리', '동남아 카테고리는 없나요?', 1, '2022-05-19 11:30:00'),
	(9, '영상첨부가 안되요~~', '레시피 글쓰기 영상첨부가 안되네요~~~~', 1, '2022-05-19 11:30:45'),
	(11, '회원가입', '회원가입은 어떻게하나요?', 2, '2022-05-19 11:32:29'),
	(12, '질문있어요', '사이트가 참 이쁜데 어떻게 사용하는건가요', 1, '2022-05-19 12:08:28'),
	(13, '오늘 점심 지지고 ㄱ?', 'ㄱㄱ?', 7, '2022-05-19 12:27:44'),
	(16, 'dd', 'dd', 1, '2022-08-03 14:57:10');
/*!40000 ALTER TABLE `q_board` ENABLE KEYS */;

-- 테이블 project.r_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `r_board` (
  `reply_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_ctnt` varchar(1000) DEFAULT NULL,
  `user_no` int(10) unsigned NOT NULL,
  `food_no` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT curtime(),
  PRIMARY KEY (`reply_no`),
  KEY `user_no` (`user_no`),
  KEY `food_no` (`food_no`),
  CONSTRAINT `r_board_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `t_user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.r_board:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `r_board` DISABLE KEYS */;
INSERT IGNORE INTO `r_board` (`reply_no`, `reply_ctnt`, `user_no`, `food_no`, `created_at`) VALUES
	(19, 'ㄿㄹㄹㄹㅇㄹㅇㄹㅇㄹㄹㅇㄹㅇ', 3, 47, '2022-05-19 12:19:18'),
	(20, '안녕하세요 텐동 맛있겠네요', 7, 45, '2022-05-19 12:25:48'),
	(22, 'ㅎㅎ', 7, 49, '2022-05-19 12:37:18'),
	(23, 'ㅇㄹㅇㄹㅇㄹ', 1, 51, '2022-05-19 17:26:04'),
	(24, '맛있어보여요!', 2, 52, '2022-06-22 16:18:17'),
	(25, '와우 맛있어보여요!\r\n', 1, 53, '2022-06-22 17:06:28'),
	(26, '덕분에 맛있게 잘 해먹었습니다.^^\r\n', 3, 54, '2022-08-02 16:17:07'),
	(27, '안녕하세요 \r\n', 1, 57, '2022-08-03 14:55:32');
/*!40000 ALTER TABLE `r_board` ENABLE KEYS */;

-- 테이블 project.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
  `user_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `upw` varchar(10) NOT NULL,
  `nm` varchar(10) NOT NULL,
  `birth` date NOT NULL,
  `gender` int(10) unsigned DEFAULT NULL CHECK (`gender` in (0,1)),
  `created_at` datetime DEFAULT curtime(),
  `profile_img` varchar(200) DEFAULT NULL,
  `ctnt` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 project.t_user:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT IGNORE INTO `t_user` (`user_no`, `uid`, `upw`, `nm`, `birth`, `gender`, `created_at`, `profile_img`, `ctnt`) VALUES
	(1, 'qqq', '123', '김예찬', '1997-02-04', 0, '2022-05-12 16:20:23', '6fcbcbed-6f20-49c1-8776-288e4338c873.jpg', '짧지않은 미국생활 후 귀국했습니다. 한식포함 다문화 음식들을 건강하고 맛있는 것만 추려 내 보겠습니다:)..'),
	(2, 'www', '123', '박나라', '1982-05-02', 1, '2022-05-13 14:59:51', '5a982ac6-bea0-4d15-a436-21221ba259f7.jpg', 'http://blog.naver.com/berry__chu'),
	(3, 'eee', '123', '김민준', '1998-05-24', 1, '2022-05-13 15:08:27', '5e52628a-f81f-4022-bae4-dd0076ce5376.jpg', '독학이지만 요리를 사랑하는.요리하는 남자. 마음이 따뜻해지는 요리.치유의요리'),
	(4, 'rrr', '123', '박준우', '1984-05-05', 0, '2022-05-16 12:16:16', '7875094d-1e1f-4387-9389-52cd5f328ad4.jpg', '두율이아빠의 쿡잇TV 놀러가기 : https://bit.ly/3aWUFTq'),
	(5, '1', '1', '1', '2000-01-01', 0, '2022-05-18 11:58:04', NULL, NULL),
	(6, 'ttt', '123', '진수현', '1998-12-12', 0, '2022-05-18 12:42:01', '5e4bb17f-fe65-478a-9c7a-d530d29aa0d0.jpg', '한식을 사랑하는 남자 진수현입니다. 많이들 놀러와주세요~'),
	(7, 'bondu', '1234', '지지고', '2000-02-01', 1, '2022-05-19 12:24:55', 'c7df4c42-2735-41d5-881b-e435e72333e3.jpg', '구경하러 왔습니다'),
	(8, 'ppp', '123', '김모씨', '2009-12-30', 0, '2022-08-03 14:29:08', NULL, NULL),
	(9, 'iii', '123', '김모씨', '1994-02-25', 1, '2022-08-03 14:49:27', NULL, NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
