DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Subscriber_Details`(IN `CustName` VARCHAR(20))
BEGIN
	if EXISTS (select s.Sub_ID from subscriber s where s.Full_Name=CustName)
    then 
	select CustName as "Details of Subscriber :"  ;
		select * from subscriber where FULL_Name=CustName;
    select CustName as "Transection Details of Subscriber :";
		select t.* from transection t inner join subscriber s 
		where s.sub_id=t.sub_id and s.Full_Name=CustName; 
    select CustName as "Movie Purchased By :";
		select * from Movie where Movie.Movie_ID in
        (select t.Movie_ID from transection t inner join subscriber s 
        where s.sub_id=t.sub_id and s.Full_Name=CustName); 
    ELSE
    	SELECT "User Does Not Exist" as "Error";
       end if;
END$$
DELIMITER ;