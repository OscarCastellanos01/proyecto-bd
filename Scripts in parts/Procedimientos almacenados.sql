GO
/****** Object:  StoredProcedure [dbo].[DeleteBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBarra]
(
	@barra bigint
)
AS
	SET NOCOUNT ON;
DELETE from tbl_barra WHERE barra = @barra
GO
/****** Object:  StoredProcedure [dbo].[ExisteBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteBarra]
(
	@barra bigint
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_barra WHERE barra = @barra
GO
/****** Object:  StoredProcedure [dbo].[ExisteCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteCompra]
(
	@criterio nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_compra 
WHERE documento_compra = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ExisteFacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteFacturasCompras]
(
	@documento nvarchar(max)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_FacturasCompras WHERE documento_facturacompra = @documento
GO
/****** Object:  StoredProcedure [dbo].[ExisteKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteKit]
(
	@criterio varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_kit
WHERE estado_kit = 1 and id_producto = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ExisteListaProductoPrecioVentaJoin]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteListaProductoPrecioVentaJoin]
(
	@criterio nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT COUNT(id_producto) AS IDProducto FROM dbo.tbl_ProductUnidPrecioVenta
WHERE	id_producto = @criterio
HAVING	COUNT(id_producto)> 1
GO
/****** Object:  StoredProcedure [dbo].[ExistePoveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExistePoveedor]
(
	@criterio VARCHAR(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_proveedor WHERE nit_proveedor = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ExisteProforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteProforma]
(
	@criterio nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_proforma
WHERE id_proforma = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ExisteTarjeta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteTarjeta]
(
	@descripcion VARCHAR(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_TarjetaCredito WHERE descripcion_tarjeta = @descripcion
GO
/****** Object:  StoredProcedure [dbo].[ExisteTipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteTipoEmpleado]
(
	@Descrip NVARCHAR(MAX)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_tipoEmpleado WHERE descripcion_templeado = @Descrip
GO
/****** Object:  StoredProcedure [dbo].[ExisteUsuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteUsuario]
(
	@IDUsuario nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_empleado
WHERE usuario_empleado = @IDUsuario
AND estado_empleado =1
GO
/****** Object:  StoredProcedure [dbo].[ExisteVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteVenta]
(
	@criterio nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM dbo.tbl_venta 
WHERE documento = @criterio
GO
/****** Object:  StoredProcedure [dbo].[InicializarInventarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[InicializarInventarios]
AS
DELETE FROM tbl_Kardex
DELETE FROM tbl_detallePedido
DELETE FROM tbl_pedido
DELETE FROM tbl_FacturasCompras
DELETE FROM tbl_FacturasVentas
DELETE FROM tbl_DetalleCompra
DELETE FROM tbl_compra
DELETE FROM tbl_DetalleProforma
DELETE FROM tbl_proforma
DELETE FROM tbl_DetalleSalida
DELETE FROM tbl_salida
DELETE FROM tbl_detalleTraslado
DELETE FROM tbl_traslado
DELETE FROM tbl_DetalleVenta
DELETE FROM tbl_venta
DELETE FROM tbl_DetalleKit
DELETE FROM tbl_kit
DELETE FROM tbl_DetalleDevolucionCliente
DELETE FROM tbl_devolucionCliente
DELETE FROM tblDetalleDevolucionProveedor
DELETE FROM tbl_devolucionProveedor
DELETE FROM tbl_detalle_inventario
DELETE FROM tbl_Inventario



DBCC CHECKIDENT (tbl_FacturasVentas,RESEED,0)
DBCC CHECKIDENT (tbl_FacturasCompras,RESEED,0)
DBCC CHECKIDENT (tbl_detalle_inventario,RESEED,0)
DBCC CHECKIDENT (tbl_Kardex, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleVenta, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleCompra, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleKit, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleVenta, RESEED, 0)
DBCC CEHCKIDENT (tbl_kit, RESEED, 0)
DBCC CEHCKIDENT (tbl_detallePedido, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleProforma, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleSalida, RESEED, 0)
DBCC CEHCKIDENT (tbl_detalleTraslado, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleDevolucionCliente, RESEED, 0)
DBCC CEHCKIDENT (tblDetalleDevolucionProveedor, RESEED, 0)
GO
/****** Object:  StoredProcedure [dbo].[InicializarTodo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[InicializarTodo]
AS

DELETE FROM tbl_banco
DELETE FROM tbl_Kardex
DELETE FROM tbl_ProductUnidPrecioVenta
DELETE FROM tbl_SerieProducto
DELETE FROM tbl_barra
DELETE FROM tbl_bodegaProducto
DELETE FROM tbl_bodega
DELETE FROM tbl_detallePedido
DELETE FROM tbl_pedido
DELETE FROM tbl_FacturasCompras
DELETE FROM tbl_FacturasVentas
DELETE FROM tbl_CuentaPorPagar
DELETE FROM tbl_DetalleCompra
DELETE FROM tbl_compra
DELETE FROM tbl_DetalleProforma
DELETE FROM tbl_proforma
DELETE FROM tbl_DetalleSalida
DELETE FROM tbl_salida
DELETE FROM tbl_detalleTraslado
DELETE FROM tbl_traslado
DELETE FROM tbl_cuentasPorCobrar
DELETE FROM tbl_DetalleVenta
DELETE FROM tbl_venta
DELETE FROM tbl_DetalleKit
DELETE FROM tbl_kit
DELETE FROM tbl_Sub_Categoria
DELETE FROM tbl_categoria
DELETE FROM tbl_marca
DELETE FROM tbl_UnidadMedida
DELETE FROM tbl_TipoProducto
DELETE FROM tbl_Producto
DELETE FROM tbl_ControlArqueo
DELETE FROM tbl_ControlCajasApertura
DELETE FROM tbl_ControlArqueoCierre
DELETE FROM tbl_CajaDiaria
DELETE FROM tbl_cajas
DELETE FROM tbl_DetalleDevolucionCliente
DELETE FROM tbl_devolucionCliente
DELETE FROM tblDetalleDevolucionProveedor
DELETE FROM tbl_devolucionProveedor
DELETE FROM tbl_calculoPrecioVenta
DELETE FROM tbl_detalle_inventario
DELETE FROM tbl_Inventario
DELETE FROM tbl_DetallePagoCredito
DELETE FROM tbl_DetallePagoCreditoContado
DELETE FROM tbl_PagoCredito
DELETE FROM tbl_conceptos
DELETE FROM tbl_gastos
DELETE FROM tbl_MovimientoCuentaClientes
DELETE FROM tbl_MovimientoCuentaProveedores
DELETE FROM tbl_PagoCreditoCuotaExtra
DELETE FROM tbl_PagoProveedorDetalle
DELETE FROM tbl_PagoProveedor
DELETE FROM tbl_PrecioCostoPorProductoByFecha



DBCC CHECKIDENT (tbl_PrecioCostoPorProductoByFecha,RESEED,0)
DBCC CHECKIDENT (tbl_PagoProveedorDetalle,RESEED,0)
DBCC CHECKIDENT (tbl_PagoCreditoCuotaExtra,RESEED,0)
DBCC CHECKIDENT (tbl_MovimientoCuentaProveedores,RESEED,0)
DBCC CHECKIDENT (tbl_MovimientoCuentaClientes,RESEED,0)
DBCC CHECKIDENT (tbl_conceptos,RESEED,0)
DBCC CHECKIDENT (tbl_DetallePagoCreditoContado,RESEED,0)
DBCC CHECKIDENT (tbl_DetallePagoCredito,RESEED,0)
DBCC CHECKIDENT (tbl_detalle_inventario,RESEED,0)
DBCC CHECKIDENT (tbl_conceptos, RESEED, 0)
DBCC CHECKIDENT (tbl_CajaDiaria, RESEED, 0)
DBCC CHECKIDENT (tbl_Kardex, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleVenta, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleCompra, RESEED, 0)
DBCC CEHCKIDENT (tbl_FacturasCompras, RESEED, 0)
DBCC CEHCKIDENT (tbl_FacturasVentas, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleKit, RESEED, 0)
DBCC CEHCKIDENT (tbl_DetalleVenta, RESEED, 0)
DBCC CEHCKIDENT (tbl_kit, RESEED, 0)




SELECT * FROM tbl_empleado



GO
/****** Object:  StoredProcedure [dbo].[ObternerEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObternerEmpleado]
AS
	SET NOCOUNT ON;
SELECT *
FROM dbo.tbl_empleado
WHERE estado_empleado = 'activo'
and usuario_empleado = 0
ORDER BY usuario_empleado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_AumentarStock]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_AumentarStock]
(
 @cantidad FLOAT,
 @idBodega INT, 
 @idProducto INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_bodegaProducto]
			SET

			stock_producto = stock_producto + @cantidad

			WHERE
			id_bodega = @idBodega AND id_producto = @idProducto

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Banco]
(
 @descripcion varchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_banco]
			SET

			descripcion_banco = @descripcion

			WHERE
			id_banco = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Barra]
(
 @barra bigint,
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_barra]
			SET

			barra = @barra

			WHERE
			id_producto = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Bodega]
(
 @descripcion nvarchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_bodega]
			SET

			nombre_bodega= @descripcion

			WHERE
			id_bodega = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_BodegaProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_BodegaProducto]
(
 @IdBodega int,
 @IdProducto int,
 @minimo float,
 @maximo float,
 @dias   int,
 @cantidad float
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_bodegaProducto]
			SET
			
			minimo_producto = @minimo, 
			maximo_producto = @maximo, 
			diasReposicion_producto = @dias, 
			cantidadMinima_producto = @cantidad

			WHERE
			id_bodega = @IdBodega AND 
			id_producto =@IdProducto

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Caja]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Caja]
(
 @descripcion varchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_cajas]
			SET

			descripcion_caja = @descripcion

			WHERE
			id_caja = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_CajaDiaria]
(
 @id int,
 @fecha datetime,
 @idcaja int,
 @montoApertura money,
 @ingreso		money,
 @ingresoCheque money,
 @ingresoTarjeta money,
 @egreso		money,
 @cierre		money,
 @saldo			money
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_CajaDiaria]
			SET

			fecha_movimiento = @fecha,
			id_caja = @idcaja,
			montoApertura_movimiento = @montoApertura,
			ingreso_movimiento = @ingreso,
			ingresoCheque_movimiento = @ingresoCheque,
			ingresoTarjeta_movimiento = @ingresoTarjeta,
			egreso_movimiento = @egreso,
			cierre_movimiento = @cierre,
			saldo_movimiento = @saldo

			WHERE
			id_movimiento = @id AND 
			estado_movimiento = 1  /**estado 1 es activo y 0 es inactivo**/

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_CalculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_CalculoPrecioVenta]
(
@id	 INT,
@fecha DATETIME,
@descripcion NVARCHAR(MAX),
@precioCosto MONEY,
@envio	MONEY,
@ganaciaPromedio FLOAT,
@costoTotal MONEY,
@precioVenta	MONEY,
@precioSinIvaVenta MONEY,
@ivaCalculado MONEY,
@isrCalculado MONEY,
@isoCalculado MONEY,
@totalImpuesto MONEY,
@gananciaReal MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_calculoPrecioVenta]
			SET

			fecha_calculo = @fecha,
			descripcion_calculo = @descripcion,
			precio_costo = @precioCosto,
			envio_costo = @envio,
			ganacia_promedio = @ganaciaPromedio,
			costo_total = @costoTotal,
			precio_venta = @precioVenta,
			precioSinIva_venta = @precioSinIvaVenta,
			iva_calculado = @ivaCalculado,
			isr_calculado = @isrCalculado,
			iso_calculado = @isoCalculado,
			total_impuesto = @totalImpuesto,
			ganancia_real = @gananciaReal

			WHERE
			id_calculo = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Categoria]
(
 @descripcion nvarchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_categoria]
			SET

			descripcion_categoria = @descripcion

			WHERE
			id_categoria = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Cliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Cliente]
(
@id INT,
@nit NVARCHAR(MAX),
@nombre NVARCHAR(MAX),
@idMunicipio int,
@direccion NVARCHAR(MAX),
@telefono1 NVARCHAR(20),
@telefono2 NVARCHAR(20),
@email NVARCHAR(MAX),
@notas TEXT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_cliente]
			SET

			nit_cliente = @nit,
			nombre_cliente = @nombre,
			id_municipio = @idMunicipio,
			direccion_cliente = @direccion,
			telefono1_cliente = @telefono1,
			telefono2_cliente = @telefono2,
			email_cliente = @email,
			notas_cliente = @notas

			WHERE
			id_cliente = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Compra]
(
@id INT,
@fechaCompra DATETIME,
@idProveedor INT,
@idBodega INT,
@idFormaPago INT,
@documentoCompra NVARCHAR(MAX),
@totalCompra MONEY,
@notas TEXT,
@plazo INT,
@boleta NVARCHAR(MAX),
@deposito MONEY,
@diff MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_compra]
			SET
	
				fecha_compra = @fechaCompra,
				id_proveedor = @idProveedor,
				id_bodega = @idBodega,
				id_formaPago = @idFormaPago,
				documento_compra = @documentoCompra,
				total_compra = @totalCompra,
			  notas_compra = @notas,
				plazo_compra = @plazo,
				boletaDeposito_compra = @boleta,
				deposito_compra = @deposito,
				diffDepoCompra_compra = @diff

			WHERE

				id_compra = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Conceptos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Conceptos]
(
 @descripcion nvarchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_conceptos]
			SET

			descripcion_concepto = @descripcion

			WHERE
			id_concepto = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SP_Actualiza_ControlArqueo]
(
 @IDControl	INT,
 @Fecha	DATETIME,
 @id_caja	INT,
 @Cantidad200 INT, 
 @Total200 DECIMAL(18,0),	
 @Cantidad100	INT,
 @Total100	decimal(18, 0),
 @Cantidad50	INT,
 @Total50	decimal(18, 0),
 @Cantidad20	INT,
 @Total20	decimal(18, 0),
 @Cantidad10	INT,
 @Total10	decimal(18, 0),
 @Cantidad5	INT,
 @Total5	decimal(18, 0),
 @Cantidad1	INT,
 @Total1	decimal(18, 0),
 @Cantidad050	INT,
 @Total050	decimal(18, 0),
 @Cantidad025	INT,
 @Total025	decimal(18, 0),
 @Cantidad010	INT,
 @Total010	decimal(18, 0),
 @Cantidad005	INT,
 @Total005	decimal(18, 0),
 @Cantidad001	INT,
 @Total001	decimal(18, 0),
 @GranTotal	decimal(18, 0)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].tbl_ControlArqueo
			SET

			fecha_control = @Fecha, 
			id_caja = @id_caja, 
			Cantidad200 = @Cantidad200,
			Total200 = @Total200,
			Cantidad100 = @Cantidad100,
			Total100 = @Total100,
			Cantidad50 = @Cantidad50,
			Total50 = @Total50,
			Cantidad20 = @Cantidad20,
			Total20 = @Total20,
			Cantidad10 = @Cantidad10,
			Total10 = @Total10,
			Cantidad5 = @Cantidad5,
			Total5 = @Total5,
			Cantidad1 = @Cantidad1,
			Total1 = @Total1,
			Cantidad050 = @Cantidad050,
			Total050 = @Total050,
			Cantidad025 = @Cantidad025,
			Total025 = @Total025,
			Cantidad010 = @Cantidad010,
			Total010 = @Total010,
			cantidad005 = @Cantidad005,
			Total005 = @Total005,
			Cantidad001 = @Cantidad001,
			Total001 = @Total001,
			GranTotal = @GranTotal,
			Estado = Estado

			WHERE
			id_control = @IDControl 
			AND Estado = 'activo' 
			AND fecha_control = (SELECT fecha_control FROM dbo.tbl_ControlArqueo WHERE fecha_control = GETDATE())

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SP_Actualiza_ControlArqueoCierre]
(
 @IDControl	INT,
 @Fecha	DATETIME,
 @id_caja	INT,
 @Cantidad200 INT, 
 @Total200 DECIMAL(18,0),	
 @Cantidad100	INT,
 @Total100	decimal(18, 0),
 @Cantidad50	INT,
 @Total50	decimal(18, 0),
 @Cantidad20	INT,
 @Total20	decimal(18, 0),
 @Cantidad10	INT,
 @Total10	decimal(18, 0),
 @Cantidad5	INT,
 @Total5	decimal(18, 0),
 @Cantidad1	INT,
 @Total1	decimal(18, 0),
 @Cantidad050	INT,
 @Total050	decimal(18, 0),
 @Cantidad025	INT,
 @Total025	decimal(18, 0),
 @Cantidad010	INT,
 @Total010	decimal(18, 0),
 @Cantidad005	INT,
 @Total005	decimal(18, 0),
 @Cantidad001	INT,
 @Total001	decimal(18, 0),
 @GranTotal	decimal(18, 0)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].tbl_ControlArqueoCierre
			SET

			fecha_control = @Fecha, 
			id_caja = @id_caja, 
			Cantidad200 = @Cantidad200,
			Total200 = @Total200,
			Cantidad100 = @Cantidad100,
			Total100 = @Total100,
			Cantidad50 = @Cantidad50,
			Total50 = @Total50,
			Cantidad20 = @Cantidad20,
			Total20 = @Total20,
			Cantidad10 = @Cantidad10,
			Total10 = @Total10,
			Cantidad5 = @Cantidad5,
			Total5 = @Total5,
			Cantidad1 = @Cantidad1,
			Total1 = @Total1,
			Cantidad050 = @Cantidad050,
			Total050 = @Total050,
			Cantidad025 = @Cantidad025,
			Total025 = @Total025,
			Cantidad010 = @Cantidad010,
			Total010 = @Total010,
			cantidad005 = @Cantidad005,
			Total005 = @Total005,
			Cantidad001 = @Cantidad001,
			Total001 = @Total001,
			GranTotal = @GranTotal,
			Estado = Estado

			WHERE
			id_control = @IDControl 
			AND Estado = 'activo' 
			AND fecha_control = (SELECT fecha_control FROM dbo.tbl_ControlArqueo WHERE fecha_control = GETDATE())

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_ControlCajasApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_ControlCajasApertura]
(
@idControl INT,
@idCaja INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_ControlCajasApertura]
			SET

			id_caja = @idCaja,
			control_control = 0

			WHERE
			id_control = @idControl AND control_control = 1 AND id_caja = @idCaja

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_CuentaPorCobrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_CuentaPorCobrar]
(
@idCuenta INT,
@fecha DATETIME,
@fehcaV DATETIME,
@idCliente INT,
@idVentaRef INT,
@documento NVARCHAR(max),
@monto MONEY,
@plazo FLOAT,
@idInteres INT,
@cuotaProgramada MONEY,
@saldoProgramado MONEY,
@idInteresMora INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_cuentasPorCobrar]
			SET
			
			fecha_cuentaCobro = @fecha,
			fechaVence_CuentaPorCobrar = @fehcaV,
			id_cliente = @idCliente,
			id_ventaReferencia = @idVentaRef,
			documento_venta = @documento,
			monto_cuentaCobro = @monto,
			plazo_cuentaCobro = @plazo,
			id_interes = @idInteres,
			cuotaProgramada = @cuotaProgramada,
			saldoProgramado = @saldoProgramado,
			id_InteresMora = @idInteresMora

			WHERE
			id_cuentaCobro = @idCuenta and estado_cuentaCobro = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_CuentaPorPagar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_CuentaPorPagar]
(
@idCuenta INT,
@fecha DATETIME,
@fechaVence DATETIME,
@idProveedor INT,
@documento NVARCHAR(max),
@monto MONEY,
@plazo FLOAT,
@saldo MONEY,
@estado INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_CuentaPorPagar]
			SET

			fecha_CuentaPorPagar = @fecha,
			fechaVence_CuentaPorPagar = @fechaVence,
			id_proveedor = @idProveedor,
			documento_CuentaPorPagar = @documento,
			monto_CuentaPorPagar = @monto,
			plazo_CuentaPorPagar = @plazo,
			saldo_CuentaPorPagar = @saldo, 
			estado_CuentaPorPagar = @estado

			WHERE
			id_CuentaPorPagar = @idCuenta AND 
			estado_CuentaPorPagar = '1' /**Estado = 1 activo 2 = inactivo*/

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Departamento]
(
@id INT,
@descripcion VARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_departamento]
			SET

			nombre_departamento = @descripcion

			WHERE
			id_departamento = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleCompra]
(
@idLinea INT,
@idCompra INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@costo MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetalleCompra]
			SET
			
			id_compra = @idCompra,
			id_producto = @idProducto,
			descripcion_producto = @descripcion,
			costo_producto = @costo,
			cantidad_producto = @cantidad,
			id_kardex = @idKardex,
			porcentajeIva_Producto = @porcentajeIva,
			porcentajeDescuento_producto = @porcentajeDescuento
			

			WHERE
			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleDevolucionCliente]
(

@idDevCliente INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@precio MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetalleDevolucionCliente]
			SET

			id_producto = @idProducto,
			descripcion_producto = @descripcion,
			precio_producto = @precio,
			cantidad_producto = @cantidad,
			id_kardex = @idKardex,
			porcentajeIva = @porcentajeIva,
			porcentajeDescuento = @porcentajeDescuento

			WHERE
			id_devolucionCliente = @idDevCliente

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleInventario]
(
@idLinea INT, 
@idInventario INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@stock FLOAT,
@conteo1 FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_detalle_inventario]
			SET

			id_inventario = @idInventario,
			id_producto = @idProducto,
			descripcion_producto = @descripcion,
			stock_producto = @stock,
			conteo1_detalle = @conteo1

			WHERE
			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleKit]
(
@idKit INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@Precio MONEY,
@cantidad FLOAT,
@Serie NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetalleKit]
			SET
			
			id_kit = @idKit,
			id_producto = @idProducto,
			descripcion_producto = @descripcion,
			precio_producto = @Precio,
			cantidad_detalleKit = @cantidad,
			numero_serie = @Serie
			

			WHERE
			id_kit = @idKit

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetallePagoCredito]
(
@idLinea INT,
@idPagocre INT,
@idTabla INT,
@montoPagocre MONEY,
@moraPagocre MONEY,
@diasPagocre FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetallePagoCredito]
			SET
			
			id_pagocre = @idPagocre,
			id_tabla = @idTabla,
			monto_pagocre = @montoPagocre,
			mora_pagocre = @moraPagocre,
			dias_pagocre = @diasPagocre

			WHERE
			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetallePagoCreditoContado]
