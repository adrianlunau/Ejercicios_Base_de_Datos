SELECT canciones.nombre, generos.nombre FROM canciones, generos WHERE canciones.id_genero = generos.id and  generos.nombre != "Rock" and canciones.compositor = "Willie Dixon";

SELECT canciones.nombre, generos.nombre FROM canciones INNER JOIN generos ON canciones.id_genero = generos.id WHERE generos.nombre="Blues" and canciones.compositor = "Willie Dixon";

# Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT series.title, genres.name FROM series INNER JOIN genres ON series.genre_id = genres.id;

# Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.

SELECT episodes.title, CONCAT(actors.first_name, " ", actors.last_name) AS actor
FROM episodes 
INNER JOIN actor_episode ON episodes.id = actor_episode.episode_id 
INNER JOIN actors ON actors.id = actor_episode.actor_id;


# Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película
# de la saga de La Guerra de las galaxias.

SELECT distinct CONCAT(actors.first_name, " ", actors.last_name) AS actor
FROM actors 
INNER JOIN actor_movie ON actors.id = actor_movie.actor_id 
INNER JOIN movies ON movies.id = actor_movie.movie_id 
WHERE movies.title LIKE "%La Guerra de las galaxias%";                

# Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.

SELECT genres.name, count(movies.genre_id) AS cantidad FROM movies INNER JOIN genres ON movies.genre_id = genres.id group by movies.genre_id;
