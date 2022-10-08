--HECHO POR ADRIÁN JARAMLLO RODRÍGUEZ

CREATE TABLE PINACOTECAS
(
ID_PINACOTECA NUMBER(10),
NOMBRE VARCHAR2(15),			
DIRECCION VARCHAR2(50),
CIUDAD VARCHAR2(15),
PAIS VARCHAR2(15),
SUPERFICIE NUMBER(10),
CONSTRAINT pk_pinacotecas PRIMARY KEY (ID_PINACOTECA)
);
COMMIT;

CREATE TABLE CUADROS
(
ID_CUADRO NUMBER(10),
N_CUADRO VARCHAR2(15),			
ANCHO NUMBER(5),
ALTO NUMBER(5),
F_PINTADO DATE,
TECNICA VARCHAR2(15),
FK_PINACOTECAS NUMBER(10),
CONSTRAINT pk_cuadros PRIMARY KEY (ID_CUADRO),
CONSTRAINT fk_cuadros FOREIGN KEY (FK_PINACOTECAS) REFERENCES PINACOTECAS (ID_PINACOTECA)
);
COMMIT;

CREATE TABLE PINTORES
(
ID_PINTORES	NUMBER(10),
N_PINTOR VARCHAR2(15),	
CIUDAD VARCHAR2(15),
PAIS VARCHAR2(15),
FECHA_N	DATE,
FECHA_F DATE,
CONSTRAINT pk_pintores PRIMARY KEY (ID_PINTORES)
);
COMMIT;

CREATE TABLE CUADROS_PINTORES
(
ID_FK_CUADRO NUMBER(10),
FK_PINTOR NUMBER(10),	
CONSTRAINT pk_cuadros_pintores PRIMARY KEY (ID_FK_CUADRO),
CONSTRAINT fk1_cuadros_cp FOREIGN KEY (ID_FK_CUADRO) REFERENCES CUADROS (ID_CUADRO),
CONSTRAINT fk2_pintores_cp FOREIGN KEY (FK_PINTOR) REFERENCES PINTORES (ID_PINTORES)
);
COMMIT;

CREATE TABLE ESCUELAS
(
ID_ESCUELA NUMBER(10),
N_ESCUELA VARCHAR2(50),
PAIS VARCHAR2(20),
FECHA_APARICION DATE,
CONSTRAINT pk_escuelas PRIMARY KEY (ID_ESCUELA)	
);
COMMIT;

CREATE TABLE PINTORES_ESCUELAS
(
ID_FK_PINTOR NUMBER(10),
FK_ESCUELA NUMBER(10),
CONSTRAINT pk_pintores_escuelas PRIMARY KEY (ID_FK_PINTOR),
CONSTRAINT fk1_pintores_escuelas FOREIGN KEY(ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES),
CONSTRAINT fk2_pintores_escuelas FOREIGN KEY (FK_ESCUELA) REFERENCES ESCUELAS (ID_ESCUELA)
);
COMMIT;

CREATE TABLE MECENAS
(
ID_MECENAS NUMBER(10),
N_MECENAS VARCHAR2(50),
CIUDAD_NAC VARCHAR2(50),
PAIS VARCHAR2(50),
CONSTRAINT pk_mecenas PRIMARY KEY (ID_MECENAS)
);
COMMIT;

CREATE TABLE MECENAZGO
(
ID_FK_PINTOR NUMBER(10),
ID_FK_MECENAS NUMBER(10),
ID_FECHA_INICIO DATE,
FECHA_FINAL DATE,
CONSTRAINT pks_mecenazgo PRIMARY KEY (ID_FK_PINTOR, ID_FK_MECENAS, ID_FECHA_INICIO),
CONSTRAINT fk1_mecenazgo FOREIGN KEY (ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES),
CONSTRAINT fk2_mecenazgo FOREIGN KEY (ID_FK_MECENAS) REFERENCES MECENAS (ID_MECENAS)
);
COMMIT;

CREATE TABLE MAESTROS
(
ID_FK_PINTOR NUMBER(10),
FK_MAESTRO NUMBER(10),
CONSTRAINT pk1_maestros PRIMARY KEY (ID_FK_PINTOR),
CONSTRAINT fk1_maestros FOREIGN KEY (ID_FK_PINTOR) REFERENCES PINTORES (ID_PINTORES),
CONSTRAINT fk2_maestros FOREIGN KEY (FK_MAESTRO) REFERENCES PINTORES (ID_PINTORES)
);
COMMIT;