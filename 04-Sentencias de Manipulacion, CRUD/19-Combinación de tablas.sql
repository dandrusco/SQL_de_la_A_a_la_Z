/*
Combinación
===========

SELECT nombre_columnas_a_seleccionar
 FROM tabla1 [[AS] t1], tabla2 [[AS] t2]
 WHERE condiciones_cruce [AND otras_condiciones_de_filtrado];
*/

/* 
Crearemos un ejemplo donde no ocuparemos alias para que puedan entender la importancia de utilizarlos 
-----------------------------------------------------------------------------------------------------

1. Vamos a obtener el NIF de un cliente, el codigo y precio del proyecto que desarrollamos a ese cliente, el cliente sera el numero 20
2. Como tanto clientes como proyectos tienen una columna llamada nombre, deberemos especificar a cual corresponde cada uno, deberemos
anteponer la tabla clientes.nombre y proyectos.nombre
*/
SELECT proyectos.id, proyectos.nombre, proyectos.precio, clientes.nif, clientes.nombre 
 FROM clientes, proyectos;
 
/*
Al compilar estas lieneas vemos como ahora GESCOM aparece 4 veces cruzado con los 4 nombres de clientes, lo mismo para PETSI, 
MOPATEX y UNIPOT 

Esto no es lo que queremos, ya que lo que buscamos es que cada cliente este con su proyecto, esto lo solucionamos en el WHERE, indicandole
la condicion de cruce que el ID de la tabla cliente tiene que coincidir con ID del cliente en la tabla proyectos 
*/
SELECT proyectos.id, proyectos.nombre, proyectos.precio, clientes.nif, clientes.nombre 
 FROM clientes, proyectos
 WHERE clientes.id = proyectos.id_cliente;
 
/* 
Ahora si por cada proyecto nos saldra la informacion del cliente
Pero el ejemplo exigia que esto fuera unico para el cliente numero 20
Esto lo solucionamos con un AND
*/
 SELECT proyectos.id, proyectos.nombre, proyectos.precio, clientes.nif, clientes.nombre 
 FROM clientes, proyectos
 WHERE clientes.id = proyectos.id_cliente
 AND clientes.id = 20;
 
/*
Al hacerlo asi nos aparece que el proyecto es MOPATEX del cliente DUBVI
Vamos a agregar a clientes.id a la seleccion de columnas y lo compilamos
*/ 
SELECT proyectos.id, proyectos.nombre, proyectos.precio, clientes.id, clientes.nif, clientes.nombre 
 FROM clientes, proyectos
 WHERE clientes.id = proyectos.id_cliente
 AND clientes.id = 20;
 
/* 
Vemos como ahora tenemos repetido dos veces ID y NOMBRE de alli la importanca de anteponer a que tabla pertenece, ya que si colocamos:
	SELECT id, nombre, id, nombre 
	FROM clientes, proyectos
Esto nos dara error ya que no sabe a cual corresponde

Pero en este caso vemos que al tener los nombres de las tablas se agranda mucho la linea de consulta:
SELECT proyectos.id, proyectos.nombre, proyectos.precio, clientes.id, clientes.nif, clientes.nombre 

Para poder achicar esto implementaremos los alias para las tablas clientes c, proyectos p
Y modificamos el SELECT p.id, p.nombre, p.precio, c.id, c.nif, c.nombre
Lo mismo para WHERE c.id = p.id_cliente y AND c.id = 20
*/
 
SELECT p.id, p.nombre, p.precio, c.id, c.nif, c.nombre 
 FROM clientes c, proyectos p
 WHERE c.id = p.id_cliente
 AND c.id = 20;