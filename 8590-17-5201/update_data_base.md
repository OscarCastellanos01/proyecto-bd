# Examen Final

## Garantizar la disponibilidad continua

El sistema debe permanecer operativo incluso en caso de fallos del servidor.

_Para garantizar la disponibilidad continua de un servidor MySQL, puedes implementar un clúster de alta disponibilidad (HA). Una de las configuraciones más comunes es utilizar MySQL Replication con MySQL Router y MySQL InnoDB Cluster. Esta configuración permite tener una réplica primaria (master) y una o más réplicas secundarias (slaves), además de un mecanismo de failover automático en caso de fallos del servidor._

1. **Configuración del Entorno**

Supongamos que tienes dos VPS:

- **VPS1**: IP `192.168.1.1` (primaria)
- **VPS2**: IP `192.168.1.2` (secundaria)

Claro, aquí tienes una explicación en formato Markdown sobre cómo garantizar la disponibilidad continua de un servidor MySQL utilizando un clúster con dos VPS.

---

### Objetivo

Garantizar la disponibilidad continua de un sistema MySQL, asegurando que el sistema permanezca operativo incluso en caso de fallos del servidor.

### Arquitectura del Clúster

#### Componentes

1. **VPS1 (Servidor MySQL Principal)**
2. **VPS2 (Servidor MySQL Secundario)**
3. **ProxySQL**: Un proxy para MySQL que se encargará de distribuir las conexiones entre los servidores y gestionar el failover.
4. **Keepalived**: Proporciona una dirección IP virtual (VIP) que será compartida entre los servidores para asegurar que siempre haya una instancia disponible para recibir tráfico.

#### Funcionamiento General

1. **Replicación MySQL:**

   - Configurar la replicación asíncrona de MySQL entre VPS1 (maestro) y VPS2 (esclavo).
   - Asegurar que VPS2 esté siempre sincronizado con VPS1 para que pueda tomar el control en caso de fallo.

2. **ProxySQL:**

   - Instalar y configurar ProxySQL en ambas VPS para gestionar la distribución de cargas y el failover.
   - ProxySQL detecta si el servidor principal (VPS1) falla y redirige el tráfico al servidor secundario (VPS2).

3. **Keepalived:**
   - Configurar Keepalived en ambas VPS para gestionar la dirección IP virtual (VIP).
   - La VIP se asignará dinámicamente al servidor activo (inicialmente VPS1).
   - En caso de fallo de VPS1, Keepalived asignará la VIP a VPS2.

### Pasos de Implementación

#### Paso 1: Configurar MySQL en ambas VPS

1. **Instalar MySQL:** Instalar MySQL en VPS1 y VPS2.

2. **Configurar MySQL para Replicación:**
   - Configurar VPS1 como maestro.
   - Configurar VPS2 como esclavo.

#### Paso 2: Configurar ProxySQL en ambas VPS

1. **Instalar ProxySQL:** Instalar ProxySQL en ambas VPS.

2. **Configurar ProxySQL para Alta Disponibilidad:**
   - Definir los servidores de backend (VPS1 y VPS2).
   - Configurar reglas de failover y distribución de carga.

#### Paso 3: Configurar Keepalived en ambas VPS

1. **Instalar Keepalived:** Instalar Keepalived en ambas VPS.

2. **Configurar Keepalived para la VIP:**
   - Crear un archivo de configuración de Keepalived en ambas VPS.
   - Definir la VIP y los scripts de checado de salud para los servidores MySQL.

#### Ejemplo de Flujo de Trabajo

1. **Operación Normal:**

   - Los clientes se conectan a la VIP.
   - ProxySQL dirige el tráfico a VPS1.
   - VPS2 se mantiene sincronizado con VPS1.

2. **Fallo del Servidor Principal (VPS1):**

   - ProxySQL detecta que VPS1 no está disponible.
   - Keepalived detecta el fallo y asigna la VIP a VPS2.
   - ProxySQL redirige el tráfico a VPS2.

3. **Restauración del Servidor Principal:**
   - Reparar VPS1 y reiniciar MySQL.
   - Resincronizar VPS1 con VPS2.
   - Keepalived reasigna la VIP a VPS1.
   - ProxySQL vuelve a dirigir el tráfico a VPS1.

### Consideraciones

1. **Sincronización de Datos:** Asegurar que la replicación MySQL esté configurada correctamente para minimizar la pérdida de datos en caso de fallo.

2. **Configuración de ProxySQL:** Ajustar las configuraciones de ProxySQL para optimizar el balanceo de carga y el failover.

