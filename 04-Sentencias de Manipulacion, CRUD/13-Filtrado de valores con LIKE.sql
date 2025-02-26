/*
Encontrar cadenas de caracteres que empiezan/terminan/contienen caracteres
--------------------------------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE columna LIKE característica;
 
- % para expresar una secuencia de caracteres
- _ para caracteres indivuals presentes en la búsqueda
*/

SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "J%";
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%O%";
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%A";

SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "M______";
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_____";
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_E___";


/*
Consultar si existen o no valores nulos
---------------------------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 WHERE columna IS [NOT] NULL;
*/

SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NULL;
SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NOT NULL;


/*
Todas / Algunas filas cumplen una condición
-------------------------------------------

SELECT nombre_columnas_a_consutar
 FROM tabla_a_consultar
 WHERE columna operador_de_comparación {ALL | ANY | SOME} subconsulta;
 
 - ALL: la comparación se cumple para todos los valores de la subconsulta
 - ANY/SOME: la comparación se cumple para al menos un valor de la subconsulta
*/

SELECT p.id, p.nombre FROM proyectos AS p 
 WHERE p.precio > ALL (SELECT e.sueldo FROM empleados AS e WHERE e.id_proyecto = p.id);

SELECT p.id, p.nombre FROM proyectos AS p
 WHERE p.precio < SOME (SELECT e.sueldo FROM empleados as e WHERE e.id_proyecto = p.id);
 
/*
Tests de Existencia
-------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE [NOT] EXISTS subconsulta;
*/

SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);
 
 SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE NOT EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);


/*
Ordenar una consulta
--------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 [WHERE condiciones]
 ORDER BY nombre_columna_según_la_cual_se_quiere_ordenar [{ASC | DESC}]
  [, col_ordenación [{ASC | DESC}] ...];
*/

SELECT e.id, e.nombre, e.apellido, e.sueldo FROM empleados AS e ORDER BY e.sueldo DESC, e.nombre ASC;


/*
Consultas con Agrupaciones de Filas en una Tabla
------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 [WHERE condiciones]alter
 GROUP BY nombre_columnas_según_las_cuales_se_quiere_agrupar
 [HAVING condicion_para_los_grupos]
 [ORDER BY columna_ordenacion[DESC][, columna [DESC]...]];
*/

SELECT e.nombre_departamento AS nDep, e.ciudad_departamento as cDep, AVG(e.sueldo) AS sueldo_medio 
 FROM empleados AS e
 GROUP BY nDep, cDep;
 
SELECT e.id_proyecto as nPro, SUM(e.sueldo) as coste_anual
 FROM empleados as e
 GROUP BY nPro
 HAVING coste_anual > 150000;