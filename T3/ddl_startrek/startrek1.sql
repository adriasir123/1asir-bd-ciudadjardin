CREATE TABLESPACE STARTREK
DATAFILE
  'C:\ORACLE\EJEMPLOS\STARTREK\STARTREK-1.ORA' SIZE 1 M,
  'C:\ORACLE\EJEMPLOS\STARTREK\STARTREK-2.ORA' SIZE 500 K
DEFAULT STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 25);

CREATE USER STARTREK
IDENTIFIED BY STARTREK
DEFAULT TABLESPACE STARTREK;
COMMIT;
GRANT DBA TO STARTREK;
COMMIT;
GRANT CONNECT TO STARTREK;
CONNECT STARTREK;

-------------------------
------TABLA ACTORES------
-------------------------

CREATE TABLE Actores
(
Codigo NUMBER(10),
Nombre VARCHAR2(50) CONSTRAINT nn_nombre NOT NULL,			
Fecha DATE,
Nacionalidad VARCHAR2(20)
);
COMMIT;

--------------------------
------TABLA PLANETAS------
--------------------------

CREATE TABLE Planetas
(
Codigo NUMBER(10),
Galaxia VARCHAR2(50) CONSTRAINT nn_galaxia NOT NULL,			
Nombre VARCHAR2(50) CONSTRAINT nn_nombre NOT NULL
);
COMMIT;

---------------------------
------TABLA CAPÍTULOS------
---------------------------

CREATE TABLE Capitulos
(
Temporada NUMBER(10),
Orden NUMBER(10),
Titulo VARCHAR2(50) CONSTRAINT nn_titulo NOT NULL,
Fecha DATE CONSTRAINT nn_fecha NOT NULL
);
COMMIT;

---------------------------
------TABLA PELÍCULAS------
---------------------------

CREATE TABLE Peliculas
(
Codigo NUMBER(10),
Titulo VARCHAR2(50) CONSTRAINT nn_titulo NOT NULL,			
Director VARCHAR2(30) CONSTRAINT nn_director NOT NULL,
Year DATE
);
COMMIT;

-------------------------
------TABLA NAVES--------
-------------------------

CREATE TABLE Naves
(
Codigo NUMBER(10),
NTripulantes NUMBER(10) CONSTRAINT nn_tripulantes NOT NULL,
Nombre VARCHAR2(50) CONSTRAINT nn_nombre NOT NULL
);
COMMIT;

----------------------------
------TABLA PERSONAJES------
----------------------------

CREATE TABLE Personajes
(
Codigo NUMBER(10),
Nombre VARCHAR2(50) CONSTRAINT nn_nombre NOT NULL,			
Raza VARCHAR2(20) CONSTRAINT nn_raza NOT NULL,
Grado VARCHAR2(20) CONSTRAINT nn_grado NOT NULL,
CodigoActor NUMBER(10),
CodigoSuperior NUMBER(10)
);
COMMIT;

--------------------------------------
------TABLA PERSONAJES-CAPÍTULOS------
--------------------------------------

CREATE TABLE PersonajesCapitulos
(
CodigoPersonaje NUMBER(10),
Temporada NUMBER(10),			
Orden NUMBER(10)
);
COMMIT;

--------------------------------------
------TABLA PERSONAJES-PELÍCULAS------
--------------------------------------

CREATE TABLE PersonajesPeliculas
(
CodigoPersonaje NUMBER(10),
CodigoPelicula NUMBER(10)
);
COMMIT;

-------------------------
------TABLA VISITAS------
-------------------------

CREATE TABLE Visitas
(
CodigoNave NUMBER(10),
CodigoPlaneta NUMBER(10),			
Temporada NUMBER(10),
Orden NUMBER(10)
);
COMMIT;


-------------------------------
--ALTER-TABLES-PRIMARY-FOREIGN-
-------------------------------

