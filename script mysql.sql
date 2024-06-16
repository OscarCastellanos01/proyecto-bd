/* SQLINES DEMO *** le [dbo].[tbl_Producto]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_Producto`(
	`id_producto` int NOT NULL,
	`sku_producto` Longtext NULL,
	`descripcion_producto` Longtext NOT NULL,
	`id_Sub_Categoria` int NOT NULL,
	`id_iva` int NOT NULL,
	`notas_producto` Longtext NULL,
	`id_marca` int NOT NULL,
	`modelo_producto` Longtext NULL,
	`id_tproducto` int NOT NULL,
	`costo_producto` Decimal(15,4) NULL,
 CONSTRAINT `PK_tbl_Producto` PRIMARY KEY 
(
	`id_producto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_ProductUnidPrecioVenta]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_ProductUnidPrecioVenta`(
	`id_producto` int NOT NULL,
	`id_medida` int NOT NULL,
	`precio` Decimal(15,4) NULL,
	`estado_prounidprecio` Tinyint NULL,
	`precioBase` Tinyint NULL,
 CONSTRAINT `PK_tbl_ProductUnidPrecioVenta` PRIMARY KEY 
(
	`id_producto` ASC,
	`id_medida` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_bodegaProducto]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_bodegaProducto`(
	`id_bodega` int NOT NULL,
	`id_producto` int NOT NULL,
	`stock_producto` Double NOT NULL,
	`minimo_producto` Double NOT NULL,
	`maximo_producto` Double NOT NULL,
	`diasReposicion_producto` int NOT NULL,
	`cantidadMinima_producto` Double NOT NULL,
 CONSTRAINT `PK_tbl_bodegaProducto` PRIMARY KEY 
(
	`id_bodega` ASC,
	`id_producto` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_Sub_Categoria]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_Sub_Categoria`(
	`id_subcategoria` int NOT NULL,
	`descripcion_subcategoria` Longtext NULL,
	`id_categoria` int NULL,
 CONSTRAINT `PK_Sub_Categoria` PRIMARY KEY 
(
	`id_subcategoria` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_categoria]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_categoria`(
	`id_categoria` int NOT NULL,
	`descripcion_categoria` Longtext NULL,
 CONSTRAINT `PK_tbl_categoria` PRIMARY KEY 
(
	`id_categoria` ASC
) 
) ;
/* SQLINES DEMO *** w [dbo].[View_ListaBodegaProductoByIDBodegaAndPrecios]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE VIEW `View_ListaBodegaProductoByIDBodegaAndPrecios` AS 
SELECT
tbl_bodegaProducto.id_bodega,
tbl_bodegaProducto.id_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto,
tbl_Producto.costo_producto,
tbl_ProductUnidPrecioVenta.precio,
tbl_Producto.id_Sub_Categoria,
tbl_categoria.id_categoria

FROM
tbl_bodegaProducto
INNER JOIN tbl_Producto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta ON tbl_ProductUnidPrecioVenta.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_Sub_Categoria ON tbl_Producto.id_Sub_Categoria = tbl_Sub_Categoria.id_subcategoria
INNER JOIN tbl_categoria ON tbl_Sub_Categoria.id_categoria = tbl_categoria.id_categoria
WHERE
tbl_bodegaProducto.id_bodega = 2 AND
tbl_ProductUnidPrecioVenta.precioBase = 1 AND
tbl_Producto.id_Sub_Categoria = 1 AND
tbl_Sub_Categoria.id_categoria = 1;
 
/* SQLINES DEMO *** w [dbo].[View_LIstProductByIDBodega]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE VIEW `View_LIstProductByIDBodega` AS 
SELECT
tbl_bodegaProducto.id_bodega,
tbl_bodegaProducto.id_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto

FROM
tbl_bodegaProducto
INNER JOIN tbl_Producto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
WHERE
tbl_bodegaProducto.id_bodega = 2;
 
/* SQLINES DEMO *** le [dbo].[tbl_proveedor]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_proveedor`(
	`id_proveedor` int NOT NULL,
	`nombreJuridico_proveedor` Longtext NOT NULL,
	`nombreComercial_proveedor` Longtext NULL,
	`direccion_proveedor` Longtext NOT NULL,
	`telefono1_proveedor` nvarchar(50) NULL,
	`telefono2_proveedor` nvarchar(50) NULL,
	`correo_proveedor` nvarchar(50) NULL,
	`nit_proveedor` Longtext NOT NULL,
	`id_iva` int NULL,
	`id_municipio` int NOT NULL,
 CONSTRAINT `PK_tbl_proveedor` PRIMARY KEY 
(
	`id_proveedor` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_compra]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_compra`(
	`id_compra` int NOT NULL,
	`fecha_compra` datetime(3) NOT NULL,
	`id_proveedor` int NOT NULL,
	`id_bodega` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`documento_compra` Longtext NULL,
	`total_compra` Decimal(15,4) NOT NULL,
	`notas_compra` Longtext NULL,
	`plazo_compra` int NULL,
	`boletaDeposito_compra` Longtext NULL,
	`deposito_compra` Decimal(15,4) NULL,
	`diffDepoCompra_compra` Decimal(15,4) NULL,
	`usuario_compra` Longtext NULL,
 CONSTRAINT `PK_tbl_compra` PRIMARY KEY 
(
	`id_compra` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleCompra]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleCompra`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_compra` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`costo_producto` Decimal(15,4) NULL,
	`cantidad_producto` Double NOT NULL,
	`id_kardex` int NOT NULL,
	`porcentajeIva_Producto` Double NOT NULL,
	`porcentajeDescuento_producto` Double NOT NULL,
 CONSTRAINT `PK_tbl_DetalleCompra` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** w [dbo].[View_ProductListByIDProductoFromCompraDetails]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE VIEW `View_ProductListByIDProductoFromCompraDetails`
AS
SELECT        tbl_DetalleCompra.id_compra, tbl_DetalleCompra.id_producto, tbl_DetalleCompra.descripcion_producto, tbl_DetalleCompra.cantidad_producto, tbl_DetalleCompra.costo_producto, 
                         tbl_proveedor.id_proveedor, tbl_proveedor.nombreComercial_proveedor
FROM            tbl_compra INNER JOIN
                         tbl_DetalleCompra ON tbl_compra.id_compra = tbl_DetalleCompra.id_compra INNER JOIN
                         tbl_Producto ON tbl_DetalleCompra.id_producto = tbl_Producto.id_producto INNER JOIN
                         tbl_proveedor ON tbl_compra.id_proveedor = tbl_proveedor.id_proveedor;
 
/* SQLINES DEMO *** w [dbo].[View_ProductListToIDProducto]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE VIEW `View_ProductListToIDProducto` AS 
SELECT
tbl_DetalleCompra.id_compra,
tbl_compra.fecha_compra,
tbl_DetalleCompra.id_producto,
tbl_DetalleCompra.descripcion_producto,
tbl_DetalleCompra.cantidad_producto,
tbl_DetalleCompra.costo_producto,
tbl_proveedor.id_proveedor,
tbl_proveedor.nombreComercial_proveedor

FROM            tbl_compra INNER JOIN
                         tbl_DetalleCompra ON tbl_compra.id_compra = tbl_DetalleCompra.id_compra INNER JOIN
                         tbl_Producto ON tbl_DetalleCompra.id_producto = tbl_Producto.id_producto INNER JOIN
                         tbl_proveedor ON tbl_compra.id_proveedor = tbl_proveedor.id_proveedor
WHERE
tbl_DetalleCompra.id_producto = 519;
 
/* SQLINES DEMO *** le [dbo].[tbl_aldea_caserio]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_aldea_caserio`(
	`id_aldea_caserio` int NOT NULL,
	`id_municipio` int NOT NULL,
	`nombre_aldea_caserio` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_aldea_caserio` PRIMARY KEY 
(
	`id_aldea_caserio` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_banco]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_banco`(
	`id_banco` int NOT NULL,
	`descripcion_banco` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_banco` PRIMARY KEY 
(
	`id_banco` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_barra]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_barra`(
	`id_producto` int NOT NULL,
	`barra` bigint NOT NULL,
 CONSTRAINT `PK_tbl_barra` PRIMARY KEY 
(
	`id_producto` ASC,
	`barra` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_bitacora]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_bitacora`(
	`id_bitacora` int AUTO_INCREMENT NOT NULL,
	`fecha_bitacora` datetime(3) NULL,
	`usuario` varchar(255) NULL,
	`accion_bitacora` Longtext NULL,
	`hora_bitacora` Longtext NULL,
PRIMARY KEY 
(
	`id_bitacora` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_bodega]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_bodega`(
	`id_bodega` int NOT NULL,
	`nombre_bodega` Longtext NULL,
	`id_sucursal` int NOT NULL,
 CONSTRAINT `PK_tbl_bodega` PRIMARY KEY 
(
	`id_bodega` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_CajaDiaria]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_CajaDiaria`(
	`id_movimiento` int AUTO_INCREMENT NOT NULL,
	`fecha_movimiento` datetime(3) NOT NULL,
	`id_caja` int NOT NULL,
	`montoApertura_movimiento` Decimal(15,4) NOT NULL,
	`ingreso_movimiento` Decimal(15,4) NOT NULL,
	`ingresoCheque_movimiento` Decimal(15,4) NOT NULL,
	`ingresoTarjeta_movimiento` Decimal(15,4) NOT NULL,
	`egreso_movimiento` Decimal(15,4) NOT NULL,
	`cierre_movimiento` Decimal(15,4) NOT NULL,
	`saldo_movimiento` Decimal(15,4) NOT NULL,
	`estado_movimiento` int NOT NULL,
 CONSTRAINT `PK_tbl_CajaDiaria` PRIMARY KEY 
(
	`id_movimiento` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_cajas]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_cajas`(
	`id_caja` int NOT NULL,
	`descripcion_caja` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_cajas` PRIMARY KEY 
(
	`id_caja` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_calculoPrecioVenta]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_calculoPrecioVenta`(
	`id_calculo` int AUTO_INCREMENT NOT NULL,
	`fecha_calculo` datetime(3) NOT NULL,
	`descripcion_calculo` Longtext NULL,
	`precio_costo` Decimal(15,4) NULL,
	`envio_costo` Decimal(15,4) NULL,
	`ganacia_promedio` Double NULL,
	`costo_total` Decimal(15,4) NULL,
	`precio_venta` Decimal(15,4) NULL,
	`precioSinIva_venta` Decimal(15,4) NULL,
	`iva_calculado` Decimal(15,4) NULL,
	`isr_calculado` Decimal(15,4) NULL,
	`iso_calculado` Decimal(15,4) NULL,
	`total_impuesto` Decimal(15,4) NULL,
	`ganancia_real` Decimal(15,4) NULL,
 CONSTRAINT `PK_tbl_calculoPrecioVenta` PRIMARY KEY 
(
	`id_calculo` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_cliente]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_cliente`(
	`id_cliente` int NOT NULL,
	`nit_cliente` Longtext NOT NULL,
	`nombre_cliente` Longtext NOT NULL,
	`id_municipio` int NULL,
	`direccion_cliente` Longtext NOT NULL,
	`telefono1_cliente` nvarchar(20) NULL,
	`telefono2_cliente` nvarchar(20) NULL,
	`email_cliente` Longtext NULL,
	`notas_cliente` Longtext NULL,
 CONSTRAINT `PK_tbl_cliente` PRIMARY KEY 
(
	`id_cliente` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_conceptos]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_conceptos`(
	`id_concepto` int AUTO_INCREMENT NOT NULL,
	`descripcion_concepto` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_conceptos` PRIMARY KEY 
(
	`id_concepto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_ControlArqueo]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_ControlArqueo`(
	`id_control` int NOT NULL,
	`fecha_control` datetime(3) NOT NULL,
	`id_caja` int NOT NULL,
	`Cantidad200` int NULL,
	`Total200` Decimal(15,4) NULL,
	`Cantidad100` int NULL,
	`Total100` Decimal(15,4) NULL,
	`Cantidad50` int NULL,
	`Total50` Decimal(15,4) NULL,
	`Cantidad20` int NULL,
	`Total20` Decimal(15,4) NULL,
	`Cantidad10` int NULL,
	`Total10` Decimal(15,4) NULL,
	`Cantidad5` int NULL,
	`Total5` Decimal(15,4) NULL,
	`Cantidad1` int NULL,
	`Total1` Decimal(15,4) NULL,
	`Cantidad050` int NULL,
	`Total050` Decimal(15,4) NULL,
	`Cantidad025` int NULL,
	`Total025` Decimal(15,4) NULL,
	`Cantidad010` int NULL,
	`Total010` Decimal(15,4) NULL,
	`Cantidad005` int NULL,
	`Total005` Decimal(15,4) NULL,
	`Cantidad001` int NULL,
	`Total001` Decimal(15,4) NULL,
	`GranTotal` Decimal(15,4) NULL,
	`Estado` nchar(10) NULL,
 CONSTRAINT `PK_tbl_ControlArqueo` PRIMARY KEY 
(
	`id_control` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_ControlArqueoCierre`(
	`id_control` int NOT NULL,
	`fecha_control` datetime(3) NOT NULL,
	`id_caja` int NOT NULL,
	`Cantidad200` int NULL,
	`Total200` decimal(18, 0) NULL,
	`Cantidad100` int NULL,
	`Total100` decimal(18, 0) NULL,
	`Cantidad50` int NULL,
	`Total50` decimal(18, 0) NULL,
	`Cantidad20` int NULL,
	`Total20` decimal(18, 0) NULL,
	`Cantidad10` int NULL,
	`Total10` decimal(18, 0) NULL,
	`Cantidad5` int NULL,
	`Total5` decimal(18, 0) NULL,
	`Cantidad1` int NULL,
	`Total1` decimal(18, 0) NULL,
	`Cantidad050` int NULL,
	`Total050` decimal(18, 0) NULL,
	`Cantidad025` int NULL,
	`Total025` decimal(18, 0) NULL,
	`Cantidad010` int NULL,
	`Total010` decimal(18, 0) NULL,
	`Cantidad005` int NULL,
	`Total005` decimal(18, 0) NULL,
	`Cantidad001` int NULL,
	`Total001` decimal(18, 0) NULL,
	`TotalCheques` decimal(18, 0) NULL,
	`TotalTarjetas` decimal(18, 0) NULL,
	`GranTotal` decimal(18, 0) NULL,
	`Estado` nchar(10) NULL,
 CONSTRAINT `PK__tbl_Cont__3AAC4A77259DF384` PRIMARY KEY 
(
	`id_control` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_ControlCajasApertura]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_ControlCajasApertura`(
	`id_control` int NOT NULL,
	`fecha_control` datetime(3) NOT NULL,
	`id_caja` int NOT NULL,
	`control_control` int NOT NULL,
 CONSTRAINT `PK_tbl_ControlCajasApertura` PRIMARY KEY 
(
	`id_control` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_CuentaPorPagar]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_CuentaPorPagar`(
	`id_CuentaPorPagar` int NOT NULL,
	`fecha_CuentaPorPagar` datetime(3) NOT NULL,
	`fechaVence_CuentaPorPagar` datetime(3) NOT NULL,
	`id_proveedor` int NOT NULL,
	`documento_CuentaPorPagar` Longtext NOT NULL,
	`monto_CuentaPorPagar` Decimal(15,4) NOT NULL,
	`plazo_CuentaPorPagar` Double NOT NULL,
	`saldo_CuentaPorPagar` Decimal(15,4) NULL,
	`estado_CuentaPorPagar` int NULL,
 CONSTRAINT `PK_tbl_CuentaPorPagar` PRIMARY KEY 
(
	`id_CuentaPorPagar` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_cuentasPorCobrar]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_cuentasPorCobrar`(
	`id_cuentaCobro` int NOT NULL,
	`fecha_cuentaCobro` datetime(3) NOT NULL,
	`fechaVence_CuentaPorCobrar` datetime(3) NULL,
	`id_cliente` int NOT NULL,
	`id_ventaReferencia` int NULL,
	`documento_venta` Longtext NULL,
	`monto_cuentaCobro` Decimal(15,4) NOT NULL,
	`plazo_cuentaCobro` Double NOT NULL,
	`id_interes` int NOT NULL,
	`cuotaProgramada` Decimal(15,4) NOT NULL,
	`saldoProgramado` Decimal(15,4) NOT NULL,
	`id_InteresMora` Double NULL,
	`estado_cuentaCobro` int NOT NULL,
 CONSTRAINT `PK_tbl_cuentasPorCobrar` PRIMARY KEY 
(
	`id_cuentaCobro` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_departamento]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_departamento`(
	`id_departamento` int NOT NULL,
	`nombre_departamento` Longtext NOT NULL,
	`id_pais` int NULL,
 CONSTRAINT `PK_tbl_departamento` PRIMARY KEY 
(
	`id_departamento` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_detalle_inventario]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_detalle_inventario`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_inventario` int NULL,
	`id_producto` int NULL,
	`descripcion_producto` Longtext NULL,
	`stock_producto` Double NULL,
 CONSTRAINT `PK_tbl_detalle_inventario` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleDevolucionCliente`(
	`id_liena` int AUTO_INCREMENT NOT NULL,
	`id_devolucionCliente` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NULL,
	`cantidad_producto` Double NOT NULL,
	`id_kardex` int NOT NULL,
	`porcentajeIva` Double NOT NULL,
	`porcentajeDescuento` Double NOT NULL,
 CONSTRAINT `PK_tbl_DetalleDevolucionCliente` PRIMARY KEY 
(
	`id_liena` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleKit]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleKit`(
	`id_kit` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NOT NULL,
	`cantidad_detalleKit` Double NOT NULL,
	`numero_serie` Longtext NULL,
 CONSTRAINT `PK_tbl_DetalleKit` PRIMARY KEY 
(
	`id_kit` ASC,
	`id_producto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetallePagoCredito]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetallePagoCredito`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_pagocre` int NOT NULL,
	`id_tabla` int NOT NULL,
	`monto_pagocre` Decimal(15,4) NOT NULL,
	`mora_pagocre` Decimal(15,4) NOT NULL,
	`dias_pagocre` Double NOT NULL,
 CONSTRAINT `PK_tbl_DetallePagoCredito` PRIMARY KEY 
(
	`id_linea` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetallePagoCreditoContado`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_pagocrecont` int NOT NULL,
	`id_cuentaCobro` int NOT NULL,
	`monto_pagocrecont` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_DetallePagoCreditoContado` PRIMARY KEY 
(
	`id_linea` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_detallePedido]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_detallePedido`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_pedido` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NOT NULL,
	`cantidad_pedido` Double NOT NULL,
 CONSTRAINT `PK_tbl_detallePedido` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleProforma]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleProforma`(
	`id_linea` int NOT NULL,
	`id_proforma` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NOT NULL,
	`cantidad_producto` Double NOT NULL,
	`procentajeIva` Double NOT NULL,
	`porcentajeDescuento` Double NOT NULL,
	`descripcion_medida` Longtext NULL,
 CONSTRAINT `PK_tbl_DetalleProforma` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleSalida]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleSalida`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_salida` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_salida` Longtext NOT NULL,
	`cantidad_salida` Double NOT NULL,
	`id_kardex` int NOT NULL,
 CONSTRAINT `PK_tbl_DetalleSalida` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_detalleTraslado]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_detalleTraslado`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_traslado` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`cantidad_traslado` Double NOT NULL,
	`id_kardexOrigen` int NOT NULL,
	`id_KardexDestino` int NOT NULL,
 CONSTRAINT `PK_tbl_detalleTraslado` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_DetalleVenta]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_DetalleVenta`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_venta` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NOT NULL,
	`cantidad_producto` Double NOT NULL,
	`id_kardex` int NOT NULL,
	`porcentajeIva` Double NOT NULL,
	`porcentajeDescuento` Double NOT NULL,
	`numeroSerie` Longtext NOT NULL,
	`fechaGarantia` datetime(3) NOT NULL,
	`descripcion_medida` Longtext NULL,
 CONSTRAINT `PK_tbl_DetalleVenta` PRIMARY KEY 
(
	`id_linea` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_devolucionCliente]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_devolucionCliente`(
	`id_devolucionCliente` int NOT NULL,
	`fecha_devolucionCliente` datetime(3) NOT NULL,
	`id_venta` int NOT NULL,
	`observaciones_devolucionCliente` Longtext NULL,
 CONSTRAINT `PK_tbl_devolucionCliente` PRIMARY KEY 
(
	`id_devolucionCliente` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_devolucionProveedor]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_devolucionProveedor`(
	`id_devolucionProveedor` int NOT NULL,
	`fecha_devolucionProveedor` datetime(3) NOT NULL,
	`id_compra` int NOT NULL,
	`observaciones_devolucionProveedor` Longtext NULL,
 CONSTRAINT `PK_tbl_devolucionProveedor` PRIMARY KEY 
(
	`id_devolucionProveedor` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_Documentos]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_Documentos`(
	`id_documento` int NOT NULL,
	`nombre_documento` Longtext NOT NULL,
	`abreviatura_documento` nvarchar(50) NOT NULL,
	`serie_documento` nvarchar(50) NOT NULL,
	`id_tipoDocumentoPago` int NOT NULL,
	`inicio_documento` int NOT NULL,
	`final_documento` int NOT NULL,
	`activo_documento` Tinyint NULL,
	`utilizado_documento` int NULL,
 CONSTRAINT `PK_tbl_Documentos` PRIMARY KEY 
(
	`id_documento` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_empleado]    Script Date: 1/06/2024 17:24:57 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_empleado`(
	`id_empleado` int AUTO_INCREMENT NOT NULL,
	`fechain_empleado` datetime(3) NOT NULL,
	`nombre_empleado` Longtext NOT NULL,
	`apellido_empleado` Longtext NOT NULL,
	`direccion_empleado` Longtext NULL,
	`telefeono1_empleado` Longtext NULL,
	`telefono2_empleado` Longtext NULL,
	`fechanac_empleado` date NULL,
	`id_templeado` int NOT NULL,
	`usuario_empleado` nvarchar(50) NOT NULL,
	`contrasena_empleado` nvarchar(50) NOT NULL,
	`id_rol` int NOT NULL,
	`id_caja` int NOT NULL,
	`id_municipio` int NOT NULL,
	`estado_empleado` int NULL,
 CONSTRAINT `PK_tbl_empleado` PRIMARY KEY 
(
	`id_empleado` ASC
) 
) AUTO_INCREMENT = 9 ;
/* SQLINES DEMO *** le [dbo].[tbl_FacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_FacturasCompras`(
	`id_facturacompra` int AUTO_INCREMENT NOT NULL,
	`fecha_facturacompra` datetime(3) NULL,
	`id_compra` int NULL,
	`documento_facturacompra` Longtext NULL,
	`monto_facturacompra` Decimal(15,4) NULL,
	`iva_facturacompra` Decimal(15,4) NULL,
	`isr_facturacompra` Decimal(15,4) NULL,
	`iso_facturacompra` Decimal(15,4) NULL,
	`estado_facturacompra` int NULL,
 CONSTRAINT `PK_tbl_FacturasCompras` PRIMARY KEY 
(
	`id_facturacompra` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_FacturasVentas`(
	`id_facturaventa` int AUTO_INCREMENT NOT NULL,
	`fecha_facturaventa` datetime(3) NULL,
	`id_venta` int NULL,
	`documento_facturaventa` Longtext NULL,
	`monto_facturaventa` Decimal(15,4) NULL,
	`iva_facturaventa` Decimal(15,4) NULL,
	`isr_facturaventa` Decimal(15,4) NULL,
	`iso_facturaventa` Decimal(15,4) NULL,
	`estado_facturaventa` int NULL,
 CONSTRAINT `PK_tbl_FacturasVentas` PRIMARY KEY 
(
	`id_facturaventa` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_FormaPago`(
	`id_formaPago` int AUTO_INCREMENT NOT NULL,
	`descripcion_formaPago` nvarchar(50) NOT NULL,
 CONSTRAINT `PK_tbl_FormaPago` PRIMARY KEY 
(
	`id_formaPago` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_gastos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_gastos`(
	`id_gasto` int NOT NULL,
	`fecha_gasto` datetime(3) NOT NULL,
	`id_concepto` int NOT NULL,
	`descripcion_gasto` Longtext NOT NULL,
	`monto_gasto` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_gastos` PRIMARY KEY 
(
	`id_gasto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_ImagenProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_ImagenProducto`(
	`id_imageProducto` int AUTO_INCREMENT NOT NULL,
	`id_producto` int NOT NULL,
	`urlImagenProducto` Longtext NULL,
PRIMARY KEY 
(
	`id_imageProducto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_Inventario`(
	`id_inventario` int NOT NULL,
	`fecha_inventario` datetime(3) NOT NULL,
	`id_bodega` int NOT NULL,
	`estado_categoria` int NOT NULL,
 CONSTRAINT `PK_tbl_Inventario` PRIMARY KEY 
(
	`id_inventario` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_iva`(
	`id_iva` int NOT NULL,
	`descripcion_iva` Longtext NOT NULL,
	`tarifa_iva` Double NOT NULL,
 CONSTRAINT `PK_tbl_iva` PRIMARY KEY 
(
	`id_iva` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_Kardex`(
	`id_kardex` int AUTO_INCREMENT NOT NULL,
	`id_bodega` int NULL,
	`id_producto` int NULL,
	`fecha_kardex` datetime(3) NULL,
	`documento_kardex` nvarchar(50) NULL,
	`entrada_kardex` Double NULL,
	`salida_kardex` Double NULL,
	`saldo_kardex` Double NULL,
	`ultimoCosto_kardex` Decimal(15,4) NULL,
	`costoPromedio_kardex` Decimal(15,4) NULL,
 CONSTRAINT `PK_tbl_Kardex` PRIMARY KEY 
(
	`id_kardex` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_kit`(
	`id_kit` int AUTO_INCREMENT NOT NULL,
	`fecha_kit` datetime(3) NOT NULL,
	`fechavence_kit` datetime(3) NOT NULL,
	`id_producto` int NOT NULL,
	`precio_kit` Decimal(15,4) NOT NULL,
	`estado_kit` int NULL,
 CONSTRAINT `PK_tbl_kit` PRIMARY KEY 
(
	`id_kit` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_LogUusarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_LogUusarios`(
	`id_log` int AUTO_INCREMENT NOT NULL,
	`usuario_empleado` nvarchar(50) NULL,
	`log` Tinyint NULL,
	`ipLocal` nvarchar(100) NULL,
	`fecha_log` datetime(3) NULL,
 CONSTRAINT `PK__tbl_LogU__6CC851FEC084E4CD` PRIMARY KEY 
(
	`id_log` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_marca`(
	`id_marca` int NOT NULL,
	`nombre_marca` Longtext NULL,
 CONSTRAINT `PK_tbl_marca` PRIMARY KEY 
(
	`id_marca` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_MovimientoCuentaClientes]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_MovimientoCuentaClientes`(
	`id_movimiento` int AUTO_INCREMENT NOT NULL,
	`fecha_movimiento` datetime(3) NOT NULL,
	`id_cliente` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`descripcion_movimiento` Longtext NOT NULL,
	`debito_movimiento` Decimal(15,4) NOT NULL,
	`credito_movimiento` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_MovimientoCuentaClientes` PRIMARY KEY 
(
	`id_movimiento` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_MovimientoCuentaProveedores]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_MovimientoCuentaProveedores`(
	`id_movimiento` int AUTO_INCREMENT NOT NULL,
	`fecha_movimiento` datetime(3) NOT NULL,
	`id_proveedor` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`descripcion_movimiento` Longtext NOT NULL,
	`debito_movimiento` Decimal(15,4) NULL,
	`credito_movimiento` Decimal(15,4) NULL,
 CONSTRAINT `PK_tbl_MovimientoCuentaProveedores` PRIMARY KEY 
(
	`id_movimiento` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_municipio`(
	`id_municipio` int NOT NULL,
	`id_departamento` int NOT NULL,
	`nombre_municipio` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_municipio` PRIMARY KEY 
(
	`id_municipio` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_notaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_notaCredito`(
	`id_notaCredito` int NOT NULL,
	`fecha_notaCredito` datetime(3) NOT NULL,
	`id_cuentaCobro` int NOT NULL,
	`descripcion_notaCredito` Longtext NOT NULL,
	`monto_notaCredito` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_notaCredito` PRIMARY KEY 
(
	`id_notaCredito` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_notaDebito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_notaDebito`(
	`id_notaDebito` int NOT NULL,
	`fecha_notaDebito` datetime(3) NOT NULL,
	`id_cuentaCobro` int NOT NULL,
	`descripcion_notaDebito` Longtext NOT NULL,
	`monto_notaDebito` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_notaDebito` PRIMARY KEY 
(
	`id_notaDebito` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PagoCredito`(
	`id_pagocre` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`id_documento` int NOT NULL,
	`fecha_pagocre` datetime(3) NOT NULL,
	`id_cuentaCobro` int NOT NULL,
	`descripcion_pagocre` Longtext NOT NULL,
	`total_pagoCre` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_PagoCredito` PRIMARY KEY 
(
	`id_pagocre` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PagoCreditoContado`(
	`id_pagocrecont` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`id_documento` int NOT NULL,
	`fecha_pagocrecont` datetime(3) NOT NULL,
	`id_cliente` int NOT NULL,
	`descripcion_pagocrecont` Longtext NULL,
 CONSTRAINT `PK_tbl_PagoCreditoContado` PRIMARY KEY 
(
	`id_pagocrecont` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PagoCreditoCuotaExtra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PagoCreditoCuotaExtra`(
	`id_movimiento` int AUTO_INCREMENT NOT NULL,
	`id_formaPago` int NOT NULL,
	`id_documento` int NOT NULL,
	`fecha_movimiento` datetime(3) NOT NULL,
	`id_tabla` int NOT NULL,
	`descripcion_movimiento` Longtext NOT NULL,
	`monto_movimiento` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_PagoCreditoCuotaExtra` PRIMARY KEY 
(
	`id_movimiento` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PagoProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PagoProveedor`(
	`id_pago` int NOT NULL,
	`fecha_pago` datetime(3) NOT NULL,
	`id_formaPago` int NOT NULL,
	`id_documento` int NOT NULL,
	`id_proveedor` int NOT NULL,
	`descripcion_pago` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_PagosProveedor` PRIMARY KEY 
(
	`id_pago` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PagoProveedorDetalle]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PagoProveedorDetalle`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_pago` int NOT NULL,
	`id_CuentaPorPagar` int NOT NULL,
	`monto_pagodetalle` Decimal(15,4) NOT NULL,
 CONSTRAINT `PK_tbl_PagoProveedorDetalle` PRIMARY KEY 
(
	`id_linea` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_pais]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_pais`(
	`id_pais` int NOT NULL,
	`nombre_pais` Longtext NOT NULL,
	`codigo_pais` int NULL,
 CONSTRAINT `PK_tbl_pais` PRIMARY KEY 
(
	`id_pais` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_pedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_pedido`(
	`id_pedido` int NOT NULL,
	`fecha_pedido` datetime(3) NOT NULL,
	`id_bodega` int NOT NULL,
	`id_empleado` int NOT NULL,
	`id_cliente` int NOT NULL,
 CONSTRAINT `PK_tbl_pedido` PRIMARY KEY 
(
	`id_pedido` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PermisosRol`(
	`id_permisos` int NOT NULL,
	`id_rol` int NOT NULL,
	`formulario_permisos` Longtext NOT NULL,
	`puedeVer` Tinyint NULL,
	`puedeModificar` Tinyint NULL,
	`puedeBorrar` Tinyint NULL,
 CONSTRAINT `PK_tbl_PermisosRol` PRIMARY KEY 
(
	`id_permisos` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_PrecioCostoPorProductoByFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_PrecioCostoPorProductoByFecha`(
	`id_PreCostoProducto` int AUTO_INCREMENT NOT NULL,
	`fecha_PreCostoProducto` datetime(3) NULL,
	`id_producto` int NULL,
	`costo_producto` Decimal(15,4) NULL,
	`referencia_compra` nvarchar(50) NULL,
 CONSTRAINT `PK_tbl_PrecioCostoPorProductoByFecha` PRIMARY KEY 
(
	`id_PreCostoProducto` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_proforma`(
	`id_proforma` int NOT NULL,
	`fecha_proforma` datetime(3) NOT NULL,
	`id_cliente` int NOT NULL,
	`id_bodega` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`total_proforma` Decimal(15,4) NOT NULL,
	`id_documento` int NOT NULL,
	`observaciones_proforma` Longtext NULL,
	`documento` Longtext NULL,
	`usuario_proforma` Longtext NULL,
	`estado_proforma` int NULL,
 CONSTRAINT `PK_tbl_proforma` PRIMARY KEY 
(
	`id_proforma` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_provbancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_provbancos`(
	`id_proveedor` int NOT NULL,
	`id_banco` int NOT NULL,
	`numero_cuenta` Longtext NOT NULL,
	`nombre_cuenta` Longtext NOT NULL,
	`descripcion_cuenta` Longtext NULL,
 CONSTRAINT `PK_tbl_provbancos` PRIMARY KEY 
(
	`id_proveedor` ASC,
	`id_banco` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_reconteoInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_reconteoInventario`(
	`id_reconteo` int NOT NULL,
	`id_producto` int NOT NULL,
	`id_detalle_inventario` int NOT NULL,
	`conteo_detalle` int NOT NULL,
	`estadoConteoProducto` Longtext NULL,
PRIMARY KEY 
(
	`id_reconteo` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_rol`(
	`id_rol` int NOT NULL,
	`descripcion_rol` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_rol` PRIMARY KEY 
(
	`id_rol` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_salida`(
	`id_salida` int NOT NULL,
	`fecha_salida` datetime(3) NOT NULL,
	`id_concepto` int NOT NULL,
	`id_bodega` int NOT NULL,
 CONSTRAINT `PK_tbl_salida` PRIMARY KEY 
(
	`id_salida` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_SerieProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_SerieProducto`(
    `id_producto` int NOT NULL,
    `id_serie` int AUTO_INCREMENT NOT NULL,
    `numero_serie` Longtext NULL,
    `disponible_serie` Tinyint NULL,
    `cantidad_serie` Double NULL,
    `fechaVenceCompra_serie` datetime(3) NULL,
    `fechaVenceVenta_serie` datetime(3) NULL,
    PRIMARY KEY (`id_producto`, `id_serie`),
    UNIQUE KEY (`id_serie`)
);
/* SQLINES DEMO *** le [dbo].[tbl_sucursal]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_sucursal`(
	`id_sucursal` int NOT NULL,
	`nombre` Longtext NOT NULL,
	`id_pais` int NOT NULL,
	`id_departamento` int NOT NULL,
	`id_municipio` int NOT NULL,
	`telefono` Longtext NOT NULL,
	`email` Longtext NOT NULL,
	`estado_sucursal` int NOT NULL,
 CONSTRAINT `PK_tbl_sucursal` PRIMARY KEY 
(
	`id_sucursal` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_tablaProyectada]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_tablaProyectada`(
	`id_tabla` int AUTO_INCREMENT NOT NULL,
	`id_cuentaCobro` int NOT NULL,
	`nroCuota_tabla` int NOT NULL,
	`fechaVence_tabla` datetime(3) NOT NULL,
	`diasMora_tabla` Double NOT NULL,
	`cuotaProyectada_tabla` Decimal(15,4) NOT NULL,
	`cuotaInteresProyec_tabla` Decimal(15,4) NOT NULL,
	`cuotaCapital_tabla` Decimal(15,4) NOT NULL,
	`cuotaExtra_tabla` Decimal(15,4) NULL,
	`cuotaMora_tabla` Decimal(15,4) NOT NULL,
	`saldo_tabla` Decimal(15,4) NOT NULL,
	`estado_tabla` int NOT NULL,
 CONSTRAINT `PK_tbl_tablaProyectada` PRIMARY KEY 
(
	`id_tabla` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_TarjetaCredito`(
	`id_tarjeta` int NOT NULL,
	`descripcion_tarjeta` varchar(50) NOT NULL,
	`tarifa_tarjeta` Double NOT NULL,
 CONSTRAINT `PK_tbl_TarjetaCredito` PRIMARY KEY 
(
	`id_tarjeta` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_TipoDocumentoPagos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_TipoDocumentoPagos`(
	`id_tipoDocumentoPago` int NOT NULL,
	`descripcion_tipoDocumentoPago` nvarchar(50) NOT NULL,
 CONSTRAINT `PK_tbl_TipoDocumentoPagos` PRIMARY KEY 
(
	`id_tipoDocumentoPago` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_tipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_tipoEmpleado`(
	`id_templeado` int NOT NULL,
	`descripcion_templeado` Longtext NULL,
 CONSTRAINT `PK_tbl_tipoEmpleado` PRIMARY KEY 
(
	`id_templeado` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_TipoProducto`(
	`id_tproducto` int NOT NULL,
	`descripcion_tproducto` Longtext NULL,
 CONSTRAINT `PK_tbl_TipoProducto` PRIMARY KEY 
(
	`id_tproducto` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_traslado`(
	`id_traslado` int NOT NULL,
	`fecha_traslado` datetime(3) NOT NULL,
	`id_bodegaOrigen` int NOT NULL,
	`id_bodegaDestino` int NOT NULL,
	`descripcion_traslado` Longtext NOT NULL,
 CONSTRAINT `PK_tbl_traslado` PRIMARY KEY 
(
	`id_traslado` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tbl_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_UnidadMedida`(
	`id_medida` int NOT NULL,
	`descripcion_medida` nchar(10) NULL,
	`cantidad_medida` Double NULL,
 CONSTRAINT `PK_tbl_UnidadMedida` PRIMARY KEY 
(
	`id_medida` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[tbl_venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tbl_venta`(
	`id_venta` int NOT NULL,
	`fecha_venta` datetime(3) NOT NULL,
	`id_cliente` int NOT NULL,
	`id_bodega` int NOT NULL,
	`id_formaPago` int NOT NULL,
	`total_venta` Decimal(15,4) NOT NULL,
	`id_documento` int NULL,
	`documento` Longtext NULL,
	`observaciones_venta` Longtext NULL,
	`plazo_venta` int NULL,
	`boletaDeposito_venta` int NULL,
	`deposito_venta` Decimal(15,4) NULL,
	`diffDepoCompra_venta` Decimal(15,4) NULL,
	`usuario_venta` Longtext NULL,
	`cobrado_venta` Tinyint NULL,
 CONSTRAINT `PK_tbl_venta` PRIMARY KEY 
(
	`id_venta` ASC
) 
) ;
/* SQLINES DEMO *** le [dbo].[tblDetalleDevolucionProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `tblDetalleDevolucionProveedor`(
	`id_linea` int AUTO_INCREMENT NOT NULL,
	`id_devolucionProveedor` int NOT NULL,
	`id_producto` int NOT NULL,
	`descripcion_producto` Longtext NOT NULL,
	`precio_producto` Decimal(15,4) NOT NULL,
	`cantidad_producto` Double NOT NULL,
	`id_kardex` int NOT NULL,
	`porcentajeIva` Double NOT NULL,
	`porcentajeDescuento` Double NOT NULL,
 CONSTRAINT `PK_tblDetalleDevolucionProveedor` PRIMARY KEY 
(
	`id_linea` ASC
) 
);
ALTER TABLE `tbl_aldea_caserio` ADD  CONSTRAINT `FK_tbl_aldea_caserio_tbl_municipio` FOREIGN KEY(`id_municipio`)
REFERENCES `tbl_municipio` (`id_municipio`);
 
/* ALTER TABLE `tbl_aldea_caserio` CHECK CONSTRAINT `FK_tbl_aldea_caserio_tbl_municipio`; */
 
