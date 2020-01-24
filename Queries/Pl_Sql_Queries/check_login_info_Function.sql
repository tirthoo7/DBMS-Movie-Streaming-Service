DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `check_Log_info`
(`User_id` VARCHAR(7), `Pass_word` VARCHAR(20)) RETURNS tinyint(1)
    NO SQL
BEGIN
	declare temp bool default false;
    
	if exists (select s.Sub_id from subscriber s where 
	s.sub_id=User_id and s.Sub_password=Pass_word)
	
		THEN set temp=true;
		
	end if;
    RETURN temp;
END$$
DELIMITER ;