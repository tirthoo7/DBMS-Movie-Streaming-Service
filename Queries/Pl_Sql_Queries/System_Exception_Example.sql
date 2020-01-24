DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `System_Exception_ex`
(IN `t_id` VARCHAR(7), IN `a_no` VARCHAR(30), IN `b_name` VARCHAR(30), IN `s_id` VARCHAR(7), IN `m_id` VARCHAR(7))
    NO SQL
BEGIN
    -- exit if Foreign key not Found
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
     SELECT ('User does not Exist First Sign Up Then Try Again') AS "Error Message: Log IN";
     SELECT ("Given Movie Is Not Available to Stream please try again later") as "Error Message: Movie Not Available to Stream";
    END;
	 -- exit if PRIMARY key not 
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
    	SELECT ("Transectio ID is Already Present ") as "Error Message :\r\n Primary Key Constrain";
    end;
    
    INSERT INTO `transection`(`Transection_id`, `Account_Number`,`Banks_Name`,`Sub_ID`,`Movie_id`,`Transection_Date`) 
	VALUES (t_id,a_no,b_name,s_id,m_id,CURRENT_DATE);
    SELECT "Enjoy The High Quality Streaming" As "Success Message: Transection Executed";
    

 
end$$
DELIMITER ;