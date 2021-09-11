# Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT * FROM canciones WHERE milisegundos > 120000;

# Listar las canciones cuyo nombre comience con una vocal.
SELECT * FROM canciones WHERE nombre LIKE ("a%") or nombre LIKE ("e%") or nombre LIKE ("i%") or nombre LIKE ("o%") or nombre LIKE ("u%");

# Listar las canciones ordenadas por compositor en forma descendente. Luego, por nombre en forma ascendente. Incluir únicamente aquellas
# canciones que tengan compositor.
SELECT * FROM canciones order by compositor desc;
SELECT * FROM canciones WHERE compositor IS NOT null order by nombre;   # No esta filtrando los compositores con campo vacio. 

# a) Listar la cantidad de canciones de cada compositor.
# b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
SELECT compositor, count(*) FROM canciones group by compositor;
SELECT compositor, count(*) FROM canciones group by compositor having count(*)>10;

# a) Listar el total facturado agrupado por ciudad.
# b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
# c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
# d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
SELECT ciudad_de_facturacion as ciudad, sum(total) FROM facturas group by ciudad_de_facturacion;
SELECT ciudad_de_facturacion as ciudad, sum(total) FROM facturas WHERE pais_de_facturacion = "Canadá" group by ciudad_de_facturacion;
SELECT ciudad_de_facturacion as ciudad, sum(total) FROM facturas group by ciudad_de_facturacion HAVING sum(total)> 38;
SELECT pais_de_facturacion as pais, sum(total) FROM facturas group by pais_de_facturacion;    # NO se si esta bien, no entiendo bien que pide la consigna. 

# a) Listar la duración mínima, máxima y promedio de las canciones.
# b) Modificar el punto (a) mostrando la información agrupada por género.
SELECT nombre, milisegundos FROM canciones order by milisegundos limit 1;
SELECT nombre, milisegundos FROM canciones order by milisegundos desc limit 1;
SELECT avg(milisegundos) as Promedio FROM canciones;

# b.1
SELECT generos.nombre, milisegundos 
FROM canciones 
JOIN generos ON canciones.id_genero = generos.id 
group by canciones.id_genero 
order by milisegundos limit 1;

#b.2
SELECT generos.nombre, milisegundos 
FROM canciones 
JOIN generos ON canciones.id_genero = generos.id 
group by canciones.id_genero 
order by milisegundos desc limit 1;

#b.3
SELECT generos.nombre, avg(milisegundos) as Promedio 
FROM canciones 
JOIN generos ON canciones.id_genero = generos.id 
group by canciones.id_genero; 






