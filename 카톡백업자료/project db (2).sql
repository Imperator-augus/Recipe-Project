CREATE TABLE t_user (
	user_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	uid VARCHAR(10) UNIQUE NOT NULL,
	upw VARCHAR(10) NOT NULL,
	nm VARCHAR(10) NOT NULL,
	gender INT UNSIGNED CHECK(gender IN (0,1)),
	created_at DATETIME DEFAULT CURRENT_TIME
	);
	
CREATE TABLE c_board (
	ctgr_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	ctgr_nm VARCHAR(10) NOT NULL
	);
	
CREATE TABLE f_board (
	food_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	food_img VARCHAR(100),
	food_title VARCHAR(100) NOT NULL,
	food_url VARCHAR(1000),
	food_ctnt VARCHAR(1000) NOT NULL,
	food_view INT DEFAULT 0,
	user_no INT UNSIGNED NOT NULL,
	ctgr_no INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIME,
	FOREIGN KEY(user_no) REFERENCES t_user(user_no),
	FOREIGN KEY(ctgr_no) REFERENCES c_board(ctgr_no)
	);

CREATE TABLE r_board (
	reply_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	reply_ctnt VARCHAR(1000),
	user_no INT UNSIGNED NOT NULL,
	food_no INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIME,
	FOREIGN KEY(user_no) REFERENCES t_user(user_no),
	FOREIGN KEY(food_no) REFERENCES f_board(food_no)
	);
	
CREATE TABLE q_board (
	qust_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	qust_title VARCHAR(100) NOT NULL,
	qust_ctnt VARCHAR(1000) NOT NULL,
	user_no INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIME,
	FOREIGN KEY(user_no) REFERENCES t_user(user_no)
	);
	
CREATE TABLE a_board (
	ansr_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	ansr_ctnt VARCHAR(1000) NOT NULL,
	m_no INT UNSIGNED NOT NULL,
	qust_no INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIME,
	FOREIGN KEY(m_no) REFERENCES manager(m_no),
	FOREIGN KEY(qust_no) REFERENCES q_board(qust_no)
	);
	
CREATE TABLE manager (
	m_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	mid VARCHAR(10) UNIQUE NOT NULL,
	mpw VARCHAR(10) NOT NULL,
	m_nm VARCHAR(10) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIME
   );