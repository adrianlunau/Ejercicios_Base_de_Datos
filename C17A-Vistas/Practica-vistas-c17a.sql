# 1 - a) Crear una vista denominada “vista_mostrar_pais” que devuelva un reporte de los países.
CREATE VIEW vista_mostrar_pais AS SELECT country FROM country;

# b) Invocar la vista creada.
SELECT * FROM vista_mostrar_pais;

# 2- a) Crear una vista que devuelva un resumen con el apellido y nombre (en una sola columna denominada “artista”) de los artistas y la cantidad de
# filmaciones que tienen. Traer solo aquellos que tengan más de 25 filmaciones y ordenarlos por apellido.
CREATE VIEW vista_artistas AS 
SELECT concat(first_name, " ", last_name) artista, count(*) cant_films 
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
group by a.actor_id HAVING count(*)>25
order by last_name asc;


# b) Invocar la vista creada.
SELECT * FROM vista_artistas;

# c) En la misma invocación de la vista, traer aquellos artistas que tienen menos de 33 filmaciones.
SELECT * FROM vista_artistas WHERE cant_films < 33;

# d) Con la misma sentencia anterior, ahora, mostrar el apellido y nombre de los artistas en minúsculas y traer solo aquellos artistas cuyo apellido
# comience con la letra "a".
SELECT LOWER(artista), cant_films FROM vista_artistas WHERE cant_films < 33 and artista LIKE ("a%");

# e) Eliminar la vista creada.
DROP VIEW vista_artistas;

# 3- a) Crear una vista que devuelva un reporte del título de la película, el apellido
# y nombre (en una sola columna denominada “artista”) de los artistas y el
# costo de reemplazo. Traer solo aquellas películas donde su costo de
# reemplazo es entre 15 y 27 dólares, ordenarlos por costo de reemplazo.

CREATE VIEW vista_reporte AS
SELECT f.title, concat(a.first_name, " ", a.last_name) artista, f.replacement_cost
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE f.replacement_cost between 15 and 17;                  # <<<<<<<<<< Tengo duda con la consigna, como se puede traer todos los artitas en una misma celda.

# b) Invocar la vista creada.
SELECT * FROM vista_reporte;

# c) En la misma invocación de la vista, traer aquellas películas que comienzan con la letra "b".
SELECT * FROM vista_reporte WHERE title LIKE ("b%");

#d) Modificar la vista creada agregando una condición que traiga los artistas cuyo nombre termine con la letra "a" y 
# 	ordenarlos por mayor costo de reemplazo.
ALTER VIEW vista_reporte AS
SELECT f.title, concat(a.first_name, " ", a.last_name) artista, f.replacement_cost
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE f.replacement_cost between 15 and 17 and first_name LIKE ("%a")
order by replacement_cost desc;

# e) Invocar la vista creada.
SELECT * FROM vista_reporte;

