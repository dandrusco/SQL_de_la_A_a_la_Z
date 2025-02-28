/*
 Combinación Natural
 -------------------
 SELECT nombre_columnas_a_seleccionar
  FROM tabla1 NATURAL JOIN tabla2
  [WHERE condiciones];
 */
 
 /* 
 Para este ejemplo debemos renombrar las columnas de la tabla deparamento, para ello seleccinamos la tabla, boton derecho Alter Table
 Renombraremos nombre por nombre_departamento y ciudad por ciudad_departamento
 Luego le damos en el boton de aplicar
 */ 
 
 /* Para este ejemplo nos quedaremos con todas las columnas de la tabla empleados y departametos*/
 SELECT * FROM empleados NATURAL JOIN departamentos;
 
 /*
 Vemos que apesar que nombre_departamento y ciudad_departamento esta repetido en las tablas empleados y departamentos, en la consulta
 solo nos muestra una vez
 En cambio si eliminamos NATURAL vemos que se nos repite en la cosulta
 
 NOTA: Como pueden aprciar para que este funcione ambas columnas deben llamarse iguales
 */
  SELECT * FROM empleados JOIN departamentos;
 
 /* Tomando el ejmplo anterior ahora podemos filtrar para que solo nos devuelva el campo donde el mail sea igual a dirb@frogames.es*/
 SELECT * FROM empleados NATURAL JOIN departamentos 
  WHERE email = "dirb@frogames.es";

/* 
Vamos con otro ejemplo: 
-----------------------
1. Nos quedaremos con el ID, NOMBRE y APELLIDO de la tabla empleados uniendola a la tabla departamentos
2. Ahora atravez de la palabra reservada USING, podemos indicarle entre parentesis el nombre de las columnas que se tienen que utilizar
en el JOIN, si no se especifican tomara las claves primarias o foreana por defecto. En el caso de indicarlas, se deben llamar igual
3. Para finalizar filtraremos por email igual a "dirb@frogames.es"
*/  
SELECT e.id, e.nombre, e.apellido FROM empleados e JOIN departamentos d
 USING (nombre_departamento, ciudad_departamento)
 WHERE email = "dirb@frogames.es";

/* De esta forma obtenemos lo mismo del NATURAL JOIN pero en este caso utilizando el USING*/