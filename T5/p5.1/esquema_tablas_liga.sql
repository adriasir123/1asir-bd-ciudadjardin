--CREAMOS TABLAS Y CLAVES PRIMARIAS

CREATE TABLE PRESIDENTES(
	DNI				VARCHAR2(9) CONSTRAINT PK_PRESIDENTES PRIMARY KEY,
	NOMBRE			VARCHAR2(30),
	APELLIDOS		VARCHAR2(50),
	FECHAELECION	DATE,
	FECHANACIMIENTO	DATE,
	CODIGOEQUIPO	VARCHAR2(4)
	--ALTER TABLE PRESIDENTES ADD CONSTRAINT FK_PRESIDENTES_EQUIPOS FOREIGN KEY (CODIGOEQUIPO) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;

);

CREATE TABLE EQUIPOS(
	CODIGO			VARCHAR2(4)		CONSTRAINT PK_EQUIPOS PRIMARY KEY,
	NOMBRE			VARCHAR2(50),
	ESTADIO			VARCHAR2(50),
	AFORO			NUMBER,
	ANNODEFUNDACION	DATE,
	CIUDAD			VARCHAR2(30)
);

CREATE TABLE JUGADORES(
	CODIGO			VARCHAR2(4)		CONSTRAINT PK_JUGADORES PRIMARY KEY,
	NOMBRE			VARCHAR2(30),
	FECHANACIMIENTO	DATE,			
	POSICION		VARCHAR2(15),
	CODIGOEQUIPO	VARCHAR2(4)
	--ALTER TABLE JUGADORES ADD CONSTRAINT FK_JUGADORES_EQUIPOS FOREIGN KEY (CODIGOEQUIPO) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;

);

CREATE TABLE GOLES(
	CODIGOPARTIDO	VARCHAR2(4),
	--ALTER TABLE GOLES ADD CONSTRAINT FK_GOLES_PARTIDOS FOREIGN KEY (CODIGOPARTIDO) REFERENCES PARTIDOS(CODIGO) ON DELETE CASCADE;
	CODIGOJUGADOR	VARCHAR2(4),
	--ALTER TABLE GOLES ADD CONSTRAINT FK_GOLES_JUGADORES FOREIGN KEY (CODIGOJUGADOR) REFERENCES JUGADORES(CODIGO) ON DELETE CASCADE;
	MINUTO			NUMBER,
	DESCRIPCION		VARCHAR2(100),
	CONSTRAINT PK_GOLES PRIMARY KEY (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO)
);

CREATE TABLE PARTIDOS(
	CODIGO			VARCHAR2(4)		CONSTRAINT PK_PARTIDOS PRIMARY KEY,
	FECHA			DATE,
	CODIGOEQUIPOVISITANTE	VARCHAR2(4),
	--ALTER TABLE PARTIDOS ADD CONSTRAINT FK_PARTIDOS_EQUIVISIT FOREIGN KEY (CODIGOEQUIPOVISITANTE) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;
	CODIGOEQUIPOLOCAL		VARCHAR2(4),
	--ALTER TABLE PARTIDOS ADD CONSTRAINT FK_PARTIDOS_EQUILOCAL FOREIGN KEY (CODIGOEQUIPOLOCAL) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;
);

--AÑADIENDO LAS CLAVES FORANEAS
ALTER TABLE PRESIDENTES ADD CONSTRAINT FK_PRESIDENTES_EQUIPOS FOREIGN KEY (CODIGOEQUIPO) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;
ALTER TABLE JUGADORES ADD CONSTRAINT FK_JUGADORES_EQUIPOS FOREIGN KEY (CODIGOEQUIPO) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;
ALTER TABLE GOLES ADD CONSTRAINT FK_GOLES_JUGADORES FOREIGN KEY (CODIGOJUGADOR) REFERENCES JUGADORES(CODIGO) ON DELETE CASCADE;
ALTER TABLE GOLES ADD CONSTRAINT FK_GOLES_PARTIDOS FOREIGN KEY (CODIGOPARTIDO) REFERENCES PARTIDOS(CODIGO) ON DELETE CASCADE;
ALTER TABLE PARTIDOS ADD CONSTRAINT FK_PARTIDOS_EQUILOCAL FOREIGN KEY (CODIGOEQUIPOLOCAL) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;
ALTER TABLE PARTIDOS ADD CONSTRAINT FK_PARTIDOS_EQUIVISIT FOREIGN KEY (CODIGOEQUIPOVISITANTE) REFERENCES EQUIPOS(CODIGO) ON DELETE CASCADE;