
--procedure 1

create procedure [dbo].[DropUpPagosConChequeTable]
as
begin

	select *
	into #pagosConChequeRespaldo
	from pagosConCheque;

	drop table pagosConCheque;

	create table pagosConCheque(Id_pagosConCheques int, monto money, FechaInicial date, FechaFinal date, Id_Producto int);
	insert into pagosConCheque 

	select * from pagosConCheque;

end;

GO

exec [DropUpPagosConChequeTable];


--procedure 2

create procedure [dbo].[DropUpPagosEnEfectivoTable]
as
begin

	select *
	into #pagosEnEfectivoRespaldo
	from pagosEnEfectivo;

	drop table pagosEnEfectivo;

	create table pagosEnEfectivo(Id_pagosConCheques int, monto money, FechaInicial date, FechaFinal date, Id_Producto int);
	insert into pagosEnEfectivo 

	 select * from pagosEnEfectivo;

end;
GO

exec [DropUpPagosEnEfectivoTable];


--procedure 3

create procedure [dbo].[DropUpPagosConTarjetaTable]
as
begin

	select *
	into #pagosConTarjetaRespaldo
	from pagosConTarjeta;

	drop table pagosConTarjeta;

	create table pagosConTarjeta(Id_pagosConCheques int, monto money, FechaInicial date, FechaFinal date, Id_Producto int);
	insert into pagosConTarjeta 

	 select * from pagosConTarjeta;

end;
GO

exec [DropUpPagosConTarjetaTable];


--procedure 4

create procedure [dbo].[DropUpPagosConTarjetaDebitoTable]
as
begin

	select *
	into #pagosConTarjetaDebitoRespaldo
	from pagosConTarjetaDebito;

	drop table pagosConTarjetaDebito;

	create table pagosConTarjetaDebito(Id_pagosConCheques int, monto money, FechaInicial date, FechaFinal date, Id_Producto int);
	insert into pagosConTarjetaDebito 

	 select * from pagosConTarjetaDebito;

end;
GO

exec [DropUpPagosConTarjetaDebitoTable];




--procedure 5

create procedure [dbo].[DropUpPagosPorPaypalTable]
as
begin

	select *
	into #pagosPorPaypalRespaldo
	from pagosPorPaypal;

	drop table pagosPorPaypal;

	create table pagosPorPaypal(Id_pagosConCheques int, monto money, FechaInicial date, FechaFinal date, Id_Producto int);
	insert into pagosPorPaypal 

	 select * from pagosPorPaypal;

end;
GO

exec [DropUpPagosPorPaypalTable];
