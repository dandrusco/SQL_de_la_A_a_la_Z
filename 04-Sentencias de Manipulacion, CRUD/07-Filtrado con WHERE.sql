/*
Consultas a las tablas de una BDR
=================================

SELECT nombre_columna_a_seleciconar [[AS] columna_renombrada]
	[, nombre_columna_a_seleciconar [[AS] columna_renombrada] ... ]
FROM tabla_a_consultar [[AS] tabla_renombrada]
WHERE condiciones_de_filtro_de_filas;
*/

/* 
Nos quedaremos con las columnas id y nombre de la tabla empleados, la tabla empleados la renombraremos a e 
Filtraremos de los empleados a los que el id_proyecto sea igual a 4
*/
SELECT e.id, e.nombre FROM empleados AS e WHERE e.id_proyecto = 4;

/*
Condiciones de Filtro
---------------------
- Operadores de Comparación: =, < , >, <=, >=, <>
- Operadores Lógicos: NOT (negar una condición), AND (conjunción de condiciones), OR (disyunción de condiciones)
*/

/* 
Tomando el mismo ejemplo de quedarnos con las columnas id y nombre de la tabla empleados, la tabla empleados la renombraremos a e 
filtrando de los empleados a los que el id_proyecto sea igual a 4 pero ahora le agregaremos un comparador logico AND para quedarnos
tambien con los sueldos mayor o igual a 60.000
*/
SELECT e.id, e.nombre FROM empleados AS e WHERE e.id_proyecto = 4 AND e.sueldo >= 60000;