(
@idLinea INT,
@idPagocrecont INT,
@idCuentaCobro INT,
@montoPagocrecont MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetallePagoCreditoContado]
			SET

			
			id_pagocrecont =@idPagocrecont,
			id_cuentaCobro = @idCuentaCobro,
			monto_pagocrecont = @montoPagocrecont

			WHERE
			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_detallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_detallePedido]
(
@idLinea INT,
@idPedido INT,
@idProducto INT,
@descripcionProducto NVARCHAR(MAX),
@precioProducto MONEY,
@cantidadPedido FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_detallePedido]
			SET

			id_pedido = @idPedido,
			id_producto = @idProducto,
			descripcion_producto = @descripcionProducto,
			precio_producto = @precioProducto,
			cantidad_pedido = @cantidadPedido

			WHERE

			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleTraslado]
(
 @idLinea INT, 
 @idTraslado INT, 
 @idProducto INT, 
 @descripcion NVARCHAR(MAX),
 @cantidad FLOAT, 
 @idKardexOrigen INT, 
 @idKardexDestino INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_detalleTraslado]
			SET

			id_traslado = @idTraslado, 
			id_producto = @idProducto,
			descripcion_producto = @descripcion, 
			cantidad_traslado = @cantidad, 
			id_kardexOrigen = @idKardexOrigen, 
			id_KardexDestino = @idKardexDestino

			WHERE
			id_linea = @idLinea

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DetalleVenta]
(
@idLinea INT,
@idVenta INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@precio MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT,
@medida nvarchar(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetalleVenta]
			SET
			
			
			id_producto = @idProducto,
			descripcion_producto = @descripcion,
			precio_producto = @precio,
			cantidad_producto = @cantidad,
			id_kardex = @idKardex,
			porcentajeIva = @porcentajeIva,
			porcentajeDescuento = @porcentajeDescuento,
			descripcion_medida = @medida

			WHERE
			id_linea = @idLinea AND id_venta = @idVenta

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Documentos]
(
 @id INT,
 @nombre NVARCHAR(MAX),
 @abrevia NVARCHAR(50),
 @serie NVARCHAR(50),
 @idTipo INT,
 @inicio INT,
 @utilizado int,
 @fin INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Documentos]
			SET

			nombre_documento = @nombre,
			abreviatura_documento = @abrevia,
			serie_documento = @serie,
			id_tipoDocumentoPago = @idTipo,
			inicio_documento = @inicio,
			final_documento = @fin,
      utilizado_documento = @utilizado

			WHERE
			id_documento = @id and activo_documento = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_DocumentosUltimoUtilizado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_DocumentosUltimoUtilizado]
(
 @id INT,
 @idTipo INT,
 @utilizado int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Documentos]
			SET

      utilizado_documento = @utilizado

			WHERE
			id_documento = @id 
			AND id_tipoDocumentoPago = @idTipo 
			AND activo_documento = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Empleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Empleado]
(
@id INT,
@nombre NVARCHAR(MAX),
@apellido NVARCHAR(MAX),
@direccion NVARCHAR(MAX),
@telef1	NVARCHAR(MAX),
@telef2 NVARCHAR(MAX),
@fechanac DATETIME,
@idTemp	INT,
@usuario NVARCHAR(50),
@pass NVARCHAR(50),
@idRol INT,
@idCaja INT,
@idMuni INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_empleado]
			SET

			
			nombre_empleado = @nombre,
			apellido_empleado = @apellido,
			direccion_empleado = @direccion,
			telefeono1_empleado = @telef1,	
			telefono2_empleado = @telef2,
			fechanac_empleado = @fechanac,
			id_templeado = @idTemp,
			usuario_empleado = @usuario,
			contrasena_empleado = @pass,
			id_rol = @idRol,
			id_caja = @idCaja, 
			id_municipio = @idMuni

			WHERE
			id_empleado = @id AND estado_empleado = 'activo'

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_FacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_FacturasCompras]
(
 @id INT, 
 @fecha DATETIME, 
 @idCompra INT, 
 @documento NVARCHAR(MAX),
 @monto MONEY, 
 @iva MONEY, 
 @isr MONEY, 
 @iso MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_FacturasCompras]
			SET

			fecha_facturacompra = @fecha, 
			id_compra = @idCompra, 
			documento_facturacompra = @documento, 
			monto_facturacompra = @monto, 
			iva_facturacompra = @iva,
			isr_facturacompra = @isr, 
			iso_facturacompra = @iso

			WHERE
			id_facturacompra = @id AND estado_facturacompra = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_FacturasVentas]
(
 @id INT, 
 @fecha DATETIME, 
 @idVenta INT, 
 @documento NVARCHAR(MAX),
 @monto MONEY, 
 @iva MONEY, 
 @isr MONEY, 
 @iso MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_FacturasVentas]
			SET

			fecha_facturaventa = @fecha, 
			documento_facturaventa = @documento, 
			monto_facturaventa = @monto, 
			iva_facturaventa = @iva,
			isr_facturaventa = @isr, 
			iso_facturaventa = @iso

			WHERE
			id_facturaventa = @id AND estado_facturaventa = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_FormaPago]
(
 @descripcion NVARCHAR(50),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_FormaPago]
			SET

			descripcion_formaPago = @descripcion

			WHERE
			id_formaPago = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Inventario]
(
@idInventario INT,
@fecha DATE, 
@idBodega INT,
@idSub1 INT,
@idSub2 INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_Inventario 
			SET
	        id_bodega = @idBodega,
			id_SubCategoriaSource = @idSub1,
			id_SubCategoriaTarget = @idSub2 
			WHERE 
			id_inventario = @idInventario AND estado_categoria = 0 
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Iva]
(
 @id INT, 
 @descripcion NVARCHAR(MAX),
 @tarifa FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_iva]
			SET

			descripcion_iva = @descripcion,
			tarifa_iva = @tarifa

			WHERE
			id_iva = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Kardex]
(
 @id INT, 
 @idBodega INT, 
 @idProducto INT, 
 @fecha DATETIME, 
 @documento NVARCHAR(50),
 @entrada FLOAT, 
 @salida FLOAT, 
 @saldo FLOAT, 
 @ultimoCosto MONEY, 
 @costoPromedio MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Kardex]
			SET

			id_bodega = @idBodega, 
			id_producto = @idProducto, 
			fecha_kardex = @fecha,
			documento_kardex = @documento,
			entrada_kardex = @entrada,
			salida_kardex = @salida,
			saldo_kardex = @saldo,
			ultimoCosto_kardex = @ultimoCosto,
			costoPromedio_kardex = @costoPromedio

			WHERE

			id_producto = @idProducto

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Kit]
(
@id INT,
@fecha DATETIME,
@fechavence DATETIME,
@idProducto INT,
@precio	MONEY,
@estado INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_kit]
			SET
				fecha_kit = @fecha,
				fechavence_kit = @fechavence,
				id_producto = @idProducto,
				precio_kit = @precio

			WHERE
				id_kit = @id
				and estado_kit = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_LogUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_LogUsuarios]
(
@usuario NVARCHAR(50),
@idlog int,
@ip nvarchar(100),
@fecha_log DATE
)
AS

	Begin Try
		Begin Transaction
		update tbl_LogUusarios SET
			
			usuario_empleado = @usuario,
			ipLocal = @ip,
			log = 0,
			fecha_log = @fecha_log
			
			where id_log = @idlog
			and log = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_LogUsuariosCloseSession]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_LogUsuariosCloseSession]
(
@usuario NVARCHAR(50)
)
AS

	Begin Try
		Begin Transaction
		update tbl_LogUusarios SET
			
			log = 0
			where usuario_empleado = @usuario
			and log = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_MovimientoCuentaCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_MovimientoCuentaCliente]
(
 @id INT, 
 @fecha DATETIME, 
 @idClien INT, 
 @idFPago INT, 
 @descrip NVARCHAR(MAX),
 @debito MONEY,
 @credito MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].tbl_MovimientoCuentaClientes
			SET

			fecha_movimiento = @fecha,
			id_cliente =@idClien, 
			id_formaPago = @idFPago,
			descripcion_movimiento = @descrip,
			debito_movimiento = @debito, 
			credito_movimiento = @credito

			WHERE
			id_movimiento = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_MovimientoCuentaProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_MovimientoCuentaProveedor]
(
 @id INT, 
 @fecha DATETIME, 
 @idProv INT, 
 @idFPago INT, 
 @descrip NVARCHAR(MAX),
 @debito MONEY,
 @credito MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_MovimientoCuentaProveedores]
			SET

			fecha_movimiento = @fecha,
			id_proveedor = @idProv, 
			id_formaPago = @idFPago,
			descripcion_movimiento = @descrip,
			debito_movimiento = @debito, 
			credito_movimiento = @credito

			WHERE
			id_movimiento = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_municipio]
(
@idMunicipio INT,	
@idDepartamento INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
		UPDATE dbo.tbl_municipio
		SET
		
		id_municipio = @idMunicipio,
		id_departamento = @idDepartamento,
		nombre_municipio = @nombre

		WHERE 
		id_municipio = @idMunicipio
		
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Actualiza_Proforma]
(
@id INT, 
@fecha DATETIME, 
@idCliente INT, 
@idBodega INT,
@idForma INT, 
@total MONEY, 
@idDoc INT,
@documento NVARCHAR(MAX), 
@observa NVARCHAR(MAX),
@usuario NVARCHAR(MAX),
@estado int 
)

AS

	Begin Try
		Begin Transaction
			update tbl_proforma set	
			 id_proforma = @id,
			 fecha_proforma = @fecha,
			 id_bodega = @idBodega,
			 id_cliente = @idCliente,
			 id_documento = @idDoc,
			 id_formaPago = @idForma,
			 documento = @documento,
			 total_proforma = @total,
			 observaciones_proforma = @observa,
			 usuario_proforma = @usuario,
			 estado_proforma =@estado
			WHERE    
			id_proforma = @id and
			estado_proforma = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_ProformaByVigentes]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_ProformaByVigentes]
(
@id INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_proforma]
			SET
			 estado_proforma = 0
			
			WHERE
			id_proforma = @id and estado_proforma = 1
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_ProvBancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_ProvBancos]
(
 @idProveedor INT, 
 @idBanco INT, 
 @cuenta NVARCHAR(MAX),
 @nombre NVARCHAR(MAX),
 @descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_provbancos]
			SET

			numero_cuenta = @cuenta,
			nombre_cuenta = @nombre, 
			descripcion_cuenta = @descripcion

			WHERE
			id_proveedor = @idProveedor AND id_banco = @idBanco

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Proveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Proveedor]
(
 @id INT, 
 @nombreJuridico NVARCHAR(MAX),
 @nomComercial NVARCHAR(MAX),
 @direccion NVARCHAR(MAX),
 @telef1 NVARCHAR(50),
 @telef2 NVARCHAR(50),
 @correo NVARCHAR(50),
 @nit NVARCHAR(MAX),
 @idIva INT,
 @idMunicipio INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_proveedor]
			SET

			nombreJuridico_proveedor = @nombreJuridico,
			nombreComercial_proveedor = @nomComercial,
			direccion_proveedor = @direccion, 
			telefono1_proveedor = @telef1,
			telefono2_proveedor = @telef2,
			correo_proveedor = @correo,
			nit_proveedor = @nit,
			id_iva = @idIva,
			id_municipio = id_municipio

			WHERE
			id_proveedor = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_RestaStock]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_RestaStock]
(
 @cantidad FLOAT,
 @idBodega INT, 
 @idProducto INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_bodegaProducto]
			SET

			stock_producto = stock_producto - @cantidad

			WHERE
			id_bodega = @idBodega AND id_producto = @idProducto

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_SubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_SubCategoria]
(
 @id INT,
 @descripcion nvarchar(max),
 @idCat int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Sub_Categoria]
			SET

			descripcion_subcategoria = @descripcion,
			id_categoria = @idCat

			WHERE
			id_subcategoria = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_TarjetaCredito]
(
 @id INT,
 @descrip VARCHAR(50),
 @tarifa FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_TarjetaCredito]
			SET

			descripcion_tarjeta = @descrip,
			tarifa_tarjeta = @tarifa


			WHERE
			id_tarjeta = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_TipoDocumentoPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_TipoDocumentoPago]
(
 @id INT,
 @descripcion NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_TipoDocumentoPagos]
			SET

			descripcion_tipoDocumentoPago = @descripcion

			WHERE
			id_tipoDocumentoPago = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_TipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_TipoEmpleado]
(
 @descripcion varchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_tipoEmpleado]
			SET

			descripcion_templeado = @descripcion

			WHERE
			id_templeado = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_TipoProducto]
(
 @id INT, 
 @descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_TipoProducto]
			SET

			descripcion_tproducto = @descripcion

			WHERE
			id_tproducto = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_TipoReparacion]
(
 @id INT,
 @nombre NVARCHAR(MAX),
 @monto MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_TipoReparacion]
			SET

			nombre_treparacion = @nombre,
			monto_treparacion = @monto
			WHERE
			id_treparacion = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_UnidadMedida]
(
 @id INT,
 @descrip NCHAR(10),
 @cant FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_UnidadMedida]
			SET

			descripcion_medida = @descrip,
			cantidad_medida = @cant
			WHERE
			id_medida = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Usuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Usuario]
(
@id INT,
@usuario NVARCHAR(50),
@pass NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_empleado]
			SET

			
			usuario_empleado = @usuario,
			contrasena_empleado = @pass
			
			WHERE
			id_empleado = @id AND estado_empleado = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_Venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_Venta]
(
@id INT, 
@fecha DATETIME, 
@idCliente INT, 
@idBodega INT,
@idForma INT, 
@total MONEY, 
@idDoc INT,
@documento NVARCHAR(MAX), 
@obseva NVARCHAR(MAX),
@plazo INT,
@boleta INT,
@deposito MONEY,
@diff MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_venta]
			SET

			id_venta = @id,
			fecha_venta = @fecha, 
			id_cliente = @idCliente, 
			id_bodega = @idBodega, 
			id_formaPago = @idForma,
			total_venta = @total, 
			id_documento = @idDoc, 
			documento = @documento,
			observaciones_venta = @obseva,
			plazo_venta = @plazo,
			boletaDeposito_venta = @boleta,
			deposito_venta = @deposito,
			diffDepoCompra_venta = @diff
			WHERE
			id_venta = @id
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualiza_VentaByPendienteCobro]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualiza_VentaByPendienteCobro]
(
@id INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_venta]
			SET
			 cobrado_venta = 0
			
			WHERE
			id_venta = @id and cobrado_venta = 1
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Bitaora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Bitaora]
(
@id INT,
@fecha DATE,
@hora nvarchar(MAX),
@usuario VARCHAR(50),
@accion nvarchar(MAX)
)

AS

	Begin Try
		Begin Transaction
		UPDATE tbl_bitacora SET
					fecha_bitacora = @fecha,
					hora_bitacora = @hora,
					usuario = @usuario,
					accion_bitacora = @accion
		where id_bitacora = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_DetalleSalida]
(
@idSalida INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@cantidad FLOAT,
@idKardex INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_DetalleSalida]
			SET

			id_producto = @idProducto,
			descripcion_salida = @descripcion,
			cantidad_salida = @cantidad,
			id_kardex = @idKardex

			WHERE

			id_salida = @idSalida

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_equipo]
(
 @idEquipo INT,
 @idModelo INT,
 @serie		NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_equipo SET
				id_modelo = @idModelo,
				serie_equipo = @serie

				WHERE id_equipo = @idEquipo
		COMMIT Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_marca]
(
@id INT,
@nombre NVARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_marca
			SET
			
			nombre_marca = @nombre

		WHERE 
			id_marca = @id
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_marcaEquipos]
(
@idMarcaE INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_marcaEquipos
			SET
			
			nombre_marcaE = @nombre

			WHERE id_marcaE = @idMarcaE

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_modelo]
(
@idModelo INT,
@nombre NVARCHAR(MAX),
@idMarcaE INT,
@idTequipo INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_modelo
			SET
			
			nombre_modelo = @nombre,
			id_marcaE = id_marcaE,
			id_tequipo = id_tequipo

		WHERE id_modelo = @idModelo
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_PermisosRol]
(
 @id INT, 
 @idRol INT, 
 @formulario VARCHAR(MAX),
 @puedeVer BIT, 
 @puedeModificar BIT, 
 @puedeBorrar BIT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_PermisosRol]
			SET

			id_rol = @idRol,
			formulario_permisos = @formulario,
			puedeVer = @puedeVer, 
			puedeModificar = @puedeModificar,
			puedeBorrar = @puedeBorrar

			WHERE
			id_permisos = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_PrecioCostoPorProductoByFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_PrecioCostoPorProductoByFecha]
(
@id INT,
@idProducto INT, 
@Costo MONEY, 
@referencia NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			UPDATE tbl_PrecioCostoPorProductoByFecha SET
			
			id_producto = @idProducto,
			costo_producto = @Costo,
			referencia_compra = @referencia
			
			WHERE id_PreCostoProducto = @id

			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_producto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_producto]
(
@id INT,
@sku NVARCHAR(max),
@descrip NVARCHAR(max),
@idSubCate INT,
@idIva INT,
@notas TEXT,
@img NVARCHAR(max),
@idMarca INT,
@modelo NVARCHAR(max),
@idTProd int,
@costo Money
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_Producto
			SET
			
			sku_producto = @sku,
			descripcion_producto = @descrip,
			id_Sub_Categoria = @idSubCate, 
			id_iva = @idIva, 
			notas_producto = @notas, 
			imagen_producto = @img, 
			id_marca = @idMarca, 
			modelo_producto = @modelo, 
			id_tproducto = @idTProd,
			costo_producto = @costo
		WHERE 
			id_producto = @id
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_productoPrecioCosto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_productoPrecioCosto]
(
@id INT,
@costo Money
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_Producto
			SET
			costo_producto = @costo
		WHERE 
			id_producto = @id
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_ProductUnidPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_ProductUnidPrecioVenta]
(
@id INT,
@idMedida INT,	
@precio MONEY,
@estado BIT,
@precioBase BIT
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_ProductUnidPrecioVenta
			SET
			
			
			id_medida = @idMedida,
			precio = @precio,
			estado_prounidprecio = @estado,
			precioBase = @precioBase

		WHERE 
			id_producto = @id AND id_medida = @idMedida
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_ProductUnidPrecVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_ProductUnidPrecVenta]
(
@id INT,
@idMedida INT,
@precio MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_ProductUnidPrecioVenta
			SET
			
			precio = @precio

		WHERE 
			id_producto = @id 

			AND id_medida = @idMedida
			AND estado_prounidprecio = 1
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Reparacion]
(
@idReparacion INT,
@fechaReparacion DATETIME,
@idCliente INT,
@idEquipo INT,
@fallaReparacion TEXT,
@informeReparacion TEXT,
@idTreparacion INT,
@costoReparacion MONEY,
@totalRepuestos MONEY,
@fechaEntrega DATETIME,
@terminada INT,
@accesorios TEXT,
@idEmpleado INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_reparacion SET
            
			
			fecha_reparacion = @fechaReparacion,
			id_cliente = @idCliente,
			id_equipo = @idEquipo,
			falla_reparacion = @fallaReparacion, 
			informe_reparacion = @informeReparacion, 
			id_treparacion = @idTreparacion,
			costo_reparacion = @costoReparacion,
			total_repuestos = @totalRepuestos,
			fechaEntrega_reparacion = @fechaEntrega,
			terminada_reparacion = @terminada,
			accesorios_reparacion = @accesorios,
			id_empleado = @idEmpleado

			WHERE id_reparacion = @idReparacion AND
            terminada_reparacion = 0

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_reparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_reparacionRepuestosLevel1]
(
@idReparacion INT,
@idPedido INT,	
@cantidad FLOAT
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_reparacionRepuestosLevel1

			SET

			id_reparacion = @idReparacion, 
			id_pedido = @idPedido, 
			cantidad_reparacionRepuesto = @cantidad

			WHERE id_reparacion = @idReparacion
			  
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Rol]
(
@id INT, 
@descripcion VARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_rol
			SET
			
			descripcion_rol = @descripcion
		WHERE id_rol = @id
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Salida]
(
 @id INT, 
 @fecha DATETIME, 
 @idConcepto INT, 
 @idBodega INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_salida]
			SET

			fecha_salida = @fecha, 
			id_concepto = @idConcepto,
			id_bodega = @idBodega

			WHERE
			id_salida = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_SerieProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_SerieProducto]
(
@id INT,
@idSerie INT,
@numero NVARCHAR(max),
@disponible BIT,
@cantidad FLOAT,
@fechaVC DATETIME,
@fechaVV DATETIME
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_SerieProducto
			SET
			
			numero_serie = @numero,
			disponible_serie = @disponible, 
			cantidad_serie = @cantidad,
			fechaVenceCompra_serie = @fechaVC,
			fechaVenceVenta_serie =  @fechaVV

		WHERE 
			id_producto = @id AND id_serie = @idSerie
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_SerieProductoDescuento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_SerieProductoDescuento]
(
@idSerie INT,
@cantidad INT,
@fechaVV DATETIME
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_SerieProducto
			SET
			
			disponible_serie = 0, 
			cantidad_serie =  cantidad_serie - @cantidad,
			fechaVenceVenta_serie =  @fechaVV

		WHERE 
			id_serie = @idSerie
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_tequipo]
(
@idTequipo INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_tequipo
			SET

			nombre_tequipo = @nombre

			WHERE id_tequipo = @idTequipo

			       
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_Traslado]
(
 @id INT, 
 @fecha DATETIME, 
 @idBodegaOrigen INT, 
 @idBodegaDestino INT, 
 @Descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_traslado]
			SET

			fecha_traslado = @fecha, 
			id_bodegaOrigen = @idBodegaOrigen, 
			id_bodegaDestino = @idBodegaDestino

			WHERE
			id_traslado = @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_treparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Actualizar_treparacion]
(
@idTreparacion INT,
@nombre NVARCHAR(MAX),
@monto MONEY
)

AS

	Begin Try
		Begin Transaction
			UPDATE dbo.tbl_TipoReparacion
			SET

			nombre_treparacion = @nombre,
			monto_treparacion = @monto

			WHERE id_treparacion = @idTreparacion

			       
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO

