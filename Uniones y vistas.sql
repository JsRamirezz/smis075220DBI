USE Northwind;

SELECT
	p.ProductName Producto, 
	c.CategoryName Categoria,
	sp.ContactName Proveedor
FROM 
	Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers sp
ON p.SupplierID = sp.SupplierID
-- Crear una vista que muestre el nombre del producto, categoria y proveedor
-- ordenar por nombre de categoria

CREATE VIEW ListadoProductos 
AS 
SELECT 
	p.ProductName AS 'NombreProducto',
	c.CategoryName AS 'Categoria',
	sp.ContactName AS 'Proveedor'
FROM 
	Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers sp
ON p.SupplierID = sp.SupplierID;

SELECT NombreProducto, Categoria, OrderID FROM ListadoProductos;

--Modificar lo anterior 
--Muestre los productos que esten o no incluidos en las ordenes 
-- muestre nombre producto, nombre categoria, orderid

ALTER VIEW ListadoProductos
AS
SELECT 
	p.ProductName AS 'NombreProducto',
	c.CategoryName AS 'Categoria',
	od.OrderID AS 'OrderID'
FROM
	[Order Details] od

RIGHT JOIN Products p
ON od.ProductID=p.ProductID
INNER JOIN Categories c
ON c.CategoryID=p.CategoryID


--Modificar usando full join 