3. **Monitoreo y Alertas:** Implementar sistemas de monitoreo y alertas para detectar y notificar sobre fallos del sistema.

### Beneficios

- **Alta Disponibilidad:** El sistema permanece operativo incluso en caso de fallo de uno de los servidores.

- **Balanceo de Carga:** ProxySQL distribuye las conexiones de manera eficiente entre los servidores.

- **Recuperación Automática:** Keepalived gestiona automáticamente la asignación de la VIP, asegurando una rápida recuperación.

Esta implementación asegura que el sistema MySQL esté siempre disponible y operativo, proporcionando una solución robusta ante fallos del servidor.

---

## Implementar failover y failback

**Asegurar que la base de datos pueda cambiar automáticamente a un servidor de respaldo en caso de fallo (failover) y retornar al servidor principal cuando se recupere (failback).**

Claro, aquí tienes una explicación detallada en formato Markdown sobre cómo implementar failover y failback para un sistema MySQL utilizando dos VPS.

### Objetivo\_

Asegurar que la base de datos pueda cambiar automáticamente a un servidor de respaldo en caso de fallo (failover) y retornar al servidor principal cuando se recupere (failback).

### Arquitectura del Clúster\_

#### Componentes\_

1. **VPS1 (Servidor MySQL Principal)**
2. **VPS2 (Servidor MySQL Secundario)**
3. **ProxySQL**: Un proxy para MySQL que se encargará de distribuir las conexiones entre los servidores y gestionar el failover y failback.
4. **Keepalived**: Proporciona una dirección IP virtual (VIP) que será compartida entre los servidores para asegurar que siempre haya una instancia disponible para recibir tráfico.

#### Funcionamiento General\_

1. **Replicación MySQL:**

   - Configurar la replicación asíncrona de MySQL entre VPS1 (maestro) y VPS2 (esclavo).
   - Asegurar que VPS2 esté siempre sincronizado con VPS1 para que pueda tomar el control en caso de fallo.

2. **ProxySQL:**

   - Instalar y configurar ProxySQL en ambas VPS para gestionar la distribución de cargas y el failover.
   - ProxySQL detecta si el servidor principal (VPS1) falla y redirige el tráfico al servidor secundario (VPS2).
   - ProxySQL también gestiona el failback, redirigiendo el tráfico de vuelta a VPS1 una vez que se recupere.

3. **Keepalived:**
   - Configurar Keepalived en ambas VPS para gestionar la dirección IP virtual (VIP).
   - La VIP se asignará dinámicamente al servidor activo (inicialmente VPS1).
   - En caso de fallo de VPS1, Keepalived asignará la VIP a VPS2.

### Pasos de Implementación\_

#### Paso 1: Configurar MySQL en ambas VPS\_

1. **Instalar MySQL:** Instalar MySQL en VPS1 y VPS2.

2. **Configurar MySQL para Replicación:**
   - Configurar VPS1 como maestro.
   - Configurar VPS2 como esclavo.

#### Paso 2: Configurar ProxySQL en ambas VPS\_

1. **Instalar ProxySQL:** Instalar ProxySQL en ambas VPS.

2. **Configurar ProxySQL para Alta Disponibilidad:**
   - Definir los servidores de backend (VPS1 y VPS2).
   - Configurar reglas de failover y failback.

#### Paso 3: Configurar Keepalived en ambas VPS\_

1. **Instalar Keepalived:** Instalar Keepalived en ambas VPS.

2. **Configurar Keepalived para la VIP:**
   - Crear un archivo de configuración de Keepalived en ambas VPS.
   - Definir la VIP y los scripts de chequeo de salud para los servidores MySQL.

#### Ejemplo de Flujo de Trabajo\_

##### Operación Normal

1. **VPS1 está activo y manejando las solicitudes:**
   - Los clientes se conectan a la VIP.
   - ProxySQL dirige el tráfico a VPS1.
   - VPS2 se mantiene sincronizado con VPS1.

##### Failover (Fallo del Servidor Principal)

1. **Detección del fallo:**

   - ProxySQL y Keepalived detectan que VPS1 no está disponible.
   - Keepalived asigna la VIP a VPS2.
   - ProxySQL redirige el tráfico a VPS2.

2. **Operación con el servidor de respaldo:**
   - VPS2 maneja todas las solicitudes entrantes.
   - VPS1 es reparado y reiniciado.

##### Failback (Recuperación del Servidor Principal)

