/*
Los ejercicios siguientes se harán sobre la base de datos relacional BDINFO que ha ido apareciendo a lo largo de este curso. 
----------------------------------------------------------------------------------------------------------------------------

1. Obtene los códigos y los nombres y apellidos de los empleados, ordenados alfabéticamente de forma descendente por apellido y, 
en caso de repeticiones, por nombre.
*/
SELECT apellido, nombre, id
FROM empleados
ORDER BY apellido DESC, nombre DESC;

/*
2. Consulta el código y el nombre de los proyectos de los clientes que son de Barcelona. 
*/
SELECT  p.id, p.nombre
FROM proyectos p JOIN clientes c 
ON c.id = p.id_cliente 
WHERE c.ciudad = "Barcelona"; 

/*
3. Obtener los nombres y las ciudades de los departamentos que trabajan en los proyectos número 3 y número 4. 
*/
SELECT DISTINCT e.nombre_departamento, e.ciudad_departamento
FROM empleados e
WHERE e.id_proyecto IN (3,4);

/*
4. De todos los empleados que perciben un sueldo de entre 50.000 y 80.000 euros, busca los códigos de empleado y los nombres de los 
proyectos que tienen asignados. 
*/
SELECT e.id, p.nombre
FROM empleados e JOIN proyectos p ON e.id_proyecto = p.id 
WHERE e.sueldo BETWEEN 50000 AND 80000; 

/*
5. Busca el nombre, la ciudad y el teléfono de los departamentos donde trabajan los empleados del proyecto GESCOM. 
*/
SELECT DISTINCT d.nombre_departamento, d.ciudad_departamento, d.telefono 
FROM departamentos d NATURAL JOIN empleados e JOIN proyectos p 
ON e.id_proyecto = p.id 
WHERE p.nombre = "GESCOM"; 

/*
6. Obtener los códigos y los nombres y apellidos de los empleados que trabajan en los proyectos de precio más alto. 
*/
SELECT e.id, e.nombre, e.apellido
FROM empleados e JOIN proyectos p 
ON e.id_proyecto = p.id 
WHERE p.precio = (SELECT MAX(p1.precio) 
FROM proyectos p1);

/*
7. Averigua cuál es el sueldo más alto de cada departamento. Concretamente, es necesario dar el nombre y la ciudad del departamento 
y el sueldo más elevado. 
*/
SELECT  nombre_departamento, ciudad_departamento, MAX(sueldo) AS sueldo_maximo
FROM empleados
GROUP BY nombre_departamento, ciudad_departamento;

/*
8. Obtener los códigos y los nombres de los clientes que tienen más de un proyecto contratado. 
*/
SELECT c.id, c.nombre
FROM proyectos p JOIN clientes c ON c.id = p.id_cliente 
GROUP BY c.id, c.nombre
HAVING COUNT(*) > 1;

/*
9. Averigua los códigos y los nombres de los proyectos cuyos empleados asignados tienen un sueldo superior a 30.000 euros. 
*/
SELECT  p.id, p.nombre
FROM empleados e JOIN proyectos p 
ON e.id_proyecto = p.id 
GROUP BY p.id, p.nombre
HAVING MIN(e.sueldo)>30000; 

/*
10. Busca los nombres y las ciudades de los departamentos que no tienen ningún empleado asignado. 
*/
SELECT d.nombre_departamento, d.ciudad_departamento
FROM departamentos d
WHERE NOT EXISTS (SELECT *
                  FROM empleados e
                  WHERE e.nombre_departamento = d.nombre_departamento AND
                  e.ciudad_departamento = d.ciudad_departamento);