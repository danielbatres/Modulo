create database BDControlPedidos;

use BDControlPedidos;

create table Clientes
(
	IdCliente int not null,
	NombreCliente varchar(100) not null,
	Ciudad varchar(100) not null,
	Telefono varchar(15) null
);

create table Pedidos
(
	IdPedido int not null,
	FechaPedido date not null,
	IdCliente int not null,
	TotalImporte float not null
);

create table PedArt
(
	IdPedido int not null,
	IdArticulo int not null,
	Cantidad int not null
);

create table Articulos 
(
	IdArticulo int not null,
	NombreArtic varchar(50) not null,
	PrecioUni float not null
);

create table Envios
(
	IdPedido int not null,
	IdAlmacen int not null,
	FechaEnvio date not null
);

create table Almacenes
(
	IdAlmacen int not null,
	Ciudad varchar(50) not null
);

alter table Clientes add constraint PK_Clientes primary key (IdCliente);
alter table Pedidos add constraint PK_Pedidos primary key (IdPedido);
alter table Articulos add constraint PK_Articulos primary key (IdArticulo);
alter table Almacenes add constraint PK_Almacenes primary key (IdAlmacen);

alter table Pedidos add constraint FK_Clientes_Pedidos foreign key (IdCLiente)
	references Clientes(IdCliente) on update cascade on delete cascade;

alter table PedArt add constraint FK_Pedidos_PedArt foreign key (IdPedido)
	references Pedidos(IdPedido) on update cascade on delete cascade;

alter table PedArt add constraint FK_Articulos_PedArt foreign key (IdArticulo)
	references Articulos(IdArticulo) on update cascade on delete cascade;

alter table Envios add constraint FK_Pedidos_Envios foreign key (IdPedido)
	references Pedidos(IdPedido) on update cascade on delete cascade;

alter table Envios add constraint FK_Almacenes_Envios foreign key (IdAlmacen)
	references Almacenes(IdAlmacen) on update cascade on delete cascade;

insert into Almacenes values (1, 'Ciudad Merliot');
insert into Almacenes values (2, 'Santa Tecla');
insert into Almacenes values (3, 'San Salvador');
insert into Almacenes values (4, 'Escalón');

insert into Articulos values (0343544, 'Bicicleta Montaña', 112.00);
insert into Articulos values (0593454, 'Horno Tostador', 123.00);
insert into Articulos values (2138544, 'Cocina Cetron 4', 235.00);
insert into Articulos values (3246099, 'Refrigeradora C', 345.00);
insert into Articulos values (3498055, 'Cocina Mabe 4 q', 285.00);
insert into Articulos values (3823434, 'Cocina con horno', 200.00);
insert into Articulos values (4343245, 'Licuadora Mabe', 54.00);
insert into Articulos values (9342143, 'Juego de Sala B', 1090.00);
insert into Articulos values (9583463, 'Muebles de sala', 978.00);

insert into Clientes values (000123, 'Mercedes Acosta Carranza', 'Escalón', '2234-2423');
insert into Clientes values (000231, 'Maria Lourdes Mejía', 'San Salvador', '2434-2334');
insert into Clientes values (000303, 'Mario José Menjivar', 'Santa Tecla', '2344-5667');
insert into Clientes values (000324, 'Jenifer Karina Morales', 'Ciudad Merliot', null);
insert into Clientes values (001245, 'Marcelo Alejandro Mendoza', 'Santa Tecla', null);
insert into Clientes values (023344, 'Jorge Antonio Ramírez', 'San Salvador', null);

insert into Pedidos values (00001, '2009-02-25', 000123, 683.00);
insert into Pedidos values (00002, '2009-02-26', 000123, 457.00);
insert into Pedidos values (00003, '2009-02-25', 000303, 285.00);
insert into Pedidos values (00004, '2009-02-27', 000324, 200.00);
insert into Pedidos values (00005, '2009-02-26', 000324, 123.00);
insert into Pedidos values (00006, '2009-02-25', 000324, 470.00);
insert into Pedidos values (00007, '2009-02-25', 023344, 285.00);
insert into Pedidos values (00008, '2009-02-25', 001245, 200.00);
insert into Pedidos values (00009, '2009-03-05', 023344, 1144.00);
insert into Pedidos values (00010, '2009-03-04', 000231, 345.00);

insert into PedArt values (00001, 0343544, 5);
insert into PedArt values (00001, 0593454, 1);
insert into PedArt values (00002, 0343544, 1);
insert into PedArt values (00002, 3246099, 1);
insert into PedArt values (00003, 3498055, 1);
insert into PedArt values (00004, 3823434, 1);
insert into PedArt values (00005, 0593454, 1);
insert into PedArt values (00006, 0343544, 1);
insert into PedArt values (00006, 0593454, 1);
insert into PedArt values (00006, 2138544, 1);
insert into PedArt values (00007, 3498055, 1);
insert into PedArt values (00008, 3823434, 1);
insert into PedArt values (00009, 4343245, 1);
insert into PedArt values (00009, 9342143, 1);
insert into PedArt values (00010, 3246099, 1);

insert into Envios values (00001, 4, '2009-03-05');
insert into Envios values (00002, 4, '2009-03-05');
insert into Envios values (00003, 2, '2009-03-04');
insert into Envios values (00004, 1, '2009-03-04');
insert into Envios values (00005, 1, '2009-03-04');
insert into Envios values (00006, 1, '2009-03-04');
insert into Envios values (00007, 3, '2009-03-03');
insert into Envios values (00008, 2, '2009-02-03');
insert into Envios values (00009, 3, '2009-09-03');
insert into Envios values (00010, 3, '2009-09-03');

select * from Clientes;
select * from Pedidos;
select * from PedArt;
select * from Articulos;
select * from Envios;
select * from Almacenes;