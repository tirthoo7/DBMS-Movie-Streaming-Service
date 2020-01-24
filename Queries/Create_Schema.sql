CREATE TABLE `artist` (
  `Artist_ID` varchar(5) NOT NULL,
  `Artist_Name` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Fees` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`Artist_ID`)
) ;

CREATE TABLE `cast` (
  `Artist_ID` varchar(5) NOT NULL,
  `Movie_Cast` varchar(5) NOT NULL,
  PRIMARY KEY (`Artist_ID`,`Movie_Cast`),
  CONSTRAINT `FK_Artist_Table` FOREIGN KEY (`Artist_ID`) REFERENCES `artist` (`Artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Movie_Table` FOREIGN KEY (`Movie_Cast`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `charge` (
  `Movie_Purchas_ID` varchar(5) NOT NULL,
  `Cost` int(5) DEFAULT NULL,
  `Validity` text,
  PRIMARY KEY (`Movie_Purchas_ID`)
) ;

CREATE TABLE `director` (
  `Dir_ID` varchar(5) NOT NULL,
  `Movie_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Dir_ID`,`Movie_ID`),
  CONSTRAINT `FK_Director_Table` FOREIGN KEY (`Dir_ID`) REFERENCES `director_details` (`Dir_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Movie_t` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `director_details` (
  `Dir_ID` varchar(5) NOT NULL,
  `Director_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Dir_ID`)
) ;

CREATE TABLE `genres` (
  `Geners_Type` varchar(55) NOT NULL,
  `Movie_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Geners_Type`,`Movie_ID`),
  CONSTRAINT `FK_Geners_Movie` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `movie` (
  `Movie_ID` varchar(5) NOT NULL,
  `Title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `IMDB_Score` double DEFAULT NULL,
  `Budget` bigint(20) DEFAULT '0',
  `Gross_Earnings` bigint(20) DEFAULT '0',
  `Movie_Purchas_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`),
  
  CONSTRAINT `FK_Charge` FOREIGN KEY (`Movie_Purchas_id`) REFERENCES `charge` (`Movie_Purchas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `subscriber` (
  `Sub_ID` varchar(5) NOT NULL,
  `Sub_Password` varchar(15) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Full_Name` varchar(30) DEFAULT NULL,
  `Country` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`Sub_ID`)
) ;

CREATE TABLE `transaction` (
  `transaction_id` varchar(5) NOT NULL,
  `Account_Number` varchar(50) DEFAULT NULL,
  `Banks_Name` varchar(30) DEFAULT NULL,
  `Sub_ID` varchar(5) DEFAULT NULL,
  `Movie_id` varchar(5) DEFAULT NULL,
  `transaction_Date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `FK_Sub` FOREIGN KEY (`Sub_ID`) REFERENCES `subscriber` (`Sub_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Tran_Movie` FOREIGN KEY (`Movie_id`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
