1. Consultar el contenido de todas las tablas.
select * from pinacotecas;
select * from cuadros;
select * from pintores;
select * from mecenas;
select * from escuelas;
select * from cuadros_pintores;
select * from pintores_escuelas;
select * from mecenazgo;
select * from maestros;

2. Consultar sólo el identificador y el nombre las siguientes tablas: pinacotecas, cuadros,
pintores, mecenas, escuelas.
select id_cuadro, n_cuadro from cuadros;


3.  Usando concatenación de textos, se pide listar los datos de la tabla pintores con las
siguientes columnas: "IDENTIFICADOR", "NOMBRE", "ID-NOMBRE", donde ID-NOMBRE será el
resultado de la concatenación del campo ID_PINTOR y de N_PINTOR.
select id_pintor, n_pintor, id_pintor || ' ' || n_pintor "id_nombre"
	from pintores;

4. Usando concatenación de textos, listar el contenido de la tabla pinacotecas de la
siguiente forma: "Pinacoteca (ID_PINACOTECA): (NOMBRE)".
select 'Pinacoteca' || ' ' || id_pinacoteca || ': ' || nombre from pinacotecas;

5. Seleccionar nombre y país de la tabla pinacotecas donde ID_PINACOTECA es "MUBAS".
select nombre, pais
	from pinacotecas
	where id_pinacoteca LIKE 'MUBAS';


6. Seleccionar técnica, ancho y alto de los siguientes cuadros: La Gioconda, El nacimiento
de Venus y Sagrada Familia.
select tecnica, ancho, alto 
	from cuadros
	where n_cuadro LIKE upper('La Gioconda') OR
		  n_cuadro LIKE upper('El nacimiento') OR
		  n_cuadro LIKE upper('Sagrada Familia'); 


7. Seleccionar nombre y ciudad de nacimiento de los mecenas italianos.
select n_mecenas, ciudad_nac
	from mecenas
	where pais LIKE 'ITALIA';


8. Seleccionar el nombre de los mecenas que nacieron en Madrid o en Valladolid.
select n_mecenas
	from mecenas
	where ciudad_nac LIKE 'MADRID' OR
		  ciudad_nac LIKE 'VALLADOLID';


9. Seleccionar nombre y fecha de aparición de las escuelas españolas o italianas.
select n_escuela, fecha_aparicion
	from escuelas
	where pais like 'ESPAÑA' OR
		  pais like 'ITALIA';

10. Idem anterior pero usando la cláusula IN.
select n_escuela, fecha_aparicion
	from escuelas
	where pais IN ('ESPAÑA', 'ITALIA');  
-- IN es más eficiente que OR
-- IN es un conjunto de datos

11. Seleccionar nombre y ciudad de nacimiento de los mecenas holandeses o belgas usando
la cláusula IN.
select n_mecenas, ciudad_nac
	from mecenas
	where pais IN ('HOLANDA', 'BÉLGICA';

12. Seleccionar nombre y ciudad de nacimiento de los mecenas cuyo nombre comienza por F
y termina en O.
select n_mecenas, ciudad_nac
	from mecenas
	where n_mecenas LIKE 'F%O';


