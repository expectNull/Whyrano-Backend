-- CREATE database `NULLLEDGE`;
-- USER_TB
CREATE TABLE `NULLLEDGE`.`USER_TB` (
	`USER_ID` INT NOT NULL AUTO_INCREMENT,
    
	`GMAIL_NM` VARCHAR(45) NOT NULL UNIQUE,
    `SALT_MAIL_NM` VARCHAR(80) NOT NULL,
    `PASS_NM` VARCHAR(70) NOT NULL,
    `SALT_NM` VARCHAR(64) NOT NULL,
    
	`USER_NICK_NM` VARCHAR(45) NOT NULL UNIQUE,
-- 	`GMAIL_TOKEN_NM` VARCHAR(45) NOT NULL,
-- 	`SOL_TOKEN_NM` VARCHAR(45) NOT NULL,
-- 	`BOJ_ID` VARCHAR(45) NULL UNIQUE,
	`AUTHORITHY_AMT` INT DEFAULT 0,
	`NULLPOINT_AMT` INT DEFAULT 0,
	`SIGNUP_YMD` TIMESTAMP DEFAULT NOW(),
    `STATUS_CONTENT` VARCHAR(120)  DEFAULT "잘 부탁드립니다",
	PRIMARY KEY (`USER_ID`)
);

-- PROBLEM_SET_TB
-- CREATE TABLE `NULLLEDGE`.`PROBLEM_SET_TB` (
-- 	`PROBLEM_ID` INT NOT NULL AUTO_INCREMENT,
-- 	`TITLE_NM` VARCHAR(200) NOT NULL,
-- 	`TAGS_NM` TEXT NOT NULL,
-- 	`SOLVED_USR` TEXT NULL,
-- 	`HASH_ID` INT NOT NULL,
-- 	PRIMARY KEY (`PROBLEM_ID`)
-- );
  
  
-- MYSOLVED_TB
-- CREATE TABLE `NULLLEDGE`.`MYSOLVED_TB` (
-- 	`USER_ID` INT NULL,
-- 	`DP_AMT` INT NULL,
-- 	`GRAPHS_AMT` INT NULL,
-- 	`DS_AMT` INT NULL,
-- 	`GREEDY_AMT` INT NULL,
-- 	`BRUTE_FORCE_AMT` INT NULL,
-- 	`BINARY_SEARCH_AMT` INT NULL,
-- 	`SORT_AMT` INT NULL,
-- 	`STRING_AMT` INT NULL,
-- 	`ETC_AMT` INT NULL,
-- 	FOREIGN KEY (`USER_ID`) REFERENCES `NULLLEDGE`.`USER_TB` (`USER_ID`)
-- );


-- POSTS_TB
CREATE TABLE `NULLLEDGE`.`POST_TB` (
	`POST_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `PROBLEM_ID` INT NULL,
    `USER_ID` INT NOT NULL,
    `TYPE_GB` INT NOT NULL,
    `POST_NM` VARCHAR(70) DEFAULT "",
    `POST_YMD` TIMESTAMP DEFAULT NOW(),
    `CONTENT` TEXT NULL,
    `VIEW_CNT` INT DEFAULT 0,
    `PARENT_POST_ID` INT DEFAULT -1,
    `KIND_POINT_AMT` INT DEFAULT 0,
	`NOTICE_GB` INT DEFAULT -1,
	`CHECK_GB` INT DEFAULT -1, 
    FOREIGN KEY (`USER_ID`) REFERENCES `NULLLEDGE`.`USER_TB` (`USER_ID`)
);

-- LIKE_LOG_TB
CREATE TABLE `NULLLEDGE`.`LIKE_LOG_TB` (
	`USER_ID` INT NOT NULL,
	`POST_ID` INT NOT NULL,
    `LOG_YMD` TIMESTAMP DEFAULT NOW(),
    `VALUE_AMT` INT DEFAULT 0,
    FOREIGN KEY (`USER_ID`) REFERENCES `NULLLEDGE`.`USER_TB` (`USER_ID`),
    FOREIGN KEY (`POST_ID`) REFERENCES `NULLLEDGE`.`POST_TB` (`POST_ID`)
);

-- FILE_TB
CREATE TABLE `NULLLEDGE`.`FILE_TB` (
	`FILE_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID` INT NOT NULL,
    `POST_ID` INT NOT NULL,
    `FILE_NM` VARCHAR(45) NOT NULL,
    `FILE_PATH` VARCHAR(45) NOT NULL,
    `FILE_TYPE` VARCHAR(45) NOT NULL,
    `FILE_SIZE` DOUBLE NOT NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `NULLLEDGE`.`USER_TB` (`USER_ID`),
    FOREIGN KEY (`POST_ID`) REFERENCES `NULLLEDGE`.`POST_TB` (`POST_ID`)
);

CREATE TABLE `NULLLEDGE`.`TAG_TB` (
  `TAG_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `TAG_NM` VARCHAR(45) NULL,
  `POST_ID` INT NULL,
	`USER_ID` INT DEFAULT -1,
FOREIGN KEY (`POST_ID`) REFERENCES `NULLLEDGE`.`POST_TB` (`POST_ID`)
);
