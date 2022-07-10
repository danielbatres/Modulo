/*

	Actividad Final de Bases de Datos

	Daniel Alessandro Garcia Batres #13

	Indicaciones: Crear una consulta con todo el proceso para la generación de Administración de una
	Bases de Datos, Consultas Simples, Consultas con Funciones y Subconsultas.

*/

/*

	1. Considere el esquema relacional BIBLIOTECA que sirve para llevar el control de libros,
	   lectores y préstamos de libros. Realice las siguientes consultas sobre los datos,
	   ocupando funciones de agregación:

*/

use BDBiblioteca;

-- a) ¿Cuántos libros posee actualmente la sucursal Santa Tecla de la biblioteca?

select count(IdLibro) as "Libros" from CopiasLibros where IdSucursal = 2;

-- b) ¿Cuántos libros de la editorial PEARSON existen toda la biblioteca?

select NombreEd, CodEditorial from Editoriales where NombreEd = 'Pearson';
select count(IdLibro) as "Libros" from Libros where CodEditorial = 100006;

-- c) Cuantos prestamos ha hecho hasta el momento la sucursal Central de la biblioteca.

select count(IdPrestamo) as "Prestamos" from Prestamos where IdSucursal = 1;

-- d) ¿Cuantas copias del libro ‘PROGRAMACION DE GRAFICOS 3D’ posee la 
-- biblioteca de la sucursal Santa Tecla?

select sum(NumCopias) as "Copias libro" from CopiasLibros c
inner join SucursalesBiblioteca s on c.IdSucursal = s.IdSucursal 
inner join Libros l on c.IdLibro = l.IdLibro
where c.IdSucursal = 2 and titulo like '%GRAFICOS%';

-- e) ¿Cuántas copias del libro ‘PROGRAMACION DE GRAFICOS 3D’ posee cada una
-- de las sucursales de la biblioteca?

select nombreSucursal as "Nombre Sucursal", sum(NumCopias) as "Copias" from CopiasLibros c 
inner join SucursalesBiblioteca s on c.IdSucursal = s.IdSucursal 
inner join Libros l on c.IdLibro = l.IdLibro 
where titulo like '%GRAFICOS%' group by NombreSucursal;

-- f) Para cada sucursal de biblioteca, obtenga su nombre y el código total de libros que
-- ha prestado hasta hoy.

select nombreSucursal as "Nombre Sucursal", count(IdPrestamo) as "Codigo Total" from SucursalesBiblioteca s 
inner join Prestamos p on s.IdSucursal = p.IdSucursal
where FechaSalida between '2008-12-31' and '2022-07-10' group by NombreSucursal;

-- g) De todos los lectores que han prestado más de dos libros, obtenga sus nombres,
-- direcciones y el número total de libros prestados hasta la fecha.

select NombreLector as "Nombre Lector", DireccionLector as "Direccion Lector",
(select count(*) from Prestamos where Prestamos.NumTarjeta = Lectores.NumTarjeta) as "Prestados" from Lectores
where (select count(*) from Prestamos 
where FechaSalida between '2008-12-31' and '2022-07-10' and Lectores.NumTarjeta = Prestamos.NumTarjeta) > 2;

-- h) Genere un listado con el nombre de libro y el nombre de lector de todos aquellos
-- libros que se hayan prestado entre el ‘01/03/2009’ y el ‘30/04/2009’

select l.Titulo as "Nombre Libro", lc.NombreLector "Nombre Lector", p.FechaSalida as "Fecha Salida" 
from Libros l, Lectores lc, prestamos p
where l.IdLibro = p.IdLibro and lc.NumTarjeta = p.NumTarjeta and p.FechaSalida between '2009-03-01' and '2009-04-30';

-- i) Genere una lista con todos los libros ordenados alfabeticamente por titulo y dentro
-- de cada titulo ordenado por editorial.

select l.Titulo as "Nombre libro", e.NombreEd as "Editorial" from Libros l
inner join Editoriales e on e.CodEditorial = l.CodEditorial
order by Titulo, NombreEd desc;

-- j) Obtenga una lista de los libros con el número total de copias existentes de cada uno. 

select Titulo, sum(NumCopias) as "Copias" from Libros l 
inner join CopiasLibros c on l.IdLibro = c.IdLibro 
group by Titulo

-- k) Muestre por cada sucursal el numero total de copias que posee y ordenelas de
-- menor a mayor.

select NombreSucursal, sum(NumCopias) as "Copias" from CopiasLibros c 
inner join SucursalesBiblioteca s on c.IdSucursal = s.IdSucursal 
inner join Libros l on c.IdLibro = l.IdLibro 
group by NombreSucursal order by "Copias" asc;

-- l) Muestre el total de libros que posee cada editorial contenida en la biblioteca. 

select NombreEd as "Editorial", count(IdLibro) as "Total Libros" from Libros l 
inner join Editoriales e on e.CodEditorial = l.CodEditorial group by NombreEd;

-- m) Para cada libro prestado por la sucursal Central, obtenga el titulo del libro, el nombre
-- del lector y la direccion del lector.

select l.Titulo as "Libro", lc.NombreLector as "Nombre Lector", 
lc.DireccionLector as "Direccion Lector", s.NombreSucursal as "Sucursal"
from Libros l, Lectores lc, Prestamos p, SucursalesBiblioteca s
where l.IdLibro = p.IdLibro and lc.NumTarjeta = p.NumTarjeta and s.IdSucursal = p.IdSucursal and p.IdSucursal = 1;

-- n) Obtenga los nombres de todos los lectores que no tengan libros en prestamo.

