# 1 - Listar todas las categorías junto con información de sus productos. 
# Incluir todas las categorías aunque no tengan productos.
SELECT c.CategoriaNombre, p.* FROM categorias c LEFT JOIN productos p ON c.categoriaID = p.CategoriaID;

#2 - Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
SELECT c.contacto, f.FacturaID FROM clientes c left JOIN facturas f ON c.clienteID = f.clienteID WHERE isnull(f.facturaID);

#3 - Realizar un listado de productos. Para cada uno indicar su nombre, categoría, 
# y la información de contacto de su proveedor. 
# Tener en cuenta que puede haber productos para los cuales no se indicó quién es el proveedor.

SELECT p.productoNombre, p.CategoriaID, prov.Contacto 
FROM proveedores prov 
right JOIN productos p ON p.ProveedorID = prov.ProveedorID;

# 4- Para cada categoría listar el promedio del precio unitario de sus productos.
SELECT c.CategoriaNombre, avg(p.precioUnitario) 
FROM categorias c 
JOIN productos p ON p.CategoriaID = c.CategoriaID 
group by p.CategoriaID; 

# 5- Para cada cliente, indicar la última factura de compra. 
# Incluir a los clientes que nunca hayan comprado en e-market.

SELECT f.facturaID, c.Contacto, MAX(f.fechaFactura), c.clienteID
FROM clientes c 
LEFT JOIN facturas f ON c.clienteID = f.ClienteID  
GROUP BY c.clienteID;

# 6 -Todas las facturas tienen una empresa de correo asociada (enviovia). 
# Generar un listado con todas las empresas de correo, y la cantidad de facturas correspondientes. 
# Realizar la consulta utilizando RIGHT JOIN

SELECT c.compania, count(*) FROM facturas f 
right JOIN correos c ON f.envioVia = c.correoID
GROUP BY c.CorreoID;                               # <<<<< NO SABEMOS SI ESETA BIEN!








