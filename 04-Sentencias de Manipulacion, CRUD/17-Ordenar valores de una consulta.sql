/*
Ordenar una consulta
--------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 [WHERE condiciones]
 ORDER BY nombre_columna_según_la_cual_se_quiere_ordenar [{ASC | DESC}]
  [, col_ordenación [{ASC | DESC}] ...];
*/

/* 
Si queremos consultar los nombre de los empleados ordenados por el que gana menos dinero al que mas sueldo tiene
En el caso de empate, lo ordenara por alfabeticamente por su nombre
*/
SELECT e.id, e.nombre, e.apellido, e.sueldo FROM empleados AS e ORDER BY e.sueldo DESC, e.nombre ASC;