/****** Object:  StoredProcedure [dbo].[SP_Aumentar_DocumentosInicio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Aumentar_DocumentosInicio]
(
 @id INT,
 @inicio INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Documentos]
			SET

			inicio_documento = inicio_documento + @inicio

			WHERE
			id_documento = @id and activo_documento = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_VentaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_VentaTemp]

AS

	Begin Try
		Begin Transaction
			DELETE FROM tbl_ventaTemp 
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Desactivar_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Desactivar_Documentos]
(
 @id INT
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_Documentos]
			SET

			activo_documento = 0

			WHERE
			id_documento = @id and activo_documento = 1

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Banco]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM tbl_banco
		WHERE (descripcion_banco) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Barra]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_barra
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BitacoraByDate]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BitacoraByDate]
@desde DATE,
@hasta DATE
AS
BEGIN
	SELECT b.id_bitacora, b.fecha_bitacora, b.usuario,
				 b.accion_bitacora, b.hora_bitacora
	FROM tbl_bitacora b
	WHERE ((@desde IS NULL) OR (b.fecha_bitacora >= @desde))
	AND   ((@hasta IS NULL) OR (b.fecha_bitacora <= @hasta))
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Bitaora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Bitaora]
(
@criterio VARCHAR(50)
)

AS

	Begin
		SELECT *
		FROM tbl_bitacora	
		WHERE (usuario) LIKE '%'+@criterio+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Bodega]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM tbl_bodega
		WHERE (nombre_bodega) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoByBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoByBarra]

@criterio varchar(50)

AS
	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
INNER JOIN tbl_barra BBB on P.id_producto = BBB.id_producto
		WHERE (BBB.barra) LIKE '%' + @criterio+'%'
		ORDER BY P.descripcion_producto
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoByDescripProduct]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoByDescripProduct]

@criterio varchar(50)

AS
	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
WHERE (P.descripcion_producto) LIKE '%'+@criterio+'%'
ORDER BY P.descripcion_producto
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoBySKU]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoBySKU]

@criterio varchar(50)

AS
	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
		WHERE (P.sku_producto) LIKE '%' + @criterio +'%'
		ORDER BY P.descripcion_producto
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdBodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdBodega]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_bodega) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdBodegas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdBodegas]

@criterio varchar(50)

AS
	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
		WHERE (BP.id_bodega) LIKE '%' + @criterio+'%'
		ORDER BY BB.nombre_bodega
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdProducto]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostrador]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdProductoMostrador]

@criterio varchar(50)

AS
	Begin 
SELECT
dbo.tbl_Producto.id_producto,
dbo.tbl_Producto.sku_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto,
dbo.tbl_ProductUnidPrecioVenta.precio
FROM
dbo.tbl_Producto
INNER JOIN dbo.tbl_bodegaProducto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_ProductUnidPrecioVenta ON dbo.tbl_ProductUnidPrecioVenta.id_producto = dbo.tbl_Producto.id_producto
WHERE (dbo.tbl_Producto.descripcion_producto) LIKE '%'+@criterio+'%' 
AND dbo.tbl_bodegaProducto.id_bodega = 2 
AND dbo.tbl_ProductUnidPrecioVenta.id_medida = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorByBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorByBarra]

@criterio varchar(50)

AS
	Begin 
SELECT
dbo.tbl_Producto.id_producto,
dbo.tbl_Producto.sku_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto,
dbo.tbl_ProductUnidPrecioVenta.precio
FROM
dbo.tbl_Producto
INNER JOIN dbo.tbl_bodegaProducto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_ProductUnidPrecioVenta ON dbo.tbl_ProductUnidPrecioVenta.id_producto = dbo.tbl_Producto.id_producto
inner JOIN dbo.tbl_barra ON dbo.tbl_barra.id_producto = dbo.tbl_Producto.id_producto
WHERE (dbo.tbl_barra.barra) LIKE '%'+@criterio+'%' 
AND dbo.tbl_bodegaProducto.id_bodega = 2
AND dbo.tbl_ProductUnidPrecioVenta.id_medida = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorBySKU]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorBySKU]

@criterio varchar(50)

AS
	Begin 
SELECT
dbo.tbl_Producto.id_producto,
dbo.tbl_Producto.sku_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto,
dbo.tbl_ProductUnidPrecioVenta.precio
FROM
dbo.tbl_Producto
INNER JOIN dbo.tbl_bodegaProducto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_ProductUnidPrecioVenta ON dbo.tbl_ProductUnidPrecioVenta.id_producto = dbo.tbl_Producto.id_producto
WHERE (dbo.tbl_Producto.sku_producto) LIKE '%'+@criterio+'%' 
AND dbo.tbl_bodegaProducto.id_bodega = 2
AND dbo.tbl_ProductUnidPrecioVenta.id_medida = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_BuscaKardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_BuscaKardex]

@criterio VARCHAR(50)

AS
	Begin 
			SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
			k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
			FROM tbl_Kardex k
			INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
			INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
			WHERE (p.descripcion_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Caja]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Caja]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_cajas
		WHERE (descripcion_caja) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CajaDiaria]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_CajaDiaria
		WHERE (id_caja) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CalculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CalculoPrecioVenta]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_calculoPrecioVenta
		WHERE (descripcion_calculo) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Categoria]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_categoria
		WHERE (descripcion_categoria) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ClienteNit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ClienteNit]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_cliente
		WHERE (nit_cliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ClienteNombre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ClienteNombre]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_cliente
		WHERE (nombre_cliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Compra]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_compra
		WHERE (documento_compra) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CompraCompletaByProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CompraCompletaByProveedor]

@NombreComercial varchar(50),
@nit VARCHAR(50),
@documento VARCHAR(50),
@desde DATE,
@hasta DATE

AS
	Begin 
				
SELECT C.id_compra,
			 C.fecha_compra,
			 C.id_bodega,
		   B.nombre_bodega,
		   C.id_formaPago,
			 F.descripcion_formaPago,
			 C.id_proveedor,
		   P.nit_proveedor,
			 P.nombreComercial_proveedor,
			 C.documento_compra,
			 C.boletaDeposito_compra,
			 C.deposito_compra,
			 C.total_compra,
			 C.diffDepoCompra_compra,
			 C.usuario_compra 
FROM tbl_compra C
	INNER JOIN tbl_proveedor P 
			 ON C.id_proveedor = P.id_proveedor
	INNER JOIN tbl_FormaPago F 
			 ON c.id_formaPago = f.id_formaPago
	INNER JOIN tbl_bodega B 
			 ON C.id_bodega = B.id_bodega
WHERE ((@NombreComercial IS NULL) OR (P.nombreComercial_proveedor LIKE '%' + @NombreComercial + '%'))
	 AND ((@nit IS NULL) OR (p.nit_proveedor LIKE '%' + @nit + '%'))
	 AND ((@documento IS NULL) OR (C.documento_compra LIKE '%' + @documento + '%'))
	 AND ((@desde IS NULL) OR (C.fecha_compra >= @desde))
	 AND ((@hasta IS NULL) OR (C.fecha_compra <= @hasta))

		--CAST(CONVERT(CHAR(8), c.fecha_compra,112) AS INT)
    --BETWEEN CAST(CONVERT(CHAR(8),@desde, 112) AS INT)
    --AND CAST(CONVERT(CHAR(8),@hasta, 112) AS INT)

end



GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ComprasContadoByIDProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ComprasContadoByIDProveedor]

@criterio varchar(50)

AS
	Begin 
		SELECT c.id_compra, c.fecha_compra, c.id_proveedor, p.nombreComercial_proveedor, 
		c.id_bodega, b.nombre_bodega, c.id_formaPago, f.descripcion_formaPago, c.documento_compra,
		c.total_compra, c.notas_compra, c.plazo_compra, c.boletaDeposito_compra, c.deposito_compra,
		c.diffDepoCompra_compra,c.usuario_compra 
		FROM tbl_compra c
		INNER JOIN tbl_proveedor p on c.id_proveedor = p.id_proveedor
		INNER JOIN tbl_bodega b on c.id_bodega = b.id_bodega
		INNER JOIN tbl_FormaPago f on c.id_formaPago = f.id_formaPago
		WHERE (c.id_proveedor) LIKE '%'+@criterio+'%' AND c.id_formaPago <> 3 AND c.id_bodega = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ComprasCreditoByIDProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ComprasCreditoByIDProveedor]

@criterio varchar(50)

AS
	Begin 
		SELECT c.id_compra, c.fecha_compra, c.id_proveedor, p.nombreComercial_proveedor, 
		c.id_bodega, b.nombre_bodega, c.id_formaPago, f.descripcion_formaPago, c.documento_compra,
		c.total_compra, c.notas_compra, c.plazo_compra, c.boletaDeposito_compra, c.deposito_compra,
		c.diffDepoCompra_compra,c.usuario_compra 
		FROM tbl_compra c
		INNER JOIN tbl_proveedor p on c.id_proveedor = p.id_proveedor
		INNER JOIN tbl_bodega b on c.id_bodega = b.id_bodega
		INNER JOIN tbl_FormaPago f on c.id_formaPago = f.id_formaPago
		WHERE (c.id_proveedor) LIKE '%'+@criterio+'%' AND c.id_formaPago = 3 AND c.id_bodega = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Conceptos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Conceptos]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_conceptos
		WHERE (descripcion_concepto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ControlArqueo]

@criterio varchar(50),
@desde DATE,
@hasta DATE

AS
	Begin 
		SELECT * FROM dbo.tbl_ControlArqueo
			WHERE CAST(CONVERT(CHAR(8), fecha_control,112) AS INT)
			BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
			AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
			AND (id_caja) LIKE '%'+@criterio+'%' 
			AND Estado = 'Grabada'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ControlArqueoCierre]

@criterio varchar(50),
@fecha    DATE

AS
	Begin 
		SELECT * FROM dbo.tbl_ControlArqueoCierre
		WHERE (id_caja) LIKE '%'+@criterio+'%'
		AND Estado = 'Grabada'
		AND fecha_control = @fecha
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ControlCajaApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ControlCajaApertura]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_ControlCajasApertura
		WHERE (id_caja) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CuentaPorCobrarDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CuentaPorCobrarDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_cuentasPorCobrar
		WHERE (documento_venta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CuentaPorCobrarIDCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CuentaPorCobrarIDCliente]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_cuentasPorCobrar
		WHERE (id_cliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CuentaPorPagarDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CuentaPorPagarDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_CuentaPorPagar
		WHERE (documento_CuentaPorPagar) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_CuentaPorPagarIDProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_CuentaPorPagarIDProveedor]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_CuentaPorPagar
		WHERE (id_proveedor) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Departamento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_departamento
		WHERE (nombre_departamento) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleCompra]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleCompra
		WHERE (id_compra) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleDevolucionCliente]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleDevolucionCliente
		WHERE (id_devolucionCliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleInventario]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_detalle_inventario
		WHERE (descripcion_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleKit]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleKit
		WHERE (id_kit) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleKitByIDProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleKitByIDProducto]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleKit
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetallePagoCredito]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetallePagoCredito
		WHERE (id_pagocre) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetallePagoCreditoContado]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetallePagoCreditoContado
		WHERE (id_pagocrecont) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_detallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Filtrar_detallePedido]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_detallePedido
		WHERE (id_pedido) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleSalida]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleSalida
		WHERE (id_salida) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleTraslado]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_detalleTraslado
		WHERE (id_traslado) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DetalleVenta]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_DetalleVenta
		WHERE (id_venta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Documentos]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Documentos
		WHERE (nombre_documento) LIKE '%'+@criterio+'%'
		AND activo_documento = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DocumentosByIDDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DocumentosByIDDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE '%'+@criterio+'%'
		AND activo_documento = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_DocumentosByIDTDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_DocumentosByIDTDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE '%'+@criterio+'%'
		AND activo_documento = 1
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_EmpleadoApellido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_EmpleadoApellido]
@Criterio	varchar(50)
as
select *
from dbo.tbl_empleado
where (apellido_empleado) LIKE '%'+@Criterio+'%' and estado_empleado = 'activo'
order by apellido_empleado asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_EmpleadoNombre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_EmpleadoNombre]
@Criterio	varchar(50)
as
select *
from dbo.tbl_empleado
where (nombre_empleado) LIKE '%'+@Criterio+'%' and estado_empleado = 'activo'
order by nombre_empleado asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_EmpleadoUsuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_EmpleadoUsuario]
@Criterio	varchar(50)
as

SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
where (usuario_empleado) LIKE '%'+@Criterio+'%' and estado_empleado = 1
order by usuario_empleado asc
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_equipo]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_equipo
		WHERE (serie_equipo) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_FacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_FacturasCompras]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_FacturasCompras
		WHERE (id_compra) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_FacturasComprasByDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_FacturasComprasByDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_FacturasCompras
		WHERE (documento_facturacompra) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_FacturasVentas]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_FacturasVentas
		WHERE (id_venta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_FacturasVentasByDocumento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_FacturasVentasByDocumento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_FacturasVentas
		WHERE (documento_facturaventa) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_FormaPago]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_FormaPago
		WHERE (descripcion_formaPago) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Inventario]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Inventario
		WHERE (id_inventario) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Iva]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_iva
		WHERE (id_iva) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Kardex]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_Kardex	
			WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Kit]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_kit
		WHERE (id_kit) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_LogUsuarioByUsuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Filtrar_LogUsuarioByUsuario]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_LogUusarios
		WHERE (usuario_empleado) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_marca]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_marca
		WHERE (nombre_marca) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_marcaEquipos]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_marcaEquipos
		WHERE (nombre_marcaE) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_modelo]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_modelo
		WHERE (nombre_modelo) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_modeloIDMarca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_modeloIDMarca]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_modelo
		WHERE (id_marcaE) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_MovimientoCuentaCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_MovimientoCuentaCliente]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_MovimientoCuentaClientes
		WHERE (id_cliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_MovimientoCuentaProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_MovimientoCuentaProveedor]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_MovimientoCuentaProveedores
		WHERE (id_proveedor) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_municipio]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_municipio
		WHERE (nombre_municipio) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_municipioByIDDepartamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_municipioByIDDepartamento]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_municipio
		WHERE id_departamento = @criterio  
		ORDER BY nombre_municipio
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_PermisosRol]

@criterio int

AS
	Begin 
		SELECT * FROM dbo.tbl_PermisosRol
		WHERE (id_permisos) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_PrecioCostoPorProductoByFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_PrecioCostoPorProductoByFecha]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_PrecioCostoPorProductoByFecha
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productoBarraByBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productoBarraByBarra]

@criterio nvarchar(MAX)

AS
	Begin 
		
			SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto, p.imagen_producto, 
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto,p.costo_producto
		FROM dbo.tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
		WHERE (b.barra) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productoBarraByDescripcion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productoBarraByDescripcion]

@criterio varchar(50)

AS
	Begin 
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria,
		id_iva, notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		FROM tbl_Producto
		WHERE (descripcion_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productoByDescripcion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productoByDescripcion]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_producto
		WHERE (descripcion_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productoByID]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productoByID]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_producto
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productoBySku]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productoBySku]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_producto
		WHERE (sku_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productosByDescripcion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productosByDescripcion]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_producto
		WHERE (descripcion_producto) LIKE '%'+@criterio+'%' and id_tproducto <> 4
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_productosBySKU]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_productosBySKU]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_producto
		WHERE (sku_producto) LIKE '%'+@criterio+'%' and id_tproducto <> 4
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ProductUnidadPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ProductUnidadPrecioVenta]

@criterio int

AS
	Begin 
		SELECT * FROM dbo.tbl_ProductUnidPrecioVenta
		WHERE (id_producto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Proforma]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_proforma
		WHERE (id_proforma) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ProvBancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ProvBancos]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_provbancos
		WHERE (numero_cuenta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ProveedorByNit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ProveedorByNit]

@criterio int

AS
	Begin 
		SELECT * FROM dbo.tbl_proveedor
		WHERE (nit_proveedor) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ProveedorByNomComercial]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ProveedorByNomComercial]

@criterio VARCHAR(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_proveedor
		WHERE (nombreComercial_proveedor) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ProveedorByNomJuridico]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ProveedorByNomJuridico]

@criterio int

AS
	Begin 
		SELECT * FROM dbo.tbl_proveedor
		WHERE (nombreJuridico_proveedor) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Reparacion]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_reparacion
		WHERE (id_cliente) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ReparacionIDReparacionEspera]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ReparacionIDReparacionEspera]

@criterio varchar(50)

AS
	Begin 
		SELECT 
			R.id_reparacion,R.fecha_reparacion,R.id_cliente,c.nombre_cliente,
			R.id_equipo,q.serie_equipo,q.id_modelo,m.nombre_modelo,m.id_marcaE,
			a.nombre_marcaE,tt.nombre_tequipo,R.falla_reparacion,R.informe_reparacion,
			R.id_treparacion,T.nombre_treparacion,R.costo_reparacion,R.total_repuestos,
			R.fechaEntrega_reparacion,R.terminada_reparacion,
			R.accesorios_reparacion,R.id_empleado, e.nombre_empleado
		 FROM dbo.tbl_reparacion R
			INNER JOIN dbo.tbl_cliente C ON c.id_cliente = r.id_cliente
			INNER JOIN dbo.tbl_TipoReparacion t ON t.id_treparacion = r.id_treparacion
			INNER JOIN dbo.tbl_empleado e ON e.id_empleado = r.id_empleado
			INNER JOIN dbo.tbl_equipo q ON q.id_equipo = r.id_equipo
			INNER JOIN dbo.tbl_modelo m ON m.id_modelo = q.id_modelo
			INNER JOIN dbo.tbl_marcaEquipos a ON a.id_marcaE = m.id_marcaE
			INNER JOIN dbo.tbl_tequipo tt ON tt.id_tequipo = m.id_tequipo
		  WHERE (r.id_reparacion) LIKE '%'+@criterio+'%' 
		  AND R.terminada_reparacion = 0 
		
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ReparacionNombreClienteEspera]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ReparacionNombreClienteEspera]

@criterio varchar(50)

AS
	Begin 
		SELECT 
			R.id_reparacion,R.fecha_reparacion,R.id_cliente,c.nombre_cliente,
			R.id_equipo,q.serie_equipo,q.id_modelo,m.nombre_modelo,m.id_marcaE,
			a.nombre_marcaE,tt.nombre_tequipo,R.falla_reparacion,R.informe_reparacion,
			R.id_treparacion,T.nombre_treparacion,R.costo_reparacion,R.total_repuestos,
			R.fechaEntrega_reparacion,R.terminada_reparacion,
			R.accesorios_reparacion,R.id_empleado, e.nombre_empleado
		 FROM dbo.tbl_reparacion R
			INNER JOIN dbo.tbl_cliente C ON c.id_cliente = r.id_cliente
			INNER JOIN dbo.tbl_TipoReparacion t ON t.id_treparacion = r.id_treparacion
			INNER JOIN dbo.tbl_empleado e ON e.id_empleado = r.id_empleado
			INNER JOIN dbo.tbl_equipo q ON q.id_equipo = r.id_equipo
			INNER JOIN dbo.tbl_modelo m ON m.id_modelo = q.id_modelo
			INNER JOIN dbo.tbl_marcaEquipos a ON a.id_marcaE = m.id_marcaE
			INNER JOIN dbo.tbl_tequipo tt ON tt.id_tequipo = m.id_tequipo
		  WHERE (c.nombre_cliente) LIKE '%'+@criterio+'%' 
		  AND R.terminada_reparacion = 0 
		
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_ReparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_ReparacionRepuestosLevel1]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_reparacionRepuestosLevel1
		WHERE (id_reparacion) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Rol]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_rol
		WHERE (descripcion_rol) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_salida]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_salida
		WHERE (id_salida) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_SerieProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_SerieProducto]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_SerieProducto
		WHERE (id_producto) LIKE '%'+@criterio+'%'
		AND disponible_serie > 0
		AND cantidad_serie > 0
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_SubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_SubCategoria]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Sub_Categoria
		WHERE (descripcion_subcategoria) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_SubCategoriaByIDCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_SubCategoriaByIDCategoria]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_Sub_Categoria
		WHERE (id_categoria) LIKE '%'+@criterio+'%'
		ORDER BY descripcion_subcategoria
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_TarjetaCredito]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_TarjetaCredito
		WHERE (descripcion_tarjeta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_tequipo]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_tequipo
		WHERE (nombre_tequipo) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_TipoDocumentoPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_TipoDocumentoPago]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_TipoDocumentoPagos
		WHERE (descripcion_tipoDocumentoPago) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_TipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_TipoEmpleado]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_tipoEmpleado
		WHERE (descripcion_templeado) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_TipoProducto]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_tipoProducto
		WHERE (id_tproducto) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Filtrar_TipoReparacion]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_TipoReparacion
		WHERE (id_treparacion) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_Traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_Traslado]

@criterio int

AS
	Begin 
		SELECT * FROM tbl_traslado
		WHERE (id_traslado) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_treparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_treparacion]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_TipoReparacion
		WHERE (nombre_treparacion) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_UnidadMedida]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_UnidadMedida
		WHERE (descripcion_medida) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Filtrar_venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Filtrar_venta]

@criterio varchar(50)

AS
	Begin 
		SELECT * FROM dbo.tbl_venta
		WHERE (id_venta) LIKE '%'+@criterio+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SP_Inserta_ControlArqueo]
(
 @IDControl	INT,
 @id_caja	INT,
 @Cantidad200 INT, 
 @Total200 DECIMAL(18,0),	
 @Cantidad100	INT,
 @Total100	decimal(18, 0),
 @Cantidad50	INT,
 @Total50	decimal(18, 0),
 @Cantidad20	INT,
 @Total20	decimal(18, 0),
 @Cantidad10	INT,
 @Total10	decimal(18, 0),
 @Cantidad5	INT,
 @Total5	decimal(18, 0),
 @Cantidad1	INT,
 @Total1	decimal(18, 0),
 @Cantidad050	INT,
 @Total050	decimal(18, 0),
 @Cantidad025	INT,
 @Total025	decimal(18, 0),
 @Cantidad010	INT,
 @Total010	decimal(18, 0),
 @Cantidad005	INT,
 @Total005	decimal(18, 0),
 @Cantidad001	INT,
 @Total001	decimal(18, 0),
 @GranTotal	decimal(18, 0)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_ControlArqueo
			        ( id_control ,
			          fecha_control ,
			          id_caja ,
			          Cantidad200 ,
			          Total200 ,
			          Cantidad100 ,
			          Total100 ,
			          Cantidad50 ,
			          Total50 ,
			          Cantidad20 ,
			          Total20 ,
			          Cantidad10 ,
			          Total10 ,
			          Cantidad5 ,
			          Total5 ,
			          Cantidad1 ,
			          Total1 ,
			          Cantidad050 ,
			          Total050 ,
			          Cantidad025 ,
			          Total025 ,
			          Cantidad010 ,
			          Total010 ,
			          Cantidad005 ,
			          Total005 ,
			          Cantidad001 ,
			          Total001 ,
			          GranTotal ,
			          Estado
			        )
			VALUES  ( @IDControl , -- id_control - int
			          GETDATE() , -- fecha_control - datetime
			          @id_caja , -- id_caja - int
			          @Cantidad200 , -- Cantidad200 - int
			          @Total200 , -- Total200 - decimal
			          @Cantidad100 , -- Cantidad100 - int
			          @Total100 , -- Total100 - decimal
			          @Cantidad50 , -- Cantidad50 - int
			          @Total50 , -- Total50 - decimal
			          @Cantidad20, -- Cantidad20 - int
			          @Total20 , -- Total20 - decimal
			          @Cantidad10 , -- Cantidad10 - int
			          @Total10 , -- Total10 - decimal
			          @Cantidad5 , -- Cantidad5 - int
			          @Total5 , -- Total5 - decimal
			          @Cantidad1 , -- Cantidad1 - int
			          @Total1 , -- Total1 - decimal
			          @Cantidad050, -- Cantidad050 - int
			          @Total050 , -- Total050 - decimal
			          @Cantidad025 , -- Cantidad025 - int
			          @Total025 , -- Total025 - decimal
			          @Cantidad010 , -- Cantidad010 - int
			          @Total010 , -- Total010 - decimal
			          @Cantidad005, -- Cantidad005 - int
			          @Total005 , -- Total005 - decimal
			          @Cantidad001 , -- Cantidad001 - int
			          @Total001 , -- Total001 - decimal
			          @GranTotal , -- GranTotal - decimal
			          'grabada'  -- Estado - nchar(10)
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SP_Inserta_ControlArqueoCierre]
(
 @IDControl	INT,
 @id_caja	INT,
 @Cantidad200 INT, 
 @Total200 DECIMAL(18,0),	
 @Cantidad100	INT,
 @Total100	decimal(18, 0),
 @Cantidad50	INT,
 @Total50	decimal(18, 0),
 @Cantidad20	INT,
 @Total20	decimal(18, 0),
 @Cantidad10	INT,
 @Total10	decimal(18, 0),
 @Cantidad5	INT,
 @Total5	decimal(18, 0),
 @Cantidad1	INT,
 @Total1	decimal(18, 0),
 @Cantidad050	INT,
 @Total050	decimal(18, 0),
 @Cantidad025	INT,
 @Total025	decimal(18, 0),
 @Cantidad010	INT,
 @Total010	decimal(18, 0),
 @Cantidad005	INT,
 @Total005	decimal(18, 0),
 @Cantidad001	INT,
 @Total001	decimal(18, 0),
 @GranTotal	decimal(18, 0)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_ControlArqueoCierre
			        ( id_control ,
			          fecha_control ,
			          id_caja ,
			          Cantidad200 ,
			          Total200 ,
			          Cantidad100 ,
			          Total100 ,
			          Cantidad50 ,
			          Total50 ,
			          Cantidad20 ,
			          Total20 ,
			          Cantidad10 ,
			          Total10 ,
			          Cantidad5 ,
			          Total5 ,
			          Cantidad1 ,
			          Total1 ,
			          Cantidad050 ,
			          Total050 ,
			          Cantidad025 ,
			          Total025 ,
			          Cantidad010 ,
			          Total010 ,
			          Cantidad005 ,
			          Total005 ,
			          Cantidad001 ,
			          Total001 ,
			          GranTotal ,
			          Estado
			        )
			VALUES  ( @IDControl , -- id_control - int
			          GETDATE() , -- fecha_control - datetime
			          @id_caja , -- id_caja - int
			          @Cantidad200 , -- Cantidad200 - int
			          @Total200 , -- Total200 - decimal
			          @Cantidad100 , -- Cantidad100 - int
			          @Total100 , -- Total100 - decimal
			          @Cantidad50 , -- Cantidad50 - int
			          @Total50 , -- Total50 - decimal
			          @Cantidad20, -- Cantidad20 - int
			          @Total20 , -- Total20 - decimal
			          @Cantidad10 , -- Cantidad10 - int
			          @Total10 , -- Total10 - decimal
			          @Cantidad5 , -- Cantidad5 - int
			          @Total5 , -- Total5 - decimal
			          @Cantidad1 , -- Cantidad1 - int
			          @Total1 , -- Total1 - decimal
			          @Cantidad050, -- Cantidad050 - int
			          @Total050 , -- Total050 - decimal
			          @Cantidad025 , -- Cantidad025 - int
			          @Total025 , -- Total025 - decimal
			          @Cantidad010 , -- Cantidad010 - int
			          @Total010 , -- Total010 - decimal
			          @Cantidad005, -- Cantidad005 - int
			          @Total005 , -- Total005 - decimal
			          @Cantidad001 , -- Cantidad001 - int
			          @Total001 , -- Total001 - decimal
			          @GranTotal , -- GranTotal - decimal
			          'grabada'  -- Estado - nchar(10)
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_DetalleKit]
(
@idKit INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@Precio MONEY,
@cantidad FLOAT,
@Serie NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_DetalleKit
			        ( id_kit ,
			          id_producto ,
			          descripcion_producto ,
			          precio_producto ,
			          cantidad_detalleKit ,
			          numero_serie
			        )
			VALUES  ( @idKit , -- id_kit - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @Precio , -- precio_producto - money
			          @cantidad , -- cantidad_detalleKit - float
			          @Serie  -- numero_serie - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_DetalleVenta]
(
@idVenta INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@precio MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT,
@serie NVARCHAR(MAX),
@fecha DATETIME,
@medida NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_DetalleVenta
			        ( id_venta ,
			          id_producto ,
			          descripcion_producto ,
			          precio_producto ,
			          cantidad_producto ,
			          id_kardex ,
			          porcentajeIva ,
			          porcentajeDescuento ,
			          numeroSerie ,
			          fechaGarantia,
								descripcion_medida
			        )
			VALUES  ( @idVenta , -- id_venta - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @precio , -- precio_producto - money
			          @cantidad , -- cantidad_producto - float
			          @idKardex , -- id_kardex - int
			          @porcentajeIva , -- porcentajeIva - float
			          @porcentajeDescuento , -- porcentajeDescuento - float
			          @serie , -- numeroSerie - nvarchar(max)
			          @fecha,  -- fechaGarantia - datetime
								@medida
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_DetalleVentaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_DetalleVentaTemp]
(
@idVenta INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@precio MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT,
@serie NVARCHAR(MAX),
@fecha DATETIME
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_DetalleVentaTemp
			        ( id_venta ,
			          id_producto ,
			          descripcion_producto ,
			          precio_producto ,
			          cantidad_producto ,
			          id_kardex ,
			          porcentajeIva ,
			          porcentajeDescuento ,
			          numeroSerie ,
			          fechaGarantia
			        )
			VALUES  ( @idVenta , -- id_venta - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @precio , -- precio_producto - money
			          @cantidad , -- cantidad_producto - float
			          @idKardex , -- id_kardex - int
			          @porcentajeIva , -- porcentajeIva - float
			          @porcentajeDescuento , -- porcentajeDescuento - float
			          @serie , -- numeroSerie - nvarchar(max)
			          @fecha  -- fechaGarantia - datetime
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_Documentos]
(
 @id INT,
 @nombre NVARCHAR(MAX),
 @abrevia NVARCHAR(50),
 @serie NVARCHAR(50),
 @idTipo INT,
 @inicio INT,
 @fin INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_Documentos
			        ( id_documento ,
			          nombre_documento ,
			          abreviatura_documento ,
			          serie_documento ,
			          id_tipoDocumentoPago ,
			          inicio_documento ,
			          final_documento,
								activo_documento,
								utilizado_documento
			        )
			VALUES  ( @id , -- id_documento - int
			          @nombre , -- nombre_documento - nvarchar(max)
			          @abrevia , -- abreviatura_documento - nvarchar(50)
			          @serie , -- serie_documento - nvarchar(50)
			          @idTipo , -- id_tipoDocumentoPago - int
			          @inicio , -- inicio_documento - int
			          @fin,  -- final_documento - int
								1,
								0
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_FacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[SP_Inserta_FacturasCompras]
(
 @idCompra INT, 
 @documento NVARCHAR(MAX),
 @monto MONEY, 
 @iva MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_FacturasCompras
			        (
			          fecha_facturacompra ,
			          id_compra ,
			          documento_facturacompra ,
			          monto_facturacompra ,
			          iva_facturacompra ,
			          isr_facturacompra ,
			          iso_facturacompra ,
			          estado_facturacompra
			        )
			VALUES  ( 
			          GETDATE() , -- fecha_facturacompra - datetime
			          @idCompra , -- id_compra - int
			          @documento , -- documento_facturacompra - nvarchar(max)
			          @monto , -- monto_facturacompra - money
			          @iva , -- iva_facturacompra - money
			          0 , -- isr_facturacompra - money
			          0 , -- iso_facturacompra - money
			          1  -- estado_facturacompra - int
			        )

	

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_FacturasVentas]
(
 @idVenta INT, 
 @documento NVARCHAR(MAX),
 @monto MONEY, 
 @iva MONEY, 
 @isr MONEY, 
 @iso MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_FacturasVentas
			        ( 
			          fecha_facturaventa ,
			          id_venta ,
			          documento_facturaventa ,
			          monto_facturaventa ,
			          iva_facturaventa ,
			          isr_facturaventa ,
			          iso_facturaventa ,
			          estado_facturaventa
			        )
			VALUES  ( 
			          GETDATE() , -- fecha_facturaventa - datetime
			          @idVenta , -- id_venta - int
			          @documento , -- documento_facturaventa - nvarchar(max)
			          @monto , -- monto_facturaventa - money
			          @iva , -- iva_facturaventa - money
			          @isr , -- isr_facturaventa - money
			          @iso , -- iso_facturaventa - money
			          1  -- estado_facturaventa - int
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_FormaPago]
(
 @descripcion NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_FormaPago
			        ( descripcion_formaPago )
			VALUES  ( @descripcion  -- descripcion_formaPago - nvarchar(50)
			          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_Iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_Iva]
(
 @id INT, 
 @descripcion NVARCHAR(MAX),
 @tarifa FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_iva
			        ( id_iva, descripcion_iva, tarifa_iva )
			VALUES  ( @id,
					  @descripcion, -- descripcion_iva - nvarchar(max)
			          @tarifa  -- tarifa_iva - float
			          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_Kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_Kit]
(
 @id INT OUTPUT,
@fecha DATETIME,
@fechavence DATETIME,
@idProducto INT,
@precio	MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_kit
			        ( fecha_kit ,
			          fechavence_kit ,
			          id_producto ,
			          precio_kit,
				        estado_kit
			        )
			VALUES  ( @fecha , -- fecha_kit - datetime
			          @fechavence , -- fechavence_kit - datetime
			          @idProducto , -- id_producto - int
			          @precio, -- precio_kit - money
			          1
							)

SET @id = SCOPE_IDENTITY()
				SELECT @id
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_LogUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_LogUsuarios]
(
@usuario NVARCHAR(50),
@ip nvarchar(100)
)

AS

	Begin Try
		Begin Transaction
		INSERT INTO tbl_LogUusarios
		(
			usuario_empleado,
			log,
			ipLocal,
			fecha_log
		)
		VALUES
		(
			@usuario,
			1,
			@ip,
			getdate()
		)

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_MovimientoCuentaCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_MovimientoCuentaCliente]
(
 @idClien INT, 
 @idFPago INT, 
 @descrip NVARCHAR(MAX),
 @debito MONEY,
 @credito MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_MovimientoCuentaClientes
			        ( fecha_movimiento ,
			          id_cliente ,
			          id_formaPago ,
			          descripcion_movimiento ,
			          debito_movimiento ,
			          credito_movimiento
			        )
			VALUES  ( GETDATE() , -- fecha_movimiento - datetime
			          @idClien , -- id_cliente - int
			          @idFPago , -- id_formaPago - int
			          @descrip , -- descripcion_movimiento - nvarchar(max)
			          @debito , -- debito_movimiento - money
			          @credito  -- credito_movimiento - money
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_MovimientoCuentaProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_MovimientoCuentaProveedor]
(
 @idProv INT, 
 @idFPago INT, 
 @descrip NVARCHAR(MAX),
 @debito MONEY,
 @credito MONEY
)

AS

	Begin Try
		Begin Transaction
				INSERT INTO	dbo.tbl_MovimientoCuentaProveedores
				        ( fecha_movimiento ,
				          id_proveedor ,
				          id_formaPago ,
				          descripcion_movimiento ,
				          debito_movimiento ,
				          credito_movimiento
				        )
				VALUES  ( GETDATE() , -- fecha_movimiento - datetime
				          @idProv , -- id_proveedor - int
				          @idFPago , -- id_formaPago - int
				          @descrip , -- descripcion_movimiento - nvarchar(max)
				          @debito , -- debito_movimiento - money
				          @credito  -- credito_movimiento - money
				        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_Proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Inserta_Proforma]
(
@id INT, 
@fecha DATETIME, 
@idCliente INT, 
@idBodega INT,
@idForma INT, 
@total MONEY, 
@idDoc INT,
@documento NVARCHAR(MAX), 
@observa NVARCHAR(MAX),
@usuario NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO tbl_proforma
			(
			 id_proforma,
			 fecha_proforma,
			 id_bodega,
			 id_cliente,
			 id_documento,
			 id_formaPago,
			 documento,
			 total_proforma,
			 observaciones_proforma,
			 usuario_proforma,
			 estado_proforma
			)
			VALUES
			(
			 @id,
			 @fecha,
			 @idCliente,
			 @idBodega,
			 @idForma,
			 @total,
			 @idDoc,
			 @documento,
			 @observa,
			 @usuario,
			 1
			)

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_SubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_SubCategoria]
(
 @id INT,
 @descripcion nvarchar(max),
 @idCat int
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_Sub_Categoria
			        ( 
					  id_subcategoria ,
			          descripcion_subcategoria,
					  id_categoria
			        )
			VALUES  ( @id , -- id_categoria - int
			          @descripcion,  -- descripcion_categoria - nvarchar(max)
					  @idCat
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_TarjetaCredito]
(
 @id INT,
 @descrip VARCHAR(50),
 @tarifa FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_TarjetaCredito
			        ( id_tarjeta ,
			          descripcion_tarjeta ,
			          tarifa_tarjeta
			        )
			VALUES  ( @id , -- id_tarjeta - int
			          @descrip , -- descripcion_tarjeta - varchar(50)
			          @tarifa  -- tarifa_tarjeta - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_TipoDocumentoPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_TipoDocumentoPago]
(
 @id INT,
 @descripcion NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_TipoDocumentoPagos
			        ( id_tipoDocumentoPago ,
			          descripcion_tipoDocumentoPago
			        )
			VALUES  ( @id , -- id_tipoDocumentoPago - int
			          @descripcion  -- descripcion_tipoDocumentoPago - nvarchar(50)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_Venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_Venta]
(
@id INT, 
@fecha DATETIME, 
@idCliente INT, 
@idBodega INT,
@idForma INT, 
@total MONEY, 
@idDoc INT,
@documento NVARCHAR(MAX), 
@observa NVARCHAR(MAX),
@plazo INT,
@boleta INT,
@deposito MONEY,
@diff MONEY,
@usuario NVARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT	INTO dbo.tbl_venta
			        ( id_venta ,
			          fecha_venta ,
			          id_cliente ,
			          id_bodega ,
			          id_formaPago ,
			          total_venta ,
			          id_documento ,
			          documento ,
			          observaciones_venta ,
			          plazo_venta ,
			          boletaDeposito_venta ,
			          deposito_venta ,
			          diffDepoCompra_venta,
								usuario_venta,
								cobrado_venta
			        )
			VALUES  ( @id , -- id_venta - int
			          @fecha , -- fecha_venta - datetime
			          @idCliente , -- id_cliente - int
			          @idBodega , -- id_bodega - int
			          @idForma , -- id_formaPago - int
			          @total , -- total_venta - money
			          @idDoc , -- id_documento - int
			          @documento , -- documento - nvarchar(max)
			          @observa , -- observaciones_venta - nvarchar(max)
			          @plazo , -- plazo_venta - int
			          @boleta , -- boletaDeposito_venta - int
			          @deposito , -- deposito_venta - money
			          @diff,  -- diffDepoCompra_venta - money
								@usuario,
		      		  1 --el estado 1 = transaccion cobrada en caja, 2 = pendiente de cobrar en caja
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Inserta_VentaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Inserta_VentaTemp]
(
@id INT, 
@fecha DATETIME, 
@idCliente INT, 
@idBodega INT,
@idForma INT, 
@total MONEY, 
@idDoc INT,
@documento NVARCHAR(MAX), 
@observa NVARCHAR(MAX),
@plazo INT,
@boleta INT,
@deposito MONEY,
@diff MONEY,
@usuario NVARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT	INTO dbo.tbl_ventaTemp
			        ( id_venta ,
			          fecha_venta ,
			          id_cliente ,
			          id_bodega ,
			          id_formaPago ,
			          total_venta ,
			          id_documento ,
			          documento ,
			          observaciones_venta ,
			          plazo_venta ,
			          boletaDeposito_venta ,
			          deposito_venta ,
			          diffDepoCompra_venta,
								usuario_venta,
								cobrado_venta
			        )
			VALUES  ( @id , -- id_venta - int
			          @fecha , -- fecha_venta - datetime
			          @idCliente , -- id_cliente - int
			          @idBodega , -- id_bodega - int
			          @idForma , -- id_formaPago - int
			          @total , -- total_venta - money
			          @idDoc , -- id_documento - int
			          @documento , -- documento - nvarchar(max)
			          @observa , -- observaciones_venta - nvarchar(max)
			          @plazo , -- plazo_venta - int
			          @boleta , -- boletaDeposito_venta - int
			          @deposito , -- deposito_venta - money
			          @diff,  -- diffDepoCompra_venta - money
								@usuario,
		      		  1 --el estado 1 = transaccion cobrada en caja, 2 = pendiente de cobrar en caja
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Banco]
(
@id INT,
@descrip NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
		INSERT INTO dbo.tbl_banco
		        ( 
					id_banco,
					descripcion_banco )
		VALUES  ( 
					@id,
					@descrip  -- descripcion_banco - varchar(max)
		          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Barra]
(
 @id int,
 @barra bigint
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_barra]
			(barra, id_producto)
			VALUES
			(@barra, @id)

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Bitaora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Bitaora]
(
@fecha DATE,
@hora NVARCHAR(MAX),
@usuario VARCHAR(50),
@accion nvarchar(MAX)
)

AS

	Begin Try
		Begin Transaction
		INSERT INTO dbo.tbl_bitacora
		        ( 
					fecha_bitacora,
					hora_bitacora,
					usuario,
					accion_bitacora
						)
		VALUES  ( 
					@fecha,
					@hora,
					@usuario,
					@accion
		          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Bodega]
(
 @descripcion nvarchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_bodega]
			(id_bodega,nombre_bodega)
			VALUES
			(@id,@descripcion)

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_BodegaProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_BodegaProducto]
(
@idBodega int,
@idProducto int,
@minimo float,
@maximo float,
@dias int,
@cantidad float
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_bodegaProducto]
			(
			id_bodega,
			id_producto,
			stock_producto,
			minimo_producto,
			maximo_producto,
			diasReposicion_producto,
			cantidadMinima_producto
			)
			VALUES
			(
			@idBodega,
			@idProducto,
			0,
			@minimo,
			@maximo,
			@dias,
			@cantidad
			)

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Caja]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Caja]
(
 @id INT,
 @descripcion varchar(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_cajas
			        ( id_caja, descripcion_caja )
			VALUES  ( @id, -- id_caja - int
			          @descripcion  -- descripcion_caja - varchar(max)
			          )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CajaDiaria]
(
 @idcaja int,
 @montoApertura money,
 @ingreso		money,
 @ingresoCheque money,
 @ingresoTarjeta money,
 @egreso		money,
 @cierre		money,
 @saldo			money
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_CajaDiaria]	
			        (
						  [fecha_movimiento] ,
						  [id_caja] ,
						  [montoApertura_movimiento] ,
						  [ingreso_movimiento] ,
							[ingresoCheque_movimiento],
							[ingresoTarjeta_movimiento],
						  [egreso_movimiento] ,
						  [cierre_movimiento] ,
						  [saldo_movimiento] ,
						  [estado_movimiento]
			        )
			VALUES  (
						  GETDATE() , -- fecha_movimiento - datetime
						  @idCaja , -- id_caja - int
						  @montoApertura , -- montoApertura_movimiento - money
						  @ingreso , -- ingreso_movimiento - money
						  @ingresoCheque,
						  @ingresoTarjeta,
						  @egreso , -- egreso_movimiento - money
						  @cierre , -- cierre_movimiento - money
						  @saldo , -- saldo_movimiento - money
						  1  -- estado_movimiento - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CajaDiariaCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CajaDiariaCierre]
(
 @idcaja int,
 @cierre		money,
 @saldo			money
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_CajaDiaria]	
			        (
						  [fecha_movimiento] ,
						  [id_caja] ,
						  [montoApertura_movimiento] ,
						  [ingreso_movimiento] ,
						  [ingresoCheque_movimiento],
						  [ingresoTarjeta_movimiento],
						  [egreso_movimiento] ,
						  [cierre_movimiento] ,
						  [saldo_movimiento] ,
						  [estado_movimiento]
			        )
			VALUES  (
						  GETDATE() , -- fecha_movimiento - datetime
						  @idCaja , -- id_caja - int
						  0,
						  0,
						  0,
						  0,
						  0,
						  @cierre , -- cierre_movimiento - money
						  @saldo  , -- saldo_movimiento - money
						  4  -- estado_movimiento - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        )

			UPDATE tbl_CajaDiaria SET
							estado_movimiento = 4 where id_caja = @idcaja and estado_movimiento = 1 and montoApertura_movimiento > 0

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CajaDiariaIngreso]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CajaDiariaIngreso]
(
 @idcaja int,
 @ingreso		money,
 @ingresoCheque money,
 @ingresoTarjeta money,
 @saldo			money
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_CajaDiaria]	
			        (
						  [fecha_movimiento] ,
						  [id_caja] ,
							[montoApertura_movimiento],
						  [ingreso_movimiento] ,
							[ingresoCheque_movimiento],
							[ingresoTarjeta_movimiento],
						  [saldo_movimiento] ,
						  [estado_movimiento]
			        )
			VALUES  (
						  GETDATE() , -- fecha_movimiento - datetime
						  @idCaja , -- id_caja - int
							0,
						  @ingreso , -- ingreso_movimiento - money
							@ingresoCheque,
							@ingresoTarjeta,
						  @saldo , -- saldo_movimiento - money
						  1  -- estado_movimiento - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CalculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CalculoPrecioVenta]
(
@descripcion NVARCHAR(MAX),
@precioCosto MONEY,
@envio	MONEY,
@ganaciaPromedio FLOAT,
@costoTotal MONEY,
@precioVenta	MONEY,
@precioSinIvaVenta MONEY,
@ivaCalculado MONEY,
@isrCalculado MONEY,
@isoCalculado MONEY,
@totalImpuesto MONEY,
@gananciaReal MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_calculoPrecioVenta]
			        ( [fecha_calculo] ,
			          [descripcion_calculo] ,
			          [precio_costo] ,
			          [envio_costo] ,
			          [ganacia_promedio] ,
			          [costo_total] ,
			          [precio_venta] ,
			          [precioSinIva_venta] ,
			          [iva_calculado] ,
			          [isr_calculado] ,
			          [iso_calculado] ,
			          [total_impuesto] ,
			          [ganancia_real]
			        )
			VALUES  ( GETDATE() , -- fecha_calculo - datetime
			          @descripcion, -- descripcion_calculo - nvarchar(max)
			          @precioCosto , -- precio_costo - money
			          @envio, -- envio_costo - money
			          @ganaciaPromedio, -- ganacia_promedio - float
			          @costoTotal , -- costo_total - money
			          @precioVenta , -- precio_venta - money
			          @precioSinIvaVenta , -- precioSinIva_venta - money
			          @ivaCalculado , -- iva_calculado - money
			          @isrCalculado , -- isr_calculado - money
			          @isoCalculado , -- iso_calculado - money
			          @totalImpuesto , -- total_impuesto - money
			          @gananciaReal  -- ganancia_real - money
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Categoria]
(
@id INT,
 @descripcion varchar(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_categoria
			        ( 
						id_categoria,
						descripcion_categoria )
			VALUES  ( 
						@id, --id categoria
						@descripcion  -- descripcion_categoria - nvarchar(max)
			          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Cliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Cliente]
(
@id INT,
@nit NVARCHAR(MAX),
@nombre NVARCHAR(MAX),
@idMunicipio int,
@direccion NVARCHAR(MAX),
@telefono1 NVARCHAR(20),
@telefono2 NVARCHAR(20),
@email NVARCHAR(MAX),
@notas TEXT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_cliente]
			        ( [id_cliente] ,
			          [nit_cliente] ,
			          [nombre_cliente] ,
			          [id_municipio] ,
			          [direccion_cliente] ,
			          [telefono1_cliente] ,
			          [telefono2_cliente] ,
			          [email_cliente] ,
			          [notas_cliente]
			        )
			VALUES  ( @id , -- id_cliente - int
			          @nit , -- nit_cliente - nvarchar(max)
			          @nombre , -- nombre_cliente - nvarchar(max)
			          @idMunicipio , -- id_municipio - int
			          @direccion , -- direccion_cliente - nvarchar(max)
			          @telefono1 , -- telefono1_cliente - nvarchar(20)
			          @telefono2 , -- telefono2_cliente - nvarchar(20)
			          @email , -- email_cliente - nvarchar(max)
			          @notas  -- notas_cliente - text
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Compra]
(
@id INT,
@fechaCompra DATETIME,
@idProveedor INT,
@idBodega INT,
@idFormaPago INT,
@documentoCompra NVARCHAR(MAX),
@totalCompra MONEY,
@notas TEXT,
@plazo INT,
@boleta NVARCHAR(MAX),
@deposito MONEY,
@diff MONEY,
@usuario nvarchar(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT	INTO	dbo.tbl_compra
			        ( id_compra ,
			          fecha_compra ,
			          id_proveedor ,
			          id_bodega ,
			          id_formaPago ,
			          documento_compra ,
			          total_compra ,
			          notas_compra ,
			          plazo_compra ,
			          boletaDeposito_compra ,
			          deposito_compra ,
			          diffDepoCompra_compra ,
			          usuario_compra
			        )
			VALUES  ( @id , -- id_compra - int
			          @fechaCompra , -- fecha_compra - datetime
			          @idProveedor , -- id_proveedor - int
			          @idBodega , -- id_bodega - int
			          @idFormaPago , -- id_formaPago - int
			          @documentoCompra , -- documento_compra - nvarchar(max)
			          @totalCompra , -- total_compra - money
			          @notas , -- notas_compra - text
			          @plazo , -- plazo_compra - int
			          @boleta , -- boletaDeposito_compra - int
			          @deposito , -- deposito_compra - money
			          @diff , -- diffDepoCompra_compra - money
			          @usuario  -- usuario_compra - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Conceptos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Conceptos]
(
@descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_conceptos]
			        ( [descripcion_concepto] )
			VALUES  ( @descripcion  -- descripcion_concepto - nvarchar(max)
			          )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_ControlCajaApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_ControlCajaApertura]
(
@id INT,
@fechaControl DATETIME,
@idCaja INT,
@control INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_ControlCajasApertura
			        ( id_control,
					  fecha_control ,
			          id_caja ,
			          control_control 
			        )
			VALUES  ( @id, --idcontrol - int
								@fechaControl , -- fecha_control - datetime
								@idCaja,  -- id_caja - int
			          @control
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CuentaPorCobrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CuentaPorCobrar]
(
@id INT,
@fecha DATETIME,
@fehcaV DATETIME,
@idCliente INT,
@idVentaRef INT,
@documento NVARCHAR(max),
@monto MONEY,
@plazo FLOAT,
@idInteres INT,
@cuotaProgramada MONEY,
@saldoProgramado MONEY,
@idInteresMora INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_cuentasPorCobrar]
			        ( [id_cuentacobro],
			          [fecha_cuentaCobro] ,
								[fechaVence_CuentaPorCobrar],
			          [id_cliente] ,
			          [id_ventaReferencia] ,
			          [documento_venta] ,
			          [monto_cuentaCobro] ,
			          [plazo_cuentaCobro] ,
			          [id_interes] ,
			          [cuotaProgramada] ,
			          [saldoProgramado] ,
			          [id_InteresMora] ,
			          [estado_cuentaCobro]
			        )
			VALUES  ( 
			          @id, --idcuentacobro - int
								@fecha , -- fecha_cuentaCobro - datetime
								@fehcaV,
			          @idCliente , -- id_cliente - int
			          @idVentaRef , -- id_ventaReferencia - int
			          @documento , -- documento_venta - varchar(max)
			          @monto , -- monto_cuentaCobro - money
			          @plazo , -- plazo_cuentaCobro - float
			          @idInteres , -- id_interes - int
			          @cuotaProgramada , -- cuotaProgramada - money
			          @saldoProgramado , -- saldoProgramado - money
			          @idInteresMora , -- id_InteresMora - float
			          1  -- estado_cuentaCobro - int
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_CuentaPorPagar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_CuentaPorPagar]
(
@id INT,
@fecha DATETIME,
@fechaVence DATETIME,
@idProveedor INT,
@documento NVARCHAR(max),
@monto MONEY,
@plazo FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_CuentaPorPagar
			        ( id_CuentaPorPagar ,
			          fecha_CuentaPorPagar ,
			          fechaVence_CuentaPorPagar ,
			          id_proveedor ,
			          documento_CuentaPorPagar ,
			          monto_CuentaPorPagar ,
			          plazo_CuentaPorPagar ,
			          saldo_CuentaPorPagar ,
			          estado_CuentaPorPagar
			        )
			VALUES  ( @id , -- id_CuentaPorPagar - int
			          @fecha , -- fecha_CuentaPorPagar - datetime
			          @fechaVence , -- fechaVence_CuentaPorPagar - datetime
			          @idProveedor , -- id_proveedor - int
			          @documento , -- documento_CuentaPorPagar - nvarchar(max)
			          @monto , -- monto_CuentaPorPagar - money
			          @plazo , -- plazo_CuentaPorPagar - float
			          0 , -- saldo_CuentaPorPagar - money
			          1  -- estado_CuentaPorPagar - int
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Departamento]
(
@id INT,
@descripcion VARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_departamento]
			        ( [id_departamento],[nombre_departamento] )
			VALUES  ( 
						@id,
						@descripcion  -- nombre_departamento - nvarchar(max)
			          )
			       
			        

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetalleCompra]
(
@idCompra INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@costo MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT
)

AS

	BEGIN TRY	
		BEGIN TRANSACTION
			INSERT INTO dbo.tbl_DetalleCompra
			        ( id_compra ,
			          id_producto ,
			          descripcion_producto ,
			          costo_producto ,
			          cantidad_producto ,
			          id_kardex ,
			          porcentajeIva_Producto ,
			          porcentajeDescuento_producto
			        )
			VALUES  ( @idCompra , -- id_compra - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @costo , -- costo_producto - money
			          @cantidad , -- cantidad_producto - float
			          @idKardex , -- id_kardex - int
			          @porcentajeIva , -- porcentajeIva_Producto - float
			          @porcentajeDescuento  -- porcentajeDescuento_producto - float
			        )
		COMMIT TRANSACTION
	End try
	
	Begin Catch
		ROLLBACK TRANSACTION
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[SP_Insertar_DetalleDevolucionCliente]
(
@idDevCliente INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@precio MONEY,
@cantidad FLOAT,
@idKardex INT,
@porcentajeIva FLOAT,
@porcentajeDescuento FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_DetalleDevolucionCliente]
			        ( [id_devolucionCliente] ,
			          [id_producto] ,
			          [descripcion_producto] ,
			          [precio_producto] ,
			          [cantidad_producto] ,
			          [id_kardex] ,
			          [porcentajeIva] ,
			          [porcentajeDescuento]
			        )
			VALUES  ( @idDevCliente , -- id_devolucionCliente - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @precio , -- precio_producto - float
			          @cantidad , -- cantidad_producto - float
			          @idKardex , -- id_kardex - int
			          @porcentajeIva , -- porcentajeIva - float
			          @porcentajeDescuento  -- porcentajeDescuento - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetalleInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetalleInventario]
(
@idInventario INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@stock FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_detalle_inventario]
			        ( [id_inventario] ,
			          [id_producto] ,
			          [descripcion_producto] ,
			          [stock_producto] ,
			          [conteo1_detalle]
			        )
			VALUES  ( @idInventario , -- id_inventario - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @stock , -- stock_producto - float
			          0  -- conteo1_detalle - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetallePagoCredito]
(
@idPagocre INT,
@idTabla INT,
@montoPagocre MONEY,
@moraPagocre MONEY,
@diasPagocre FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_DetallePagoCredito]
			        ( [id_pagocre] ,
			          [id_tabla] ,
			          [monto_pagocre] ,
			          [mora_pagocre] ,
			          [dias_pagocre]
			        )
			VALUES  ( @idPagocre , -- id_pagocre - int
			          @idTabla , -- id_tabla - int
			          @montoPagocre , -- monto_pagocre - money
			          @moraPagocre , -- mora_pagocre - money
			          @diasPagocre  -- dias_pagocre - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetallePagoCreditoContado]
(
@idPagocrecont INT,
@idCuentaCobro INT,
@montoPagocrecont MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_DetallePagoCreditoContado]
			        ( [id_pagocrecont] ,
			          [id_cuentaCobro] ,
			          [monto_pagocrecont]
			        )
			VALUES  ( @idPagocrecont , -- id_pagocrecont - int
			          @idCuentaCobro , -- id_cuentaCobro - int
			          @montoPagocrecont  -- monto_pagocrecont - money
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetallePedido]
(
@idPedido INT,
@idProducto INT,
@descripcionProducto NVARCHAR(MAX),
@precioProducto MONEY,
@cantidadPedido FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_detallePedido]
			        ( [id_pedido] ,
			          [id_producto] ,
			          [descripcion_producto] ,
			          [precio_producto] ,
			          [cantidad_pedido]
			        )
			VALUES  ( @idPedido , -- id_pedido - int
			          @idProducto , -- id_producto - int
			          @descripcionProducto , -- descripcion_producto - nvarchar(max)
			          @precioProducto , -- precio_producto - money
			          @cantidadPedido  -- cantidad_pedido - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetalleSalida]
(
@idSalida INT,
@idProducto INT,
@descripcion NVARCHAR(MAX),
@cantidad FLOAT,
@idKardex INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_DetalleSalida
			        ( id_salida ,
			          id_producto ,
			          descripcion_salida ,
			          cantidad_salida ,
			          id_kardex
			        )
			VALUES  ( @idSalida , -- id_salida - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_salida - nvarchar(max)
			          @cantidad , -- cantidad_salida - float
			          @idKardex  -- id_kardex - int
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_DetalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_DetalleTraslado]
(
 @idTraslado INT, 
 @idProducto INT, 
 @descripcion NVARCHAR(MAX),
 @cantidad FLOAT, 
 @idKardexOrigen INT, 
 @idKardexDestino INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_detalleTraslado
			        ( id_traslado ,
			          id_producto ,
			          descripcion_producto ,
			          cantidad_traslado ,
			          id_kardexOrigen ,
			          id_KardexDestino
			        )
			VALUES  ( @idTraslado , -- id_traslado - int
			          @idProducto , -- id_producto - int
			          @descripcion , -- descripcion_producto - nvarchar(max)
			          @cantidad , -- cantidad_traslado - float
			          @idKardexOrigen , -- id_kardexOrigen - int
			          @idKardexDestino  -- id_KardexDestino - int
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback TRANSACTION
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Empleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Empleado]
(
@id int OUTPUT,
@nombre NVARCHAR(MAX),
@apellido NVARCHAR(MAX),
@direccion NVARCHAR(MAX),
@telef1	NVARCHAR(MAX),
@telef2 NVARCHAR(MAX),
@fechanac DATETIME,
@idTemp	INT,
@usuario NVARCHAR(50),
@pass NVARCHAR(50),
@idRol INT,
@idCaja INT,
@idMuni INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].tbl_empleado
			        ( 
								fechain_empleado ,
			          nombre_empleado ,
			          apellido_empleado ,
			          direccion_empleado ,
			          telefeono1_empleado ,
			          telefono2_empleado ,
			          fechanac_empleado ,
			          id_templeado ,
			          usuario_empleado ,
			          contrasena_empleado ,
			          id_rol ,
			          id_caja ,
			          id_municipio ,
			          estado_empleado
			        )
			VALUES  ( 
			          GETDATE() , -- fechain_empleado - datetime
			          @nombre , -- nombre_empleado - nvarchar(max)
			          @apellido , -- apellido_empleado - nvarchar(max)
			          @direccion , -- direccion_empleado - nvarchar(max)
			          @telef1 , -- telefeono1_empleado - nvarchar(max)
			          @telef2 , -- telefono2_empleado - nvarchar(max)
			          @fechanac , -- fechanac_empleado - date
			          @idTemp , -- id_templeado - int
			          @usuario , -- usuario_empleado - nvarchar(50)
			          @pass , -- contrasena_empleado - nvarchar(50)
			          @idRol , -- id_rol - int
			          @idCaja , -- id_caja - int
			          @idMuni , -- id_municipio - int
			          1  -- estado_empleado - int
			        )

			select @id = @@identity

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_equipo]
(
 @idEquipo INT,
 @idModelo INT,
 @serie		NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_equipo]
			        ( [id_equipo] ,
			          [id_modelo] ,
			          [serie_equipo]
			        )
			VALUES  ( @idEquipo , -- id_equipo - int
			          @idModelo , -- id_modelo - int
			          @serie  -- serie_equipo - nvarchar(max)
			        )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Inventario]
(
@idInventario INT,
@fecha datetime, 
@idBodega INT,
@idSub1 INT,
@idSub2 INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_Inventario
			        ( id_inventario ,
			          fecha_inventario ,
			          id_bodega ,
			          id_SubCategoriaSource ,
			          id_SubCategoriaTarget ,
			          estado_categoria
			        )
			VALUES  ( @idInventario , -- id_inventario - int
			          @fecha , -- fecha_inventario - datetime
			          @idBodega , -- id_bodega - int
			          @idSub1, -- id_SubCategoriaSource - int
			          @idSub2 , -- id_SubCategoriaTarget - int
			          0  -- estado_categoria - int
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Kardex]
(
 @id INT OUTPUT,
 @idBodega INT, 
 @idProducto INT, 
 @fecha DATETIME, 
 @documento NVARCHAR(50),
 @entrada FLOAT, 
 @salida FLOAT, 
 @saldo FLOAT, 
 @ultimoCosto MONEY, 
 @costoPromedio MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_Kardex
			        (
					  id_bodega ,
			          id_producto ,
			          fecha_kardex ,
			          documento_kardex ,
			          entrada_kardex ,
			          salida_kardex ,
			          saldo_kardex ,
			          ultimoCosto_kardex ,
			          costoPromedio_kardex
			        )
			VALUES  ( 
			   		  @idBodega , -- id_bodega - int
			          @idProducto , -- id_producto - int
			          @fecha , -- fecha_kardex - datetime
			          @documento , -- documento_kardex - nvarchar(50)
			          @entrada , -- entrada_kardex - float
			          @salida , -- salida_kardex - float
			          @saldo , -- saldo_kardex - float
			          @ultimoCosto , -- ultimoCosto_kardex - money
			          @costoPromedio  -- costoPromedio_kardex - money
			        )

				SET @id = SCOPE_IDENTITY()
				SELECT @id

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_marca]
(
@id INT,
@nombre NVARCHAR(max)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO	dbo.tbl_marca
			        (id_marca, 
					nombre_marca )
			VALUES  (
					@id,
					@nombre  -- nombre_marca - nvarchar(max)
			          )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_marcaEquipos]
(
@idMarcaE INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_marcaEquipos]
			        ( [id_marcaE], [nombre_marcaE] )
			VALUES  ( @idMarcaE, -- id_marcaE - int
			          @nombre  -- nombre_marcaE - nvarchar(max)
			          )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_modelo]
(
@idModelo INT,
@nombre NVARCHAR(MAX),
@idMarcaE INT,
@idTequipo INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_modelo]
			        ( [id_modelo] ,
			          [nombre_modelo] ,
			          [id_marcaE] ,
			          [id_tequipo]
			        )
			VALUES  ( @idModelo , -- id_modelo - int
			          @nombre , -- nombre_modelo - nvarchar(max)
			          @idMarcaE , -- id_marcaE - int
			          @idTequipo  -- id_tequipo - int
			        )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_municipio]
(
@idMunicipio INT,	
@idDepartamento INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_municipio]
			        ( [id_municipio],
						[id_departamento] ,
			          [nombre_municipio]
			        )
			VALUES  ( @idMunicipio , -- id_departamento - int
					  @idDepartamento,
			          @nombre  -- nombre_municipio - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_PermisosRol]
(
 @id INT, 
 @idRol INT, 
 @formulario VARCHAR(MAX),
 @puedeVer BIT, 
 @puedeModificar BIT, 
 @puedeBorrar BIT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_PermisosRol
			        ( id_rol ,
			          formulario_permisos ,
			          puedeVer ,
			          puedeModificar ,
			          puedeBorrar
			        )
			VALUES  ( @id , -- id_rol - int
			          @formulario , -- formulario_persmisos - varchar(max)
			          @puedeVer , -- puedeVer - bit
			          @puedeModificar , -- puedeModificar - bit
			          @puedeBorrar  -- puedeBorrar - bit
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_PrecioCostoPorProductoByFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_PrecioCostoPorProductoByFecha]
(
@idProducto INT, 
@Costo MONEY, 
@referencia NVARCHAR(50)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO tbl_PrecioCostoPorProductoByFecha
			(
			fecha_PreCostoProducto,
			id_producto, 
			costo_producto,
			referencia_compra
			)
			VALUES
			(
			GETDATE(),
			@idProducto,
			@Costo,
			@referencia
			)

			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_producto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_producto]
(
@id INT,
@sku NVARCHAR(max),
@descrip NVARCHAR(max),
@idSubCate INT,
@idIva INT,
@notas TEXT,
@img NVARCHAR(max),
@idMarca INT,
@modelo NVARCHAR(max),
@idTProd int,
@costo Money
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_Producto
			        ( 
								id_producto ,
			          sku_producto ,
			          descripcion_producto ,
			          id_Sub_Categoria ,
			          id_iva ,
			          notas_producto ,
			          imagen_producto ,
			          id_marca ,
			          modelo_producto ,
			          id_tproducto,
								costo_producto
			        )
			VALUES  ( @id , -- id_producto - int
			          @sku , -- sku_producto - nvarchar(max)
			          @descrip, -- descripcion_producto - nvarchar(max)
			          @idSubCate , -- id_categoria - int
			          @idIva ,
			          @notas , -- notas_producto - text
			          @img , -- imagen_producto - nvarchar(max)
			          @idMarca , -- id_marca - int
			          @modelo , -- modelo_producto - nvarchar(max)
			          @idTProd,  -- id_tproducto - int
								@costo
			        )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_ProductUnidPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_ProductUnidPrecioVenta]
(
@id INT,
@idMedida INT,	
@precio MONEY,
@precioBase BIT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_ProductUnidPrecioVenta
			        ( id_producto ,
			          id_medida ,
			          precio ,
			          estado_prounidprecio,
								precioBase
			        )
			VALUES  ( @id , -- id_producto - int
			          @idMedida , -- id_medida - int
			          @precio , -- precio - money
			          1,  -- estado_prounidprecio - bit
			          @precioBase
							)
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_ProvBancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_ProvBancos]
(
 @idProveedor INT, 
 @idBanco INT, 
 @cuenta NVARCHAR(MAX),
 @nombre NVARCHAR(MAX),
 @descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT	INTO dbo.tbl_provbancos
			        ( id_proveedor ,
			          id_banco ,
			          numero_cuenta ,
			          nombre_cuenta ,
			          descripcion_cuenta
			        )
			VALUES  ( @idProveedor , -- id_proveedor - int
			          @idBanco , -- id_banco - int
			          @cuenta , -- numero_cuenta - nvarchar(max)
			          @nombre , -- nombre_cuenta - nvarchar(max)
			          @descripcion  -- descripcion_cuenta - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Proveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Proveedor]
(
 @id int,
 @nombreJuridico NVARCHAR(MAX),
 @nombreComercial NVARCHAR(MAX),
 @direccion NVARCHAR(MAX),
 @telef1 NVARCHAR(50),
 @telef2 NVARCHAR(50),
 @corrreo NVARCHAR(50),
 @nit NVARCHAR(MAX),
 @idIva INT,
 @idMunicipio INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_proveedor
			        ( id_proveedor ,
			          nombreJuridico_proveedor ,
			          nombreComercial_proveedor ,
			          direccion_proveedor ,
			          telefono1_proveedor ,
			          telefono2_proveedor ,
			          correo_proveedor ,
			          nit_proveedor ,
			          id_iva ,
			          id_municipio
			        )
			VALUES  ( @id , -- id_proveedor - int
			          @nombreJuridico , -- nombrePro_proveedor - varchar(max)
			          @nombreComercial , -- nombreCom_proveedor - nvarchar(max)
			          @direccion , -- direccion_proveedor - nvarchar(max)
			          @telef1 , -- telefono1_proveedor - nvarchar(50)
			          @telef2 , -- telefono2_proveedor - nvarchar(50)
			          @corrreo , -- correo_proveedor - nvarchar(50)
			          @nit , -- nit_proveedor - nvarchar(max)
			          @idIva , -- id_iva - int
			          @idMunicipio -- id_municipio - int
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Reparacion]
(
@idReparacion INT,
@fechaReparacion DATETIME,
@idCliente INT,
@idEquipo INT,
@fallaReparacion TEXT,
@idTreparacion INT,
@costoReparacion MONEY,
@totalRepuestos MONEY,
@accesorios TEXT,
@idEmpleado INT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_reparacion]
			        ( [id_reparacion] ,
			          [fecha_reparacion] ,
			          [id_cliente] ,
			          [id_equipo] ,
			          [falla_reparacion] ,
			          [informe_reparacion] ,
			          [id_treparacion] ,
			          [costo_reparacion] ,
			          [total_repuestos] ,
			          [terminada_reparacion] ,
			          [accesorios_reparacion] ,
			          [id_empleado]
			        )
			VALUES  ( @idReparacion , -- id_reparacion - int
			          @fechaReparacion , -- fecha_reparacion - datetime
			          @idCliente , -- id_cliente - int
			          @idEquipo , -- id_equipo - int
			          @fallaReparacion , -- falla_reparacion - text
			          '' , -- informe_reparacion - text
			          @idTreparacion , -- id_treparacion - int
			          @costoReparacion , -- costo_reparacion - money
			          @totalRepuestos , -- total_repuestos - int
			          0 , -- terminada_reparacion - int
			          @accesorios , -- accesorios_reparacion - text
			          @idEmpleado  -- id_empleado - int
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_reparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_reparacionRepuestosLevel1]
(
@idReparacion INT,
@idPedido INT,	
@cantidad FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].tbl_reparacionRepuestosLevel1
			        ( id_reparacion ,
			          id_pedido ,
			          cantidad_reparacionRepuesto
			        )
			VALUES  ( @idReparacion , -- id_reparacion - int
			          @idPedido , -- id_pedido - int
			          @cantidad  -- cantidad_reparacionRepuesto - float
			        )
			  
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Rol]
(
@id INT, 
@descripcion VARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_rol
			        ( id_rol, descripcion_rol )
			VALUES  ( @id, -- id_rol - int
			          @descripcion  -- descripcion_rol - varchar(max)
			          )
			        
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_SerieProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_SerieProducto]
(
@id INT,
@numero NVARCHAR(max),
@cantidad FLOAT,
@fechaVC DATETIME,
@fechaVV DATETIME
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_SerieProducto
			        ( id_producto ,
			          numero_serie ,
			          disponible_serie ,
			          cantidad_serie,
					  fechaVenceCompra_serie,
					  fechaVenceVenta_serie

			        )
			VALUES  ( @id , -- id_producto - int
			          @numero , -- numero_serie - varchar(max)
			          1 , -- disponible_serie - bit
			          @cantidad,  -- cantidad_serie - float
					  @fechaVC,
					  @fechaVV
			        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_tequipo]
(
@idTequipo INT,
@nombre NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO [dbo].[tbl_tequipo]
			        ( [id_tequipo], [nombre_tequipo] )
			VALUES  ( @idTequipo, -- id_tequipo - int
			          @nombre  -- nombre_tequipo - nvarchar(max)
			          )
			       
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_TipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_TipoEmpleado]
(
 @descripcion varchar(max),
 @id int
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_tipoEmpleado
			        ( id_templeado,
					  descripcion_templeado )
			VALUES  ( 
						@id,
						@descripcion  -- descripcion_templeado - nvarchar(max)
			          )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_TipoProducto]
(
 @id INT, 
 @descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_TipoProducto
			        ( id_tproducto ,
			          descripcion_tproducto
			        )
			VALUES  ( @id , -- id_tproducto - int
			          @descripcion  -- descripcion_tproducto - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_TipoReparacion]
(
 @id INT,
 @nombre NVARCHAR(MAX),
 @monto MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_TipoReparacion
			        ( id_treparacion ,
			          nombre_treparacion ,
			          monto_treparacion
			        )
			VALUES  ( @id , -- id_treparacion - int
			          @nombre , -- nombre_treparacion - nvarchar(max)
			          @monto  -- monto_treparacion - money
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_Traslado]
(
 @id INT, 
 @fecha DATETIME, 
 @idBodegaOrigen INT, 
 @idBodegaDestino INT, 
 @Descripcion NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_traslado
			        ( id_traslado ,
			          fecha_traslado ,
			          id_bodegaOrigen ,
			          id_bodegaDestino ,
			          descripcion_traslado
			        )
			VALUES  ( @id , -- id_traslado - int
			          @fecha , -- fecha_traslado - datetime
			          @idBodegaOrigen , -- id_bodegaOrigen - int
			          @idBodegaDestino , -- id_bodegaDestino - int
			          @Descripcion  -- descripcion_traslado - nvarchar(max)
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_treparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_treparacion]
(
@idTreparacion INT,
@nombre NVARCHAR(MAX),
@monto MONEY
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_TipoReparacion
			        ( id_treparacion ,
			          nombre_treparacion,
					  monto_treparacion
			        )
			VALUES  ( @idTreparacion , -- id_treparacion - int
			          @nombre,  -- nombre_treparacion - nvarchar(max)
					  @monto
			        )
			       
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insertar_UnidadMedida]
(
 @id INT,
 @descrip NCHAR(10),
 @cant FLOAT
)

AS

	Begin Try
		Begin Transaction
			INSERT INTO dbo.tbl_UnidadMedida
			        ( id_medida ,
			          descripcion_medida ,
			          cantidad_medida
			        )
			VALUES  ( @id , -- id_medida - int
			          @descrip , -- descripcion_medida - nchar(10)
			          @cant  -- cantidad_medida - float
			        )

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Instalar_Salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Instalar_Salida]
(
 @id INT, 
 @fecha DATETIME, 
 @idConcepto INT, 
 @idBodega INT
)

AS

	Begin Try
		Begin Transaction
		INSERT INTO dbo.tbl_salida
		        ( id_salida ,
		          fecha_salida ,
		          id_concepto ,
		          id_bodega
		        )
		VALUES  ( @id , -- id_salida - int
		          @fecha , -- fecha_salida - datetime
		          @idConcepto , -- id_concepto - int
		          @idBodega  -- id_bodega - int
		        )
		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Banco]

@criterio varchar(50)
AS
	Begin
		SELECT id_banco, descripcion_banco
		 FROM tbl_banco
		  WHERE id_banco = @criterio
			ORDER BY descripcion_banco
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BancoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BancoCodigo]
AS
	SELECT id_banco FROM tbl_banco
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Barra]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, barra 
		 FROM tbl_barra
		  WHERE id_producto = @criterio
			ORDER BY id_producto
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Bitaora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Bitaora]
(
@criterio VARCHAR(50)
)

AS

	Begin
		SELECT id_bitacora, fecha_bitacora,hora_bitacora, usuario, accion_bitacora
		FROM tbl_bitacora	
		WHERE usuario = @criterio
		ORDER BY fecha_bitacora ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Bodega]

@criterio varchar(50)
AS
	Begin
		SELECT id_bodega,nombre_bodega
		 FROM tbl_bodega
		  WHERE id_bodega = @criterio
			ORDER BY  nombre_bodega
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaCodigo]

AS
SELECT id_bodega FROM dbo.tbl_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoByIDBodegaAndBarra]

@criterio1 int,
@criterio2 BIGINT
AS
	Begin
		SELECT dbo.tbl_bodegaProducto.id_bodega,dbo.tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN dbo.tbl_barra ON dbo.tbl_barra.id_producto = dbo.tbl_bodegaProducto.id_producto
		  WHERE id_bodega = @criterio1 and dbo.tbl_barra.barra = @criterio2
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat]
@id_bodega INT,
@idSubCat INT
AS
	Begin

SELECT	BP.id_bodega,
				B.nombre_bodega,	
				BP.id_producto,	
				P.descripcion_producto,
			BP.stock_producto
	FROM	dbo.tbl_bodegaProducto BP
	LEFT JOIN tbl_Producto P 
		ON BP.id_producto = P.id_producto
	LEFT JOIN dbo.tbl_Sub_Categoria SC 
		ON P.id_Sub_Categoria = SC.id_subcategoria
	LEFT JOIN dbo.tbl_bodega B
		ON BP.id_bodega = B.id_bodega
	WHERE ((@id_bodega IS NULL) OR (BP.id_bodega = @id_bodega))
	AND ((@idSubCat IS NULL) OR (P.id_Sub_Categoria = @idSubCat))
	ORDER BY p.descripcion_producto
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndIDProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoByIDBodegaAndIDProducto]

@criterio1 int,
@criterio2 int
AS
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = @criterio1 and id_producto = @criterio2
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndSKU]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoByIDBodegaAndSKU]

@criterio1 int,
@criterio2 nvarchar(max)
AS
	Begin
		SELECT dbo.tbl_bodegaProducto.id_bodega,dbo.tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN dbo.tbl_Producto ON dbo.tbl_Producto.id_producto = dbo.tbl_bodegaProducto.id_producto
		  WHERE id_bodega = @criterio1 and dbo.tbl_Producto.sku_producto = @criterio2
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoIdBodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoIdBodega]

@criterio varchar(50)
AS
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoIdProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoIdProducto]

@criterio varchar(50)
AS
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoIdProductoJoin]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoIdProductoJoin]

@criterio varchar(50)
AS
	Begin
		SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
		WHERE bp.id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_BodegaProductoInventarioByIdBodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_BodegaProductoInventarioByIdBodega]

@criterio varchar(50)
AS
	Begin
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto,p.id_tproducto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		WHERE bp.id_bodega = @criterio AND p.id_tproducto <> 4
		ORDER BY P.id_producto ASC
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CajaDiaria]

@criterio varchar(50)
AS
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM dbo.tbl_CajaDiaria
		  WHERE id_caja = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CajaDiariaByIDCajaANDFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CajaDiariaByIDCajaANDFecha]

@criterio varchar(50),
@desde DATE,
@hasta DATE
AS
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,ingresoCheque_movimiento,
	  ingresoTarjeta_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM dbo.tbl_CajaDiaria
			WHERE CAST(CONVERT(CHAR(8), fecha_movimiento,112) AS INT)
			BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
			AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
		  AND id_caja = @criterio 
			AND estado_movimiento = 1
			AND fecha_movimiento = (SELECT MAX(fecha_movimiento)
																FROM tbl_CajaDiaria
																WHERE CAST(CONVERT(CHAR(8), fecha_movimiento,112) AS INT)
																BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
																AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
																AND id_caja = @criterio
															)
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CajaDiariaByIDCajaANDFechaPrimero]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CajaDiariaByIDCajaANDFechaPrimero]

@criterio varchar(50),
@desde DATE,
@hasta DATE
AS
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,ingresoCheque_movimiento,
	  ingresoTarjeta_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM dbo.tbl_CajaDiaria
			WHERE CAST(CONVERT(CHAR(8), fecha_movimiento,112) AS INT)
			BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
			AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
		  AND id_caja = @criterio 
			AND estado_movimiento = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CajaDiariaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CajaDiariaCodigo]
AS
	Begin
		SELECT id_movimiento
		 FROM dbo.tbl_CajaDiaria
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Cajas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Cajas]

@criterio varchar(50)
AS
	Begin
		SELECT id_caja,descripcion_caja
		 FROM dbo.tbl_cajas
		  WHERE id_caja = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CajasCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CajasCodigo]

AS
	Begin
		SELECT id_caja
		 FROM dbo.tbl_cajas
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CalculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CalculoPrecioVenta]

@criterio varchar(50)
AS
	Begin
		SELECT id_calculo,fecha_calculo,descripcion_calculo,
			   precio_costo,envio_costo,ganacia_promedio,costo_total,
			   precio_venta, precioSinIva_venta,iva_calculado,isr_calculado,
			   iso_calculado,total_impuesto,ganancia_real
		 FROM dbo.tbl_calculoPrecioVenta
		  WHERE id_calculo = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Categoria]

@criterio varchar(50)
AS
	Begin
		SELECT id_categoria,descripcion_categoria
		 FROM dbo.tbl_categoria
		  WHERE id_categoria = @criterio
		ORDER BY descripcion_categoria
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CategoriaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CategoriaCodigo]

AS
	Begin
		SELECT id_categoria
		 FROM dbo.tbl_categoria
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Cliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Cliente]

@criterio varchar(50)
AS
	Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM dbo.tbl_cliente
		  WHERE id_cliente = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ClienteByNit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ClienteByNit]

@criterio varchar(50)
AS
	Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM dbo.tbl_cliente
		  WHERE nit_cliente = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ClienteCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ClienteCodigo]
AS
	SELECT id_cliente FROM dbo.tbl_cliente
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Compra]

@criterio varchar(50)
AS
	Begin
		SELECT id_compra,fecha_compra,id_proveedor,id_bodega,
				id_formaPago,documento_compra,total_compra, 
				notas_compra, plazo_compra, boletaDeposito_compra,
				deposito_compra, diffDepoCompra_compra, usuario_compra

		 FROM dbo.tbl_compra
		  WHERE documento_compra = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CompraCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CompraCodigo]
AS
	SELECT id_compra FROM dbo.tbl_compra
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Conceptos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Conceptos]

@criterio varchar(50)
AS
	Begin
		SELECT id_concepto,descripcion_concepto
		 FROM dbo.tbl_conceptos
		  WHERE id_concepto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlArqueo]

@criterio varchar(50)
AS
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM dbo.tbl_ControlArqueo
		  WHERE id_control = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlArqueoCierre]

@criterio varchar(50)
AS
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM dbo.tbl_ControlArqueoCierre
		  WHERE id_control = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlArqueoCierreCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlArqueoCierreCodigo]

AS
	Begin
		SELECT id_control
		 FROM dbo.tbl_ControlArqueoCierre
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlArqueoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlArqueoCodigo]

AS
	Begin
		SELECT id_control
		 FROM dbo.tbl_ControlArqueo
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlCajaApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlCajaApertura]

@criterio varchar(50)
AS
	Begin
		SELECT id_control,fecha_control,id_caja,control_control

		 FROM dbo.tbl_ControlCajasApertura
		  WHERE id_caja = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ControlCajaAperturaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ControlCajaAperturaCodigo]

AS
	Begin
		SELECT id_control
		 FROM dbo.tbl_ControlCajasApertura
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorCobrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorCobrar]

@criterio varchar(50)
AS
	Begin
		SELECT id_cuentaCobro,fecha_cuentaCobro,fechaVence_CuentaPorCobrar,
					id_cliente,id_ventaReferencia,documento_venta,monto_cuentaCobro,
					plazo_cuentaCobro,id_interes,cuotaProgramada,saldoProgramado,
					id_InteresMora,estado_cuentaCobro

		 FROM dbo.tbl_cuentasPorCobrar
		  WHERE id_cliente = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha]

@criterio varchar(50)
AS
	Begin
		SELECT id_cuentaCobro,fecha_cuentaCobro,fechaVence_CuentaPorCobrar,
					id_cliente,id_ventaReferencia,documento_venta,monto_cuentaCobro,
					plazo_cuentaCobro,id_interes,cuotaProgramada,saldoProgramado,
					id_InteresMora,estado_cuentaCobro

		 FROM dbo.tbl_cuentasPorCobrar
		  WHERE id_cuentaCobro = @criterio
			AND estado_cuentaCobro = 1 
			AND fecha_cuentaCobro = (SELECT MAX(fechaVence_CuentaPorCobrar) from tbl_cuentasPorCobrar WHERE id_cuentaCobro = @criterio)
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorCobrarCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorCobrarCodigo]

AS
	Begin
		SELECT id_cuentaCobro
		 FROM dbo.tbl_cuentasPorCobrar
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorPagar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorPagar]

@criterio varchar(50)
AS
	Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM dbo.tbl_CuentaPorPagar
		  WHERE id_CuentaPorPagar = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorPagarByIDProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorPagarByIDProveedor]

@criterio varchar(50)
AS
	Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM dbo.tbl_CuentaPorPagar
		  WHERE id_proveedor = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CuentaPorPagarCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_CuentaPorPagarCodigo]

AS
	Begin
		SELECT id_CuentaPorPagar

		 FROM dbo.tbl_CuentaPorPagar
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Departamento]

@criterio varchar(50)
AS
	Begin
		SELECT id_departamento, nombre_departamento
		 FROM dbo.tbl_departamento
		  WHERE id_departamento = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_departamentoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_departamentoCodigo]

AS

		SELECT id_departamento
		 FROM dbo.tbl_departamento
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleCompra]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_compra,id_producto,descripcion_producto,
		       costo_producto,cantidad_producto,id_kardex,porcentajeIva_Producto,
			   porcentajeDescuento_producto
		 FROM dbo.tbl_DetalleCompra
		  WHERE id_compra = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[SP_Listar_DetalleDevolucionCliente]

@criterio varchar(50)
AS
	Begin
		SELECT id_liena,id_devolucionCliente,id_producto,
		       descripcion_producto,precio_producto,cantidad_producto,
			   id_kardex,porcentajeIva, porcentajeDescuento
		 FROM dbo.tbl_DetalleDevolucionCliente
		  WHERE id_devolucionCliente = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleInventario]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_inventario,id_producto,descripcion_producto,stock_producto,conteo1_detalle

		 FROM dbo.tbl_detalle_inventario
		  WHERE id_inventario = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleKit]

@criterio varchar(50)
AS
	Begin
		SELECT id_kit,id_producto,descripcion_producto,cantidad_detalleKit,precio_producto,numero_serie
		 FROM dbo.tbl_DetalleKit
		  WHERE id_kit = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetallePagoCredito]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_pagocre,id_tabla,monto_pagocre,mora_pagocre,dias_pagocre
		 FROM dbo.tbl_DetallePagoCredito
		  WHERE id_pagocre = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[SP_Listar_DetallePagoCreditoContado]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea, id_pagocrecont,id_cuentaCobro,monto_pagocrecont
		 FROM dbo.tbl_DetallePagoCreditoContado
		  WHERE id_pagocrecont = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_detallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_detallePedido]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_pedido,id_producto,descripcion_producto,precio_producto,cantidad_pedido
		 FROM dbo.tbl_detallePedido
		  WHERE id_pedido = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleSalida]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_salida,id_producto,descripcion_salida,
		       cantidad_salida,id_kardex
		 FROM dbo.tbl_DetalleSalida
		  WHERE id_salida = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleTraslado]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea, id_traslado, id_producto, descripcion_producto, cantidad_traslado, id_kardexOrigen, id_KardexDestino
		 FROM tbl_detalleTraslado
		  WHERE id_traslado = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DetalleVenta]

@criterio varchar(50)
AS
	Begin
		SELECT id_linea,id_venta,id_producto,descripcion_producto,
		       precio_producto,cantidad_producto,id_kardex,porcentajeIva,
			   porcentajeDescuento, numeroSerie, fechaGarantia,descripcion_medida
		 FROM dbo.tbl_DetalleVenta
		  WHERE id_venta = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Documentos]

@criterio varchar(50)
AS
	Begin
		SELECT *
		 FROM dbo.tbl_Documentos
		  WHERE id_documento = @criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DocumentosByFactura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DocumentosByFactura]

@criterio varchar(50)
AS
	Begin
		SELECT *
		 FROM dbo.tbl_Documentos
		  WHERE id_documento = @criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_DocumentosCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_DocumentosCodigo]

AS
	Begin
		SELECT id_documento
		 FROM dbo.tbl_Documentos
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_equipo]

@criterio varchar(50)
AS
	Begin
		SELECT id_equipo,id_modelo, serie_equipo
		 FROM dbo.tbl_equipo
		  WHERE id_equipo = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_equipoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_equipoCodigo]

AS

		SELECT id_equipo
		 FROM dbo.tbl_equipo
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_equipoSerie]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_equipoSerie]

@criterio varchar(50)
AS
	Begin
		SELECT id_equipo,id_modelo, serie_equipo
		 FROM dbo.tbl_equipo
		  WHERE serie_equipo = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_FacturasComprasCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_FacturasComprasCodigo]

AS
	Begin
		SELECT id_facturacompra
		 FROM dbo.tbl_FacturasCompras
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_FacturasComrpas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_FacturasComrpas]

@criterio varchar(50)
AS
	Begin
		SELECT id_facturacompra, fecha_facturacompra, id_compra,
		documento_facturacompra, monto_facturacompra, iva_facturacompra, 
		isr_facturacompra, iso_facturacompra, estado_facturacompra
		 FROM dbo.tbl_FacturasCompras
		  WHERE id_compra = @criterio AND estado_facturacompra = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_FacturasVentas]

@criterio varchar(50)
AS
	Begin
		SELECT id_facturaventa, fecha_facturaventa, id_venta,
		documento_facturaventa, monto_facturaventa, iva_facturaventa, 
		isr_facturaventa, iso_facturaventa, estado_facturaventa
		 FROM dbo.tbl_FacturasVentas
		  WHERE id_venta = @criterio AND estado_facturaventa = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_FacturasVentasCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_FacturasVentasCodigo]

AS
	Begin
		SELECT id_facturaventa
		 FROM dbo.tbl_FacturasVentas
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_FormaPago]

@criterio varchar(50)
AS
	Begin
		SELECT id_formaPago,descripcion_formaPago
		 FROM dbo.tbl_FormaPago
		  WHERE id_formaPago = @criterio
		ORDER BY descripcion_formaPago
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Inventario]

@criterio varchar(50)
AS
	Begin
		SELECT id_inventario, fecha_inventario, id_bodega, id_SubCategoriaSource, id_SubCategoriaTarget,estado_categoria
		 FROM dbo.tbl_Inventario
		  WHERE id_inventario = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_InventarioCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_InventarioCodigo]
AS
	Begin
		SELECT id_inventario
			FROM dbo.tbl_Inventario
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Iva]

@criterio varchar(50)
AS
	Begin
		SELECT id_iva, descripcion_iva, tarifa_iva
		 FROM tbl_iva
		  WHERE id_iva = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_IvaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_IvaCodigo]
AS
	Begin
		SELECT id_iva
		 FROM tbl_iva
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Kardex]

@criterio varchar(50)
AS
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_KardexByIDProductoANDByIDBodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_KardexByIDProductoANDByIDBodega]

@criterio1 varchar(50),
@criterio2 varchar(50)
AS
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = @criterio1 and id_bodega = @criterio2 ORDER BY fecha_kardex
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_KardexCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_KardexCodigo]
AS
	Begin
		SELECT id_kardex
		 FROM tbl_Kardex
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Kit]

@criterio varchar(50)
AS
	Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		FROM dbo.tbl_kit
		  WHERE id_producto = @criterio and estado_kit = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_KitCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_KitCodigo]

AS
	Begin
		SELECT id_kit
		FROM dbo.tbl_kit
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_LogUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_LogUsuarios]

@criterio varchar(50)
AS
	Begin
		SELECT id_log,usuario_empleado,log,ipLocal,fecha_log
		 FROM dbo.tbl_LogUusarios
		  WHERE usuario_empleado = @criterio
			AND log = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_LogUsuariosCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_LogUsuariosCodigo]
AS
	SELECT id_log FROM dbo.tbl_LogUusarios
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_marca]

@criterio varchar(50)
AS
	Begin
		SELECT id_marca, nombre_marca
		 FROM dbo.tbl_marca
		  WHERE id_marca = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_marcaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_marcaCodigo]

AS
	Begin
		SELECT id_marca
		 FROM dbo.tbl_marca

	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_marcaEquipos]

@criterio varchar(50)
AS
	Begin
		SELECT id_marcaE,nombre_marcaE
		 FROM dbo.tbl_marcaEquipos
		  WHERE id_marcaE = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_marcaEquiposCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_marcaEquiposCodigo]

AS

		SELECT id_marcaE
		 FROM dbo.tbl_marcaEquipos
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_modelo]

@criterio varchar(50)
AS
	Begin
		SELECT id_modelo,nombre_modelo,id_marcaE,id_tequipo
		 FROM dbo.tbl_modelo
		  WHERE id_modelo = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_modeloCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_modeloCodigo]

AS

	SELECT id_modelo
		 FROM dbo.tbl_modelo
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_MovimientoCuentaCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_MovimientoCuentaCliente]
@criterio VARCHAR(50)
AS
	Begin
		SELECT id_movimiento, fecha_movimiento, id_cliente, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM dbo.tbl_MovimientoCuentaClientes
		 WHERE id_cliente = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_MovimientoCuentaProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_MovimientoCuentaProveedor]
@criterio VARCHAR(50)
AS
	Begin
		SELECT id_movimiento, fecha_movimiento, id_proveedor, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM dbo.tbl_MovimientoCuentaProveedores
		 WHERE id_proveedor = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_MovimientoCuentaProveedorCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_MovimientoCuentaProveedorCodigo]

AS
	Begin
		SELECT id_movimiento
		 FROM dbo.tbl_MovimientoCuentaProveedores
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_municipio]

@criterio varchar(50)
AS
	Begin
		SELECT id_municipio,id_departamento,nombre_municipio
		 FROM dbo.tbl_municipio
		  WHERE id_municipio = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_municipioCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_municipioCodigo]

AS

		SELECT id_municipio
		 FROM dbo.tbl_municipio
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PermisosRol]

@criterio varchar(50)
AS
	Begin
		SELECT id_permisos, id_rol, formulario_permisos, puedeVer, puedeModificar, puedeBorrar
		 FROM dbo.tbl_PermisosRol
		  WHERE id_permisos = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PermisosRolCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PermisosRolCodigo]

AS
	Begin
		SELECT id_permisos
		 FROM dbo.tbl_PermisosRol
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PermisosRolPuedeBorrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PermisosRolPuedeBorrar]

@criterio varchar(50),
@criterio1 VARCHAR(50)
AS
	Begin
		SELECT 1 
		FROM dbo.tbl_PermisosRol 
	WHERE id_rol = @criterio 
		AND formulario_permisos = @criterio1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PermisosRolPuedeModificar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PermisosRolPuedeModificar]

@criterio varchar(50),
@criterio1 VARCHAR(50)
AS
	Begin
		SELECT 1 
		FROM dbo.tbl_PermisosRol 
		WHERE id_rol = @criterio 
		AND formulario_permisos = @criterio1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PermisosRolPuedeVer]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PermisosRolPuedeVer]

@criterio varchar(50),
@criterio1 VARCHAR(50)
AS
	Begin
		SELECT puedeVer
		FROM dbo.tbl_PermisosRol 
		WHERE id_rol = @criterio 
		AND formulario_permisos = @criterio1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_PrecioCostoPorProductoByFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_PrecioCostoPorProductoByFecha]

@criterio varchar(50)
AS
	Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Producto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Producto]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM dbo.tbl_producto
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoBarra]

@criterio nvarchar(max)
AS
	Begin
		SELECT b.id_producto, p.sku_producto, p.descripcion_producto, p.id_Sub_Categoria, 
		p.id_iva,p.notas_producto, p.imagen_producto, p.id_marca, p.modelo_producto, p.id_tproducto,p.costo_producto
		 FROM dbo.tbl_barra b
			INNER JOIN tbl_Producto p on b.id_producto = p.id_producto
		  WHERE b.barra = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoByID]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoByID]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM dbo.tbl_producto
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoBySku]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoBySku]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM dbo.tbl_producto
		  WHERE sku_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoCodigo]
AS
		SELECT id_producto
		 FROM dbo.tbl_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Productos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Productos]

@criterio varchar(50)
AS
	Begin
			SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto, p.imagen_producto, 
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto,p.costo_producto
		FROM dbo.tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
		  WHERE p.id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoSKU]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoSKU]

@criterio nvarchar(max)
AS
	Begin
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, id_iva, notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		FROM tbl_Producto
		WHERE sku_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductoWhereTProductKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductoWhereTProductKit]

@criterio varchar(50)

AS
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, imagen_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM dbo.tbl_producto
		  WHERE id_producto = @criterio AND id_tproducto = 4
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductUnidPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductUnidPrecioVenta]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, id_medida, precio, estado_prounidprecio
		 FROM dbo.tbl_ProductUnidPrecioVenta
		  WHERE id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductUnidPrecioVentaJoing]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductUnidPrecioVentaJoing]

@criterio varchar(50)
AS
	Begin
SELECT
dbo.tbl_ProductUnidPrecioVenta.id_producto,
dbo.tbl_ProductUnidPrecioVenta.id_medida,
dbo.tbl_UnidadMedida.descripcion_medida,
dbo.tbl_ProductUnidPrecioVenta.precio,
dbo.tbl_ProductUnidPrecioVenta.estado_prounidprecio,
dbo.tbl_ProductUnidPrecioVenta.precioBase

FROM
dbo.tbl_ProductUnidPrecioVenta
INNER JOIN dbo.tbl_UnidadMedida ON dbo.tbl_ProductUnidPrecioVenta.id_medida = dbo.tbl_UnidadMedida.id_medida
WHERE
dbo.tbl_ProductUnidPrecioVenta.id_producto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProductUnidPrecioVentaParaVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProductUnidPrecioVentaParaVenta]

@criterio1 varchar(50),
@criterio2 varchar(50)

AS
	Begin
SELECT
dbo.tbl_ProductUnidPrecioVenta.id_producto,
dbo.tbl_ProductUnidPrecioVenta.id_medida,
dbo.tbl_UnidadMedida.descripcion_medida,
dbo.tbl_ProductUnidPrecioVenta.precio,
dbo.tbl_ProductUnidPrecioVenta.estado_prounidprecio,
dbo.tbl_ProductUnidPrecioVenta.precioBase

FROM
dbo.tbl_ProductUnidPrecioVenta
INNER JOIN dbo.tbl_UnidadMedida ON dbo.tbl_ProductUnidPrecioVenta.id_medida = dbo.tbl_UnidadMedida.id_medida
WHERE
dbo.tbl_ProductUnidPrecioVenta.id_producto = @criterio1 AND
dbo.tbl_ProductUnidPrecioVenta.id_medida = @criterio2
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_proforma]

AS
	Begin
		SELECT *
		 FROM tbl_proforma
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProformaByVigentes]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProformaByVigentes]

@FECHA DATE
AS
	Begin
		SELECT *
		 FROM tbl_proforma
		  WHERE fecha_proforma < @FECHA and estado_proforma = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_proformaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_proformaCodigo]

AS
	Begin
		SELECT id_proforma
		 FROM tbl_proforma
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProvBancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProvBancos]

@criterio varchar(50)
AS
	Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM dbo.tbl_provbancos
		  WHERE id_proveedor = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProvBancosByIDBanco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProvBancosByIDBanco]

@criterio varchar(50)
AS
	Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM dbo.tbl_provbancos
		  WHERE id_banco = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProvBancosCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProvBancosCodigo]

AS
	Begin
		SELECT id_proveedor
		 FROM dbo.tbl_provbancos
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Proveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Proveedor]

@criterio varchar(50)
AS
	Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM dbo.tbl_proveedor
		  WHERE id_proveedor = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProveedorCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProveedorCodigo]

AS
	Begin
		SELECT id_proveedor
		 FROM dbo.tbl_proveedor
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ProveedorNit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ProveedorNit]

@criterio varchar(50)
AS
	Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM dbo.tbl_proveedor
		  WHERE nit_proveedor = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Reparacion]

@criterio varchar(50)
AS
	Begin
		SELECT id_reparacion,fecha_reparacion,id_cliente,id_equipo,
		falla_reparacion,informe_reparacion,id_treparacion,costo_reparacion,
		total_repuestos,fechaEntrega_reparacion,terminada_reparacion,
		accesorios_reparacion,id_empleado
		 FROM dbo.tbl_reparacion
		  WHERE id_reparacion = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReparacionCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReparacionCodigo]

AS
	Begin
		SELECT id_reparacion
		 FROM dbo.tbl_reparacion
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_reparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_reparacionRepuestosLevel1]

@criterio varchar(50)
AS
	Begin
		SELECT id_reparacion, id_pedido,cantidad_reparacionRepuesto
		 FROM dbo.tbl_reparacionRepuestosLevel1
		  WHERE id_reparacion = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReparacionUnionClienteEspera]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReparacionUnionClienteEspera]


AS
	
	
		SELECT 
			R.id_reparacion,R.fecha_reparacion,R.id_cliente,c.nombre_cliente,
			R.id_equipo,q.serie_equipo,q.id_modelo,m.nombre_modelo,m.id_marcaE,
			a.nombre_marcaE,tt.nombre_tequipo,R.falla_reparacion,R.informe_reparacion,
			R.id_treparacion,T.nombre_treparacion,R.costo_reparacion,R.total_repuestos,
			R.fechaEntrega_reparacion,R.terminada_reparacion,
			R.accesorios_reparacion,R.id_empleado, e.nombre_empleado
		 FROM dbo.tbl_reparacion R
			INNER JOIN dbo.tbl_cliente C ON c.id_cliente = r.id_cliente
			INNER JOIN dbo.tbl_TipoReparacion t ON t.id_treparacion = r.id_treparacion
			INNER JOIN dbo.tbl_empleado e ON e.id_empleado = r.id_empleado
			INNER JOIN dbo.tbl_equipo q ON q.id_equipo = r.id_equipo
			INNER JOIN dbo.tbl_modelo m ON m.id_modelo = q.id_modelo
			INNER JOIN dbo.tbl_marcaEquipos a ON a.id_marcaE = m.id_marcaE
			INNER JOIN dbo.tbl_tequipo tt ON tt.id_tequipo = m.id_tequipo
		  WHERE R.terminada_reparacion = 0
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReparacionUnionClienteEsperaIDReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReparacionUnionClienteEsperaIDReparacion]

@criterio VARCHAR(50)
AS
	BEGIN
		SELECT 
			R.id_reparacion,R.fecha_reparacion,R.id_cliente,c.nombre_cliente,
			R.id_equipo,q.serie_equipo,q.id_modelo,m.nombre_modelo,m.id_marcaE,
			a.nombre_marcaE,tt.nombre_tequipo,R.falla_reparacion,R.informe_reparacion,
			R.id_treparacion,T.nombre_treparacion,R.costo_reparacion,R.total_repuestos,
			R.fechaEntrega_reparacion,R.terminada_reparacion,
			R.accesorios_reparacion,R.id_empleado, e.nombre_empleado
		 FROM dbo.tbl_reparacion R
			INNER JOIN dbo.tbl_cliente C ON c.id_cliente = r.id_cliente
			INNER JOIN dbo.tbl_TipoReparacion t ON t.id_treparacion = r.id_treparacion
			INNER JOIN dbo.tbl_empleado e ON e.id_empleado = r.id_empleado
			INNER JOIN dbo.tbl_equipo q ON q.id_equipo = r.id_equipo
			INNER JOIN dbo.tbl_modelo m ON m.id_modelo = q.id_modelo
			INNER JOIN dbo.tbl_marcaEquipos a ON a.id_marcaE = m.id_marcaE
			INNER JOIN dbo.tbl_tequipo tt ON tt.id_tequipo = m.id_tequipo
		  WHERE (r.id_reparacion) LIKE '%'+@criterio+'%' AND
           R.terminada_reparacion = 0
		  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReporteDetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReporteDetalleVenta]

@criterio varchar(50)
AS
	Begin
			SELECT dv.id_linea, dv.id_venta, dv.id_producto, dv.descripcion_producto, 
			u.descripcion_medida,dv.cantidad_producto,dv.precio_producto
			FROM tbl_DetalleVenta dv
			INNER JOIN tbl_Producto p on dv.id_producto = p.id_producto
			INNER JOIN tbl_ProductUnidPrecioVenta pv on dv.id_producto = pv.id_producto
			INNER JOIN tbl_UnidadMedida u on pv.id_medida = u.id_medida
		  WHERE dv.id_venta = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReporteGarantiaSerieProductosByIDVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReporteGarantiaSerieProductosByIDVenta]

@criterio varchar(50)
AS
	Begin
		SELECT ps.id_producto,ps.id_serie, p.descripcion_producto,
ps.numero_serie, ps.fechaVenceVenta_serie, p.id_venta,
v.id_cliente, c.nombre_cliente, c.direccion_cliente,
v.fecha_venta, f.descripcion_formaPago, v.usuario_venta
FROM tbl_SerieProducto ps
LEFT JOIN tbl_DetalleVenta p on ps.id_producto = p.id_producto
LEFT JOIN tbl_venta v on p.id_venta = v.id_venta
LEFT JOIN tbl_cliente c on v.id_cliente = c.id_cliente
LEFT JOIN tbl_FormaPago f on v.id_formaPago = f.id_formaPago
WHERE v.id_venta = @criterio
		AND v.cobrado_venta = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ReporteVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ReporteVenta]

@criterio varchar(50)
AS
	Begin
		SELECT	v.id_venta, v.fecha_venta, v.id_cliente,
		c.nombre_cliente, c.direccion_cliente, c.nit_cliente,
		v.total_venta, v.documento, v.usuario_venta, v.cobrado_venta
		FROM tbl_venta v
		INNER JOIN tbl_cliente c ON v.id_cliente = c.id_cliente
		WHERE v.id_venta = @criterio
		AND v.cobrado_venta = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Rol]

@criterio varchar(50)
AS
	Begin
		SELECT id_rol, descripcion_rol
		 FROM tbl_rol
		  WHERE id_rol = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_RolCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_RolCodigo]

AS
	Begin
		SELECT id_producto
		 FROM tbl_barra
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Salida]

@criterio varchar(50)
AS
	Begin
		SELECT id_salida, fecha_salida, id_bodega,id_concepto
		 FROM tbl_salida
		  WHERE id_salida = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SalidaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SalidaCodigo]

AS
	Begin
		SELECT id_salida
		 FROM tbl_salida
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SerieProductoByIDNumSerie]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SerieProductoByIDNumSerie]

@criterio varchar(50)
AS
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie
		 FROM dbo.tbl_SerieProducto
		  WHERE numero_serie = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SerieProductoByIDProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SerieProductoByIDProducto]

@criterio varchar(50),
@criterio2 varchar(50)
AS
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM dbo.tbl_SerieProducto
		  WHERE id_producto = @criterio
			AND disponible_serie >= 1
			AND id_serie = @criterio2
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SerieProductoByIDProductoANDNSerie]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SerieProductoByIDProductoANDNSerie]

@criterio varchar(50),
@criterio2 NVARCHAR(MAX)
AS
	Begin
		SELECT id_kit, id_producto, numero_serie
		 FROM dbo.tbl_DetalleKit
		  WHERE id_producto = @criterio
			AND numero_serie = @criterio2
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SerieProductoByIDProductoANDSerie]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SerieProductoByIDProductoANDSerie]

@criterio varchar(50),
@criterio2 NVARCHAR(MAX)
AS
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM dbo.tbl_SerieProducto
		  WHERE id_producto = @criterio
			AND disponible_serie > = 1
			AND numero_serie = @criterio2
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SubCategoria]

@criterio varchar(50)
AS
	Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM dbo.tbl_Sub_Categoria
		  WHERE id_subcategoria = @criterio
		ORDER BY descripcion_subcategoria
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SubCategoriaByIDCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SubCategoriaByIDCategoria]

@criterio varchar(50)
AS
	Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM dbo.tbl_Sub_Categoria
		  WHERE id_categoria = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SubCategoriaByIDSubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SubCategoriaByIDSubCategoria]

@criterio varchar(50)
AS
	Begin
		SELECT id_categoria
		 FROM dbo.tbl_Sub_Categoria
		  WHERE id_subcategoria = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_SubCategoriaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_SubCategoriaCodigo]

AS
	Begin
		SELECT id_subcategoria
		 FROM dbo.tbl_Sub_Categoria
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Tablas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Tablas]
AS
	Begin
			select name from sysobjects where type='U'
			ORDER BY name
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TarjetaCredito]

@criterio varchar(50)
AS
	Begin
		SELECT id_tarjeta, descripcion_tarjeta, tarifa_tarjeta
		 FROM tbl_TarjetaCredito
		  WHERE id_tarjeta = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TarjetaCreditoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TarjetaCreditoCodigo]

AS
	Begin
		SELECT id_tarjeta
		 FROM tbl_TarjetaCredito
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_tequipo]

@criterio varchar(50)
AS
	Begin
		SELECT id_tequipo,nombre_tequipo
		 FROM dbo.tbl_tequipo
		  WHERE id_tequipo = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_tequipoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_tequipoCodigo]

AS

		SELECT id_tequipo
		 FROM dbo.tbl_tequipo
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoDocumentoPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoDocumentoPago]

@criterio varchar(50)
AS
	Begin
		SELECT id_tipoDocumentoPago, descripcion_tipoDocumentoPago
		 FROM dbo.tbl_TipoDocumentoPagos
		  WHERE id_tipoDocumentoPago = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoDocumentoPagoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoDocumentoPagoCodigo]

AS
	Begin
		SELECT id_tipoDocumentoPago
		 FROM dbo.tbl_TipoDocumentoPagos
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoEmpleado]

@criterio varchar(50)
AS
	Begin
		SELECT id_templeado, descripcion_templeado
		 FROM dbo.tbl_tipoEmpleado
		  WHERE id_templeado = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoEmpleadoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoEmpleadoCodigo]
AS
	SELECT id_templeado FROM dbo.tbl_tipoEmpleado
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoProducto]

@criterio varchar(50)
AS
	Begin
		SELECT id_tproducto, descripcion_tproducto 
		 FROM tbl_TipoProducto
		  WHERE id_tproducto = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoProductoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoProductoCodigo]
AS
	Begin
		SELECT id_tproducto
		 FROM tbl_TipoProducto
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TipoReparacion]

@criterio varchar(50)
AS
	Begin
		SELECT id_treparacion, nombre_treparacion, monto_treparacion
		 FROM dbo.tbl_TipoReparacion
		  WHERE id_treparacion = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Traslado]

@criterio varchar(50)
AS
	Begin
		SELECT id_traslado, fecha_traslado, id_bodegaOrigen, id_bodegaDestino, descripcion_traslado
		 FROM tbl_traslado
		  WHERE id_traslado = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TrasladoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TrasladoCodigo]

AS
	Begin
		SELECT id_traslado
		 FROM tbl_traslado
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TreparacionCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TreparacionCodigo]

AS

		SELECT id_treparacion
		 FROM dbo.tbl_TipoReparacion
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoControlArqueo]

@criterio1 varchar(50),
@criterio2 VARCHAR(50)
AS
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		
		 FROM dbo.tbl_ControlArqueo
		  WHERE id_control = @criterio1
		  AND id_caja = @criterio2
		  AND fecha_control = (SELECT MAX(fecha_control) FROM dbo.tbl_ControlArqueo WHERE id_control = @criterio1 AND id_caja = @criterio2)
		  AND Estado = 'activo'
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoControlArqueoCierre]

@criterio1 varchar(50),
@criterio2 VARCHAR(50)
AS
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		
		 FROM dbo.tbl_ControlArqueoCierre
		  WHERE id_control = @criterio1
		  AND id_caja = @criterio2
		  AND fecha_control = (SELECT MAX(fecha_control) FROM dbo.tbl_ControlArqueo WHERE id_control = @criterio1 AND id_caja = @criterio2)
		  AND Estado = 'activo'
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoControlCajaApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoControlCajaApertura]

@criterio1 varchar(50)
AS
	Begin
		SELECT id_control, fecha_control, id_caja, control_control
		 FROM tbl_ControlCajasApertura
		  WHERE id_caja = @criterio1 
			AND fecha_control = (SELECT MAX(fecha_control) FROM tbl_ControlCajasApertura WHERE id_caja = @criterio1)
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoKardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoKardex]

@criterio1 varchar(50),
@criterio2 VARCHAR(50)
AS
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_bodega = @criterio1 
			AND id_producto = @criterio2 
			AND fecha_kardex = 
					(SELECT MAX(fecha_kardex) 
						FROM tbl_Kardex 
							WHERE id_bodega = @criterio1 
							AND id_producto = @criterio2)

	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoKit]

@criterio1 varchar(50)
AS
	Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		 FROM tbl_kit
		  WHERE id_producto = @criterio1
			and estado_kit = 1 
			AND fecha_kit = (SELECT MAX(fecha_kit) FROM tbl_kit WHERE id_producto = @criterio1)

	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UltimoPrecioCostoPorProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UltimoPrecioCostoPorProducto]

@criterio1 varchar(50)
AS
	Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = @criterio1 
			AND fecha_PreCostoProducto = (SELECT MAX(fecha_PreCostoProducto) FROM tbl_PrecioCostoPorProductoByFecha WHERE id_producto = @criterio1)

	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UnidadMedida]

@criterio varchar(50)
AS
	Begin
		SELECT id_medida, descripcion_medida, cantidad_medida
		 FROM dbo.tbl_UnidadMedida
		  WHERE id_medida = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_UnidadMedidaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_UnidadMedidaCodigo]
AS
	Begin
		SELECT id_medida
		 FROM dbo.tbl_UnidadMedida
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_venta]

@criterio varchar(50)
AS
	Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = @criterio
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ventaByPendienteCobro]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ventaByPendienteCobro]

@criterio varchar(50)
AS
	Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = @criterio and cobrado_venta = 1
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_ventaCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_ventaCodigo]

AS
	Begin
		SELECT id_venta
		 FROM tbl_venta
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarEmpleado]
@criterio	varchar(50)
as
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from dbo.tbl_empleado
where id_empleado = @criterio and estado_empleado  = 'activo'
end

GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEmpleadoCodigo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarEmpleadoCodigo]
AS
BEGIN
	SELECT id_empleado 
  from tbl_empleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEmpleadoPorUsuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarEmpleadoPorUsuario]
@criterio	varchar(50)
as
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from dbo.tbl_empleado
where usuario_empleado = @criterio
and estado_empleado  = 1

end

GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuariosByIDEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuariosByIDEmpleado]
@criterio	varchar(50)
as
begin 
select id_empleado,usuario_empleado,contrasena_empleado,estado_empleado
from dbo.tbl_empleado
where id_empleado = @criterio and estado_empleado  = 1
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Banco]
AS
	SELECT * 
		FROM tbl_banco
			ORDER BY id_banco
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Barra]
AS
	SELECT * 
		FROM tbl_barra
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Bitaora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Bitaora]
AS
Begin
		SELECT *
		FROM tbl_bitacora	
		ORDER BY fecha_bitacora
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Bodega]
AS
	SELECT * 
		FROM tbl_bodega
			ORDER BY nombre_bodega ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaCompras]
AS
	SELECT * 
		FROM tbl_bodega
		WHERE id_bodega = 1
			ORDER BY nombre_bodega ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaMostrador]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaMostrador]
AS
	SELECT * 
		FROM tbl_bodega
			WHERE id_bodega = 2
			ORDER BY id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProducto]
AS
	SELECT * 
		FROM tbl_bodegaProducto
			ORDER BY id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProductoByBodegaMostrador]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProductoByBodegaMostrador]
AS
SELECT
dbo.tbl_Producto.id_producto,
dbo.tbl_Producto.sku_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto,
dbo.tbl_ProductUnidPrecioVenta.precio

FROM
dbo.tbl_Producto
INNER JOIN dbo.tbl_bodegaProducto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_ProductUnidPrecioVenta ON dbo.tbl_ProductUnidPrecioVenta.id_producto = dbo.tbl_Producto.id_producto
WHERE dbo.tbl_bodegaProducto.id_bodega = 2 AND dbo.tbl_ProductUnidPrecioVenta.id_medida = 1
			ORDER BY dbo.tbl_Producto.descripcion_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProductoByBodegas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProductoByBodegas]
AS
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB ON BP.id_bodega = BB.id_bodega
ORDER BY BP.id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProductoByIDProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProductoByIDProducto]
@criterio varchar(50)
AS
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB ON BP.id_bodega = BB.id_bodega
WHERE BP.id_producto = @criterio
ORDER BY BP.id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProductoInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProductoInventario]
AS
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		ORDER BY id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BodegaProductoJoin]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BodegaProductoJoin]
AS
SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
FROM tbl_bodegaProducto bp
INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
ORDER BY bp.id_bodega
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_BuscaKardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_BuscaKardex]
AS
	SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
	k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
	FROM tbl_Kardex k
	INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
	INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
	ORDER BY k.id_kardex
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Caja]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Caja]
AS
	SELECT * 
		FROM dbo.tbl_cajas
			ORDER BY id_caja
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_CajaDiaria]
AS
	SELECT * 
		FROM dbo.tbl_CajaDiaria
			ORDER BY id_caja
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CalculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[SP_Obtener_CalculoPrecioVenta]
AS
	SELECT * 
		FROM dbo.tbl_calculoPrecioVenta
			ORDER BY id_calculo
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Categoria]
AS
	SELECT * 
		FROM dbo.tbl_categoria
			ORDER BY descripcion_categoria
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CategoriaByIDCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_CategoriaByIDCategoria]
@criterio varchar(50)
AS
	SELECT * 
		FROM dbo.tbl_categoria
			WHERE id_categoria = @criterio
			ORDER BY id_categoria
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Cliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Cliente]
AS
	SELECT * 
		FROM dbo.tbl_cliente
			ORDER BY id_cliente
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Compra]
AS
	SELECT * 
		FROM dbo.tbl_compra
			ORDER BY id_compra
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CompraCompletaByProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_CompraCompletaByProveedor]
AS
	Begin 
SELECT C.id_compra, c.fecha_compra, c.id_bodega, B.nombre_bodega,
C.id_formaPago, F.descripcion_formaPago, c.id_proveedor,P.nit_proveedor, P.nombreComercial_proveedor,
C.documento_compra,C.boletaDeposito_compra,C.deposito_compra,C.total_compra,C.diffDepoCompra_compra,
C.usuario_compra 
FROM tbl_compra C
INNER JOIN tbl_proveedor P ON C.id_proveedor = P.id_proveedor
INNER JOIN tbl_FormaPago F ON c.id_formaPago = f.id_formaPago
INNER JOIN tbl_bodega B ON C.id_bodega = B.id_bodega
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Concetos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Concetos]
AS
	SELECT * 
		FROM dbo.tbl_conceptos
			ORDER BY id_concepto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ControlArqueo]
AS
	SELECT * 
		FROM dbo.tbl_ControlArqueo
			ORDER BY id_control
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ControlArqueoByIDCAJA]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ControlArqueoByIDCAJA]
@idcaja int
AS
	SELECT * 
		FROM dbo.tbl_ControlArqueo
		WHERE id_caja = @idcaja
			ORDER BY id_control
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ControlArqueoCierre]
AS
	SELECT * 
		FROM dbo.tbl_ControlArqueoCierre
			ORDER BY id_control
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ControlArqueoCierreByIdCaja]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ControlArqueoCierreByIdCaja]
@idcaja int
AS
	SELECT * 
		FROM dbo.tbl_ControlArqueoCierre
		WHERE id_caja = @idcaja
			ORDER BY id_control
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ControlCajaApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ControlCajaApertura]
AS
	SELECT * 
		FROM dbo.tbl_ControlCajasApertura
			ORDER BY id_caja
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CuentaPorCobrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_CuentaPorCobrar]
AS
	SELECT * 
		FROM dbo.tbl_cuentasPorCobrar
			ORDER BY id_cuentaCobro
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_CuentaPorPagar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_CuentaPorPagar]
AS
	SELECT * 
		FROM dbo.tbl_CuentaPorPagar
			ORDER BY id_CuentaPorPagar
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Departamento]
AS
	SELECT * 
		FROM dbo.tbl_departamento
			ORDER BY id_departamento
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleCompra]
AS
	SELECT * 
		FROM dbo.tbl_DetalleCompra
			ORDER BY id_compra
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleDevolucionCliente]
AS
	SELECT * 
		FROM dbo.tbl_DetalleDevolucionCliente
			ORDER BY id_devolucionCliente
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleInventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleInventario]
AS
	SELECT * 
		FROM dbo.tbl_detalle_inventario
			ORDER BY id_inventario
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleKit]
AS
	SELECT * 
		FROM dbo.tbl_DetalleKit
			ORDER BY id_kit
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetallePagoCredito]
AS
	SELECT * 
		FROM dbo.tbl_DetallePagoCredito
			ORDER BY id_pagocre
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetallePagoCreditoContado]
AS
	SELECT * 
		FROM dbo.tbl_DetallePagoCreditoContado
			ORDER BY id_pagocrecont
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_detallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_detallePedido]
AS
	SELECT * 
		FROM dbo.tbl_detallePedido
			ORDER BY id_pedido
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleSalida]
AS
	SELECT * 
		FROM dbo.tbl_DetalleSalida
			ORDER BY id_salida
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_detalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_detalleTraslado]
AS
	SELECT * 
		FROM tbl_detalleTraslado
			ORDER BY id_traslado
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_DetalleVenta]
AS
	SELECT * 
		FROM dbo.tbl_DetalleVenta
			ORDER BY id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Documentos]
AS
	SELECT * 
		FROM dbo.tbl_Documentos
			WHERE activo_documento = 1
			ORDER BY id_documento
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_equipo]
AS
	SELECT * 
		FROM dbo.tbl_equipo
			ORDER BY id_equipo
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_FacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_FacturasCompras]
AS
	SELECT * 
		FROM dbo.tbl_FacturasCompras
			ORDER BY id_facturacompra
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_FacturasVentas]
AS
	SELECT * 
		FROM dbo.tbl_FacturasVentas
			ORDER BY id_facturaventa
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_FormaPago]
AS
	SELECT * 
		FROM dbo.tbl_FormaPago
			ORDER BY descripcion_formaPago ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Inventario]
AS
	SELECT * 
		FROM dbo.tbl_Inventario
			ORDER BY id_inventario
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Iva]
AS
	SELECT * 
		FROM tbl_iva
			ORDER BY descripcion_iva
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Kardex]
AS
	SELECT * 
		FROM tbl_Kardex
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Kit]
AS
	SELECT * 
		FROM tbl_kit
		WHERE estado_kit = 1
			ORDER BY id_kit	
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_marca]
AS
	SELECT * 
		FROM dbo.tbl_marca
			ORDER BY nombre_marca
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_marcaEquipos]
AS
	SELECT * 
		FROM dbo.tbl_marcaEquipos
			ORDER BY id_marcaE
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_modelo]
AS
	SELECT * 
		FROM dbo.tbl_modelo
			ORDER BY id_modelo
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_MovimientoCuentaCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_MovimientoCuentaCliente]
AS
	SELECT * 
		FROM dbo.tbl_MovimientoCuentaClientes
			ORDER BY id_movimiento
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_MovimientoCuentaProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_MovimientoCuentaProveedor]
AS
	SELECT * 
		FROM dbo.tbl_MovimientoCuentaProveedores
			ORDER BY id_movimiento
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_municipio]
AS
	SELECT * 
		FROM dbo.tbl_municipio
			ORDER BY id_municipio
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_PermisosRol]
AS
	SELECT * 
		FROM dbo.tbl_PermisosRol
			ORDER BY id_permisos
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_PrecioCostoPorPorductoPorFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_PrecioCostoPorPorductoPorFecha]
AS
	SELECT * 
		FROM tbl_PrecioCostoPorProductoByFecha
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_producto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_producto]
AS
	SELECT * 
				FROM tbl_Producto
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_productoBarra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_productoBarra]
AS
	SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, p.id_iva, p.notas_producto, p.imagen_producto, 
	p.id_marca, p.modelo_producto, p.id_tproducto
		FROM dbo.tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_productoByIDTprodKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_productoByIDTprodKit]
AS
	SELECT * 
				FROM tbl_Producto
				WHERE id_tproducto = 4
			ORDER BY id_producto 
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_productoDifefenteKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_productoDifefenteKit]
AS
SELECT * from tbl_Producto
WHERE id_tproducto <> 4
			ORDER BY id_producto 
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_productos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_productos]
AS
			SELECT p.id_producto, b.barra AS Barras, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto, p.imagen_producto, 
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto
		FROM dbo.tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
			ORDER BY p.id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ProductUnidPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ProductUnidPrecioVenta]
AS
	SELECT * 
		FROM dbo.tbl_ProductUnidPrecioVenta
			ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ProductUnidPrecioVentaJoin]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ProductUnidPrecioVentaJoin]
AS
SELECT pv.id_producto, pv.id_medida, m.descripcion_medida, pv.precio, pv.estado_prounidprecio 
from tbl_ProductUnidPrecioVenta pv
INNER JOIN tbl_UnidadMedida m on pv.id_medida = m.id_medida
ORDER BY id_producto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_proforma]
AS
	SELECT * 
		FROM tbl_proforma
			ORDER BY id_proforma
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ProvBancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ProvBancos]
AS
	SELECT * 
		FROM dbo.tbl_provbancos
			ORDER BY id_banco
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Proveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Proveedor]
AS
	SELECT * 
		FROM dbo.tbl_proveedor
			ORDER BY id_proveedor
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Reparacion]
AS
	SELECT * 
		FROM dbo.tbl_reparacion
			ORDER BY id_reparacion
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ReparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ReparacionRepuestosLevel1]
AS
	SELECT * 
		FROM dbo.tbl_reparacionRepuestosLevel1
			ORDER BY id_reparacion
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Rol]
AS
	SELECT * 
		FROM tbl_Rol
			ORDER BY id_rol
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Salida]
AS
	SELECT * 
		FROM tbl_salida
			ORDER BY id_salida
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_SerieProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_SerieProducto]
AS
	SELECT * 
		FROM dbo.tbl_serieProducto
		where cantidad_serie > 0
			ORDER BY id_serie
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_SubCategoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_SubCategoria]
AS
	SELECT * 
		FROM dbo.tbl_Sub_Categoria
			ORDER BY id_subcategoria
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TarjetaCredito]
AS
	SELECT * 
		FROM tbl_TarjetaCredito
			ORDER BY id_tarjeta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_tequipo]
AS
	SELECT * 
		FROM dbo.tbl_tequipo
			ORDER BY id_tequipo
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TipoDocumentoPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TipoDocumentoPago]
AS
	SELECT * 
		FROM dbo.tbl_TipoDocumentoPagos
			ORDER BY id_tipoDocumentoPago
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TipoDocumentoPagoByFactura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TipoDocumentoPagoByFactura]
AS
	SELECT * 
		FROM dbo.tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 1
			ORDER BY id_tipoDocumentoPago
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TipoDocumentoPagoByProforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TipoDocumentoPagoByProforma]
AS
	SELECT * 
		FROM dbo.tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 4
			ORDER BY id_tipoDocumentoPago
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TipoProducto]
AS
	SELECT * 
		FROM tbl_tipoProducto
			ORDER BY descripcion_tproducto
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_TipoReparacion]
AS
	SELECT * 
		FROM tbl_TipoReparacion
			ORDER BY id_treparacion
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Traslado]
AS
	SELECT * 
		FROM tbl_traslado
			ORDER BY id_traslado
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_treparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_treparacion]
AS
	SELECT * 
		FROM dbo.tbl_TipoReparacion
			ORDER BY id_treparacion
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_UnidadMedida]
AS
	SELECT * 
		FROM dbo.tbl_UnidadMedida
			ORDER BY descripcion_medida
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_venta]
AS
	SELECT * 
		FROM tbl_venta
			ORDER BY id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByAll]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByAll]
@desde DATE,
@hasta DATE

AS
SELECT
dbo.tbl_venta.id_venta,
dbo.tbl_venta.fecha_venta,
dbo.tbl_venta.id_formaPago,
dbo.tbl_FormaPago.descripcion_formaPago,
dbo.tbl_venta.total_venta,
dbo.tbl_venta.documento,
dbo.tbl_venta.usuario_venta

FROM
dbo.tbl_venta
INNER JOIN dbo.tbl_FormaPago ON dbo.tbl_venta.id_formaPago = dbo.tbl_FormaPago.id_formaPago
WHERE CAST(CONVERT(CHAR(8), dbo.tbl_venta.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @hasta, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND dbo.tbl_venta.cobrado_venta = 1
ORDER BY dbo.tbl_venta.id_venta ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByCheque]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByCheque]
@hasta DATE,
@desde DATE
AS
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(CONVERT(CHAR(8), V.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @hasta, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND v.id_formaPago = 2
AND v.cobrado_venta = 1
ORDER BY v.id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByContado]
@desde DATE,
@hasta DATE

AS
SELECT
dbo.tbl_venta.id_venta,
dbo.tbl_venta.fecha_venta,
dbo.tbl_venta.id_formaPago,
dbo.tbl_FormaPago.descripcion_formaPago,
dbo.tbl_venta.total_venta,
dbo.tbl_venta.documento,
dbo.tbl_venta.usuario_venta

FROM
dbo.tbl_venta
INNER JOIN dbo.tbl_FormaPago ON dbo.tbl_venta.id_formaPago = dbo.tbl_FormaPago.id_formaPago
WHERE CAST(CONVERT(CHAR(8), dbo.tbl_venta.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @hasta, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND dbo.tbl_venta.id_formaPago = 1
AND dbo.tbl_venta.cobrado_venta = 1
ORDER BY dbo.tbl_venta.id_venta ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByCredito]
@desde DATE,
@hasta DATE
AS
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(CONVERT(CHAR(8), V.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @hasta, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND v.id_formaPago = 3
AND v.cobrado_venta = 1
ORDER BY v.id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByDeposito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByDeposito]
@desde DATE,
@hasta DATE
AS
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(CONVERT(CHAR(8), V.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND v.id_formaPago = 5
AND v.cobrado_venta = 1
ORDER BY v.id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaDiariaByTarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaDiariaByTarjetaCredito]
@desde DATE,
@hasta DATE
AS
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(CONVERT(CHAR(8), V.fecha_venta,112) AS INT)
BETWEEN CAST(CONVERT(CHAR(8), @desde, 112) AS INT)
AND CAST(CONVERT(CHAR(8), @hasta, 112)AS INT)
AND v.id_formaPago = 4
AND v.cobrado_venta = 1
ORDER BY v.id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ventaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_ventaTemp]
AS
	SELECT * 
		FROM tbl_ventaTemp
			ORDER BY id_venta
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerEmpleado]
AS
SET NOCOUNT ON;
SELECT * 
FROM dbo.tbl_empleado 
WHERE estado_empleado = 1 
ORDER BY id_empleado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerEmpleadoTipoTecnico]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerEmpleadoTipoTecnico]
AS
SET NOCOUNT ON;
SELECT * 
FROM dbo.tbl_empleado 
WHERE id_templeado = 4 AND	estado_empleado = 1 
ORDER BY id_empleado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerLogUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerLogUsuarios]
AS
SET NOCOUNT ON;
SELECT * 
FROM dbo.tbl_LogUusarios 
ORDER BY usuario_empleado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerTipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerTipoEmpleado]
AS
SET NOCOUNT ON;
SELECT * 
FROM dbo.tbl_tipoEmpleado 
ORDER BY id_templeado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerUsuarios]
AS
SET NOCOUNT ON;
SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
WHERE estado_empleado = 1 
ORDER BY usuario_empleado ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_TipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TipoEmpleado]
(
@idTemp INT,
@descrip NVARCHAR(MAX)
)

AS

	Begin Try
		Begin Transaction
			UPDATE [dbo].[tbl_tipoEmpleado]
			SET

			descripcion_templeado = @descrip

			WHERE
			id_templeado = @idTemp

		Commit Transaction
	End try
	
	Begin Catch
		Rollback Transaction
	End Catch	
GO
/****** Object:  StoredProcedure [dbo].[ValidarFacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarFacturasCompras]
(
	@criterio NVARCHAR(MAX)
)
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM tbl_FacturasCompras
WHERE documento_facturacompra = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ValidarNumeroSerie]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarNumeroSerie]
(
	@NumeroSerie varchar(MAX)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM tbl_SerieProducto
WHERE numero_serie = @NumeroSerie
GO
/****** Object:  StoredProcedure [dbo].[ValidarProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarProveedor]
(
	@criterio INT
)
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM tbl_proveedor
WHERE id_proveedor = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ValidarProveedorNit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarProveedorNit]
(
	@criterio INT
)
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM tbl_proveedor
WHERE nit_proveedor = @criterio
GO
/****** Object:  StoredProcedure [dbo].[ValidaUsuario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaUsuario]
(
	@IDUsuario nvarchar(50),
	@Clave nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM dbo.tbl_empleado 
WHERE usuario_empleado = @IDUsuario
AND contrasena_empleado = @Clave
AND estado_empleado = 1
GO
/****** Object:  StoredProcedure [dbo].[ValidaUsuarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaUsuarios]
(
	@IDUsuario nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM tbl_LogUusarios 
WHERE usuario_empleado = @IDUsuario
AND log = 0
GO
EXEC [AplicationComercial].sys.sp_addextendedproperty @name=N'SQLSourceControl Scripts Location', @value=N'<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<ISOCCompareLocation version="1" type="SvnLocation">
  <RepositoryUrl>https://192.168.4.106/svn/Sql_AplicationComercial/</RepositoryUrl>
</ISOCCompareLocation>' 
GO
EXEC [AplicationComercial].sys.sp_addextendedproperty @name=N'SQLSourceControl Database Revision', @value=5 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_compra"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_DetalleCompra"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 136
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "tbl_Producto"
            Begin Extent = 
               Top = 6
               Left = 593
               Bottom = 136
               Right = 797
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_proveedor"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 282
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2370
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ProductListByIDProductoFromCompraDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ProductListByIDProductoFromCompraDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ProductListByIDProductoFromCompraDetails'
GO
ALTER DATABASE [AplicationComercial] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AplicationComercial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