ALTER TABLE `tbl_barra` ADD  CONSTRAINT `FK_tbl_barra_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_barra` CHECK CONSTRAINT `FK_tbl_barra_tbl_Producto`; */
 
ALTER TABLE `tbl_bodega` ADD  CONSTRAINT `FK_tblbodega_tbl_sucursal` FOREIGN KEY(`id_sucursal`)
REFERENCES `tbl_sucursal` (`id_sucursal`);
 
/* ALTER TABLE `tbl_bodega` CHECK CONSTRAINT `FK_tblbodega_tbl_sucursal`; */
 
ALTER TABLE `tbl_bodegaProducto` ADD  CONSTRAINT `FK_tbl_bodegaProducto_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_bodegaProducto` CHECK CONSTRAINT `FK_tbl_bodegaProducto_tbl_bodega`; */
 
ALTER TABLE `tbl_bodegaProducto` ADD  CONSTRAINT `FK_tbl_bodegaProducto_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_bodegaProducto` CHECK CONSTRAINT `FK_tbl_bodegaProducto_tbl_Producto`; */
 
ALTER TABLE `tbl_CajaDiaria` ADD  CONSTRAINT `FK_tbl_CajaDiaria_tbl_cajas` FOREIGN KEY(`id_caja`)
REFERENCES `tbl_cajas` (`id_caja`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_CajaDiaria` CHECK CONSTRAINT `FK_tbl_CajaDiaria_tbl_cajas`; */
 
ALTER TABLE `tbl_cliente` ADD  CONSTRAINT `FK_tbl_cliente_tbl_municipio` FOREIGN KEY(`id_municipio`)
REFERENCES `tbl_municipio` (`id_municipio`);
 
/* ALTER TABLE `tbl_cliente` CHECK CONSTRAINT `FK_tbl_cliente_tbl_municipio`; */
 
ALTER TABLE `tbl_compra` ADD  CONSTRAINT `FK_tbl_compra_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_compra` CHECK CONSTRAINT `FK_tbl_compra_tbl_bodega`; */
 
ALTER TABLE `tbl_compra` ADD  CONSTRAINT `FK_tbl_compra_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_compra` CHECK CONSTRAINT `FK_tbl_compra_tbl_FormaPago`; */
 
ALTER TABLE `tbl_compra` ADD  CONSTRAINT `FK_tbl_compra_tbl_proveedor` FOREIGN KEY(`id_proveedor`)
REFERENCES `tbl_proveedor` (`id_proveedor`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_compra` CHECK CONSTRAINT `FK_tbl_compra_tbl_proveedor`; */
 
ALTER TABLE `tbl_ControlArqueo` ADD  CONSTRAINT `FK_tbl_ControlArqueo_tbl_cajas` FOREIGN KEY(`id_caja`)
REFERENCES `tbl_cajas` (`id_caja`);
 
/* ALTER TABLE `tbl_ControlArqueo` CHECK CONSTRAINT `FK_tbl_ControlArqueo_tbl_cajas`; */
 
ALTER TABLE `tbl_ControlArqueoCierre` ADD  CONSTRAINT `FK_tbl_ControlArqueoCierre_tbl_cajas` FOREIGN KEY(`id_caja`)
REFERENCES `tbl_cajas` (`id_caja`);
 
/* ALTER TABLE `tbl_ControlArqueoCierre` CHECK CONSTRAINT `FK_tbl_ControlArqueoCierre_tbl_cajas`; */
 
ALTER TABLE `tbl_ControlCajasApertura` ADD  CONSTRAINT `FK_tbl_ControlCajasApertura_tbl_cajas` FOREIGN KEY(`id_caja`)
REFERENCES `tbl_cajas` (`id_caja`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_ControlCajasApertura` CHECK CONSTRAINT `FK_tbl_ControlCajasApertura_tbl_cajas`; */
 
ALTER TABLE `tbl_departamento` ADD  CONSTRAINT `FK_tbl_departamento_tbl_pais` FOREIGN KEY(`id_pais`)
REFERENCES `tbl_pais` (`id_pais`);
 
/* ALTER TABLE `tbl_departamento` CHECK CONSTRAINT `FK_tbl_departamento_tbl_pais`; */
 
ALTER TABLE `tbl_detalle_inventario` ADD  CONSTRAINT `FK_tbl_detalle_inventario_tbl_Inventario` FOREIGN KEY(`id_inventario`)
REFERENCES `tbl_Inventario` (`id_inventario`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_detalle_inventario` CHECK CONSTRAINT `FK_tbl_detalle_inventario_tbl_Inventario`; */
 
ALTER TABLE `tbl_detalle_inventario` ADD  CONSTRAINT `FK_tbl_detalle_inventario_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_detalle_inventario` CHECK CONSTRAINT `FK_tbl_detalle_inventario_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleCompra` ADD  CONSTRAINT `FK_tbl_DetalleCompra_tbl_compra` FOREIGN KEY(`id_compra`)
REFERENCES `tbl_compra` (`id_compra`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetalleCompra` CHECK CONSTRAINT `FK_tbl_DetalleCompra_tbl_compra`; */
 
ALTER TABLE `tbl_DetalleCompra` ADD  CONSTRAINT `FK_tbl_DetalleCompra_tbl_Kardex1` FOREIGN KEY(`id_kardex`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_DetalleCompra` CHECK CONSTRAINT `FK_tbl_DetalleCompra_tbl_Kardex1`; */
 
ALTER TABLE `tbl_DetalleCompra` ADD  CONSTRAINT `FK_tbl_DetalleCompra_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_DetalleCompra` CHECK CONSTRAINT `FK_tbl_DetalleCompra_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleDevolucionCliente` ADD  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente` FOREIGN KEY(`id_devolucionCliente`)
REFERENCES `tbl_devolucionCliente` (`id_devolucionCliente`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetalleDevolucionCliente` CHECK CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente`; */
 
ALTER TABLE `tbl_DetalleDevolucionCliente` ADD  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Kardex` FOREIGN KEY(`id_kardex`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_DetalleDevolucionCliente` CHECK CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Kardex`; */
 
ALTER TABLE `tbl_DetalleDevolucionCliente` ADD  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_DetalleDevolucionCliente` CHECK CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleKit` ADD  CONSTRAINT `FK_tbl_DetalleKit_tbl_kit` FOREIGN KEY(`id_kit`)
REFERENCES `tbl_kit` (`id_kit`);
 
/* ALTER TABLE `tbl_DetalleKit` CHECK CONSTRAINT `FK_tbl_DetalleKit_tbl_kit`; */
 
ALTER TABLE `tbl_DetalleKit` ADD  CONSTRAINT `FK_tbl_DetalleKit_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_DetalleKit` CHECK CONSTRAINT `FK_tbl_DetalleKit_tbl_Producto`; */
 
ALTER TABLE `tbl_DetallePagoCredito` ADD  CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_PagoCredito` FOREIGN KEY(`id_pagocre`)
REFERENCES `tbl_PagoCredito` (`id_pagocre`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetallePagoCredito` CHECK CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_PagoCredito`; */
 
ALTER TABLE `tbl_DetallePagoCredito` ADD  CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_tablaProyectada` FOREIGN KEY(`id_tabla`)
REFERENCES `tbl_tablaProyectada` (`id_tabla`);
 
/* ALTER TABLE `tbl_DetallePagoCredito` CHECK CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_tablaProyectada`; */
 
ALTER TABLE `tbl_DetallePagoCreditoContado` ADD  CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar` FOREIGN KEY(`id_cuentaCobro`)
REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`);
 
/* ALTER TABLE `tbl_DetallePagoCreditoContado` CHECK CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar`; */
 
ALTER TABLE `tbl_DetallePagoCreditoContado` ADD  CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado` FOREIGN KEY(`id_pagocrecont`)
REFERENCES `tbl_PagoCreditoContado` (`id_pagocrecont`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetallePagoCreditoContado` CHECK CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado`; */
 
ALTER TABLE `tbl_detallePedido` ADD  CONSTRAINT `FK_tbl_detallePedido_tbl_pedido` FOREIGN KEY(`id_pedido`)
REFERENCES `tbl_pedido` (`id_pedido`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_detallePedido` CHECK CONSTRAINT `FK_tbl_detallePedido_tbl_pedido`; */
 
ALTER TABLE `tbl_detallePedido` ADD  CONSTRAINT `FK_tbl_detallePedido_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_detallePedido` CHECK CONSTRAINT `FK_tbl_detallePedido_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleProforma` ADD  CONSTRAINT `FK_tbl_DetalleProforma_tbl_proforma` FOREIGN KEY(`id_proforma`)
REFERENCES `tbl_proforma` (`id_proforma`);
 
/* ALTER TABLE `tbl_DetalleProforma` CHECK CONSTRAINT `FK_tbl_DetalleProforma_tbl_proforma`; */
 
ALTER TABLE `tbl_DetalleSalida` ADD  CONSTRAINT `FK_tbl_DetalleSalida_tbl_Kardex` FOREIGN KEY(`id_kardex`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_DetalleSalida` CHECK CONSTRAINT `FK_tbl_DetalleSalida_tbl_Kardex`; */
 
ALTER TABLE `tbl_DetalleSalida` ADD  CONSTRAINT `FK_tbl_DetalleSalida_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_DetalleSalida` CHECK CONSTRAINT `FK_tbl_DetalleSalida_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleSalida` ADD  CONSTRAINT `FK_tbl_DetalleSalida_tbl_salida` FOREIGN KEY(`id_salida`)
REFERENCES `tbl_salida` (`id_salida`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetalleSalida` CHECK CONSTRAINT `FK_tbl_DetalleSalida_tbl_salida`; */
 
ALTER TABLE `tbl_detalleTraslado` ADD  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex` FOREIGN KEY(`id_kardexOrigen`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_detalleTraslado` CHECK CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex`; */
 
ALTER TABLE `tbl_detalleTraslado` ADD  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex1` FOREIGN KEY(`id_KardexDestino`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_detalleTraslado` CHECK CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex1`; */
 
ALTER TABLE `tbl_detalleTraslado` ADD  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_detalleTraslado` CHECK CONSTRAINT `FK_tbl_detalleTraslado_tbl_Producto`; */
 
ALTER TABLE `tbl_detalleTraslado` ADD  CONSTRAINT `FK_tbl_detalleTraslado_tbl_traslado` FOREIGN KEY(`id_traslado`)
REFERENCES `tbl_traslado` (`id_traslado`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_detalleTraslado` CHECK CONSTRAINT `FK_tbl_detalleTraslado_tbl_traslado`; */
 
ALTER TABLE `tbl_DetalleVenta` ADD  CONSTRAINT `FK_tbl_DetalleVenta_tbl_Kardex` FOREIGN KEY(`id_kardex`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tbl_DetalleVenta` CHECK CONSTRAINT `FK_tbl_DetalleVenta_tbl_Kardex`; */
 
ALTER TABLE `tbl_DetalleVenta` ADD  CONSTRAINT `FK_tbl_DetalleVenta_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_DetalleVenta` CHECK CONSTRAINT `FK_tbl_DetalleVenta_tbl_Producto`; */
 
ALTER TABLE `tbl_DetalleVenta` ADD  CONSTRAINT `FK_tbl_DetalleVenta_tbl_venta` FOREIGN KEY(`id_venta`)
REFERENCES `tbl_venta` (`id_venta`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_DetalleVenta` CHECK CONSTRAINT `FK_tbl_DetalleVenta_tbl_venta`; */
 
ALTER TABLE `tbl_devolucionCliente` ADD  CONSTRAINT `FK_tbl_devolucionCliente_tbl_venta` FOREIGN KEY(`id_venta`)
REFERENCES `tbl_venta` (`id_venta`);
 
/* ALTER TABLE `tbl_devolucionCliente` CHECK CONSTRAINT `FK_tbl_devolucionCliente_tbl_venta`; */
 
ALTER TABLE `tbl_devolucionProveedor` ADD  CONSTRAINT `FK_tbl_devolucionProveedor_tbl_compra` FOREIGN KEY(`id_compra`)
REFERENCES `tbl_compra` (`id_compra`);
 
/* ALTER TABLE `tbl_devolucionProveedor` CHECK CONSTRAINT `FK_tbl_devolucionProveedor_tbl_compra`; */
 
ALTER TABLE `tbl_Documentos` ADD  CONSTRAINT `FK_tbl_Documentos_tbl_TipoDocumentoPagos` FOREIGN KEY(`id_tipoDocumentoPago`)
REFERENCES `tbl_TipoDocumentoPagos` (`id_tipoDocumentoPago`);
 
/* ALTER TABLE `tbl_Documentos` CHECK CONSTRAINT `FK_tbl_Documentos_tbl_TipoDocumentoPagos`; */
 
ALTER TABLE `tbl_empleado` ADD  CONSTRAINT `FK_tbl_empleado_tbl_cajas` FOREIGN KEY(`id_caja`)
REFERENCES `tbl_cajas` (`id_caja`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_empleado` CHECK CONSTRAINT `FK_tbl_empleado_tbl_cajas`; */
 
ALTER TABLE `tbl_empleado` ADD  CONSTRAINT `FK_tbl_empleado_tbl_municipio` FOREIGN KEY(`id_municipio`)
REFERENCES `tbl_municipio` (`id_municipio`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_empleado` CHECK CONSTRAINT `FK_tbl_empleado_tbl_municipio`; */
 
ALTER TABLE `tbl_empleado` ADD  CONSTRAINT `FK_tbl_empleado_tbl_rol` FOREIGN KEY(`id_rol`)
REFERENCES `tbl_rol` (`id_rol`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_empleado` CHECK CONSTRAINT `FK_tbl_empleado_tbl_rol`; */
 
ALTER TABLE `tbl_empleado` ADD  CONSTRAINT `FK_tbl_empleado_tbl_tipoEmpleado` FOREIGN KEY(`id_templeado`)
REFERENCES `tbl_tipoEmpleado` (`id_templeado`);
 
/* ALTER TABLE `tbl_empleado` CHECK CONSTRAINT `FK_tbl_empleado_tbl_tipoEmpleado`; */
 
ALTER TABLE `tbl_FacturasCompras` ADD  CONSTRAINT `FK_tbl_FacturasCompras_tbl_compra` FOREIGN KEY(`id_compra`)
REFERENCES `tbl_compra` (`id_compra`);
 
/* ALTER TABLE `tbl_FacturasCompras` CHECK CONSTRAINT `FK_tbl_FacturasCompras_tbl_compra`; */
 
ALTER TABLE `tbl_FacturasVentas` ADD  CONSTRAINT `FK_tbl_FacturasVentas_tbl_venta` FOREIGN KEY(`id_venta`)
REFERENCES `tbl_venta` (`id_venta`);
 
/* ALTER TABLE `tbl_FacturasVentas` CHECK CONSTRAINT `FK_tbl_FacturasVentas_tbl_venta`; */
 
ALTER TABLE `tbl_gastos` ADD  CONSTRAINT `FK_tbl_gastos_tbl_conceptos` FOREIGN KEY(`id_concepto`)
REFERENCES `tbl_conceptos` (`id_concepto`);
 
/* ALTER TABLE `tbl_gastos` CHECK CONSTRAINT `FK_tbl_gastos_tbl_conceptos`; */
 
ALTER TABLE `tbl_ImagenProducto` ADD FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
ALTER TABLE `tbl_Inventario` ADD  CONSTRAINT `FK_tbl_Inventario_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_Inventario` CHECK CONSTRAINT `FK_tbl_Inventario_tbl_bodega`; */
 
ALTER TABLE `tbl_Kardex` ADD  CONSTRAINT `FK_tbl_Kardex_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_Kardex` CHECK CONSTRAINT `FK_tbl_Kardex_tbl_bodega`; */
 
ALTER TABLE `tbl_Kardex` ADD  CONSTRAINT `FK_tbl_Kardex_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_Kardex` CHECK CONSTRAINT `FK_tbl_Kardex_tbl_Producto`; */
 
ALTER TABLE `tbl_kit` ADD  CONSTRAINT `FK_tbl_kit_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_kit` CHECK CONSTRAINT `FK_tbl_kit_tbl_Producto`; */
 
ALTER TABLE `tbl_MovimientoCuentaClientes` ADD  CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_cliente` FOREIGN KEY(`id_cliente`)
REFERENCES `tbl_cliente` (`id_cliente`);
 
/* ALTER TABLE `tbl_MovimientoCuentaClientes` CHECK CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_cliente`; */
 
ALTER TABLE `tbl_MovimientoCuentaClientes` ADD  CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_MovimientoCuentaClientes` CHECK CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_FormaPago`; */
 
ALTER TABLE `tbl_MovimientoCuentaProveedores` ADD  CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_MovimientoCuentaProveedores` CHECK CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago`; */
 
ALTER TABLE `tbl_MovimientoCuentaProveedores` ADD  CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_proveedor` FOREIGN KEY(`id_proveedor`)
REFERENCES `tbl_proveedor` (`id_proveedor`);
 
/* ALTER TABLE `tbl_MovimientoCuentaProveedores` CHECK CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_proveedor`; */
 
ALTER TABLE `tbl_municipio` ADD  CONSTRAINT `FK_tbl_municipio_tbl_departamento` FOREIGN KEY(`id_departamento`)
REFERENCES `tbl_departamento` (`id_departamento`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_municipio` CHECK CONSTRAINT `FK_tbl_municipio_tbl_departamento`; */
 
ALTER TABLE `tbl_notaCredito` ADD  CONSTRAINT `FK_tbl_notaCredito_tbl_cuentasPorCobrar` FOREIGN KEY(`id_cuentaCobro`)
REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_notaCredito` CHECK CONSTRAINT `FK_tbl_notaCredito_tbl_cuentasPorCobrar`; */
 
ALTER TABLE `tbl_notaDebito` ADD  CONSTRAINT `FK_tbl_notaDebito_tbl_cuentasPorCobrar` FOREIGN KEY(`id_cuentaCobro`)
REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_notaDebito` CHECK CONSTRAINT `FK_tbl_notaDebito_tbl_cuentasPorCobrar`; */
 
ALTER TABLE `tbl_PagoCredito` ADD  CONSTRAINT `FK_tbl_PagoCredito_tbl_cuentasPorCobrar` FOREIGN KEY(`id_cuentaCobro`)
REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PagoCredito` CHECK CONSTRAINT `FK_tbl_PagoCredito_tbl_cuentasPorCobrar`; */
 
ALTER TABLE `tbl_PagoCredito` ADD  CONSTRAINT `FK_tbl_PagoCredito_tbl_Documentos` FOREIGN KEY(`id_documento`)
REFERENCES `tbl_Documentos` (`id_documento`);
 
/* ALTER TABLE `tbl_PagoCredito` CHECK CONSTRAINT `FK_tbl_PagoCredito_tbl_Documentos`; */
 
ALTER TABLE `tbl_PagoCredito` ADD  CONSTRAINT `FK_tbl_PagoCredito_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_PagoCredito` CHECK CONSTRAINT `FK_tbl_PagoCredito_tbl_FormaPago`; */
 
ALTER TABLE `tbl_PagoCreditoContado` ADD  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_cliente` FOREIGN KEY(`id_cliente`)
REFERENCES `tbl_cliente` (`id_cliente`);
 
/* ALTER TABLE `tbl_PagoCreditoContado` CHECK CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_cliente`; */
 
ALTER TABLE `tbl_PagoCreditoContado` ADD  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_Documentos` FOREIGN KEY(`id_documento`)
REFERENCES `tbl_Documentos` (`id_documento`);
 
/* ALTER TABLE `tbl_PagoCreditoContado` CHECK CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_Documentos`; */
 
ALTER TABLE `tbl_PagoCreditoContado` ADD  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_PagoCreditoContado` CHECK CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_FormaPago`; */
 
ALTER TABLE `tbl_PagoCreditoCuotaExtra` ADD  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos` FOREIGN KEY(`id_documento`)
REFERENCES `tbl_Documentos` (`id_documento`);
 
/* ALTER TABLE `tbl_PagoCreditoCuotaExtra` CHECK CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos`; */
 
ALTER TABLE `tbl_PagoCreditoCuotaExtra` ADD  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_PagoCreditoCuotaExtra` CHECK CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago`; */
 
ALTER TABLE `tbl_PagoCreditoCuotaExtra` ADD  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada` FOREIGN KEY(`id_tabla`)
REFERENCES `tbl_tablaProyectada` (`id_tabla`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PagoCreditoCuotaExtra` CHECK CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada`; */
 
ALTER TABLE `tbl_PagoProveedor` ADD  CONSTRAINT `FK_tbl_PagoProveedor_tbl_Documentos` FOREIGN KEY(`id_documento`)
REFERENCES `tbl_Documentos` (`id_documento`);
 
/* ALTER TABLE `tbl_PagoProveedor` CHECK CONSTRAINT `FK_tbl_PagoProveedor_tbl_Documentos`; */
 
ALTER TABLE `tbl_PagoProveedor` ADD  CONSTRAINT `FK_tbl_PagoProveedor_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_PagoProveedor` CHECK CONSTRAINT `FK_tbl_PagoProveedor_tbl_FormaPago`; */
 
ALTER TABLE `tbl_PagoProveedor` ADD  CONSTRAINT `FK_tbl_PagoProveedor_tbl_proveedor` FOREIGN KEY(`id_proveedor`)
REFERENCES `tbl_proveedor` (`id_proveedor`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PagoProveedor` CHECK CONSTRAINT `FK_tbl_PagoProveedor_tbl_proveedor`; */
 
ALTER TABLE `tbl_PagoProveedorDetalle` ADD  CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar` FOREIGN KEY(`id_CuentaPorPagar`)
REFERENCES `tbl_CuentaPorPagar` (`id_CuentaPorPagar`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PagoProveedorDetalle` CHECK CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar`; */
 
ALTER TABLE `tbl_PagoProveedorDetalle` ADD  CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor` FOREIGN KEY(`id_pago`)
REFERENCES `tbl_PagoProveedor` (`id_pago`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PagoProveedorDetalle` CHECK CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor`; */
 
ALTER TABLE `tbl_pedido` ADD  CONSTRAINT `FK_tbl_pedido_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_pedido` CHECK CONSTRAINT `FK_tbl_pedido_tbl_bodega`; */
 
ALTER TABLE `tbl_pedido` ADD  CONSTRAINT `FK_tbl_pedido_tbl_cliente` FOREIGN KEY(`id_cliente`)
REFERENCES `tbl_cliente` (`id_cliente`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_pedido` CHECK CONSTRAINT `FK_tbl_pedido_tbl_cliente`; */
 
ALTER TABLE `tbl_pedido` ADD  CONSTRAINT `FK_tbl_pedido_tbl_empleado` FOREIGN KEY(`id_empleado`)
REFERENCES `tbl_empleado` (`id_empleado`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_pedido` CHECK CONSTRAINT `FK_tbl_pedido_tbl_empleado`; */
 
ALTER TABLE `tbl_PermisosRol` ADD  CONSTRAINT `FK_tbl_PermisosRol_tbl_rol` FOREIGN KEY(`id_rol`)
REFERENCES `tbl_rol` (`id_rol`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_PermisosRol` CHECK CONSTRAINT `FK_tbl_PermisosRol_tbl_rol`; */
 
ALTER TABLE `tbl_PrecioCostoPorProductoByFecha` ADD  CONSTRAINT `FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tbl_PrecioCostoPorProductoByFecha` CHECK CONSTRAINT `FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto`; */
 
ALTER TABLE `tbl_Producto` ADD  CONSTRAINT `FK_tbl_Producto_Sub_Categoria` FOREIGN KEY(`id_Sub_Categoria`)
REFERENCES `tbl_Sub_Categoria` (`id_subcategoria`);
 
/* ALTER TABLE `tbl_Producto` CHECK CONSTRAINT `FK_tbl_Producto_Sub_Categoria`; */
 
ALTER TABLE `tbl_Producto` ADD  CONSTRAINT `FK_tbl_Producto_tbl_iva` FOREIGN KEY(`id_iva`)
REFERENCES `tbl_iva` (`id_iva`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_Producto` CHECK CONSTRAINT `FK_tbl_Producto_tbl_iva`; */
 
ALTER TABLE `tbl_Producto` ADD  CONSTRAINT `FK_tbl_Producto_tbl_marca` FOREIGN KEY(`id_marca`)
REFERENCES `tbl_marca` (`id_marca`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_Producto` CHECK CONSTRAINT `FK_tbl_Producto_tbl_marca`; */
 
ALTER TABLE `tbl_Producto` ADD  CONSTRAINT `FK_tbl_Producto_tbl_TipoProducto` FOREIGN KEY(`id_tproducto`)
REFERENCES `tbl_TipoProducto` (`id_tproducto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_Producto` CHECK CONSTRAINT `FK_tbl_Producto_tbl_TipoProducto`; */
 
ALTER TABLE `tbl_ProductUnidPrecioVenta` ADD  CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_ProductUnidPrecioVenta` CHECK CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_Producto`; */
 
ALTER TABLE `tbl_ProductUnidPrecioVenta` ADD  CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida` FOREIGN KEY(`id_medida`)
REFERENCES `tbl_UnidadMedida` (`id_medida`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_ProductUnidPrecioVenta` CHECK CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida`; */
 
ALTER TABLE `tbl_proforma` ADD  CONSTRAINT `FK_tbl_proforma_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_proforma` CHECK CONSTRAINT `FK_tbl_proforma_tbl_bodega`; */
 
ALTER TABLE `tbl_proforma` ADD  CONSTRAINT `FK_tbl_proforma_tbl_cliente` FOREIGN KEY(`id_cliente`)
REFERENCES `tbl_cliente` (`id_cliente`);
 
/* ALTER TABLE `tbl_proforma` CHECK CONSTRAINT `FK_tbl_proforma_tbl_cliente`; */
 
ALTER TABLE `tbl_proforma` ADD  CONSTRAINT `FK_tbl_proforma_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_proforma` CHECK CONSTRAINT `FK_tbl_proforma_tbl_FormaPago`; */
 
ALTER TABLE `tbl_provbancos` ADD  CONSTRAINT `FK_tbl_provbancos_tbl_banco` FOREIGN KEY(`id_banco`)
REFERENCES `tbl_banco` (`id_banco`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_provbancos` CHECK CONSTRAINT `FK_tbl_provbancos_tbl_banco`; */
 
ALTER TABLE `tbl_provbancos` ADD  CONSTRAINT `FK_tbl_provbancos_tbl_proveedor` FOREIGN KEY(`id_proveedor`)
REFERENCES `tbl_proveedor` (`id_proveedor`);
 
/* ALTER TABLE `tbl_provbancos` CHECK CONSTRAINT `FK_tbl_provbancos_tbl_proveedor`; */
 
ALTER TABLE `tbl_proveedor` ADD  CONSTRAINT `FK_tbl_proveedor_tbl_iva` FOREIGN KEY(`id_iva`)
REFERENCES `tbl_iva` (`id_iva`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_proveedor` CHECK CONSTRAINT `FK_tbl_proveedor_tbl_iva`; */
 
ALTER TABLE `tbl_proveedor` ADD  CONSTRAINT `FK_tbl_proveedor_tbl_municipio` FOREIGN KEY(`id_municipio`)
REFERENCES `tbl_municipio` (`id_municipio`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_proveedor` CHECK CONSTRAINT `FK_tbl_proveedor_tbl_municipio`; */
 
ALTER TABLE `tbl_reconteoInventario` ADD FOREIGN KEY(`id_detalle_inventario`)
REFERENCES `tbl_detalle_inventario` (`id_linea`);
 
ALTER TABLE `tbl_reconteoInventario` ADD FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
ALTER TABLE `tbl_salida` ADD  CONSTRAINT `FK_tbl_salida_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_salida` CHECK CONSTRAINT `FK_tbl_salida_tbl_bodega`; */
 
ALTER TABLE `tbl_salida` ADD  CONSTRAINT `FK_tbl_salida_tbl_conceptos` FOREIGN KEY(`id_concepto`)
REFERENCES `tbl_conceptos` (`id_concepto`);
 
/* ALTER TABLE `tbl_salida` CHECK CONSTRAINT `FK_tbl_salida_tbl_conceptos`; */
 
ALTER TABLE `tbl_SerieProducto` ADD  CONSTRAINT `FK_tbl_SerieProducto_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_SerieProducto` CHECK CONSTRAINT `FK_tbl_SerieProducto_tbl_Producto`; */
 
ALTER TABLE `tbl_Sub_Categoria` ADD  CONSTRAINT `FK_Sub_Categoria_tbl_categoria` FOREIGN KEY(`id_categoria`)
REFERENCES `tbl_categoria` (`id_categoria`);
 
/* ALTER TABLE `tbl_Sub_Categoria` CHECK CONSTRAINT `FK_Sub_Categoria_tbl_categoria`; */
 
ALTER TABLE `tbl_sucursal` ADD FOREIGN KEY(`id_departamento`)
REFERENCES `tbl_departamento` (`id_departamento`);
 
ALTER TABLE `tbl_sucursal` ADD FOREIGN KEY(`id_municipio`)
REFERENCES `tbl_municipio` (`id_municipio`);
 
ALTER TABLE `tbl_sucursal` ADD FOREIGN KEY(`id_pais`)
REFERENCES `tbl_pais` (`id_pais`);
 
ALTER TABLE `tbl_tablaProyectada` ADD  CONSTRAINT `FK_tbl_tablaProyectada_tbl_cuentasPorCobrar` FOREIGN KEY(`id_cuentaCobro`)
REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tbl_tablaProyectada` CHECK CONSTRAINT `FK_tbl_tablaProyectada_tbl_cuentasPorCobrar`; */
 
ALTER TABLE `tbl_traslado` ADD  CONSTRAINT `FK_tbl_traslado_tbl_bodega` FOREIGN KEY(`id_bodegaOrigen`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_traslado` CHECK CONSTRAINT `FK_tbl_traslado_tbl_bodega`; */
 
ALTER TABLE `tbl_traslado` ADD  CONSTRAINT `FK_tbl_traslado_tbl_bodega1` FOREIGN KEY(`id_bodegaDestino`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_traslado` CHECK CONSTRAINT `FK_tbl_traslado_tbl_bodega1`; */
 
ALTER TABLE `tbl_venta` ADD  CONSTRAINT `FK_tbl_venta_tbl_bodega` FOREIGN KEY(`id_bodega`)
REFERENCES `tbl_bodega` (`id_bodega`);
 
/* ALTER TABLE `tbl_venta` CHECK CONSTRAINT `FK_tbl_venta_tbl_bodega`; */
 
ALTER TABLE `tbl_venta` ADD  CONSTRAINT `FK_tbl_venta_tbl_cliente` FOREIGN KEY(`id_cliente`)
REFERENCES `tbl_cliente` (`id_cliente`);
 
/* ALTER TABLE `tbl_venta` CHECK CONSTRAINT `FK_tbl_venta_tbl_cliente`; */
 
ALTER TABLE `tbl_venta` ADD  CONSTRAINT `FK_tbl_venta_tbl_Documentos` FOREIGN KEY(`id_documento`)
REFERENCES `tbl_Documentos` (`id_documento`);
 
/* ALTER TABLE `tbl_venta` CHECK CONSTRAINT `FK_tbl_venta_tbl_Documentos`; */
 
ALTER TABLE `tbl_venta` ADD  CONSTRAINT `FK_tbl_venta_tbl_FormaPago` FOREIGN KEY(`id_formaPago`)
REFERENCES `tbl_FormaPago` (`id_formaPago`);
 
/* ALTER TABLE `tbl_venta` CHECK CONSTRAINT `FK_tbl_venta_tbl_FormaPago`; */
 
ALTER TABLE `tblDetalleDevolucionProveedor` ADD  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor` FOREIGN KEY(`id_devolucionProveedor`)
REFERENCES `tbl_devolucionProveedor` (`id_devolucionProveedor`)
ON UPDATE CASCADE
ON DELETE CASCADE;
 
/* ALTER TABLE `tblDetalleDevolucionProveedor` CHECK CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor`; */
 
ALTER TABLE `tblDetalleDevolucionProveedor` ADD  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Kardex` FOREIGN KEY(`id_kardex`)
REFERENCES `tbl_Kardex` (`id_kardex`);
 
/* ALTER TABLE `tblDetalleDevolucionProveedor` CHECK CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Kardex`; */
 
ALTER TABLE `tblDetalleDevolucionProveedor` ADD  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Producto` FOREIGN KEY(`id_producto`)
REFERENCES `tbl_Producto` (`id_producto`);
 
/* ALTER TABLE `tblDetalleDevolucionProveedor` CHECK CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Producto`; */
 
/* SQLINES DEMO *** redProcedure [dbo].[DeleteBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `DeleteBarra`
(
	p_barra bigint
)
BEGIN
DELETE from tbl_barra WHERE barra = p_barra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteBarra`
(
	p_barra bigint
)
BEGIN
SELECT 1 FROM tbl_barra WHERE barra = p_barra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteCompra`
(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_compra 
WHERE documento_compra = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteFacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteFacturasCompras`
(
	p_documento longtext
)
BEGIN
SELECT 1 FROM tbl_FacturasCompras WHERE documento_facturacompra = p_documento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteKit`
(
	p_criterio varchar(50)
)
BEGIN
SELECT 1 FROM tbl_kit
WHERE estado_kit = 1 and id_producto = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteListaProductoPrecioVentaJoin]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteListaProductoPrecioVentaJoin`
(
	p_criterio nvarchar(50)
)
BEGIN
SELECT COUNT(id_producto) AS IDProducto FROM tbl_ProductUnidPrecioVenta
WHERE	id_producto = p_criterio
HAVING	COUNT(id_producto)> 1;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExistePoveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExistePoveedor`
(
	p_criterio VARCHAR(50)
)
BEGIN
SELECT 1 FROM tbl_proveedor WHERE nit_proveedor = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteProforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteProforma`
(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_proforma
WHERE id_proforma = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteTarjeta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteTarjeta`
(
	p_descripcion VARCHAR(50)
)
BEGIN
SELECT 1 FROM tbl_TarjetaCredito WHERE descripcion_tarjeta = p_descripcion;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteTipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteTipoEmpleado`
(
	p_Descrip LONGTEXT
)
BEGIN
SELECT 1 FROM tbl_tipoEmpleado WHERE descripcion_templeado = p_Descrip;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteUsuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteUsuario`
(
	p_IDUsuario nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_empleado
WHERE usuario_empleado = p_IDUsuario
AND estado_empleado =1;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ExisteVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ExisteVenta`
(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_venta 
WHERE documento = p_criterio;
END;
//

DELIMITER ;

/* SQLINES DEMO *** redProcedure [dbo].[ObternerEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ObternerEmpleado`()
BEGIN
SELECT *
FROM tbl_empleado
WHERE estado_empleado = 'activo'
and usuario_empleado = 0
ORDER BY usuario_empleado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_AumentarStock]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_AumentarStock`
(
    p_cantidad DOUBLE,
    p_idBodega INT, 
    p_idProducto INT
)
BEGIN
    Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
	Start Transaction;
    
    UPDATE `tbl_bodegaProducto`
    SET
        stock_producto = stock_producto + p_cantidad
    WHERE
        id_bodega = p_idBodega AND id_producto = p_idProducto;

    COMMIT;
END
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Banco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Banco`
(
    p_descripcion LONGTEXT,
    p_id INT
)
BEGIN
    Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
	Start Transaction;
    
    UPDATE `tbl_banco`
    SET
        descripcion_banco = p_descripcion
    WHERE
        id_banco = p_id;

    COMMIT;
END
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Barra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Barra`
(
 p_barra bigint,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_barra`
			SET

			barra = p_barra

			WHERE
			id_producto = p_id;

		Commit;
	End
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Bodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Bodega`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_bodega`
			SET

			nombre_bodega= p_descripcion

			WHERE
			id_bodega = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_BodegaProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_BodegaProducto`
(
 p_IdBodega int,
 p_IdProducto int,
 p_minimo double,
 p_maximo double,
 p_dias   int,
 p_cantidad double
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_bodegaProducto`
			SET
			
			minimo_producto = p_minimo, 
			maximo_producto = p_maximo, 
			diasReposicion_producto = p_dias, 
			cantidadMinima_producto = p_cantidad

			WHERE
			id_bodega = p_IdBodega AND 
			id_producto =p_IdProducto;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Caja]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Caja`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_cajas`
			SET

			descripcion_caja = p_descripcion

			WHERE
			id_caja = p_id;

		Commit;
	End
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_CajaDiaria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_CajaDiaria`
(
 p_id int,
 p_fecha datetime(3),
 p_idcaja int,
 p_montoApertura decimal(15,4),
 p_ingreso		decimal(15,4),
 p_ingresoCheque decimal(15,4),
 p_ingresoTarjeta decimal(15,4),
 p_egreso		decimal(15,4),
 p_cierre		decimal(15,4),
 p_saldo			decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_CajaDiaria`
			SET

			fecha_movimiento = p_fecha,
			id_caja = p_idcaja,
			montoApertura_movimiento = p_montoApertura,
			ingreso_movimiento = p_ingreso,
			ingresoCheque_movimiento = p_ingresoCheque,
			ingresoTarjeta_movimiento = p_ingresoTarjeta,
			egreso_movimiento = p_egreso,
			cierre_movimiento = p_cierre,
			saldo_movimiento = p_saldo

			WHERE
			id_movimiento = p_id AND 
			estado_movimiento = 1;  /* SQLINES DEMO *** o y 0 es inactivo**/

		Commit;
	End
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_CalculoPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_CalculoPrecioVenta`
(
p_id	 INT,
p_fecha DATETIME(3),
p_descripcion LONGTEXT,
p_precioCosto DECIMAL(15,4),
p_envio	DECIMAL(15,4),
p_ganaciaPromedio DOUBLE,
p_costoTotal DECIMAL(15,4),
p_precioVenta	DECIMAL(15,4),
p_precioSinIvaVenta DECIMAL(15,4),
p_ivaCalculado DECIMAL(15,4),
p_isrCalculado DECIMAL(15,4),
p_isoCalculado DECIMAL(15,4),
p_totalImpuesto DECIMAL(15,4),
p_gananciaReal DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_calculoPrecioVenta`
			SET

			fecha_calculo = p_fecha,
			descripcion_calculo = p_descripcion,
			precio_costo = p_precioCosto,
			envio_costo = p_envio,
			ganacia_promedio = p_ganaciaPromedio,
			costo_total = p_costoTotal,
			precio_venta = p_precioVenta,
			precioSinIva_venta = p_precioSinIvaVenta,
			iva_calculado = p_ivaCalculado,
			isr_calculado = p_isrCalculado,
			iso_calculado = p_isoCalculado,
			total_impuesto = p_totalImpuesto,
			ganancia_real = p_gananciaReal

			WHERE
			id_calculo = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Categoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Categoria`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_categoria`
			SET

			descripcion_categoria = p_descripcion

			WHERE
			id_categoria = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Cliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Cliente`
(
p_id INT,
p_nit LONGTEXT,
p_nombre LONGTEXT,
p_idMunicipio int,
p_direccion LONGTEXT,
p_telefono1 NVARCHAR(20),
p_telefono2 NVARCHAR(20),
p_email LONGTEXT,
p_notas LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_cliente`
			SET

			nit_cliente = p_nit,
			nombre_cliente = p_nombre,
			id_municipio = p_idMunicipio,
			direccion_cliente = p_direccion,
			telefono1_cliente = p_telefono1,
			telefono2_cliente = p_telefono2,
			email_cliente = p_email,
			notas_cliente = p_notas

			WHERE
			id_cliente = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Compra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Compra`
(
p_id INT,
p_fechaCompra DATETIME(3),
p_idProveedor INT,
p_idBodega INT,
p_idFormaPago INT,
p_documentoCompra LONGTEXT,
p_totalCompra DECIMAL(15,4),
p_notas LONGTEXT,
p_plazo INT,
p_boleta LONGTEXT,
p_deposito DECIMAL(15,4),
p_diff DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_compra`
			SET
	
				fecha_compra = p_fechaCompra,
				id_proveedor = p_idProveedor,
				id_bodega = p_idBodega,
				id_formaPago = p_idFormaPago,
				documento_compra = p_documentoCompra,
				total_compra = p_totalCompra,
			  notas_compra = p_notas,
				plazo_compra = p_plazo,
				boletaDeposito_compra = p_boleta,
				deposito_compra = p_deposito,
				diffDepoCompra_compra = p_diff

			WHERE

				id_compra = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Conceptos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Conceptos`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_conceptos`
			SET

			descripcion_concepto = p_descripcion

			WHERE
			id_concepto = p_id;

		Commit;
	End

//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_ControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 DELIMITER //

 CREATE PROCEDURE `SP_Actualiza_ControlArqueo`
(
 p_IDControl	INT,
 p_Fecha	DATETIME(3),
 p_id_caja	INT,
 p_Cantidad200 INT, 
 p_Total200 DECIMAL(18,0),	
 p_Cantidad100	INT,
 p_Total100	decimal(18, 0),
 p_Cantidad50	INT,
 p_Total50	decimal(18, 0),
 p_Cantidad20	INT,
 p_Total20	decimal(18, 0),
 p_Cantidad10	INT,
 p_Total10	decimal(18, 0),
 p_Cantidad5	INT,
 p_Total5	decimal(18, 0),
 p_Cantidad1	INT,
 p_Total1	decimal(18, 0),
 p_Cantidad050	INT,
 p_Total050	decimal(18, 0),
 p_Cantidad025	INT,
 p_Total025	decimal(18, 0),
 p_Cantidad010	INT,
 p_Total010	decimal(18, 0),
 p_Cantidad005	INT,
 p_Total005	decimal(18, 0),
 p_Cantidad001	INT,
 p_Total001	decimal(18, 0),
 p_GranTotal	decimal(18, 0)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_ControlArqueo
			SET

			fecha_control = p_Fecha, 
			id_caja = p_id_caja, 
			Cantidad200 = p_Cantidad200,
			Total200 = p_Total200,
			Cantidad100 = p_Cantidad100,
			Total100 = p_Total100,
			Cantidad50 = p_Cantidad50,
			Total50 = p_Total50,
			Cantidad20 = p_Cantidad20,
			Total20 = p_Total20,
			Cantidad10 = p_Cantidad10,
			Total10 = p_Total10,
			Cantidad5 = p_Cantidad5,
			Total5 = p_Total5,
			Cantidad1 = p_Cantidad1,
			Total1 = p_Total1,
			Cantidad050 = p_Cantidad050,
			Total050 = p_Total050,
			Cantidad025 = p_Cantidad025,
			Total025 = p_Total025,
			Cantidad010 = p_Cantidad010,
			Total010 = p_Total010,
			cantidad005 = p_Cantidad005,
			Total005 = p_Total005,
			Cantidad001 = p_Cantidad001,
			Total001 = p_Total001,
			GranTotal = p_GranTotal,
			Estado = Estado

			WHERE
			id_control = p_IDControl 
			AND Estado = 'activo' 
			AND fecha_control = (SELECT fecha_control FROM tbl_ControlArqueo WHERE fecha_control = NOW(3));

		Commit;
	End

 //

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 DELIMITER //

 CREATE PROCEDURE `SP_Actualiza_ControlArqueoCierre`
(
 p_IDControl	INT,
 p_Fecha	DATETIME(3),
 p_id_caja	INT,
 p_Cantidad200 INT, 
 p_Total200 DECIMAL(18,0),	
 p_Cantidad100	INT,
 p_Total100	decimal(18, 0),
 p_Cantidad50	INT,
 p_Total50	decimal(18, 0),
 p_Cantidad20	INT,
 p_Total20	decimal(18, 0),
 p_Cantidad10	INT,
 p_Total10	decimal(18, 0),
 p_Cantidad5	INT,
 p_Total5	decimal(18, 0),
 p_Cantidad1	INT,
 p_Total1	decimal(18, 0),
 p_Cantidad050	INT,
 p_Total050	decimal(18, 0),
 p_Cantidad025	INT,
 p_Total025	decimal(18, 0),
 p_Cantidad010	INT,
 p_Total010	decimal(18, 0),
 p_Cantidad005	INT,
 p_Total005	decimal(18, 0),
 p_Cantidad001	INT,
 p_Total001	decimal(18, 0),
 p_GranTotal	decimal(18, 0)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_ControlArqueoCierre
			SET

			fecha_control = p_Fecha, 
			id_caja = p_id_caja, 
			Cantidad200 = p_Cantidad200,
			Total200 = p_Total200,
			Cantidad100 = p_Cantidad100,
			Total100 = p_Total100,
			Cantidad50 = p_Cantidad50,
			Total50 = p_Total50,
			Cantidad20 = p_Cantidad20,
			Total20 = p_Total20,
			Cantidad10 = p_Cantidad10,
			Total10 = p_Total10,
			Cantidad5 = p_Cantidad5,
			Total5 = p_Total5,
			Cantidad1 = p_Cantidad1,
			Total1 = p_Total1,
			Cantidad050 = p_Cantidad050,
			Total050 = p_Total050,
			Cantidad025 = p_Cantidad025,
			Total025 = p_Total025,
			Cantidad010 = p_Cantidad010,
			Total010 = p_Total010,
			cantidad005 = p_Cantidad005,
			Total005 = p_Total005,
			Cantidad001 = p_Cantidad001,
			Total001 = p_Total001,
			GranTotal = p_GranTotal,
			Estado = Estado

			WHERE
			id_control = p_IDControl 
			AND Estado = 'activo' 
			AND fecha_control = (SELECT fecha_control FROM tbl_ControlArqueo WHERE fecha_control = NOW(3));

		Commit;
	End

 //

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_ControlCajasApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_ControlCajasApertura`
(
p_idControl INT,
p_idCaja INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_ControlCajasApertura`
			SET

			id_caja = p_idCaja,
			control_control = 0

			WHERE
			id_control = p_idControl AND control_control = 1 AND id_caja = p_idCaja;

		Commit;
	End
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_CuentaPorCobrar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_CuentaPorCobrar`
(
p_idCuenta INT,
p_fecha DATETIME(3),
p_fehcaV DATETIME(3),
p_idCliente INT,
p_idVentaRef INT,
p_documento LONGTEXT,
p_monto DECIMAL(15,4),
p_plazo DOUBLE,
p_idInteres INT,
p_cuotaProgramada DECIMAL(15,4),
p_saldoProgramado DECIMAL(15,4),
p_idInteresMora INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_cuentasPorCobrar`
			SET
			
			fecha_cuentaCobro = p_fecha,
			fechaVence_CuentaPorCobrar = p_fehcaV,
			id_cliente = p_idCliente,
			id_ventaReferencia = p_idVentaRef,
			documento_venta = p_documento,
			monto_cuentaCobro = p_monto,
			plazo_cuentaCobro = p_plazo,
			id_interes = p_idInteres,
			cuotaProgramada = p_cuotaProgramada,
			saldoProgramado = p_saldoProgramado,
			id_InteresMora = p_idInteresMora

			WHERE
			id_cuentaCobro = p_idCuenta and estado_cuentaCobro = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_CuentaPorPagar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_CuentaPorPagar`
(
p_idCuenta INT,
p_fecha DATETIME(3),
p_fechaVence DATETIME(3),
p_idProveedor INT,
p_documento LONGTEXT,
p_monto DECIMAL(15,4),
p_plazo DOUBLE,
p_saldo DECIMAL(15,4),
p_estado INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_CuentaPorPagar`
			SET

			fecha_CuentaPorPagar = p_fecha,
			fechaVence_CuentaPorPagar = p_fechaVence,
			id_proveedor = p_idProveedor,
			documento_CuentaPorPagar = p_documento,
			monto_CuentaPorPagar = p_monto,
			plazo_CuentaPorPagar = p_plazo,
			saldo_CuentaPorPagar = p_saldo, 
			estado_CuentaPorPagar = p_estado

			WHERE
			id_CuentaPorPagar = p_idCuenta AND 
			estado_CuentaPorPagar = '1'; /* SQLINES DEMO ***  2 = inactivo*/

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Departamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Departamento`
(
p_id INT,
p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_departamento`
			SET

			nombre_departamento = p_descripcion

			WHERE
			id_departamento = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleCompra`
(
p_idLinea INT,
p_idCompra INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_costo DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetalleCompra`
			SET
			
			id_compra = p_idCompra,
			id_producto = p_idProducto,
			descripcion_producto = p_descripcion,
			costo_producto = p_costo,
			cantidad_producto = p_cantidad,
			id_kardex = p_idKardex,
			porcentajeIva_Producto = p_porcentajeIva,
			porcentajeDescuento_producto = p_porcentajeDescuento
			

			WHERE
			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleDevolucionCliente`
(

p_idDevCliente INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetalleDevolucionCliente`
			SET

			id_producto = p_idProducto,
			descripcion_producto = p_descripcion,
			precio_producto = p_precio,
			cantidad_producto = p_cantidad,
			id_kardex = p_idKardex,
			porcentajeIva = p_porcentajeIva,
			porcentajeDescuento = p_porcentajeDescuento

			WHERE
			id_devolucionCliente = p_idDevCliente;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleInventario`
(
p_idLinea INT, 
p_idInventario INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_stock DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_detalle_inventario`
			SET

			id_inventario = p_idInventario,
			id_producto = p_idProducto,
			descripcion_producto = p_descripcion,
			stock_producto = p_stock

			WHERE
			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleKit`
(
p_idKit INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_Precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_Serie LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetalleKit`
			SET
			
			id_kit = p_idKit,
			id_producto = p_idProducto,
			descripcion_producto = p_descripcion,
			precio_producto = p_Precio,
			cantidad_detalleKit = p_cantidad,
			numero_serie = p_Serie
			

			WHERE
			id_kit = p_idKit;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetallePagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetallePagoCredito`
(
p_idLinea INT,
p_idPagocre INT,
p_idTabla INT,
p_montoPagocre DECIMAL(15,4),
p_moraPagocre DECIMAL(15,4),
p_diasPagocre DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetallePagoCredito`
			SET
			
			id_pagocre = p_idPagocre,
			id_tabla = p_idTabla,
			monto_pagocre = p_montoPagocre,
			mora_pagocre = p_moraPagocre,
			dias_pagocre = p_diasPagocre

			WHERE
			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetallePagoCreditoContado`
(
p_idLinea INT,
p_idPagocrecont INT,
p_idCuentaCobro INT,
p_montoPagocrecont DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetallePagoCreditoContado`
			SET

			
			id_pagocrecont =p_idPagocrecont,
			id_cuentaCobro = p_idCuentaCobro,
			monto_pagocrecont = p_montoPagocrecont

			WHERE
			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_detallePedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_detallePedido`
(
p_idLinea INT,
p_idPedido INT,
p_idProducto INT,
p_descripcionProducto LONGTEXT,
p_precioProducto DECIMAL(15,4),
p_cantidadPedido DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_detallePedido`
			SET

			id_pedido = p_idPedido,
			id_producto = p_idProducto,
			descripcion_producto = p_descripcionProducto,
			precio_producto = p_precioProducto,
			cantidad_pedido = p_cantidadPedido

			WHERE

			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleTraslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleTraslado`
(
 p_idLinea INT, 
 p_idTraslado INT, 
 p_idProducto INT, 
 p_descripcion LONGTEXT,
 p_cantidad DOUBLE, 
 p_idKardexOrigen INT, 
 p_idKardexDestino INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_detalleTraslado`
			SET

			id_traslado = p_idTraslado, 
			id_producto = p_idProducto,
			descripcion_producto = p_descripcion, 
			cantidad_traslado = p_cantidad, 
			id_kardexOrigen = p_idKardexOrigen, 
			id_KardexDestino = p_idKardexDestino

			WHERE
			id_linea = p_idLinea;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DetalleVenta`
(
p_idLinea INT,
p_idVenta INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE,
p_medida longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetalleVenta`
			SET
			
			
			id_producto = p_idProducto,
			descripcion_producto = p_descripcion,
			precio_producto = p_precio,
			cantidad_producto = p_cantidad,
			id_kardex = p_idKardex,
			porcentajeIva = p_porcentajeIva,
			porcentajeDescuento = p_porcentajeDescuento,
			descripcion_medida = p_medida

			WHERE
			id_linea = p_idLinea AND id_venta = p_idVenta;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Documentos`
(
 p_id INT,
 p_nombre LONGTEXT,
 p_abrevia NVARCHAR(50),
 p_serie NVARCHAR(50),
 p_idTipo INT,
 p_inicio INT,
 p_utilizado int,
 p_fin INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Documentos`
			SET

			nombre_documento = p_nombre,
			abreviatura_documento = p_abrevia,
			serie_documento = p_serie,
			id_tipoDocumentoPago = p_idTipo,
			inicio_documento = p_inicio,
			final_documento = p_fin,
      utilizado_documento = p_utilizado

			WHERE
			id_documento = p_id and activo_documento = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_DocumentosUltimoUtilizado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_DocumentosUltimoUtilizado`
(
 p_id INT,
 p_idTipo INT,
 p_utilizado int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Documentos`
			SET

      utilizado_documento = p_utilizado

			WHERE
			id_documento = p_id 
			AND id_tipoDocumentoPago = p_idTipo 
			AND activo_documento = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Empleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Empleado`
(
p_id INT,
p_nombre LONGTEXT,
p_apellido LONGTEXT,
p_direccion LONGTEXT,
p_telef1	LONGTEXT,
p_telef2 LONGTEXT,
p_fechanac DATETIME(3),
p_idTemp	INT,
p_usuario NVARCHAR(50),
p_pass NVARCHAR(50),
p_idRol INT,
p_idCaja INT,
p_idMuni INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_empleado`
			SET

			
			nombre_empleado = p_nombre,
			apellido_empleado = p_apellido,
			direccion_empleado = p_direccion,
			telefeono1_empleado = p_telef1,	
			telefono2_empleado = p_telef2,
			fechanac_empleado = p_fechanac,
			id_templeado = p_idTemp,
			usuario_empleado = p_usuario,
			contrasena_empleado = p_pass,
			id_rol = p_idRol,
			id_caja = p_idCaja, 
			id_municipio = p_idMuni

			WHERE
			id_empleado = p_id AND estado_empleado = 'activo';

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_FacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_FacturasCompras`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idCompra INT, 
 p_documento LONGTEXT,
 p_monto DECIMAL(15,4), 
 p_iva DECIMAL(15,4), 
 p_isr DECIMAL(15,4), 
 p_iso DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_FacturasCompras`
			SET

			fecha_facturacompra = p_fecha, 
			id_compra = p_idCompra, 
			documento_facturacompra = p_documento, 
			monto_facturacompra = p_monto, 
			iva_facturacompra = p_iva,
			isr_facturacompra = p_isr, 
			iso_facturacompra = p_iso

			WHERE
			id_facturacompra = p_id AND estado_facturacompra = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_FacturasVentas`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idVenta INT, 
 p_documento LONGTEXT,
 p_monto DECIMAL(15,4), 
 p_iva DECIMAL(15,4), 
 p_isr DECIMAL(15,4), 
 p_iso DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_FacturasVentas`
			SET

			fecha_facturaventa = p_fecha, 
			documento_facturaventa = p_documento, 
			monto_facturaventa = p_monto, 
			iva_facturaventa = p_iva,
			isr_facturaventa = p_isr, 
			iso_facturaventa = p_iso

			WHERE
			id_facturaventa = p_id AND estado_facturaventa = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_FormaPago`
(
 p_descripcion NVARCHAR(50),
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_FormaPago`
			SET

			descripcion_formaPago = p_descripcion

			WHERE
			id_formaPago = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Inventario`
(
p_idInventario INT,
p_fecha DATE, 
p_idBodega INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_Inventario 
			SET
	        id_bodega = p_idBodega
			WHERE 
			id_inventario = p_idInventario AND estado_categoria = 0; 
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Iva`
(
 p_id INT, 
 p_descripcion LONGTEXT,
 p_tarifa DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_iva`
			SET

			descripcion_iva = p_descripcion,
			tarifa_iva = p_tarifa

			WHERE
			id_iva = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Kardex`
(
 p_id INT, 
 p_idBodega INT, 
 p_idProducto INT, 
 p_fecha DATETIME(3), 
 p_documento NVARCHAR(50),
 p_entrada DOUBLE, 
 p_salida DOUBLE, 
 p_saldo DOUBLE, 
 p_ultimoCosto DECIMAL(15,4), 
 p_costoPromedio DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Kardex`
			SET

			id_bodega = p_idBodega, 
			id_producto = p_idProducto, 
			fecha_kardex = p_fecha,
			documento_kardex = p_documento,
			entrada_kardex = p_entrada,
			salida_kardex = p_salida,
			saldo_kardex = p_saldo,
			ultimoCosto_kardex = p_ultimoCosto,
			costoPromedio_kardex = p_costoPromedio

			WHERE

			id_producto = p_idProducto;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Kit`
(
p_id INT,
p_fecha DATETIME(3),
p_fechavence DATETIME(3),
p_idProducto INT,
p_precio	DECIMAL(15,4),
p_estado INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_kit`
			SET
				fecha_kit = p_fecha,
				fechavence_kit = p_fechavence,
				id_producto = p_idProducto,
				precio_kit = p_precio

			WHERE
				id_kit = p_id
				and estado_kit = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_LogUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_LogUsuarios`
(
p_usuario NVARCHAR(50),
p_idlog int,
p_ip nvarchar(100),
p_fecha_log DATE
)

	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		update tbl_LogUusarios SET
			
			usuario_empleado = p_usuario,
			ipLocal = p_ip,
			log = 0,
			fecha_log = p_fecha_log
			
			where id_log = p_idlog
			and log = 1;

		Commit;
	End
	
//

DELIMITER ;


 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_LogUsuariosCloseSession]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_LogUsuariosCloseSession`
(
p_usuario NVARCHAR(50)
)

	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		update tbl_LogUusarios SET
			
			log = 0
			where usuario_empleado = p_usuario
			and log = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_MovimientoCuentaCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_MovimientoCuentaCliente`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idClien INT, 
 p_idFPago INT, 
 p_descrip LONGTEXT,
 p_debito DECIMAL(15,4),
 p_credito DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_MovimientoCuentaClientes
			SET

			fecha_movimiento = p_fecha,
			id_cliente =p_idClien, 
			id_formaPago = p_idFPago,
			descripcion_movimiento = p_descrip,
			debito_movimiento = p_debito, 
			credito_movimiento = p_credito

			WHERE
			id_movimiento = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_MovimientoCuentaProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_MovimientoCuentaProveedor`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idProv INT, 
 p_idFPago INT, 
 p_descrip LONGTEXT,
 p_debito DECIMAL(15,4),
 p_credito DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_MovimientoCuentaProveedores`
			SET

			fecha_movimiento = p_fecha,
			id_proveedor = p_idProv, 
			id_formaPago = p_idFPago,
			descripcion_movimiento = p_descrip,
			debito_movimiento = p_debito, 
			credito_movimiento = p_credito

			WHERE
			id_movimiento = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_municipio`
(
p_idMunicipio INT,	
p_idDepartamento INT,
p_nombre LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		UPDATE tbl_municipio
		SET
		
		id_municipio = p_idMunicipio,
		id_departamento = p_idDepartamento,
		nombre_municipio = p_nombre

		WHERE 
		id_municipio = p_idMunicipio;
		
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
delimiter //

create PROCEDURE `SP_Actualiza_Proforma`
(
p_id INT, 
p_fecha DATETIME(3), 
p_idCliente INT, 
p_idBodega INT,
p_idForma INT, 
p_total DECIMAL(15,4), 
p_idDoc INT,
p_documento LONGTEXT, 
p_observa LONGTEXT,
p_usuario LONGTEXT,
p_estado int 
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			update tbl_proforma set	
			 id_proforma = p_id,
			 fecha_proforma = p_fecha,
			 id_bodega = p_idBodega,
			 id_cliente = p_idCliente,
			 id_documento = p_idDoc,
			 id_formaPago = p_idForma,
			 documento = p_documento,
			 total_proforma = p_total,
			 observaciones_proforma = p_observa,
			 usuario_proforma = p_usuario,
			 estado_proforma =p_estado
			WHERE    
			id_proforma = p_id and
			estado_proforma = 1;

		Commit;
	End
	
	
//

delimiter ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_ProformaByVigentes]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_ProformaByVigentes`
(
p_id INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_proforma`
			SET
			 estado_proforma = 0
			
			WHERE
			id_proforma = p_id and estado_proforma = 1;
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_ProvBancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_ProvBancos`
(
 p_idProveedor INT, 
 p_idBanco INT, 
 p_cuenta LONGTEXT,
 p_nombre LONGTEXT,
 p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_provbancos`
			SET

			numero_cuenta = p_cuenta,
			nombre_cuenta = p_nombre, 
			descripcion_cuenta = p_descripcion

			WHERE
			id_proveedor = p_idProveedor AND id_banco = p_idBanco;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Proveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Proveedor`
(
 p_id INT, 
 p_nombreJuridico LONGTEXT,
 p_nomComercial LONGTEXT,
 p_direccion LONGTEXT,
 p_telef1 NVARCHAR(50),
 p_telef2 NVARCHAR(50),
 p_correo NVARCHAR(50),
 p_nit LONGTEXT,
 p_idIva INT,
 p_idMunicipio INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_proveedor`
			SET

			nombreJuridico_proveedor = p_nombreJuridico,
			nombreComercial_proveedor = p_nomComercial,
			direccion_proveedor = p_direccion, 
			telefono1_proveedor = p_telef1,
			telefono2_proveedor = p_telef2,
			correo_proveedor = p_correo,
			nit_proveedor = p_nit,
			id_iva = p_idIva,
			id_municipio = id_municipio

			WHERE
			id_proveedor = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_RestaStock]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_RestaStock`
(
 p_cantidad DOUBLE,
 p_idBodega INT, 
 p_idProducto INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_bodegaProducto`
			SET

			stock_producto = stock_producto - p_cantidad

			WHERE
			id_bodega = p_idBodega AND id_producto = p_idProducto;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_SubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_SubCategoria`
(
 p_id INT,
 p_descripcion longtext,
 p_idCat int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Sub_Categoria`
			SET

			descripcion_subcategoria = p_descripcion,
			id_categoria = p_idCat

			WHERE
			id_subcategoria = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_TarjetaCredito`
(
 p_id INT,
 p_descrip VARCHAR(50),
 p_tarifa DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_TarjetaCredito`
			SET

			descripcion_tarjeta = p_descrip,
			tarifa_tarjeta = p_tarifa


			WHERE
			id_tarjeta = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_TipoDocumentoPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_TipoDocumentoPago`
(
 p_id INT,
 p_descripcion NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_TipoDocumentoPagos`
			SET

			descripcion_tipoDocumentoPago = p_descripcion

			WHERE
			id_tipoDocumentoPago = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_TipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_TipoEmpleado`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_tipoEmpleado`
			SET

			descripcion_templeado = p_descripcion

			WHERE
			id_templeado = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_TipoProducto`
(
 p_id INT, 
 p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_TipoProducto`
			SET

			descripcion_tproducto = p_descripcion

			WHERE
			id_tproducto = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_UnidadMedida`
(
 p_id INT,
 p_descrip NCHAR(10),
 p_cant DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_UnidadMedida`
			SET

			descripcion_medida = p_descrip,
			cantidad_medida = p_cant
			WHERE
			id_medida = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Usuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Usuario`
(
p_id INT,
p_usuario NVARCHAR(50),
p_pass NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_empleado`
			SET

			
			usuario_empleado = p_usuario,
			contrasena_empleado = p_pass
			
			WHERE
			id_empleado = p_id AND estado_empleado = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_Venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_Venta`
(
p_id INT, 
p_fecha DATETIME(3), 
p_idCliente INT, 
p_idBodega INT,
p_idForma INT, 
p_total DECIMAL(15,4), 
p_idDoc INT,
p_documento LONGTEXT, 
p_obseva LONGTEXT,
p_plazo INT,
p_boleta INT,
p_deposito DECIMAL(15,4),
p_diff DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_venta`
			SET

			id_venta = p_id,
			fecha_venta = p_fecha, 
			id_cliente = p_idCliente, 
			id_bodega = p_idBodega, 
			id_formaPago = p_idForma,
			total_venta = p_total, 
			id_documento = p_idDoc, 
			documento = p_documento,
			observaciones_venta = p_obseva,
			plazo_venta = p_plazo,
			boletaDeposito_venta = p_boleta,
			deposito_venta = p_deposito,
			diffDepoCompra_venta = p_diff
			WHERE
			id_venta = p_id;
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualiza_VentaByPendienteCobro]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualiza_VentaByPendienteCobro`
(
p_id INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_venta`
			SET
			 cobrado_venta = 0
			
			WHERE
			id_venta = p_id and cobrado_venta = 1;
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_Bitaora]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_Bitaora`
(
p_id INT,
p_fecha DATE,
p_hora longtext,
p_usuario VARCHAR(50),
p_accion longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		UPDATE tbl_bitacora SET
					fecha_bitacora = p_fecha,
					hora_bitacora = p_hora,
					usuario = p_usuario,
					accion_bitacora = p_accion
		where id_bitacora = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_DetalleSalida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_DetalleSalida`
(
p_idSalida INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_cantidad DOUBLE,
p_idKardex INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_DetalleSalida`
			SET

			id_producto = p_idProducto,
			descripcion_salida = p_descripcion,
			cantidad_salida = p_cantidad,
			id_kardex = p_idKardex

			WHERE

			id_salida = p_idSalida;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_marca`
(
p_id INT,
p_nombre LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_marca
			SET
			
			nombre_marca = p_nombre

		WHERE 
			id_marca = p_id;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_PermisosRol`
(
 p_id INT, 
 p_idRol INT, 
 p_formulario LONGTEXT,
 p_puedeVer TINYINT, 
 p_puedeModificar TINYINT, 
 p_puedeBorrar TINYINT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_PermisosRol`
			SET

			id_rol = p_idRol,
			formulario_permisos = p_formulario,
			puedeVer = p_puedeVer, 
			puedeModificar = p_puedeModificar,
			puedeBorrar = p_puedeBorrar

			WHERE
			id_permisos = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_PrecioCostoPorProductoByFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_PrecioCostoPorProductoByFecha`
(
p_id INT,
p_idProducto INT, 
p_Costo DECIMAL(15,4), 
p_referencia NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_PrecioCostoPorProductoByFecha SET
			
			id_producto = p_idProducto,
			costo_producto = p_Costo,
			referencia_compra = p_referencia
			
			WHERE id_PreCostoProducto = p_id;

			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_producto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_producto`
(
p_id INT,
p_sku LONGTEXT,
p_descrip LONGTEXT,
p_idSubCate INT,
p_idIva INT,
p_notas LONGTEXT,
p_idMarca INT,
p_modelo LONGTEXT,
p_idTProd int,
p_costo Decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_Producto
			SET
			
			sku_producto = p_sku,
			descripcion_producto = p_descrip,
			id_Sub_Categoria = p_idSubCate, 
			id_iva = p_idIva, 
			notas_producto = p_notas,
			id_marca = p_idMarca, 
			modelo_producto = p_modelo, 
			id_tproducto = p_idTProd,
			costo_producto = p_costo
		WHERE 
			id_producto = p_id;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_productoPrecioCosto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_productoPrecioCosto`
(
p_id INT,
p_costo Decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_Producto
			SET
			costo_producto = p_costo
		WHERE 
			id_producto = p_id;
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_ProductUnidPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_ProductUnidPrecioVenta`
(
p_id INT,
p_idMedida INT,	
p_precio DECIMAL(15,4),
p_estado TINYINT,
p_precioBase TINYINT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_ProductUnidPrecioVenta
			SET
			
			
			id_medida = p_idMedida,
			precio = p_precio,
			estado_prounidprecio = p_estado,
			precioBase = p_precioBase

		WHERE 
			id_producto = p_id AND id_medida = p_idMedida;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_ProductUnidPrecVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_ProductUnidPrecVenta`
(
p_id INT,
p_idMedida INT,
p_precio DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_ProductUnidPrecioVenta
			SET
			
			precio = p_precio

		WHERE 
			id_producto = p_id 

			AND id_medida = p_idMedida
			AND estado_prounidprecio = 1;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_Rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_Rol`
(
p_id INT, 
p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_rol
			SET
			
			descripcion_rol = p_descripcion
		WHERE id_rol = p_id;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_Salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_Salida`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idConcepto INT, 
 p_idBodega INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_salida`
			SET

			fecha_salida = p_fecha, 
			id_concepto = p_idConcepto,
			id_bodega = p_idBodega

			WHERE
			id_salida = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_SerieProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_SerieProducto`
(
p_id INT,
p_idSerie INT,
p_numero LONGTEXT,
p_disponible TINYINT,
p_cantidad DOUBLE,
p_fechaVC DATETIME(3),
p_fechaVV DATETIME(3)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_SerieProducto
			SET
			
			numero_serie = p_numero,
			disponible_serie = p_disponible, 
			cantidad_serie = p_cantidad,
			fechaVenceCompra_serie = p_fechaVC,
			fechaVenceVenta_serie =  p_fechaVV

		WHERE 
			id_producto = p_id AND id_serie = p_idSerie;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_SerieProductoDescuento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_SerieProductoDescuento`
(
p_idSerie INT,
p_cantidad INT,
p_fechaVV DATETIME(3)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE tbl_SerieProducto
			SET
			
			disponible_serie = 0, 
			cantidad_serie =  cantidad_serie - p_cantidad,
			fechaVenceVenta_serie =  p_fechaVV

		WHERE 
			id_serie = p_idSerie;
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Actualizar_Traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Actualizar_Traslado`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idBodegaOrigen INT, 
 p_idBodegaDestino INT, 
 p_Descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_traslado`
			SET

			fecha_traslado = p_fecha, 
			id_bodegaOrigen = p_idBodegaOrigen, 
			id_bodegaDestino = p_idBodegaDestino

			WHERE
			id_traslado = p_id;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_administrarImagenProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_administrarImagenProducto` (
	p_operacion 	VARCHAR(10), --  SQLINES DEMO ***  CREATE, DELETE OR CONSULT
	p_id_imagenproducto INT /* = NULL */,
	p_id_producto INT /* = NULL */,
	p_urlImagen Longtext /* = NULL */)
BEGIN

	IF p_operacion = 'INSERTAR'
	THEN
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO `tbl_ImagenProducto` (`id_producto`, `urlImagenProducto`)
		VALUES (p_id_producto, p_urlImagen);

	ELSEIF p_operacion = 'ACTUALIZAR'
	THEN 
		UPDATE `tbl_ImagenProducto`
		SET
			`id_producto` = IFNULL(p_id_producto, `id_producto`),
			`urlImagenProducto` = IFNULL(p_urlImagen, `urlImagenProducto`)
		WHERE 
			`id_imageProducto` = p_id_imagenproducto;

	ELSEIF p_operacion = 'ELIMINAR'
	THEN
		DELETE FROM `tbl_ImagenProducto`
		WHERE `id_imageProducto` = p_id_imagenproducto;

	ELSEIF p_operacion = 'CONSULTAR'
	THEN
		SELECT `id_imageProducto`, `id_producto`, `urlImagenProducto`
		FROM
			`tbl_ImagenProducto`
		WHERE 
			`id_imageProducto` = p_id_imagenproducto;

	ELSE
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'OPERACION A EJECUTAR INVALIDA!!, PUDES UTILIZAR INSERTAR, ACTUALIZAR, ELIMINAR O CONSULTAR';
	END IF;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_administrarPais]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_administrarPais` (
	p_operacion 	VARCHAR(10), --  SQLINES DEMO ***  CREATE, DELETE OR CONSULT
	p_id_pais INT /* = NULL */,
	p_nombre_pais VARCHAR(25) /* = NULL */,
	p_codigo_pais INT /* = NULL */)
BEGIN

	IF p_operacion = 'INSERTAR'
	THEN
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO `tbl_pais` (`id_pais`, `nombre_pais`, `codigo_pais`)
		VALUES (p_id_pais, p_nombre_pais, p_codigo_pais);

	ELSEIF p_operacion = 'ACTUALIZAR'
	THEN 
		UPDATE `tbl_pais`
		SET
			`nombre_pais` = IFNULL(p_nombre_pais, `nombre_pais`),
			`codigo_pais` = IFNULL(p_codigo_pais, `codigo_pais`)
		WHERE 
			`id_pais` = p_id_pais;

	ELSEIF p_operacion = 'ELIMINAR'
	THEN
		DELETE FROM `tbl_pais`
		WHERE `id_pais` = p_id_pais;

	ELSEIF p_operacion = 'CONSULTAR'
	THEN
		SELECT `id_pais`, `nombre_pais`, `codigo_pais`
		FROM
			`tbl_pais`
		WHERE 
			`id_pais` = p_id_pais;

	ELSE
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'OPERACION A EJECUTAR INVALIDA!!, PUDES UTILIZAR INSERTAR, ACTUALIZAR, ELIMINAR O CONSULTAR';
	END IF;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Aumentar_DocumentosInicio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Aumentar_DocumentosInicio`
(
 p_id INT,
 p_inicio INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Documentos`
			SET

			inicio_documento = inicio_documento + p_inicio

			WHERE
			id_documento = p_id and activo_documento = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Desactivar_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Desactivar_Documentos`
(
 p_id INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			UPDATE `tbl_Documentos`
			SET

			activo_documento = 0

			WHERE
			id_documento = p_id and activo_documento = 1;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Banco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Banco` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_banco
		WHERE (descripcion_banco) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Barra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Barra` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_barra
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BitacoraByDate]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BitacoraByDate` (
p_desde DATE,
p_hasta DATE)
BEGIN
	SELECT b.id_bitacora, b.fecha_bitacora, b.usuario,
				 b.accion_bitacora, b.hora_bitacora
	FROM tbl_bitacora b
	WHERE ((p_desde IS NULL) OR (b.fecha_bitacora >= p_desde))
	AND   ((p_hasta IS NULL) OR (b.fecha_bitacora <= p_hasta));
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Bitaora]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Bitaora`
(
p_criterio VARCHAR(50)
)


	Begin
		SELECT *
		FROM tbl_bitacora	
		WHERE (usuario) LIKE Concat('%',p_criterio,'%');
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Bodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Bodega` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_bodega
		WHERE (nombre_bodega) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoByBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoByBarra` (

p_criterio varchar(50))

	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
INNER JOIN tbl_barra BBB on P.id_producto = BBB.id_producto
		WHERE (BBB.barra) LIKE Concat('%' , p_criterio,'%')
		ORDER BY P.descripcion_producto;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoByDescripProduct]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoByDescripProduct` (

p_criterio varchar(50))

	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
WHERE (P.descripcion_producto) LIKE Concat('%',p_criterio,'%')
ORDER BY P.descripcion_producto;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoBySKU]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoBySKU` (

p_criterio varchar(50))

	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
		WHERE (P.sku_producto) LIKE Concat('%' , p_criterio ,'%')
		ORDER BY P.descripcion_producto;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdBodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdBodega` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_bodega) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdBodegas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdBodegas` (

p_criterio varchar(50))

	Begin 
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB on BB.id_bodega = BP.id_bodega
		WHERE (BP.id_bodega) LIKE Concat('%' , p_criterio,'%')
		ORDER BY BB.nombre_bodega;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdProducto` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostrador]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostrador` (

p_criterio varchar(50))

	Begin 
SELECT
tbl_Producto.id_producto,
tbl_Producto.sku_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto,
tbl_ProductUnidPrecioVenta.precio
FROM
tbl_Producto
INNER JOIN tbl_bodegaProducto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta ON tbl_ProductUnidPrecioVenta.id_producto = tbl_Producto.id_producto
WHERE (tbl_Producto.descripcion_producto) LIKE Concat('%',p_criterio,'%') 
AND tbl_bodegaProducto.id_bodega = 2 
AND tbl_ProductUnidPrecioVenta.id_medida = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorByBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostradorByBarra` (

p_criterio varchar(50))

	Begin 
SELECT
tbl_Producto.id_producto,
tbl_Producto.sku_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto,
tbl_ProductUnidPrecioVenta.precio
FROM
tbl_Producto
INNER JOIN tbl_bodegaProducto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta ON tbl_ProductUnidPrecioVenta.id_producto = tbl_Producto.id_producto
inner JOIN tbl_barra ON tbl_barra.id_producto = tbl_Producto.id_producto
WHERE (tbl_barra.barra) LIKE Concat('%',p_criterio,'%') 
AND tbl_bodegaProducto.id_bodega = 2
AND tbl_ProductUnidPrecioVenta.id_medida = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BodegaProductoIdProductoMostradorBySKU]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostradorBySKU` (

p_criterio varchar(50))

	Begin 
SELECT
tbl_Producto.id_producto,
tbl_Producto.sku_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto,
tbl_ProductUnidPrecioVenta.precio
FROM
tbl_Producto
INNER JOIN tbl_bodegaProducto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta ON tbl_ProductUnidPrecioVenta.id_producto = tbl_Producto.id_producto
WHERE (tbl_Producto.sku_producto) LIKE Concat('%',p_criterio,'%') 
AND tbl_bodegaProducto.id_bodega = 2
AND tbl_ProductUnidPrecioVenta.id_medida = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_BuscaKardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_BuscaKardex` (

p_criterio VARCHAR(50))

	Begin 
			SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
			k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
			FROM tbl_Kardex k
			INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
			INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
			WHERE (p.descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Caja]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Caja` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_cajas
		WHERE (descripcion_caja) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CajaDiaria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CajaDiaria` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_CajaDiaria
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CalculoPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CalculoPrecioVenta` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_calculoPrecioVenta
		WHERE (descripcion_calculo) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Categoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Categoria` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_categoria
		WHERE (descripcion_categoria) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ClienteNit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ClienteNit` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_cliente
		WHERE (nit_cliente) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ClienteNombre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ClienteNombre` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_cliente
		WHERE (nombre_cliente) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Compra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Compra` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_compra
		WHERE (documento_compra) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CompraCompletaByProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CompraCompletaByProveedor` (

p_NombreComercial varchar(50),
p_nit VARCHAR(50),
p_documento VARCHAR(50),
p_desde DATE,
p_hasta DATE)

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
WHERE ((p_NombreComercial IS NULL) OR (P.nombreComercial_proveedor LIKE Concat('%' , p_NombreComercial , '%')))
	 AND ((p_nit IS NULL) OR (p.nit_proveedor LIKE Concat('%' , p_nit , '%')))
	 AND ((p_documento IS NULL) OR (C.documento_compra LIKE Concat('%' , p_documento , '%')))
	 AND ((p_desde IS NULL) OR (C.fecha_compra >= p_desde))
	 AND ((p_hasta IS NULL) OR (C.fecha_compra <= p_hasta));

		--  SQLINES DEMO *** 8), c.fecha_compra,112) AS INT)
    --  SQLINES DEMO *** RT(CHAR(8),@desde, 112) AS INT)
    --  SQLINES DEMO *** HAR(8),@hasta, 112) AS INT)

end;



//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ComprasContadoByIDProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ComprasContadoByIDProveedor` (

p_criterio varchar(50))

	Begin 
		SELECT c.id_compra, c.fecha_compra, c.id_proveedor, p.nombreComercial_proveedor, 
		c.id_bodega, b.nombre_bodega, c.id_formaPago, f.descripcion_formaPago, c.documento_compra,
		c.total_compra, c.notas_compra, c.plazo_compra, c.boletaDeposito_compra, c.deposito_compra,
		c.diffDepoCompra_compra,c.usuario_compra 
		FROM tbl_compra c
		INNER JOIN tbl_proveedor p on c.id_proveedor = p.id_proveedor
		INNER JOIN tbl_bodega b on c.id_bodega = b.id_bodega
		INNER JOIN tbl_FormaPago f on c.id_formaPago = f.id_formaPago
		WHERE (c.id_proveedor) LIKE Concat('%',p_criterio,'%') AND c.id_formaPago <> 3 AND c.id_bodega = 1;
end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ComprasCreditoByIDProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ComprasCreditoByIDProveedor` (

p_criterio varchar(50))

	Begin 
		SELECT c.id_compra, c.fecha_compra, c.id_proveedor, p.nombreComercial_proveedor, 
		c.id_bodega, b.nombre_bodega, c.id_formaPago, f.descripcion_formaPago, c.documento_compra,
		c.total_compra, c.notas_compra, c.plazo_compra, c.boletaDeposito_compra, c.deposito_compra,
		c.diffDepoCompra_compra,c.usuario_compra 
		FROM tbl_compra c
		INNER JOIN tbl_proveedor p on c.id_proveedor = p.id_proveedor
		INNER JOIN tbl_bodega b on c.id_bodega = b.id_bodega
		INNER JOIN tbl_FormaPago f on c.id_formaPago = f.id_formaPago
		WHERE (c.id_proveedor) LIKE Concat('%',p_criterio,'%') AND c.id_formaPago = 3 AND c.id_bodega = 1;
end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Conceptos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Conceptos` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_conceptos
		WHERE (descripcion_concepto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ControlArqueo` (
    IN p_criterio VARCHAR(50),
    IN p_desde DATE,
    IN p_hasta DATE
)
BEGIN
    SELECT * FROM tbl_ControlArqueo
    WHERE CAST(DATE_FORMAT(fecha_control, '%Y%m%d') AS UNSIGNED)
          BETWEEN CAST(DATE_FORMAT(p_desde, '%Y%m%d') AS UNSIGNED)
          AND CAST(DATE_FORMAT(p_hasta, '%Y%m%d') AS UNSIGNED)
      AND id_caja LIKE CONCAT('%', p_criterio, '%')
      AND Estado = 'Grabada';
END //

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ControlArqueoCierre` (

p_criterio varchar(50),
p_fecha    DATE)

	Begin 
		SELECT * FROM tbl_ControlArqueoCierre
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%')
		AND Estado = 'Grabada'
		AND fecha_control = p_fecha;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ControlCajaApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ControlCajaApertura` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_ControlCajasApertura
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CuentaPorCobrarDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CuentaPorCobrarDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_cuentasPorCobrar
		WHERE (documento_venta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CuentaPorCobrarIDCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CuentaPorCobrarIDCliente` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_cuentasPorCobrar
		WHERE (id_cliente) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CuentaPorPagarDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CuentaPorPagarDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_CuentaPorPagar
		WHERE (documento_CuentaPorPagar) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_CuentaPorPagarIDProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_CuentaPorPagarIDProveedor` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_CuentaPorPagar
		WHERE (id_proveedor) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Departamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Departamento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_departamento
		WHERE (nombre_departamento) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleCompra` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleCompra
		WHERE (id_compra) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleDevolucionCliente` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleDevolucionCliente
		WHERE (id_devolucionCliente) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleInventario` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_detalle_inventario
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleKit` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleKit
		WHERE (id_kit) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleKitByIDProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleKitByIDProducto` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleKit
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetallePagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetallePagoCredito` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetallePagoCredito
		WHERE (id_pagocre) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetallePagoCreditoContado` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetallePagoCreditoContado
		WHERE (id_pagocrecont) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_detallePedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
delimiter //

create PROCEDURE `SP_Filtrar_detallePedido` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_detallePedido
		WHERE (id_pedido) LIKE Concat('%',p_criterio,'%');
	end;
//

delimiter ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleSalida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleSalida` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleSalida
		WHERE (id_salida) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleTraslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleTraslado` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_detalleTraslado
		WHERE (id_traslado) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DetalleVenta` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_DetalleVenta
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Documentos` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Documentos
		WHERE (nombre_documento) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DocumentosByIDDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DocumentosByIDDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_DocumentosByIDTDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_DocumentosByIDTDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_EmpleadoApellido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_EmpleadoApellido` (
p_Criterio	varchar(50))
begin
select *
from tbl_empleado
where (apellido_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 'activo'
order by apellido_empleado asc;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_EmpleadoNombre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_EmpleadoNombre` (
p_Criterio	varchar(50))
begin
select *
from tbl_empleado
where (nombre_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 'activo'
order by nombre_empleado asc;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_EmpleadoUsuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_EmpleadoUsuario` (
p_Criterio	varchar(50))
begin

SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
where (usuario_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 1
order by usuario_empleado asc;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_FacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_FacturasCompras` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_FacturasCompras
		WHERE (id_compra) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_FacturasComprasByDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_FacturasComprasByDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_FacturasCompras
		WHERE (documento_facturacompra) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_FacturasVentas` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_FacturasVentas
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_FacturasVentasByDocumento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_FacturasVentasByDocumento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_FacturasVentas
		WHERE (documento_facturaventa) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_FormaPago` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_FormaPago
		WHERE (descripcion_formaPago) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Inventario` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Inventario
		WHERE (id_inventario) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Iva` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_iva
		WHERE (id_iva) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Kardex` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_Kardex	
			WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Kit` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_kit
		WHERE (id_kit) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_LogUsuarioByUsuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
delimiter //

create PROCEDURE `SP_Filtrar_LogUsuarioByUsuario` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_LogUusarios
		WHERE (usuario_empleado) LIKE Concat('%',p_criterio,'%');
	end;
//

delimiter ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_marca` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_marca
		WHERE (nombre_marca) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_MovimientoCuentaCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_MovimientoCuentaCliente` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_MovimientoCuentaClientes
		WHERE (id_cliente) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_MovimientoCuentaProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_MovimientoCuentaProveedor` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_MovimientoCuentaProveedores
		WHERE (id_proveedor) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_municipio` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_municipio
		WHERE (nombre_municipio) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_municipioByIDDepartamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_municipioByIDDepartamento` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_municipio
		WHERE id_departamento = p_criterio  
		ORDER BY nombre_municipio;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_PermisosRol` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_PermisosRol
		WHERE (id_permisos) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_PrecioCostoPorProductoByFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_PrecioCostoPorProductoByFecha` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_PrecioCostoPorProductoByFecha
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productoBarraByBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productoBarraByBarra` (

p_criterio longtext)

	Begin 
		
			SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto, 
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto,p.costo_producto
		FROM tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
		WHERE (b.barra) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productoBarraByDescripcion]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productoBarraByDescripcion` (

p_criterio varchar(50))

	Begin 
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria,
		id_iva, notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		FROM tbl_Producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productoByDescripcion]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productoByDescripcion` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productoByID]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productoByID` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_producto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productoBySku]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productoBySku` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_producto
		WHERE (sku_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productosByDescripcion]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productosByDescripcion` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%') and id_tproducto <> 4;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_productosBySKU]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_productosBySKU` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_producto
		WHERE (sku_producto) LIKE Concat('%',p_criterio,'%') and id_tproducto <> 4;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ProductUnidadPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ProductUnidadPrecioVenta` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_ProductUnidPrecioVenta
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Proforma` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_proforma
		WHERE (id_proforma) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ProvBancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ProvBancos` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_provbancos
		WHERE (numero_cuenta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ProveedorByNit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ProveedorByNit` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nit_proveedor) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ProveedorByNomComercial]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ProveedorByNomComercial` (

p_criterio VARCHAR(50))

	Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nombreComercial_proveedor) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_ProveedorByNomJuridico]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_ProveedorByNomJuridico` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nombreJuridico_proveedor) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Rol` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_rol
		WHERE (descripcion_rol) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_salida` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_salida
		WHERE (id_salida) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_SerieProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_SerieProducto` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_SerieProducto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%')
		AND disponible_serie > 0
		AND cantidad_serie > 0;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_SubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_SubCategoria` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Sub_Categoria
		WHERE (descripcion_subcategoria) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_SubCategoriaByIDCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_SubCategoriaByIDCategoria` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_Sub_Categoria
		WHERE (id_categoria) LIKE Concat('%',p_criterio,'%')
		ORDER BY descripcion_subcategoria;
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_TarjetaCredito` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_TarjetaCredito
		WHERE (descripcion_tarjeta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_TipoDocumentoPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_TipoDocumentoPago` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_TipoDocumentoPagos
		WHERE (descripcion_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_TipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_TipoEmpleado` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_tipoEmpleado
		WHERE (descripcion_templeado) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_TipoProducto` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_tipoProducto
		WHERE (id_tproducto) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_Traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_Traslado` (

p_criterio int)

	Begin 
		SELECT * FROM tbl_traslado
		WHERE (id_traslado) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_UnidadMedida` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_UnidadMedida
		WHERE (descripcion_medida) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Filtrar_venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Filtrar_venta` (

p_criterio varchar(50))

	Begin 
		SELECT * FROM tbl_venta
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_ControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 DELIMITER //

 CREATE PROCEDURE `SP_Inserta_ControlArqueo`
(
 p_IDControl	INT,
 p_id_caja	INT,
 p_Cantidad200 INT, 
 p_Total200 DECIMAL(18,0),	
 p_Cantidad100	INT,
 p_Total100	decimal(18, 0),
 p_Cantidad50	INT,
 p_Total50	decimal(18, 0),
 p_Cantidad20	INT,
 p_Total20	decimal(18, 0),
 p_Cantidad10	INT,
 p_Total10	decimal(18, 0),
 p_Cantidad5	INT,
 p_Total5	decimal(18, 0),
 p_Cantidad1	INT,
 p_Total1	decimal(18, 0),
 p_Cantidad050	INT,
 p_Total050	decimal(18, 0),
 p_Cantidad025	INT,
 p_Total025	decimal(18, 0),
 p_Cantidad010	INT,
 p_Total010	decimal(18, 0),
 p_Cantidad005	INT,
 p_Total005	decimal(18, 0),
 p_Cantidad001	INT,
 p_Total001	decimal(18, 0),
 p_GranTotal	decimal(18, 0)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_ControlArqueo
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
			VALUES  ( p_IDControl , -- id... SQLINES DEMO ***
			          NOW(3) , -- SQLINES DEMO *** atetime
			          p_id_caja , -- id... SQLINES DEMO ***
			          p_Cantidad200 , -- Ca... SQLINES DEMO ***
			          p_Total200 , -- To... SQLINES DEMO ***
			          p_Cantidad100 , -- Ca... SQLINES DEMO ***
			          p_Total100 , -- To... SQLINES DEMO ***
			          p_Cantidad50 , -- Ca... SQLINES DEMO ***
			          p_Total50 , -- To... SQLINES DEMO ***
			          p_Cantidad20, -- Ca... SQLINES DEMO ***
			          p_Total20 , -- To... SQLINES DEMO ***
			          p_Cantidad10 , -- Ca... SQLINES DEMO ***
			          p_Total10 , -- To... SQLINES DEMO ***
			          p_Cantidad5 , -- Ca... SQLINES DEMO ***
			          p_Total5 , -- To... SQLINES DEMO ***
			          p_Cantidad1 , -- Ca... SQLINES DEMO ***
			          p_Total1 , -- To... SQLINES DEMO ***
			          p_Cantidad050, -- Ca... SQLINES DEMO ***
			          p_Total050 , -- To... SQLINES DEMO ***
			          p_Cantidad025 , -- Ca... SQLINES DEMO ***
			          p_Total025 , -- To... SQLINES DEMO ***
			          p_Cantidad010 , -- Ca... SQLINES DEMO ***
			          p_Total010 , -- To... SQLINES DEMO ***
			          p_Cantidad005, -- Ca... SQLINES DEMO ***
			          p_Total005 , -- To... SQLINES DEMO ***
			          p_Cantidad001 , -- Ca... SQLINES DEMO ***
			          p_Total001 , -- To... SQLINES DEMO ***
			          p_GranTotal , -- Gr... SQLINES DEMO ***
			          'grabada'  -- Es... SQLINES DEMO ***
			        );
		Commit;
	End
	
	
 //

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 

 -- SQLINES LICENSE FOR EVALUATION USE ONLY
 DELIMITER //

 CREATE PROCEDURE `SP_Inserta_ControlArqueoCierre`
(
 p_IDControl	INT,
 p_id_caja	INT,
 p_Cantidad200 INT, 
 p_Total200 DECIMAL(18,0),	
 p_Cantidad100	INT,
 p_Total100	decimal(18, 0),
 p_Cantidad50	INT,
 p_Total50	decimal(18, 0),
 p_Cantidad20	INT,
 p_Total20	decimal(18, 0),
 p_Cantidad10	INT,
 p_Total10	decimal(18, 0),
 p_Cantidad5	INT,
 p_Total5	decimal(18, 0),
 p_Cantidad1	INT,
 p_Total1	decimal(18, 0),
 p_Cantidad050	INT,
 p_Total050	decimal(18, 0),
 p_Cantidad025	INT,
 p_Total025	decimal(18, 0),
 p_Cantidad010	INT,
 p_Total010	decimal(18, 0),
 p_Cantidad005	INT,
 p_Total005	decimal(18, 0),
 p_Cantidad001	INT,
 p_Total001	decimal(18, 0),
 p_GranTotal	decimal(18, 0)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_ControlArqueoCierre
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
			VALUES  ( p_IDControl , -- id... SQLINES DEMO ***
			          NOW(3) , -- SQLINES DEMO *** atetime
			          p_id_caja , -- id... SQLINES DEMO ***
			          p_Cantidad200 , -- Ca... SQLINES DEMO ***
			          p_Total200 , -- To... SQLINES DEMO ***
			          p_Cantidad100 , -- Ca... SQLINES DEMO ***
			          p_Total100 , -- To... SQLINES DEMO ***
			          p_Cantidad50 , -- Ca... SQLINES DEMO ***
			          p_Total50 , -- To... SQLINES DEMO ***
			          p_Cantidad20, -- Ca... SQLINES DEMO ***
			          p_Total20 , -- To... SQLINES DEMO ***
			          p_Cantidad10 , -- Ca... SQLINES DEMO ***
			          p_Total10 , -- To... SQLINES DEMO ***
			          p_Cantidad5 , -- Ca... SQLINES DEMO ***
			          p_Total5 , -- To... SQLINES DEMO ***
			          p_Cantidad1 , -- Ca... SQLINES DEMO ***
			          p_Total1 , -- To... SQLINES DEMO ***
			          p_Cantidad050, -- Ca... SQLINES DEMO ***
			          p_Total050 , -- To... SQLINES DEMO ***
			          p_Cantidad025 , -- Ca... SQLINES DEMO ***
			          p_Total025 , -- To... SQLINES DEMO ***
			          p_Cantidad010 , -- Ca... SQLINES DEMO ***
			          p_Total010 , -- To... SQLINES DEMO ***
			          p_Cantidad005, -- Ca... SQLINES DEMO ***
			          p_Total005 , -- To... SQLINES DEMO ***
			          p_Cantidad001 , -- Ca... SQLINES DEMO ***
			          p_Total001 , -- To... SQLINES DEMO ***
			          p_GranTotal , -- Gr... SQLINES DEMO ***
			          'grabada'  -- Es... SQLINES DEMO ***
			        );
		Commit;
	End
	
	
 //

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_DetalleKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_DetalleKit`
(
p_idKit INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_Precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_Serie LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_DetalleKit
			        ( id_kit ,
			          id_producto ,
			          descripcion_producto ,
			          precio_producto ,
			          cantidad_detalleKit ,
			          numero_serie
			        )
			VALUES  ( p_idKit , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_Precio , -- SQLINES DEMO ***  money
			          p_cantidad , -- SQLINES DEMO *** it - float
			          p_Serie  -- SQLINES DEMO *** archar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_DetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_DetalleVenta`
(
p_idVenta INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE,
p_serie LONGTEXT,
p_fecha DATETIME(3),
p_medida LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_DetalleVenta
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
			VALUES  ( p_idVenta , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_precio , -- SQLINES DEMO ***  money
			          p_cantidad , -- SQLINES DEMO ***  - float
			          p_idKardex , -- id... SQLINES DEMO ***
			          p_porcentajeIva , -- SQLINES DEMO *** loat
			          p_porcentajeDescuento , -- SQLINES DEMO *** to - float
			          p_serie , -- SQLINES DEMO *** rchar(max)
			          p_fecha,  -- SQLINES DEMO *** atetime
								p_medida
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_Documentos`
(
 p_id INT,
 p_nombre LONGTEXT,
 p_abrevia NVARCHAR(50),
 p_serie NVARCHAR(50),
 p_idTipo INT,
 p_inicio INT,
 p_fin INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_Documentos
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
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_nombre , -- SQLINES DEMO *** - nvarchar(max)
			          p_abrevia , -- SQLINES DEMO *** ento - nvarchar(50)
			          p_serie , -- SQLINES DEMO ***  nvarchar(50)
			          p_idTipo , -- SQLINES DEMO *** ago - int
			          p_inicio , -- SQLINES DEMO *** - int
			          p_fin,  -- SQLINES DEMO ***  int
								1,
								0
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_FacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE	 PROCEDURE `SP_Inserta_FacturasCompras`
(
 p_idCompra INT, 
 p_documento LONGTEXT,
 p_monto DECIMAL(15,4), 
 p_iva DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_FacturasCompras
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
			          NOW(3) , -- SQLINES DEMO *** ra - datetime
			          p_idCompra , -- id... SQLINES DEMO ***
			          p_documento , -- SQLINES DEMO *** compra - nvarchar(max)
			          p_monto , -- SQLINES DEMO *** ra - money
			          p_iva , -- SQLINES DEMO ***  - money
			          0 , -- SQLINES DEMO ***  - money
			          0 , -- SQLINES DEMO ***  - money
			          1  -- SQLINES DEMO *** pra - int
			        );

	

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_FacturasVentas`
(
 p_idVenta INT, 
 p_documento LONGTEXT,
 p_monto DECIMAL(15,4), 
 p_iva DECIMAL(15,4), 
 p_isr DECIMAL(15,4), 
 p_iso DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_FacturasVentas
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
			          NOW(3) , -- SQLINES DEMO *** a - datetime
			          p_idVenta , -- id... SQLINES DEMO ***
			          p_documento , -- SQLINES DEMO *** venta - nvarchar(max)
			          p_monto , -- SQLINES DEMO *** a - money
			          p_iva , -- SQLINES DEMO *** - money
			          p_isr , -- SQLINES DEMO *** - money
			          p_iso , -- SQLINES DEMO *** - money
			          1  -- SQLINES DEMO *** ta - int
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_FormaPago`
(
 p_descripcion NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_FormaPago
			        ( descripcion_formaPago )
			VALUES  ( p_descripcion  -- SQLINES DEMO *** Pago - nvarchar(50)
			          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_Iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_Iva`
(
 p_id INT, 
 p_descripcion LONGTEXT,
 p_tarifa DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_iva
			        ( id_iva, descripcion_iva, tarifa_iva )
			VALUES  ( p_id,
					  p_descripcion, -- SQLINES DEMO ***  nvarchar(max)
			          p_tarifa  -- ta... SQLINES DEMO ***
			          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_Kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_Kit`
(
 OUT p_id INT,
p_fecha DATETIME(3),
p_fechavence DATETIME(3),
p_idProducto INT,
p_precio	DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_kit
			        ( fecha_kit ,
			          fechavence_kit ,
			          id_producto ,
			          precio_kit,
				        estado_kit
			        )
			VALUES  ( p_fecha , -- SQLINES DEMO *** ime
			          p_fechavence , -- SQLINES DEMO *** datetime
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_precio, -- pr... SQLINES DEMO ***
			          1
							);

SET p_id = LAST_INSERT_ID();
				SELECT p_id
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_LogUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_LogUsuarios`
(
p_usuario NVARCHAR(50),
p_ip nvarchar(100)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO tbl_LogUusarios
		(
			usuario_empleado,
			log,
			ipLocal,
			fecha_log
		)
		VALUES
		(
			p_usuario,
			1,
			p_ip,
			now(3)
		);

		Commit;
	End
	
//

DELIMITER ;


 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_MovimientoCuentaCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_MovimientoCuentaCliente`
(
 p_idClien INT, 
 p_idFPago INT, 
 p_descrip LONGTEXT,
 p_debito DECIMAL(15,4),
 p_credito DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_MovimientoCuentaClientes
			        ( fecha_movimiento ,
			          id_cliente ,
			          id_formaPago ,
			          descripcion_movimiento ,
			          debito_movimiento ,
			          credito_movimiento
			        )
			VALUES  ( NOW(3) , -- SQLINES DEMO *** - datetime
			          p_idClien , -- id... SQLINES DEMO ***
			          p_idFPago , -- id... SQLINES DEMO ***
			          p_descrip , -- SQLINES DEMO *** iento - nvarchar(max)
			          p_debito , -- SQLINES DEMO ***  - money
			          p_credito  -- SQLINES DEMO *** o - money
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_MovimientoCuentaProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_MovimientoCuentaProveedor`
(
 p_idProv INT, 
 p_idFPago INT, 
 p_descrip LONGTEXT,
 p_debito DECIMAL(15,4),
 p_credito DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
				-- SQLINES LICENSE FOR EVALUATION USE ONLY
				INSERT INTO	tbl_MovimientoCuentaProveedores
				        ( fecha_movimiento ,
				          id_proveedor ,
				          id_formaPago ,
				          descripcion_movimiento ,
				          debito_movimiento ,
				          credito_movimiento
				        )
				VALUES  ( NOW(3) , -- SQLINES DEMO *** - datetime
				          p_idProv , -- id... SQLINES DEMO ***
				          p_idFPago , -- id... SQLINES DEMO ***
				          p_descrip , -- SQLINES DEMO *** iento - nvarchar(max)
				          p_debito , -- SQLINES DEMO ***  - money
				          p_credito  -- SQLINES DEMO *** o - money
				        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_Proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
delimiter //

create PROCEDURE `SP_Inserta_Proforma`
(
p_id INT, 
p_fecha DATETIME(3), 
p_idCliente INT, 
p_idBodega INT,
p_idForma INT, 
p_total DECIMAL(15,4), 
p_idDoc INT,
p_documento LONGTEXT, 
p_observa LONGTEXT,
p_usuario LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
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
			 p_id,
			 p_fecha,
			 p_idCliente,
			 p_idBodega,
			 p_idForma,
			 p_total,
			 p_idDoc,
			 p_documento,
			 p_observa,
			 p_usuario,
			 1
			);

		Commit;
	End
	
	
//

delimiter ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_SubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_SubCategoria`
(
 p_id INT,
 p_descripcion longtext,
 p_idCat int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_Sub_Categoria
			        ( 
					  id_subcategoria ,
			          descripcion_subcategoria,
					  id_categoria
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_descripcion,  -- SQLINES DEMO *** oria - nvarchar(max)
					  p_idCat
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_TarjetaCredito`
(
 p_id INT,
 p_descrip VARCHAR(50),
 p_tarifa DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_TarjetaCredito
			        ( id_tarjeta ,
			          descripcion_tarjeta ,
			          tarifa_tarjeta
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_descrip , -- SQLINES DEMO *** ta - varchar(50)
			          p_tarifa  -- SQLINES DEMO *** float
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_TipoDocumentoPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_TipoDocumentoPago`
(
 p_id INT,
 p_descripcion NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_TipoDocumentoPagos
			        ( id_tipoDocumentoPago ,
			          descripcion_tipoDocumentoPago
			        )
			VALUES  ( p_id , -- SQLINES DEMO *** ago - int
			          p_descripcion  -- SQLINES DEMO *** ocumentoPago - nvarchar(50)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Inserta_Venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Inserta_Venta`
(
p_id INT, 
p_fecha DATETIME(3), 
p_idCliente INT, 
p_idBodega INT,
p_idForma INT, 
p_total DECIMAL(15,4), 
p_idDoc INT,
p_documento LONGTEXT, 
p_observa LONGTEXT,
p_plazo INT,
p_boleta INT,
p_deposito DECIMAL(15,4),
p_diff DECIMAL(15,4),
p_usuario LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT	INTO tbl_venta
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
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_fecha , -- SQLINES DEMO *** etime
			          p_idCliente , -- id... SQLINES DEMO ***
			          p_idBodega , -- id... SQLINES DEMO ***
			          p_idForma , -- id... SQLINES DEMO ***
			          p_total , -- to... SQLINES DEMO ***
			          p_idDoc , -- id... SQLINES DEMO ***
			          p_documento , -- SQLINES DEMO *** har(max)
			          p_observa , -- SQLINES DEMO *** ta - nvarchar(max)
			          p_plazo , -- pl... SQLINES DEMO ***
			          p_boleta , -- SQLINES DEMO *** nta - int
			          p_deposito , -- SQLINES DEMO *** money
			          p_diff,  -- SQLINES DEMO *** nta - money
								p_usuario,
		      		  1 --  SQLINES DEMO *** saccion cobrada en caja, 2 = pendiente de cobrar en caja
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Banco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Banco`
(
p_id INT,
p_descrip LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO tbl_banco
		        ( 
					id_banco,
					descripcion_banco )
		VALUES  ( 
					p_id,
					p_descrip  -- SQLINES DEMO ***  - varchar(max)
		          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Barra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Barra`
(
 p_id int,
 p_barra bigint
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_barra`
			(barra, id_producto)
			VALUES
			(p_barra, p_id);

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Bitaora]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Bitaora`
(
p_fecha DATE,
p_hora LONGTEXT,
p_usuario VARCHAR(50),
p_accion longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO tbl_bitacora
		        ( 
					fecha_bitacora,
					hora_bitacora,
					usuario,
					accion_bitacora
						)
		VALUES  ( 
					p_fecha,
					p_hora,
					p_usuario,
					p_accion
		          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Bodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Bodega`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_bodega`
			(id_bodega,nombre_bodega)
			VALUES
			(p_id,p_descripcion);

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_BodegaProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_BodegaProducto`
(
p_idBodega int,
p_idProducto int,
p_minimo double,
p_maximo double,
p_dias int,
p_cantidad double
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_bodegaProducto`
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
			p_idBodega,
			p_idProducto,
			0,
			p_minimo,
			p_maximo,
			p_dias,
			p_cantidad
			);

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Caja]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Caja`
(
 p_id INT,
 p_descripcion longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_cajas
			        ( id_caja, descripcion_caja )
			VALUES  ( p_id, -- id... SQLINES DEMO ***
			          p_descripcion  -- SQLINES DEMO *** - varchar(max)
			          );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CajaDiaria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CajaDiaria`
(
 p_idcaja int,
 p_montoApertura decimal(15,4),
 p_ingreso		decimal(15,4),
 p_ingresoCheque decimal(15,4),
 p_ingresoTarjeta decimal(15,4),
 p_egreso		decimal(15,4),
 p_cierre		decimal(15,4),
 p_saldo			decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_CajaDiaria`	
			        (
						  `fecha_movimiento` ,
						  `id_caja` ,
						  `montoApertura_movimiento` ,
						  `ingreso_movimiento` ,
							`ingresoCheque_movimiento`,
							`ingresoTarjeta_movimiento`,
						  `egreso_movimiento` ,
						  `cierre_movimiento` ,
						  `saldo_movimiento` ,
						  `estado_movimiento`
			        )
			VALUES  (
						  NOW(3) , -- SQLINES DEMO *** - datetime
						  p_idcaja , -- id... SQLINES DEMO ***
						  p_montoApertura , -- SQLINES DEMO *** imiento - money
						  p_ingreso , -- SQLINES DEMO *** o - money
						  p_ingresoCheque,
						  p_ingresoTarjeta,
						  p_egreso , -- SQLINES DEMO ***  - money
						  p_cierre , -- SQLINES DEMO ***  - money
						  p_saldo , -- SQLINES DEMO *** - money
						  1  -- SQLINES DEMO ***  - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CajaDiariaCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CajaDiariaCierre`
(
 p_idcaja int,
 p_cierre		decimal(15,4),
 p_saldo			decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_CajaDiaria`	
			        (
						  `fecha_movimiento` ,
						  `id_caja` ,
						  `montoApertura_movimiento` ,
						  `ingreso_movimiento` ,
						  `ingresoCheque_movimiento`,
						  `ingresoTarjeta_movimiento`,
						  `egreso_movimiento` ,
						  `cierre_movimiento` ,
						  `saldo_movimiento` ,
						  `estado_movimiento`
			        )
			VALUES  (
						  NOW(3) , -- SQLINES DEMO *** - datetime
						  p_idcaja , -- id... SQLINES DEMO ***
						  0,
						  0,
						  0,
						  0,
						  0,
						  p_cierre , -- SQLINES DEMO ***  - money
						  p_saldo  , -- SQLINES DEMO *** - money
						  4  -- SQLINES DEMO ***  - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        );

			UPDATE tbl_CajaDiaria SET
							estado_movimiento = 4 where id_caja = p_idcaja and estado_movimiento = 1 and montoApertura_movimiento > 0;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CajaDiariaIngreso]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CajaDiariaIngreso`
(
 p_idcaja int,
 p_ingreso		decimal(15,4),
 p_ingresoCheque decimal(15,4),
 p_ingresoTarjeta decimal(15,4),
 p_saldo			decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_CajaDiaria`	
			        (
						  `fecha_movimiento` ,
						  `id_caja` ,
							`montoApertura_movimiento`,
						  `ingreso_movimiento` ,
							`ingresoCheque_movimiento`,
							`ingresoTarjeta_movimiento`,
						  `saldo_movimiento` ,
						  `estado_movimiento`
			        )
			VALUES  (
						  NOW(3) , -- SQLINES DEMO *** - datetime
						  p_idcaja , -- id... SQLINES DEMO ***
							0,
						  p_ingreso , -- SQLINES DEMO *** o - money
							p_ingresoCheque,
							p_ingresoTarjeta,
						  p_saldo , -- SQLINES DEMO *** - money
						  1  -- SQLINES DEMO ***  - int (1 = APERTURA, 2 = INGRESO, 3 = EGRESO, 4 = CIERRE)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CalculoPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CalculoPrecioVenta`
(
p_descripcion LONGTEXT,
p_precioCosto DECIMAL(15,4),
p_envio	DECIMAL(15,4),
p_ganaciaPromedio DOUBLE,
p_costoTotal DECIMAL(15,4),
p_precioVenta	DECIMAL(15,4),
p_precioSinIvaVenta DECIMAL(15,4),
p_ivaCalculado DECIMAL(15,4),
p_isrCalculado DECIMAL(15,4),
p_isoCalculado DECIMAL(15,4),
p_totalImpuesto DECIMAL(15,4),
p_gananciaReal DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_calculoPrecioVenta`
			        ( `fecha_calculo` ,
			          `descripcion_calculo` ,
			          `precio_costo` ,
			          `envio_costo` ,
			          `ganacia_promedio` ,
			          `costo_total` ,
			          `precio_venta` ,
			          `precioSinIva_venta` ,
			          `iva_calculado` ,
			          `isr_calculado` ,
			          `iso_calculado` ,
			          `total_impuesto` ,
			          `ganancia_real`
			        )
			VALUES  ( NOW(3) , -- SQLINES DEMO *** atetime
			          p_descripcion, -- SQLINES DEMO *** lo - nvarchar(max)
			          p_precioCosto , -- SQLINES DEMO *** ney
			          p_envio, -- en... SQLINES DEMO ***
			          p_ganaciaPromedio, -- SQLINES DEMO *** - float
			          p_costoTotal , -- co... SQLINES DEMO ***
			          p_precioVenta , -- SQLINES DEMO *** ney
			          p_precioSinIvaVenta , -- SQLINES DEMO *** a - money
			          p_ivaCalculado , -- SQLINES DEMO *** oney
			          p_isrCalculado , -- SQLINES DEMO *** oney
			          p_isoCalculado , -- SQLINES DEMO *** oney
			          p_totalImpuesto , -- SQLINES DEMO *** money
			          p_gananciaReal  -- SQLINES DEMO *** oney
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Categoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Categoria`
(
p_id INT,
 p_descripcion longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_categoria
			        ( 
						id_categoria,
						descripcion_categoria )
			VALUES  ( 
						p_id, -- id ... SQLINES DEMO ***
						p_descripcion  -- SQLINES DEMO *** oria - nvarchar(max)
			          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Cliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Cliente`
(
p_id INT,
p_nit LONGTEXT,
p_nombre LONGTEXT,
p_idMunicipio int,
p_direccion LONGTEXT,
p_telefono1 NVARCHAR(20),
p_telefono2 NVARCHAR(20),
p_email LONGTEXT,
p_notas LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_cliente`
			        ( `id_cliente` ,
			          `nit_cliente` ,
			          `nombre_cliente` ,
			          `id_municipio` ,
			          `direccion_cliente` ,
			          `telefono1_cliente` ,
			          `telefono2_cliente` ,
			          `email_cliente` ,
			          `notas_cliente`
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_nit , -- SQLINES DEMO *** rchar(max)
			          p_nombre , -- SQLINES DEMO *** nvarchar(max)
			          p_idMunicipio , -- id... SQLINES DEMO ***
			          p_direccion , -- SQLINES DEMO ***  - nvarchar(max)
			          p_telefono1 , -- SQLINES DEMO ***  - nvarchar(20)
			          p_telefono2 , -- SQLINES DEMO ***  - nvarchar(20)
			          p_email , -- SQLINES DEMO *** varchar(max)
			          p_notas  -- SQLINES DEMO *** ext
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Compra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Compra`
(
p_id INT,
p_fechaCompra DATETIME(3),
p_idProveedor INT,
p_idBodega INT,
p_idFormaPago INT,
p_documentoCompra LONGTEXT,
p_totalCompra DECIMAL(15,4),
p_notas LONGTEXT,
p_plazo INT,
p_boleta LONGTEXT,
p_deposito DECIMAL(15,4),
p_diff DECIMAL(15,4),
p_usuario longtext
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT	INTO	tbl_compra
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
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_fechaCompra , -- SQLINES DEMO *** tetime
			          p_idProveedor , -- id... SQLINES DEMO ***
			          p_idBodega , -- id... SQLINES DEMO ***
			          p_idFormaPago , -- id... SQLINES DEMO ***
			          p_documentoCompra , -- SQLINES DEMO *** - nvarchar(max)
			          p_totalCompra , -- SQLINES DEMO *** ney
			          p_notas , -- no... SQLINES DEMO ***
			          p_plazo , -- pl... SQLINES DEMO ***
			          p_boleta , -- SQLINES DEMO *** mpra - int
			          p_deposito , -- SQLINES DEMO ***  money
			          p_diff , -- SQLINES DEMO *** mpra - money
			          p_usuario  -- SQLINES DEMO *** nvarchar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Conceptos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Conceptos`
(
p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_conceptos`
			        ( `descripcion_concepto` )
			VALUES  ( p_descripcion  -- SQLINES DEMO *** pto - nvarchar(max)
			          );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_ControlCajaApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_ControlCajaApertura`
(
p_id INT,
p_fechaControl DATETIME(3),
p_idCaja INT,
p_control INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_ControlCajasApertura
			        ( id_control,
					  fecha_control ,
			          id_caja ,
			          control_control 
			        )
			VALUES  ( p_id, -- idc... SQLINES DEMO ***
								p_fechaControl , -- SQLINES DEMO *** atetime
								p_idCaja,  -- id... SQLINES DEMO ***
			          p_control
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CuentaPorCobrar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CuentaPorCobrar`
(
p_id INT,
p_fecha DATETIME(3),
p_fehcaV DATETIME(3),
p_idCliente INT,
p_idVentaRef INT,
p_documento LONGTEXT,
p_monto DECIMAL(15,4),
p_plazo DOUBLE,
p_idInteres INT,
p_cuotaProgramada DECIMAL(15,4),
p_saldoProgramado DECIMAL(15,4),
p_idInteresMora INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_cuentasPorCobrar`
			        ( `id_cuentacobro`,
			          `fecha_cuentaCobro` ,
								`fechaVence_CuentaPorCobrar`,
			          `id_cliente` ,
			          `id_ventaReferencia` ,
			          `documento_venta` ,
			          `monto_cuentaCobro` ,
			          `plazo_cuentaCobro` ,
			          `id_interes` ,
			          `cuotaProgramada` ,
			          `saldoProgramado` ,
			          `id_InteresMora` ,
			          `estado_cuentaCobro`
			        )
			VALUES  ( 
			          p_id, -- idc... SQLINES DEMO ***
								p_fecha , -- SQLINES DEMO ***  - datetime
								p_fehcaV,
			          p_idCliente , -- id... SQLINES DEMO ***
			          p_idVentaRef , -- SQLINES DEMO *** a - int
			          p_documento , -- SQLINES DEMO ***  varchar(max)
			          p_monto , -- SQLINES DEMO ***  - money
			          p_plazo , -- SQLINES DEMO ***  - float
			          p_idInteres , -- id... SQLINES DEMO ***
			          p_cuotaProgramada , -- SQLINES DEMO ***  money
			          p_saldoProgramado , -- SQLINES DEMO ***  money
			          p_idInteresMora , -- SQLINES DEMO *** float
			          1  -- SQLINES DEMO *** o - int
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_CuentaPorPagar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_CuentaPorPagar`
(
p_id INT,
p_fecha DATETIME(3),
p_fechaVence DATETIME(3),
p_idProveedor INT,
p_documento LONGTEXT,
p_monto DECIMAL(15,4),
p_plazo DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_CuentaPorPagar
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
			VALUES  ( p_id , -- SQLINES DEMO ***  - int
			          p_fecha , -- SQLINES DEMO *** gar - datetime
			          p_fechaVence , -- SQLINES DEMO *** PorPagar - datetime
			          p_idProveedor , -- id... SQLINES DEMO ***
			          p_documento , -- SQLINES DEMO *** orPagar - nvarchar(max)
			          p_monto , -- SQLINES DEMO *** gar - money
			          p_plazo , -- SQLINES DEMO *** gar - float
			          0 , -- SQLINES DEMO *** gar - money
			          1  -- SQLINES DEMO *** agar - int
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Departamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Departamento`
(
p_id INT,
p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_departamento`
			        ( `id_departamento`,`nombre_departamento` )
			VALUES  ( 
						p_id,
						p_descripcion  -- SQLINES DEMO *** to - nvarchar(max)
			          );
			       
			        

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetalleCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetalleCompra`
(
p_idCompra INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_costo DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE
)


	BEGIN	
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_DetalleCompra
			        ( id_compra ,
			          id_producto ,
			          descripcion_producto ,
			          costo_producto ,
			          cantidad_producto ,
			          id_kardex ,
			          porcentajeIva_Producto ,
			          porcentajeDescuento_producto
			        )
			VALUES  ( p_idCompra , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_costo , -- SQLINES DEMO *** money
			          p_cantidad , -- SQLINES DEMO ***  - float
			          p_idKardex , -- id... SQLINES DEMO ***
			          p_porcentajeIva , -- SQLINES DEMO *** ducto - float
			          p_porcentajeDescuento  -- SQLINES DEMO *** to_producto - float
			        );
		COMMIT;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE	PROCEDURE `SP_Insertar_DetalleDevolucionCliente`
(
p_idDevCliente INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_precio DECIMAL(15,4),
p_cantidad DOUBLE,
p_idKardex INT,
p_porcentajeIva DOUBLE,
p_porcentajeDescuento DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_DetalleDevolucionCliente`
			        ( `id_devolucionCliente` ,
			          `id_producto` ,
			          `descripcion_producto` ,
			          `precio_producto` ,
			          `cantidad_producto` ,
			          `id_kardex` ,
			          `porcentajeIva` ,
			          `porcentajeDescuento`
			        )
			VALUES  ( p_idDevCliente , -- SQLINES DEMO *** nte - int
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_precio , -- SQLINES DEMO ***  float
			          p_cantidad , -- SQLINES DEMO ***  - float
			          p_idKardex , -- id... SQLINES DEMO ***
			          p_porcentajeIva , -- SQLINES DEMO *** loat
			          p_porcentajeDescuento  -- SQLINES DEMO *** to - float
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetalleInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetalleInventario`
(
p_idInventario INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_stock DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_detalle_inventario`
			        ( `id_inventario` ,
			          `id_producto` ,
			          `descripcion_producto`,
					  `stock_producto`
			        )
			VALUES  ( p_idInventario , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_stock  -- SQLINES DEMO *** float
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetallePagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetallePagoCredito`
(
p_idPagocre INT,
p_idTabla INT,
p_montoPagocre DECIMAL(15,4),
p_moraPagocre DECIMAL(15,4),
p_diasPagocre DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_DetallePagoCredito`
			        ( `id_pagocre` ,
			          `id_tabla` ,
			          `monto_pagocre` ,
			          `mora_pagocre` ,
			          `dias_pagocre`
			        )
			VALUES  ( p_idPagocre , -- id... SQLINES DEMO ***
			          p_idTabla , -- id... SQLINES DEMO ***
			          p_montoPagocre , -- SQLINES DEMO *** oney
			          p_moraPagocre , -- SQLINES DEMO *** ney
			          p_diasPagocre  -- SQLINES DEMO *** oat
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetallePagoCreditoContado`
(
p_idPagocrecont INT,
p_idCuentaCobro INT,
p_montoPagocrecont DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_DetallePagoCreditoContado`
			        ( `id_pagocrecont` ,
			          `id_cuentaCobro` ,
			          `monto_pagocrecont`
			        )
			VALUES  ( p_idPagocrecont , -- SQLINES DEMO *** int
			          p_idCuentaCobro , -- SQLINES DEMO *** int
			          p_montoPagocrecont  -- SQLINES DEMO ***  - money
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetallePedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetallePedido`
(
p_idPedido INT,
p_idProducto INT,
p_descripcionProducto LONGTEXT,
p_precioProducto DECIMAL(15,4),
p_cantidadPedido DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_detallePedido`
			        ( `id_pedido` ,
			          `id_producto` ,
			          `descripcion_producto` ,
			          `precio_producto` ,
			          `cantidad_pedido`
			        )
			VALUES  ( p_idPedido , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcionProducto , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_precioProducto , -- SQLINES DEMO ***  money
			          p_cantidadPedido  -- SQLINES DEMO ***  float
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetalleSalida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetalleSalida`
(
p_idSalida INT,
p_idProducto INT,
p_descripcion LONGTEXT,
p_cantidad DOUBLE,
p_idKardex INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_DetalleSalida
			        ( id_salida ,
			          id_producto ,
			          descripcion_salida ,
			          cantidad_salida ,
			          id_kardex
			        )
			VALUES  ( p_idSalida , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** a - nvarchar(max)
			          p_cantidad , -- SQLINES DEMO ***  float
			          p_idKardex  -- id... SQLINES DEMO ***
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_DetalleTraslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_DetalleTraslado`
(
 p_idTraslado INT, 
 p_idProducto INT, 
 p_descripcion LONGTEXT,
 p_cantidad DOUBLE, 
 p_idKardexOrigen INT, 
 p_idKardexDestino INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_detalleTraslado
			        ( id_traslado ,
			          id_producto ,
			          descripcion_producto ,
			          cantidad_traslado ,
			          id_kardexOrigen ,
			          id_KardexDestino
			        )
			VALUES  ( p_idTraslado , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_descripcion , -- SQLINES DEMO *** cto - nvarchar(max)
			          p_cantidad , -- SQLINES DEMO ***  - float
			          p_idKardexOrigen , -- SQLINES DEMO ***  int
			          p_idKardexDestino  -- SQLINES DEMO *** - int
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Empleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Empleado`
(
OUT p_id int,
p_nombre LONGTEXT,
p_apellido LONGTEXT,
p_direccion LONGTEXT,
p_telef1	LONGTEXT,
p_telef2 LONGTEXT,
p_fechanac DATETIME(3),
p_idTemp	INT,
p_usuario NVARCHAR(50),
p_pass NVARCHAR(50),
p_idRol INT,
p_idCaja INT,
p_idMuni INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_empleado
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
			          NOW(3) , -- SQLINES DEMO *** - datetime
			          p_nombre , -- SQLINES DEMO ***  nvarchar(max)
			          p_apellido , -- SQLINES DEMO ***  - nvarchar(max)
			          p_direccion , -- SQLINES DEMO *** o - nvarchar(max)
			          p_telef1 , -- SQLINES DEMO *** do - nvarchar(max)
			          p_telef2 , -- SQLINES DEMO *** o - nvarchar(max)
			          p_fechanac , -- SQLINES DEMO ***  - date
			          p_idTemp , -- id... SQLINES DEMO ***
			          p_usuario , -- SQLINES DEMO *** - nvarchar(50)
			          p_pass , -- SQLINES DEMO *** do - nvarchar(50)
			          p_idRol , -- id... SQLINES DEMO ***
			          p_idCaja , -- id... SQLINES DEMO ***
			          p_idMuni , -- id... SQLINES DEMO ***
			          1  -- SQLINES DEMO ***  int
			        );

			set p_id = Last_insert_id();

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Inventario`
(
p_idInventario INT,
p_fecha datetime(3), 
p_idBodega INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_Inventario
			        ( id_inventario ,
			          fecha_inventario ,
			          id_bodega ,
			          estado_categoria
			        )
			VALUES  ( p_idInventario , -- id... SQLINES DEMO ***
			          p_fecha , -- SQLINES DEMO *** - datetime
			          p_idBodega , -- id... SQLINES DEMO ***
			          0  -- SQLINES DEMO *** - int
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Kardex`
(
 OUT p_id INT,
 p_idBodega INT, 
 p_idProducto INT, 
 p_fecha DATETIME(3), 
 p_documento NVARCHAR(50),
 p_entrada DOUBLE, 
 p_salida DOUBLE, 
 p_saldo DOUBLE, 
 p_ultimoCosto DECIMAL(15,4), 
 p_costoPromedio DECIMAL(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_Kardex
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
			   		  p_idBodega , -- id... SQLINES DEMO ***
			          p_idProducto , -- id... SQLINES DEMO ***
			          p_fecha , -- SQLINES DEMO *** tetime
			          p_documento , -- SQLINES DEMO *** - nvarchar(50)
			          p_entrada , -- SQLINES DEMO *** float
			          p_salida , -- SQLINES DEMO *** loat
			          p_saldo , -- SQLINES DEMO *** oat
			          p_ultimoCosto , -- SQLINES DEMO *** x - money
			          p_costoPromedio  -- SQLINES DEMO *** dex - money
			        );

				SET p_id = LAST_INSERT_ID();
				SELECT p_id

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_marca`
(
p_id INT,
p_nombre LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO	tbl_marca
			        (id_marca, 
					nombre_marca )
			VALUES  (
					p_id,
					p_nombre  -- SQLINES DEMO *** archar(max)
			          );
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_municipio`
(
p_idMunicipio INT,	
p_idDepartamento INT,
p_nombre LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO `tbl_municipio`
			        ( `id_municipio`,
						`id_departamento` ,
			          `nombre_municipio`
			        )
			VALUES  ( p_idMunicipio , -- SQLINES DEMO ***  int
					  p_idDepartamento,
			          p_nombre  -- SQLINES DEMO *** - nvarchar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_PermisosRol`
(
 p_id INT, 
 p_idRol INT, 
 p_formulario LONGTEXT,
 p_puedeVer TINYINT, 
 p_puedeModificar TINYINT, 
 p_puedeBorrar TINYINT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_PermisosRol
			        ( id_rol ,
			          formulario_permisos ,
			          puedeVer ,
			          puedeModificar ,
			          puedeBorrar
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_formulario , -- SQLINES DEMO *** sos - varchar(max)
			          p_puedeVer , -- pu... SQLINES DEMO ***
			          p_puedeModificar , -- SQLINES DEMO *** bit
			          p_puedeBorrar  -- pu... SQLINES DEMO ***
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_PrecioCostoPorProductoByFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_PrecioCostoPorProductoByFecha`
(
p_idProducto INT, 
p_Costo DECIMAL(15,4), 
p_referencia NVARCHAR(50)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_PrecioCostoPorProductoByFecha
			(
			fecha_PreCostoProducto,
			id_producto, 
			costo_producto,
			referencia_compra
			)
			VALUES
			(
			NOW(3),
			p_idProducto,
			p_Costo,
			p_referencia
			);

			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_producto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_producto`
(
p_id INT,
p_sku LONGTEXT,
p_descrip LONGTEXT,
p_idSubCate INT,
p_idIva INT,
p_notas LONGTEXT,
p_idMarca INT,
p_modelo LONGTEXT,
p_idTProd int,
p_costo Decimal(15,4)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_Producto
			        ( 
								id_producto ,
			          sku_producto ,
			          descripcion_producto ,
			          id_Sub_Categoria ,
			          id_iva ,
			          notas_producto ,
			          id_marca ,
			          modelo_producto ,
			          id_tproducto,
								costo_producto
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_sku , -- SQLINES DEMO *** archar(max)
			          p_descrip, -- SQLINES DEMO *** cto - nvarchar(max)
			          p_idSubCate , -- id... SQLINES DEMO ***
			          p_idIva ,
			          p_notas , -- SQLINES DEMO *** text
			          p_idMarca , -- id... SQLINES DEMO ***
			          p_modelo , -- SQLINES DEMO ***  nvarchar(max)
			          p_idTProd,  -- id... SQLINES DEMO ***
								p_costo
			        );
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_ProductUnidPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_ProductUnidPrecioVenta`
(
p_id INT,
p_idMedida INT,	
p_precio DECIMAL(15,4),
p_precioBase TINYINT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_ProductUnidPrecioVenta
			        ( id_producto ,
			          id_medida ,
			          precio ,
			          estado_prounidprecio,
								precioBase
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_idMedida , -- id... SQLINES DEMO ***
			          p_precio , -- pr... SQLINES DEMO ***
			          1,  -- SQLINES DEMO *** cio - bit
			          p_precioBase
							);
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_ProvBancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_ProvBancos`
(
 p_idProveedor INT, 
 p_idBanco INT, 
 p_cuenta LONGTEXT,
 p_nombre LONGTEXT,
 p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT	INTO tbl_provbancos
			        ( id_proveedor ,
			          id_banco ,
			          numero_cuenta ,
			          nombre_cuenta ,
			          descripcion_cuenta
			        )
			VALUES  ( p_idProveedor , -- id... SQLINES DEMO ***
			          p_idBanco , -- id... SQLINES DEMO ***
			          p_cuenta , -- SQLINES DEMO *** varchar(max)
			          p_nombre , -- SQLINES DEMO *** varchar(max)
			          p_descripcion  -- SQLINES DEMO *** a - nvarchar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Proveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Proveedor`
(
 p_id int,
 p_nombreJuridico LONGTEXT,
 p_nombreComercial LONGTEXT,
 p_direccion LONGTEXT,
 p_telef1 NVARCHAR(50),
 p_telef2 NVARCHAR(50),
 p_corrreo NVARCHAR(50),
 p_nit LONGTEXT,
 p_idIva INT,
 p_idMunicipio INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_proveedor
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
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_nombreJuridico , -- SQLINES DEMO *** or - varchar(max)
			          p_nombreComercial , -- SQLINES DEMO *** or - nvarchar(max)
			          p_direccion , -- SQLINES DEMO *** or - nvarchar(max)
			          p_telef1 , -- SQLINES DEMO *** or - nvarchar(50)
			          p_telef2 , -- SQLINES DEMO *** or - nvarchar(50)
			          p_corrreo , -- SQLINES DEMO *** - nvarchar(50)
			          p_nit , -- SQLINES DEMO *** varchar(max)
			          p_idIva , -- id... SQLINES DEMO ***
			          p_idMunicipio -- id... SQLINES DEMO ***
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Rol`
(
p_id INT, 
p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_rol
			        ( id_rol, descripcion_rol )
			VALUES  ( p_id, -- id... SQLINES DEMO ***
			          p_descripcion  -- SQLINES DEMO ***  varchar(max)
			          );
			        
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_SerieProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_SerieProducto`
(
p_id INT,
p_numero LONGTEXT,
p_cantidad DOUBLE,
p_fechaVC DATETIME(3),
p_fechaVV DATETIME(3)
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_SerieProducto
			        ( id_producto ,
			          numero_serie ,
			          disponible_serie ,
			          cantidad_serie,
					  fechaVenceCompra_serie,
					  fechaVenceVenta_serie

			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_numero , -- SQLINES DEMO *** rchar(max)
			          1 , -- SQLINES DEMO *** - bit
			          p_cantidad,  -- SQLINES DEMO *** float
					  p_fechaVC,
					  p_fechaVV
			        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_TipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_TipoEmpleado`
(
 p_descripcion longtext,
 p_id int
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_tipoEmpleado
			        ( id_templeado,
					  descripcion_templeado )
			VALUES  ( 
						p_id,
						p_descripcion  -- SQLINES DEMO *** eado - nvarchar(max)
			          );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_TipoProducto`
(
 p_id INT, 
 p_descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_TipoProducto
			        ( id_tproducto ,
			          descripcion_tproducto
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_descripcion  -- SQLINES DEMO *** ucto - nvarchar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_Traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_Traslado`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idBodegaOrigen INT, 
 p_idBodegaDestino INT, 
 p_Descripcion LONGTEXT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_traslado
			        ( id_traslado ,
			          fecha_traslado ,
			          id_bodegaOrigen ,
			          id_bodegaDestino ,
			          descripcion_traslado
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_fecha , -- SQLINES DEMO *** datetime
			          p_idBodegaOrigen , -- SQLINES DEMO ***  int
			          p_idBodegaDestino , -- SQLINES DEMO *** - int
			          p_Descripcion  -- SQLINES DEMO *** ado - nvarchar(max)
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Insertar_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Insertar_UnidadMedida`
(
 p_id INT,
 p_descrip NCHAR(10),
 p_cant DOUBLE
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
			-- SQLINES LICENSE FOR EVALUATION USE ONLY
			INSERT INTO tbl_UnidadMedida
			        ( id_medida ,
			          descripcion_medida ,
			          cantidad_medida
			        )
			VALUES  ( p_id , -- id... SQLINES DEMO ***
			          p_descrip , -- SQLINES DEMO *** a - nchar(10)
			          p_cant  -- SQLINES DEMO ***  float
			        );

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Instalar_Salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Instalar_Salida`
(
 p_id INT, 
 p_fecha DATETIME(3), 
 p_idConcepto INT, 
 p_idBodega INT
)


	Begin
		Declare continue handler for sqlexception
		Begin
			Rollback;
		End;
		Start Transaction;
		-- SQLINES LICENSE FOR EVALUATION USE ONLY
		INSERT INTO tbl_salida
		        ( id_salida ,
		          fecha_salida ,
		          id_concepto ,
		          id_bodega
		        )
		VALUES  ( p_id , -- id... SQLINES DEMO ***
		          p_fecha , -- SQLINES DEMO *** tetime
		          p_idConcepto , -- id... SQLINES DEMO ***
		          p_idBodega  -- id... SQLINES DEMO ***
		        );
		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Banco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Banco` (

p_criterio varchar(50))
	Begin
		SELECT id_banco, descripcion_banco
		 FROM tbl_banco
		  WHERE id_banco = p_criterio
			ORDER BY descripcion_banco;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BancoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BancoCodigo`()
BEGIN
	SELECT id_banco FROM tbl_banco;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Barra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Barra` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, barra 
		 FROM tbl_barra
		  WHERE id_producto = p_criterio
			ORDER BY id_producto;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Bitaora]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Bitaora`
(
p_criterio VARCHAR(50)
)


	Begin
		SELECT id_bitacora, fecha_bitacora,hora_bitacora, usuario, accion_bitacora
		FROM tbl_bitacora	
		WHERE usuario = p_criterio
		ORDER BY fecha_bitacora ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Bodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Bodega` (

p_criterio varchar(50))
	Begin
		SELECT id_bodega,nombre_bodega
		 FROM tbl_bodega
		  WHERE id_bodega = p_criterio
			ORDER BY  nombre_bodega;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaCodigo`()

BEGIN
SELECT id_bodega FROM tbl_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndBarra` (

p_criterio1 int,
p_criterio2 BIGINT)
	Begin
		SELECT tbl_bodegaProducto.id_bodega,tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN tbl_barra ON tbl_barra.id_producto = tbl_bodegaProducto.id_producto
		  WHERE id_bodega = p_criterio1 and tbl_barra.barra = p_criterio2;
	END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat` (
p_id_bodega INT,
p_idSubCat INT)
	Begin

SELECT	BP.id_bodega,
				B.nombre_bodega,	
				BP.id_producto,	
				P.descripcion_producto,
			BP.stock_producto
	FROM	tbl_bodegaProducto BP
	LEFT JOIN tbl_Producto P 
		ON BP.id_producto = P.id_producto
	LEFT JOIN tbl_Sub_Categoria SC 
		ON P.id_Sub_Categoria = SC.id_subcategoria
	LEFT JOIN tbl_bodega B
		ON BP.id_bodega = B.id_bodega
	WHERE ((p_id_bodega IS NULL) OR (BP.id_bodega = p_id_bodega))
	AND ((p_idSubCat IS NULL) OR (P.id_Sub_Categoria = p_idSubCat))
	ORDER BY p.descripcion_producto;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndIDProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndIDProducto` (

p_criterio1 int,
p_criterio2 int)
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = p_criterio1 and id_producto = p_criterio2;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoByIDBodegaAndSKU]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndSKU` (

p_criterio1 int,
p_criterio2 longtext)
	Begin
		SELECT tbl_bodegaProducto.id_bodega,tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN tbl_Producto ON tbl_Producto.id_producto = tbl_bodegaProducto.id_producto
		  WHERE id_bodega = p_criterio1 and tbl_Producto.sku_producto = p_criterio2;
	END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoIdBodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoIdBodega` (

p_criterio varchar(50))
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoIdProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoIdProducto` (

p_criterio varchar(50))
	Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoIdProductoJoin]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoIdProductoJoin` (

p_criterio varchar(50))
	Begin
		SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
		WHERE bp.id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_BodegaProductoInventarioByIdBodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_BodegaProductoInventarioByIdBodega` (

p_criterio varchar(50))
	Begin
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto,p.id_tproducto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		WHERE bp.id_bodega = p_criterio AND p.id_tproducto <> 4
		ORDER BY P.id_producto ASC;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CajaDiaria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CajaDiaria` (

p_criterio varchar(50))
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM tbl_CajaDiaria
		  WHERE id_caja = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CajaDiariaByIDCajaANDFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CajaDiariaByIDCajaANDFecha` (

p_criterio varchar(50),
p_desde DATE,
p_hasta DATE)
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,ingresoCheque_movimiento,
	  ingresoTarjeta_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM tbl_CajaDiaria
			WHERE CAST(DATE_FORMAT(fecha_movimiento,'%Y%m%d') AS UNSIGNED)
			BETWEEN CAST(DATE_FORMAT(p_desde, '%Y%m%d') AS UNSIGNED)
			AND CAST(DATE_FORMAT(p_hasta, '%Y%m%d')AS UNSIGNED)
		  AND id_caja = p_criterio 
			AND estado_movimiento = 1
			AND fecha_movimiento = (SELECT MAX(fecha_movimiento)
																FROM tbl_CajaDiaria
																WHERE CAST(DATE_FORMAT (fecha_movimiento,'%Y%m%d') AS UNSIGNED)
																BETWEEN CAST(DATE_FORMAT (p_desde, '%Y%m%d') AS UNSIGNED)
																AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
																AND id_caja = p_criterio
															);
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CajaDiariaByIDCajaANDFechaPrimero]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CajaDiariaByIDCajaANDFechaPrimero` (

p_criterio varchar(50),
p_desde DATE,
p_hasta DATE)
	Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,ingresoCheque_movimiento,
	  ingresoTarjeta_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM tbl_CajaDiaria
			WHERE CAST(DATE_FORMAT (fecha_movimiento,'%Y%m%d') AS UNSIGNED)
			BETWEEN CAST(DATE_FORMAT (p_desde, '%Y%m%d') AS UNSIGNED)
			AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
		  AND id_caja = p_criterio 
			AND estado_movimiento = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CajaDiariaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CajaDiariaCodigo`()
	Begin
		SELECT id_movimiento
		 FROM tbl_CajaDiaria;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Cajas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Cajas` (

p_criterio varchar(50))
	Begin
		SELECT id_caja,descripcion_caja
		 FROM tbl_cajas
		  WHERE id_caja = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CajasCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CajasCodigo`()

	Begin
		SELECT id_caja
		 FROM tbl_cajas;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CalculoPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CalculoPrecioVenta` (

p_criterio varchar(50))
	Begin
		SELECT id_calculo,fecha_calculo,descripcion_calculo,
			   precio_costo,envio_costo,ganacia_promedio,costo_total,
			   precio_venta, precioSinIva_venta,iva_calculado,isr_calculado,
			   iso_calculado,total_impuesto,ganancia_real
		 FROM tbl_calculoPrecioVenta
		  WHERE id_calculo = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Categoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Categoria` (

p_criterio varchar(50))
	Begin
		SELECT id_categoria,descripcion_categoria
		 FROM tbl_categoria
		  WHERE id_categoria = p_criterio
		ORDER BY descripcion_categoria;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CategoriaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CategoriaCodigo`()

	Begin
		SELECT id_categoria
		 FROM tbl_categoria;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Cliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Cliente` (

p_criterio varchar(50))
	Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM tbl_cliente
		  WHERE id_cliente = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ClienteByNit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ClienteByNit` (

p_criterio varchar(50))
	Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM tbl_cliente
		  WHERE nit_cliente = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ClienteCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ClienteCodigo`()
BEGIN
	SELECT id_cliente FROM tbl_cliente;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Compra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Compra` (

p_criterio varchar(50))
	Begin
		SELECT id_compra,fecha_compra,id_proveedor,id_bodega,
				id_formaPago,documento_compra,total_compra, 
				notas_compra, plazo_compra, boletaDeposito_compra,
				deposito_compra, diffDepoCompra_compra, usuario_compra

		 FROM tbl_compra
		  WHERE documento_compra = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CompraCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CompraCodigo`()
BEGIN
	SELECT id_compra FROM tbl_compra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Conceptos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Conceptos` (

p_criterio varchar(50))
	Begin
		SELECT id_concepto,descripcion_concepto
		 FROM tbl_conceptos
		  WHERE id_concepto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlArqueo` (

p_criterio varchar(50))
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM tbl_ControlArqueo
		  WHERE id_control = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlArqueoCierre` (

p_criterio varchar(50))
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM tbl_ControlArqueoCierre
		  WHERE id_control = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlArqueoCierreCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlArqueoCierreCodigo`()

	Begin
		SELECT id_control
		 FROM tbl_ControlArqueoCierre;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlArqueoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlArqueoCodigo`()

	Begin
		SELECT id_control
		 FROM tbl_ControlArqueo;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlCajaApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlCajaApertura` (

p_criterio varchar(50))
	Begin
		SELECT id_control,fecha_control,id_caja,control_control

		 FROM tbl_ControlCajasApertura
		  WHERE id_caja = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ControlCajaAperturaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ControlCajaAperturaCodigo`()

	Begin
		SELECT id_control
		 FROM tbl_ControlCajasApertura;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorCobrar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorCobrar` (

p_criterio varchar(50))
	Begin
		SELECT id_cuentaCobro,fecha_cuentaCobro,fechaVence_CuentaPorCobrar,
					id_cliente,id_ventaReferencia,documento_venta,monto_cuentaCobro,
					plazo_cuentaCobro,id_interes,cuotaProgramada,saldoProgramado,
					id_InteresMora,estado_cuentaCobro

		 FROM tbl_cuentasPorCobrar
		  WHERE id_cliente = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha` (

p_criterio varchar(50))
	Begin
		SELECT id_cuentaCobro,fecha_cuentaCobro,fechaVence_CuentaPorCobrar,
					id_cliente,id_ventaReferencia,documento_venta,monto_cuentaCobro,
					plazo_cuentaCobro,id_interes,cuotaProgramada,saldoProgramado,
					id_InteresMora,estado_cuentaCobro

		 FROM tbl_cuentasPorCobrar
		  WHERE id_cuentaCobro = p_criterio
			AND estado_cuentaCobro = 1 
			AND fecha_cuentaCobro = (SELECT MAX(fechaVence_CuentaPorCobrar) from tbl_cuentasPorCobrar WHERE id_cuentaCobro = p_criterio);
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorCobrarCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorCobrarCodigo`()

	Begin
		SELECT id_cuentaCobro
		 FROM tbl_cuentasPorCobrar;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorPagar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorPagar` (

p_criterio varchar(50))
	Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM tbl_CuentaPorPagar
		  WHERE id_CuentaPorPagar = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorPagarByIDProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorPagarByIDProveedor` (

p_criterio varchar(50))
	Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM tbl_CuentaPorPagar
		  WHERE id_proveedor = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_CuentaPorPagarCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_CuentaPorPagarCodigo`()

	Begin
		SELECT id_CuentaPorPagar

		 FROM tbl_CuentaPorPagar;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Departamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Departamento` (

p_criterio varchar(50))
	Begin
		SELECT id_departamento, nombre_departamento
		 FROM tbl_departamento
		  WHERE id_departamento = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_departamentoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_departamentoCodigo`()

BEGIN

		SELECT id_departamento
		 FROM tbl_departamento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleCompra` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_compra,id_producto,descripcion_producto,
		       costo_producto,cantidad_producto,id_kardex,porcentajeIva_Producto,
			   porcentajeDescuento_producto
		 FROM tbl_DetalleCompra
		  WHERE id_compra = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE	PROCEDURE `SP_Listar_DetalleDevolucionCliente` (

p_criterio varchar(50))
	Begin
		SELECT id_liena,id_devolucionCliente,id_producto,
		       descripcion_producto,precio_producto,cantidad_producto,
			   id_kardex,porcentajeIva, porcentajeDescuento
		 FROM tbl_DetalleDevolucionCliente
		  WHERE id_devolucionCliente = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleInventario` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_inventario,id_producto,descripcion_producto,stock_producto

		 FROM tbl_detalle_inventario
		  WHERE id_inventario = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleKit` (

p_criterio varchar(50))
	Begin
		SELECT id_kit,id_producto,descripcion_producto,cantidad_detalleKit,precio_producto,numero_serie
		 FROM tbl_DetalleKit
		  WHERE id_kit = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetallePagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetallePagoCredito` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_pagocre,id_tabla,monto_pagocre,mora_pagocre,dias_pagocre
		 FROM tbl_DetallePagoCredito
		  WHERE id_pagocre = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE	PROCEDURE `SP_Listar_DetallePagoCreditoContado` (

p_criterio varchar(50))
	Begin
		SELECT id_linea, id_pagocrecont,id_cuentaCobro,monto_pagocrecont
		 FROM tbl_DetallePagoCreditoContado
		  WHERE id_pagocrecont = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_detallePedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_detallePedido` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_pedido,id_producto,descripcion_producto,precio_producto,cantidad_pedido
		 FROM tbl_detallePedido
		  WHERE id_pedido = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleSalida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleSalida` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_salida,id_producto,descripcion_salida,
		       cantidad_salida,id_kardex
		 FROM tbl_DetalleSalida
		  WHERE id_salida = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleTraslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleTraslado` (

p_criterio varchar(50))
	Begin
		SELECT id_linea, id_traslado, id_producto, descripcion_producto, cantidad_traslado, id_kardexOrigen, id_KardexDestino
		 FROM tbl_detalleTraslado
		  WHERE id_traslado = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DetalleVenta` (

p_criterio varchar(50))
	Begin
		SELECT id_linea,id_venta,id_producto,descripcion_producto,
		       precio_producto,cantidad_producto,id_kardex,porcentajeIva,
			   porcentajeDescuento, numeroSerie, fechaGarantia,descripcion_medida
		 FROM tbl_DetalleVenta
		  WHERE id_venta = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Documentos` (

p_criterio varchar(50))
	Begin
		SELECT *
		 FROM tbl_Documentos
		  WHERE id_documento = p_criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DocumentosByFactura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DocumentosByFactura` (

p_criterio varchar(50))
	Begin
		SELECT *
		 FROM tbl_Documentos
		  WHERE id_documento = p_criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_DocumentosCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_DocumentosCodigo`()

	Begin
		SELECT id_documento
		 FROM tbl_Documentos;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_FacturasComprasCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_FacturasComprasCodigo`()

	Begin
		SELECT id_facturacompra
		 FROM tbl_FacturasCompras;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_FacturasComrpas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_FacturasComrpas` (

p_criterio varchar(50))
	Begin
		SELECT id_facturacompra, fecha_facturacompra, id_compra,
		documento_facturacompra, monto_facturacompra, iva_facturacompra, 
		isr_facturacompra, iso_facturacompra, estado_facturacompra
		 FROM tbl_FacturasCompras
		  WHERE id_compra = p_criterio AND estado_facturacompra = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_FacturasVentas` (

p_criterio varchar(50))
	Begin
		SELECT id_facturaventa, fecha_facturaventa, id_venta,
		documento_facturaventa, monto_facturaventa, iva_facturaventa, 
		isr_facturaventa, iso_facturaventa, estado_facturaventa
		 FROM tbl_FacturasVentas
		  WHERE id_venta = p_criterio AND estado_facturaventa = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_FacturasVentasCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_FacturasVentasCodigo`()

	Begin
		SELECT id_facturaventa
		 FROM tbl_FacturasVentas;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_FormaPago` (

p_criterio varchar(50))
	Begin
		SELECT id_formaPago,descripcion_formaPago
		 FROM tbl_FormaPago
		  WHERE id_formaPago = p_criterio
		ORDER BY descripcion_formaPago;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Inventario` (

p_criterio varchar(50))
	Begin
		SELECT id_inventario, fecha_inventario, id_bodega, estado_categoria
		 FROM tbl_Inventario
		  WHERE id_inventario = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_InventarioCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_InventarioCodigo`()
	Begin
		SELECT id_inventario
			FROM tbl_Inventario;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Iva` (

p_criterio varchar(50))
	Begin
		SELECT id_iva, descripcion_iva, tarifa_iva
		 FROM tbl_iva
		  WHERE id_iva = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_IvaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_IvaCodigo`()
	Begin
		SELECT id_iva
		 FROM tbl_iva;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Kardex` (

p_criterio varchar(50))
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_KardexByIDProductoANDByIDBodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_KardexByIDProductoANDByIDBodega` (

p_criterio1 varchar(50),
p_criterio2 varchar(50))
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = p_criterio1 and id_bodega = p_criterio2 ORDER BY fecha_kardex;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_KardexCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_KardexCodigo`()
	Begin
		SELECT id_kardex
		 FROM tbl_Kardex;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Kit` (

p_criterio varchar(50))
	Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		FROM tbl_kit
		  WHERE id_producto = p_criterio and estado_kit = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_KitCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_KitCodigo`()

	Begin
		SELECT id_kit
		FROM tbl_kit;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_LogUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_LogUsuarios` (

p_criterio varchar(50))
	Begin
		SELECT id_log,usuario_empleado,log,ipLocal,fecha_log
		 FROM tbl_LogUusarios
		  WHERE usuario_empleado = p_criterio
			AND log = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_LogUsuariosCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_LogUsuariosCodigo`()
BEGIN
	SELECT id_log FROM tbl_LogUusarios;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_marca` (

p_criterio varchar(50))
	Begin
		SELECT id_marca, nombre_marca
		 FROM tbl_marca
		  WHERE id_marca = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_marcaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_marcaCodigo`()

	Begin
		SELECT id_marca
		 FROM tbl_marca;

	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_MovimientoCuentaCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_MovimientoCuentaCliente` (
p_criterio VARCHAR(50))
	Begin
		SELECT id_movimiento, fecha_movimiento, id_cliente, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM tbl_MovimientoCuentaClientes
		 WHERE id_cliente = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_MovimientoCuentaProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_MovimientoCuentaProveedor` (
p_criterio VARCHAR(50))
	Begin
		SELECT id_movimiento, fecha_movimiento, id_proveedor, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM tbl_MovimientoCuentaProveedores
		 WHERE id_proveedor = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_MovimientoCuentaProveedorCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_MovimientoCuentaProveedorCodigo`()

	Begin
		SELECT id_movimiento
		 FROM tbl_MovimientoCuentaProveedores;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_municipio` (

p_criterio varchar(50))
	Begin
		SELECT id_municipio,id_departamento,nombre_municipio
		 FROM tbl_municipio
		  WHERE id_municipio = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_municipioCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_municipioCodigo`()

BEGIN

		SELECT id_municipio
		 FROM tbl_municipio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PermisosRol` (

p_criterio varchar(50))
	Begin
		SELECT id_permisos, id_rol, formulario_permisos, puedeVer, puedeModificar, puedeBorrar
		 FROM tbl_PermisosRol
		  WHERE id_permisos = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PermisosRolCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PermisosRolCodigo`()

	Begin
		SELECT id_permisos
		 FROM tbl_PermisosRol;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PermisosRolPuedeBorrar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PermisosRolPuedeBorrar` (

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
	Begin
		SELECT 1 
		FROM tbl_PermisosRol 
	WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PermisosRolPuedeModificar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PermisosRolPuedeModificar` (

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
	Begin
		SELECT 1 
		FROM tbl_PermisosRol 
		WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PermisosRolPuedeVer]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PermisosRolPuedeVer` (

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
	Begin
		SELECT puedeVer
		FROM tbl_PermisosRol 
		WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_PrecioCostoPorProductoByFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_PrecioCostoPorProductoByFecha` (

p_criterio varchar(50))
	Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Producto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Producto` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoBarra` (

p_criterio longtext)
	Begin
		SELECT b.id_producto, p.sku_producto, p.descripcion_producto, p.id_Sub_Categoria, 
		p.id_iva,p.notas_producto, p.id_marca, p.modelo_producto, p.id_tproducto,p.costo_producto
		 FROM tbl_barra b
			INNER JOIN tbl_Producto p on b.id_producto = p.id_producto
		  WHERE b.barra = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoByID]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoByID` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoBySku]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoBySku` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM tbl_producto
		  WHERE sku_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoCodigo`()
BEGIN
		SELECT id_producto
		 FROM tbl_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Productos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Productos` (

p_criterio varchar(50))
	Begin
			SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto, 
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto,p.costo_producto
		FROM tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
		  WHERE p.id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoSKU]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoSKU` (

p_criterio longtext)
	Begin
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, id_iva, notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		FROM tbl_Producto
		WHERE sku_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductoWhereTProductKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductoWhereTProductKit` (

p_criterio varchar(50))

	Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio AND id_tproducto = 4;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductUnidPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductUnidPrecioVenta` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, id_medida, precio, estado_prounidprecio
		 FROM tbl_ProductUnidPrecioVenta
		  WHERE id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductUnidPrecioVentaJoing]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductUnidPrecioVentaJoing` (

p_criterio varchar(50))
	Begin
SELECT
tbl_ProductUnidPrecioVenta.id_producto,
tbl_ProductUnidPrecioVenta.id_medida,
tbl_UnidadMedida.descripcion_medida,
tbl_ProductUnidPrecioVenta.precio,
tbl_ProductUnidPrecioVenta.estado_prounidprecio,
tbl_ProductUnidPrecioVenta.precioBase

FROM
tbl_ProductUnidPrecioVenta
INNER JOIN tbl_UnidadMedida ON tbl_ProductUnidPrecioVenta.id_medida = tbl_UnidadMedida.id_medida
WHERE
tbl_ProductUnidPrecioVenta.id_producto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProductUnidPrecioVentaParaVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProductUnidPrecioVentaParaVenta` (

p_criterio1 varchar(50),
p_criterio2 varchar(50))

	Begin
SELECT
tbl_ProductUnidPrecioVenta.id_producto,
tbl_ProductUnidPrecioVenta.id_medida,
tbl_UnidadMedida.descripcion_medida,
tbl_ProductUnidPrecioVenta.precio,
tbl_ProductUnidPrecioVenta.estado_prounidprecio,
tbl_ProductUnidPrecioVenta.precioBase

FROM
tbl_ProductUnidPrecioVenta
INNER JOIN tbl_UnidadMedida ON tbl_ProductUnidPrecioVenta.id_medida = tbl_UnidadMedida.id_medida
WHERE
tbl_ProductUnidPrecioVenta.id_producto = p_criterio1 AND
tbl_ProductUnidPrecioVenta.id_medida = p_criterio2;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_proforma`()

	Begin
		SELECT *
		 FROM tbl_proforma;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProformaByVigentes]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProformaByVigentes` (

p_FECHA DATE)
	Begin
		SELECT *
		 FROM tbl_proforma
		  WHERE fecha_proforma < p_FECHA and estado_proforma = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_proformaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_proformaCodigo`()

	Begin
		SELECT id_proforma
		 FROM tbl_proforma;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProvBancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProvBancos` (

p_criterio varchar(50))
	Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM tbl_provbancos
		  WHERE id_proveedor = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProvBancosByIDBanco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProvBancosByIDBanco` (

p_criterio varchar(50))
	Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM tbl_provbancos
		  WHERE id_banco = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProvBancosCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProvBancosCodigo`()

	Begin
		SELECT id_proveedor
		 FROM tbl_provbancos;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Proveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Proveedor` (

p_criterio varchar(50))
	Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM tbl_proveedor
		  WHERE id_proveedor = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProveedorCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProveedorCodigo`()

	Begin
		SELECT id_proveedor
		 FROM tbl_proveedor;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ProveedorNit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ProveedorNit` (

p_criterio varchar(50))
	Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM tbl_proveedor
		  WHERE nit_proveedor = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ReporteDetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ReporteDetalleVenta` (

p_criterio varchar(50))
	Begin
			SELECT dv.id_linea, dv.id_venta, dv.id_producto, dv.descripcion_producto, 
			u.descripcion_medida,dv.cantidad_producto,dv.precio_producto
			FROM tbl_DetalleVenta dv
			INNER JOIN tbl_Producto p on dv.id_producto = p.id_producto
			INNER JOIN tbl_ProductUnidPrecioVenta pv on dv.id_producto = pv.id_producto
			INNER JOIN tbl_UnidadMedida u on pv.id_medida = u.id_medida
		  WHERE dv.id_venta = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ReporteGarantiaSerieProductosByIDVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ReporteGarantiaSerieProductosByIDVenta` (

p_criterio varchar(50))
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
WHERE v.id_venta = p_criterio
		AND v.cobrado_venta = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ReporteVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ReporteVenta` (

p_criterio varchar(50))
	Begin
		SELECT	v.id_venta, v.fecha_venta, v.id_cliente,
		c.nombre_cliente, c.direccion_cliente, c.nit_cliente,
		v.total_venta, v.documento, v.usuario_venta, v.cobrado_venta
		FROM tbl_venta v
		INNER JOIN tbl_cliente c ON v.id_cliente = c.id_cliente
		WHERE v.id_venta = p_criterio
		AND v.cobrado_venta = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Rol` (

p_criterio varchar(50))
	Begin
		SELECT id_rol, descripcion_rol
		 FROM tbl_rol
		  WHERE id_rol = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_RolCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_RolCodigo`()

	Begin
		SELECT id_producto
		 FROM tbl_barra;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Salida` (

p_criterio varchar(50))
	Begin
		SELECT id_salida, fecha_salida, id_bodega,id_concepto
		 FROM tbl_salida
		  WHERE id_salida = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SalidaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SalidaCodigo`()

	Begin
		SELECT id_salida
		 FROM tbl_salida;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SerieProductoByIDNumSerie]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SerieProductoByIDNumSerie` (

p_criterio varchar(50))
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie
		 FROM tbl_SerieProducto
		  WHERE numero_serie = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SerieProductoByIDProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SerieProductoByIDProducto` (

p_criterio varchar(50),
p_criterio2 varchar(50))
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM tbl_SerieProducto
		  WHERE id_producto = p_criterio
			AND disponible_serie >= 1
			AND id_serie = p_criterio2;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SerieProductoByIDProductoANDNSerie]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SerieProductoByIDProductoANDNSerie` (

p_criterio varchar(50),
p_criterio2 LONGTEXT)
	Begin
		SELECT id_kit, id_producto, numero_serie
		 FROM tbl_DetalleKit
		  WHERE id_producto = p_criterio
			AND numero_serie = p_criterio2;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SerieProductoByIDProductoANDSerie]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SerieProductoByIDProductoANDSerie` (

p_criterio varchar(50),
p_criterio2 LONGTEXT)
	Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM tbl_SerieProducto
		  WHERE id_producto = p_criterio
			AND disponible_serie >= 1
			AND numero_serie = p_criterio2;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SubCategoria` (

p_criterio varchar(50))
	Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_subcategoria = p_criterio
		ORDER BY descripcion_subcategoria;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SubCategoriaByIDCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SubCategoriaByIDCategoria` (

p_criterio varchar(50))
	Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_categoria = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SubCategoriaByIDSubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SubCategoriaByIDSubCategoria` (

p_criterio varchar(50))
	Begin
		SELECT id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_subcategoria = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_SubCategoriaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_SubCategoriaCodigo`()

	Begin
		SELECT id_subcategoria
		 FROM tbl_Sub_Categoria;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Tablas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Tablas`()
	Begin
			select name from sysobjects where type='U'
			ORDER BY name;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TarjetaCredito` (

p_criterio varchar(50))
	Begin
		SELECT id_tarjeta, descripcion_tarjeta, tarifa_tarjeta
		 FROM tbl_TarjetaCredito
		  WHERE id_tarjeta = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TarjetaCreditoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TarjetaCreditoCodigo`()

	Begin
		SELECT id_tarjeta
		 FROM tbl_TarjetaCredito;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoDocumentoPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoDocumentoPago` (

p_criterio varchar(50))
	Begin
		SELECT id_tipoDocumentoPago, descripcion_tipoDocumentoPago
		 FROM tbl_TipoDocumentoPagos
		  WHERE id_tipoDocumentoPago = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoDocumentoPagoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoDocumentoPagoCodigo`()

	Begin
		SELECT id_tipoDocumentoPago
		 FROM tbl_TipoDocumentoPagos;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoEmpleado` (

p_criterio varchar(50))
	Begin
		SELECT id_templeado, descripcion_templeado
		 FROM tbl_tipoEmpleado
		  WHERE id_templeado = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoEmpleadoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoEmpleadoCodigo`()
BEGIN
	SELECT id_templeado FROM tbl_tipoEmpleado;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoProducto` (

p_criterio varchar(50))
	Begin
		SELECT id_tproducto, descripcion_tproducto 
		 FROM tbl_TipoProducto
		  WHERE id_tproducto = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TipoProductoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TipoProductoCodigo`()
	Begin
		SELECT id_tproducto
		 FROM tbl_TipoProducto;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_Traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_Traslado` (

p_criterio varchar(50))
	Begin
		SELECT id_traslado, fecha_traslado, id_bodegaOrigen, id_bodegaDestino, descripcion_traslado
		 FROM tbl_traslado
		  WHERE id_traslado = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_TrasladoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_TrasladoCodigo`()

	Begin
		SELECT id_traslado
		 FROM tbl_traslado;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoControlArqueo` (

p_criterio1 varchar(50),
p_criterio2 VARCHAR(50))
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		
		 FROM tbl_ControlArqueo
		  WHERE id_control = p_criterio1
		  AND id_caja = p_criterio2
		  AND fecha_control = (SELECT MAX(fecha_control) FROM tbl_ControlArqueo WHERE id_control = p_criterio1 AND id_caja = p_criterio2)
		  AND Estado = 'activo';
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoControlArqueoCierre` (

p_criterio1 varchar(50),
p_criterio2 VARCHAR(50))
	Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		
		 FROM tbl_ControlArqueoCierre
		  WHERE id_control = p_criterio1
		  AND id_caja = p_criterio2
		  AND fecha_control = (SELECT MAX(fecha_control) FROM tbl_ControlArqueo WHERE id_control = p_criterio1 AND id_caja = p_criterio2)
		  AND Estado = 'activo';
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoControlCajaApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoControlCajaApertura` (

p_criterio1 varchar(50))
	Begin
		SELECT id_control, fecha_control, id_caja, control_control
		 FROM tbl_ControlCajasApertura
		  WHERE id_caja = p_criterio1 
			AND fecha_control = (SELECT MAX(fecha_control) FROM tbl_ControlCajasApertura WHERE id_caja = p_criterio1);
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoKardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoKardex` (

p_criterio1 varchar(50),
p_criterio2 VARCHAR(50))
	Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_bodega = p_criterio1 
			AND id_producto = p_criterio2 
			AND fecha_kardex = 
					(SELECT MAX(fecha_kardex) 
						FROM tbl_Kardex 
							WHERE id_bodega = p_criterio1 
							AND id_producto = p_criterio2);

	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoKit` (

p_criterio1 varchar(50))
	Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		 FROM tbl_kit
		  WHERE id_producto = p_criterio1
			and estado_kit = 1 
			AND fecha_kit = (SELECT MAX(fecha_kit) FROM tbl_kit WHERE id_producto = p_criterio1);

	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UltimoPrecioCostoPorProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UltimoPrecioCostoPorProducto` (

p_criterio1 varchar(50))
	Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = p_criterio1 
			AND fecha_PreCostoProducto = (SELECT MAX(fecha_PreCostoProducto) FROM tbl_PrecioCostoPorProductoByFecha WHERE id_producto = p_criterio1);

	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UnidadMedida` (

p_criterio varchar(50))
	Begin
		SELECT id_medida, descripcion_medida, cantidad_medida
		 FROM tbl_UnidadMedida
		  WHERE id_medida = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_UnidadMedidaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_UnidadMedidaCodigo`()
	Begin
		SELECT id_medida
		 FROM tbl_UnidadMedida;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_venta` (

p_criterio varchar(50))
	Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = p_criterio;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ventaByPendienteCobro]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ventaByPendienteCobro` (

p_criterio varchar(50))
	Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = p_criterio and cobrado_venta = 1;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Listar_ventaCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Listar_ventaCodigo`()

	Begin
		SELECT id_venta
		 FROM tbl_venta;
	End;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ListarEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ListarEmpleado` (
p_criterio	varchar(50))
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from tbl_empleado
where id_empleado = p_criterio and estado_empleado  = 'activo';
end;

//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ListarEmpleadoCodigo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ListarEmpleadoCodigo`()
BEGIN
	SELECT id_empleado 
  from tbl_empleado;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ListarEmpleadoPorUsuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ListarEmpleadoPorUsuario` (
p_criterio	varchar(50))
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from tbl_empleado
where usuario_empleado = p_criterio
and estado_empleado  = 1;

end;

//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ListarUsuariosByIDEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ListarUsuariosByIDEmpleado` (
p_criterio	varchar(50))
begin 
select id_empleado,usuario_empleado,contrasena_empleado,estado_empleado
from tbl_empleado
where id_empleado = p_criterio and estado_empleado  = 1;
end;

//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Banco]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Banco`()
BEGIN
	SELECT * 
		FROM tbl_banco
			ORDER BY id_banco;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Barra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Barra`()
BEGIN
	SELECT * 
		FROM tbl_barra
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Bitaora]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Bitaora`()
Begin
		SELECT *
		FROM tbl_bitacora	
		ORDER BY fecha_bitacora;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Bodega]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Bodega`()
BEGIN
	SELECT * 
		FROM tbl_bodega
			ORDER BY nombre_bodega ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaCompras`()
BEGIN
	SELECT * 
		FROM tbl_bodega
		WHERE id_bodega = 1
			ORDER BY nombre_bodega ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaMostrador]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaMostrador`()
BEGIN
	SELECT * 
		FROM tbl_bodega
			WHERE id_bodega = 2
			ORDER BY id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProducto`()
BEGIN
	SELECT * 
		FROM tbl_bodegaProducto
			ORDER BY id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProductoByBodegaMostrador]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProductoByBodegaMostrador`()
BEGIN
SELECT
tbl_Producto.id_producto,
tbl_Producto.sku_producto,
tbl_Producto.descripcion_producto,
tbl_bodegaProducto.stock_producto,
tbl_ProductUnidPrecioVenta.precio

FROM
tbl_Producto
INNER JOIN tbl_bodegaProducto ON tbl_bodegaProducto.id_producto = tbl_Producto.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta ON tbl_ProductUnidPrecioVenta.id_producto = tbl_Producto.id_producto
WHERE tbl_bodegaProducto.id_bodega = 2 AND tbl_ProductUnidPrecioVenta.id_medida = 1
			ORDER BY tbl_Producto.descripcion_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProductoByBodegas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProductoByBodegas`()
BEGIN
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB ON BP.id_bodega = BB.id_bodega
ORDER BY BP.id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProductoByIDProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProductoByIDProducto` (
p_criterio varchar(50))
BEGIN
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB ON BP.id_bodega = BB.id_bodega
WHERE BP.id_producto = p_criterio
ORDER BY BP.id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProductoInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProductoInventario`()
BEGIN
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		ORDER BY id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BodegaProductoJoin]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BodegaProductoJoin`()
BEGIN
SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
FROM tbl_bodegaProducto bp
INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
ORDER BY bp.id_bodega;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_BuscaKardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_BuscaKardex`()
BEGIN
	SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
	k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
	FROM tbl_Kardex k
	INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
	INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
	ORDER BY k.id_kardex;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Caja]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Caja`()
BEGIN
	SELECT * 
		FROM tbl_cajas
			ORDER BY id_caja;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CajaDiaria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_CajaDiaria`()
BEGIN
	SELECT * 
		FROM tbl_CajaDiaria
			ORDER BY id_caja;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CalculoPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE	PROCEDURE `SP_Obtener_CalculoPrecioVenta`()
BEGIN
	SELECT * 
		FROM tbl_calculoPrecioVenta
			ORDER BY id_calculo;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Categoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Categoria`()
BEGIN
	SELECT * 
		FROM tbl_categoria
			ORDER BY descripcion_categoria;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CategoriaByIDCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_CategoriaByIDCategoria` (
p_criterio varchar(50))
BEGIN
	SELECT * 
		FROM tbl_categoria
			WHERE id_categoria = p_criterio
			ORDER BY id_categoria;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Cliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Cliente`()
BEGIN
	SELECT * 
		FROM tbl_cliente
			ORDER BY id_cliente;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Compra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Compra`()
BEGIN
	SELECT * 
		FROM tbl_compra
			ORDER BY id_compra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CompraCompletaByProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_CompraCompletaByProveedor`()
	Begin 
SELECT C.id_compra, c.fecha_compra, c.id_bodega, B.nombre_bodega,
C.id_formaPago, F.descripcion_formaPago, c.id_proveedor,P.nit_proveedor, P.nombreComercial_proveedor,
C.documento_compra,C.boletaDeposito_compra,C.deposito_compra,C.total_compra,C.diffDepoCompra_compra,
C.usuario_compra 
FROM tbl_compra C
INNER JOIN tbl_proveedor P ON C.id_proveedor = P.id_proveedor
INNER JOIN tbl_FormaPago F ON c.id_formaPago = f.id_formaPago
INNER JOIN tbl_bodega B ON C.id_bodega = B.id_bodega;
end;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Concetos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Concetos`()
BEGIN
	SELECT * 
		FROM tbl_conceptos
			ORDER BY id_concepto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ControlArqueo]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ControlArqueo`()
BEGIN
	SELECT * 
		FROM tbl_ControlArqueo
			ORDER BY id_control;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ControlArqueoByIDCAJA]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ControlArqueoByIDCAJA` (
p_idcaja int)
BEGIN
	SELECT * 
		FROM tbl_ControlArqueo
		WHERE id_caja = p_idcaja
			ORDER BY id_control;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ControlArqueoCierre]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ControlArqueoCierre`()
BEGIN
	SELECT * 
		FROM tbl_ControlArqueoCierre
			ORDER BY id_control;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ControlArqueoCierreByIdCaja]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ControlArqueoCierreByIdCaja` (
p_idcaja int)
BEGIN
	SELECT * 
		FROM tbl_ControlArqueoCierre
		WHERE id_caja = p_idcaja
			ORDER BY id_control;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ControlCajaApertura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ControlCajaApertura`()
BEGIN
	SELECT * 
		FROM tbl_ControlCajasApertura
			ORDER BY id_caja;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CuentaPorCobrar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_CuentaPorCobrar`()
BEGIN
	SELECT * 
		FROM tbl_cuentasPorCobrar
			ORDER BY id_cuentaCobro;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_CuentaPorPagar]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_CuentaPorPagar`()
BEGIN
	SELECT * 
		FROM tbl_CuentaPorPagar
			ORDER BY id_CuentaPorPagar;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Departamento]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Departamento`()
BEGIN
	SELECT * 
		FROM tbl_departamento
			ORDER BY id_departamento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleCompra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleCompra`()
BEGIN
	SELECT * 
		FROM tbl_DetalleCompra
			ORDER BY id_compra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleDevolucionCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleDevolucionCliente`()
BEGIN
	SELECT * 
		FROM tbl_DetalleDevolucionCliente
			ORDER BY id_devolucionCliente;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleInventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleInventario`()
BEGIN
	SELECT * 
		FROM tbl_detalle_inventario
			ORDER BY id_inventario;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleKit`()
BEGIN
	SELECT * 
		FROM tbl_DetalleKit
			ORDER BY id_kit;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetallePagoCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetallePagoCredito`()
BEGIN
	SELECT * 
		FROM tbl_DetallePagoCredito
			ORDER BY id_pagocre;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetallePagoCreditoContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetallePagoCreditoContado`()
BEGIN
	SELECT * 
		FROM tbl_DetallePagoCreditoContado
			ORDER BY id_pagocrecont;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_detallePedido]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_detallePedido`()
BEGIN
	SELECT * 
		FROM tbl_detallePedido
			ORDER BY id_pedido;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleSalida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleSalida`()
BEGIN
	SELECT * 
		FROM tbl_DetalleSalida
			ORDER BY id_salida;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_detalleTraslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_detalleTraslado`()
BEGIN
	SELECT * 
		FROM tbl_detalleTraslado
			ORDER BY id_traslado;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_DetalleVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_DetalleVenta`()
BEGIN
	SELECT * 
		FROM tbl_DetalleVenta
			ORDER BY id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Documentos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Documentos`()
BEGIN
	SELECT * 
		FROM tbl_Documentos
			WHERE activo_documento = 1
			ORDER BY id_documento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_FacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_FacturasCompras`()
BEGIN
	SELECT * 
		FROM tbl_FacturasCompras
			ORDER BY id_facturacompra;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_FacturasVentas]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_FacturasVentas`()
BEGIN
	SELECT * 
		FROM tbl_FacturasVentas
			ORDER BY id_facturaventa;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_FormaPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_FormaPago`()
BEGIN
	SELECT * 
		FROM tbl_FormaPago
			ORDER BY descripcion_formaPago ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Inventario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Inventario`()
BEGIN
	SELECT * 
		FROM tbl_Inventario
			ORDER BY id_inventario;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Iva]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Iva`()
BEGIN
	SELECT * 
		FROM tbl_iva
			ORDER BY descripcion_iva;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Kardex]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Kardex`()
BEGIN
	SELECT * 
		FROM tbl_Kardex
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Kit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Kit`()
BEGIN
	SELECT * 
		FROM tbl_kit
		WHERE estado_kit = 1
			ORDER BY id_kit;	
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_marca]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_marca`()
BEGIN
	SELECT * 
		FROM tbl_marca
			ORDER BY nombre_marca;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_MovimientoCuentaCliente]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_MovimientoCuentaCliente`()
BEGIN
	SELECT * 
		FROM tbl_MovimientoCuentaClientes
			ORDER BY id_movimiento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_MovimientoCuentaProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_MovimientoCuentaProveedor`()
BEGIN
	SELECT * 
		FROM tbl_MovimientoCuentaProveedores
			ORDER BY id_movimiento;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_municipio]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_municipio`()
BEGIN
	SELECT * 
		FROM tbl_municipio
			ORDER BY id_municipio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_PermisosRol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_PermisosRol`()
BEGIN
	SELECT * 
		FROM tbl_PermisosRol
			ORDER BY id_permisos;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_PrecioCostoPorPorductoPorFecha]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_PrecioCostoPorPorductoPorFecha`()
BEGIN
	SELECT * 
		FROM tbl_PrecioCostoPorProductoByFecha
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_producto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_producto`()
BEGIN
	SELECT * 
				FROM tbl_Producto
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_productoBarra]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_productoBarra`()
BEGIN
	SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, p.id_iva, p.notas_producto, 
	p.id_marca, p.modelo_producto, p.id_tproducto
		FROM tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_productoByIDTprodKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_productoByIDTprodKit`()
BEGIN
	SELECT * 
				FROM tbl_Producto
				WHERE id_tproducto = 4
			ORDER BY id_producto; 
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_productoDifefenteKit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_productoDifefenteKit`()
BEGIN
SELECT * from tbl_Producto
WHERE id_tproducto <> 4
			ORDER BY id_producto; 
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_productos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_productos`()
BEGIN
			SELECT p.id_producto, b.barra AS Barras, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, s.descripcion_subcategoria, p.id_iva,i.descripcion_iva, p.notas_producto,
	p.id_marca,m.nombre_marca, p.modelo_producto, p.id_tproducto, tp.descripcion_tproducto
		FROM tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
		INNER JOIN tbl_Sub_Categoria s ON p.id_Sub_Categoria = s.id_subcategoria
		INNER JOIN tbl_iva i ON p.id_iva = i.id_iva
		INNER JOIN tbl_marca m ON p.id_marca = m.id_marca
		INNER JOIN tbl_TipoProducto tp ON p.id_tproducto = tp.id_tproducto
			ORDER BY p.id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ProductUnidPrecioVenta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ProductUnidPrecioVenta`()
BEGIN
	SELECT * 
		FROM tbl_ProductUnidPrecioVenta
			ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ProductUnidPrecioVentaJoin]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ProductUnidPrecioVentaJoin`()
BEGIN
SELECT pv.id_producto, pv.id_medida, m.descripcion_medida, pv.precio, pv.estado_prounidprecio 
from tbl_ProductUnidPrecioVenta pv
INNER JOIN tbl_UnidadMedida m on pv.id_medida = m.id_medida
ORDER BY id_producto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_proforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_proforma`()
BEGIN
	SELECT * 
		FROM tbl_proforma
			ORDER BY id_proforma;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ProvBancos]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ProvBancos`()
BEGIN
	SELECT * 
		FROM tbl_provbancos
			ORDER BY id_banco;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Proveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Proveedor`()
BEGIN
	SELECT * 
		FROM tbl_proveedor
			ORDER BY id_proveedor;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Rol]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Rol`()
BEGIN
	SELECT * 
		FROM tbl_Rol
			ORDER BY id_rol;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Salida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Salida`()
BEGIN
	SELECT * 
		FROM tbl_salida
			ORDER BY id_salida;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_SerieProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_SerieProducto`()
BEGIN
	SELECT * 
		FROM tbl_serieProducto
		where cantidad_serie > 0
			ORDER BY id_serie;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_SubCategoria]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_SubCategoria`()
BEGIN
	SELECT * 
		FROM tbl_Sub_Categoria
			ORDER BY id_subcategoria;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_TarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_TarjetaCredito`()
BEGIN
	SELECT * 
		FROM tbl_TarjetaCredito
			ORDER BY id_tarjeta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_TipoDocumentoPago]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_TipoDocumentoPago`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
			ORDER BY id_tipoDocumentoPago;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_TipoDocumentoPagoByFactura]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_TipoDocumentoPagoByFactura`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 1
			ORDER BY id_tipoDocumentoPago;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_TipoDocumentoPagoByProforma]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_TipoDocumentoPagoByProforma`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 4
			ORDER BY id_tipoDocumentoPago;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_TipoProducto]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_TipoProducto`()
BEGIN
	SELECT * 
		FROM tbl_tipoProducto
			ORDER BY descripcion_tproducto;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_Traslado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_Traslado`()
BEGIN
	SELECT * 
		FROM tbl_traslado
			ORDER BY id_traslado;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_UnidadMedida]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_UnidadMedida`()
BEGIN
	SELECT * 
		FROM tbl_UnidadMedida
			ORDER BY descripcion_medida;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_venta]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_venta`()
BEGIN
	SELECT * 
		FROM tbl_venta
			ORDER BY id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByAll]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByAll` (
p_desde DATE,
p_hasta DATE)

BEGIN
SELECT
tbl_venta.id_venta,
tbl_venta.fecha_venta,
tbl_venta.id_formaPago,
tbl_FormaPago.descripcion_formaPago,
tbl_venta.total_venta,
tbl_venta.documento,
tbl_venta.usuario_venta

FROM
tbl_venta
INNER JOIN tbl_FormaPago ON tbl_venta.id_formaPago = tbl_FormaPago.id_formaPago
WHERE CAST(DATE_FORMAT (tbl_venta.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_hasta, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND tbl_venta.cobrado_venta = 1
ORDER BY tbl_venta.id_venta ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByCheque]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByCheque` (
p_hasta DATE,
p_desde DATE)
BEGIN
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(DATE_FORMAT (V.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_hasta, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND v.id_formaPago = 2
AND v.cobrado_venta = 1
ORDER BY v.id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByContado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByContado` (
p_desde DATE,
p_hasta DATE)

BEGIN
SELECT
tbl_venta.id_venta,
tbl_venta.fecha_venta,
tbl_venta.id_formaPago,
tbl_FormaPago.descripcion_formaPago,
tbl_venta.total_venta,
tbl_venta.documento,
tbl_venta.usuario_venta

FROM
tbl_venta
INNER JOIN tbl_FormaPago ON tbl_venta.id_formaPago = tbl_FormaPago.id_formaPago
WHERE CAST(DATE_FORMAT (tbl_venta.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_hasta, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND tbl_venta.id_formaPago = 1
AND tbl_venta.cobrado_venta = 1
ORDER BY tbl_venta.id_venta ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByCredito` (
p_desde DATE,
p_hasta DATE)
BEGIN
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(DATE_FORMAT (V.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_hasta, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND v.id_formaPago = 3
AND v.cobrado_venta = 1
ORDER BY v.id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByDeposito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByDeposito` (
p_desde DATE,
p_hasta DATE)
BEGIN
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(DATE_FORMAT (V.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_desde, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND v.id_formaPago = 5
AND v.cobrado_venta = 1
ORDER BY v.id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_Obtener_ventaDiariaByTarjetaCredito]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_Obtener_ventaDiariaByTarjetaCredito` (
p_desde DATE,
p_hasta DATE)
BEGIN
SELECT v.id_venta, v.fecha_venta, v.id_formaPago, f.descripcion_formaPago,
v.total_venta, v.documento, v.usuario_venta
FROM tbl_venta v
INNER JOIN tbl_FormaPago f ON v.id_formaPago = f.id_formaPago
WHERE CAST(DATE_FORMAT (V.fecha_venta,'%Y%m%d') AS UNSIGNED)
BETWEEN CAST(DATE_FORMAT (p_desde, '%Y%m%d') AS UNSIGNED)
AND CAST(DATE_FORMAT (p_hasta, '%Y%m%d')AS UNSIGNED)
AND v.id_formaPago = 4
AND v.cobrado_venta = 1
ORDER BY v.id_venta;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ObtenerEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ObtenerEmpleado`()
BEGIN
SELECT * 
FROM tbl_empleado 
WHERE estado_empleado = 1 
ORDER BY id_empleado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ObtenerEmpleadoTipoTecnico]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ObtenerEmpleadoTipoTecnico`()
BEGIN
SELECT * 
FROM tbl_empleado 
WHERE id_templeado = 4 AND	estado_empleado = 1 
ORDER BY id_empleado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ObtenerLogUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ObtenerLogUsuarios`()
BEGIN
SELECT * 
FROM tbl_LogUusarios 
ORDER BY usuario_empleado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ObtenerTipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ObtenerTipoEmpleado`()
BEGIN
SELECT * 
FROM tbl_tipoEmpleado 
ORDER BY id_templeado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_ObtenerUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_ObtenerUsuarios`()
BEGIN
SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
WHERE estado_empleado = 1 
ORDER BY usuario_empleado ASC;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[SP_TipoEmpleado]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `SP_TipoEmpleado`
(
p_idTemp INT,
p_descrip LONGTEXT
)


	Begin
		Start Transaction;
			UPDATE `tbl_tipoEmpleado`
			SET

			descripcion_templeado = p_descrip

			WHERE
			id_templeado = p_idTemp;

		Commit;
	End
	
	
//

DELIMITER ;

	
 
/* SQLINES DEMO *** redProcedure [dbo].[ValidarFacturasCompras]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidarFacturasCompras`
(
	p_criterio LONGTEXT
)
BEGIN
SELECT COUNT(*) FROM tbl_FacturasCompras
WHERE documento_facturacompra = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ValidarNumeroSerie]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidarNumeroSerie`
(
	p_NumeroSerie longtext
)
BEGIN
SELECT 1 FROM tbl_SerieProducto
WHERE numero_serie = p_NumeroSerie;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ValidarProveedor]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidarProveedor`
(
	p_criterio INT
)
BEGIN
SELECT COUNT(*) FROM tbl_proveedor
WHERE id_proveedor = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ValidarProveedorNit]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidarProveedorNit`
(
	p_criterio INT
)
BEGIN
SELECT COUNT(*) FROM tbl_proveedor
WHERE nit_proveedor = p_criterio;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ValidaUsuario]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidaUsuario`
(
	p_IDUsuario varchar(50),
	p_Clave varchar(50)
)
BEGIN
SELECT COUNT(*) FROM tbl_empleado 
WHERE usuario_empleado = p_IDUsuario
AND contrasena_empleado = p_Clave
AND estado_empleado = 1;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[ValidaUsuarios]    Script Date: 1/06/2024 17:24:58 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE `ValidaUsuarios`
(
	p_IDUsuario varchar(50)
)
BEGIN
SELECT COUNT(*) FROM tbl_LogUusarios 
WHERE usuario_empleado = p_IDUsuario
AND log = 0;
END;
//

DELIMITER ;