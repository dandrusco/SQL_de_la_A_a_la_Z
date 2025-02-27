/*
Tests de Existencia 
-------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE [NOT] EXISTS subconsulta;
*/

/* Buscaremos los codigos de los empleados asociado a un proyecto*/
SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);
 
 /* Ahora lo hacemos a la inversa, buscamos a quienes no estan asociado a algun proyecto*/
 SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE NOT EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);