1. **Restauración del servidor principal:**

   - VPS1 se reinicia y se resincroniza con VPS2.
   - ProxySQL detecta que VPS1 está disponible nuevamente.

2. **Redirigir el tráfico de vuelta al servidor principal:**
   - Keepalived reasigna la VIP a VPS1.
   - ProxySQL vuelve a dirigir el tráfico a VPS1.

#### Detalles de Configuración

##### Configuración de MySQL para Replicación

1. **En VPS1 (Maestro):**

   ```sql
   CREATE USER 'replica'@'%' IDENTIFIED BY 'replica_password';
   GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
   FLUSH PRIVILEGES;
   ```

2. **En VPS2 (Esclavo):**

   ```sql
   CHANGE MASTER TO MASTER_HOST='VPS1_IP', MASTER_USER='replica', MASTER_PASSWORD='replica_password', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS= 4;
   START SLAVE;
   ```

##### Configuración de ProxySQL

1. **Agregar backends:**

   ```sql
   INSERT INTO mysql_servers (hostgroup_id, hostname, port, weight) VALUES (0, 'VPS1_IP', 3306, 1);
   INSERT INTO mysql_servers (hostgroup_id, hostname, port, weight) VALUES (0, 'VPS2_IP', 3306, 1);
   ```

2. **Configurar failover:**

   ```sql
   UPDATE mysql_servers SET max_connections = 1000 WHERE hostgroup_id = 0;
   LOAD MYSQL SERVERS TO RUNTIME;
   SAVE MYSQL SERVERS TO DISK;
   ```

##### Configuración de Keepalived

1. **Archivo de configuración (keepalived.conf) en ambas VPS:**

   ```plaintext
   vrrp_instance VI_1 {
       state MASTER
       interface eth0
       virtual_router_id 51
       priority 100
       advert_int 1
       authentication {
           auth_type PASS
           auth_pass password
       }
       virtual_ipaddress {
           192.168.0.100
       }
       track_script {
           chk_mysql
       }
   }

   vrrp_script chk_mysql {
       script "pidof mysqld"
       interval 2
   }
   ```

2. **Diferencias en configuración:**
   - En VPS2, `state` debe ser `BACKUP` y `priority` debe ser menor que en VPS1.

#### Monitoreo y Mantenimiento

1. **Monitoreo Continuo:**

   - Implementar sistemas de monitoreo como Prometheus y Grafana para supervisar la salud de los servidores MySQL, ProxySQL y Keepalived.

2. **Pruebas Periódicas:**

   - Realizar pruebas periódicas de failover y failback para asegurar que el sistema funcione correctamente en caso de fallos.

3. **Actualizaciones y Mantenimiento:**
   - Mantener actualizado el software de MySQL, ProxySQL y Keepalived.
   - Realizar mantenimientos programados con notificaciones adecuadas a los usuarios.

---

Esta configuración asegura que tu sistema MySQL esté siempre disponible y operativo, proporcionando una solución robusta para el failover y failback.

## Asegurar la integridad y consistencia de los datos

Los datos deben estar sincronizados entre los servidores principal y de respaldo.

Para simplificar y evitar la creación de múltiples triggers para cada tabla, puedes utilizar un procedimiento almacenado (stored procedure) que maneje las operaciones CRUD y registre automáticamente las acciones en la tabla `registro_operaciones`. Esto reduce la duplicación de código y facilita el mantenimiento. Aquí te mostraré cómo implementar esto usando un procedimiento almacenado en MySQL.

### Paso 1: Crear la Tabla de Registro

Primero, crea la tabla `registro_operaciones` si aún no la tienes:

```sql
CREATE TABLE registro_operaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabla VARCHAR(50),
    operacion VARCHAR(50),
    id_registro INT,
    usuario VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalles TEXT
);
```

### Paso 2: Crear el Procedimiento Almacenado

A continuación, crea un procedimiento almacenado que maneje todas las operaciones CRUD para las tablas `usuarios`, `productos`, `clientes` y `proveedores`. Este procedimiento almacenado utilizará parámetros dinámicos para identificar la tabla y los detalles de la operación.

```sql
DELIMITER //

CREATE PROCEDURE registrar_operacion(
    IN tabla_name VARCHAR(50),
    IN operacion_type VARCHAR(50),
    IN id_registro INT,
    IN detalles_text TEXT
)
BEGIN
    DECLARE user_name VARCHAR(50);

    -- Obtiene el nombre del usuario actual
    SELECT USER() INTO user_name;

    -- Inserta el registro en la tabla registro_operaciones
    INSERT INTO registro_operaciones (tabla, operacion, id_registro, usuario, detalles)
    VALUES (tabla_name, operacion_type, id_registro, user_name, detalles_text);
END //

DELIMITER ;
```

