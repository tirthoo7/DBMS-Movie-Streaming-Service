DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_User_Name`(`user_id` VARCHAR(10)) 
RETURNS varchar(50) CHARSET utf8 COLLATE utf8_bin
    NO SQL
    DETERMINISTIC
BEGIN
	declare user_name varchar(50);
    select s.Full_Name into user_name from Subscriber s where s.sub_id=user_id; 
RETURN user_name;
END$$
DELIMITER ;