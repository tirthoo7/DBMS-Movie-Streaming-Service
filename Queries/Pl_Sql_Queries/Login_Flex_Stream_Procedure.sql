DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Log_IN_Flex_Stream`(IN `user_id` VARCHAR(5), IN `pass_word` VARCHAR(20))
BEGIN
	declare temp varchar(100) default "False";
    declare name_cust varchar(50) ;
	if exists (select s.Sub_id from subscriber s where s.sub_id=user_id and s.Sub_password=pass_word)
		then set name_cust=get_User_Name(user_id);
        set temp=concat(" Welcome Back ",name_cust," To Online Movie Streaming");
	else
		set temp="Invalid User ID or Password";
	end if;
    select temp as "Accesss";
END$$
DELIMITER ;