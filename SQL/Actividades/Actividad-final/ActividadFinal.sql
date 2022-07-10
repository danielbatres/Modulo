/*

	Actividad Final de Bases de Datos

	Daniel Alessandro Garcia Batres #13

	Indicaciones: Crear una consulta con todo el proceso para la generaci�n de Administraci�n de una
	Bases de Datos, Consultas Simples, Consultas con Funciones y Subconsultas.

*/

/*

	1. Considere el esquema relacional BIBLIOTECA que sirve para llevar el control de libros,
	   lectores y pr�stamos de libros. Realice las siguientes consultas sobre los datos,
	   ocupando funciones de agregaci�n:

*/

use BDBiblioteca;

-- a) �Cu�ntos libros posee actualmente la sucursal Santa Tecla de la biblioteca?

select count(IdLibro) as "Libros" from CopiasLibros where IdSucursal = 2;

-- b) �Cu�ntos libros de la editorial PEARSON existen toda la biblioteca?

select NombreEd, CodEditorial from Editoriales where NombreEd = 'Pearson';
select count(IdLibro) as "Libros" from Libros where CodEditorial = 100006;

-- c) Cuantos prestamos ha hecho hasta el momento la sucursal Central de la biblioteca.

select count(IdPrestamo) as "Prestamos" from Prestamos where IdSucursal = 1;

-- d) �Cuantas copias del libro �PROGRAMACION DE GRAFICOS 3D� posee la 
-- biblioteca de la sucursal Santa Tecla?

select sum(NumCopias) as "Copias libro" from CopiasLibros c
inner join SucursalesBiblioteca s on c.IdSucursal = s.IdSucursal 
inner join Libros l on c.IdLibro = l.IdLibro
where c.IdSucursal = 2 and titulo like '%GRAFICOS%';

-- e) �Cu�ntas copias del libro �PROGRAMACION DE GRAFICOS 3D� posee cada una
-- de las sucursales de la biblioteca?

select nombreSucursal as "Nombre Sucursal", sum(NumCopias) as "Copias" from CopiasLibros c 
inner join SucursalesBiblioteca s on c.IdSucursal = s.IdSucursal 
inner join Libros l on c.IdLibro = l.IdLibro 
where titulo like '%GRAFICOS%' group by NombreSucursal;

-- f) Para cada sucursal de biblioteca, obtenga su nombre y el c�digo total de libros que
-- ha prestado hasta hoy.

select nombreSucursal as "Nombre Sucursal", count(IdPrestamo) as "Codigo Total" from SucursalesBiblioteca s 
inner join Prestamos p on s.IdSucursal = p.IdSucursal
where FechaSalida between '2008-12-31' and '2022-07-10' group by NombreSucursal;

-- g) De todos los lectores que han prestado m�s de dos libros, obtenga sus nombres,
-- direcciones y el n�mero total de libros prestados hasta la fecha.

select NombreLector as "Nombre Lector", DireccionLector as "Direccion Lector",
(select count(*) from Prestamos where Prestamos.NumTarjeta = Lectores.NumTarjeta) as "Prestados" from Lectores
where (select count(*) from Prestamos 
where FechaSalida between '2008-12-31' and '2022-07-10' and Lectores.NumTarjeta = Prestamos.NumTarjeta) > 2;

-- h) Genere un listado con el nombre de libro y el nombre de lector de todos aquellos
-- libros que se hayan prestado entre el �01/03/2009� y el �30/04/2009�

select l.Titulo as "Nombre Libro", lc.NombreLector "Nombre Lector", p.FechaSalida as "Fecha Salida" 
from Libros l, Lectores lc, prestamos p
where l.IdLibro = p.IdLibro and lc.NumTarjeta = p.NumTarjeta and p.FechaSalida between '2009-03-01' and '2009-04-30';

-- i) Genere una lista con todos los libros ordenados alfabeticamente por titulo y dentro
-- de cada titulo ordenado por editorial.

select l.Titulo as "Nombre libro", e.NombreEd as "Editorial" from Libros l
inner join Editoriales e on e.CodEditorial = l.CodEditorial
order by Titulo, NombreEd desc;

-- j) Obtenga una lista de los libros con el n�mero total de copias existentes de cada uno.
inner join CopiasLibros c on l.IdLibro = c.IdLibro 
-- menor a mayor.
