DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `User_Defined_Exception_ex`
(IN `User_id` VARCHAR(7), IN `Pass_word` VARCHAR(20), IN `Movie_id` VARCHAR(7))
    NO SQL
BEGIN
	DECLARE invalid_request CONDITION FOR SQLSTATE '22012';
	DECLARE invalid_login CONDITION FOR SQLSTATE '22011';
    
    DECLARE Exit HANDLER FOR invalid_login
    RESIGNAL SET MESSAGE_TEXT = 'Invalid Log Info';
	
    
    DECLARE Exit HANDLER FOR invalid_request
    RESIGNAL SET MESSAGE_TEXT = 'You Did not purchased the given Movie';
   	
    if(check_log_info(User_id,Pass_word))
    THEN
    	IF EXISTS (SELECT t1.Transection_id FROM transection t1 inner join transection t2 
		WHERE t1.Transection_id=t2.Transection_id and t1.Sub_ID=User_id and t2.Movie_id=Movie_id)
  	  THEN
   		    Select "Enjoy Your Movie ";
 
  	  ELSE
              SIGNAL invalid_request;
   	  END IF;
	  
    ELSE
    	SIGNAL invalid_login;  
   	END if;
END$$
DELIMITER ;