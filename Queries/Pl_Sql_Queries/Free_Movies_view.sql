CREATE view Free_Movies_details as SELECT m.Title,m.Year,m.IMDB_Score from Movie m INNER join charge c where c.Movie_Purchas_ID=m.Movie_Purchas_id and c.Cost=0


SELECT * FROM `free_movies_details`