### Paso 3: Crear Triggers para las Tablas

Después de crear el procedimiento almacenado, ahora puedes crear triggers simples en cada tabla para llamar al procedimiento almacenado cuando se realice una operación CRUD.

#### Ejemplo para la Tabla `tbl_Producto`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_Producto_insert
AFTER INSERT ON tbl_Producto
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Producto', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_Producto_update
AFTER UPDATE ON tbl_Producto
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Producto', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_Producto_delete
AFTER DELETE ON tbl_Producto
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Producto', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_ProductUnidPrecioVenta`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_ProductUnidPrecioVenta_insert
AFTER INSERT ON tbl_ProductUnidPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ProductUnidPrecioVenta', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_ProductUnidPrecioVenta_update
AFTER UPDATE ON tbl_ProductUnidPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ProductUnidPrecioVenta', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_ProductUnidPrecioVenta_delete
AFTER DELETE ON tbl_ProductUnidPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ProductUnidPrecioVenta', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_Sub_Categoria`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_Sub_Categoria_insert
AFTER INSERT ON tbl_Sub_Categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Sub_Categoria', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_Sub_Categoria_update
AFTER UPDATE ON tbl_Sub_Categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Sub_Categoria', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_Sub_Categoria_delete
AFTER DELETE ON tbl_Sub_Categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Sub_Categoria', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_categoria`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_categoria_insert
AFTER INSERT ON tbl_categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_categoria', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_categoria_update
AFTER UPDATE ON tbl_categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_categoria', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_categoria_delete
AFTER DELETE ON tbl_categoria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_categoria', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_proveedor`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_proveedor_insert
AFTER INSERT ON tbl_proveedor
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_proveedor', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_proveedor_update
AFTER UPDATE ON tbl_proveedor
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_proveedor', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_proveedor_delete
AFTER DELETE ON tbl_proveedor
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_proveedor', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_compra`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_compra_insert
AFTER INSERT ON tbl_compra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_compra', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_compra_update
AFTER UPDATE ON tbl_compra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_compra', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_compra_delete
AFTER DELETE ON tbl_compra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_compra', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_DetalleCompra`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_DetalleCompra_insert
AFTER INSERT ON tbl_DetalleCompra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleCompra', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleCompra_update
AFTER UPDATE ON tbl_DetalleCompra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleCompra', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleCompra_delete
AFTER DELETE ON tbl_DetalleCompra
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleCompra', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_bodega`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_bodega_insert
AFTER INSERT ON tbl_bodega
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_bodega', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_bodega_update
AFTER UPDATE ON tbl_bodega
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_bodega', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_bodega_delete
AFTER DELETE ON tbl_bodega
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_bodega', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_CajaDiaria`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_CajaDiaria_insert
AFTER INSERT ON tbl_CajaDiaria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CajaDiaria', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_CajaDiaria_update
AFTER UPDATE ON tbl_CajaDiaria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CajaDiaria', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_CajaDiaria_delete
AFTER DELETE ON tbl_CajaDiaria
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CajaDiaria', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_calculoPrecioVenta`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_calculoPrecioVenta_insert
AFTER INSERT ON tbl_calculoPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_calculoPrecioVenta', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_calculoPrecioVenta_update
AFTER UPDATE ON tbl_calculoPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_calculoPrecioVenta', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_calculoPrecioVenta_delete
AFTER DELETE ON tbl_calculoPrecioVenta
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_calculoPrecioVenta', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_cliente`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_cliente_insert
AFTER INSERT ON tbl_cliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cliente', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_cliente_update
AFTER UPDATE ON tbl_cliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cliente', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_cliente_delete
AFTER DELETE ON tbl_cliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cliente', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_ControlArqueo`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_ControlArqueo_insert
AFTER INSERT ON tbl_ControlArqueo
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueo', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_ControlArqueo_update
AFTER UPDATE ON tbl_ControlArqueo
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueo', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_ControlArqueo_delete
AFTER DELETE ON tbl_ControlArqueo
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueo', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_ControlArqueoCierre`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_ControlArqueoCierre_insert
AFTER INSERT ON tbl_ControlArqueoCierre
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueoCierre', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_ControlArqueoCierre_update
AFTER UPDATE ON tbl_ControlArqueoCierre
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueoCierre', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_ControlArqueoCierre_delete
AFTER DELETE ON tbl_ControlArqueoCierre
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_ControlArqueoCierre', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_CuentaPorPagar`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_CuentaPorPagar_insert
AFTER INSERT ON tbl_CuentaPorPagar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CuentaPorPagar', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_CuentaPorPagar_update
AFTER UPDATE ON tbl_CuentaPorPagar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CuentaPorPagar', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_CuentaPorPagar_delete
AFTER DELETE ON tbl_CuentaPorPagar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_CuentaPorPagar', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_cuentasPorCobrar`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_cuentasPorCobrar_insert
AFTER INSERT ON tbl_cuentasPorCobrar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cuentasPorCobrar', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_cuentasPorCobrar_update
AFTER UPDATE ON tbl_cuentasPorCobrar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cuentasPorCobrar', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_cuentasPorCobrar_delete
AFTER DELETE ON tbl_cuentasPorCobrar
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_cuentasPorCobrar', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_DetalleDevolucionCliente`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_DetalleDevolucionCliente_insert
AFTER INSERT ON tbl_DetalleDevolucionCliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleDevolucionCliente', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleDevolucionCliente_update
AFTER UPDATE ON tbl_DetalleDevolucionCliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleDevolucionCliente', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleDevolucionCliente_delete
AFTER DELETE ON tbl_DetalleDevolucionCliente
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleDevolucionCliente', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_DetallePagoCredito`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_DetallePagoCredito_insert
AFTER INSERT ON tbl_DetallePagoCredito
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetallePagoCredito', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetallePagoCredito_update
AFTER UPDATE ON tbl_DetallePagoCredito
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetallePagoCredito', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetallePagoCredito_delete
AFTER DELETE ON tbl_DetallePagoCredito
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetallePagoCredito', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_detallePedido`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_detallePedido_insert
AFTER INSERT ON tbl_detallePedido
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detallePedido', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_detallePedido_update
AFTER UPDATE ON tbl_detallePedido
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detallePedido', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_detallePedido_delete
AFTER DELETE ON tbl_detallePedido
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detallePedido', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_DetalleProforma`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_DetalleProforma_insert
AFTER INSERT ON tbl_DetalleProforma
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleProforma', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleProforma_update
AFTER UPDATE ON tbl_DetalleProforma
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleProforma', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleProforma_delete
AFTER DELETE ON tbl_DetalleProforma
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleProforma', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_DetalleSalida`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_DetalleSalida_insert
AFTER INSERT ON tbl_DetalleSalida
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleSalida', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleSalida_update
AFTER UPDATE ON tbl_DetalleSalida
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleSalida', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_DetalleSalida_delete
AFTER DELETE ON tbl_DetalleSalida
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_DetalleSalida', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_detalleTraslado`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_detalleTraslado_insert
AFTER INSERT ON tbl_detalleTraslado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detalleTraslado', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_detalleTraslado_update
AFTER UPDATE ON tbl_detalleTraslado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detalleTraslado', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_detalleTraslado_delete
AFTER DELETE ON tbl_detalleTraslado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_detalleTraslado', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_Documentos`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_Documentos_insert
AFTER INSERT ON tbl_Documentos
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Documentos', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_Documentos_update
AFTER UPDATE ON tbl_Documentos
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Documentos', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_Documentos_delete
AFTER DELETE ON tbl_Documentos
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_Documentos', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```

#### Ejemplo para la Tabla `tbl_empleado`

```sql
DELIMITER //

CREATE TRIGGER after_tbl_empleado_insert
AFTER INSERT ON tbl_empleado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_empleado', 'INSERT', NEW.id, CONCAT('Insertado registro con ID: ', NEW.id, ' y detalles: ', NEW.nombre, ', ', NEW.email));
END //

CREATE TRIGGER after_tbl_empleado_update
AFTER UPDATE ON tbl_empleado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_empleado', 'UPDATE', OLD.id, CONCAT('Actualizado registro con ID: ', OLD.id, ' de: ', OLD.nombre, ' a: ', NEW.nombre, ', ', OLD.email, ' a: ', NEW.email));
END //

CREATE TRIGGER after_tbl_empleado_delete
AFTER DELETE ON tbl_empleado
FOR EACH ROW
BEGIN
    CALL registrar_operacion('tbl_empleado', 'DELETE', OLD.id, CONCAT('Eliminado registro con ID: ', OLD.id, ' y detalles: ', OLD.nombre, ', ', OLD.email));
END //

DELIMITER ;
```
