--HECHO POR ADRIÁN JARAMILLO RODRÍGUEZ--


--========================--
--||PARTE DE ALTER TABLE||--
--========================--


--1 Borrar la tabla PINTORES.
DROP TABLE PINTORES CASCADE CONSTRAINTS;
COMMIT;

--2 Mostrar las restricciones del usuario "select constraint_name, constraint_type, table_name from user_constraints;" y comprobar si hay algo extraño. 

--> Sí, en el lugar donde antes estaba registrada la constraint de pintores, ahora hay un registro que parece estar "encriptado" 

--3 Buscar información en la red sobre purge. Para ello emplear las palabras clave purge oracle:
		--> Información buscada
	-- Escribir el comando"purge recyclebin".
		--> Hecho
    -- Por último volver a mostrar las restricciones del usuario y comparar el listado con el anterior.
		--> El registro de constraint se ha borrado correctamente



--4 Cambiar el nombre de la tabla CUADROS por OBRAS. Comprobar que el cambio se ha efectuado.
ALTER TABLE CUADROS RENAME TO OBRAS;
COMMIT;
-- Comprobación del cambio
select table_name from user_tables;

--5 Volver a crear la tabla PINTORES y las restricciones que fueron afectadas.
CREATE TABLE PINTORES
(
ID_PINTORES NUMBER(10),
N_PINTOR VARCHAR2(15),	
CIUDAD VARCHAR2(15),
PAIS VARCHAR2(15),
FECHA_N DATE,
FECHA_F DATE,
CONSTRAINT pk_pintores PRIMARY KEY (ID_PINTORES)
);
COMMIT;

--6 Añadir a la tabla ESCUELAS un nuevo atributo (columna), llamado NUEVA_COL y de tipo VARCHAR2(15).
ALTER TABLE ESCUELAS ADD
NUEVA_COL VARCHAR2(15);
COMMIT;

--7 Cambiar la longitud del tipo de dato de la columna añadida a VARCHAR2(25).
ALTER TABLE ESCUELAS MODIFY NUEVA_COL VARCHAR2(25);
COMMIT;

--8 En la tabla ESCUELAS cambiar el nombre de la columna N_ESCUELA por NOMBRE_ESCUELA.
ALTER TABLE ESCUELAS RENAME COLUMN N_ESCUELA TO NOMBRE_ESCUELA;
COMMIT;

--9 Volver a cambiar el nombre de la columna modificada anteriormente a N_ESCUELA.
ALTER TABLE ESCUELAS RENAME COLUMN NOMBRE_ESCUELA TO N_ESCUELA;
COMMIT;

--==========================--
--||PARTE DE RESTRICCIONES||--
--==========================--

--1 Listar nombre, tipo y tabla en la que se han definido las restricciones del usuario.

select constraint_name, constraint_type, table_name from user_constraints;

--2 En todas las claves foraneas, para que se cumpla la integridad referencial, añadir ON DELETE CASCADE.

ALTER TABLE CUADROS DROP CONSTRAINT fk_cuadros;
ALTER TABLE CUADROS ADD CONSTRAINT fk_cuadros FOREIGN KEY (FK_PINACOTECAS) REFERENCES PINACOTECAS (ID_PINACOTECA) ON DELETE CASCADE;


ALTER TABLE CUADROS_PINTORES DROP CONSTRAINT fk1_cuadros_cp;
ALTER TABLE CUADROS_PINTORES DROP CONSTRAINT fk2_pintores_cp;
ALTER TABLE CUADROS_PINTORES ADD CONSTRAINT fk1_cuadros_cp FOREIGN KEY (ID_FK_CUADRO) REFERENCES CUADROS (ID_CUADRO) ON DELETE CASCADE;
ALTER TABLE CUADROS_PINTORES ADD CONSTRAINT fk2_pintores_cp FOREIGN KEY (FK_PINTOR) REFERENCES PINTORES (ID_PINTORES) ON DELETE CASCADE;


ALTER TABLE PINTORES_ESCUELAS DROP CONSTRAINT fk1_pintores_escuelas;
ALTER TABLE PINTORES_ESCUELAS DROP CONSTRAINT fk2_pintores_escuelas;
ALTER TABLE PINTORES_ESCUELAS ADD CONSTRAINT fk1_pintores_escuelas FOREIGN KEY(ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES) ON DELETE CASCADE;
ALTER TABLE PINTORES_ESCUELAS ADD CONSTRAINT fk2_pintores_escuelas FOREIGN KEY (FK_ESCUELA) REFERENCES ESCUELAS (ID_ESCUELA) ON DELETE CASCADE;


ALTER TABLE MECENAZGO DROP CONSTRAINT fk1_mecenazgo;
ALTER TABLE MECENAZGO DROP CONSTRAINT fk2_mecenazgo;
ALTER TABLE MECENAZGO ADD CONSTRAINT fk1_mecenazgo FOREIGN KEY (ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES) ON DELETE CASCADE;
ALTER TABLE MECENAZGO ADD CONSTRAINT fk2_mecenazgo FOREIGN KEY (ID_FK_MECENAS) REFERENCES MECENAS (ID_MECENAS) ON DELETE CASCADE;


ALTER TABLE MAESTROS DROP CONSTRAINT fk1_maestros;
ALTER TABLE MAESTROS DROP CONSTRAINT fk2_maestros;
ALTER TABLE MAESTROS ADD CONSTRAINT fk1_maestros FOREIGN KEY (ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES);
ALTER TABLE MAESTROS ADD CONSTRAINT fk2_maestros FOREIGN KEY (FK_MAESTRO) REFERENCES PINTORES (ID_PINTORES);


--3 Añadir la restricción necesaria para que en la tabla CUADROS, N_CUADRO, ANCHO Y ALTO no puedan tomar valores nulos.
ALTER TABLE CUADROS MODIFY N_CUADRO VARCHAR2(15) NOT NULL;
ALTER TABLE CUADROS MODIFY ANCHO NUMBER(5) NOT NULL;
ALTER TABLE CUADROS MODIFY ALTO NUMBER(5) NOT NULL;

--4 Añadir la restricción necesaria para que en la tabla PINACOTECAS, el nombre no pueda tomar valores nulos.
ALTER TABLE PINACOTECAS MODIFY NOMBRE VARCHAR2(15) NOT NULL;

--5 Añadir la restricción necesaria para que en la tabla PINTORES, N_PINTOR no pueda tomar valores nulos.
ALTER TABLE PINTORES MODIFY N_PINTOR VARCHAR2(15) NOT NULL;

--6 Añadir la restricción necesaria para que en la tabla ESCUELAS, N_ESCUELA no pueda tomar valores nulos.
ALTER TABLE ESCUELAS MODIFY N_ESCUELA VARCHAR2(50) NOT NULL;

--7 Añadir la restricción necesaria para que en la tabla MECENAS, N_MECENAS no pueda tomar valores nulos.
ALTER TABLE MECENAS MODIFY N_MECENAS VARCHAR2(50) NOT NULL;

--8 Añadir una restriccion de tipo check a la tabla ESCUELAS de tal forma que el campo PAIS sólo pueda contener los valores: Belgica, Espana, Holanda e Italia.
ALTER TABLE ESCUELAS ADD CONSTRAINT ck_escuelas CHECK (PAIS IN ('Belgica', 'Espana', 'Holanda', 'Italia'));



































