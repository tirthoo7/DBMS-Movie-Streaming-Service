DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Create_Email_List_Reminder`()
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress varchar(100) DEFAULT "";
 	DECLARE emailList varchar(40000) DEFAULT "";
    -- declare cursor for Subscriber email
    DEClARE curEmail 
        CURSOR FOR 
        	
        	SELECT s.Email from Transection t inner join movie m inner join charge c INNER join subscriber s
			where t.Movie_id=m.Movie_ID and m.Movie_Purchas_id=c.Movie_Purchas_ID and t.Sub_ID =s.Sub_ID 			 
			and DATEDIFF(CURDATE(),t.Transection_Date) < c.Validity and 			 
			c.Validity-DATEDIFF(CURDATE(),t.Transection_Date)<5;
    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
 
    OPEN curEmail;
 
    getEmail: LOOP
        FETCH curEmail INTO emailAddress;
        IF finished = 1 THEN 
            LEAVE getEmail;
        END IF;
        -- build email list
        SET emailList = CONCAT(emailAddress,";",emailList);
    END LOOP getEmail;
    CLOSE curEmail;
 	select emailList as "Send Email To Given Users";
    select "Your Validity will over soon, Dont Miss The High Quality Streaming" as "Reminder";
END$$
DELIMITER ;