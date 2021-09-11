#Clientes 
# 1
SELECT count(*) FROM clientes;

#2
SELECT ciudad, count(*) FROM clientes group by ciudad;

#Facturas

#1
SELECT sum(transporte) FROM facturas; 

#2
SELECT envioVia, sum(transporte) FROM facturas group by EnvioVia;

#3
SELECT ClienteID, count(*) FROM facturas group by ClienteID order by count(*) desc;

#4
SELECT ClienteID, count(*) FROM facturas group by ClienteID order by count(*) desc limit 5;

#5
SELECT paisEnvio, count(*) FROM facturas group by PaisEnvio order by count(*) limit 1;

#6
SELECT EmpleadoID, count(*) FROM facturas group by EmpleadoID order by count(*) desc limit 1;

#Factura detalle

#1
SELECT ProductoID, count(*) FROM facturadetalle group by ProductoID order by count(*) desc limit 1;

#2
SELECT sum(cantidad * precioUnitario) as "total facturado" FROM facturadetalle;

#3
SELECT sum(cantidad * precioUnitario) as "total facturado" FROM facturadetalle WHERE ProductoID between 30 and 50;

#4
SELECT ProductoID, avg(precioUnitario) FROM facturadetalle group by ProductoID;

#5
SELECT ProductoID, PrecioUnitario FROM facturadetalle group by ProductoID order by PrecioUnitario desc limit 1;


# ----------   PARTE 2  ------------

#1
SELECT facturas.FacturaID FROM facturas JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID WHERE empleados.Apellido = "Buchanan";

#2
SELECT facturas.* FROM facturas JOIN correos ON facturas.EnvioVia = correos.CorreoID WHERE correos.compania = "Speedy Express";

#3
# SELECT facturas.FacturaID, concat FROM facturas JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID group by empleados.Apellido;   <<< SIN TERMINAR