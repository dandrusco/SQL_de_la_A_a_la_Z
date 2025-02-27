/*
Todas / Algunas filas cumplen una condición
-------------------------------------------

SELECT nombre_columnas_a_consutar
 FROM tabla_a_consultar
 WHERE columna operador_de_comparación {ALL | ANY | SOME} subconsulta;
 
 - ALL: la comparación se cumple para todos los valores de la subconsulta
 - ANY/SOME: la comparación se cumple para al menos un valor de la subconsulta
*/

/* 
Vamos a buscar codigo y nombre de todos los proyectos,  donde los sueldo de los empleados que trabajen en ese proyecto, son mas 
pequeño que el precio blobal del proyecto
*/
SELECT p.id, p.nombre FROM proyectos AS p 
 WHERE p.precio > ALL (SELECT e.sueldo FROM empleados AS e WHERE e.id_proyecto = p.id);

/* 
Vamos a buscar codigo y nombre de los proyectos,  que tiene algun empleado que gana un sueldo mas elevado que el precio del proyecto
en el que trabaja (por logica no deberia arrojar resultado)
*/
SELECT p.id, p.nombre FROM proyectos AS p
 WHERE p.precio < SOME (SELECT e.sueldo FROM empleados as e WHERE e.id_proyecto = p.id);