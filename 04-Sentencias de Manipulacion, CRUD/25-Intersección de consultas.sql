/*
Intersección
============

SELECT columnas FROM tabla [WHERE condiciones]
INTERSECT [ALL]
SELECT columnas FROM tabla [WHERE condiciones]
*/

/* 
Imaginemos que queremos saber todas las ciudades que tenemos departamentos y que contenga clientes

INTERSECT no esta para MySQL, de todas formas si la podemos ejecutar. 
*/

SELECT ciudad FROM clientes
INTERSECT
SELECT ciudad_departamento FROM departamentos;

/*
Equivalencias con IN y EXISTS
-----------------------------

SELECT columnas FROM tabla1
WHERE columna IN (SELECT columna FROM tabla2 [WHERE condiciones]);

SELECT columnas FROM tabla1
WHERE EXISTS (SELECT * FROM tabla2 [WHERE condiciones]);

NOTA: Como el EXISTS espera que al menos aparezca una existencia podemo escribirlo así:
WHERE EXISTS (SELECT 1 FROM tabla2 [WHERE condiciones]);
*/

/* Veamos con IN */
SELECT c.ciudad FROM clientes c
WHERE c.ciudad IN (SELECT d.ciudad_departamento FROM departamentos d);
/* 
Nos muestra que ciudades estan con clientes y departamentos a la ves.
En otras palabras, nos muestra las ciudades donde tenemos clientes y a su ves estas ciudades existen como una SELECT de la tabla
departamentos
*/

/* Veamos con EXISTS */
SELECT c.ciudad FROM clientes c
WHERE EXISTS (SELECT 1 FROM departamentos d WHERE c.ciudad = d.ciudad_departamento);

/* Vemos que el resultado es el mismo al consultar que las ciudad de los clientes sea igual a las ciudad de los departamentos */