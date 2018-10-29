 USE FARMACIA

 GO

SELECT count(nombre_prod) as 'Medicinas en venta'
FROM Producto

SELECT nombre_prod as Medicina, stock as 'Existencia'
from producto 
group by nombre_prod, stock
having(stock) > 100

SELECT nombre_prod as Medicina, fecha_venc as 'Vencimiento'
from producto 
group by nombre_prod, fecha_venc

SELECT nombre_prod as Medicina, precio_venta as Costo
from Producto 
group by nombre_prod, precio_venta  
having(precio_venta) > 16

SELECT nombre_prod as Medicina, (precio_venta-precio_compra) as 'Ganancia'
from producto 
order by nombre_prod

SELECT nombre_prov as 'Proveedor con M'
FROM Proveedor
where(nombre_prov) like 'M%'

SELECT nom_emp as 'Empleado'
FROM Empleado
where nom_emp like 'A%'
order by id_Empleado

SELECT can_producto as 'Cantidad comprada'
FROM [Orden de Venta]
where can_producto>0
order by id_producto

SELECT nombre_prov as 'Proveedor', dir_prov as 'Dirección en Avenidas'
FROM Proveedor
where dir_prov like 'AV%'
order by nombre_prov

SELECT nombre_prod as 'Medicina', stock as 'Existencia'
FROM Producto
where stock between 0 and 30
order by nombre_prod