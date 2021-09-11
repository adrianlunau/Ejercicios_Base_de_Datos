SELECT * FROM usuario WHERE nombre LIKE "a%";

SELECT * FROM usuario WHERE email IS null;

SELECT * FROM canal WHERE fechaCreacion between "2021-04-01" and "2021-06-01";

SELECT * FROM usuario order by fechaNacimiento desc limit 10;

SELECT * FROM playlist WHERE privado = 1;

SELECT * FROM video order by cantidadLikes desc limit 5;

INSERT INTO usuario VALUES( 
default,
"Juan Jose Batzal",
"jjbatzal@gmail.com",
"jj1597",
"2000-04-01",
1429,
9,
85);

SELECT * FROM usuario WHERE nombre = "Juan Jose Batzal";

SELECT * FROM usuario WHERE fechaNacimiento between "2000-01-01" and "2000-12-31";

SELECT UPPER(nombre)  FROM pais order by nombre;

SELECT * FROM video WHERE cantidadReproducciones > 500000;

SELECT * FROM video WHERE fechaPublicacion between "2020-01-01" and "2020-12-31" and privado = 1 and cantidadDislikes> 100;

update usuario set fechaNacimiento = "2000-01-04" WHERE nombre = "Juan Jose Batzal";

SELECT * FROM usuario WHERE nombre = "Juan Jose Batzal";

SELECT * FROM usuario WHERE LENGTH(password)<5;

SELECT idUsuario as "ID", nombre as "Nombre", email as "E-mail", fechaNacimiento as "Fecha de Nacimiento", 
TIMESTAMPDIFF(YEAR, fechaNacimiento ,CURDATE()) as "Edad", Pais_idPais as "Codigo de Pais" FROM usuario;


SELECT titulo, MAX(tamanio) FROM video;   #esta mal!! trae el maximo tamañao pero trae el primer titulo q encuentra... hacerlo de la siguiente manera:
SELECT titulo, tamanio FROM video order by tamanio desc limit 1;

SELECT fecha, tipoReaccion_idTipoReaccion as "Codigo de reaccion", Usuario_idUsuario as "ID de usuario",
 Video_idVideo "Video" FROM reaccion order by fecha desc limit 10;
 
 SELECT * FROM video WHERE cantidadReproducciones < 100000 and cantidadLikes >= 100;

SELECT * FROM video WHERE descripcion LIKE ("%FAN%");

SELECT * FROM usuario WHERE password IN ("123", "1234", "12345", "abc", "clave", "password");

DELETE FROM avatar WHERE nombre = "avDhTube";

SELECT * FROM avatar WHERE nombre = "avDhTube";



