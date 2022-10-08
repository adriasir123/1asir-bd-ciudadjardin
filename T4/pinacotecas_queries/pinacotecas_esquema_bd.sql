CREATE TABLE PINACOTECAS(
ID_PINACOTECA VARCHAR2(5),
NOMBRE VARCHAR2(40),
DIRECCION VARCHAR2(40),
CIUDAD VARCHAR2(30),
PAIS VARCHAR2(30),
SUPERFICIE NUMBER(6)
);
-- HE CAMBIADO TIPOS DE DATOS DE F_PINTADO Y DIMENSIONES
CREATE TABLE CUADROS(
ID_CUADRO VARCHAR2(5),
N_CUADRO VARCHAR2(75),
ANCHO VARCHAR2(10),
ALTO VARCHAR2(10),
F_PINTADO VARCHAR2(20),
TECNICA VARCHAR2(35),
FK_PINAC VARCHAR2(5)
);
CREATE TABLE PINTORES(
ID_PINTOR VARCHAR2(5),
N_PINTOR VARCHAR2(60),
CIUDAD VARCHAR2(35),
PAIS VARCHAR2(25),
FECHA_N DATE,
FECHA_F DATE
);
CREATE TABLE MECENAS(
ID_MECENAS VARCHAR2(5),
N_MECENAS VARCHAR2(30),
CIUDAD_NAC VARCHAR2(30),
PAIS VARCHAR2(25)
);
CREATE TABLE ESCUELAS(
ID_ESCUELA VARCHAR2(5),
N_ESCUELA VARCHAR2(30),
PAIS VARCHAR2(25),
FECHA_APARICION DATE
);
CREATE TABLE CUADROS_PINTORES(
ID_FK_CUADRO VARCHAR2(5),
FK_PINTOR VARCHAR2(5)
);
CREATE TABLE PINTORES_ESCUELAS(
ID_FK_PINTOR VARCHAR2(5),
FK_ESCUELA VARCHAR2(5)
);
CREATE TABLE MECENAZGO(
ID_FK_PINTOR VARCHAR2(5),
ID_FK_MECENAS VARCHAR2(5),
ID_FECHA_INICIO DATE,
FECHA_FINAL DATE
);
CREATE TABLE MAESTROS(
ID_FK_PINTOR VARCHAR2(5),
FK_MAESTRO VARCHAR2(5)
);

-- CREAR CLAVES PRIMARIAS
ALTER TABLE PINACOTECAS			ADD CONSTRAINT PK_PINACOTECAS			PRIMARY KEY (ID_PINACOTECA);
ALTER TABLE CUADROS				ADD CONSTRAINT PK_CUADROS				PRIMARY KEY (ID_CUADRO);
ALTER TABLE PINTORES			ADD CONSTRAINT PK_PINTORES				PRIMARY KEY (ID_PINTOR);
ALTER TABLE ESCUELAS			ADD CONSTRAINT PK_ESCUELAS				PRIMARY KEY (ID_ESCUELA);
ALTER TABLE MECENAS				ADD CONSTRAINT PK_MECENAS				PRIMARY KEY (ID_MECENAS);
ALTER TABLE MECENAZGO			ADD CONSTRAINT PK_MECENAZGO				PRIMARY KEY (ID_FK_PINTOR,ID_FK_MECENAS,ID_FECHA_INICIO);
ALTER TABLE MAESTROS			ADD CONSTRAINT PK_MAESTRO				PRIMARY KEY (ID_FK_PINTOR);
ALTER TABLE PINTORES_ESCUELAS	ADD CONSTRAINT PK_PINTORES_ESCUELAS		PRIMARY KEY (ID_FK_PINTOR);
ALTER TABLE CUADROS_PINTORES	ADD CONSTRAINT PK_CUADROS_PINTORES		PRIMARY KEY (ID_FK_CUADRO);

-- CREAR CLAVES FOR�NEAS
ALTER TABLE CUADROS				ADD CONSTRAINT FK_CUADROS_PINACOTECAS	FOREIGN KEY (FK_PINAC)		REFERENCES PINACOTECAS;
ALTER TABLE MECENAZGO			ADD CONSTRAINT FK_MECENAZGO_PINTORES	FOREIGN KEY (ID_FK_PINTOR)	REFERENCES PINTORES;
ALTER TABLE MECENAZGO			ADD CONSTRAINT FK_MECENAZGO_MECENAS		FOREIGN KEY (ID_FK_MECENAS)	REFERENCES MECENAS;
ALTER TABLE MAESTROS			ADD CONSTRAINT FK_MAESTROS_PINTORES_P	FOREIGN KEY (ID_FK_PINTOR)	REFERENCES PINTORES;
ALTER TABLE MAESTROS			ADD CONSTRAINT FK_MAESTROS_PINTORES_M	FOREIGN KEY (FK_MAESTRO)	REFERENCES PINTORES;
ALTER TABLE PINTORES_ESCUELAS	ADD CONSTRAINT FK_PINTORES_ESCUELAS_P	FOREIGN KEY (ID_FK_PINTOR)	REFERENCES PINTORES;
ALTER TABLE PINTORES_ESCUELAS	ADD CONSTRAINT FK_PINTORES_ESCUELAS_E	FOREIGN KEY (FK_ESCUELA)	REFERENCES ESCUELAS;
ALTER TABLE CUADROS_PINTORES	ADD CONSTRAINT FK_PINTORES_ESCUELAS_C	FOREIGN KEY (ID_FK_CUADRO)	REFERENCES CUADROS;
ALTER TABLE CUADROS_PINTORES	ADD CONSTRAINT FK_PINTORES_ESCUELAS_PIN	FOREIGN KEY (FK_PINTOR)		REFERENCES PINTORES;