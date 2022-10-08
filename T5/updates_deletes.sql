--CON UPDATE ESTAMOS HABLANDO DE ACTUALIZAR CAMPOS CONCRETOS CON VALORES CONCRETOS
--CON WHERE ESPECIFICAMOS EL REGISTRO EN CONCRETO DE LOS QUE QUEREMOS ACTUALIZAR ESTOS DATOS
UPDATE EMPLOYEES
    SET SALARY = 1000
    WHERE EMPLOYEE_ID = 100 OR
        EMPLOYEE_ID = 111;

--CON DELETE SIEMPRE ESTAMOS HABLANDO DE REGISTROS COMPLETOS
DELETE [FROM] NOMBRE_TABLA --El from es opcional

DELETE FROM EMPLOYEES --Si no filtramos con where, borramos todos los registros

-- TRANSACCIONES SQL
--Se llaman transacciones a un conjunto de órdenes, algo que estamos haciendo seguido 

COMMIT Y ROLLBACK
--COMMIT: los cambios que hayamos ejecutado, se guardan realmente
--ROLLBACK: los cambios que hayamos ejecutado, no se guardan, se descartan (es algo así como un ctrl+z)

--COMMIT EXPLÍCITO (el que hacemos nosotros directamente con la orden commit)
--COMMIT IMPLÍCITO (no hacemos un commit directamente, pero hay ciertas órdenes que ejecutan commit, como disconnect, etc)

SET AUTOCOMMIT ON
SET AUTOCOMMIT OFF (default, y más seguro)
SHOW AUTOCOMMIT --Ver cómo tenemos configurada la función de autocommit


ON DELETE SET NULL --cuando se borren los registros de donde venga la clave, en vez de borrarse en cascada, se deja a null