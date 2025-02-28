/*
SQL Completo version JOIN
=========================

SELECT nombre_columnas_a_seleccionar
 FROM tabla1 [[AS] t1] JOIN tabla2 [[AS] t2]
 {ON condiciones_cruce | USING (columna1 [, columna2,...])}
 [WHERE condiciones_filtrado];
*/

/* Tomando el ejemplo anterior, agregaremos el id_cliente de la tabla proyecto */
SELECT p.id, p.nombre, p.precio, p.id_cliente, c.id, c.nif, c.nombre 
 FROM clientes c, proyectos p
 WHERE c.id = p.id_cliente
 AND c.id = 20;

/* 
Podemos observar que id_cliente y id tienen el mismo valor 20
Comensaremos a realizar los siguientes cambios. 
1. En vez de poner FROM clientes c, proyectos p, reemplazaremos la "coma" por JOIN
2. En la condicion del  WHERE, lo debemos reemplazar por el ON
3. Y la condicion del filtrado AND c.id = 20, reemplazamos el AND por el WHERE
*/
SELECT p.id, p.nombre, p.precio, p.id_cliente, c.id, c.nif, c.nombre 
 FROM clientes c JOIN proyectos p
 ON c.id = p.id_cliente
 WHERE c.id = 20;

/* 
En el caso del ON, no solo debe ser de caracter de comparacion, tambien podemos poner un mayor que, menor que, etc
Vamos con otro ejemplo:
Pediremos los apellidos de los empleados que ganan mas que el empleado numero 5
Para ello, primero filtraremos al empleado 5 para ver cuanto gana el.
*/
SELECT * FROM empleados WHERE id=5;

/*
Ahora toca juntar la tabla empleados contra Ricardo Alberich, que a su vez es una fila de la tabla empleados
En otras palablas deberemos juntar la tabla empleados con sigo misma

1.- Lo primero sera recuperar los datos del id, nombre, apellido y sueldo de la tabla empleados, como llamaremos dos veces a 
esta tabla empleados, la renombraremos a e1:
	SELECT e1.id, e1.nombre, e1.apellido, e1.sueldo
	FROM empleados e1
2. Ahora agregaremos el JOIN para juntar nuevamente con la tabla empleados pero la llamaremos e2
	SELECT e1.id, e1.nombre, e1.apellido, e1.sueldo
	FROM empleados e1 JOIN empleados e2
3. Como necesitamos sacar a los empleados de la primera tabla que ganen mas que el empleado de la segunda tabla con el ID 5, 
por lo tanto meteremos un ON comparando que el sueldo de los empleados 1 sea > el sueldo de los empleados 2
4. Solo falta definir con quien me quedare de la tabla empleados 2? Con el numero 5 WHERE e2.id = 5;
*/
SELECT e1.id, e1.nombre, e1.apellido, e1.sueldo
 FROM empleados e1 JOIN empleados e2 ON e1.sueldo > e2.sueldo
 WHERE e2.id = 5;