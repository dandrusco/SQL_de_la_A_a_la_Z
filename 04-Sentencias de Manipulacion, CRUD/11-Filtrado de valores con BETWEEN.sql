/*
Encontrar valores comprendidos entre un mínimo y un máximo
----------------------------------------------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 WHERE columna BETWEEN limite_inferior AND limite_superior;
*/

/* 
BETWEEN nos sirve para entontrar rangos de valores evitando esta sintaxis:
columna >= limite_inferior AND columna <= limite_superior

Vamos a buscar los empleados que ganen entre 20.000 y 50.000 euros
Nos quedaremos con el ID, NOMBRE y SUELDO de la tabla EMPLEADOS
Donde el sueldo este entre los 200000 y 500000
*/
SELECT e.id, e.nombre, e.sueldo FROM empleados AS e
	WHERE e.sueldo BETWEEN 20000 AND 50000;
