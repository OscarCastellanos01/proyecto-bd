GO
/****** Object:  Table [dbo].[tbl_banco]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_banco](
	[id_banco] [int] NOT NULL,
	[descripcion_banco] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_banco] PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_barra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_barra](
	[id_producto] [int] NOT NULL,
	[barra] [bigint] NOT NULL,
 CONSTRAINT [PK_tbl_barra] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[barra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bitacora]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora](
	[id_bitacora] [int] IDENTITY(1,1) NOT NULL,
	[fecha_bitacora] [datetime] NULL,
	[usuario] [varchar](255) NULL,
	[accion_bitacora] [nvarchar](max) NULL,
	[hora_bitacora] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bodega](
	[id_bodega] [int] NOT NULL,
	[nombre_bodega] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_bodega] PRIMARY KEY CLUSTERED 
(
	[id_bodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bodegaProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bodegaProducto](
	[id_bodega] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[stock_producto] [float] NOT NULL,
	[minimo_producto] [float] NOT NULL,
	[maximo_producto] [float] NOT NULL,
	[diasReposicion_producto] [int] NOT NULL,
	[cantidadMinima_producto] [float] NOT NULL,
 CONSTRAINT [PK_tbl_bodegaProducto] PRIMARY KEY CLUSTERED 
(
	[id_bodega] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CajaDiaria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CajaDiaria](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[id_caja] [int] NOT NULL,
	[montoApertura_movimiento] [money] NOT NULL,
	[ingreso_movimiento] [money] NOT NULL,
	[ingresoCheque_movimiento] [money] NOT NULL,
	[ingresoTarjeta_movimiento] [money] NOT NULL,
	[egreso_movimiento] [money] NOT NULL,
	[cierre_movimiento] [money] NOT NULL,
	[saldo_movimiento] [money] NOT NULL,
	[estado_movimiento] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CajaDiaria] PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cajas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cajas](
	[id_caja] [int] NOT NULL,
	[descripcion_caja] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_cajas] PRIMARY KEY CLUSTERED 
(
	[id_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_calculoPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_calculoPrecioVenta](
	[id_calculo] [int] IDENTITY(1,1) NOT NULL,
	[fecha_calculo] [datetime] NOT NULL,
	[descripcion_calculo] [nvarchar](max) NULL,
	[precio_costo] [money] NULL,
	[envio_costo] [money] NULL,
	[ganacia_promedio] [float] NULL,
	[costo_total] [money] NULL,
	[precio_venta] [money] NULL,
	[precioSinIva_venta] [money] NULL,
	[iva_calculado] [money] NULL,
	[isr_calculado] [money] NULL,
	[iso_calculado] [money] NULL,
	[total_impuesto] [money] NULL,
	[ganancia_real] [money] NULL,
 CONSTRAINT [PK_tbl_calculoPrecioVenta] PRIMARY KEY CLUSTERED 
(
	[id_calculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categoria](
	[id_categoria] [int] NOT NULL,
	[descripcion_categoria] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cliente](
	[id_cliente] [int] NOT NULL,
	[nit_cliente] [nvarchar](max) NOT NULL,
	[nombre_cliente] [nvarchar](max) NOT NULL,
	[id_municipio] [int] NULL,
	[direccion_cliente] [nvarchar](max) NOT NULL,
	[telefono1_cliente] [nvarchar](20) NULL,
	[telefono2_cliente] [nvarchar](20) NULL,
	[email_cliente] [nvarchar](max) NULL,
	[notas_cliente] [text] NULL,
 CONSTRAINT [PK_tbl_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_compra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_compra](
	[id_compra] [int] NOT NULL,
	[fecha_compra] [datetime] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[id_bodega] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[documento_compra] [nvarchar](max) NULL,
	[total_compra] [money] NOT NULL,
	[notas_compra] [text] NULL,
	[plazo_compra] [int] NULL,
	[boletaDeposito_compra] [nvarchar](max) NULL,
	[deposito_compra] [money] NULL,
	[diffDepoCompra_compra] [money] NULL,
	[usuario_compra] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_compra] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_conceptos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_conceptos](
	[id_concepto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_concepto] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_conceptos] PRIMARY KEY CLUSTERED 
(
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlArqueo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlArqueo](
	[id_control] [int] NOT NULL,
	[fecha_control] [datetime] NOT NULL,
	[id_caja] [int] NOT NULL,
	[Cantidad200] [int] NULL,
	[Total200] [money] NULL,
	[Cantidad100] [int] NULL,
	[Total100] [money] NULL,
	[Cantidad50] [int] NULL,
	[Total50] [money] NULL,
	[Cantidad20] [int] NULL,
	[Total20] [money] NULL,
	[Cantidad10] [int] NULL,
	[Total10] [money] NULL,
	[Cantidad5] [int] NULL,
	[Total5] [money] NULL,
	[Cantidad1] [int] NULL,
	[Total1] [money] NULL,
	[Cantidad050] [int] NULL,
	[Total050] [money] NULL,
	[Cantidad025] [int] NULL,
	[Total025] [money] NULL,
	[Cantidad010] [int] NULL,
	[Total010] [money] NULL,
	[Cantidad005] [int] NULL,
	[Total005] [money] NULL,
	[Cantidad001] [int] NULL,
	[Total001] [money] NULL,
	[GranTotal] [money] NULL,
	[Estado] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_ControlArqueo] PRIMARY KEY CLUSTERED 
(
	[id_control] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlArqueoCierre]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlArqueoCierre](
	[id_control] [int] NOT NULL,
	[fecha_control] [datetime] NOT NULL,
	[id_caja] [int] NOT NULL,
	[Cantidad200] [int] NULL,
	[Total200] [decimal](18, 0) NULL,
	[Cantidad100] [int] NULL,
	[Total100] [decimal](18, 0) NULL,
	[Cantidad50] [int] NULL,
	[Total50] [decimal](18, 0) NULL,
	[Cantidad20] [int] NULL,
	[Total20] [decimal](18, 0) NULL,
	[Cantidad10] [int] NULL,
	[Total10] [decimal](18, 0) NULL,
	[Cantidad5] [int] NULL,
	[Total5] [decimal](18, 0) NULL,
	[Cantidad1] [int] NULL,
	[Total1] [decimal](18, 0) NULL,
	[Cantidad050] [int] NULL,
	[Total050] [decimal](18, 0) NULL,
	[Cantidad025] [int] NULL,
	[Total025] [decimal](18, 0) NULL,
	[Cantidad010] [int] NULL,
	[Total010] [decimal](18, 0) NULL,
	[Cantidad005] [int] NULL,
	[Total005] [decimal](18, 0) NULL,
	[Cantidad001] [int] NULL,
	[Total001] [decimal](18, 0) NULL,
	[TotalCheques] [decimal](18, 0) NULL,
	[TotalTarjetas] [decimal](18, 0) NULL,
	[GranTotal] [decimal](18, 0) NULL,
	[Estado] [nchar](10) NULL,
 CONSTRAINT [PK__tbl_Cont__3AAC4A77259DF384] PRIMARY KEY CLUSTERED 
(
	[id_control] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlCajasApertura]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlCajasApertura](
	[id_control] [int] NOT NULL,
	[fecha_control] [datetime] NOT NULL,
	[id_caja] [int] NOT NULL,
	[control_control] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ControlCajasApertura] PRIMARY KEY CLUSTERED 
(
	[id_control] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CuentaPorPagar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CuentaPorPagar](
	[id_CuentaPorPagar] [int] NOT NULL,
	[fecha_CuentaPorPagar] [datetime] NOT NULL,
	[fechaVence_CuentaPorPagar] [datetime] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[documento_CuentaPorPagar] [nvarchar](max) NOT NULL,
	[monto_CuentaPorPagar] [money] NOT NULL,
	[plazo_CuentaPorPagar] [float] NOT NULL,
	[saldo_CuentaPorPagar] [money] NULL,
	[estado_CuentaPorPagar] [int] NULL,
 CONSTRAINT [PK_tbl_CuentaPorPagar] PRIMARY KEY CLUSTERED 
(
	[id_CuentaPorPagar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cuentasPorCobrar]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cuentasPorCobrar](
	[id_cuentaCobro] [int] NOT NULL,
	[fecha_cuentaCobro] [datetime] NOT NULL,
	[fechaVence_CuentaPorCobrar] [datetime] NULL,
	[id_cliente] [int] NOT NULL,
	[id_ventaReferencia] [int] NULL,
	[documento_venta] [nvarchar](max) NULL,
	[monto_cuentaCobro] [money] NOT NULL,
	[plazo_cuentaCobro] [float] NOT NULL,
	[id_interes] [int] NOT NULL,
	[cuotaProgramada] [money] NOT NULL,
	[saldoProgramado] [money] NOT NULL,
	[id_InteresMora] [float] NULL,
	[estado_cuentaCobro] [int] NOT NULL,
 CONSTRAINT [PK_tbl_cuentasPorCobrar] PRIMARY KEY CLUSTERED 
(
	[id_cuentaCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departamento]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departamento](
	[id_departamento] [int] NOT NULL,
	[nombre_departamento] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_departamento] PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_detalle_inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detalle_inventario](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_inventario] [int] NULL,
	[id_producto] [int] NULL,
	[descripcion_producto] [nvarchar](max) NULL,
	[stock_producto] [float] NULL,
	[conteo1_detalle] [float] NULL,
 CONSTRAINT [PK_tbl_detalle_inventario] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleCompra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleCompra](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[costo_producto] [money] NULL,
	[cantidad_producto] [float] NOT NULL,
	[id_kardex] [int] NOT NULL,
	[porcentajeIva_Producto] [float] NOT NULL,
	[porcentajeDescuento_producto] [float] NOT NULL,
 CONSTRAINT [PK_tbl_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleDevolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleDevolucionCliente](
	[id_liena] [int] IDENTITY(1,1) NOT NULL,
	[id_devolucionCliente] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NULL,
	[cantidad_producto] [float] NOT NULL,
	[id_kardex] [int] NOT NULL,
	[porcentajeIva] [float] NOT NULL,
	[porcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_tbl_DetalleDevolucionCliente] PRIMARY KEY CLUSTERED 
(
	[id_liena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleKit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleKit](
	[id_kit] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NOT NULL,
	[cantidad_detalleKit] [float] NOT NULL,
	[numero_serie] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_DetalleKit] PRIMARY KEY CLUSTERED 
(
	[id_kit] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetallePagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetallePagoCredito](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_pagocre] [int] NOT NULL,
	[id_tabla] [int] NOT NULL,
	[monto_pagocre] [money] NOT NULL,
	[mora_pagocre] [money] NOT NULL,
	[dias_pagocre] [float] NOT NULL,
 CONSTRAINT [PK_tbl_DetallePagoCredito] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetallePagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetallePagoCreditoContado](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_pagocrecont] [int] NOT NULL,
	[id_cuentaCobro] [int] NOT NULL,
	[monto_pagocrecont] [money] NOT NULL,
 CONSTRAINT [PK_tbl_DetallePagoCreditoContado] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_detallePedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detallePedido](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NOT NULL,
	[cantidad_pedido] [float] NOT NULL,
 CONSTRAINT [PK_tbl_detallePedido] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleProforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleProforma](
	[id_linea] [int] NOT NULL,
	[id_proforma] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NOT NULL,
	[cantidad_producto] [float] NOT NULL,
	[procentajeIva] [float] NOT NULL,
	[porcentajeDescuento] [float] NOT NULL,
	[descripcion_medida] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_DetalleProforma] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleSalida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleSalida](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_salida] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_salida] [nvarchar](max) NOT NULL,
	[cantidad_salida] [float] NOT NULL,
	[id_kardex] [int] NOT NULL,
 CONSTRAINT [PK_tbl_DetalleSalida] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_detalleTraslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detalleTraslado](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_traslado] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[cantidad_traslado] [float] NOT NULL,
	[id_kardexOrigen] [int] NOT NULL,
	[id_KardexDestino] [int] NOT NULL,
 CONSTRAINT [PK_tbl_detalleTraslado] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleVenta](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NOT NULL,
	[cantidad_producto] [float] NOT NULL,
	[id_kardex] [int] NOT NULL,
	[porcentajeIva] [float] NOT NULL,
	[porcentajeDescuento] [float] NOT NULL,
	[numeroSerie] [nvarchar](max) NOT NULL,
	[fechaGarantia] [datetime] NOT NULL,
	[descripcion_medida] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleVentaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleVentaTemp](
	[id_linea] [int] NOT NULL,
	[id_venta] [int] NULL,
	[id_producto] [int] NULL,
	[descripcion_producto] [nvarchar](max) NULL,
	[precio_producto] [money] NULL,
	[cantidad_producto] [float] NULL,
	[id_kardex] [int] NULL,
	[porcentajeIva] [float] NULL,
	[porcentajeDescuento] [float] NULL,
	[numeroSerie] [nvarchar](max) NULL,
	[fechaGarantia] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_devolucionCliente]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_devolucionCliente](
	[id_devolucionCliente] [int] NOT NULL,
	[fecha_devolucionCliente] [datetime] NOT NULL,
	[id_venta] [int] NOT NULL,
	[observaciones_devolucionCliente] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_devolucionCliente] PRIMARY KEY CLUSTERED 
(
	[id_devolucionCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_devolucionProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_devolucionProveedor](
	[id_devolucionProveedor] [int] NOT NULL,
	[fecha_devolucionProveedor] [datetime] NOT NULL,
	[id_compra] [int] NOT NULL,
	[observaciones_devolucionProveedor] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_devolucionProveedor] PRIMARY KEY CLUSTERED 
(
	[id_devolucionProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Documentos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Documentos](
	[id_documento] [int] NOT NULL,
	[nombre_documento] [nvarchar](max) NOT NULL,
	[abreviatura_documento] [nvarchar](50) NOT NULL,
	[serie_documento] [nvarchar](50) NOT NULL,
	[id_tipoDocumentoPago] [int] NOT NULL,
	[inicio_documento] [int] NOT NULL,
	[final_documento] [int] NOT NULL,
	[activo_documento] [bit] NULL,
	[utilizado_documento] [int] NULL,
 CONSTRAINT [PK_tbl_Documentos] PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_empleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_empleado](
	[id_empleado] [int] IDENTITY(9,1) NOT NULL,
	[fechain_empleado] [datetime] NOT NULL,
	[nombre_empleado] [nvarchar](max) NOT NULL,
	[apellido_empleado] [nvarchar](max) NOT NULL,
	[direccion_empleado] [nvarchar](max) NULL,
	[telefeono1_empleado] [nvarchar](max) NULL,
	[telefono2_empleado] [nvarchar](max) NULL,
	[fechanac_empleado] [date] NULL,
	[id_templeado] [int] NOT NULL,
	[usuario_empleado] [nvarchar](50) NOT NULL,
	[contrasena_empleado] [nvarchar](50) NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_municipio] [int] NOT NULL,
	[estado_empleado] [int] NULL,
 CONSTRAINT [PK_tbl_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_equipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_equipo](
	[id_equipo] [int] NOT NULL,
	[id_modelo] [int] NULL,
	[serie_equipo] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_equipo] PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FacturasCompras]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FacturasCompras](
	[id_facturacompra] [int] IDENTITY(1,1) NOT NULL,
	[fecha_facturacompra] [datetime] NULL,
	[id_compra] [int] NULL,
	[documento_facturacompra] [nvarchar](max) NULL,
	[monto_facturacompra] [money] NULL,
	[iva_facturacompra] [money] NULL,
	[isr_facturacompra] [money] NULL,
	[iso_facturacompra] [money] NULL,
	[estado_facturacompra] [int] NULL,
 CONSTRAINT [PK_tbl_FacturasCompras] PRIMARY KEY CLUSTERED 
(
	[id_facturacompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FacturasVentas]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FacturasVentas](
	[id_facturaventa] [int] IDENTITY(1,1) NOT NULL,
	[fecha_facturaventa] [datetime] NULL,
	[id_venta] [int] NULL,
	[documento_facturaventa] [nvarchar](max) NULL,
	[monto_facturaventa] [money] NULL,
	[iva_facturaventa] [money] NULL,
	[isr_facturaventa] [money] NULL,
	[iso_facturaventa] [money] NULL,
	[estado_facturaventa] [int] NULL,
 CONSTRAINT [PK_tbl_FacturasVentas] PRIMARY KEY CLUSTERED 
(
	[id_facturaventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormaPago]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormaPago](
	[id_formaPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_formaPago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_FormaPago] PRIMARY KEY CLUSTERED 
(
	[id_formaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_gastos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_gastos](
	[id_gasto] [int] NOT NULL,
	[fecha_gasto] [datetime] NOT NULL,
	[id_concepto] [int] NOT NULL,
	[descripcion_gasto] [nvarchar](max) NOT NULL,
	[monto_gasto] [money] NOT NULL,
 CONSTRAINT [PK_tbl_gastos] PRIMARY KEY CLUSTERED 
(
	[id_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Inventario]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Inventario](
	[id_inventario] [int] NOT NULL,
	[fecha_inventario] [datetime] NOT NULL,
	[id_bodega] [int] NOT NULL,
	[id_SubCategoriaSource] [int] NULL,
	[id_SubCategoriaTarget] [int] NULL,
	[estado_categoria] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Inventario] PRIMARY KEY CLUSTERED 
(
	[id_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_iva]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_iva](
	[id_iva] [int] NOT NULL,
	[descripcion_iva] [nvarchar](max) NOT NULL,
	[tarifa_iva] [float] NOT NULL,
 CONSTRAINT [PK_tbl_iva] PRIMARY KEY CLUSTERED 
(
	[id_iva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kardex]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kardex](
	[id_kardex] [int] IDENTITY(1,1) NOT NULL,
	[id_bodega] [int] NULL,
	[id_producto] [int] NULL,
	[fecha_kardex] [datetime] NULL,
	[documento_kardex] [nvarchar](50) NULL,
	[entrada_kardex] [float] NULL,
	[salida_kardex] [float] NULL,
	[saldo_kardex] [float] NULL,
	[ultimoCosto_kardex] [money] NULL,
	[costoPromedio_kardex] [money] NULL,
 CONSTRAINT [PK_tbl_Kardex] PRIMARY KEY CLUSTERED 
(
	[id_kardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_kit]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kit](
	[id_kit] [int] IDENTITY(1,1) NOT NULL,
	[fecha_kit] [datetime] NOT NULL,
	[fechavence_kit] [datetime] NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio_kit] [money] NOT NULL,
	[estado_kit] [int] NULL,
 CONSTRAINT [PK_tbl_kit] PRIMARY KEY CLUSTERED 
(
	[id_kit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LogUusarios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LogUusarios](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[usuario_empleado] [nvarchar](50) NULL,
	[log] [bit] NULL,
	[ipLocal] [nvarchar](100) NULL,
	[fecha_log] [datetime] NULL,
 CONSTRAINT [PK__tbl_LogU__6CC851FEC084E4CD] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_marca]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marca](
	[id_marca] [int] NOT NULL,
	[nombre_marca] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_marca] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_marcaEquipos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marcaEquipos](
	[id_marcaE] [int] NOT NULL,
	[nombre_marcaE] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_marcaEquipos] PRIMARY KEY CLUSTERED 
(
	[id_marcaE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_modelo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_modelo](
	[id_modelo] [int] NOT NULL,
	[nombre_modelo] [nvarchar](max) NULL,
	[id_marcaE] [int] NULL,
	[id_tequipo] [int] NULL,
 CONSTRAINT [PK_tbl_modelo] PRIMARY KEY CLUSTERED 
(
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MovimientoCuentaClientes]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MovimientoCuentaClientes](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[descripcion_movimiento] [nvarchar](max) NOT NULL,
	[debito_movimiento] [money] NOT NULL,
	[credito_movimiento] [money] NOT NULL,
 CONSTRAINT [PK_tbl_MovimientoCuentaClientes] PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MovimientoCuentaProveedores]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MovimientoCuentaProveedores](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[descripcion_movimiento] [nvarchar](max) NOT NULL,
	[debito_movimiento] [money] NULL,
	[credito_movimiento] [money] NULL,
 CONSTRAINT [PK_tbl_MovimientoCuentaProveedores] PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_municipio]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_municipio](
	[id_municipio] [int] NOT NULL,
	[id_departamento] [int] NOT NULL,
	[nombre_municipio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_municipio] PRIMARY KEY CLUSTERED 
(
	[id_municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_notaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_notaCredito](
	[id_notaCredito] [int] NOT NULL,
	[fecha_notaCredito] [datetime] NOT NULL,
	[id_cuentaCobro] [int] NOT NULL,
	[descripcion_notaCredito] [nvarchar](max) NOT NULL,
	[monto_notaCredito] [money] NOT NULL,
 CONSTRAINT [PK_tbl_notaCredito] PRIMARY KEY CLUSTERED 
(
	[id_notaCredito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_notaDebito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_notaDebito](
	[id_notaDebito] [int] NOT NULL,
	[fecha_notaDebito] [datetime] NOT NULL,
	[id_cuentaCobro] [int] NOT NULL,
	[descripcion_notaDebito] [nvarchar](max) NOT NULL,
	[monto_notaDebito] [money] NOT NULL,
 CONSTRAINT [PK_tbl_notaDebito] PRIMARY KEY CLUSTERED 
(
	[id_notaDebito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PagoCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PagoCredito](
	[id_pagocre] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[id_documento] [int] NOT NULL,
	[fecha_pagocre] [datetime] NOT NULL,
	[id_cuentaCobro] [int] NOT NULL,
	[descripcion_pagocre] [nvarchar](max) NOT NULL,
	[total_pagoCre] [money] NOT NULL,
 CONSTRAINT [PK_tbl_PagoCredito] PRIMARY KEY CLUSTERED 
(
	[id_pagocre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PagoCreditoContado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PagoCreditoContado](
	[id_pagocrecont] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[id_documento] [int] NOT NULL,
	[fecha_pagocrecont] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[descripcion_pagocrecont] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_PagoCreditoContado] PRIMARY KEY CLUSTERED 
(
	[id_pagocrecont] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PagoCreditoCuotaExtra]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PagoCreditoCuotaExtra](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[id_documento] [int] NOT NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[id_tabla] [int] NOT NULL,
	[descripcion_movimiento] [nvarchar](max) NOT NULL,
	[monto_movimiento] [money] NOT NULL,
 CONSTRAINT [PK_tbl_PagoCreditoCuotaExtra] PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PagoProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PagoProveedor](
	[id_pago] [int] NOT NULL,
	[fecha_pago] [datetime] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[id_documento] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[descripcion_pago] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_PagosProveedor] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PagoProveedorDetalle]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PagoProveedorDetalle](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_pago] [int] NOT NULL,
	[id_CuentaPorPagar] [int] NOT NULL,
	[monto_pagodetalle] [money] NOT NULL,
 CONSTRAINT [PK_tbl_PagoProveedorDetalle] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pedido]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedido](
	[id_pedido] [int] NOT NULL,
	[fecha_pedido] [datetime] NOT NULL,
	[id_bodega] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_tbl_pedido] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PermisosRol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PermisosRol](
	[id_permisos] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[formulario_permisos] [varchar](max) NOT NULL,
	[puedeVer] [bit] NULL,
	[puedeModificar] [bit] NULL,
	[puedeBorrar] [bit] NULL,
 CONSTRAINT [PK_tbl_PermisosRol] PRIMARY KEY CLUSTERED 
(
	[id_permisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PrecioCostoPorProductoByFecha]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PrecioCostoPorProductoByFecha](
	[id_PreCostoProducto] [int] IDENTITY(1,1) NOT NULL,
	[fecha_PreCostoProducto] [datetime] NULL,
	[id_producto] [int] NULL,
	[costo_producto] [money] NULL,
	[referencia_compra] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_PrecioCostoPorProductoByFecha] PRIMARY KEY CLUSTERED 
(
	[id_PreCostoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Producto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Producto](
	[id_producto] [int] NOT NULL,
	[sku_producto] [nvarchar](max) NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[id_Sub_Categoria] [int] NOT NULL,
	[id_iva] [int] NOT NULL,
	[notas_producto] [text] NULL,
	[imagen_producto] [nvarchar](max) NULL,
	[id_marca] [int] NOT NULL,
	[modelo_producto] [nvarchar](max) NULL,
	[id_tproducto] [int] NOT NULL,
	[costo_producto] [money] NULL,
 CONSTRAINT [PK_tbl_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductUnidPrecioVenta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductUnidPrecioVenta](
	[id_producto] [int] NOT NULL,
	[id_medida] [int] NOT NULL,
	[precio] [money] NULL,
	[estado_prounidprecio] [bit] NULL,
	[precioBase] [bit] NULL,
 CONSTRAINT [PK_tbl_ProductUnidPrecioVenta] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[id_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_proforma]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_proforma](
	[id_proforma] [int] NOT NULL,
	[fecha_proforma] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_bodega] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[total_proforma] [money] NOT NULL,
	[id_documento] [int] NOT NULL,
	[observaciones_proforma] [nvarchar](max) NULL,
	[documento] [nvarchar](max) NULL,
	[usuario_proforma] [nvarchar](max) NULL,
	[estado_proforma] [int] NULL,
 CONSTRAINT [PK_tbl_proforma] PRIMARY KEY CLUSTERED 
(
	[id_proforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_provbancos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_provbancos](
	[id_proveedor] [int] NOT NULL,
	[id_banco] [int] NOT NULL,
	[numero_cuenta] [nvarchar](max) NOT NULL,
	[nombre_cuenta] [nvarchar](max) NOT NULL,
	[descripcion_cuenta] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_provbancos] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC,
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_proveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_proveedor](
	[id_proveedor] [int] NOT NULL,
	[nombreJuridico_proveedor] [nvarchar](max) NOT NULL,
	[nombreComercial_proveedor] [nvarchar](max) NULL,
	[direccion_proveedor] [nvarchar](max) NOT NULL,
	[telefono1_proveedor] [nvarchar](50) NULL,
	[telefono2_proveedor] [nvarchar](50) NULL,
	[correo_proveedor] [nvarchar](50) NULL,
	[nit_proveedor] [nvarchar](max) NOT NULL,
	[id_iva] [int] NULL,
	[id_municipio] [int] NOT NULL,
 CONSTRAINT [PK_tbl_proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reparacion](
	[id_reparacion] [int] NOT NULL,
	[fecha_reparacion] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_equipo] [int] NOT NULL,
	[falla_reparacion] [text] NOT NULL,
	[informe_reparacion] [text] NULL,
	[id_treparacion] [int] NOT NULL,
	[costo_reparacion] [money] NOT NULL,
	[total_repuestos] [int] NULL,
	[fechaEntrega_reparacion] [datetime] NULL,
	[terminada_reparacion] [int] NULL,
	[accesorios_reparacion] [text] NULL,
	[id_empleado] [int] NOT NULL,
 CONSTRAINT [PK_tbl_reparacion] PRIMARY KEY CLUSTERED 
(
	[id_reparacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reparacionRepuestosLevel1]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reparacionRepuestosLevel1](
	[id_reparacion] [int] NOT NULL,
	[id_pedido] [int] NOT NULL,
	[cantidad_reparacionRepuesto] [float] NULL,
 CONSTRAINT [PK_tbl_reparacionRepuestosLevel1] PRIMARY KEY CLUSTERED 
(
	[id_reparacion] ASC,
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rol]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rol](
	[id_rol] [int] NOT NULL,
	[descripcion_rol] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_salida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_salida](
	[id_salida] [int] NOT NULL,
	[fecha_salida] [datetime] NOT NULL,
	[id_concepto] [int] NOT NULL,
	[id_bodega] [int] NOT NULL,
 CONSTRAINT [PK_tbl_salida] PRIMARY KEY CLUSTERED 
(
	[id_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SerieProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SerieProducto](
	[id_producto] [int] NOT NULL,
	[id_serie] [int] IDENTITY(1,1) NOT NULL,
	[numero_serie] [nvarchar](max) NULL,
	[disponible_serie] [bit] NULL,
	[cantidad_serie] [float] NULL,
	[fechaVenceCompra_serie] [datetime] NULL,
	[fechaVenceVenta_serie] [datetime] NULL,
 CONSTRAINT [PK_tbl_SerieProducto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[id_serie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Sub_Categoria]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sub_Categoria](
	[id_subcategoria] [int] NOT NULL,
	[descripcion_subcategoria] [nvarchar](max) NULL,
	[id_categoria] [int] NULL,
 CONSTRAINT [PK_Sub_Categoria] PRIMARY KEY CLUSTERED 
(
	[id_subcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tablaProyectada]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tablaProyectada](
	[id_tabla] [int] IDENTITY(1,1) NOT NULL,
	[id_cuentaCobro] [int] NOT NULL,
	[nroCuota_tabla] [int] NOT NULL,
	[fechaVence_tabla] [datetime] NOT NULL,
	[diasMora_tabla] [float] NOT NULL,
	[cuotaProyectada_tabla] [money] NOT NULL,
	[cuotaInteresProyec_tabla] [money] NOT NULL,
	[cuotaCapital_tabla] [money] NOT NULL,
	[cuotaExtra_tabla] [money] NULL,
	[cuotaMora_tabla] [money] NOT NULL,
	[saldo_tabla] [money] NOT NULL,
	[estado_tabla] [int] NOT NULL,
 CONSTRAINT [PK_tbl_tablaProyectada] PRIMARY KEY CLUSTERED 
(
	[id_tabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TarjetaCredito]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TarjetaCredito](
	[id_tarjeta] [int] NOT NULL,
	[descripcion_tarjeta] [varchar](50) NOT NULL,
	[tarifa_tarjeta] [float] NOT NULL,
 CONSTRAINT [PK_tbl_TarjetaCredito] PRIMARY KEY CLUSTERED 
(
	[id_tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tequipo]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tequipo](
	[id_tequipo] [int] NOT NULL,
	[nombre_tequipo] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_tequipo] PRIMARY KEY CLUSTERED 
(
	[id_tequipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TipoDocumentoPagos]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TipoDocumentoPagos](
	[id_tipoDocumentoPago] [int] NOT NULL,
	[descripcion_tipoDocumentoPago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_TipoDocumentoPagos] PRIMARY KEY CLUSTERED 
(
	[id_tipoDocumentoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tipoEmpleado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tipoEmpleado](
	[id_templeado] [int] NOT NULL,
	[descripcion_templeado] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_tipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[id_templeado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TipoProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TipoProducto](
	[id_tproducto] [int] NOT NULL,
	[descripcion_tproducto] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[id_tproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TipoReparacion]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TipoReparacion](
	[id_treparacion] [int] NOT NULL,
	[nombre_treparacion] [nvarchar](max) NULL,
	[monto_treparacion] [money] NULL,
 CONSTRAINT [PK_tbl_TipoReparacion] PRIMARY KEY CLUSTERED 
(
	[id_treparacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_traslado]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_traslado](
	[id_traslado] [int] NOT NULL,
	[fecha_traslado] [datetime] NOT NULL,
	[id_bodegaOrigen] [int] NOT NULL,
	[id_bodegaDestino] [int] NOT NULL,
	[descripcion_traslado] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_traslado] PRIMARY KEY CLUSTERED 
(
	[id_traslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UnidadMedida]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UnidadMedida](
	[id_medida] [int] NOT NULL,
	[descripcion_medida] [nchar](10) NULL,
	[cantidad_medida] [float] NULL,
 CONSTRAINT [PK_tbl_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[id_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_venta]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_venta](
	[id_venta] [int] NOT NULL,
	[fecha_venta] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_bodega] [int] NOT NULL,
	[id_formaPago] [int] NOT NULL,
	[total_venta] [money] NOT NULL,
	[id_documento] [int] NULL,
	[documento] [nvarchar](max) NULL,
	[observaciones_venta] [nvarchar](max) NULL,
	[plazo_venta] [int] NULL,
	[boletaDeposito_venta] [int] NULL,
	[deposito_venta] [money] NULL,
	[diffDepoCompra_venta] [money] NULL,
	[usuario_venta] [nvarchar](max) NULL,
	[cobrado_venta] [bit] NULL,
 CONSTRAINT [PK_tbl_venta] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ventaTemp]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ventaTemp](
	[id_venta] [int] NOT NULL,
	[fecha_venta] [datetime] NULL,
	[id_cliente] [int] NULL,
	[id_bodega] [int] NULL,
	[id_formaPago] [int] NULL,
	[total_venta] [money] NULL,
	[id_documento] [int] NULL,
	[documento] [nvarchar](max) NULL,
	[observaciones_venta] [nvarchar](max) NULL,
	[plazo_venta] [int] NULL,
	[boletaDeposito_venta] [int] NULL,
	[deposito_venta] [money] NULL,
	[diffDepoCompra_venta] [money] NULL,
	[usuario_venta] [nvarchar](max) NULL,
	[cobrado_venta] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleDevolucionProveedor]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleDevolucionProveedor](
	[id_linea] [int] IDENTITY(1,1) NOT NULL,
	[id_devolucionProveedor] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[descripcion_producto] [nvarchar](max) NOT NULL,
	[precio_producto] [money] NOT NULL,
	[cantidad_producto] [float] NOT NULL,
	[id_kardex] [int] NOT NULL,
	[porcentajeIva] [float] NOT NULL,
	[porcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_tblDetalleDevolucionProveedor] PRIMARY KEY CLUSTERED 
(
	[id_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_barra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_barra_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_barra] CHECK CONSTRAINT [FK_tbl_barra_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_bodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bodegaProducto_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_bodegaProducto] CHECK CONSTRAINT [FK_tbl_bodegaProducto_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_bodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bodegaProducto_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_bodegaProducto] CHECK CONSTRAINT [FK_tbl_bodegaProducto_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_CajaDiaria]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CajaDiaria_tbl_cajas] FOREIGN KEY([id_caja])
REFERENCES [dbo].[tbl_cajas] ([id_caja])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_CajaDiaria] CHECK CONSTRAINT [FK_tbl_CajaDiaria_tbl_cajas]
GO
ALTER TABLE [dbo].[tbl_cliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cliente_tbl_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[tbl_municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[tbl_cliente] CHECK CONSTRAINT [FK_tbl_cliente_tbl_municipio]
GO
ALTER TABLE [dbo].[tbl_compra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_compra_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_compra] CHECK CONSTRAINT [FK_tbl_compra_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_compra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_compra_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_compra] CHECK CONSTRAINT [FK_tbl_compra_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_compra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_compra_tbl_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_proveedor] ([id_proveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_compra] CHECK CONSTRAINT [FK_tbl_compra_tbl_proveedor]
GO
ALTER TABLE [dbo].[tbl_ControlArqueo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ControlArqueo_tbl_cajas] FOREIGN KEY([id_caja])
REFERENCES [dbo].[tbl_cajas] ([id_caja])
GO
ALTER TABLE [dbo].[tbl_ControlArqueo] CHECK CONSTRAINT [FK_tbl_ControlArqueo_tbl_cajas]
GO
ALTER TABLE [dbo].[tbl_ControlArqueoCierre]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ControlArqueoCierre_tbl_cajas] FOREIGN KEY([id_caja])
REFERENCES [dbo].[tbl_cajas] ([id_caja])
GO
ALTER TABLE [dbo].[tbl_ControlArqueoCierre] CHECK CONSTRAINT [FK_tbl_ControlArqueoCierre_tbl_cajas]
GO
ALTER TABLE [dbo].[tbl_ControlCajasApertura]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ControlCajasApertura_tbl_cajas] FOREIGN KEY([id_caja])
REFERENCES [dbo].[tbl_cajas] ([id_caja])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_ControlCajasApertura] CHECK CONSTRAINT [FK_tbl_ControlCajasApertura_tbl_cajas]
GO
ALTER TABLE [dbo].[tbl_detalle_inventario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalle_inventario_tbl_Inventario] FOREIGN KEY([id_inventario])
REFERENCES [dbo].[tbl_Inventario] ([id_inventario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_detalle_inventario] CHECK CONSTRAINT [FK_tbl_detalle_inventario_tbl_Inventario]
GO
ALTER TABLE [dbo].[tbl_detalle_inventario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalle_inventario_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_detalle_inventario] CHECK CONSTRAINT [FK_tbl_detalle_inventario_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCompra_tbl_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[tbl_compra] ([id_compra])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetalleCompra] CHECK CONSTRAINT [FK_tbl_DetalleCompra_tbl_compra]
GO
ALTER TABLE [dbo].[tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCompra_tbl_Kardex1] FOREIGN KEY([id_kardex])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_DetalleCompra] CHECK CONSTRAINT [FK_tbl_DetalleCompra_tbl_Kardex1]
GO
ALTER TABLE [dbo].[tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCompra_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_DetalleCompra] CHECK CONSTRAINT [FK_tbl_DetalleCompra_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente] FOREIGN KEY([id_devolucionCliente])
REFERENCES [dbo].[tbl_devolucionCliente] ([id_devolucionCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente] CHECK CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente]
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_Kardex] FOREIGN KEY([id_kardex])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente] CHECK CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_Kardex]
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_DetalleDevolucionCliente] CHECK CONSTRAINT [FK_tbl_DetalleDevolucionCliente_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleKit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleKit_tbl_kit] FOREIGN KEY([id_kit])
REFERENCES [dbo].[tbl_kit] ([id_kit])
GO
ALTER TABLE [dbo].[tbl_DetalleKit] CHECK CONSTRAINT [FK_tbl_DetalleKit_tbl_kit]
GO
ALTER TABLE [dbo].[tbl_DetalleKit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleKit_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_DetalleKit] CHECK CONSTRAINT [FK_tbl_DetalleKit_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetallePagoCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetallePagoCredito_tbl_PagoCredito] FOREIGN KEY([id_pagocre])
REFERENCES [dbo].[tbl_PagoCredito] ([id_pagocre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetallePagoCredito] CHECK CONSTRAINT [FK_tbl_DetallePagoCredito_tbl_PagoCredito]
GO
ALTER TABLE [dbo].[tbl_DetallePagoCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetallePagoCredito_tbl_tablaProyectada] FOREIGN KEY([id_tabla])
REFERENCES [dbo].[tbl_tablaProyectada] ([id_tabla])
GO
ALTER TABLE [dbo].[tbl_DetallePagoCredito] CHECK CONSTRAINT [FK_tbl_DetallePagoCredito_tbl_tablaProyectada]
GO
ALTER TABLE [dbo].[tbl_DetallePagoCreditoContado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar] FOREIGN KEY([id_cuentaCobro])
REFERENCES [dbo].[tbl_cuentasPorCobrar] ([id_cuentaCobro])
GO
ALTER TABLE [dbo].[tbl_DetallePagoCreditoContado] CHECK CONSTRAINT [FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar]
GO
ALTER TABLE [dbo].[tbl_DetallePagoCreditoContado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado] FOREIGN KEY([id_pagocrecont])
REFERENCES [dbo].[tbl_PagoCreditoContado] ([id_pagocrecont])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetallePagoCreditoContado] CHECK CONSTRAINT [FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado]
GO
ALTER TABLE [dbo].[tbl_detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detallePedido_tbl_pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[tbl_pedido] ([id_pedido])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_detallePedido] CHECK CONSTRAINT [FK_tbl_detallePedido_tbl_pedido]
GO
ALTER TABLE [dbo].[tbl_detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detallePedido_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_detallePedido] CHECK CONSTRAINT [FK_tbl_detallePedido_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleProforma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleProforma_tbl_proforma] FOREIGN KEY([id_proforma])
REFERENCES [dbo].[tbl_proforma] ([id_proforma])
GO
ALTER TABLE [dbo].[tbl_DetalleProforma] CHECK CONSTRAINT [FK_tbl_DetalleProforma_tbl_proforma]
GO
ALTER TABLE [dbo].[tbl_DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleSalida_tbl_Kardex] FOREIGN KEY([id_kardex])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_DetalleSalida] CHECK CONSTRAINT [FK_tbl_DetalleSalida_tbl_Kardex]
GO
ALTER TABLE [dbo].[tbl_DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleSalida_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_DetalleSalida] CHECK CONSTRAINT [FK_tbl_DetalleSalida_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleSalida_tbl_salida] FOREIGN KEY([id_salida])
REFERENCES [dbo].[tbl_salida] ([id_salida])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetalleSalida] CHECK CONSTRAINT [FK_tbl_DetalleSalida_tbl_salida]
GO
ALTER TABLE [dbo].[tbl_detalleTraslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalleTraslado_tbl_Kardex] FOREIGN KEY([id_kardexOrigen])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_detalleTraslado] CHECK CONSTRAINT [FK_tbl_detalleTraslado_tbl_Kardex]
GO
ALTER TABLE [dbo].[tbl_detalleTraslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalleTraslado_tbl_Kardex1] FOREIGN KEY([id_KardexDestino])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_detalleTraslado] CHECK CONSTRAINT [FK_tbl_detalleTraslado_tbl_Kardex1]
GO
ALTER TABLE [dbo].[tbl_detalleTraslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalleTraslado_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_detalleTraslado] CHECK CONSTRAINT [FK_tbl_detalleTraslado_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_detalleTraslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_detalleTraslado_tbl_traslado] FOREIGN KEY([id_traslado])
REFERENCES [dbo].[tbl_traslado] ([id_traslado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_detalleTraslado] CHECK CONSTRAINT [FK_tbl_detalleTraslado_tbl_traslado]
GO
ALTER TABLE [dbo].[tbl_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleVenta_tbl_Kardex] FOREIGN KEY([id_kardex])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tbl_DetalleVenta] CHECK CONSTRAINT [FK_tbl_DetalleVenta_tbl_Kardex]
GO
ALTER TABLE [dbo].[tbl_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleVenta_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_DetalleVenta] CHECK CONSTRAINT [FK_tbl_DetalleVenta_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleVenta_tbl_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[tbl_venta] ([id_venta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_DetalleVenta] CHECK CONSTRAINT [FK_tbl_DetalleVenta_tbl_venta]
GO
ALTER TABLE [dbo].[tbl_devolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_tbl_devolucionCliente_tbl_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[tbl_venta] ([id_venta])
GO
ALTER TABLE [dbo].[tbl_devolucionCliente] CHECK CONSTRAINT [FK_tbl_devolucionCliente_tbl_venta]
GO
ALTER TABLE [dbo].[tbl_devolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_devolucionProveedor_tbl_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[tbl_compra] ([id_compra])
GO
ALTER TABLE [dbo].[tbl_devolucionProveedor] CHECK CONSTRAINT [FK_tbl_devolucionProveedor_tbl_compra]
GO
ALTER TABLE [dbo].[tbl_Documentos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Documentos_tbl_TipoDocumentoPagos] FOREIGN KEY([id_tipoDocumentoPago])
REFERENCES [dbo].[tbl_TipoDocumentoPagos] ([id_tipoDocumentoPago])
GO
ALTER TABLE [dbo].[tbl_Documentos] CHECK CONSTRAINT [FK_tbl_Documentos_tbl_TipoDocumentoPagos]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_empleado_tbl_cajas] FOREIGN KEY([id_caja])
REFERENCES [dbo].[tbl_cajas] ([id_caja])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tbl_empleado_tbl_cajas]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_empleado_tbl_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[tbl_municipio] ([id_municipio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tbl_empleado_tbl_municipio]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_empleado_tbl_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[tbl_rol] ([id_rol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tbl_empleado_tbl_rol]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_empleado_tbl_tipoEmpleado] FOREIGN KEY([id_templeado])
REFERENCES [dbo].[tbl_tipoEmpleado] ([id_templeado])
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tbl_empleado_tbl_tipoEmpleado]
GO
ALTER TABLE [dbo].[tbl_equipo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_equipo_tbl_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[tbl_modelo] ([id_modelo])
GO
ALTER TABLE [dbo].[tbl_equipo] CHECK CONSTRAINT [FK_tbl_equipo_tbl_modelo]
GO
ALTER TABLE [dbo].[tbl_FacturasCompras]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FacturasCompras_tbl_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[tbl_compra] ([id_compra])
GO
ALTER TABLE [dbo].[tbl_FacturasCompras] CHECK CONSTRAINT [FK_tbl_FacturasCompras_tbl_compra]
GO
ALTER TABLE [dbo].[tbl_FacturasVentas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FacturasVentas_tbl_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[tbl_venta] ([id_venta])
GO
ALTER TABLE [dbo].[tbl_FacturasVentas] CHECK CONSTRAINT [FK_tbl_FacturasVentas_tbl_venta]
GO
ALTER TABLE [dbo].[tbl_gastos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_gastos_tbl_conceptos] FOREIGN KEY([id_concepto])
REFERENCES [dbo].[tbl_conceptos] ([id_concepto])
GO
ALTER TABLE [dbo].[tbl_gastos] CHECK CONSTRAINT [FK_tbl_gastos_tbl_conceptos]
GO
ALTER TABLE [dbo].[tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Inventario_Sub_Categoria] FOREIGN KEY([id_SubCategoriaSource])
REFERENCES [dbo].[tbl_Sub_Categoria] ([id_subcategoria])
GO
ALTER TABLE [dbo].[tbl_Inventario] CHECK CONSTRAINT [FK_tbl_Inventario_Sub_Categoria]
GO
ALTER TABLE [dbo].[tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Inventario_Sub_Categoria1] FOREIGN KEY([id_SubCategoriaTarget])
REFERENCES [dbo].[tbl_Sub_Categoria] ([id_subcategoria])
GO
ALTER TABLE [dbo].[tbl_Inventario] CHECK CONSTRAINT [FK_tbl_Inventario_Sub_Categoria1]
GO
ALTER TABLE [dbo].[tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Inventario_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Inventario] CHECK CONSTRAINT [FK_tbl_Inventario_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_Kardex]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kardex_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_Kardex] CHECK CONSTRAINT [FK_tbl_Kardex_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_Kardex]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kardex_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_Kardex] CHECK CONSTRAINT [FK_tbl_Kardex_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_kit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_kit_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_kit] CHECK CONSTRAINT [FK_tbl_kit_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_modelo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_modelo_tbl_marcaEquipos] FOREIGN KEY([id_marcaE])
REFERENCES [dbo].[tbl_marcaEquipos] ([id_marcaE])
GO
ALTER TABLE [dbo].[tbl_modelo] CHECK CONSTRAINT [FK_tbl_modelo_tbl_marcaEquipos]
GO
ALTER TABLE [dbo].[tbl_modelo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_modelo_tbl_tequipo] FOREIGN KEY([id_tequipo])
REFERENCES [dbo].[tbl_tequipo] ([id_tequipo])
GO
ALTER TABLE [dbo].[tbl_modelo] CHECK CONSTRAINT [FK_tbl_modelo_tbl_tequipo]
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_MovimientoCuentaClientes_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaClientes] CHECK CONSTRAINT [FK_tbl_MovimientoCuentaClientes_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_MovimientoCuentaClientes_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaClientes] CHECK CONSTRAINT [FK_tbl_MovimientoCuentaClientes_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaProveedores]  WITH CHECK ADD  CONSTRAINT [FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaProveedores] CHECK CONSTRAINT [FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaProveedores]  WITH CHECK ADD  CONSTRAINT [FK_tbl_MovimientoCuentaProveedores_tbl_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_MovimientoCuentaProveedores] CHECK CONSTRAINT [FK_tbl_MovimientoCuentaProveedores_tbl_proveedor]
GO
ALTER TABLE [dbo].[tbl_municipio]  WITH CHECK ADD  CONSTRAINT [FK_tbl_municipio_tbl_departamento] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[tbl_departamento] ([id_departamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_municipio] CHECK CONSTRAINT [FK_tbl_municipio_tbl_departamento]
GO
ALTER TABLE [dbo].[tbl_notaCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_notaCredito_tbl_cuentasPorCobrar] FOREIGN KEY([id_cuentaCobro])
REFERENCES [dbo].[tbl_cuentasPorCobrar] ([id_cuentaCobro])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_notaCredito] CHECK CONSTRAINT [FK_tbl_notaCredito_tbl_cuentasPorCobrar]
GO
ALTER TABLE [dbo].[tbl_notaDebito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_notaDebito_tbl_cuentasPorCobrar] FOREIGN KEY([id_cuentaCobro])
REFERENCES [dbo].[tbl_cuentasPorCobrar] ([id_cuentaCobro])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_notaDebito] CHECK CONSTRAINT [FK_tbl_notaDebito_tbl_cuentasPorCobrar]
GO
ALTER TABLE [dbo].[tbl_PagoCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCredito_tbl_cuentasPorCobrar] FOREIGN KEY([id_cuentaCobro])
REFERENCES [dbo].[tbl_cuentasPorCobrar] ([id_cuentaCobro])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PagoCredito] CHECK CONSTRAINT [FK_tbl_PagoCredito_tbl_cuentasPorCobrar]
GO
ALTER TABLE [dbo].[tbl_PagoCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCredito_tbl_Documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[tbl_Documentos] ([id_documento])
GO
ALTER TABLE [dbo].[tbl_PagoCredito] CHECK CONSTRAINT [FK_tbl_PagoCredito_tbl_Documentos]
GO
ALTER TABLE [dbo].[tbl_PagoCredito]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCredito_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_PagoCredito] CHECK CONSTRAINT [FK_tbl_PagoCredito_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado] CHECK CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_Documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[tbl_Documentos] ([id_documento])
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado] CHECK CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_Documentos]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_PagoCreditoContado] CHECK CONSTRAINT [FK_tbl_PagoCreditoContado_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[tbl_Documentos] ([id_documento])
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra] CHECK CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra] CHECK CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada] FOREIGN KEY([id_tabla])
REFERENCES [dbo].[tbl_tablaProyectada] ([id_tabla])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PagoCreditoCuotaExtra] CHECK CONSTRAINT [FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada]
GO
ALTER TABLE [dbo].[tbl_PagoProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoProveedor_tbl_Documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[tbl_Documentos] ([id_documento])
GO
ALTER TABLE [dbo].[tbl_PagoProveedor] CHECK CONSTRAINT [FK_tbl_PagoProveedor_tbl_Documentos]
GO
ALTER TABLE [dbo].[tbl_PagoProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoProveedor_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_PagoProveedor] CHECK CONSTRAINT [FK_tbl_PagoProveedor_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_PagoProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoProveedor_tbl_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_proveedor] ([id_proveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PagoProveedor] CHECK CONSTRAINT [FK_tbl_PagoProveedor_tbl_proveedor]
GO
ALTER TABLE [dbo].[tbl_PagoProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar] FOREIGN KEY([id_CuentaPorPagar])
REFERENCES [dbo].[tbl_CuentaPorPagar] ([id_CuentaPorPagar])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PagoProveedorDetalle] CHECK CONSTRAINT [FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar]
GO
ALTER TABLE [dbo].[tbl_PagoProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor] FOREIGN KEY([id_pago])
REFERENCES [dbo].[tbl_PagoProveedor] ([id_pago])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PagoProveedorDetalle] CHECK CONSTRAINT [FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor]
GO
ALTER TABLE [dbo].[tbl_pedido]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pedido_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_pedido] CHECK CONSTRAINT [FK_tbl_pedido_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_pedido]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pedido_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_pedido] CHECK CONSTRAINT [FK_tbl_pedido_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_pedido]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pedido_tbl_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_empleado] ([id_empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_pedido] CHECK CONSTRAINT [FK_tbl_pedido_tbl_empleado]
GO
ALTER TABLE [dbo].[tbl_PermisosRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PermisosRol_tbl_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[tbl_rol] ([id_rol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_PermisosRol] CHECK CONSTRAINT [FK_tbl_PermisosRol_tbl_rol]
GO
ALTER TABLE [dbo].[tbl_PrecioCostoPorProductoByFecha]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_PrecioCostoPorProductoByFecha] CHECK CONSTRAINT [FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Producto_Sub_Categoria] FOREIGN KEY([id_Sub_Categoria])
REFERENCES [dbo].[tbl_Sub_Categoria] ([id_subcategoria])
GO
ALTER TABLE [dbo].[tbl_Producto] CHECK CONSTRAINT [FK_tbl_Producto_Sub_Categoria]
GO
ALTER TABLE [dbo].[tbl_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Producto_tbl_iva] FOREIGN KEY([id_iva])
REFERENCES [dbo].[tbl_iva] ([id_iva])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Producto] CHECK CONSTRAINT [FK_tbl_Producto_tbl_iva]
GO
ALTER TABLE [dbo].[tbl_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Producto_tbl_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[tbl_marca] ([id_marca])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Producto] CHECK CONSTRAINT [FK_tbl_Producto_tbl_marca]
GO
ALTER TABLE [dbo].[tbl_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Producto_tbl_TipoProducto] FOREIGN KEY([id_tproducto])
REFERENCES [dbo].[tbl_TipoProducto] ([id_tproducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Producto] CHECK CONSTRAINT [FK_tbl_Producto_tbl_TipoProducto]
GO
ALTER TABLE [dbo].[tbl_ProductUnidPrecioVenta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ProductUnidPrecioVenta_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_ProductUnidPrecioVenta] CHECK CONSTRAINT [FK_tbl_ProductUnidPrecioVenta_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_ProductUnidPrecioVenta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida] FOREIGN KEY([id_medida])
REFERENCES [dbo].[tbl_UnidadMedida] ([id_medida])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_ProductUnidPrecioVenta] CHECK CONSTRAINT [FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida]
GO
ALTER TABLE [dbo].[tbl_proforma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_proforma_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_proforma] CHECK CONSTRAINT [FK_tbl_proforma_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_proforma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_proforma_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_proforma] CHECK CONSTRAINT [FK_tbl_proforma_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_proforma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_proforma_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_proforma] CHECK CONSTRAINT [FK_tbl_proforma_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tbl_provbancos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_provbancos_tbl_banco] FOREIGN KEY([id_banco])
REFERENCES [dbo].[tbl_banco] ([id_banco])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_provbancos] CHECK CONSTRAINT [FK_tbl_provbancos_tbl_banco]
GO
ALTER TABLE [dbo].[tbl_provbancos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_provbancos_tbl_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_provbancos] CHECK CONSTRAINT [FK_tbl_provbancos_tbl_proveedor]
GO
ALTER TABLE [dbo].[tbl_proveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_proveedor_tbl_iva] FOREIGN KEY([id_iva])
REFERENCES [dbo].[tbl_iva] ([id_iva])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_proveedor] CHECK CONSTRAINT [FK_tbl_proveedor_tbl_iva]
GO
ALTER TABLE [dbo].[tbl_proveedor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_proveedor_tbl_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[tbl_municipio] ([id_municipio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_proveedor] CHECK CONSTRAINT [FK_tbl_proveedor_tbl_municipio]
GO
ALTER TABLE [dbo].[tbl_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_reparacion_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_reparacion] CHECK CONSTRAINT [FK_tbl_reparacion_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_reparacion_tbl_equipo] FOREIGN KEY([id_equipo])
REFERENCES [dbo].[tbl_equipo] ([id_equipo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_reparacion] CHECK CONSTRAINT [FK_tbl_reparacion_tbl_equipo]
GO
ALTER TABLE [dbo].[tbl_reparacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_reparacion_tbl_TipoReparacion] FOREIGN KEY([id_treparacion])
REFERENCES [dbo].[tbl_TipoReparacion] ([id_treparacion])
GO
ALTER TABLE [dbo].[tbl_reparacion] CHECK CONSTRAINT [FK_tbl_reparacion_tbl_TipoReparacion]
GO
ALTER TABLE [dbo].[tbl_reparacionRepuestosLevel1]  WITH CHECK ADD  CONSTRAINT [FK_tbl_reparacionRepuestosLevel1_tbl_pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[tbl_pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[tbl_reparacionRepuestosLevel1] CHECK CONSTRAINT [FK_tbl_reparacionRepuestosLevel1_tbl_pedido]
GO
ALTER TABLE [dbo].[tbl_reparacionRepuestosLevel1]  WITH CHECK ADD  CONSTRAINT [FK_tbl_reparacionRepuestosLevel1_tbl_reparacion] FOREIGN KEY([id_reparacion])
REFERENCES [dbo].[tbl_reparacion] ([id_reparacion])
GO
ALTER TABLE [dbo].[tbl_reparacionRepuestosLevel1] CHECK CONSTRAINT [FK_tbl_reparacionRepuestosLevel1_tbl_reparacion]
GO
ALTER TABLE [dbo].[tbl_salida]  WITH CHECK ADD  CONSTRAINT [FK_tbl_salida_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_salida] CHECK CONSTRAINT [FK_tbl_salida_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_salida]  WITH CHECK ADD  CONSTRAINT [FK_tbl_salida_tbl_conceptos] FOREIGN KEY([id_concepto])
REFERENCES [dbo].[tbl_conceptos] ([id_concepto])
GO
ALTER TABLE [dbo].[tbl_salida] CHECK CONSTRAINT [FK_tbl_salida_tbl_conceptos]
GO
ALTER TABLE [dbo].[tbl_SerieProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SerieProducto_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_SerieProducto] CHECK CONSTRAINT [FK_tbl_SerieProducto_tbl_Producto]
GO
ALTER TABLE [dbo].[tbl_Sub_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Categoria_tbl_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tbl_categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[tbl_Sub_Categoria] CHECK CONSTRAINT [FK_Sub_Categoria_tbl_categoria]
GO
ALTER TABLE [dbo].[tbl_tablaProyectada]  WITH CHECK ADD  CONSTRAINT [FK_tbl_tablaProyectada_tbl_cuentasPorCobrar] FOREIGN KEY([id_cuentaCobro])
REFERENCES [dbo].[tbl_cuentasPorCobrar] ([id_cuentaCobro])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_tablaProyectada] CHECK CONSTRAINT [FK_tbl_tablaProyectada_tbl_cuentasPorCobrar]
GO
ALTER TABLE [dbo].[tbl_traslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_traslado_tbl_bodega] FOREIGN KEY([id_bodegaOrigen])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_traslado] CHECK CONSTRAINT [FK_tbl_traslado_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_traslado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_traslado_tbl_bodega1] FOREIGN KEY([id_bodegaDestino])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_traslado] CHECK CONSTRAINT [FK_tbl_traslado_tbl_bodega1]
GO
ALTER TABLE [dbo].[tbl_venta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venta_tbl_bodega] FOREIGN KEY([id_bodega])
REFERENCES [dbo].[tbl_bodega] ([id_bodega])
GO
ALTER TABLE [dbo].[tbl_venta] CHECK CONSTRAINT [FK_tbl_venta_tbl_bodega]
GO
ALTER TABLE [dbo].[tbl_venta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venta_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_venta] CHECK CONSTRAINT [FK_tbl_venta_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_venta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venta_tbl_Documentos] FOREIGN KEY([id_documento])
REFERENCES [dbo].[tbl_Documentos] ([id_documento])
GO
ALTER TABLE [dbo].[tbl_venta] CHECK CONSTRAINT [FK_tbl_venta_tbl_Documentos]
GO
ALTER TABLE [dbo].[tbl_venta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venta_tbl_FormaPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[tbl_FormaPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[tbl_venta] CHECK CONSTRAINT [FK_tbl_venta_tbl_FormaPago]
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor] FOREIGN KEY([id_devolucionProveedor])
REFERENCES [dbo].[tbl_devolucionProveedor] ([id_devolucionProveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor] CHECK CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor]
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_Kardex] FOREIGN KEY([id_kardex])
REFERENCES [dbo].[tbl_Kardex] ([id_kardex])
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor] CHECK CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_Kardex]
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_Producto] ([id_producto])
GO
ALTER TABLE [dbo].[tblDetalleDevolucionProveedor] CHECK CONSTRAINT [FK_tblDetalleDevolucionProveedor_tbl_Producto]
GO