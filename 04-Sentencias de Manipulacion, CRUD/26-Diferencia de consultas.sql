/*
Diferencia
==========

SELECT columnas FROM tabla1 [WHERE condiciones]
EXCEPT [ALL]
SELECT columnas FROM tabla2 [WHERE condiciones];


NOTA: Tambien no es disponible en MySQL aun que la podemos ejecutar de todos modos 
*/

/* 
Nos quedaremos con los clientes que no nos han contratado ningun proyecto
-------------------------------------------------------------------------
Por lo tanto nos quedamos con todos los id de los clientes excepto, los clientes que estan en la tabla proyectos
*/
SELECT c.id FROM clientes c
EXCEPT
SELECT p.id_cliente FROM proyectos p;

/*
Equivalencias con NOT IN y NOT EXISTS
-------------------------------------

SELECT columnas FROM tabla1 
WHERE columna NOT IN (SELECT columna FROM tabla2 [WHERE condiciones]);

SELECT columnas FROM tabla1
WHERE columna NOT EXISTS (SELECT * FROM tabla2 [WHERE condiciones]);

NOTA: Tambien puede quedar así con 1 en vez de *: WHERE columna NOT EXISTS (SELECT 1 FROM tabla2 [WHERE condiciones]);
*/

/* Equivalencias con NOT IN */
SELECT c.id FROM clientes c 
WHERE c.id NOT IN (SELECT p.id_cliente FROM proyectos p);

/* Equivalencias NOT EXISTS */
SELECT c.id FROM clientes c
WHERE NOT EXISTS (SELECT 1 FROM proyectos p WHERE c.id = p.id_cliente);

/* 
Diferencia entre SELECT * y SELECT 1 
------------------------------------
Con SELECT * FROM.... nos devuelve toda las columnas de la tabla a consultar, mientras que el SELECT 1 FROM.... nos devolvera solo 
un  1 si esta existe, por lo tanto no consume tantos recuerdos al realizar la consulta.
*/

SELECT * FROM proyectos;

SELECT 1 FROM proyectos;