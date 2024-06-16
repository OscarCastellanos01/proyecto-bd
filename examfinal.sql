-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aplicationcomercial
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `View_LIstProductByIDBodega`
--

DROP TABLE IF EXISTS `View_LIstProductByIDBodega`;
/*!50001 DROP VIEW IF EXISTS `View_LIstProductByIDBodega`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_LIstProductByIDBodega` AS SELECT 
 1 AS `id_bodega`,
 1 AS `id_producto`,
 1 AS `descripcion_producto`,
 1 AS `stock_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_ListaBodegaProductoByIDBodegaAndPrecios`
--

DROP TABLE IF EXISTS `View_ListaBodegaProductoByIDBodegaAndPrecios`;
/*!50001 DROP VIEW IF EXISTS `View_ListaBodegaProductoByIDBodegaAndPrecios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_ListaBodegaProductoByIDBodegaAndPrecios` AS SELECT 
 1 AS `id_bodega`,
 1 AS `id_producto`,
 1 AS `descripcion_producto`,
 1 AS `stock_producto`,
 1 AS `costo_producto`,
 1 AS `precio`,
 1 AS `id_Sub_Categoria`,
 1 AS `id_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_ProductListByIDProductoFromCompraDetails`
--

DROP TABLE IF EXISTS `View_ProductListByIDProductoFromCompraDetails`;
/*!50001 DROP VIEW IF EXISTS `View_ProductListByIDProductoFromCompraDetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_ProductListByIDProductoFromCompraDetails` AS SELECT 
 1 AS `id_compra`,
 1 AS `id_producto`,
 1 AS `descripcion_producto`,
 1 AS `cantidad_producto`,
 1 AS `costo_producto`,
 1 AS `id_proveedor`,
 1 AS `nombreComercial_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View_ProductListToIDProducto`
--

DROP TABLE IF EXISTS `View_ProductListToIDProducto`;
/*!50001 DROP VIEW IF EXISTS `View_ProductListToIDProducto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View_ProductListToIDProducto` AS SELECT 
 1 AS `id_compra`,
 1 AS `fecha_compra`,
 1 AS `id_producto`,
 1 AS `descripcion_producto`,
 1 AS `cantidad_producto`,
 1 AS `costo_producto`,
 1 AS `id_proveedor`,
 1 AS `nombreComercial_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tblDetalleDevolucionProveedor`
--

DROP TABLE IF EXISTS `tblDetalleDevolucionProveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblDetalleDevolucionProveedor` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_devolucionProveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) NOT NULL,
  `cantidad_producto` double NOT NULL,
  `id_kardex` int NOT NULL,
  `porcentajeIva` double NOT NULL,
  `porcentajeDescuento` double NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor` (`id_devolucionProveedor`),
  KEY `FK_tblDetalleDevolucionProveedor_tbl_Kardex` (`id_kardex`),
  KEY `FK_tblDetalleDevolucionProveedor_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_devolucionProveedor` FOREIGN KEY (`id_devolucionProveedor`) REFERENCES `tbl_devolucionProveedor` (`id_devolucionProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Kardex` FOREIGN KEY (`id_kardex`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tblDetalleDevolucionProveedor_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDetalleDevolucionProveedor`
--

LOCK TABLES `tblDetalleDevolucionProveedor` WRITE;
/*!40000 ALTER TABLE `tblDetalleDevolucionProveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDetalleDevolucionProveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_CajaDiaria`
--

DROP TABLE IF EXISTS `tbl_CajaDiaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_CajaDiaria` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha_movimiento` datetime(3) NOT NULL,
  `id_caja` int NOT NULL,
  `montoApertura_movimiento` decimal(15,4) NOT NULL,
  `ingreso_movimiento` decimal(15,4) NOT NULL,
  `ingresoCheque_movimiento` decimal(15,4) NOT NULL,
  `ingresoTarjeta_movimiento` decimal(15,4) NOT NULL,
  `egreso_movimiento` decimal(15,4) NOT NULL,
  `cierre_movimiento` decimal(15,4) NOT NULL,
  `saldo_movimiento` decimal(15,4) NOT NULL,
  `estado_movimiento` int NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `FK_tbl_CajaDiaria_tbl_cajas` (`id_caja`),
  CONSTRAINT `FK_tbl_CajaDiaria_tbl_cajas` FOREIGN KEY (`id_caja`) REFERENCES `tbl_cajas` (`id_caja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_CajaDiaria`
--

LOCK TABLES `tbl_CajaDiaria` WRITE;
/*!40000 ALTER TABLE `tbl_CajaDiaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_CajaDiaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ControlArqueo`
--

DROP TABLE IF EXISTS `tbl_ControlArqueo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ControlArqueo` (
  `id_control` int NOT NULL,
  `fecha_control` datetime(3) NOT NULL,
  `id_caja` int NOT NULL,
  `Cantidad200` int DEFAULT NULL,
  `Total200` decimal(15,4) DEFAULT NULL,
  `Cantidad100` int DEFAULT NULL,
  `Total100` decimal(15,4) DEFAULT NULL,
  `Cantidad50` int DEFAULT NULL,
  `Total50` decimal(15,4) DEFAULT NULL,
  `Cantidad20` int DEFAULT NULL,
  `Total20` decimal(15,4) DEFAULT NULL,
  `Cantidad10` int DEFAULT NULL,
  `Total10` decimal(15,4) DEFAULT NULL,
  `Cantidad5` int DEFAULT NULL,
  `Total5` decimal(15,4) DEFAULT NULL,
  `Cantidad1` int DEFAULT NULL,
  `Total1` decimal(15,4) DEFAULT NULL,
  `Cantidad050` int DEFAULT NULL,
  `Total050` decimal(15,4) DEFAULT NULL,
  `Cantidad025` int DEFAULT NULL,
  `Total025` decimal(15,4) DEFAULT NULL,
  `Cantidad010` int DEFAULT NULL,
  `Total010` decimal(15,4) DEFAULT NULL,
  `Cantidad005` int DEFAULT NULL,
  `Total005` decimal(15,4) DEFAULT NULL,
  `Cantidad001` int DEFAULT NULL,
  `Total001` decimal(15,4) DEFAULT NULL,
  `GranTotal` decimal(15,4) DEFAULT NULL,
  `Estado` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_control`),
  KEY `FK_tbl_ControlArqueo_tbl_cajas` (`id_caja`),
  CONSTRAINT `FK_tbl_ControlArqueo_tbl_cajas` FOREIGN KEY (`id_caja`) REFERENCES `tbl_cajas` (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ControlArqueo`
--

LOCK TABLES `tbl_ControlArqueo` WRITE;
/*!40000 ALTER TABLE `tbl_ControlArqueo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ControlArqueo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ControlArqueoCierre`
--

DROP TABLE IF EXISTS `tbl_ControlArqueoCierre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ControlArqueoCierre` (
  `id_control` int NOT NULL,
  `fecha_control` datetime(3) NOT NULL,
  `id_caja` int NOT NULL,
  `Cantidad200` int DEFAULT NULL,
  `Total200` decimal(18,0) DEFAULT NULL,
  `Cantidad100` int DEFAULT NULL,
  `Total100` decimal(18,0) DEFAULT NULL,
  `Cantidad50` int DEFAULT NULL,
  `Total50` decimal(18,0) DEFAULT NULL,
  `Cantidad20` int DEFAULT NULL,
  `Total20` decimal(18,0) DEFAULT NULL,
  `Cantidad10` int DEFAULT NULL,
  `Total10` decimal(18,0) DEFAULT NULL,
  `Cantidad5` int DEFAULT NULL,
  `Total5` decimal(18,0) DEFAULT NULL,
  `Cantidad1` int DEFAULT NULL,
  `Total1` decimal(18,0) DEFAULT NULL,
  `Cantidad050` int DEFAULT NULL,
  `Total050` decimal(18,0) DEFAULT NULL,
  `Cantidad025` int DEFAULT NULL,
  `Total025` decimal(18,0) DEFAULT NULL,
  `Cantidad010` int DEFAULT NULL,
  `Total010` decimal(18,0) DEFAULT NULL,
  `Cantidad005` int DEFAULT NULL,
  `Total005` decimal(18,0) DEFAULT NULL,
  `Cantidad001` int DEFAULT NULL,
  `Total001` decimal(18,0) DEFAULT NULL,
  `TotalCheques` decimal(18,0) DEFAULT NULL,
  `TotalTarjetas` decimal(18,0) DEFAULT NULL,
  `GranTotal` decimal(18,0) DEFAULT NULL,
  `Estado` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_control`),
  KEY `FK_tbl_ControlArqueoCierre_tbl_cajas` (`id_caja`),
  CONSTRAINT `FK_tbl_ControlArqueoCierre_tbl_cajas` FOREIGN KEY (`id_caja`) REFERENCES `tbl_cajas` (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ControlArqueoCierre`
--

LOCK TABLES `tbl_ControlArqueoCierre` WRITE;
/*!40000 ALTER TABLE `tbl_ControlArqueoCierre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ControlArqueoCierre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ControlCajasApertura`
--

DROP TABLE IF EXISTS `tbl_ControlCajasApertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ControlCajasApertura` (
  `id_control` int NOT NULL,
  `fecha_control` datetime(3) NOT NULL,
  `id_caja` int NOT NULL,
  `control_control` int NOT NULL,
  PRIMARY KEY (`id_control`),
  KEY `FK_tbl_ControlCajasApertura_tbl_cajas` (`id_caja`),
  CONSTRAINT `FK_tbl_ControlCajasApertura_tbl_cajas` FOREIGN KEY (`id_caja`) REFERENCES `tbl_cajas` (`id_caja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ControlCajasApertura`
--

LOCK TABLES `tbl_ControlCajasApertura` WRITE;
/*!40000 ALTER TABLE `tbl_ControlCajasApertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ControlCajasApertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_CuentaPorPagar`
--

DROP TABLE IF EXISTS `tbl_CuentaPorPagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_CuentaPorPagar` (
  `id_CuentaPorPagar` int NOT NULL,
  `fecha_CuentaPorPagar` datetime(3) NOT NULL,
  `fechaVence_CuentaPorPagar` datetime(3) NOT NULL,
  `id_proveedor` int NOT NULL,
  `documento_CuentaPorPagar` longtext NOT NULL,
  `monto_CuentaPorPagar` decimal(15,4) NOT NULL,
  `plazo_CuentaPorPagar` double NOT NULL,
  `saldo_CuentaPorPagar` decimal(15,4) DEFAULT NULL,
  `estado_CuentaPorPagar` int DEFAULT NULL,
  PRIMARY KEY (`id_CuentaPorPagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_CuentaPorPagar`
--

LOCK TABLES `tbl_CuentaPorPagar` WRITE;
/*!40000 ALTER TABLE `tbl_CuentaPorPagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_CuentaPorPagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleCompra`
--

DROP TABLE IF EXISTS `tbl_DetalleCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleCompra` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `costo_producto` decimal(15,4) DEFAULT NULL,
  `cantidad_producto` double NOT NULL,
  `id_kardex` int NOT NULL,
  `porcentajeIva_Producto` double NOT NULL,
  `porcentajeDescuento_producto` double NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetalleCompra_tbl_compra` (`id_compra`),
  KEY `FK_tbl_DetalleCompra_tbl_Kardex1` (`id_kardex`),
  KEY `FK_tbl_DetalleCompra_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_DetalleCompra_tbl_compra` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_DetalleCompra_tbl_Kardex1` FOREIGN KEY (`id_kardex`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_DetalleCompra_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleCompra`
--

LOCK TABLES `tbl_DetalleCompra` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleDevolucionCliente`
--

DROP TABLE IF EXISTS `tbl_DetalleDevolucionCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleDevolucionCliente` (
  `id_liena` int NOT NULL AUTO_INCREMENT,
  `id_devolucionCliente` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) DEFAULT NULL,
  `cantidad_producto` double NOT NULL,
  `id_kardex` int NOT NULL,
  `porcentajeIva` double NOT NULL,
  `porcentajeDescuento` double NOT NULL,
  PRIMARY KEY (`id_liena`),
  KEY `FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente` (`id_devolucionCliente`),
  KEY `FK_tbl_DetalleDevolucionCliente_tbl_Kardex` (`id_kardex`),
  KEY `FK_tbl_DetalleDevolucionCliente_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_devolucionCliente` FOREIGN KEY (`id_devolucionCliente`) REFERENCES `tbl_devolucionCliente` (`id_devolucionCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Kardex` FOREIGN KEY (`id_kardex`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_DetalleDevolucionCliente_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleDevolucionCliente`
--

LOCK TABLES `tbl_DetalleDevolucionCliente` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleDevolucionCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleDevolucionCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleKit`
--

DROP TABLE IF EXISTS `tbl_DetalleKit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleKit` (
  `id_kit` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) NOT NULL,
  `cantidad_detalleKit` double NOT NULL,
  `numero_serie` longtext,
  PRIMARY KEY (`id_kit`,`id_producto`),
  KEY `FK_tbl_DetalleKit_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_DetalleKit_tbl_kit` FOREIGN KEY (`id_kit`) REFERENCES `tbl_kit` (`id_kit`),
  CONSTRAINT `FK_tbl_DetalleKit_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleKit`
--

LOCK TABLES `tbl_DetalleKit` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleKit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleKit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetallePagoCredito`
--

DROP TABLE IF EXISTS `tbl_DetallePagoCredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetallePagoCredito` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_pagocre` int NOT NULL,
  `id_tabla` int NOT NULL,
  `monto_pagocre` decimal(15,4) NOT NULL,
  `mora_pagocre` decimal(15,4) NOT NULL,
  `dias_pagocre` double NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetallePagoCredito_tbl_PagoCredito` (`id_pagocre`),
  KEY `FK_tbl_DetallePagoCredito_tbl_tablaProyectada` (`id_tabla`),
  CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_PagoCredito` FOREIGN KEY (`id_pagocre`) REFERENCES `tbl_PagoCredito` (`id_pagocre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_DetallePagoCredito_tbl_tablaProyectada` FOREIGN KEY (`id_tabla`) REFERENCES `tbl_tablaProyectada` (`id_tabla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetallePagoCredito`
--

LOCK TABLES `tbl_DetallePagoCredito` WRITE;
/*!40000 ALTER TABLE `tbl_DetallePagoCredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetallePagoCredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetallePagoCreditoContado`
--

DROP TABLE IF EXISTS `tbl_DetallePagoCreditoContado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetallePagoCreditoContado` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_pagocrecont` int NOT NULL,
  `id_cuentaCobro` int NOT NULL,
  `monto_pagocrecont` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  KEY `FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado` (`id_pagocrecont`),
  CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_cuentasPorCobrar` FOREIGN KEY (`id_cuentaCobro`) REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  CONSTRAINT `FK_tbl_DetallePagoCreditoContado_tbl_PagoCreditoContado` FOREIGN KEY (`id_pagocrecont`) REFERENCES `tbl_PagoCreditoContado` (`id_pagocrecont`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetallePagoCreditoContado`
--

LOCK TABLES `tbl_DetallePagoCreditoContado` WRITE;
/*!40000 ALTER TABLE `tbl_DetallePagoCreditoContado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetallePagoCreditoContado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleProforma`
--

DROP TABLE IF EXISTS `tbl_DetalleProforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleProforma` (
  `id_linea` int NOT NULL,
  `id_proforma` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) NOT NULL,
  `cantidad_producto` double NOT NULL,
  `procentajeIva` double NOT NULL,
  `porcentajeDescuento` double NOT NULL,
  `descripcion_medida` longtext,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetalleProforma_tbl_proforma` (`id_proforma`),
  CONSTRAINT `FK_tbl_DetalleProforma_tbl_proforma` FOREIGN KEY (`id_proforma`) REFERENCES `tbl_proforma` (`id_proforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleProforma`
--

LOCK TABLES `tbl_DetalleProforma` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleProforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleProforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleSalida`
--

DROP TABLE IF EXISTS `tbl_DetalleSalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleSalida` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_salida` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_salida` longtext NOT NULL,
  `cantidad_salida` double NOT NULL,
  `id_kardex` int NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetalleSalida_tbl_Kardex` (`id_kardex`),
  KEY `FK_tbl_DetalleSalida_tbl_Producto` (`id_producto`),
  KEY `FK_tbl_DetalleSalida_tbl_salida` (`id_salida`),
  CONSTRAINT `FK_tbl_DetalleSalida_tbl_Kardex` FOREIGN KEY (`id_kardex`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_DetalleSalida_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_DetalleSalida_tbl_salida` FOREIGN KEY (`id_salida`) REFERENCES `tbl_salida` (`id_salida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleSalida`
--

LOCK TABLES `tbl_DetalleSalida` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleSalida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleSalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_DetalleVenta`
--

DROP TABLE IF EXISTS `tbl_DetalleVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_DetalleVenta` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) NOT NULL,
  `cantidad_producto` double NOT NULL,
  `id_kardex` int NOT NULL,
  `porcentajeIva` double NOT NULL,
  `porcentajeDescuento` double NOT NULL,
  `numeroSerie` longtext NOT NULL,
  `fechaGarantia` datetime(3) NOT NULL,
  `descripcion_medida` longtext,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_DetalleVenta_tbl_Kardex` (`id_kardex`),
  KEY `FK_tbl_DetalleVenta_tbl_Producto` (`id_producto`),
  KEY `FK_tbl_DetalleVenta_tbl_venta` (`id_venta`),
  CONSTRAINT `FK_tbl_DetalleVenta_tbl_Kardex` FOREIGN KEY (`id_kardex`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_DetalleVenta_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_DetalleVenta_tbl_venta` FOREIGN KEY (`id_venta`) REFERENCES `tbl_venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_DetalleVenta`
--

LOCK TABLES `tbl_DetalleVenta` WRITE;
/*!40000 ALTER TABLE `tbl_DetalleVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_DetalleVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Documentos`
--

DROP TABLE IF EXISTS `tbl_Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Documentos` (
  `id_documento` int NOT NULL,
  `nombre_documento` longtext NOT NULL,
  `abreviatura_documento` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serie_documento` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_tipoDocumentoPago` int NOT NULL,
  `inicio_documento` int NOT NULL,
  `final_documento` int NOT NULL,
  `activo_documento` tinyint DEFAULT NULL,
  `utilizado_documento` int DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `FK_tbl_Documentos_tbl_TipoDocumentoPagos` (`id_tipoDocumentoPago`),
  CONSTRAINT `FK_tbl_Documentos_tbl_TipoDocumentoPagos` FOREIGN KEY (`id_tipoDocumentoPago`) REFERENCES `tbl_TipoDocumentoPagos` (`id_tipoDocumentoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Documentos`
--

LOCK TABLES `tbl_Documentos` WRITE;
/*!40000 ALTER TABLE `tbl_Documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_FacturasCompras`
--

DROP TABLE IF EXISTS `tbl_FacturasCompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_FacturasCompras` (
  `id_facturacompra` int NOT NULL AUTO_INCREMENT,
  `fecha_facturacompra` datetime(3) DEFAULT NULL,
  `id_compra` int DEFAULT NULL,
  `documento_facturacompra` longtext,
  `monto_facturacompra` decimal(15,4) DEFAULT NULL,
  `iva_facturacompra` decimal(15,4) DEFAULT NULL,
  `isr_facturacompra` decimal(15,4) DEFAULT NULL,
  `iso_facturacompra` decimal(15,4) DEFAULT NULL,
  `estado_facturacompra` int DEFAULT NULL,
  PRIMARY KEY (`id_facturacompra`),
  KEY `FK_tbl_FacturasCompras_tbl_compra` (`id_compra`),
  CONSTRAINT `FK_tbl_FacturasCompras_tbl_compra` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_FacturasCompras`
--

LOCK TABLES `tbl_FacturasCompras` WRITE;
/*!40000 ALTER TABLE `tbl_FacturasCompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_FacturasCompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_FacturasVentas`
--

DROP TABLE IF EXISTS `tbl_FacturasVentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_FacturasVentas` (
  `id_facturaventa` int NOT NULL AUTO_INCREMENT,
  `fecha_facturaventa` datetime(3) DEFAULT NULL,
  `id_venta` int DEFAULT NULL,
  `documento_facturaventa` longtext,
  `monto_facturaventa` decimal(15,4) DEFAULT NULL,
  `iva_facturaventa` decimal(15,4) DEFAULT NULL,
  `isr_facturaventa` decimal(15,4) DEFAULT NULL,
  `iso_facturaventa` decimal(15,4) DEFAULT NULL,
  `estado_facturaventa` int DEFAULT NULL,
  PRIMARY KEY (`id_facturaventa`),
  KEY `FK_tbl_FacturasVentas_tbl_venta` (`id_venta`),
  CONSTRAINT `FK_tbl_FacturasVentas_tbl_venta` FOREIGN KEY (`id_venta`) REFERENCES `tbl_venta` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_FacturasVentas`
--

LOCK TABLES `tbl_FacturasVentas` WRITE;
/*!40000 ALTER TABLE `tbl_FacturasVentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_FacturasVentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_FormaPago`
--

DROP TABLE IF EXISTS `tbl_FormaPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_FormaPago` (
  `id_formaPago` int NOT NULL AUTO_INCREMENT,
  `descripcion_formaPago` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_formaPago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_FormaPago`
--

LOCK TABLES `tbl_FormaPago` WRITE;
/*!40000 ALTER TABLE `tbl_FormaPago` DISABLE KEYS */;
INSERT INTO `tbl_FormaPago` VALUES (1,'CONTADO');
/*!40000 ALTER TABLE `tbl_FormaPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ImagenProducto`
--

DROP TABLE IF EXISTS `tbl_ImagenProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ImagenProducto` (
  `id_imageProducto` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `urlImagenProducto` longtext,
  PRIMARY KEY (`id_imageProducto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tbl_ImagenProducto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ImagenProducto`
--

LOCK TABLES `tbl_ImagenProducto` WRITE;
/*!40000 ALTER TABLE `tbl_ImagenProducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ImagenProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Inventario`
--

DROP TABLE IF EXISTS `tbl_Inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Inventario` (
  `id_inventario` int NOT NULL,
  `fecha_inventario` datetime(3) NOT NULL,
  `id_bodega` int NOT NULL,
  `estado_categoria` int NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `FK_tbl_Inventario_tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_Inventario_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Inventario`
--

LOCK TABLES `tbl_Inventario` WRITE;
/*!40000 ALTER TABLE `tbl_Inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Kardex`
--

DROP TABLE IF EXISTS `tbl_Kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Kardex` (
  `id_kardex` int NOT NULL AUTO_INCREMENT,
  `id_bodega` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `fecha_kardex` datetime(3) DEFAULT NULL,
  `documento_kardex` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `entrada_kardex` double DEFAULT NULL,
  `salida_kardex` double DEFAULT NULL,
  `saldo_kardex` double DEFAULT NULL,
  `ultimoCosto_kardex` decimal(15,4) DEFAULT NULL,
  `costoPromedio_kardex` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id_kardex`),
  KEY `FK_tbl_Kardex_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_Kardex_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_Kardex_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_Kardex_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Kardex`
--

LOCK TABLES `tbl_Kardex` WRITE;
/*!40000 ALTER TABLE `tbl_Kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_LogUusarios`
--

DROP TABLE IF EXISTS `tbl_LogUusarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_LogUusarios` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `usuario_empleado` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `log` tinyint DEFAULT NULL,
  `ipLocal` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fecha_log` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_LogUusarios`
--

LOCK TABLES `tbl_LogUusarios` WRITE;
/*!40000 ALTER TABLE `tbl_LogUusarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_LogUusarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_MovimientoCuentaClientes`
--

DROP TABLE IF EXISTS `tbl_MovimientoCuentaClientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_MovimientoCuentaClientes` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha_movimiento` datetime(3) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `descripcion_movimiento` longtext NOT NULL,
  `debito_movimiento` decimal(15,4) NOT NULL,
  `credito_movimiento` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `FK_tbl_MovimientoCuentaClientes_tbl_cliente` (`id_cliente`),
  KEY `FK_tbl_MovimientoCuentaClientes_tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `FK_tbl_MovimientoCuentaClientes_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_MovimientoCuentaClientes`
--

LOCK TABLES `tbl_MovimientoCuentaClientes` WRITE;
/*!40000 ALTER TABLE `tbl_MovimientoCuentaClientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_MovimientoCuentaClientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_MovimientoCuentaProveedores`
--

DROP TABLE IF EXISTS `tbl_MovimientoCuentaProveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_MovimientoCuentaProveedores` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha_movimiento` datetime(3) NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `descripcion_movimiento` longtext NOT NULL,
  `debito_movimiento` decimal(15,4) DEFAULT NULL,
  `credito_movimiento` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago` (`id_formaPago`),
  KEY `FK_tbl_MovimientoCuentaProveedores_tbl_proveedor` (`id_proveedor`),
  CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_MovimientoCuentaProveedores_tbl_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_MovimientoCuentaProveedores`
--

LOCK TABLES `tbl_MovimientoCuentaProveedores` WRITE;
/*!40000 ALTER TABLE `tbl_MovimientoCuentaProveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_MovimientoCuentaProveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PagoCredito`
--

DROP TABLE IF EXISTS `tbl_PagoCredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PagoCredito` (
  `id_pagocre` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `id_documento` int NOT NULL,
  `fecha_pagocre` datetime(3) NOT NULL,
  `id_cuentaCobro` int NOT NULL,
  `descripcion_pagocre` longtext NOT NULL,
  `total_pagoCre` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_pagocre`),
  KEY `FK_tbl_PagoCredito_tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  KEY `FK_tbl_PagoCredito_tbl_Documentos` (`id_documento`),
  KEY `FK_tbl_PagoCredito_tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_PagoCredito_tbl_cuentasPorCobrar` FOREIGN KEY (`id_cuentaCobro`) REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_PagoCredito_tbl_Documentos` FOREIGN KEY (`id_documento`) REFERENCES `tbl_Documentos` (`id_documento`),
  CONSTRAINT `FK_tbl_PagoCredito_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PagoCredito`
--

LOCK TABLES `tbl_PagoCredito` WRITE;
/*!40000 ALTER TABLE `tbl_PagoCredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PagoCredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PagoCreditoContado`
--

DROP TABLE IF EXISTS `tbl_PagoCreditoContado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PagoCreditoContado` (
  `id_pagocrecont` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `id_documento` int NOT NULL,
  `fecha_pagocrecont` datetime(3) NOT NULL,
  `id_cliente` int NOT NULL,
  `descripcion_pagocrecont` longtext,
  PRIMARY KEY (`id_pagocrecont`),
  KEY `FK_tbl_PagoCreditoContado_tbl_cliente` (`id_cliente`),
  KEY `FK_tbl_PagoCreditoContado_tbl_Documentos` (`id_documento`),
  KEY `FK_tbl_PagoCreditoContado_tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_Documentos` FOREIGN KEY (`id_documento`) REFERENCES `tbl_Documentos` (`id_documento`),
  CONSTRAINT `FK_tbl_PagoCreditoContado_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PagoCreditoContado`
--

LOCK TABLES `tbl_PagoCreditoContado` WRITE;
/*!40000 ALTER TABLE `tbl_PagoCreditoContado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PagoCreditoContado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PagoCreditoCuotaExtra`
--

DROP TABLE IF EXISTS `tbl_PagoCreditoCuotaExtra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PagoCreditoCuotaExtra` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_formaPago` int NOT NULL,
  `id_documento` int NOT NULL,
  `fecha_movimiento` datetime(3) NOT NULL,
  `id_tabla` int NOT NULL,
  `descripcion_movimiento` longtext NOT NULL,
  `monto_movimiento` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos` (`id_documento`),
  KEY `FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago` (`id_formaPago`),
  KEY `FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada` (`id_tabla`),
  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_Documentos` FOREIGN KEY (`id_documento`) REFERENCES `tbl_Documentos` (`id_documento`),
  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_PagoCreditoCuotaExtra_tbl_tablaProyectada` FOREIGN KEY (`id_tabla`) REFERENCES `tbl_tablaProyectada` (`id_tabla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PagoCreditoCuotaExtra`
--

LOCK TABLES `tbl_PagoCreditoCuotaExtra` WRITE;
/*!40000 ALTER TABLE `tbl_PagoCreditoCuotaExtra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PagoCreditoCuotaExtra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PagoProveedor`
--

DROP TABLE IF EXISTS `tbl_PagoProveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PagoProveedor` (
  `id_pago` int NOT NULL,
  `fecha_pago` datetime(3) NOT NULL,
  `id_formaPago` int NOT NULL,
  `id_documento` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `descripcion_pago` longtext NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK_tbl_PagoProveedor_tbl_Documentos` (`id_documento`),
  KEY `FK_tbl_PagoProveedor_tbl_FormaPago` (`id_formaPago`),
  KEY `FK_tbl_PagoProveedor_tbl_proveedor` (`id_proveedor`),
  CONSTRAINT `FK_tbl_PagoProveedor_tbl_Documentos` FOREIGN KEY (`id_documento`) REFERENCES `tbl_Documentos` (`id_documento`),
  CONSTRAINT `FK_tbl_PagoProveedor_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_PagoProveedor_tbl_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PagoProveedor`
--

LOCK TABLES `tbl_PagoProveedor` WRITE;
/*!40000 ALTER TABLE `tbl_PagoProveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PagoProveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PagoProveedorDetalle`
--

DROP TABLE IF EXISTS `tbl_PagoProveedorDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PagoProveedorDetalle` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_pago` int NOT NULL,
  `id_CuentaPorPagar` int NOT NULL,
  `monto_pagodetalle` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar` (`id_CuentaPorPagar`),
  KEY `FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor` (`id_pago`),
  CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_CuentaPorPagar` FOREIGN KEY (`id_CuentaPorPagar`) REFERENCES `tbl_CuentaPorPagar` (`id_CuentaPorPagar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_PagoProveedorDetalle_tbl_PagoProveedor` FOREIGN KEY (`id_pago`) REFERENCES `tbl_PagoProveedor` (`id_pago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PagoProveedorDetalle`
--

LOCK TABLES `tbl_PagoProveedorDetalle` WRITE;
/*!40000 ALTER TABLE `tbl_PagoProveedorDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PagoProveedorDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PermisosRol`
--

DROP TABLE IF EXISTS `tbl_PermisosRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PermisosRol` (
  `id_permisos` int NOT NULL,
  `id_rol` int NOT NULL,
  `formulario_permisos` longtext NOT NULL,
  `puedeVer` tinyint DEFAULT NULL,
  `puedeModificar` tinyint DEFAULT NULL,
  `puedeBorrar` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_permisos`),
  KEY `FK_tbl_PermisosRol_tbl_rol` (`id_rol`),
  CONSTRAINT `FK_tbl_PermisosRol_tbl_rol` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PermisosRol`
--

LOCK TABLES `tbl_PermisosRol` WRITE;
/*!40000 ALTER TABLE `tbl_PermisosRol` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PermisosRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_PrecioCostoPorProductoByFecha`
--

DROP TABLE IF EXISTS `tbl_PrecioCostoPorProductoByFecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_PrecioCostoPorProductoByFecha` (
  `id_PreCostoProducto` int NOT NULL AUTO_INCREMENT,
  `fecha_PreCostoProducto` datetime(3) DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `costo_producto` decimal(15,4) DEFAULT NULL,
  `referencia_compra` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_PreCostoProducto`),
  KEY `FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_PrecioCostoPorProductoByFecha_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_PrecioCostoPorProductoByFecha`
--

LOCK TABLES `tbl_PrecioCostoPorProductoByFecha` WRITE;
/*!40000 ALTER TABLE `tbl_PrecioCostoPorProductoByFecha` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_PrecioCostoPorProductoByFecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ProductUnidPrecioVenta`
--

DROP TABLE IF EXISTS `tbl_ProductUnidPrecioVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ProductUnidPrecioVenta` (
  `id_producto` int NOT NULL,
  `id_medida` int NOT NULL,
  `precio` decimal(15,4) DEFAULT NULL,
  `estado_prounidprecio` tinyint DEFAULT NULL,
  `precioBase` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_medida`),
  KEY `FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida` (`id_medida`),
  CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_ProductUnidPrecioVenta_tbl_UnidadMedida` FOREIGN KEY (`id_medida`) REFERENCES `tbl_UnidadMedida` (`id_medida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ProductUnidPrecioVenta`
--

LOCK TABLES `tbl_ProductUnidPrecioVenta` WRITE;
/*!40000 ALTER TABLE `tbl_ProductUnidPrecioVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ProductUnidPrecioVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Producto`
--

DROP TABLE IF EXISTS `tbl_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Producto` (
  `id_producto` int NOT NULL,
  `sku_producto` longtext,
  `descripcion_producto` longtext NOT NULL,
  `id_Sub_Categoria` int NOT NULL,
  `id_iva` int NOT NULL,
  `notas_producto` longtext,
  `id_marca` int NOT NULL,
  `modelo_producto` longtext,
  `id_tproducto` int NOT NULL,
  `costo_producto` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK_tbl_Producto_Sub_Categoria` (`id_Sub_Categoria`),
  KEY `FK_tbl_Producto_tbl_iva` (`id_iva`),
  KEY `FK_tbl_Producto_tbl_marca` (`id_marca`),
  KEY `FK_tbl_Producto_tbl_TipoProducto` (`id_tproducto`),
  CONSTRAINT `FK_tbl_Producto_Sub_Categoria` FOREIGN KEY (`id_Sub_Categoria`) REFERENCES `tbl_Sub_Categoria` (`id_subcategoria`),
  CONSTRAINT `FK_tbl_Producto_tbl_iva` FOREIGN KEY (`id_iva`) REFERENCES `tbl_iva` (`id_iva`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_Producto_tbl_marca` FOREIGN KEY (`id_marca`) REFERENCES `tbl_marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_Producto_tbl_TipoProducto` FOREIGN KEY (`id_tproducto`) REFERENCES `tbl_TipoProducto` (`id_tproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Producto`
--

LOCK TABLES `tbl_Producto` WRITE;
/*!40000 ALTER TABLE `tbl_Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_SerieProducto`
--

DROP TABLE IF EXISTS `tbl_SerieProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_SerieProducto` (
  `id_producto` int NOT NULL,
  `id_serie` int NOT NULL AUTO_INCREMENT,
  `numero_serie` longtext,
  `disponible_serie` tinyint DEFAULT NULL,
  `cantidad_serie` double DEFAULT NULL,
  `fechaVenceCompra_serie` datetime(3) DEFAULT NULL,
  `fechaVenceVenta_serie` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_serie`),
  UNIQUE KEY `id_serie` (`id_serie`),
  CONSTRAINT `FK_tbl_SerieProducto_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_SerieProducto`
--

LOCK TABLES `tbl_SerieProducto` WRITE;
/*!40000 ALTER TABLE `tbl_SerieProducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_SerieProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Sub_Categoria`
--

DROP TABLE IF EXISTS `tbl_Sub_Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Sub_Categoria` (
  `id_subcategoria` int NOT NULL,
  `descripcion_subcategoria` longtext,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_subcategoria`),
  KEY `FK_Sub_Categoria_tbl_categoria` (`id_categoria`),
  CONSTRAINT `FK_Sub_Categoria_tbl_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Sub_Categoria`
--

LOCK TABLES `tbl_Sub_Categoria` WRITE;
/*!40000 ALTER TABLE `tbl_Sub_Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_Sub_Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_TarjetaCredito`
--

DROP TABLE IF EXISTS `tbl_TarjetaCredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TarjetaCredito` (
  `id_tarjeta` int NOT NULL,
  `descripcion_tarjeta` varchar(50) NOT NULL,
  `tarifa_tarjeta` double NOT NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_TarjetaCredito`
--

LOCK TABLES `tbl_TarjetaCredito` WRITE;
/*!40000 ALTER TABLE `tbl_TarjetaCredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_TarjetaCredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_TipoDocumentoPagos`
--

DROP TABLE IF EXISTS `tbl_TipoDocumentoPagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TipoDocumentoPagos` (
  `id_tipoDocumentoPago` int NOT NULL,
  `descripcion_tipoDocumentoPago` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_tipoDocumentoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_TipoDocumentoPagos`
--

LOCK TABLES `tbl_TipoDocumentoPagos` WRITE;
/*!40000 ALTER TABLE `tbl_TipoDocumentoPagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_TipoDocumentoPagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_TipoProducto`
--

DROP TABLE IF EXISTS `tbl_TipoProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_TipoProducto` (
  `id_tproducto` int NOT NULL,
  `descripcion_tproducto` longtext,
  PRIMARY KEY (`id_tproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_TipoProducto`
--

LOCK TABLES `tbl_TipoProducto` WRITE;
/*!40000 ALTER TABLE `tbl_TipoProducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_TipoProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_UnidadMedida`
--

DROP TABLE IF EXISTS `tbl_UnidadMedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_UnidadMedida` (
  `id_medida` int NOT NULL,
  `descripcion_medida` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cantidad_medida` double DEFAULT NULL,
  PRIMARY KEY (`id_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_UnidadMedida`
--

LOCK TABLES `tbl_UnidadMedida` WRITE;
/*!40000 ALTER TABLE `tbl_UnidadMedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_UnidadMedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aldea_caserio`
--

DROP TABLE IF EXISTS `tbl_aldea_caserio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aldea_caserio` (
  `id_aldea_caserio` int NOT NULL,
  `id_municipio` int NOT NULL,
  `nombre_aldea_caserio` longtext NOT NULL,
  PRIMARY KEY (`id_aldea_caserio`),
  KEY `FK_tbl_aldea_caserio_tbl_municipio` (`id_municipio`),
  CONSTRAINT `FK_tbl_aldea_caserio_tbl_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipio` (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aldea_caserio`
--

LOCK TABLES `tbl_aldea_caserio` WRITE;
/*!40000 ALTER TABLE `tbl_aldea_caserio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aldea_caserio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_banco`
--

DROP TABLE IF EXISTS `tbl_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_banco` (
  `id_banco` int NOT NULL,
  `descripcion_banco` longtext NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_banco`
--

LOCK TABLES `tbl_banco` WRITE;
/*!40000 ALTER TABLE `tbl_banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_barra`
--

DROP TABLE IF EXISTS `tbl_barra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_barra` (
  `id_producto` int NOT NULL,
  `barra` bigint NOT NULL,
  PRIMARY KEY (`id_producto`,`barra`),
  CONSTRAINT `FK_tbl_barra_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_barra`
--

LOCK TABLES `tbl_barra` WRITE;
/*!40000 ALTER TABLE `tbl_barra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_barra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacora` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `tabla_modificada` varchar(255) NOT NULL,
  `tipo_accion` varchar(10) NOT NULL,
  `fecha_hora` datetime(3) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacora`
--

LOCK TABLES `tbl_bitacora` WRITE;
/*!40000 ALTER TABLE `tbl_bitacora` DISABLE KEYS */;
INSERT INTO `tbl_bitacora` VALUES (1,'tbl_venta','INSERT','2024-06-16 16:38:23.534','test_user','Insertó una nueva venta con id_venta=1'),(2,'tbl_venta','UPDATE','2024-06-16 16:41:58.397','test_user','Actualizó la venta con id_venta=1'),(3,'tbl_venta','INSERT','2024-06-16 16:43:00.155','gyedgrodas','Insertó una nueva venta con id_venta=2'),(4,'tbl_venta','DELETE','2024-06-16 16:44:18.942','test_user','Eliminó la venta con id_venta=1');
/*!40000 ALTER TABLE `tbl_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bodega`
--

DROP TABLE IF EXISTS `tbl_bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bodega` (
  `id_bodega` int NOT NULL,
  `nombre_bodega` longtext,
  `id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_bodega`),
  KEY `FK_tblbodega_tbl_sucursal` (`id_sucursal`),
  CONSTRAINT `FK_tblbodega_tbl_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `tbl_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bodega`
--

LOCK TABLES `tbl_bodega` WRITE;
/*!40000 ALTER TABLE `tbl_bodega` DISABLE KEYS */;
INSERT INTO `tbl_bodega` VALUES (1,'las colina',1);
/*!40000 ALTER TABLE `tbl_bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bodegaProducto`
--

DROP TABLE IF EXISTS `tbl_bodegaProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bodegaProducto` (
  `id_bodega` int NOT NULL,
  `id_producto` int NOT NULL,
  `stock_producto` double NOT NULL,
  `minimo_producto` double NOT NULL,
  `maximo_producto` double NOT NULL,
  `diasReposicion_producto` int NOT NULL,
  `cantidadMinima_producto` double NOT NULL,
  PRIMARY KEY (`id_bodega`,`id_producto`),
  KEY `FK_tbl_bodegaProducto_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_bodegaProducto_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_bodegaProducto_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bodegaProducto`
--

LOCK TABLES `tbl_bodegaProducto` WRITE;
/*!40000 ALTER TABLE `tbl_bodegaProducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bodegaProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cajas`
--

DROP TABLE IF EXISTS `tbl_cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cajas` (
  `id_caja` int NOT NULL,
  `descripcion_caja` longtext NOT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cajas`
--

LOCK TABLES `tbl_cajas` WRITE;
/*!40000 ALTER TABLE `tbl_cajas` DISABLE KEYS */;
INSERT INTO `tbl_cajas` VALUES (1,'principal');
/*!40000 ALTER TABLE `tbl_cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_calculoPrecioVenta`
--

DROP TABLE IF EXISTS `tbl_calculoPrecioVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_calculoPrecioVenta` (
  `id_calculo` int NOT NULL AUTO_INCREMENT,
  `fecha_calculo` datetime(3) NOT NULL,
  `descripcion_calculo` longtext,
  `precio_costo` decimal(15,4) DEFAULT NULL,
  `envio_costo` decimal(15,4) DEFAULT NULL,
  `ganacia_promedio` double DEFAULT NULL,
  `costo_total` decimal(15,4) DEFAULT NULL,
  `precio_venta` decimal(15,4) DEFAULT NULL,
  `precioSinIva_venta` decimal(15,4) DEFAULT NULL,
  `iva_calculado` decimal(15,4) DEFAULT NULL,
  `isr_calculado` decimal(15,4) DEFAULT NULL,
  `iso_calculado` decimal(15,4) DEFAULT NULL,
  `total_impuesto` decimal(15,4) DEFAULT NULL,
  `ganancia_real` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id_calculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_calculoPrecioVenta`
--

LOCK TABLES `tbl_calculoPrecioVenta` WRITE;
/*!40000 ALTER TABLE `tbl_calculoPrecioVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_calculoPrecioVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `id_categoria` int NOT NULL,
  `descripcion_categoria` longtext,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int NOT NULL,
  `nit_cliente` longtext NOT NULL,
  `nombre_cliente` longtext NOT NULL,
  `id_municipio` int DEFAULT NULL,
  `direccion_cliente` longtext NOT NULL,
  `telefono1_cliente` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telefono2_cliente` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email_cliente` longtext,
  `notas_cliente` longtext,
  PRIMARY KEY (`id_cliente`),
  KEY `FK_tbl_cliente_tbl_municipio` (`id_municipio`),
  CONSTRAINT `FK_tbl_cliente_tbl_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipio` (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'119263912','jose carias',1,'sanarate','12345678','12345678','prueba@gmail.com','cliente frecuente');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra`
--

DROP TABLE IF EXISTS `tbl_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_compra` (
  `id_compra` int NOT NULL,
  `fecha_compra` datetime(3) NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_bodega` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `documento_compra` longtext,
  `total_compra` decimal(15,4) NOT NULL,
  `notas_compra` longtext,
  `plazo_compra` int DEFAULT NULL,
  `boletaDeposito_compra` longtext,
  `deposito_compra` decimal(15,4) DEFAULT NULL,
  `diffDepoCompra_compra` decimal(15,4) DEFAULT NULL,
  `usuario_compra` longtext,
  PRIMARY KEY (`id_compra`),
  KEY `FK_tbl_compra_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_compra_tbl_FormaPago` (`id_formaPago`),
  KEY `FK_tbl_compra_tbl_proveedor` (`id_proveedor`),
  CONSTRAINT `FK_tbl_compra_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_compra_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_compra_tbl_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra`
--

LOCK TABLES `tbl_compra` WRITE;
/*!40000 ALTER TABLE `tbl_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conceptos`
--

DROP TABLE IF EXISTS `tbl_conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_conceptos` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `descripcion_concepto` longtext NOT NULL,
  PRIMARY KEY (`id_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conceptos`
--

LOCK TABLES `tbl_conceptos` WRITE;
/*!40000 ALTER TABLE `tbl_conceptos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cuentasPorCobrar`
--

DROP TABLE IF EXISTS `tbl_cuentasPorCobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cuentasPorCobrar` (
  `id_cuentaCobro` int NOT NULL,
  `fecha_cuentaCobro` datetime(3) NOT NULL,
  `fechaVence_CuentaPorCobrar` datetime(3) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_ventaReferencia` int DEFAULT NULL,
  `documento_venta` longtext,
  `monto_cuentaCobro` decimal(15,4) NOT NULL,
  `plazo_cuentaCobro` double NOT NULL,
  `id_interes` int NOT NULL,
  `cuotaProgramada` decimal(15,4) NOT NULL,
  `saldoProgramado` decimal(15,4) NOT NULL,
  `id_InteresMora` double DEFAULT NULL,
  `estado_cuentaCobro` int NOT NULL,
  PRIMARY KEY (`id_cuentaCobro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cuentasPorCobrar`
--

LOCK TABLES `tbl_cuentasPorCobrar` WRITE;
/*!40000 ALTER TABLE `tbl_cuentasPorCobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cuentasPorCobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamento`
--

DROP TABLE IF EXISTS `tbl_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_departamento` (
  `id_departamento` int NOT NULL,
  `nombre_departamento` longtext NOT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  KEY `FK_tbl_departamento_tbl_pais` (`id_pais`),
  CONSTRAINT `FK_tbl_departamento_tbl_pais` FOREIGN KEY (`id_pais`) REFERENCES `tbl_pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamento`
--

LOCK TABLES `tbl_departamento` WRITE;
/*!40000 ALTER TABLE `tbl_departamento` DISABLE KEYS */;
INSERT INTO `tbl_departamento` VALUES (1,'El Progreso',1);
/*!40000 ALTER TABLE `tbl_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallePedido`
--

DROP TABLE IF EXISTS `tbl_detallePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallePedido` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `precio_producto` decimal(15,4) NOT NULL,
  `cantidad_pedido` double NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_detallePedido_tbl_pedido` (`id_pedido`),
  KEY `FK_tbl_detallePedido_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_detallePedido_tbl_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_detallePedido_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallePedido`
--

LOCK TABLES `tbl_detallePedido` WRITE;
/*!40000 ALTER TABLE `tbl_detallePedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallePedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalleTraslado`
--

DROP TABLE IF EXISTS `tbl_detalleTraslado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalleTraslado` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_traslado` int NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` longtext NOT NULL,
  `cantidad_traslado` double NOT NULL,
  `id_kardexOrigen` int NOT NULL,
  `id_KardexDestino` int NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_detalleTraslado_tbl_Kardex` (`id_kardexOrigen`),
  KEY `FK_tbl_detalleTraslado_tbl_Kardex1` (`id_KardexDestino`),
  KEY `FK_tbl_detalleTraslado_tbl_Producto` (`id_producto`),
  KEY `FK_tbl_detalleTraslado_tbl_traslado` (`id_traslado`),
  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex` FOREIGN KEY (`id_kardexOrigen`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Kardex1` FOREIGN KEY (`id_KardexDestino`) REFERENCES `tbl_Kardex` (`id_kardex`),
  CONSTRAINT `FK_tbl_detalleTraslado_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_detalleTraslado_tbl_traslado` FOREIGN KEY (`id_traslado`) REFERENCES `tbl_traslado` (`id_traslado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalleTraslado`
--

LOCK TABLES `tbl_detalleTraslado` WRITE;
/*!40000 ALTER TABLE `tbl_detalleTraslado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalleTraslado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_inventario`
--

DROP TABLE IF EXISTS `tbl_detalle_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_inventario` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `id_inventario` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `descripcion_producto` longtext,
  `stock_producto` double DEFAULT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `FK_tbl_detalle_inventario_tbl_Inventario` (`id_inventario`),
  KEY `FK_tbl_detalle_inventario_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_detalle_inventario_tbl_Inventario` FOREIGN KEY (`id_inventario`) REFERENCES `tbl_Inventario` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_detalle_inventario_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_inventario`
--

LOCK TABLES `tbl_detalle_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_devolucionCliente`
--

DROP TABLE IF EXISTS `tbl_devolucionCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_devolucionCliente` (
  `id_devolucionCliente` int NOT NULL,
  `fecha_devolucionCliente` datetime(3) NOT NULL,
  `id_venta` int NOT NULL,
  `observaciones_devolucionCliente` longtext,
  PRIMARY KEY (`id_devolucionCliente`),
  KEY `FK_tbl_devolucionCliente_tbl_venta` (`id_venta`),
  CONSTRAINT `FK_tbl_devolucionCliente_tbl_venta` FOREIGN KEY (`id_venta`) REFERENCES `tbl_venta` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_devolucionCliente`
--

LOCK TABLES `tbl_devolucionCliente` WRITE;
/*!40000 ALTER TABLE `tbl_devolucionCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_devolucionCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_devolucionProveedor`
--

DROP TABLE IF EXISTS `tbl_devolucionProveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_devolucionProveedor` (
  `id_devolucionProveedor` int NOT NULL,
  `fecha_devolucionProveedor` datetime(3) NOT NULL,
  `id_compra` int NOT NULL,
  `observaciones_devolucionProveedor` longtext,
  PRIMARY KEY (`id_devolucionProveedor`),
  KEY `FK_tbl_devolucionProveedor_tbl_compra` (`id_compra`),
  CONSTRAINT `FK_tbl_devolucionProveedor_tbl_compra` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_devolucionProveedor`
--

LOCK TABLES `tbl_devolucionProveedor` WRITE;
/*!40000 ALTER TABLE `tbl_devolucionProveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_devolucionProveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `fechain_empleado` datetime(3) NOT NULL,
  `nombre_empleado` longtext NOT NULL,
  `apellido_empleado` longtext NOT NULL,
  `direccion_empleado` longtext,
  `telefeono1_empleado` longtext,
  `telefono2_empleado` longtext,
  `fechanac_empleado` date DEFAULT NULL,
  `id_templeado` int NOT NULL,
  `usuario_empleado` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `contrasena_empleado` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `id_caja` int NOT NULL,
  `id_municipio` int NOT NULL,
  `estado_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FK_tbl_empleado_tbl_cajas` (`id_caja`),
  KEY `FK_tbl_empleado_tbl_municipio` (`id_municipio`),
  KEY `FK_tbl_empleado_tbl_rol` (`id_rol`),
  KEY `FK_tbl_empleado_tbl_tipoEmpleado` (`id_templeado`),
  CONSTRAINT `FK_tbl_empleado_tbl_cajas` FOREIGN KEY (`id_caja`) REFERENCES `tbl_cajas` (`id_caja`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_empleado_tbl_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipio` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_empleado_tbl_rol` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_empleado_tbl_tipoEmpleado` FOREIGN KEY (`id_templeado`) REFERENCES `tbl_tipoEmpleado` (`id_templeado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (1,'2023-10-27 00:00:00.000','edgar','rodas','sansare','12345678','123452679','2003-12-06',1,'gyedgrodas','Umg123$',1,1,1,1);
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_gastos`
--

DROP TABLE IF EXISTS `tbl_gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_gastos` (
  `id_gasto` int NOT NULL,
  `fecha_gasto` datetime(3) NOT NULL,
  `id_concepto` int NOT NULL,
  `descripcion_gasto` longtext NOT NULL,
  `monto_gasto` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `FK_tbl_gastos_tbl_conceptos` (`id_concepto`),
  CONSTRAINT `FK_tbl_gastos_tbl_conceptos` FOREIGN KEY (`id_concepto`) REFERENCES `tbl_conceptos` (`id_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gastos`
--

LOCK TABLES `tbl_gastos` WRITE;
/*!40000 ALTER TABLE `tbl_gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_iva`
--

DROP TABLE IF EXISTS `tbl_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_iva` (
  `id_iva` int NOT NULL,
  `descripcion_iva` longtext NOT NULL,
  `tarifa_iva` double NOT NULL,
  PRIMARY KEY (`id_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_iva`
--

LOCK TABLES `tbl_iva` WRITE;
/*!40000 ALTER TABLE `tbl_iva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_kit`
--

DROP TABLE IF EXISTS `tbl_kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_kit` (
  `id_kit` int NOT NULL AUTO_INCREMENT,
  `fecha_kit` datetime(3) NOT NULL,
  `fechavence_kit` datetime(3) NOT NULL,
  `id_producto` int NOT NULL,
  `precio_kit` decimal(15,4) NOT NULL,
  `estado_kit` int DEFAULT NULL,
  PRIMARY KEY (`id_kit`),
  KEY `FK_tbl_kit_tbl_Producto` (`id_producto`),
  CONSTRAINT `FK_tbl_kit_tbl_Producto` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kit`
--

LOCK TABLES `tbl_kit` WRITE;
/*!40000 ALTER TABLE `tbl_kit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca`
--

DROP TABLE IF EXISTS `tbl_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_marca` (
  `id_marca` int NOT NULL,
  `nombre_marca` longtext,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca`
--

LOCK TABLES `tbl_marca` WRITE;
/*!40000 ALTER TABLE `tbl_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_municipio`
--

DROP TABLE IF EXISTS `tbl_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_municipio` (
  `id_municipio` int NOT NULL,
  `id_departamento` int NOT NULL,
  `nombre_municipio` longtext NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `FK_tbl_municipio_tbl_departamento` (`id_departamento`),
  CONSTRAINT `FK_tbl_municipio_tbl_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_municipio`
--

LOCK TABLES `tbl_municipio` WRITE;
/*!40000 ALTER TABLE `tbl_municipio` DISABLE KEYS */;
INSERT INTO `tbl_municipio` VALUES (1,1,'sansare');
/*!40000 ALTER TABLE `tbl_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notaCredito`
--

DROP TABLE IF EXISTS `tbl_notaCredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notaCredito` (
  `id_notaCredito` int NOT NULL,
  `fecha_notaCredito` datetime(3) NOT NULL,
  `id_cuentaCobro` int NOT NULL,
  `descripcion_notaCredito` longtext NOT NULL,
  `monto_notaCredito` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_notaCredito`),
  KEY `FK_tbl_notaCredito_tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  CONSTRAINT `FK_tbl_notaCredito_tbl_cuentasPorCobrar` FOREIGN KEY (`id_cuentaCobro`) REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notaCredito`
--

LOCK TABLES `tbl_notaCredito` WRITE;
/*!40000 ALTER TABLE `tbl_notaCredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_notaCredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notaDebito`
--

DROP TABLE IF EXISTS `tbl_notaDebito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notaDebito` (
  `id_notaDebito` int NOT NULL,
  `fecha_notaDebito` datetime(3) NOT NULL,
  `id_cuentaCobro` int NOT NULL,
  `descripcion_notaDebito` longtext NOT NULL,
  `monto_notaDebito` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id_notaDebito`),
  KEY `FK_tbl_notaDebito_tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  CONSTRAINT `FK_tbl_notaDebito_tbl_cuentasPorCobrar` FOREIGN KEY (`id_cuentaCobro`) REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notaDebito`
--

LOCK TABLES `tbl_notaDebito` WRITE;
/*!40000 ALTER TABLE `tbl_notaDebito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_notaDebito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pais`
--

DROP TABLE IF EXISTS `tbl_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pais` (
  `id_pais` int NOT NULL,
  `nombre_pais` longtext NOT NULL,
  `codigo_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pais`
--

LOCK TABLES `tbl_pais` WRITE;
/*!40000 ALTER TABLE `tbl_pais` DISABLE KEYS */;
INSERT INTO `tbl_pais` VALUES (1,'Guatemala',502);
/*!40000 ALTER TABLE `tbl_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int NOT NULL,
  `fecha_pedido` datetime(3) NOT NULL,
  `id_bodega` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_tbl_pedido_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_pedido_tbl_cliente` (`id_cliente`),
  KEY `FK_tbl_pedido_tbl_empleado` (`id_empleado`),
  CONSTRAINT `FK_tbl_pedido_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_pedido_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_pedido_tbl_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `tbl_empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proforma`
--

DROP TABLE IF EXISTS `tbl_proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proforma` (
  `id_proforma` int NOT NULL,
  `fecha_proforma` datetime(3) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_bodega` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `total_proforma` decimal(15,4) NOT NULL,
  `id_documento` int NOT NULL,
  `observaciones_proforma` longtext,
  `documento` longtext,
  `usuario_proforma` longtext,
  `estado_proforma` int DEFAULT NULL,
  PRIMARY KEY (`id_proforma`),
  KEY `FK_tbl_proforma_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_proforma_tbl_cliente` (`id_cliente`),
  KEY `FK_tbl_proforma_tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_proforma_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_proforma_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `FK_tbl_proforma_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proforma`
--

LOCK TABLES `tbl_proforma` WRITE;
/*!40000 ALTER TABLE `tbl_proforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_proforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_provbancos`
--

DROP TABLE IF EXISTS `tbl_provbancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_provbancos` (
  `id_proveedor` int NOT NULL,
  `id_banco` int NOT NULL,
  `numero_cuenta` longtext NOT NULL,
  `nombre_cuenta` longtext NOT NULL,
  `descripcion_cuenta` longtext,
  PRIMARY KEY (`id_proveedor`,`id_banco`),
  KEY `FK_tbl_provbancos_tbl_banco` (`id_banco`),
  CONSTRAINT `FK_tbl_provbancos_tbl_banco` FOREIGN KEY (`id_banco`) REFERENCES `tbl_banco` (`id_banco`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_provbancos_tbl_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_provbancos`
--

LOCK TABLES `tbl_provbancos` WRITE;
/*!40000 ALTER TABLE `tbl_provbancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_provbancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedor`
--

DROP TABLE IF EXISTS `tbl_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proveedor` (
  `id_proveedor` int NOT NULL,
  `nombreJuridico_proveedor` longtext NOT NULL,
  `nombreComercial_proveedor` longtext,
  `direccion_proveedor` longtext NOT NULL,
  `telefono1_proveedor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telefono2_proveedor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `correo_proveedor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nit_proveedor` longtext NOT NULL,
  `id_iva` int DEFAULT NULL,
  `id_municipio` int NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `FK_tbl_proveedor_tbl_iva` (`id_iva`),
  KEY `FK_tbl_proveedor_tbl_municipio` (`id_municipio`),
  CONSTRAINT `FK_tbl_proveedor_tbl_iva` FOREIGN KEY (`id_iva`) REFERENCES `tbl_iva` (`id_iva`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_proveedor_tbl_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipio` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reconteoInventario`
--

DROP TABLE IF EXISTS `tbl_reconteoInventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reconteoInventario` (
  `id_reconteo` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_detalle_inventario` int NOT NULL,
  `conteo_detalle` int NOT NULL,
  `estadoConteoProducto` longtext,
  PRIMARY KEY (`id_reconteo`),
  KEY `id_detalle_inventario` (`id_detalle_inventario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tbl_reconteoInventario_ibfk_1` FOREIGN KEY (`id_detalle_inventario`) REFERENCES `tbl_detalle_inventario` (`id_linea`),
  CONSTRAINT `tbl_reconteoInventario_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reconteoInventario`
--

LOCK TABLES `tbl_reconteoInventario` WRITE;
/*!40000 ALTER TABLE `tbl_reconteoInventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reconteoInventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rol` (
  `id_rol` int NOT NULL,
  `descripcion_rol` longtext NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES (1,'venta');
/*!40000 ALTER TABLE `tbl_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salida`
--

DROP TABLE IF EXISTS `tbl_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_salida` (
  `id_salida` int NOT NULL,
  `fecha_salida` datetime(3) NOT NULL,
  `id_concepto` int NOT NULL,
  `id_bodega` int NOT NULL,
  PRIMARY KEY (`id_salida`),
  KEY `FK_tbl_salida_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_salida_tbl_conceptos` (`id_concepto`),
  CONSTRAINT `FK_tbl_salida_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_salida_tbl_conceptos` FOREIGN KEY (`id_concepto`) REFERENCES `tbl_conceptos` (`id_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salida`
--

LOCK TABLES `tbl_salida` WRITE;
/*!40000 ALTER TABLE `tbl_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sucursal`
--

DROP TABLE IF EXISTS `tbl_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sucursal` (
  `id_sucursal` int NOT NULL,
  `nombre` longtext NOT NULL,
  `id_pais` int NOT NULL,
  `id_departamento` int NOT NULL,
  `id_municipio` int NOT NULL,
  `telefono` longtext NOT NULL,
  `email` longtext NOT NULL,
  `estado_sucursal` int NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `tbl_sucursal_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamento` (`id_departamento`),
  CONSTRAINT `tbl_sucursal_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipio` (`id_municipio`),
  CONSTRAINT `tbl_sucursal_ibfk_3` FOREIGN KEY (`id_pais`) REFERENCES `tbl_pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sucursal`
--

LOCK TABLES `tbl_sucursal` WRITE;
/*!40000 ALTER TABLE `tbl_sucursal` DISABLE KEYS */;
INSERT INTO `tbl_sucursal` VALUES (1,'Ferrocon',1,1,1,'55794801','ferrocon@gmail.com',1);
/*!40000 ALTER TABLE `tbl_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tablaProyectada`
--

DROP TABLE IF EXISTS `tbl_tablaProyectada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tablaProyectada` (
  `id_tabla` int NOT NULL AUTO_INCREMENT,
  `id_cuentaCobro` int NOT NULL,
  `nroCuota_tabla` int NOT NULL,
  `fechaVence_tabla` datetime(3) NOT NULL,
  `diasMora_tabla` double NOT NULL,
  `cuotaProyectada_tabla` decimal(15,4) NOT NULL,
  `cuotaInteresProyec_tabla` decimal(15,4) NOT NULL,
  `cuotaCapital_tabla` decimal(15,4) NOT NULL,
  `cuotaExtra_tabla` decimal(15,4) DEFAULT NULL,
  `cuotaMora_tabla` decimal(15,4) NOT NULL,
  `saldo_tabla` decimal(15,4) NOT NULL,
  `estado_tabla` int NOT NULL,
  PRIMARY KEY (`id_tabla`),
  KEY `FK_tbl_tablaProyectada_tbl_cuentasPorCobrar` (`id_cuentaCobro`),
  CONSTRAINT `FK_tbl_tablaProyectada_tbl_cuentasPorCobrar` FOREIGN KEY (`id_cuentaCobro`) REFERENCES `tbl_cuentasPorCobrar` (`id_cuentaCobro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tablaProyectada`
--

LOCK TABLES `tbl_tablaProyectada` WRITE;
/*!40000 ALTER TABLE `tbl_tablaProyectada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tablaProyectada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipoEmpleado`
--

DROP TABLE IF EXISTS `tbl_tipoEmpleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipoEmpleado` (
  `id_templeado` int NOT NULL,
  `descripcion_templeado` longtext,
  PRIMARY KEY (`id_templeado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipoEmpleado`
--

LOCK TABLES `tbl_tipoEmpleado` WRITE;
/*!40000 ALTER TABLE `tbl_tipoEmpleado` DISABLE KEYS */;
INSERT INTO `tbl_tipoEmpleado` VALUES (1,'ACTIVO');
/*!40000 ALTER TABLE `tbl_tipoEmpleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_traslado`
--

DROP TABLE IF EXISTS `tbl_traslado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_traslado` (
  `id_traslado` int NOT NULL,
  `fecha_traslado` datetime(3) NOT NULL,
  `id_bodegaOrigen` int NOT NULL,
  `id_bodegaDestino` int NOT NULL,
  `descripcion_traslado` longtext NOT NULL,
  PRIMARY KEY (`id_traslado`),
  KEY `FK_tbl_traslado_tbl_bodega` (`id_bodegaOrigen`),
  KEY `FK_tbl_traslado_tbl_bodega1` (`id_bodegaDestino`),
  CONSTRAINT `FK_tbl_traslado_tbl_bodega` FOREIGN KEY (`id_bodegaOrigen`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_traslado_tbl_bodega1` FOREIGN KEY (`id_bodegaDestino`) REFERENCES `tbl_bodega` (`id_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_traslado`
--

LOCK TABLES `tbl_traslado` WRITE;
/*!40000 ALTER TABLE `tbl_traslado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_traslado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_venta`
--

DROP TABLE IF EXISTS `tbl_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_venta` (
  `id_venta` int NOT NULL,
  `fecha_venta` datetime(3) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_bodega` int NOT NULL,
  `id_formaPago` int NOT NULL,
  `total_venta` decimal(15,4) NOT NULL,
  `id_documento` int DEFAULT NULL,
  `documento` longtext,
  `observaciones_venta` longtext,
  `plazo_venta` int DEFAULT NULL,
  `boletaDeposito_venta` int DEFAULT NULL,
  `deposito_venta` decimal(15,4) DEFAULT NULL,
  `diffDepoCompra_venta` decimal(15,4) DEFAULT NULL,
  `usuario_venta` longtext,
  `cobrado_venta` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `FK_tbl_venta_tbl_bodega` (`id_bodega`),
  KEY `FK_tbl_venta_tbl_cliente` (`id_cliente`),
  KEY `FK_tbl_venta_tbl_Documentos` (`id_documento`),
  KEY `FK_tbl_venta_tbl_FormaPago` (`id_formaPago`),
  CONSTRAINT `FK_tbl_venta_tbl_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `tbl_bodega` (`id_bodega`),
  CONSTRAINT `FK_tbl_venta_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `FK_tbl_venta_tbl_Documentos` FOREIGN KEY (`id_documento`) REFERENCES `tbl_Documentos` (`id_documento`),
  CONSTRAINT `FK_tbl_venta_tbl_FormaPago` FOREIGN KEY (`id_formaPago`) REFERENCES `tbl_FormaPago` (`id_formaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venta`
--

LOCK TABLES `tbl_venta` WRITE;
/*!40000 ALTER TABLE `tbl_venta` DISABLE KEYS */;
INSERT INTO `tbl_venta` VALUES (2,'2024-06-16 16:43:00.155',1,1,1,500.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gyedgrodas',NULL);
/*!40000 ALTER TABLE `tbl_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pedro2024`@`%`*/ /*!50003 TRIGGER `trg_tbl_venta_insert` AFTER INSERT ON `tbl_venta` FOR EACH ROW BEGIN
    CALL sp_registrar_bitacora(
        'tbl_venta', 
        'INSERT', 
        NEW.usuario_venta, 
        CONCAT('Insertó una nueva venta con id_venta=', NEW.id_venta)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pedro2024`@`%`*/ /*!50003 TRIGGER `trg_tbl_venta_update` AFTER UPDATE ON `tbl_venta` FOR EACH ROW BEGIN
    CALL sp_registrar_bitacora(
        'tbl_venta', 
        'UPDATE', 
        NEW.usuario_venta, 
        CONCAT('Actualizó la venta con id_venta=', NEW.id_venta)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pedro2024`@`%`*/ /*!50003 TRIGGER `trg_tbl_venta_delete` AFTER DELETE ON `tbl_venta` FOR EACH ROW BEGIN
    CALL sp_registrar_bitacora(
        'tbl_venta', 
        'DELETE', 
        OLD.usuario_venta, 
        CONCAT('Eliminó la venta con id_venta=', OLD.id_venta)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'aplicationcomercial'
--

--
-- Dumping routines for database 'aplicationcomercial'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `DeleteBarra`(
	p_barra bigint
)
BEGIN
DELETE from tbl_barra WHERE barra = p_barra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteBarra`(
	p_barra bigint
)
BEGIN
SELECT 1 FROM tbl_barra WHERE barra = p_barra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteCompra`(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_compra 
WHERE documento_compra = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteFacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteFacturasCompras`(
	p_documento longtext
)
BEGIN
SELECT 1 FROM tbl_FacturasCompras WHERE documento_facturacompra = p_documento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteKit`(
	p_criterio varchar(50)
)
BEGIN
SELECT 1 FROM tbl_kit
WHERE estado_kit = 1 and id_producto = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteListaProductoPrecioVentaJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteListaProductoPrecioVentaJoin`(
	p_criterio nvarchar(50)
)
BEGIN
SELECT COUNT(id_producto) AS IDProducto FROM tbl_ProductUnidPrecioVenta
WHERE	id_producto = p_criterio
HAVING	COUNT(id_producto)> 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExistePoveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExistePoveedor`(
	p_criterio VARCHAR(50)
)
BEGIN
SELECT 1 FROM tbl_proveedor WHERE nit_proveedor = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteProforma`(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_proforma
WHERE id_proforma = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteTarjeta`(
	p_descripcion VARCHAR(50)
)
BEGIN
SELECT 1 FROM tbl_TarjetaCredito WHERE descripcion_tarjeta = p_descripcion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteTipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteTipoEmpleado`(
	p_Descrip LONGTEXT
)
BEGIN
SELECT 1 FROM tbl_tipoEmpleado WHERE descripcion_templeado = p_Descrip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteUsuario`(
	p_IDUsuario nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_empleado
WHERE usuario_empleado = p_IDUsuario
AND estado_empleado =1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExisteVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ExisteVenta`(
	p_criterio nvarchar(50)
)
BEGIN
SELECT 1 FROM tbl_venta 
WHERE documento = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObternerEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ObternerEmpleado`()
BEGIN
SELECT *
FROM tbl_empleado
WHERE estado_empleado = 'activo'
and usuario_empleado = 0
ORDER BY usuario_empleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_Bitaora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_Bitaora`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_DetalleSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_DetalleSalida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_marca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_marca`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_PermisosRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_PermisosRol`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_PrecioCostoPorProductoByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_PrecioCostoPorProductoByFecha`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_producto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_productoPrecioCosto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_productoPrecioCosto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_ProductUnidPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_ProductUnidPrecioVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_ProductUnidPrecVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_ProductUnidPrecVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_Rol`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_Salida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_Salida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_SerieProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_SerieProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_SerieProductoDescuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_SerieProductoDescuento`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualizar_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualizar_Traslado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_AumentarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_AumentarStock`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Banco`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Barra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Barra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Bodega`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_BodegaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_BodegaProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Caja`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_CajaDiaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_CajaDiaria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_CalculoPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_CalculoPrecioVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Categoria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Cliente`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Compra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Conceptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Conceptos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_ControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_ControlArqueo`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_ControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_ControlArqueoCierre`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_ControlCajasApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_ControlCajasApertura`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_CuentaPorCobrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_CuentaPorCobrar`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_CuentaPorPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_CuentaPorPagar`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Departamento`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleCompra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleDevolucionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleDevolucionCliente`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleInventario`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleKit`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetallePagoCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetallePagoCredito`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetallePagoCreditoContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetallePagoCreditoContado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_detallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_detallePedido`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleTraslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleTraslado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DetalleVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Documentos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_DocumentosUltimoUtilizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_DocumentosUltimoUtilizado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Empleado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_FacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_FacturasCompras`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_FacturasVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_FacturasVentas`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_FormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_FormaPago`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Inventario`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Iva`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Kardex`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Kit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Kit`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_LogUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_LogUsuarios`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_LogUsuariosCloseSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_LogUsuariosCloseSession`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_MovimientoCuentaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_MovimientoCuentaCliente`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_MovimientoCuentaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_MovimientoCuentaProveedor`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_municipio`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Proforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Proforma`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_ProformaByVigentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_ProformaByVigentes`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_ProvBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_ProvBancos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Proveedor`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_RestaStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_RestaStock`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_SubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_SubCategoria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_TarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_TarjetaCredito`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_TipoDocumentoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_TipoDocumentoPago`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_TipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_TipoEmpleado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_TipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_TipoProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_UnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_UnidadMedida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Usuario`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_Venta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Actualiza_VentaByPendienteCobro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Actualiza_VentaByPendienteCobro`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_administrarImagenProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_administrarImagenProducto`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_administrarPais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_administrarPais`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Aumentar_DocumentosInicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Aumentar_DocumentosInicio`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Desactivar_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Desactivar_Documentos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Banco`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_banco
		WHERE (descripcion_banco) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Barra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Barra`(

p_criterio int)
Begin 
		SELECT * FROM tbl_barra
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BitacoraByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BitacoraByDate`(
p_desde DATE,
p_hasta DATE)
BEGIN
	SELECT b.id_bitacora, b.fecha_bitacora, b.usuario,
				 b.accion_bitacora, b.hora_bitacora
	FROM tbl_bitacora b
	WHERE ((p_desde IS NULL) OR (b.fecha_bitacora >= p_desde))
	AND   ((p_hasta IS NULL) OR (b.fecha_bitacora <= p_hasta));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Bitaora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Bitaora`(
p_criterio VARCHAR(50)
)
Begin
		SELECT *
		FROM tbl_bitacora	
		WHERE (usuario) LIKE Concat('%',p_criterio,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Bodega`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_bodega
		WHERE (nombre_bodega) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoByBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoByBarra`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoByDescripProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoByDescripProduct`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoBySKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoBySKU`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdBodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdBodega`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_bodega) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdBodegas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdBodegas`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdProducto`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_bodegaProducto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdProductoMostrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostrador`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdProductoMostradorByBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostradorByBarra`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BodegaProductoIdProductoMostradorBySKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BodegaProductoIdProductoMostradorBySKU`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_BuscaKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_BuscaKardex`(

p_criterio VARCHAR(50))
Begin 
			SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
			k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
			FROM tbl_Kardex k
			INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
			INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
			WHERE (p.descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Caja`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_cajas
		WHERE (descripcion_caja) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CajaDiaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CajaDiaria`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_CajaDiaria
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CalculoPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CalculoPrecioVenta`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_calculoPrecioVenta
		WHERE (descripcion_calculo) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Categoria`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_categoria
		WHERE (descripcion_categoria) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ClienteNit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ClienteNit`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_cliente
		WHERE (nit_cliente) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ClienteNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ClienteNombre`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_cliente
		WHERE (nombre_cliente) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Compra`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_compra
		WHERE (documento_compra) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CompraCompletaByProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CompraCompletaByProveedor`(

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

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ComprasContadoByIDProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ComprasContadoByIDProveedor`(

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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ComprasCreditoByIDProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ComprasCreditoByIDProveedor`(

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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Conceptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Conceptos`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_conceptos
		WHERE (descripcion_concepto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ControlArqueo`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ControlArqueoCierre`(

p_criterio varchar(50),
p_fecha    DATE)
Begin 
		SELECT * FROM tbl_ControlArqueoCierre
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%')
		AND Estado = 'Grabada'
		AND fecha_control = p_fecha;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ControlCajaApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ControlCajaApertura`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_ControlCajasApertura
		WHERE (id_caja) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CuentaPorCobrarDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CuentaPorCobrarDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_cuentasPorCobrar
		WHERE (documento_venta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CuentaPorCobrarIDCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CuentaPorCobrarIDCliente`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_cuentasPorCobrar
		WHERE (id_cliente) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CuentaPorPagarDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CuentaPorPagarDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_CuentaPorPagar
		WHERE (documento_CuentaPorPagar) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_CuentaPorPagarIDProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_CuentaPorPagarIDProveedor`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_CuentaPorPagar
		WHERE (id_proveedor) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Departamento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_departamento
		WHERE (nombre_departamento) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleCompra`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleCompra
		WHERE (id_compra) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleDevolucionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleDevolucionCliente`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleDevolucionCliente
		WHERE (id_devolucionCliente) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleInventario`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_detalle_inventario
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleKit`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleKit
		WHERE (id_kit) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleKitByIDProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleKitByIDProducto`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleKit
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetallePagoCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetallePagoCredito`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetallePagoCredito
		WHERE (id_pagocre) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetallePagoCreditoContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetallePagoCreditoContado`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetallePagoCreditoContado
		WHERE (id_pagocrecont) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_detallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_detallePedido`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_detallePedido
		WHERE (id_pedido) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleSalida`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleSalida
		WHERE (id_salida) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleTraslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleTraslado`(

p_criterio int)
Begin 
		SELECT * FROM tbl_detalleTraslado
		WHERE (id_traslado) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DetalleVenta`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_DetalleVenta
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Documentos`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Documentos
		WHERE (nombre_documento) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DocumentosByIDDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DocumentosByIDDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_DocumentosByIDTDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_DocumentosByIDTDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Documentos
		WHERE (id_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%')
		AND activo_documento = 1;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_EmpleadoApellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_EmpleadoApellido`(
p_Criterio	varchar(50))
begin
select *
from tbl_empleado
where (apellido_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 'activo'
order by apellido_empleado asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_EmpleadoNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_EmpleadoNombre`(
p_Criterio	varchar(50))
begin
select *
from tbl_empleado
where (nombre_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 'activo'
order by nombre_empleado asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_EmpleadoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_EmpleadoUsuario`(
p_Criterio	varchar(50))
begin

SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
where (usuario_empleado) LIKE Concat('%',p_Criterio,'%') and estado_empleado = 1
order by usuario_empleado asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_FacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_FacturasCompras`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_FacturasCompras
		WHERE (id_compra) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_FacturasComprasByDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_FacturasComprasByDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_FacturasCompras
		WHERE (documento_facturacompra) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_FacturasVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_FacturasVentas`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_FacturasVentas
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_FacturasVentasByDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_FacturasVentasByDocumento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_FacturasVentas
		WHERE (documento_facturaventa) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_FormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_FormaPago`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_FormaPago
		WHERE (descripcion_formaPago) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Inventario`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Inventario
		WHERE (id_inventario) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Iva`(

p_criterio int)
Begin 
		SELECT * FROM tbl_iva
		WHERE (id_iva) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Kardex`(

p_criterio int)
Begin 
		SELECT * FROM tbl_Kardex	
			WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Kit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Kit`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_kit
		WHERE (id_kit) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_LogUsuarioByUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_LogUsuarioByUsuario`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_LogUusarios
		WHERE (usuario_empleado) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_marca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_marca`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_marca
		WHERE (nombre_marca) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_MovimientoCuentaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_MovimientoCuentaCliente`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_MovimientoCuentaClientes
		WHERE (id_cliente) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_MovimientoCuentaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_MovimientoCuentaProveedor`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_MovimientoCuentaProveedores
		WHERE (id_proveedor) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_municipio`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_municipio
		WHERE (nombre_municipio) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_municipioByIDDepartamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_municipioByIDDepartamento`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_municipio
		WHERE id_departamento = p_criterio  
		ORDER BY nombre_municipio;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_PermisosRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_PermisosRol`(

p_criterio int)
Begin 
		SELECT * FROM tbl_PermisosRol
		WHERE (id_permisos) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_PrecioCostoPorProductoByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_PrecioCostoPorProductoByFecha`(

p_criterio int)
Begin 
		SELECT * FROM tbl_PrecioCostoPorProductoByFecha
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productoBarraByBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productoBarraByBarra`(

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
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productoBarraByDescripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productoBarraByDescripcion`(

p_criterio varchar(50))
Begin 
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria,
		id_iva, notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		FROM tbl_Producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productoByDescripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productoByDescripcion`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productoByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productoByID`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_producto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productoBySku` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productoBySku`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_producto
		WHERE (sku_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productosByDescripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productosByDescripcion`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_producto
		WHERE (descripcion_producto) LIKE Concat('%',p_criterio,'%') and id_tproducto <> 4;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_productosBySKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_productosBySKU`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_producto
		WHERE (sku_producto) LIKE Concat('%',p_criterio,'%') and id_tproducto <> 4;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ProductUnidadPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ProductUnidadPrecioVenta`(

p_criterio int)
Begin 
		SELECT * FROM tbl_ProductUnidPrecioVenta
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Proforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Proforma`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_proforma
		WHERE (id_proforma) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ProvBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ProvBancos`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_provbancos
		WHERE (numero_cuenta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ProveedorByNit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ProveedorByNit`(

p_criterio int)
Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nit_proveedor) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ProveedorByNomComercial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ProveedorByNomComercial`(

p_criterio VARCHAR(50))
Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nombreComercial_proveedor) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_ProveedorByNomJuridico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_ProveedorByNomJuridico`(

p_criterio int)
Begin 
		SELECT * FROM tbl_proveedor
		WHERE (nombreJuridico_proveedor) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Rol`(

p_criterio int)
Begin 
		SELECT * FROM tbl_rol
		WHERE (descripcion_rol) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_salida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_salida`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_salida
		WHERE (id_salida) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_SerieProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_SerieProducto`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_SerieProducto
		WHERE (id_producto) LIKE Concat('%',p_criterio,'%')
		AND disponible_serie > 0
		AND cantidad_serie > 0;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_SubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_SubCategoria`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Sub_Categoria
		WHERE (descripcion_subcategoria) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_SubCategoriaByIDCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_SubCategoriaByIDCategoria`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_Sub_Categoria
		WHERE (id_categoria) LIKE Concat('%',p_criterio,'%')
		ORDER BY descripcion_subcategoria;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_TarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_TarjetaCredito`(

p_criterio int)
Begin 
		SELECT * FROM tbl_TarjetaCredito
		WHERE (descripcion_tarjeta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_TipoDocumentoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_TipoDocumentoPago`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_TipoDocumentoPagos
		WHERE (descripcion_tipoDocumentoPago) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_TipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_TipoEmpleado`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_tipoEmpleado
		WHERE (descripcion_templeado) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_TipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_TipoProducto`(

p_criterio int)
Begin 
		SELECT * FROM tbl_tipoProducto
		WHERE (id_tproducto) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_Traslado`(

p_criterio int)
Begin 
		SELECT * FROM tbl_traslado
		WHERE (id_traslado) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_UnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_UnidadMedida`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_UnidadMedida
		WHERE (descripcion_medida) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Filtrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Filtrar_venta`(

p_criterio varchar(50))
Begin 
		SELECT * FROM tbl_venta
		WHERE (id_venta) LIKE Concat('%',p_criterio,'%');
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Banco`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Barra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Barra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Bitaora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Bitaora`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Bodega`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_BodegaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_BodegaProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Caja`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CajaDiaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CajaDiaria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CajaDiariaCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CajaDiariaCierre`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CajaDiariaIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CajaDiariaIngreso`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CalculoPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CalculoPrecioVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Categoria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Cliente`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Compra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Conceptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Conceptos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_ControlCajaApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_ControlCajaApertura`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CuentaPorCobrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CuentaPorCobrar`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_CuentaPorPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_CuentaPorPagar`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Departamento`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetalleCompra`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetalleDevolucionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetalleDevolucionCliente`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetalleInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetalleInventario`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetallePagoCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetallePagoCredito`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetallePagoCreditoContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetallePagoCreditoContado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetallePedido`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetalleSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetalleSalida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_DetalleTraslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_DetalleTraslado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Empleado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Inventario`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Kardex`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_marca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_marca`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_municipio`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_PermisosRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_PermisosRol`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_PrecioCostoPorProductoByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_PrecioCostoPorProductoByFecha`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_producto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_ProductUnidPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_ProductUnidPrecioVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_ProvBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_ProvBancos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Proveedor`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Rol`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_SerieProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_SerieProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_TipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_TipoEmpleado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_TipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_TipoProducto`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_Traslado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insertar_UnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Insertar_UnidadMedida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_ControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_ControlArqueo`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_ControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_ControlArqueoCierre`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_DetalleKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_DetalleKit`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_DetalleVenta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_Documentos`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_FacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_FacturasCompras`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_FacturasVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_FacturasVentas`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_FormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_FormaPago`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_Iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_Iva`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_Kit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_Kit`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_LogUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_LogUsuarios`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_MovimientoCuentaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_MovimientoCuentaCliente`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_MovimientoCuentaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_MovimientoCuentaProveedor`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_Proforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_Proforma`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_SubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_SubCategoria`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_TarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_TarjetaCredito`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_TipoDocumentoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_TipoDocumentoPago`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inserta_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Inserta_Venta`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Instalar_Salida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Instalar_Salida`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ListarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ListarEmpleado`(
p_criterio	varchar(50))
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from tbl_empleado
where id_empleado = p_criterio and estado_empleado  = 'activo';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ListarEmpleadoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ListarEmpleadoCodigo`()
BEGIN
	SELECT id_empleado 
  from tbl_empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ListarEmpleadoPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ListarEmpleadoPorUsuario`(
p_criterio	varchar(50))
begin 
select id_empleado,fechain_empleado,nombre_empleado,apellido_empleado,direccion_empleado,
telefeono1_empleado,telefono2_empleado,fechanac_empleado,id_templeado,usuario_empleado,
contrasena_empleado,id_rol,id_caja,id_municipio,estado_empleado
from tbl_empleado
where usuario_empleado = p_criterio
and estado_empleado  = 1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ListarUsuariosByIDEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ListarUsuariosByIDEmpleado`(
p_criterio	varchar(50))
begin 
select id_empleado,usuario_empleado,contrasena_empleado,estado_empleado
from tbl_empleado
where id_empleado = p_criterio and estado_empleado  = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Banco`(

p_criterio varchar(50))
Begin
		SELECT id_banco, descripcion_banco
		 FROM tbl_banco
		  WHERE id_banco = p_criterio
			ORDER BY descripcion_banco;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BancoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BancoCodigo`()
BEGIN
	SELECT id_banco FROM tbl_banco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Barra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Barra`(

p_criterio varchar(50))
Begin
		SELECT id_producto, barra 
		 FROM tbl_barra
		  WHERE id_producto = p_criterio
			ORDER BY id_producto;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Bitaora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Bitaora`(
p_criterio VARCHAR(50)
)
Begin
		SELECT id_bitacora, fecha_bitacora,hora_bitacora, usuario, accion_bitacora
		FROM tbl_bitacora	
		WHERE usuario = p_criterio
		ORDER BY fecha_bitacora ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Bodega`(

p_criterio varchar(50))
Begin
		SELECT id_bodega,nombre_bodega
		 FROM tbl_bodega
		  WHERE id_bodega = p_criterio
			ORDER BY  nombre_bodega;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaCodigo`()
BEGIN
SELECT id_bodega FROM tbl_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoByIDBodegaAndBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndBarra`(

p_criterio1 int,
p_criterio2 BIGINT)
Begin
		SELECT tbl_bodegaProducto.id_bodega,tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN tbl_barra ON tbl_barra.id_producto = tbl_bodegaProducto.id_producto
		  WHERE id_bodega = p_criterio1 and tbl_barra.barra = p_criterio2;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoByIdBodegaANDByIDSubCat`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoByIDBodegaAndIDProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndIDProducto`(

p_criterio1 int,
p_criterio2 int)
Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = p_criterio1 and id_producto = p_criterio2;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoByIDBodegaAndSKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoByIDBodegaAndSKU`(

p_criterio1 int,
p_criterio2 longtext)
Begin
		SELECT tbl_bodegaProducto.id_bodega,tbl_bodegaProducto.id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		 INNER JOIN tbl_Producto ON tbl_Producto.id_producto = tbl_bodegaProducto.id_producto
		  WHERE id_bodega = p_criterio1 and tbl_Producto.sku_producto = p_criterio2;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoIdBodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoIdBodega`(

p_criterio varchar(50))
Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_bodega = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoIdProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoIdProducto`(

p_criterio varchar(50))
Begin
		SELECT id_bodega,id_producto,
		stock_producto,minimo_producto,maximo_producto,
		diasReposicion_producto,cantidadMinima_producto
		 FROM tbl_bodegaProducto
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoIdProductoJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoIdProductoJoin`(

p_criterio varchar(50))
Begin
		SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
		WHERE bp.id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_BodegaProductoInventarioByIdBodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_BodegaProductoInventarioByIdBodega`(

p_criterio varchar(50))
Begin
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto,p.id_tproducto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		WHERE bp.id_bodega = p_criterio AND p.id_tproducto <> 4
		ORDER BY P.id_producto ASC;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CajaDiaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CajaDiaria`(

p_criterio varchar(50))
Begin
		SELECT id_movimiento,fecha_movimiento,id_caja,
		montoApertura_movimiento,ingreso_movimiento,egreso_movimiento,
		cierre_movimiento,saldo_movimiento,estado_movimiento
		 FROM tbl_CajaDiaria
		  WHERE id_caja = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CajaDiariaByIDCajaANDFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CajaDiariaByIDCajaANDFecha`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CajaDiariaByIDCajaANDFechaPrimero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CajaDiariaByIDCajaANDFechaPrimero`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CajaDiariaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CajaDiariaCodigo`()
Begin
		SELECT id_movimiento
		 FROM tbl_CajaDiaria;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Cajas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Cajas`(

p_criterio varchar(50))
Begin
		SELECT id_caja,descripcion_caja
		 FROM tbl_cajas
		  WHERE id_caja = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CajasCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CajasCodigo`()
Begin
		SELECT id_caja
		 FROM tbl_cajas;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CalculoPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CalculoPrecioVenta`(

p_criterio varchar(50))
Begin
		SELECT id_calculo,fecha_calculo,descripcion_calculo,
			   precio_costo,envio_costo,ganacia_promedio,costo_total,
			   precio_venta, precioSinIva_venta,iva_calculado,isr_calculado,
			   iso_calculado,total_impuesto,ganancia_real
		 FROM tbl_calculoPrecioVenta
		  WHERE id_calculo = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Categoria`(

p_criterio varchar(50))
Begin
		SELECT id_categoria,descripcion_categoria
		 FROM tbl_categoria
		  WHERE id_categoria = p_criterio
		ORDER BY descripcion_categoria;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CategoriaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CategoriaCodigo`()
Begin
		SELECT id_categoria
		 FROM tbl_categoria;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Cliente`(

p_criterio varchar(50))
Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM tbl_cliente
		  WHERE id_cliente = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ClienteByNit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ClienteByNit`(

p_criterio varchar(50))
Begin
		SELECT id_cliente,nit_cliente,nombre_cliente,id_municipio,
         		direccion_cliente,telefono1_cliente,telefono2_cliente,
				email_cliente,notas_cliente
		 FROM tbl_cliente
		  WHERE nit_cliente = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ClienteCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ClienteCodigo`()
BEGIN
	SELECT id_cliente FROM tbl_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Compra`(

p_criterio varchar(50))
Begin
		SELECT id_compra,fecha_compra,id_proveedor,id_bodega,
				id_formaPago,documento_compra,total_compra, 
				notas_compra, plazo_compra, boletaDeposito_compra,
				deposito_compra, diffDepoCompra_compra, usuario_compra

		 FROM tbl_compra
		  WHERE documento_compra = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CompraCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CompraCodigo`()
BEGIN
	SELECT id_compra FROM tbl_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Conceptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Conceptos`(

p_criterio varchar(50))
Begin
		SELECT id_concepto,descripcion_concepto
		 FROM tbl_conceptos
		  WHERE id_concepto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlArqueo`(

p_criterio varchar(50))
Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM tbl_ControlArqueo
		  WHERE id_control = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlArqueoCierre`(

p_criterio varchar(50))
Begin
		SELECT id_control, fecha_control, id_caja,Cantidad200,Total200,Cantidad100,Total100,
		Cantidad50,Total50,Cantidad20,Total20,Cantidad10,Total10,Cantidad5,Total5,Cantidad1,
		Total1,Cantidad050,Total050,Cantidad025,Total025,Cantidad010,Total010,Cantidad005,
		Total005,Cantidad001,Total001,GranTotal,Estado
		 FROM tbl_ControlArqueoCierre
		  WHERE id_control = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlArqueoCierreCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlArqueoCierreCodigo`()
Begin
		SELECT id_control
		 FROM tbl_ControlArqueoCierre;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlArqueoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlArqueoCodigo`()
Begin
		SELECT id_control
		 FROM tbl_ControlArqueo;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlCajaApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlCajaApertura`(

p_criterio varchar(50))
Begin
		SELECT id_control,fecha_control,id_caja,control_control

		 FROM tbl_ControlCajasApertura
		  WHERE id_caja = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ControlCajaAperturaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ControlCajaAperturaCodigo`()
Begin
		SELECT id_control
		 FROM tbl_ControlCajasApertura;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorCobrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorCobrar`(

p_criterio varchar(50))
Begin
		SELECT id_cuentaCobro,fecha_cuentaCobro,fechaVence_CuentaPorCobrar,
					id_cliente,id_ventaReferencia,documento_venta,monto_cuentaCobro,
					plazo_cuentaCobro,id_interes,cuotaProgramada,saldoProgramado,
					id_InteresMora,estado_cuentaCobro

		 FROM tbl_cuentasPorCobrar
		  WHERE id_cliente = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorCobrarByIDCuentaCobroANDFecha`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorCobrarCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorCobrarCodigo`()
Begin
		SELECT id_cuentaCobro
		 FROM tbl_cuentasPorCobrar;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorPagar`(

p_criterio varchar(50))
Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM tbl_CuentaPorPagar
		  WHERE id_CuentaPorPagar = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorPagarByIDProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorPagarByIDProveedor`(

p_criterio varchar(50))
Begin
		SELECT id_CuentaPorPagar,fecha_CuentaPorPagar,fechaVence_CuentaPorPagar,
			   id_proveedor,documento_CuentaPorPagar,monto_CuentaPorPagar,
			   plazo_CuentaPorPagar,saldo_CuentaPorPagar,estado_CuentaPorPagar

		 FROM tbl_CuentaPorPagar
		  WHERE id_proveedor = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_CuentaPorPagarCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_CuentaPorPagarCodigo`()
Begin
		SELECT id_CuentaPorPagar

		 FROM tbl_CuentaPorPagar;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Departamento`(

p_criterio varchar(50))
Begin
		SELECT id_departamento, nombre_departamento
		 FROM tbl_departamento
		  WHERE id_departamento = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_departamentoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_departamentoCodigo`()
BEGIN

		SELECT id_departamento
		 FROM tbl_departamento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleCompra`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_compra,id_producto,descripcion_producto,
		       costo_producto,cantidad_producto,id_kardex,porcentajeIva_Producto,
			   porcentajeDescuento_producto
		 FROM tbl_DetalleCompra
		  WHERE id_compra = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleDevolucionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleDevolucionCliente`(

p_criterio varchar(50))
Begin
		SELECT id_liena,id_devolucionCliente,id_producto,
		       descripcion_producto,precio_producto,cantidad_producto,
			   id_kardex,porcentajeIva, porcentajeDescuento
		 FROM tbl_DetalleDevolucionCliente
		  WHERE id_devolucionCliente = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleInventario`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_inventario,id_producto,descripcion_producto,stock_producto

		 FROM tbl_detalle_inventario
		  WHERE id_inventario = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleKit`(

p_criterio varchar(50))
Begin
		SELECT id_kit,id_producto,descripcion_producto,cantidad_detalleKit,precio_producto,numero_serie
		 FROM tbl_DetalleKit
		  WHERE id_kit = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetallePagoCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetallePagoCredito`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_pagocre,id_tabla,monto_pagocre,mora_pagocre,dias_pagocre
		 FROM tbl_DetallePagoCredito
		  WHERE id_pagocre = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetallePagoCreditoContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetallePagoCreditoContado`(

p_criterio varchar(50))
Begin
		SELECT id_linea, id_pagocrecont,id_cuentaCobro,monto_pagocrecont
		 FROM tbl_DetallePagoCreditoContado
		  WHERE id_pagocrecont = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_detallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_detallePedido`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_pedido,id_producto,descripcion_producto,precio_producto,cantidad_pedido
		 FROM tbl_detallePedido
		  WHERE id_pedido = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleSalida`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_salida,id_producto,descripcion_salida,
		       cantidad_salida,id_kardex
		 FROM tbl_DetalleSalida
		  WHERE id_salida = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleTraslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleTraslado`(

p_criterio varchar(50))
Begin
		SELECT id_linea, id_traslado, id_producto, descripcion_producto, cantidad_traslado, id_kardexOrigen, id_KardexDestino
		 FROM tbl_detalleTraslado
		  WHERE id_traslado = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DetalleVenta`(

p_criterio varchar(50))
Begin
		SELECT id_linea,id_venta,id_producto,descripcion_producto,
		       precio_producto,cantidad_producto,id_kardex,porcentajeIva,
			   porcentajeDescuento, numeroSerie, fechaGarantia,descripcion_medida
		 FROM tbl_DetalleVenta
		  WHERE id_venta = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Documentos`(

p_criterio varchar(50))
Begin
		SELECT *
		 FROM tbl_Documentos
		  WHERE id_documento = p_criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DocumentosByFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DocumentosByFactura`(

p_criterio varchar(50))
Begin
		SELECT *
		 FROM tbl_Documentos
		  WHERE id_documento = p_criterio 
			AND activo_documento = 1
			AND id_tipoDocumentoPago = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_DocumentosCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_DocumentosCodigo`()
Begin
		SELECT id_documento
		 FROM tbl_Documentos;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_FacturasComprasCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_FacturasComprasCodigo`()
Begin
		SELECT id_facturacompra
		 FROM tbl_FacturasCompras;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_FacturasComrpas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_FacturasComrpas`(

p_criterio varchar(50))
Begin
		SELECT id_facturacompra, fecha_facturacompra, id_compra,
		documento_facturacompra, monto_facturacompra, iva_facturacompra, 
		isr_facturacompra, iso_facturacompra, estado_facturacompra
		 FROM tbl_FacturasCompras
		  WHERE id_compra = p_criterio AND estado_facturacompra = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_FacturasVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_FacturasVentas`(

p_criterio varchar(50))
Begin
		SELECT id_facturaventa, fecha_facturaventa, id_venta,
		documento_facturaventa, monto_facturaventa, iva_facturaventa, 
		isr_facturaventa, iso_facturaventa, estado_facturaventa
		 FROM tbl_FacturasVentas
		  WHERE id_venta = p_criterio AND estado_facturaventa = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_FacturasVentasCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_FacturasVentasCodigo`()
Begin
		SELECT id_facturaventa
		 FROM tbl_FacturasVentas;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_FormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_FormaPago`(

p_criterio varchar(50))
Begin
		SELECT id_formaPago,descripcion_formaPago
		 FROM tbl_FormaPago
		  WHERE id_formaPago = p_criterio
		ORDER BY descripcion_formaPago;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Inventario`(

p_criterio varchar(50))
Begin
		SELECT id_inventario, fecha_inventario, id_bodega, estado_categoria
		 FROM tbl_Inventario
		  WHERE id_inventario = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_InventarioCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_InventarioCodigo`()
Begin
		SELECT id_inventario
			FROM tbl_Inventario;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Iva`(

p_criterio varchar(50))
Begin
		SELECT id_iva, descripcion_iva, tarifa_iva
		 FROM tbl_iva
		  WHERE id_iva = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_IvaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_IvaCodigo`()
Begin
		SELECT id_iva
		 FROM tbl_iva;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Kardex`(

p_criterio varchar(50))
Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_KardexByIDProductoANDByIDBodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_KardexByIDProductoANDByIDBodega`(

p_criterio1 varchar(50),
p_criterio2 varchar(50))
Begin
		SELECT id_kardex, id_bodega, id_producto, fecha_kardex, documento_kardex, entrada_kardex, salida_kardex, saldo_kardex, ultimoCosto_kardex, costoPromedio_kardex
		 FROM tbl_Kardex
		  WHERE id_producto = p_criterio1 and id_bodega = p_criterio2 ORDER BY fecha_kardex;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_KardexCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_KardexCodigo`()
Begin
		SELECT id_kardex
		 FROM tbl_Kardex;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Kit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Kit`(

p_criterio varchar(50))
Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		FROM tbl_kit
		  WHERE id_producto = p_criterio and estado_kit = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_KitCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_KitCodigo`()
Begin
		SELECT id_kit
		FROM tbl_kit;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_LogUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_LogUsuarios`(

p_criterio varchar(50))
Begin
		SELECT id_log,usuario_empleado,log,ipLocal,fecha_log
		 FROM tbl_LogUusarios
		  WHERE usuario_empleado = p_criterio
			AND log = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_LogUsuariosCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_LogUsuariosCodigo`()
BEGIN
	SELECT id_log FROM tbl_LogUusarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_marca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_marca`(

p_criterio varchar(50))
Begin
		SELECT id_marca, nombre_marca
		 FROM tbl_marca
		  WHERE id_marca = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_marcaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_marcaCodigo`()
Begin
		SELECT id_marca
		 FROM tbl_marca;

	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_MovimientoCuentaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_MovimientoCuentaCliente`(
p_criterio VARCHAR(50))
Begin
		SELECT id_movimiento, fecha_movimiento, id_cliente, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM tbl_MovimientoCuentaClientes
		 WHERE id_cliente = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_MovimientoCuentaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_MovimientoCuentaProveedor`(
p_criterio VARCHAR(50))
Begin
		SELECT id_movimiento, fecha_movimiento, id_proveedor, id_formaPago,
		descripcion_movimiento, debito_movimiento,credito_movimiento
		 FROM tbl_MovimientoCuentaProveedores
		 WHERE id_proveedor = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_MovimientoCuentaProveedorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_MovimientoCuentaProveedorCodigo`()
Begin
		SELECT id_movimiento
		 FROM tbl_MovimientoCuentaProveedores;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_municipio`(

p_criterio varchar(50))
Begin
		SELECT id_municipio,id_departamento,nombre_municipio
		 FROM tbl_municipio
		  WHERE id_municipio = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_municipioCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_municipioCodigo`()
BEGIN

		SELECT id_municipio
		 FROM tbl_municipio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PermisosRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PermisosRol`(

p_criterio varchar(50))
Begin
		SELECT id_permisos, id_rol, formulario_permisos, puedeVer, puedeModificar, puedeBorrar
		 FROM tbl_PermisosRol
		  WHERE id_permisos = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PermisosRolCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PermisosRolCodigo`()
Begin
		SELECT id_permisos
		 FROM tbl_PermisosRol;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PermisosRolPuedeBorrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PermisosRolPuedeBorrar`(

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
Begin
		SELECT 1 
		FROM tbl_PermisosRol 
	WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PermisosRolPuedeModificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PermisosRolPuedeModificar`(

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
Begin
		SELECT 1 
		FROM tbl_PermisosRol 
		WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PermisosRolPuedeVer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PermisosRolPuedeVer`(

p_criterio varchar(50),
p_criterio1 VARCHAR(50))
Begin
		SELECT puedeVer
		FROM tbl_PermisosRol 
		WHERE id_rol = p_criterio 
		AND formulario_permisos = p_criterio1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_PrecioCostoPorProductoByFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_PrecioCostoPorProductoByFecha`(

p_criterio varchar(50))
Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Producto`(

p_criterio varchar(50))
Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoBarra`(

p_criterio longtext)
Begin
		SELECT b.id_producto, p.sku_producto, p.descripcion_producto, p.id_Sub_Categoria, 
		p.id_iva,p.notas_producto, p.id_marca, p.modelo_producto, p.id_tproducto,p.costo_producto
		 FROM tbl_barra b
			INNER JOIN tbl_Producto p on b.id_producto = p.id_producto
		  WHERE b.barra = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoByID`(

p_criterio varchar(50))
Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoBySku` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoBySku`(

p_criterio varchar(50))
Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto,costo_producto
		 FROM tbl_producto
		  WHERE sku_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoCodigo`()
BEGIN
		SELECT id_producto
		 FROM tbl_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Productos`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoSKU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoSKU`(

p_criterio longtext)
Begin
		
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, id_iva, notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		FROM tbl_Producto
		WHERE sku_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductoWhereTProductKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductoWhereTProductKit`(

p_criterio varchar(50))
Begin
		SELECT id_producto, sku_producto, descripcion_producto, id_Sub_Categoria, 
		id_iva,notas_producto, id_marca, modelo_producto, id_tproducto, costo_producto
		 FROM tbl_producto
		  WHERE id_producto = p_criterio AND id_tproducto = 4;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductUnidPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductUnidPrecioVenta`(

p_criterio varchar(50))
Begin
		SELECT id_producto, id_medida, precio, estado_prounidprecio
		 FROM tbl_ProductUnidPrecioVenta
		  WHERE id_producto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductUnidPrecioVentaJoing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductUnidPrecioVentaJoing`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProductUnidPrecioVentaParaVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProductUnidPrecioVentaParaVenta`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_proforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_proforma`()
Begin
		SELECT *
		 FROM tbl_proforma;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProformaByVigentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProformaByVigentes`(

p_FECHA DATE)
Begin
		SELECT *
		 FROM tbl_proforma
		  WHERE fecha_proforma < p_FECHA and estado_proforma = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_proformaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_proformaCodigo`()
Begin
		SELECT id_proforma
		 FROM tbl_proforma;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProvBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProvBancos`(

p_criterio varchar(50))
Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM tbl_provbancos
		  WHERE id_proveedor = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProvBancosByIDBanco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProvBancosByIDBanco`(

p_criterio varchar(50))
Begin
		SELECT id_proveedor, id_banco, numero_cuenta, nombre_cuenta, descripcion_cuenta
		 FROM tbl_provbancos
		  WHERE id_banco = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProvBancosCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProvBancosCodigo`()
Begin
		SELECT id_proveedor
		 FROM tbl_provbancos;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Proveedor`(

p_criterio varchar(50))
Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM tbl_proveedor
		  WHERE id_proveedor = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProveedorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProveedorCodigo`()
Begin
		SELECT id_proveedor
		 FROM tbl_proveedor;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ProveedorNit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ProveedorNit`(

p_criterio varchar(50))
Begin
		SELECT id_proveedor, nombreJuridico_proveedor, 
		nombreComercial_proveedor, direccion_proveedor, 
		telefono1_proveedor, telefono2_proveedor, 
		correo_proveedor, nit_proveedor, id_iva,
		id_municipio
		 FROM tbl_proveedor
		  WHERE nit_proveedor = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ReporteDetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ReporteDetalleVenta`(

p_criterio varchar(50))
Begin
			SELECT dv.id_linea, dv.id_venta, dv.id_producto, dv.descripcion_producto, 
			u.descripcion_medida,dv.cantidad_producto,dv.precio_producto
			FROM tbl_DetalleVenta dv
			INNER JOIN tbl_Producto p on dv.id_producto = p.id_producto
			INNER JOIN tbl_ProductUnidPrecioVenta pv on dv.id_producto = pv.id_producto
			INNER JOIN tbl_UnidadMedida u on pv.id_medida = u.id_medida
		  WHERE dv.id_venta = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ReporteGarantiaSerieProductosByIDVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ReporteGarantiaSerieProductosByIDVenta`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ReporteVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ReporteVenta`(

p_criterio varchar(50))
Begin
		SELECT	v.id_venta, v.fecha_venta, v.id_cliente,
		c.nombre_cliente, c.direccion_cliente, c.nit_cliente,
		v.total_venta, v.documento, v.usuario_venta, v.cobrado_venta
		FROM tbl_venta v
		INNER JOIN tbl_cliente c ON v.id_cliente = c.id_cliente
		WHERE v.id_venta = p_criterio
		AND v.cobrado_venta = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Rol`(

p_criterio varchar(50))
Begin
		SELECT id_rol, descripcion_rol
		 FROM tbl_rol
		  WHERE id_rol = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_RolCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_RolCodigo`()
Begin
		SELECT id_producto
		 FROM tbl_barra;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Salida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Salida`(

p_criterio varchar(50))
Begin
		SELECT id_salida, fecha_salida, id_bodega,id_concepto
		 FROM tbl_salida
		  WHERE id_salida = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SalidaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SalidaCodigo`()
Begin
		SELECT id_salida
		 FROM tbl_salida;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SerieProductoByIDNumSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SerieProductoByIDNumSerie`(

p_criterio varchar(50))
Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie
		 FROM tbl_SerieProducto
		  WHERE numero_serie = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SerieProductoByIDProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SerieProductoByIDProducto`(

p_criterio varchar(50),
p_criterio2 varchar(50))
Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM tbl_SerieProducto
		  WHERE id_producto = p_criterio
			AND disponible_serie >= 1
			AND id_serie = p_criterio2;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SerieProductoByIDProductoANDNSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SerieProductoByIDProductoANDNSerie`(

p_criterio varchar(50),
p_criterio2 LONGTEXT)
Begin
		SELECT id_kit, id_producto, numero_serie
		 FROM tbl_DetalleKit
		  WHERE id_producto = p_criterio
			AND numero_serie = p_criterio2;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SerieProductoByIDProductoANDSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SerieProductoByIDProductoANDSerie`(

p_criterio varchar(50),
p_criterio2 LONGTEXT)
Begin
		SELECT id_producto, id_serie, numero_serie, disponible_serie, cantidad_serie, fechaVenceCompra_serie, fechaVenceVenta_serie
		 FROM tbl_SerieProducto
		  WHERE id_producto = p_criterio
			AND disponible_serie >= 1
			AND numero_serie = p_criterio2;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SubCategoria`(

p_criterio varchar(50))
Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_subcategoria = p_criterio
		ORDER BY descripcion_subcategoria;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SubCategoriaByIDCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SubCategoriaByIDCategoria`(

p_criterio varchar(50))
Begin
		SELECT id_subcategoria,descripcion_subcategoria, id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_categoria = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SubCategoriaByIDSubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SubCategoriaByIDSubCategoria`(

p_criterio varchar(50))
Begin
		SELECT id_categoria
		 FROM tbl_Sub_Categoria
		  WHERE id_subcategoria = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_SubCategoriaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_SubCategoriaCodigo`()
Begin
		SELECT id_subcategoria
		 FROM tbl_Sub_Categoria;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Tablas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Tablas`()
Begin
			select name from sysobjects where type='U'
			ORDER BY name;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TarjetaCredito`(

p_criterio varchar(50))
Begin
		SELECT id_tarjeta, descripcion_tarjeta, tarifa_tarjeta
		 FROM tbl_TarjetaCredito
		  WHERE id_tarjeta = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TarjetaCreditoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TarjetaCreditoCodigo`()
Begin
		SELECT id_tarjeta
		 FROM tbl_TarjetaCredito;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoDocumentoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoDocumentoPago`(

p_criterio varchar(50))
Begin
		SELECT id_tipoDocumentoPago, descripcion_tipoDocumentoPago
		 FROM tbl_TipoDocumentoPagos
		  WHERE id_tipoDocumentoPago = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoDocumentoPagoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoDocumentoPagoCodigo`()
Begin
		SELECT id_tipoDocumentoPago
		 FROM tbl_TipoDocumentoPagos;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoEmpleado`(

p_criterio varchar(50))
Begin
		SELECT id_templeado, descripcion_templeado
		 FROM tbl_tipoEmpleado
		  WHERE id_templeado = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoEmpleadoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoEmpleadoCodigo`()
BEGIN
	SELECT id_templeado FROM tbl_tipoEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoProducto`(

p_criterio varchar(50))
Begin
		SELECT id_tproducto, descripcion_tproducto 
		 FROM tbl_TipoProducto
		  WHERE id_tproducto = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TipoProductoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TipoProductoCodigo`()
Begin
		SELECT id_tproducto
		 FROM tbl_TipoProducto;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_Traslado`(

p_criterio varchar(50))
Begin
		SELECT id_traslado, fecha_traslado, id_bodegaOrigen, id_bodegaDestino, descripcion_traslado
		 FROM tbl_traslado
		  WHERE id_traslado = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_TrasladoCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_TrasladoCodigo`()
Begin
		SELECT id_traslado
		 FROM tbl_traslado;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoControlArqueo`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoControlArqueoCierre`(

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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoControlCajaApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoControlCajaApertura`(

p_criterio1 varchar(50))
Begin
		SELECT id_control, fecha_control, id_caja, control_control
		 FROM tbl_ControlCajasApertura
		  WHERE id_caja = p_criterio1 
			AND fecha_control = (SELECT MAX(fecha_control) FROM tbl_ControlCajasApertura WHERE id_caja = p_criterio1);
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoKardex`(

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

	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoKit`(

p_criterio1 varchar(50))
Begin
		SELECT id_kit, fecha_kit, fechavence_kit, id_producto, precio_kit, estado_kit
		 FROM tbl_kit
		  WHERE id_producto = p_criterio1
			and estado_kit = 1 
			AND fecha_kit = (SELECT MAX(fecha_kit) FROM tbl_kit WHERE id_producto = p_criterio1);

	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UltimoPrecioCostoPorProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UltimoPrecioCostoPorProducto`(

p_criterio1 varchar(50))
Begin
		SELECT id_PreCostoProducto, fecha_PreCostoProducto, id_producto, costo_producto, referencia_compra
		 FROM tbl_PrecioCostoPorProductoByFecha
		  WHERE id_producto = p_criterio1 
			AND fecha_PreCostoProducto = (SELECT MAX(fecha_PreCostoProducto) FROM tbl_PrecioCostoPorProductoByFecha WHERE id_producto = p_criterio1);

	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UnidadMedida`(

p_criterio varchar(50))
Begin
		SELECT id_medida, descripcion_medida, cantidad_medida
		 FROM tbl_UnidadMedida
		  WHERE id_medida = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_UnidadMedidaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_UnidadMedidaCodigo`()
Begin
		SELECT id_medida
		 FROM tbl_UnidadMedida;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_venta`(

p_criterio varchar(50))
Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = p_criterio;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ventaByPendienteCobro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ventaByPendienteCobro`(

p_criterio varchar(50))
Begin
		SELECT id_venta, fecha_venta, id_cliente, id_bodega, id_formaPago, 
		total_venta, id_documento, documento, observaciones_venta,
		plazo_venta, boletaDeposito_venta, diffDepoCompra_venta, 
		usuario_venta, cobrado_venta
		 FROM tbl_venta
		  WHERE id_venta = p_criterio and cobrado_venta = 1;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Listar_ventaCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Listar_ventaCodigo`()
Begin
		SELECT id_venta
		 FROM tbl_venta;
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ObtenerEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ObtenerEmpleado`()
BEGIN
SELECT * 
FROM tbl_empleado 
WHERE estado_empleado = 1 
ORDER BY id_empleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ObtenerEmpleadoTipoTecnico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ObtenerEmpleadoTipoTecnico`()
BEGIN
SELECT * 
FROM tbl_empleado 
WHERE id_templeado = 4 AND	estado_empleado = 1 
ORDER BY id_empleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ObtenerLogUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ObtenerLogUsuarios`()
BEGIN
SELECT * 
FROM tbl_LogUusarios 
ORDER BY usuario_empleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ObtenerTipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ObtenerTipoEmpleado`()
BEGIN
SELECT * 
FROM tbl_tipoEmpleado 
ORDER BY id_templeado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ObtenerUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_ObtenerUsuarios`()
BEGIN
SELECT id_empleado, usuario_empleado,contrasena_empleado, estado_empleado 
from tbl_empleado
WHERE estado_empleado = 1 
ORDER BY usuario_empleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Banco`()
BEGIN
	SELECT * 
		FROM tbl_banco
			ORDER BY id_banco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Barra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Barra`()
BEGIN
	SELECT * 
		FROM tbl_barra
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Bitaora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Bitaora`()
Begin
		SELECT *
		FROM tbl_bitacora	
		ORDER BY fecha_bitacora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Bodega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Bodega`()
BEGIN
	SELECT * 
		FROM tbl_bodega
			ORDER BY nombre_bodega ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaCompras`()
BEGIN
	SELECT * 
		FROM tbl_bodega
		WHERE id_bodega = 1
			ORDER BY nombre_bodega ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaMostrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaMostrador`()
BEGIN
	SELECT * 
		FROM tbl_bodega
			WHERE id_bodega = 2
			ORDER BY id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProducto`()
BEGIN
	SELECT * 
		FROM tbl_bodegaProducto
			ORDER BY id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProductoByBodegaMostrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProductoByBodegaMostrador`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProductoByBodegas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProductoByBodegas`()
BEGIN
SELECT BP.id_bodega, BB.nombre_bodega,BP.id_producto, P.sku_producto, P.descripcion_producto,PV.precio,
BP.stock_producto, BP.minimo_producto, BP.maximo_producto, BP.diasReposicion_producto,
BP.cantidadMinima_producto 
FROM tbl_bodegaProducto BP
INNER JOIN tbl_Producto P ON BP.id_producto = P.id_producto
INNER JOIN tbl_ProductUnidPrecioVenta PV ON BP.id_producto = PV.id_producto
INNER JOIN tbl_bodega BB ON BP.id_bodega = BB.id_bodega
ORDER BY BP.id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProductoByIDProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProductoByIDProducto`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProductoInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProductoInventario`()
BEGIN
		SELECT bp.id_bodega,bp.id_producto,p.descripcion_producto,bp.stock_producto,bp.minimo_producto,bp.maximo_producto,
		bp.diasReposicion_producto,bp.cantidadMinima_producto
		FROM tbl_bodegaProducto bp
		INNER JOIN tbl_Producto p on bp.id_producto = p.id_producto
		ORDER BY id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BodegaProductoJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BodegaProductoJoin`()
BEGIN
SELECT bp.id_bodega,b.nombre_bodega, bp.id_producto, bp.stock_producto, bp.minimo_producto, bp.maximo_producto, bp.diasReposicion_producto, bp.cantidadMinima_producto
FROM tbl_bodegaProducto bp
INNER JOIN tbl_bodega b ON bp.id_bodega = b.id_bodega
ORDER BY bp.id_bodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_BuscaKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_BuscaKardex`()
BEGIN
	SELECT k.id_kardex, k.id_bodega, b.nombre_bodega,k.id_producto, p.descripcion_producto, k.fecha_kardex,
	k.documento_kardex, k.entrada_kardex, k.salida_kardex, k.saldo_kardex
	FROM tbl_Kardex k
	INNER JOIN tbl_bodega b ON k.id_bodega = b.id_bodega
	INNER JOIN tbl_Producto p ON k.id_producto = p.id_producto
	ORDER BY k.id_kardex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Caja`()
BEGIN
	SELECT * 
		FROM tbl_cajas
			ORDER BY id_caja;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CajaDiaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CajaDiaria`()
BEGIN
	SELECT * 
		FROM tbl_CajaDiaria
			ORDER BY id_caja;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CalculoPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CalculoPrecioVenta`()
BEGIN
	SELECT * 
		FROM tbl_calculoPrecioVenta
			ORDER BY id_calculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Categoria`()
BEGIN
	SELECT * 
		FROM tbl_categoria
			ORDER BY descripcion_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CategoriaByIDCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CategoriaByIDCategoria`(
p_criterio varchar(50))
BEGIN
	SELECT * 
		FROM tbl_categoria
			WHERE id_categoria = p_criterio
			ORDER BY id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Cliente`()
BEGIN
	SELECT * 
		FROM tbl_cliente
			ORDER BY id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Compra`()
BEGIN
	SELECT * 
		FROM tbl_compra
			ORDER BY id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CompraCompletaByProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CompraCompletaByProveedor`()
Begin 
SELECT C.id_compra, c.fecha_compra, c.id_bodega, B.nombre_bodega,
C.id_formaPago, F.descripcion_formaPago, c.id_proveedor,P.nit_proveedor, P.nombreComercial_proveedor,
C.documento_compra,C.boletaDeposito_compra,C.deposito_compra,C.total_compra,C.diffDepoCompra_compra,
C.usuario_compra 
FROM tbl_compra C
INNER JOIN tbl_proveedor P ON C.id_proveedor = P.id_proveedor
INNER JOIN tbl_FormaPago F ON c.id_formaPago = f.id_formaPago
INNER JOIN tbl_bodega B ON C.id_bodega = B.id_bodega;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Concetos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Concetos`()
BEGIN
	SELECT * 
		FROM tbl_conceptos
			ORDER BY id_concepto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ControlArqueo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ControlArqueo`()
BEGIN
	SELECT * 
		FROM tbl_ControlArqueo
			ORDER BY id_control;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ControlArqueoByIDCAJA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ControlArqueoByIDCAJA`(
p_idcaja int)
BEGIN
	SELECT * 
		FROM tbl_ControlArqueo
		WHERE id_caja = p_idcaja
			ORDER BY id_control;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ControlArqueoCierre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ControlArqueoCierre`()
BEGIN
	SELECT * 
		FROM tbl_ControlArqueoCierre
			ORDER BY id_control;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ControlArqueoCierreByIdCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ControlArqueoCierreByIdCaja`(
p_idcaja int)
BEGIN
	SELECT * 
		FROM tbl_ControlArqueoCierre
		WHERE id_caja = p_idcaja
			ORDER BY id_control;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ControlCajaApertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ControlCajaApertura`()
BEGIN
	SELECT * 
		FROM tbl_ControlCajasApertura
			ORDER BY id_caja;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CuentaPorCobrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CuentaPorCobrar`()
BEGIN
	SELECT * 
		FROM tbl_cuentasPorCobrar
			ORDER BY id_cuentaCobro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_CuentaPorPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_CuentaPorPagar`()
BEGIN
	SELECT * 
		FROM tbl_CuentaPorPagar
			ORDER BY id_CuentaPorPagar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Departamento`()
BEGIN
	SELECT * 
		FROM tbl_departamento
			ORDER BY id_departamento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleCompra`()
BEGIN
	SELECT * 
		FROM tbl_DetalleCompra
			ORDER BY id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleDevolucionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleDevolucionCliente`()
BEGIN
	SELECT * 
		FROM tbl_DetalleDevolucionCliente
			ORDER BY id_devolucionCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleInventario`()
BEGIN
	SELECT * 
		FROM tbl_detalle_inventario
			ORDER BY id_inventario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleKit`()
BEGIN
	SELECT * 
		FROM tbl_DetalleKit
			ORDER BY id_kit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetallePagoCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetallePagoCredito`()
BEGIN
	SELECT * 
		FROM tbl_DetallePagoCredito
			ORDER BY id_pagocre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetallePagoCreditoContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetallePagoCreditoContado`()
BEGIN
	SELECT * 
		FROM tbl_DetallePagoCreditoContado
			ORDER BY id_pagocrecont;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_detallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_detallePedido`()
BEGIN
	SELECT * 
		FROM tbl_detallePedido
			ORDER BY id_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleSalida`()
BEGIN
	SELECT * 
		FROM tbl_DetalleSalida
			ORDER BY id_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_detalleTraslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_detalleTraslado`()
BEGIN
	SELECT * 
		FROM tbl_detalleTraslado
			ORDER BY id_traslado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_DetalleVenta`()
BEGIN
	SELECT * 
		FROM tbl_DetalleVenta
			ORDER BY id_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Documentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Documentos`()
BEGIN
	SELECT * 
		FROM tbl_Documentos
			WHERE activo_documento = 1
			ORDER BY id_documento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_FacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_FacturasCompras`()
BEGIN
	SELECT * 
		FROM tbl_FacturasCompras
			ORDER BY id_facturacompra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_FacturasVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_FacturasVentas`()
BEGIN
	SELECT * 
		FROM tbl_FacturasVentas
			ORDER BY id_facturaventa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_FormaPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_FormaPago`()
BEGIN
	SELECT * 
		FROM tbl_FormaPago
			ORDER BY descripcion_formaPago ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Inventario`()
BEGIN
	SELECT * 
		FROM tbl_Inventario
			ORDER BY id_inventario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Iva`()
BEGIN
	SELECT * 
		FROM tbl_iva
			ORDER BY descripcion_iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Kardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Kardex`()
BEGIN
	SELECT * 
		FROM tbl_Kardex
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Kit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Kit`()
BEGIN
	SELECT * 
		FROM tbl_kit
		WHERE estado_kit = 1
			ORDER BY id_kit;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_marca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_marca`()
BEGIN
	SELECT * 
		FROM tbl_marca
			ORDER BY nombre_marca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_MovimientoCuentaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_MovimientoCuentaCliente`()
BEGIN
	SELECT * 
		FROM tbl_MovimientoCuentaClientes
			ORDER BY id_movimiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_MovimientoCuentaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_MovimientoCuentaProveedor`()
BEGIN
	SELECT * 
		FROM tbl_MovimientoCuentaProveedores
			ORDER BY id_movimiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_municipio`()
BEGIN
	SELECT * 
		FROM tbl_municipio
			ORDER BY id_municipio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_PermisosRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_PermisosRol`()
BEGIN
	SELECT * 
		FROM tbl_PermisosRol
			ORDER BY id_permisos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_PrecioCostoPorPorductoPorFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_PrecioCostoPorPorductoPorFecha`()
BEGIN
	SELECT * 
		FROM tbl_PrecioCostoPorProductoByFecha
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_producto`()
BEGIN
	SELECT * 
				FROM tbl_Producto
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_productoBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_productoBarra`()
BEGIN
	SELECT p.id_producto, b.barra, p.sku_producto, p.descripcion_producto,
	p.id_Sub_Categoria, p.id_iva, p.notas_producto, 
	p.id_marca, p.modelo_producto, p.id_tproducto
		FROM tbl_producto p
		INNER JOIN tbl_barra b on p.id_producto = b.id_producto
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_productoByIDTprodKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_productoByIDTprodKit`()
BEGIN
	SELECT * 
				FROM tbl_Producto
				WHERE id_tproducto = 4
			ORDER BY id_producto; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_productoDifefenteKit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_productoDifefenteKit`()
BEGIN
SELECT * from tbl_Producto
WHERE id_tproducto <> 4
			ORDER BY id_producto; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_productos`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ProductUnidPrecioVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ProductUnidPrecioVenta`()
BEGIN
	SELECT * 
		FROM tbl_ProductUnidPrecioVenta
			ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ProductUnidPrecioVentaJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ProductUnidPrecioVentaJoin`()
BEGIN
SELECT pv.id_producto, pv.id_medida, m.descripcion_medida, pv.precio, pv.estado_prounidprecio 
from tbl_ProductUnidPrecioVenta pv
INNER JOIN tbl_UnidadMedida m on pv.id_medida = m.id_medida
ORDER BY id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_proforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_proforma`()
BEGIN
	SELECT * 
		FROM tbl_proforma
			ORDER BY id_proforma;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ProvBancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ProvBancos`()
BEGIN
	SELECT * 
		FROM tbl_provbancos
			ORDER BY id_banco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Proveedor`()
BEGIN
	SELECT * 
		FROM tbl_proveedor
			ORDER BY id_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Rol`()
BEGIN
	SELECT * 
		FROM tbl_Rol
			ORDER BY id_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Salida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Salida`()
BEGIN
	SELECT * 
		FROM tbl_salida
			ORDER BY id_salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_SerieProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_SerieProducto`()
BEGIN
	SELECT * 
		FROM tbl_serieProducto
		where cantidad_serie > 0
			ORDER BY id_serie;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_SubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_SubCategoria`()
BEGIN
	SELECT * 
		FROM tbl_Sub_Categoria
			ORDER BY id_subcategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_TarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_TarjetaCredito`()
BEGIN
	SELECT * 
		FROM tbl_TarjetaCredito
			ORDER BY id_tarjeta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_TipoDocumentoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_TipoDocumentoPago`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
			ORDER BY id_tipoDocumentoPago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_TipoDocumentoPagoByFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_TipoDocumentoPagoByFactura`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 1
			ORDER BY id_tipoDocumentoPago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_TipoDocumentoPagoByProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_TipoDocumentoPagoByProforma`()
BEGIN
	SELECT * 
		FROM tbl_TipoDocumentoPagos
		WHERE id_tipoDocumentoPago = 4
			ORDER BY id_tipoDocumentoPago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_TipoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_TipoProducto`()
BEGIN
	SELECT * 
		FROM tbl_tipoProducto
			ORDER BY descripcion_tproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_Traslado`()
BEGIN
	SELECT * 
		FROM tbl_traslado
			ORDER BY id_traslado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_UnidadMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_UnidadMedida`()
BEGIN
	SELECT * 
		FROM tbl_UnidadMedida
			ORDER BY descripcion_medida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_venta`()
BEGIN
	SELECT * 
		FROM tbl_venta
			ORDER BY id_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByAll`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByCheque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByCheque`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByContado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByContado`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByCredito`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByDeposito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByDeposito`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Obtener_ventaDiariaByTarjetaCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_Obtener_ventaDiariaByTarjetaCredito`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_bitacora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `sp_registrar_bitacora`(
    IN `p_tabla_modificada` VARCHAR(255),
    IN `p_tipo_accion` VARCHAR(10),
    IN `p_usuario` VARCHAR(255),
    IN `p_descripcion` TEXT
)
BEGIN
    INSERT INTO `tbl_bitacora` (`tabla_modificada`, `tipo_accion`, `fecha_hora`, `usuario`, `descripcion`)
    VALUES (p_tabla_modificada, p_tipo_accion, NOW(3), p_usuario, p_descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TipoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `SP_TipoEmpleado`(
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
	End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarFacturasCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidarFacturasCompras`(
	p_criterio LONGTEXT
)
BEGIN
SELECT COUNT(*) FROM tbl_FacturasCompras
WHERE documento_facturacompra = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarNumeroSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidarNumeroSerie`(
	p_NumeroSerie longtext
)
BEGIN
SELECT 1 FROM tbl_SerieProducto
WHERE numero_serie = p_NumeroSerie;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidarProveedor`(
	p_criterio INT
)
BEGIN
SELECT COUNT(*) FROM tbl_proveedor
WHERE id_proveedor = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarProveedorNit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidarProveedorNit`(
	p_criterio INT
)
BEGIN
SELECT COUNT(*) FROM tbl_proveedor
WHERE nit_proveedor = p_criterio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidaUsuario`(
	p_IDUsuario varchar(50),
	p_Clave varchar(50)
)
BEGIN
SELECT COUNT(*) FROM tbl_empleado 
WHERE usuario_empleado = p_IDUsuario
AND contrasena_empleado = p_Clave
AND estado_empleado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidaUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pedro2024`@`%` PROCEDURE `ValidaUsuarios`(
	p_IDUsuario varchar(50)
)
BEGIN
SELECT COUNT(*) FROM tbl_LogUusarios 
WHERE usuario_empleado = p_IDUsuario
AND log = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `View_LIstProductByIDBodega`
--

/*!50001 DROP VIEW IF EXISTS `View_LIstProductByIDBodega`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pedro2024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_LIstProductByIDBodega` AS select `tbl_bodegaProducto`.`id_bodega` AS `id_bodega`,`tbl_bodegaProducto`.`id_producto` AS `id_producto`,`tbl_Producto`.`descripcion_producto` AS `descripcion_producto`,`tbl_bodegaProducto`.`stock_producto` AS `stock_producto` from (`tbl_bodegaProducto` join `tbl_Producto` on((`tbl_bodegaProducto`.`id_producto` = `tbl_Producto`.`id_producto`))) where (`tbl_bodegaProducto`.`id_bodega` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_ListaBodegaProductoByIDBodegaAndPrecios`
--

/*!50001 DROP VIEW IF EXISTS `View_ListaBodegaProductoByIDBodegaAndPrecios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pedro2024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_ListaBodegaProductoByIDBodegaAndPrecios` AS select `tbl_bodegaProducto`.`id_bodega` AS `id_bodega`,`tbl_bodegaProducto`.`id_producto` AS `id_producto`,`tbl_Producto`.`descripcion_producto` AS `descripcion_producto`,`tbl_bodegaProducto`.`stock_producto` AS `stock_producto`,`tbl_Producto`.`costo_producto` AS `costo_producto`,`tbl_ProductUnidPrecioVenta`.`precio` AS `precio`,`tbl_Producto`.`id_Sub_Categoria` AS `id_Sub_Categoria`,`tbl_categoria`.`id_categoria` AS `id_categoria` from ((((`tbl_bodegaProducto` join `tbl_Producto` on((`tbl_bodegaProducto`.`id_producto` = `tbl_Producto`.`id_producto`))) join `tbl_ProductUnidPrecioVenta` on((`tbl_ProductUnidPrecioVenta`.`id_producto` = `tbl_Producto`.`id_producto`))) join `tbl_Sub_Categoria` on((`tbl_Producto`.`id_Sub_Categoria` = `tbl_Sub_Categoria`.`id_subcategoria`))) join `tbl_categoria` on((`tbl_Sub_Categoria`.`id_categoria` = `tbl_categoria`.`id_categoria`))) where ((`tbl_bodegaProducto`.`id_bodega` = 2) and (`tbl_ProductUnidPrecioVenta`.`precioBase` = 1) and (`tbl_Producto`.`id_Sub_Categoria` = 1) and (`tbl_Sub_Categoria`.`id_categoria` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_ProductListByIDProductoFromCompraDetails`
--

/*!50001 DROP VIEW IF EXISTS `View_ProductListByIDProductoFromCompraDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pedro2024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_ProductListByIDProductoFromCompraDetails` AS select `tbl_DetalleCompra`.`id_compra` AS `id_compra`,`tbl_DetalleCompra`.`id_producto` AS `id_producto`,`tbl_DetalleCompra`.`descripcion_producto` AS `descripcion_producto`,`tbl_DetalleCompra`.`cantidad_producto` AS `cantidad_producto`,`tbl_DetalleCompra`.`costo_producto` AS `costo_producto`,`tbl_proveedor`.`id_proveedor` AS `id_proveedor`,`tbl_proveedor`.`nombreComercial_proveedor` AS `nombreComercial_proveedor` from (((`tbl_compra` join `tbl_DetalleCompra` on((`tbl_compra`.`id_compra` = `tbl_DetalleCompra`.`id_compra`))) join `tbl_Producto` on((`tbl_DetalleCompra`.`id_producto` = `tbl_Producto`.`id_producto`))) join `tbl_proveedor` on((`tbl_compra`.`id_proveedor` = `tbl_proveedor`.`id_proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View_ProductListToIDProducto`
--

/*!50001 DROP VIEW IF EXISTS `View_ProductListToIDProducto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pedro2024`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `View_ProductListToIDProducto` AS select `tbl_DetalleCompra`.`id_compra` AS `id_compra`,`tbl_compra`.`fecha_compra` AS `fecha_compra`,`tbl_DetalleCompra`.`id_producto` AS `id_producto`,`tbl_DetalleCompra`.`descripcion_producto` AS `descripcion_producto`,`tbl_DetalleCompra`.`cantidad_producto` AS `cantidad_producto`,`tbl_DetalleCompra`.`costo_producto` AS `costo_producto`,`tbl_proveedor`.`id_proveedor` AS `id_proveedor`,`tbl_proveedor`.`nombreComercial_proveedor` AS `nombreComercial_proveedor` from (((`tbl_compra` join `tbl_DetalleCompra` on((`tbl_compra`.`id_compra` = `tbl_DetalleCompra`.`id_compra`))) join `tbl_Producto` on((`tbl_DetalleCompra`.`id_producto` = `tbl_Producto`.`id_producto`))) join `tbl_proveedor` on((`tbl_compra`.`id_proveedor` = `tbl_proveedor`.`id_proveedor`))) where (`tbl_DetalleCompra`.`id_producto` = 519) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 13:11:55
