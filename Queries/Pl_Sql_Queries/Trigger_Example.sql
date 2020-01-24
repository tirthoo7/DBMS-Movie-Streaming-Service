CREATE TRIGGER `after_movie_insert` AFTER INSERT ON `movie`
 FOR EACH ROW BEGIN
	DECLARE new_movie_id varchar(10);
    select Max(movie.Movie_ID) into new_movie_id from movie ;
    if not EXISTS (SELECT g.Movie_ID from genres g where g.Movie_ID=new_movie_id)
    	THEN insert into genres(genres.Geners_Type,genres.Movie_ID) VALUES("Entertainment",new_movie_id);
   	end if;
END