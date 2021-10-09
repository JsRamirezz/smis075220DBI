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

SELECT NombreProducto, OrderID, Categoria FROM ListadoProductos;

--Modificar lo anterior 
--Muestre los productos que esten o no incluidos en las ordenes 
-- muestre nombre producto, nombre categoria, orderid

ALTER VIEW ListadoProductos
AS
SELECT 
	p.ProductName AS 'NombreProducto',
	od.OrderID AS 'OrderID',
	c.CategoryName AS 'Categoria'
	
FROM
	Products p

LEFT JOIN [Order Details] od
ON p.ProductID=od.ProductID
INNER JOIN Categories c
ON c.CategoryID=p.CategoryID


--Modificar usando full join 

ALTER VIEW ListadoProductos
AS
SELECT 
	p.ProductName AS 'NombreProducto',
	c.CategoryName AS 'Categoria',
	od.OrderID AS 'OrderID'
FROM
	Products p

FULL JOIN [Order Details] od
ON p.ProductID=od.ProductID
FULL JOIN Categories c
ON c.CategoryID=p.CategoryID