ALTER TABLE Actores ADD CONSTRAINT pk_actores PRIMARY KEY (Codigo);
ALTER TABLE Planetas ADD CONSTRAINT pk_planetas PRIMARY KEY (Codigo);
ALTER TABLE Capitulos ADD CONSTRAINT pk_capitulos PRIMARY KEY (Temporada, Orden);
ALTER TABLE Peliculas ADD CONSTRAINT pk_peliculas PRIMARY KEY (Codigo);
ALTER TABLE Naves ADD CONSTRAINT pk_naves PRIMARY KEY (Codigo);
ALTER TABLE Personajes ADD CONSTRAINT pk_personajes PRIMARY KEY (Codigo);
ALTER TABLE Personajes ADD CONSTRAINT fk1_actores_personajes FOREIGN KEY (CodigoActor) REFERENCES Actores (Codigo);
ALTER TABLE Personajes ADD CONSTRAINT fk2_personajes_personajes FOREIGN KEY (CodigoSuperior) REFERENCES Personajes (Codigo);
ALTER TABLE PersonajesCapitulos ADD CONSTRAINT pk_personajesCapitulos PRIMARY KEY (CodigoPersonaje, Temporada, Orden);
ALTER TABLE PersonajesCapitulos ADD CONSTRAINT fk1_personajes_personajesCapitulos FOREIGN KEY (CodigoPersonaje) REFERENCES Personajes (Codigo);
ALTER TABLE PersonajesCapitulos ADD CONSTRAINT fk2_personajesCapitulos FOREIGN KEY (Temporada, Orden) REFERENCES Capitulos (Temporada, Orden);
ALTER TABLE PersonajesPeliculas ADD CONSTRAINT pk_personajesPeliculas PRIMARY KEY (CodigoPersonaje, CodigoPelicula);
ALTER TABLE PersonajesPeliculas ADD CONSTRAINT fk1_personajes_personajesPeliculas FOREIGN KEY (CodigoPersonaje) REFERENCES Personajes (Codigo);
ALTER TABLE PersonajesPeliculas ADD CONSTRAINT fk2_peliculas_personajesPeliculas FOREIGN KEY (CodigoPelicula) REFERENCES Peliculas (Codigo);
ALTER TABLE visitas ADD CONSTRAINT pk_visitas PRIMARY KEY (CodigoNave, CodigoPlaneta, Temporada, Orden);
ALTER TABLE visitas ADD CONSTRAINT fk1_visitas FOREIGN KEY (CodigoNave) REFERENCES Naves (Codigo);
ALTER TABLE visitas ADD CONSTRAINT fk2_visitas FOREIGN KEY (CodigoPlaneta) REFERENCES Planetas (Codigo);
ALTER TABLE visitas ADD CONSTRAINT fk3_visitas FOREIGN KEY (Temporada, Orden) REFERENCES Capitulos (Temporada, Orden);



--------
--EJ 2--
--------

ALTER TABLE NAVES ADD CONSTRAINT ck_NTripulantes CHECK (ntripulantes BETWEEN 1 AND 500);
ALTER TABLE PLANETAS ADD CONSTRAINT ck_galaxia CHECK (galaxia IN ('Via Lactea', 'Andromeda', 'Sombrero'));


--------
--EJ 3--
--------

ALTER TABLE Personajes ADD
Ciudad VARCHAR2(50),
Fnacim DATE,
Planeta NUMBER(10) CONSTRAINT fk_personajes REFERENCES Planetas (Codigo),
FultCombate DATE,
Mentor VARCHAR2(50),
FechaGrado DATE;

--------
--EJ 4--
--------

CREATE TABLE Lanzaderas
(
CodigoNave NUMBER(10),
Numero NUMBER(10),
Personas NUMBER(10),
CONSTRAINT pk_lanzaderas PRIMARY KEY (CodigoNave, Numero),
CONSTRAINT fk_lanzaderas FOREIGN KEY (CodigoNave) REFERENCES Naves (Codigo)
);




