
 
 ----vista 1

CREATE VIEW pagosConCheque
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '2'
 go

 select * from pagosConCheque


  
 ----vista 2


CREATE VIEW pagosEnEfectivo
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '1'
 go

 select * from pagosEnEfectivo


  
 ----vista 3

 CREATE VIEW pagosConTarjeta
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '3'
 go

 select * from pagosConTarjeta


  
 ----vista 4

  CREATE VIEW pagosConTarjetaDebito
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '4'
 go

 select * from pagosConTarjetaDebito




 
 ----vista 5

 CREATE VIEW pagosPorPaypal
 AS 
 SELECT * from OrdenVenta WHERE id_tipo_de_pago1 = '5'
 go

 select * from pagosPorPaypal





---Consulta Dinamica

DECLARE @id_Empleado uniqueidentifier = 'C843B780-9290-487F-928A-371EF8F644CA'
DECLARE @query NVARCHAR(2000)
SET @query = 'SELECT nom_emp, dir_emp FROM dbo.Empleado WHERE id_Empleado ='
DECLARE @sql NVARCHAR(2000) = CONCAT(@query, @id_Empleado)
SELECT @sql
EXEC(@sql)
go

