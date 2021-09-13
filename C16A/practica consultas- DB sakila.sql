# Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar alias para mostrar los nombres de las columnas en español.
SELECT first_name as nombre, last_name as apellido FROM actor limit 5;

#  Obtener un listado que incluya nombre, apellido y correo electrónico de los
#   clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las columnas en español.
SELECT first_name nombre, last_name apellido, email, active
FROM customer
WHERE active = 0;

# Obtener un listado de films incluyendo título, año y descripción de los films
# que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de
# mayor a menor. Utilizar alias para mostrar los nombres de las columnas en español.

SELECT title titulo, release_year anio, description descripcion, rental_duration
FROM film
WHERE rental_duration > 5 order by rental_duration desc;

#Obtener un listado de alquileres (rentals) que se hicieron durante el mes de mayo de 2005, incluir en el resultado todas las columnas disponibles.
SELECT * FROM rental WHERE rental_date between "2005-05-01" and "2005-05-31";

# PARTE 2 ----------------

# Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”.
SELECT count(*) cantidad FROM rental; 

# Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para
# mostrarlo en una columna llamada “total”, junto a una columna con la
# cantidad de alquileres con el alias “Cantidad” y una columna que indique el
# “Importe promedio” por alquiler.
SELECT sum(amount) total, count(*) cantidad, avg(amount) as "Importe promedio" 
FROM payment;

# Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
# que más dinero gastan y en cuántos alquileres lo hacen?

SELECT customer_id cliente, sum(amount) total, count(*) "Cantidad de alquileres" 
from payment 
group by customer_id 
order by sum(amount) desc limit 10;

# Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto
# total para todos los clientes que hayan gastado más de 150 dólares en alquileres.

SELECT customer_id "ID de cliente", sum(amount) total, count(*) "Cantidad de alquileres" 
from payment 
group by customer_id
HAVING sum(amount) > 150;

# Generar un reporte que muestre por mes de alquiler (rental_date de tabla
# rental), la cantidad de alquileres y la suma total pagada (amount de tabla
# payment) para el año de alquiler 2005 (rental_date de tabla rental).

SELECT MONTH(rental_date) mes, count(*), sum(amount)
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
where year(rental_date) = 2005
group by month(rental_date);

# Generar un reporte que responda a la pregunta: ¿cuáles son los 5
# inventarios más alquilados? (columna inventory_id en la tabla rental). Para
# cada una de ellas indicar la cantidad de alquileres.

SELECT inventory_id, count(*)
FROM rental
group by inventory_id
order by count(*) desc limit 5;





