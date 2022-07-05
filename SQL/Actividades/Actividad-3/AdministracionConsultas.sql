/*

	Actividad Tres Administraci�n y Consultas sobre BD B2DB
	
	Nombre: Daniel Alessandro Garc�a Batres N�13

	EJERCICIOS PR�CTICOS

	Suponga que se aplican las siguientes operaciones de actualizaci�n
	directamente sobre la base de datos EMPRESA. Analice todas las
	restricciones de integridad y si se violan, encuentre la forma adecuada para
	imponer cada una de las restricciones que se presentan.

*/

use BDEmpresa;

insert into Empleados values (943775543, 'Roberto', 'Morales', '1952-06-21', '25 Calle Oriente, Pasaje A, Col El Porvenir, Santa Tecla', 'M', 1400, '888665555', 1);
insert into Proyectos values (4, 'ProductoA', 'Escal�n');
insert into Departamentos values ('Producci�n', 2, '943775543', '1998-10-01');

delete from TrabajaEn where IdEmpleado = 987654321;
delete from Proyectos where NombreProy = 'ProductoX';

update Departamentos set IdJefe = 123456789, FechaNC = '1999-10-01' where NDepto = 5;
update Empleados set IdSupervisor = 943775543 where IdSupervisor = 999887777;
update TrabajaEn set Horas = 5.0 where IdEmpleado = 999887777 and NumProy = 10;

/*

	EJERCICIOS PR�CTICOS

	1. En base a la informaci�n de la base de datos BIBLIOTECA hecha en pr�cticas
	anteriores, realice las siguientes consultas:

*/

use BDBiblioteca;

select top 5 * from Libros order by IdLibro desc;

select distinct NombreEd as "Editoriales" from Libros l, Editoriales e where e.CodEditorial = l.CodEditorial;

select * from Libros where Titulo like '%DISE�O%';

/*

	2. En base a la informaci�n de la base de datos EMPRESA hecha en pr�cticas
	anteriores, realice la siguiente consulta:

*/

use BDEmpresa;

select distinct Salario from Empleados;

/*

	3. En base a la informaci�n de la base de datos CONTROL DE PEDIDOS hecha
	en pr�cticas anteriores, realice las siguientes consultas:

*/

use BDControlPedidos;

select distinct NombreCliente as "Nombre Cliente" from Clientes c, Pedidos p where c.IdCliente = p.IdCliente and FechaPedido like '%02%' or FechaPedido like '%03%';

select distinct NombreCliente as "Nombre Cliente" from Clientes where NombreCliente like '%a';

select NombreArtic as "Nombre del articulo", PrecioUni as "Precio" from Articulos order by PrecioUni desc;

/*

	Ejercicios Practicos

*/

-- 1. Desplegar los id y los nombres de los empleados que pertenecen al mismo
-- departamento que �Daniel Fernando�.

use BDEmpresa;

select IdEmpleado as "ID", NombreEmpleado as "Nombre Empleado" from Empleados where NDepto = 5;

-- 2. Imprimir el id, el nombre, el precio unitario, el precio mayor y el precio menor
-- de los art�culos.

use BDControlPedidos;

select * from Articulos;

select max(PrecioUni) as "Precio Mayor" from Articulos;
select min(PrecioUni) as "Precio Menor" from Articulos;

-- 3. Mostrar el id, el nombre y el promedio general de las ventas de la tabla
-- art�culo.

select IdArticulo as "ID Articulo", NombreArtic as "Nombre Articulo" from Articulos;
select avg(TotalImporte) as "Promedio de Ventas" from Pedidos;

-- 4. Se desea conocer el id, el nombre y la cantidad de pedidos de los art�culos
-- con m�s de 2 pedidos.

select * from PedArt;
select * from Pedidos;

select ar.IdArticulo as "Id del articulo", ar.NombreArtic as "Nombre del articulo", pr.Cantidad as "Cantidad de articulos" 
from Articulos ar, Pedidos p, PedArt pr where ar.IdArticulo = pr.IdArticulo and p.IdPedido = pr.IdPedido;