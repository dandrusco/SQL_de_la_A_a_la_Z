/*
SQL Completo
============

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

/* Podemos observar que id_cliente y id tienen el mismo valor 20*/
 
SELECT p.id, p.nombre, p.precio, p.id_cliente, c.id, c.nif, c.nombre 
 FROM clientes c JOIN proyectos p
 ON c.id = p.id_cliente
 WHERE c.id = 20;
 
SELECT e1.id, e1.nombre, e1.apellido, e1.sueldo
 FROM empleados e1 JOIN empleados e2 ON e1.sueldo > e2.sueldo
 WHERE e2.id = 5;
 
 /*
 Combinación Natural
 -------------------
 SELECT nombre_columnas_a_seleccionar
  FROM tabla1 NATURAL JOIN tabla
  [WHERE condiciones];
 */
 
 SELECT * FROM empleados NATURAL JOIN departamentos 
  WHERE email = "dirb@frogames.es";
  
SELECT e.id, e.nombre, e.apellido FROM empleados e JOIN departamentos d
 USING (nombre_departamento, ciudad_departamento)
 WHERE email = "dirb@frogames.es";
 

/*
Combinaciones Internas
----------------------
SELECT nombre_columnas_a_seleccionar
 FROM t1 [NATURAL] [INNER] JOIN t2
 {ON condiciones | USING (columna1 [, columna2...])}
 [WHERE condiciones];


Combinaciones Externas
----------------------
SELECT nombre_columnas_a_seleccionar
 FROM t1 [NATURAL] [LEFT|RIGHT|FULL] [OUTER] JOIN t2
 {ON condiciones | USING (columa1 [, columna2...]}
 [WHERE condiciones];

*/

SELECT * FROM empleados e NATURAL JOIN departamentos d;

SELECT * FROM empleados e INNER JOIN departamentos d USING (nombre_departamento, ciudad_departamento);

SELECT * FROM empleados e NATURAL LEFT OUTER JOIN departamentos d;

SELECT * FROM empleados e NATURAL RIGHT OUTER JOIN departamentos d;

/*SELECT * FROM empleados e NATURAL FULL OUTER JOIN departamentos d;*/

SELECT * 
 FROM empleados e, proyectos p, clientes c
 WHERE e.id_proyecto = p.id AND p.id_cliente = c.id;
 
SELECT * 
 FROM (empleados e JOIN proyectos p ON e.id_proyecto = p.id)
 JOIN clientes c ON p.id_cliente = c.id;
 
 
/*
Unión
=====
SELECT columnas FROM tabla [WHERE condiciones]
UNION [ALL]
SELECT columnas FROM tabla [WHERE condiciones];
*/

SELECT ciudad FROM clientes
UNION
SELECT ciudad_departamento FROM departamentos;


SELECT e.id, e.nombre, e.apellido, d.nombre_departamento, d.ciudad_departamento, d.email 
 FROM empleados e NATURAL LEFT OUTER JOIN departamentos d
UNION
SELECT e.id, e.nombre, e.apellido, d.nombre_departamento, d.ciudad_departamento, d.email 
 FROM empleados e NATURAL RIGHT OUTER JOIN departamentos d;
 
/*
Intersección
============

SELECT columnas FROM tabla [WHERE condiciones]
INTERSECT [ALL]
SELECT columnas FROM tabla [WHERE condiciones]
*/

(SELECT ciudad FROM clientes)
INTERSECT
(SELECT ciudad_departamento FROM departamentos);

/*
Equivalencias con IN y EXISTS
-----------------------------

SELECT columnas FROM tabla1
WHERE columna IN (SELECT columna FROM tabla2 [WHERE condiciones]);

SELECT columnas FROM tabla1
WHERE EXISTS (SELECT * FROM tabla2 [WHERE condiciones]);
*/

SELECT c.ciudad FROM clientes c
WHERE c.ciudad IN (SELECT d.ciudad_departamento FROM departamentos d);

SELECT c.ciudad FROM clientes c
WHERE EXISTS (SELECT 1 FROM departamentos d WHERE c.ciudad = d.ciudad_departamento);

/*
Diferencia
==========

SELECT columnas FROM tabla1 [WHERE condiciones]
EXCEPT [ALL]
SELECT columnas FROM tabla2 [WHERE condiciones];

*/

(SELECT c.id FROM clientes c)
EXCEPT
(SELECT p.id_cliente FROM proyectos p);

/*
Equivalencias con NOT IN y NOT EXISTS
-------------------------------------

SELECT columnas FROM tabla1 
WHERE columna NOT IN (SELECT columna FROM tabla2 [WHERE condiciones]);

SELECT columnas FROM tabla1
WHERE columna NOT EXISTS (SELECT * FROM tabla2 [WHERE condiciones]);
*/

SELECT c.id FROM clientes c 
WHERE c.id NOT IN (SELECT p.id_cliente FROM proyectos p);

SELECT c.id FROM clientes c
WHERE NOT EXISTS (SELECT 1 FROM proyectos p WHERE c.id = p.id_cliente);