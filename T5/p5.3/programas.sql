create table fabricante(
	id_fab		number(1,0) constraint pk_fabricante primary key,
	nombre		varchar2(15),
	pais		varchar2(30)
	);

insert into fabricante values(1, 'Oracle', 'Estados Unidos');
insert into fabricante values(2, 'Microsoft', 'Estados Unidos');
insert into fabricante values(3, 'IBM', 'Estados Unidos');
insert into fabricante values(4, 'Dinamic', 'Espa�a');
insert into fabricante values(5, 'Borland', 'Estados Unidos');
insert into fabricante values(6, 'Symantec', 'Estados Unidos');

create table programas(
	codigo		number(2,0) constraint pk_programa primary key,
	nombre		varchar2(30),
	version		varchar2(20)
	);
	
insert into programas values(1, 'Application Server', '9i');
insert into programas values(2, 'Database', '8i');
insert into programas values(3, 'Database', '9i');
insert into programas values(4, 'Database', '10g');
insert into programas values(5, 'Developer', '6i');
insert into programas values(6, 'Access', '97');
insert into programas values(7, 'Access', '2000');
insert into programas values(8, 'Access', 'XP');
insert into programas values(9, 'Windows', '98');
insert into programas values(10, 'Windows', 'XP Professional');
insert into programas values(11, 'Windows', 'XP Home Edition');
insert into programas values(12, 'Windows', '2003 Server');
insert into programas values(13, 'Norton Internet Security', '2004');
insert into programas values(14, 'Freddy Hardest', '-');
insert into programas values(15, 'Paradox', '2');
insert into programas values(16, 'C++ Builder', '55');
insert into programas values(17, 'DB/2', '20');
insert into programas values(18, 'OS/2', '10');
insert into programas values(19, 'JBuilder', 'X');
insert into programas values(20, 'La prisi�n', '10');

create table comercio(
	cif			number(1,0) constraint pk_comercio primary key,
	nombre		varchar2(20),
	ciudad		varchar2(20)
	);

insert into comercio values (1, 'El Corte Ingles', 'Sevilla');
insert into comercio values (2, 'El Corte Ingles', 'Madrid');
insert into comercio values (3, 'Jump', 'Valencia');
insert into comercio values (4, 'Centro Mail', 'Sevilla');
insert into comercio values (5, 'FNAC', 'Barcelona');

create table clientes(
	dni			number(1,0) constraint pk_cliente primary key,
	nombre		varchar2(30),
	edad		number(2,0)
	);

insert into clientes values (1, 'Pepe P�rez', 45);
insert into clientes values (2, 'Juan Gonz�lez', 45);
insert into clientes values (3, 'Mar�a G�mez', 33);
insert into clientes values (4, 'Javier Casado', 18);
insert into clientes values (5, 'Nuria S�nchez', 29);
insert into clientes values (6, 'Antonio Navarro', 58);

create table desarrolla(
	id_fab		number(1,0),
	codigo		number(2,0),
	constraint pk_desarrolla primary key (id_fab, codigo),
	constraint fk_desarrolla_fabricante foreign key (id_fab) references fabricante(id_fab) on delete cascade,
	constraint fk_desarrolla_programa foreign key (codigo) references programas(codigo) on delete cascade
	);
	
insert into desarrolla values (1, 1);
insert into desarrolla values (1, 2);
insert into desarrolla values (1, 3);
insert into desarrolla values (1, 4);
insert into desarrolla values (1, 5);
insert into desarrolla values (2, 6);
insert into desarrolla values (2, 7);
insert into desarrolla values (2, 8);
insert into desarrolla values (2, 9);
insert into desarrolla values (2, 10);
insert into desarrolla values (2, 11);
insert into desarrolla values (2, 12);
insert into desarrolla values (6, 13);
insert into desarrolla values (4, 14);
insert into desarrolla values (5, 15);
insert into desarrolla values (5, 16);
insert into desarrolla values (3, 17);
insert into desarrolla values (3, 18);
insert into desarrolla values (5, 19);
insert into desarrolla values (4, 20);

create table distribuye(
	cif			number(1,0),
	codigo		number(2,0),
	cantidad	number(2,0),
	constraint pk_distribuye primary key (cif, codigo),
	constraint fk_distribuye_comercio foreign key (cif) references comercio(cif) on delete cascade,
	constraint fk_distribuye_programa foreign key (codigo) references programas(codigo) on delete cascade
	);	

insert into distribuye values (1, 1, 10);
insert into distribuye values (1, 2, 11);
insert into distribuye values (1, 6, 5);
insert into distribuye values (1, 7, 3);
insert into distribuye values (1, 10, 5);
insert into distribuye values (1, 13, 7);
insert into distribuye values (2, 1, 6);
insert into distribuye values (2, 2, 6);
insert into distribuye values (2, 6, 4);
insert into distribuye values (2, 7, 7);
insert into distribuye values (3, 10, 8);
insert into distribuye values (3, 13, 5);
insert into distribuye values (4, 14, 3);
insert into distribuye values (4, 20, 6);
insert into distribuye values (5, 15, 8);
insert into distribuye values (5, 16, 2);
insert into distribuye values (5, 17, 3);
insert into distribuye values (5, 19, 6);
insert into distribuye values (5, 8, 8);

create table registra(
	cif			number(1,0),
	dni			number(1,0),
	codigo		number(2,0),
	medio		varchar2(20),
	constraint pk_registra primary key (cif, dni, codigo),
	constraint fk_registra_comercio foreign key (cif) references comercio(cif) on delete cascade,
	constraint fk_registra_cliente foreign key (dni) references clientes(dni) on delete cascade,
	constraint fk_registra_programa foreign key (codigo) references programas(codigo) on delete cascade
	);

insert into registra values (1, 1, 1, 'Internet');
insert into registra values (1, 3, 4, 'Tarjeta postal');
insert into registra values (4, 2, 10, 'Telefono');
insert into registra values (4, 1, 10, 'Tarjeta postal');
insert into registra values (5, 2, 12, 'Internet');
insert into registra values (2, 4, 15, 'Internet');
