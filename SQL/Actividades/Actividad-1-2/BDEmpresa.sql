create database BDEmpresa;

use BDEmpresa;

create table Empleados
(
	IdEmpleado int not null,
	NombreEmpleado varchar(50) not null,
	Apellido varchar(50) not null,
	FechaNacimiento date not null,
	Direccion varchar(100) not null,
	Sexo char not null,
	Salario float not null,
	IdSupervisor int null,
	NDepto int not null
);

create table Departamentos
(
	NDepto int not null,
	NombreDepto varchar(100) not null,
	IdJefe int not null,
	FechaNC date not null
);

create table LocalizacionesDepto
(
	Correlativo int not null,
	NDepto int not null,
	LocalizacionDepto varchar(100) not null,
);

create table Proyectos
(
	NumProy int not null,
	NombreProy varchar(50) not null,
	LocalizacionDepto varchar(100) not null
);

create table TrabajaEn
(
	IdEmpleado int not null,
	NumProy int not null,
	Horas float null
);

create table Dependientes
(
	IdDepend int not null,
	IdEmpleado int not null,
	Nombre varchar(50) not null,
	Sexo char not null,
	FechaNacimiento date not null,
	Parentesco varchar(50) not null
);

alter table Empleados add constraint PK_Empleados primary key (IdEmpleado);
alter table Departamentos add constraint PK_Departamentos primary key (NDepto);
alter table LocalizacionesDepto add constraint PK_LocalizacionesDepto primary key (Correlativo);
alter table Proyectos add constraint PK_Proyectos primary key (NumProy);
alter table Dependientes add constraint PK_Dependientes primary key (IdDepend);

alter table Empleados add constraint FK_Departamentos_Empleados foreign key (NDepto)
	references Departamentos(NDepto) on update cascade on delete cascade;

alter table LocalizacionesDepto add constraint FK_Departamentos_LocalizacionesDepto foreign key (NDepto)
	references Departamentos(NDepto) on update cascade on delete cascade;

alter table TrabajaEn add constraint FK_Empleados_TrabajaEn foreign key (IdEmpleado)
	references Empleados(IdEmpleado) on update cascade on delete cascade;

alter table TrabajaEn add constraint FK_Proyectos_TrabajaEn foreign key (NumProy)
	references Proyectos(NumProy) on update cascade on delete cascade;

alter table Dependientes add constraint FK_Empleados_Dependientes foreign key (IdEmpleado)
	references Empleados(IdEmpleado) on update cascade on delete cascade;

insert into Departamentos values (1, 'Direccion', 888665555, '1981-06-19');
insert into Departamentos values (4, 'Administración', 987654321, '1995-01-01');
insert into Departamentos values (5, 'Investigación', 333445555, '1988-05-22');

insert into Empleados values (123456789, 'Daniel Fernando', 'González Carcamo', '1965-09-01', '25av Sur Col America, Barrio San Benito, San Salvador', 'M', 1000.00, 333445555, 5);
insert into Empleados values (333445555, 'Franklin Javier', 'Mejia Serrano', '1955-08-12', '12v Norte Villas del Mediterraneo, San Salvador', 'M', 800.00, 888665555, 5);
insert into Empleados values (453453453, 'Jorge Alberto', 'Aguilar García', '1972-07-31', 'Col Nogales Casa 3 Pasaje 7, Santa Tecla', 'M', 900.00, 333445555, 5);
insert into Empleados values (666884444, 'Adrian F.', 'Paniagua Romero', '1962-09-15', 'Residenciales Parque de Lourdes, Casa 3 Senda 5, San Salvador', 'M', 1200.00, 333445555, 5);
insert into Empleados values (888665555, 'Ricardo', 'Fernández Pach', '1937-11-10', 'Residencial Bosque Verde, Pasaje Los Pinos Casa 3, San Salvador', 'M', 1300.00, null, 1);
insert into Empleados values (987654321, 'Jennifer', 'Fernández Perez', '1941-06-20', 'Col Casa Blanca, Pol F Casa 3, Ciudad Merliot, Santa Tecla', 'F', 90.00, 888665555, 4);
insert into Empleados values (987987987, 'Francisco', 'Cruz Mejía', '1969-03-29', 'Col San Benito Pasaje I, Casa 3, Santa Tecla', 'M', 900.00, 987654321, 4);
insert into Empleados values (999887777, 'Alicia', 'Zelaya Fernández', '1968-07-19', 'Col Las Margaritas Casa 2, Pasaje E, Santa Tecla', 'F', 800.00, 987654321, 4);

insert into LocalizacionesDepto values (1, 1, 'ciudad merliot');
insert into LocalizacionesDepto values (2, 4, 'San Salvador');
insert into LocalizacionesDepto values (3, 5, 'Escalón');
insert into LocalizacionesDepto values (4, 5, 'San Benito');
insert into LocalizacionesDepto values (5, 5, 'Santa Tecla');

insert into Proyectos values (1, 'ProductoX', 'Santa Tecla');
insert into Proyectos values (2, 'ProductoY', 'Escalón');
insert into Proyectos values (3, 'ProductoZ', 'San Benito');
insert into Proyectos values (10, 'Automatización', 'San Salvador');
insert into Proyectos values (20, 'Reorganización', 'Ciudad Merliot');
insert into Proyectos values (30, 'Nuevos Beneficios', 'San Salvador');

insert into Dependientes values (1, 123456789, 'Elizabeth Zavaleta', 'F', '1967-05-05', 'Esposa');
insert into Dependientes values (2, 123456789, 'Maria González', 'F', '1983-12-30', 'Hija');
insert into Dependientes values (3, 123456789, 'Michael Armando', 'M', '1988-04-01', 'Hijo');
insert into Dependientes values (4, 333445555, 'Alicia Mejia', 'F', '1986-04-05', 'Hija');
insert into Dependientes values (5, 333445555, 'Flor Maria Rosales', 'F', '1958-05-03', 'Esposa');
insert into Dependientes values (6, 333445555, 'Franklin Mejía', 'M', '1983-10-25', 'Hijo');
insert into Dependientes values (7, 987654321, 'Abner Fernández', 'M', '1942-02-28', 'Esposo');

insert into TrabajaEn values  (123456789, 1, 32.50);
insert into TrabajaEn values  (123456789, 2, 7.50);
insert into TrabajaEn values  (333445555, 2, 10.00);
insert into TrabajaEn values  (333445555, 3, 10.00);
insert into TrabajaEn values  (333445555, 10, 10.00);
insert into TrabajaEn values  (333445555, 20, 20.00);
insert into TrabajaEn values  (453453453, 1, 20.00);
insert into TrabajaEn values  (453453453, 2, 20.00);
insert into TrabajaEn values  (666884444, 3, 40.00);
insert into TrabajaEn values  (888665555, 20, null);
insert into TrabajaEn values  (987654321, 20, 15.00);
insert into TrabajaEn values  (987654321, 30, 20.00);
insert into TrabajaEn values  (987987987, 10, 35.0);
insert into TrabajaEn values  (987987987, 30, 05.00);
insert into TrabajaEn values  (999887777, 10, 10.00);
insert into TrabajaEn values  (999887777, 30, 30.00);

select * from Departamentos;
select * from Empleados;
select * from LocalizacionesDepto;
select * from Proyectos;
select * from Dependientes;
select * from TrabajaEn;