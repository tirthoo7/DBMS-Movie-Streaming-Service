CREATE view family_type_movies_details as SELECT m.Title,m.Year,m.IMDB_Score from Movie m INNER join genres g where g.Movie_ID=m.Movie_ID and g.Geners_Type="Family"
SELECT * FROM `family_type_movies_details`