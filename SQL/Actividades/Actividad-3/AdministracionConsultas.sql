/*

	Actividad Tres Administracion y Consultas sobre BD B2DB
	
	Nombre: Daniel Alessandro Garcia Batres N°13

	EJERCICIOS PRACTICOS

	Suponga que se aplican las siguientes operaciones de actualizacion
	directamente sobre la base de datos EMPRESA. Analice todas las
	restricciones de integridad y si se violan, encuentre la forma adecuada para
	imponer cada una de las restricciones que se presentan.

*/

use BDEmpresa;

insert into Empleados values (943775543, 'Roberto', 'Morales', '1952-06-21', '25 Calle Oriente, Pasaje A, Col El Porvenir, Santa Tecla', 'M', 1400, '888665555', 1);
insert into Proyectos values (4, 'ProductoA', 'Escalón');
insert into Departamentos values ('Producción', 2, '943775543', '1998-10-01');

delete from TrabajaEn where IdEmpleado = 987654321;
delete from Proyectos where NombreProy = 'ProductoX';

update Departamentos set IdJefe = 123456789, FechaNC = '1999-10-01' where NDepto = 5;
update Empleados set IdSupervisor = 943775543 where IdSupervisor = 999887777;
update TrabajaEn set Horas = 5.0 where IdEmpleado = 999887777 and NumProy = 10;

/*

	EJERCICIOS PRACTICOS

	1. En base a la informacion de la base de datos BIBLIOTECA hecha en prácticas
	anteriores, realice las siguientes consultas:

*/

use BDBiblioteca;

select top 5 * from Libros order by IdLibro desc;

select distinct NombreEd as "Editoriales" from Libros l, Editoriales e where e.CodEditorial = l.CodEditorial;

select * from Libros where Titulo like '%DISEÑO%';

/*

	2. En base a la información de la base de datos EMPRESA hecha en practicas
	anteriores, realice la siguiente consulta:

*/

use BDEmpresa;

select distinct Salario from Empleados;

/*

	3. En base a la información de la base de datos CONTROL DE PEDIDOS hecha
	en practicas anteriores, realice las siguientes consultas:

*/

use BDControlPedidos;

select distinct NombreCliente as "Nombre Cliente", p.FechaPedido as"Fecha pedido" from Clientes c, Pedidos p where c.IdCliente = p.IdCliente and FechaPedido like '%02%' or FechaPedido like '%03%';

select distinct NombreCliente as "Nombre Cliente" from Clientes where NombreCliente like '%a';

select NombreArtic as "Nombre del articulo", PrecioUni as "Precio" from Articulos order by PrecioUni desc;

/*

	Ejercicios Practicos

*/

-- 1. Desplegar los id y los nombres de los empleados que pertenecen al mismo
-- departamento que “Daniel Fernando”.

use BDEmpresa;

select IdEmpleado as "ID", NombreEmpleado as "Nombre Empleado" from Empleados where NDepto = 5;

-- 2. Imprimir el id, el nombre, el precio unitario, el precio mayor y el precio menor
-- de los artículos.

use BDControlPedidos;

select * from Articulos;

select max(PrecioUni) as "Precio Mayor" from Articulos;
select NombreArtic as "Nombre del Articulo", IdArticulo as "Id Articulo", PrecioUni as "Precio Articulo" from articulos where PrecioUni=1090;

select min(PrecioUni) as "Precio Menor" from Articulos;
select NombreArtic as "Nombre del Articulo", IdArticulo as "Id Articulo", PrecioUni as "Precio Articulo" from articulos where PrecioUni=54;

-- 3. Mostrar el id, el nombre y el promedio general de las ventas de la tabla
-- articulo.

select IdArticulo as "ID Articulo", NombreArtic as "Nombre Articulo" from Articulos;
select avg(TotalImporte) as "Promedio de Ventas" from Pedidos;

-- 4. Se desea conocer el id, el nombre y la cantidad de pedidos de los articulos
-- con más de 2 pedidos.

select ar.IdArticulo as "Id articulo", ar.NombreArtic as "Nombre del articulo", pr.Cantidad as "Cantidad de articulos" 
from Articulos ar, Pedidos p, PedArt pr where ar.IdArticulo = pr.IdArticulo and p.IdPedido = pr.IdPedido  and pr.Cantidad>=2;

-- 5. Listar el codigo, el nombre y el promedio de horas de los empleados que
-- tienen un promedio mayor al promedio general.

use BDEmpresa;

select avg(Horas) as "Promedio General" from TrabajaEn;

select e.IdEmpleado as "Codigo de empleado", e.NombreEmpleado as "Nombre Empleado", t.Horas as "Promedio de horas" 
from Empleados e, TrabajaEn t where e.IdEmpleado = t.IdEmpleado and t.Horas >= 19;

/*

	Vease referencia: Repositorio( https://github.com/danielbatres/Modulos/blob/main/SQL/Actividades/Actividad-3/AdministracionConsultas.sql )

*/