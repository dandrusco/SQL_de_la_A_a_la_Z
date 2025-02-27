/*
Consultar si existen o no valores nulos
---------------------------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 WHERE columna IS [NOT] NULL;
*/

/* Podemos buscar los empleados que NO estan asignado a ningun proyecto*/
SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NULL;

/* Podemos buscar los empleados que SI estan asignado a ningun proyecto*/
SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NOT NULL;