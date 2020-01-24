DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_movie_added`()
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress varchar(100) DEFAULT "";
 	DECLARE emailList varchar(40000) DEFAULT "";
    -- declare cursor for Subscriber email
    DEClARE curEmail 
        CURSOR FOR 
        	
        	SELECT s.Email from subscriber s;
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
        SET emailList = CONCAT(emailAddress,"; \n",emailList);
    END LOOP getEmail;
    CLOSE curEmail;
 	select emailList as "Send Email To Given Users";
    select "New High Quality Movie is here, Check Out Now!!!!" as "Attention!!";
END$$
DELIMITER ;