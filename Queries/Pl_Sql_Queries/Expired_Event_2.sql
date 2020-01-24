CREATE DEFINER=`root`@`localhost` EVENT `Expired` 
ON SCHEDULE EVERY 1 DAY 
STARTS '2019-09-26 12:00:00' ENDS '2019-09-28 14:00:00' 
ON COMPLETION PRESERVE ENABLE DO DELETE t
from transection_dummy t inner join movie m inner join charge c 
where t.Movie_id=m.Movie_ID and m.Movie_Purchas_id=c.Movie_Purchas_ID and
DATEDIFF(CURDATE(),t.Transection_Date) > c.Validity