/*
Combinaciones Internas
----------------------
SELECT nombre_columnas_a_seleccionar
 FROM t1 [NATURAL] [INNER] JOIN t2
 {ON condiciones | USING (columna1 [, columna2...])}
 [WHERE condiciones];


Combinaciones Externas
----------------------
SELECT nombre_columnas_a_seleccionar
 FROM t1 [NATURAL] [LEFT|RIGHT|FULL] [OUTER] JOIN t2
 {ON condiciones | USING (columa1 [, columna2...]}
 [WHERE condiciones];

*/

/* 
Imaginemos que queremos vincular con un combinacion NATURAL INTERNA las tablas de los empleados y departamentos, para saber el codigo 
y el nombre de todos los empleados y el nombre y ciudad, telefono, email, de todos los departamentos 

Vamos a quedarnos con todas las columnas de empleados utilizando el NATURAL JOIN ya que se considera lo mismo que el INNER JOIN
*/
SELECT * FROM empleados e NATURAL JOIN departamentos d;

/* 
1. Como resultado nos devuele los empleados, pero no nos aparece el empleado numero 7, esto se debe a que el empleado 7 no esta
asignado a ningun departamento
2. Vemos tambien que en el departamento PRO no nos parece el de la ciudad de Palma, esto es por que no tienee ningun empleado asignado
*/

/* 
Vamos a realizar la misma busqueda pero con el INNER JOIN, pero debemos pasarle el USING indiandole: 
nombre_departamento y ciudad_departamento
*/
SELECT * FROM empleados e INNER JOIN departamentos d USING (nombre_departamento, ciudad_departamento);

/* Como pueden ver el resultado es el mismo*/

/*
Entonces, el JOIN Interno:
1. Obtengo todos los cruces posible validos, siempre y cuando nombre_departamento, ciudad_departamento existan en ambos a la hora
de realizar el cruce
2. No van a aparecer ni empleados que no esten asignado a un departamento, ni un departamento que no este asignado empleados
*/

/* 
Si quisieramos consultar esa informacion adicional podemos hacer un NATURAL JOIN EXTERNO

1. Para este ejemplo nos quedaremos con todas las columnas de empleados
2. Tomaremos NATURAL LEFT OUTER JOIN de la tabla departamento 
*/
SELECT * FROM empleados e NATURAL LEFT OUTER JOIN departamentos d;

/* 
Al hacer el cruce vemos que nos aparecen todos los empleados de antes pero ahora esta el empleado 7 en la propia consulta, 
vemos que no esta sociado a ningun departamento (NULL) pero si aparece como parte de la consulta, esto se debe a que cuando
hacemos un LEFT OUTER JOIN le estoy indicando cruzame todos los empleados con todos los departamento, pero la tabla de la 
izquierda (LEFT) que corresponde a empleados, pero si algun empleado tiene nombre_departamento y ciudad_departamento igual
a nulo, que siga apareciendo

NOTA: La palabra NATURAL de la consulta la podemos quitar pero deberemos poner un USING con los nombre de las columnas
*/

/* 
Vamos a realizar lo mismo pero ahora a la derecha RIGHT
*/
SELECT * FROM empleados e NATURAL RIGHT OUTER JOIN departamentos d;

/* 
En este caso nos devulve todos los empleados asociados a un departamento, pero ademas difura de la tabla departamento nos aparece 
el de Palma que no tiene ningun empleado asociado
*/

/* Si queremos juntar tanto la derecha como la izquieda esta el FULL pero MySQL no lo permite*/
/*SELECT * FROM empleados e NATURAL FULL OUTER JOIN departamentos d;*/