select NombreLector from Lectores where not exists 
(select * from Prestamos where lectores.NumTarjeta = Prestamos.NumTarjeta);

/*

	2. Considere el esquema relacional CONTROL DE PEDIDOS, realice las siguientes
           consultas sobre los datos ocupando funciones de agregación:

*/

use BDControlPedidos;

-- a) ¿Cual es el articulo con menor costo de la tabla ARTICULOS?

select min(PrecioUni) as "Menor costo" from Articulos;

-- b) ¿Cual es el artículo con mayor costo?

select max(PrecioUni) as "Mayor costo" from Articulos;

-- c) ¿Cual es el importe total de todos los pedidos realizados por el cliente con ID_Cliente
-- = ‘000123’?

select sum(TotalImporte) as "Importe total" from Pedidos 
where IdCliente = 000123;

-- d) Obtenga los numeros de pedido y fechas de envio de todos los pedidos servidos
-- desde el almacen con numero 2

select count(Cantidad) as "Pedidos", FechaEnvio as "Fecha Envio" from PedArt pd
inner join Envios e on pd.IdPedido = E.IdPedido where IdAlmacen = 2 
group by FechaEnvio; 

-- e) Obtenga una lista CLIENTE, NUM_PEDIDOS, MEDIA_IMPORTE_PED donde la
-- columna de en medio es el número total de pedidos realizados por el cliente y la
-- última es la media del importe de todos los pedidos del cliente. 

select NombreCliente as "Nombre Cliente", sum(Cantidad) as "Numero Pedidos", avg(TotalImporte) as "Promedio Importe Pedido" 
from Clientes c 
inner join Pedidos p on c.IdCliente = p.IdCliente 
inner join PedArt pd on pd.IdPedido = p.IdPedido 
group by NombreCliente;

-- f) Muestre el nombre de los clientes que generaron algun pedido los meses de Febrero
-- y Marzo.

select NombreCliente as "Cliente", IdPedido as "Pedido" from Clientes c, Pedidos p 
where c.IdCliente = p.IdCliente and FechaPedido between '2009-02-01' and '2009-03-31';

-- g) Obtenga la lista de los numeros de pedido para los pedidos que se sirvieron desde
-- todos los almacenes que la empresa tiene en San Salvador.

select count(Cantidad) as "Numero de Pedidos" from PedArt pd 
inner join Envios e on pd.IdPedido = e.IdPedido 
inner join Almacenes a on e.IdAlmacen = a.IdAlmacen
where Ciudad = 'San Salvador';

-- h) Muestre cual es el total del importe de los pedidos realizados para el mes de Marzo.

select sum(TotalImporte) as "Importes Marzo" from Pedidos
where FechaPedido between '2009-03-01' and '2009-03-31';

-- i) Obtenga por cada cliente (con su codigo de cliente y nombre) el total del importe al
-- que ascienden todos sus pedidos.

select c.IdCliente as "ID Cliente", NombreCliente as "Nombre Cliente", sum(TotalImporte) as "Total Importe"
from Clientes c, Pedidos p 
where c.IdCliente = p.IdCliente 
group by c.IdCliente, NombreCliente;

-- j) Muestre una lista de articulos ordenados por nombre y ordene cada artículo por su
-- precio de mayor a menor.

select NombreArtic, PrecioUni from Articulos order by PrecioUni desc;

-- k) Cual fue el importe total de los pedidos realizados el mes de JUNIO de 2009.

select sum(TotalImporte) as "Importe Junio" from Pedidos 
where FechaPedido between '2009-06-01' and '2009-06-30';

-- l) Muestre el total de productos que se solicitaron para el pedido ‘P00006’.

select count(Cantidad) as "Cantidad Producto" from PedArt pd 
inner join Envios e on pd.IdPedido = e.IdPedido where pd.IdPedido ='000006';

-- m) Muestre el nombre de los clientes que no hayan generado ningun pedido para el
-- mes de Febrero.

select distinct NombreCliente as "Cliente" from Clientes c 
inner join Pedidos p on c.IdCliente = p.IdCliente 
where FechaPedido between '2009-02-28' and '2009-03-30'; 

/*

	3. Considere el esquema relacional EMPRESA correspondiente al tema 3 realice las
           siguientes consultas sobre los datos ocupando funciones de agregacion:

*/

use BDEmpresa;

-- a) Genere un listado que muestre todos los empleados cuyas horas trabajadas sean
-- superiores a las del empleado con ID_Emp= ‘666884444’

-- b) ¿Cuantos empleados trabajan en el departamento con NDepto= 5?

-- c) ¿Cual es el total de horas invertidas por los empleados en el proyecto con
-- NumProy=30?

--d) Determine el menor y el mayor salario que existe para los empleados de la empresa
-- y presente además cual es el promedio general de los salarios.

-- e) Obtenga los nombres de todos los empleados de departamento 5 que trabajan mas
-- de 10 horas por semana en el proyecto ‘ProductoX’

-- f) Cite los nombres de todos los empleados que tienen una persona dependiente de
-- ellos con su mismo nombre de pila.

-- g) Muestre todos aquellos empleados en los que su nombre comience con el carácter
-- ‘A’ pero que su nombre no exceda de 6 caracteres.

-- h) Para cada proyecto, cite el nombre del proyecto y el total de horas por semana (de
-- todos los empleados) invertidas en el proyecto.

-- i) Obtenga los nombres de los empleados que trabajan en cada uno de los proyectos.

-- j) Obtenga el nombre de todos los empleados que no trabajan en ningún proyecto.

/*

	Vease referencia: Repositorio( https://github.com/danielbatres/Modulos/blob/main/SQL/Actividades/Actividad-final/ActividadFinal.sql )

*/