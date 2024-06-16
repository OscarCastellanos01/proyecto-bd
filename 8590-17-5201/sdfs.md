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
