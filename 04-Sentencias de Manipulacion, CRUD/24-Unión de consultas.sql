/*
Unión
=====
SELECT columnas FROM tabla [WHERE condiciones]
UNION [ALL]
SELECT columnas FROM tabla [WHERE condiciones];
*/

/* 
Si queremos saber todas las ciudades que hay en nuesta BBDD
----------------------------------------------------------
Sabemos que tenos ciudades tanto en clientes como en depatamentos, por lo tanto podemos hacer una union
*/ 
SELECT ciudad FROM clientes
UNION
SELECT ciudad_departamento FROM departamentos;

/* 
Como resultado nos muestra las 4 ciudades, si a esta misma consulta le agregamos un ALL nos mostrara todas las ciudades con sus duplicados*/
SELECT ciudad FROM clientes
UNION ALL
SELECT ciudad_departamento FROM departamentos;

/* 
Como podemos unir un  NATURAL LEFT OUTER JOI con un  NATURAL RIGHT OUTER JOIN para crear una FULL?
--------------------------------------------------------------------------------------------------
1. Tomaremos las dos consultas creada en las clases anteriores, tanto la de LEFT como la de RIGHT y las uniremos
*/
SELECT * FROM empleados e NATURAL LEFT OUTER JOIN departamentos d
UNION
SELECT * FROM empleados e NATURAL RIGHT OUTER JOIN departamentos d;

/* 
Como resultado hemos unido todos los resultados de LEFT con los de RIGHT
Pero pasa algo raro en este resultado, Si revisamos nombre_departamento y cuidad_departamento vemos que esta todo bien, pero al revisar
el ID notamos que despues del ID 8 aparecen los numero de telefono

Esto ocurre, por que para que la union se realice satisfactoriamente debemos procurar que se efectue entre columnas definidas sobre 
dominios compatible, por lo tanto deberemos indicar que columnas vamos a utilizar:
	e.id, e.nombre, e.apellido, d.nombre_departamento, d.ciudad_departamento, d.email 
Estas mismas columas la debemos meter en ambos SELECT
*/
SELECT e.id, e.nombre, e.apellido, d.nombre_departamento, d.ciudad_departamento, d.email 
 FROM empleados e NATURAL LEFT OUTER JOIN departamentos d
UNION
SELECT e.id, e.nombre, e.apellido, d.nombre_departamento, d.ciudad_departamento, d.email 
 FROM empleados e NATURAL RIGHT OUTER JOIN departamentos d;
 
/* Ahora vemos que nos muestra tanto al empleado que no tiene departamento asignado ni los departametos que no tiene empleado asingnado*/