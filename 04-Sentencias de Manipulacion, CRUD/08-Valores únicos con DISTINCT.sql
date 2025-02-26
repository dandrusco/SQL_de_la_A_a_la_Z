/*
Obtener todos los valores únicos y sin repeticiones
---------------------------------------------------
SELECT DISTINCT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 [WHERE condiciones];
*/

/* Si queremos ver los sueldo que se estan pagando a los empleados pero sin repeticiones lo hacemos con DISTINCT */
SELECT DISTINCT e.sueldo FROM empleados AS e;