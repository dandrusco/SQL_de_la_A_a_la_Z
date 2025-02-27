/*
Consultas con Agrupaciones de Filas en una Tabla
------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 [WHERE condiciones]alter
 GROUP BY nombre_columnas_según_las_cuales_se_quiere_agrupar
 [HAVING condicion_para_los_grupos] (OPCIONAL)
 [ORDER BY columna_ordenacion[DESC][, columna [DESC]...]];
*/

/* Queremos saber el sueldo promedio que ganan los empleados por departamento, primero filtraremos todos los empleados*/
SELECT * FROM empleados AS e;

/* 
Si lo queremos por departamento, recordar que se compone por nombre y ciudad.
Ahora buscaremos el prmedio de sueldo para los empleados
Necesitamos hacer un GROUP BY para unir el nombre y ciudad
*/
SELECT e.nombre_departamento, e.ciudad_departamento, AVG(e.sueldo)
 FROM empleados AS e
 GROUP BY e.nombre_departamento, e.ciudad_departamento;
 
/* 
Para entender mejor aun le podemos ir agregando alias a todo el codifo:
- e.nombre_departamento AS nDep
- e.ciudad_departamento as cDep
- AVG(e.sueldo) AS sueldo_medio

Por lo tanto ahora el GROUP BY queda así nDep, cDep;
*/
SELECT e.nombre_departamento AS nDep, e.ciudad_departamento as cDep, AVG(e.sueldo) AS sueldo_medio 
 FROM empleados AS e
 GROUP BY nDep, cDep;
 
/*
Ahora si queremos saber cuales son los proyectos en que la suma total de los sueldos de los empleados participando en ese proyecto 
es mas de 150.000 euros
1. Partiremos creando una consulta para obtener el ID del proyecto que lo llamaremos nPro
2. Seleccionaremos la tabla empleados renombrandola a e
3. Lo agruparemos por el ide del proyecto que lo hemos llamado nPro
*/
SELECT e.id_proyecto as nPro
 FROM empleados as e
 GROUP BY nPro;
 
/* 
Lo que nos devulve esta consulta es que hay empleados que no estan asignado a ningun proyecto y otros a proyecto 1, 3 y 4 
Ahora le agregaremos la suma de los sueldos a cada proyecto llamandola coste_anual
*/
 SELECT e.id_proyecto as nPro, SUM(e.sueldo) as coste_anual
 FROM empleados as e
 GROUP BY nPro;
 
/* 
Lo que nos devulve esta consulta es que hay empleados que no estan asignado con un sueldo de 30.000 y otros a proyecto 1 con sueldo 
de 140.000, proyecto 3 con 100.000 y proyecto 4 con 200.000 euros

Ya tendiendo esta informacion podemos agregar HAVING para quedarnos solo con los costos anuales que superen los 150.000 euros
*/
 
SELECT e.id_proyecto as nPro, SUM(e.sueldo) as coste_anual
 FROM empleados as e
 GROUP BY nPro
 HAVING coste_anual > 150000;