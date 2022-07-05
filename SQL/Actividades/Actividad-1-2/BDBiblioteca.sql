create database BDBiblioteca;

use BDBiblioteca;

create table Libros
(
	IdLibro int not null,
	Titulo varchar(200) not null,
	CodEditorial int not null
);

create table Editoriales
(
	CodEditorial int not null,
	NombreEd varchar(100) not null,
	PaisEd varchar(100) not null,
	TelefonoEd varchar(9) null
);

create table CopiasLibros
(
	IdLibro int not null,
	IdSucursal int not null,
	NumCopias int not null
);

create table AutoresLibros 
(
	IdLibro int not null,
	IdAutor int not null
);

create table Autores 
(
	IdAutor int not null,
	NombreAutor varchar(100) not null
);

create table Prestamos
(
	IdPrestamo int not null,
	IdLibro int not null,
	IdSucursal int not null,
	NumTarjeta int not null,
	FechaSalida date not null,
	FechaDevol date not null
);

create table Lectores
(
	NumTarjeta int not null,
	NombreLector varchar(100) not null,
	DireccionLector varchar(100) not null,
	TelefonoLector varchar(9) null
);

create table SucursalesBiblioteca
(
	IdSucursal int not null,
	NombreSucursal varchar(100) not null,
	Direccion varchar(100) not null
);

alter table Libros add constraint PK_Libros primary key (IdLibro);
alter table Editoriales add constraint PK_Editoriales primary key (CodEditorial);
alter table Autores add constraint PK_Autores primary key (IdAutor);
alter table Prestamos add constraint PK_Prestamos primary key (IdPrestamo);
alter table Lectores add constraint PK_Lectores primary key (NumTarjeta);
alter table SucursalesBiblioteca add constraint PK_SucursalesBiblioteca primary key (IdSucursal);

alter table Libros add constraint FK_Editoriales_Libros foreign key (CodEditorial)
	references Editoriales(CodEditorial) on update cascade on delete cascade;

alter table CopiasLibros add constraint FK_Libros_CopiasLibros foreign key (IdLibro)
	references Libros(IdLibro) on update cascade on delete cascade;

alter table CopiasLibros add constraint FK_SucursalesBiblioteca_CopiasLibros foreign key (IdSucursal)
	references SucursalesBiblioteca(IdSucursal) on update cascade on delete cascade;

alter table AutoresLibros add constraint FK_Libros_AutoresLibros foreign key (IdLibro)
	references Libros(IdLibro) on update cascade on delete cascade;

alter table AutoresLibros add constraint FK_Autores_AutoresLibros foreign key (IdAutor)
	references Autores(IdAutor) on update cascade on delete cascade;

alter table Prestamos add constraint FK_Libros_Prestamos foreign key (IdLibro)
	references Libros(IdLibro) on update cascade on delete cascade;

alter table Prestamos add constraint FK_SucursalesBiblioteca_Prestamos foreign key (IdSucursal)
	references SucursalesBiblioteca(IdSucursal) on update cascade on delete cascade;

alter table Prestamos add constraint FK_Lectores_Prestamos foreign key (NumTarjeta)
	references Lectores(NumTarjeta) on update cascade on delete cascade;

insert into Editoriales values (100000, 'ADDISON-WESLEY', 'España', null);
insert into Editoriales values (100001, 'Anaya Multimedia', 'España', null);
insert into Editoriales values (100002, 'ECO', 'España', null);
insert into Editoriales values (100003, 'EIDOS', 'España', null);
insert into Editoriales values (100004, 'FEXLIB', 'Mexico', null);
insert into Editoriales values (100005, 'McGraw-Hill', 'Mexico', null);
insert into Editoriales values (100006, 'Pearson', 'España', null);
insert into Editoriales values (100007, 'RA-MA', 'España', null);
insert into Editoriales values (100008, 'TECNOS 2009', 'España', null);

insert into Libros values (000001,'DISEÑO DE PAGINAS WEB CON XHTML, JAVASCRIPT Y CSS (2da ED)', 100006);
insert into Libros values (000005,'PROGRAMACION DE GRAFICOS 3D', 100006);
insert into Libros values (000006,'SQL Y JAVA GUIA PARA SQLJ, JDBC Y TECNOLOGIAS RELACIONADAS', 100007);
insert into Libros values (000007,'MANUAL BASICO DE DERECHO ADMINISTRATIVO (6 ED)', 100008);
insert into Libros values (000008,'SISTEMA JURIDICO ADMINISTRACION PUBLICA', 100006);
insert into Libros values (000009,'DERECHO ADMINISTRATIVO 1RA ED', 100007);
insert into Libros values (000010,'DERECHO ADMINISTRATIVO 2DA ED', 100007);
insert into Libros values (000011,'SISTEMAS DE BASES DE DATOS 4A ED', 100000);
insert into Libros values (000012,'FUNDAMENTOS DE DISEÑO DE BASES DE DATOS (5a ED.)', 100005);
insert into Libros values (000013,'TECNOLOGIA Y DISEÑO DE BASES DE DATOS', 100007);
insert into Libros values (000014,'SQL SERVER 2008: SQL, TRANSTACT SQL: DISEÑO Y CREACION DE UNA BASE DE DATOS', 100001);
insert into Libros values (000024,'3D STUDIO MAX 9', 100001);

