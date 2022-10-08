--HECHO POR ADRIÁN JARAMILLO RODRÍGUEZ 1º ASIR

-- 1.
--Inserta en la tabla "Programas" el sistema operativo Windows 10 Professional.
INSERT INTO PROGRAMAS
  VALUES (21, 'Windows', 'Professional');

-- 2.
--Crea una tabla llamada "Microsoft" con la misma estructura que la tabla "Programas". Inserta en ella sólo
--aquellos programas del fabricante "Microsoft".

CREATE TABLE MICROSOFT (
  CODIGO NUMBER(2,0) CONSTRAINT PK_MICROSOFT PRIMARY KEY,
  NOMBRE VARCHAR2(30),
  VERSION VARCHAR2(30)
);

INSERT INTO MICROSOFT
  SELECT *
    FROM PROGRAMAS P
    WHERE P.CODIGO IN (SELECT D.CODIGO
                        FROM DESARROLLA D
                        WHERE D.ID_FAB = (SELECT F.ID_FAB
                                            FROM FABRICANTE F
                                            WHERE UPPER(F.NOMBRE) = 'MICROSOFT'));


-- 3.
--Inserta en la tabla "Registra" las filas correspondientes a los registros que haría el cliente con DNI "5" para
--cada uno de los programas que podría comprar en "El Corte Inglés" de Sevilla. Los registros los haría por Internet.
INSERT INTO REGISTRA
  SELECT C.CIF, 5, D.CODIGO, 'Internet' -- Se usan campos fijos, porque sabemos que estarán siempre, y luego se obtienen los datos de donde están los datos variables
    FROM COMERCIO C
    INNER JOIN DISTRIBUYE D ON C.CIF = D.CIF
    WHERE 
      UPPER(C.NOMBRE) = 'EL CORTE INGLES' 
      AND 
      UPPER(C.CIUDAD) = 'SEVILLA';


-- 4.
--Añade a la tabla "Programas" una columna llamada "registros" de tipo number. A continuación, para cada programa, escribe 
--en esta columna el número de registros que se han realizado del mismo, independientemente del medio utilizado para ello
--(Internet, teléfono o Tarjeta postal).
ALTER TABLE PROGRAMAS ADD REGISTROS NUMBER(10);

UPDATE PROGRAMAS P
  SET P.REGISTROS =
  (SELECT COUNT(R.CODIGO)
    FROM REGISTRA R
    WHERE R.CODIGO = P.CODIGO);

-- 5.
--Añade ahora a la tabla "Programas" tres columnas más: "registros_i", "registros_t" y "registros_p". Actualiza cada una con
--el número de registros que se han realizado por cada medio (Internet, Teléfono y Tarjeta postal).
ALTER TABLE PROGRAMAS ADD REGISTROS_I NUMBER(10);
ALTER TABLE PROGRAMAS ADD REGISTROS_T NUMBER(10);
ALTER TABLE PROGRAMAS ADD REGISTROS_P NUMBER(10);

UPDATE PROGRAMAS P
  SET P.REGISTROS_I = (SELECT COUNT(R.CODIGO)
                        FROM REGISTRA R
                        WHERE
                          UPPER(R.MEDIO) = 'INTERNET'
                          AND
                          R.CODIGO = P.CODIGO),
  P.REGISTROS_T = (SELECT COUNT(R.CODIGO)
                        FROM REGISTRA R
                        WHERE
                          UPPER(R.MEDIO) = 'TELEFONO'
                          AND
                          R.CODIGO = P.CODIGO),
  P.REGISTROS_P = (SELECT COUNT(R.CODIGO)
                        FROM REGISTRA R
                        WHERE
                          UPPER(R.MEDIO) = 'TARJETA POSTAL'
                          AND
                          R.CODIGO = P.CODIGO);

-- 6.
--Añade a la tabla "Clientes" una columna llamada "registrados" de tipo number que deberás actualizar con el número de registros que ha
--efectuado el cliente, independientemente del medio por el que lo haya hecho.
ALTER TABLE CLIENTES ADD REGISTRADOS NUMBER(10);

UPDATE CLIENTES C
  SET C.REGISTRADOS = (SELECT COUNT(R.DNI)
                      FROM REGISTRA R
                      WHERE R.DNI = C.DNI);
