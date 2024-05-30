GO
/****** Object:  View [dbo].[View_ListaBodegaProductoByIDBodegaAndPrecios]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ListaBodegaProductoByIDBodegaAndPrecios] AS 
SELECT
dbo.tbl_bodegaProducto.id_bodega,
dbo.tbl_bodegaProducto.id_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto,
dbo.tbl_Producto.costo_producto,
dbo.tbl_ProductUnidPrecioVenta.precio,
dbo.tbl_Producto.id_Sub_Categoria,
dbo.tbl_categoria.id_categoria

FROM
dbo.tbl_bodegaProducto
INNER JOIN dbo.tbl_Producto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_ProductUnidPrecioVenta ON dbo.tbl_ProductUnidPrecioVenta.id_producto = dbo.tbl_Producto.id_producto
INNER JOIN dbo.tbl_Sub_Categoria ON dbo.tbl_Producto.id_Sub_Categoria = dbo.tbl_Sub_Categoria.id_subcategoria
INNER JOIN dbo.tbl_categoria ON dbo.tbl_Sub_Categoria.id_categoria = dbo.tbl_categoria.id_categoria
WHERE
dbo.tbl_bodegaProducto.id_bodega = 2 AND
dbo.tbl_ProductUnidPrecioVenta.precioBase = 1 AND
dbo.tbl_Producto.id_Sub_Categoria = 1 AND
dbo.tbl_Sub_Categoria.id_categoria = 1
GO
/****** Object:  View [dbo].[View_LIstProductByIDBodega]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LIstProductByIDBodega] AS 
SELECT
dbo.tbl_bodegaProducto.id_bodega,
dbo.tbl_bodegaProducto.id_producto,
dbo.tbl_Producto.descripcion_producto,
dbo.tbl_bodegaProducto.stock_producto

FROM
dbo.tbl_bodegaProducto
INNER JOIN dbo.tbl_Producto ON dbo.tbl_bodegaProducto.id_producto = dbo.tbl_Producto.id_producto
WHERE
dbo.tbl_bodegaProducto.id_bodega = 2
GO
/****** Object:  View [dbo].[View_ProductListByIDProductoFromCompraDetails]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ProductListByIDProductoFromCompraDetails]
AS
SELECT        dbo.tbl_DetalleCompra.id_compra, dbo.tbl_DetalleCompra.id_producto, dbo.tbl_DetalleCompra.descripcion_producto, dbo.tbl_DetalleCompra.cantidad_producto, dbo.tbl_DetalleCompra.costo_producto, 
                         dbo.tbl_proveedor.id_proveedor, dbo.tbl_proveedor.nombreComercial_proveedor
FROM            dbo.tbl_compra INNER JOIN
                         dbo.tbl_DetalleCompra ON dbo.tbl_compra.id_compra = dbo.tbl_DetalleCompra.id_compra INNER JOIN
                         dbo.tbl_Producto ON dbo.tbl_DetalleCompra.id_producto = dbo.tbl_Producto.id_producto INNER JOIN
                         dbo.tbl_proveedor ON dbo.tbl_compra.id_proveedor = dbo.tbl_proveedor.id_proveedor
GO
/****** Object:  View [dbo].[View_ProductListToIDProducto]    Script Date: 5/19/2024 3:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ProductListToIDProducto] AS 
SELECT
dbo.tbl_DetalleCompra.id_compra,
dbo.tbl_compra.fecha_compra,
dbo.tbl_DetalleCompra.id_producto,
dbo.tbl_DetalleCompra.descripcion_producto,
dbo.tbl_DetalleCompra.cantidad_producto,
dbo.tbl_DetalleCompra.costo_producto,
dbo.tbl_proveedor.id_proveedor,
dbo.tbl_proveedor.nombreComercial_proveedor

FROM            dbo.tbl_compra INNER JOIN
                         dbo.tbl_DetalleCompra ON dbo.tbl_compra.id_compra = dbo.tbl_DetalleCompra.id_compra INNER JOIN
                         dbo.tbl_Producto ON dbo.tbl_DetalleCompra.id_producto = dbo.tbl_Producto.id_producto INNER JOIN
                         dbo.tbl_proveedor ON dbo.tbl_compra.id_proveedor = dbo.tbl_proveedor.id_proveedor
WHERE
dbo.tbl_DetalleCompra.id_producto = 519