insert into Lectores values (000323, 'Moisés Alejandro Pérez', 'Santa Tecla', null);
insert into Lectores values (002346, 'America Maria Gómez', 'Santa Tecla', null);
insert into Lectores values (006783, 'Javier Adrian Serrano', 'San Salvador', null);
insert into Lectores values (010921, 'Francisco Javier Maldonado', 'Santa Tecla', null);
insert into Lectores values (021321, 'Melissa Mendoza Palacios', 'San Salvador', null);
insert into Lectores values (023244, 'Mario Merino Pérez', 'San Salvador', null);

insert into Autores values (10, 'OROS CABELLO, JUAN CARLOS');
insert into Autores values (11, 'LANDA COSIO, NICOL');
insert into Autores values (12, 'MELLON, JIM');
insert into Autores values (13, 'EISENBERG, ANDREW');
insert into Autores values (14, 'GAMERO CASADO, EDUARDO');
insert into Autores values (15, 'FERNANDEZ RAMOS, SEVERIANO');
insert into Autores values (16, 'GONZALEZ PEREZ, JESUS');
insert into Autores values (17, 'PARADA, RAMON');
insert into Autores values (18, 'CACERES, FERNANDO');
insert into Autores values (19, 'SIBERSCHATZ, ABRAHAM');
insert into Autores values (20, 'BLANKS, LAPARK');
insert into Autores values (21, 'GABILLAUD, JEROME');
insert into Autores values (22, 'PEREZ, CESAR');

insert into AutoresLibros values (000001, 10);
insert into AutoresLibros values (000005, 11);
insert into AutoresLibros values (000006, 12);
insert into AutoresLibros values (000006, 13);
insert into AutoresLibros values (000007, 14);
insert into AutoresLibros values (000008, 15);
insert into AutoresLibros values (000008, 16);
insert into AutoresLibros values (000009, 17);
insert into AutoresLibros values (000010, 17);
insert into AutoresLibros values (000011, 18);
insert into AutoresLibros values (000012, 19);
insert into AutoresLibros values (000013, 20);
insert into AutoresLibros values (000014, 21);
insert into AutoresLibros values (000024, 22);

insert into SucursalesBiblioteca values (1, 'Biblioteca Central', 'San Salvador');
insert into SucursalesBiblioteca values (2, 'Biblioteca Santa Tecla', 'Santa Tecla');
insert into SucursalesBiblioteca values (3, 'Biblioteca Escalón', 'Escalón');

insert into CopiasLibros values (000001, 1, 2);
insert into CopiasLibros values (000005, 1, 5);
insert into CopiasLibros values (000005, 2, 3);
insert into CopiasLibros values (000006, 2, 2);
insert into CopiasLibros values (000006, 3, 1);
insert into CopiasLibros values (000007, 1, 1);
insert into CopiasLibros values (000007, 2, 2);
insert into CopiasLibros values (000008, 1, 4);
insert into CopiasLibros values (000008, 2, 2);
insert into CopiasLibros values (000008, 3, 2);
insert into CopiasLibros values (000009, 1, 1);
insert into CopiasLibros values (000009, 2, 2);
insert into CopiasLibros values (000009, 3, 1);
insert into CopiasLibros values (000010, 1, 1);
insert into CopiasLibros values (000010, 2, 1);
insert into CopiasLibros values (000011, 1, 1);
insert into CopiasLibros values (000011, 2, 2);
insert into CopiasLibros values (000011, 3, 1);
insert into CopiasLibros values (000012, 1, 2);
insert into CopiasLibros values (000012, 2, 2);
insert into CopiasLibros values (000013, 1, 1);
insert into CopiasLibros values (000013, 3, 1);
insert into CopiasLibros values (000014, 1, 1);
insert into CopiasLibros values (000014, 2, 1);
insert into CopiasLibros values (000014, 3, 1);

insert into Prestamos values (0003212, 000010, 2, 023244, '2009-04-16','2009-04-19');
insert into Prestamos values (0012345, 000009, 1, 006783, '2009-05-16', '2009-05-18');
insert into Prestamos values (0023256, 000006, 3, 000323, '2009-05-06', '2009-05-09');
insert into Prestamos values (0023485, 000001, 1, 000323, '2009-04-12', '2009-04-15');
insert into Prestamos values (0098792, 000013, 1, 021321, '2009-05-03', '2009-04-05');
insert into Prestamos values (0908434, 000001, 1, 000323, '2009-03-25', '2009-03-27');

select * from Libros;
select * from Autores;
select * from Lectores;
select * from Editoriales;
select * from AutoresLibros;
select * from SucursalesBiblioteca;
select * from CopiasLibros;
select * from Prestamos;