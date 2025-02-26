/*
Encontrar valores dentro de una colección
-----------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE columna [NOT] IN (valor1, valor2,..., valorN);
*/

/* Nos quedaremos con todos los departamentos que SI esten en la ciudad de Palma o Barcelona, mostrando el nombre y la ciudad*/
SELECT d.nombre, d.ciudad FROM departamentos AS d WHERE d.ciudad IN ("Palma", "Barcelona");

/* Nos quedaremos con todos los departamentos que NO esten en la ciudad de Palma o Barcelona, mostrando el nombre y la ciudad*/
SELECT d.nombre, d.ciudad FROM departamentos AS d WHERE d.ciudad NOT IN ("Palma", "Barcelona");