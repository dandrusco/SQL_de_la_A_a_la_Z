/*
Subconsultas
------------

SELECT columnas_a_consultar FROM tabla 
	WHERE condiciones = (SELECT columnas_a_consultar FROM tabla2 WHERE condiciones2)
*/

/* 
Si queremos saber cual es el proyecto mas caro que ha realizado la empresa, lo podemos hacer de la siguiente manera:
Primero veamos cual ha sido el presupuesto mas alto, para ello realizaremos la consulta general para visualizar mejor
*/
SELECT * FROM proyectos p;

/* Nos quedaremos con la columna precio filtrando el de mayor valor*/
SELECT MAX(p.precio) FROM proyectos p;

/*
Ahora ya sabemos que el maximo son 4.000.000 de euros, entonces esta sera la condicion para filtrar los propios proyectos
Entonces nos quedaremos con todos los proyectos "SELECT * FROM proyectos" donde el precio sea igual "WHERE precio =" al de la
subconsulta (consulta anterior realizada) SELECT MAX(p.precio) FROM proyectos p;
*/
SELECT * FROM proyectos WHERE precio = (SELECT MAX(p.precio) FROM proyectos p);

/* Como es un poco engorroso ver proyectos, proyectos p... vamos a modificar para que la primera consulta sea p1 y la segunda p2*/
SELECT * FROM proyectos p1 WHERE p1.precio = (SELECT MAX(p2.precio) FROM proyectos p2);

/* Pero como ya sabemos, no es necesario quedarnos con todas las columnas, por lo tanto nos quedaremos solo con el ID y el Nombre*/
SELECT p1.id, p1.nombre FROM proyectos p1 
	WHERE p1.precio = (SELECT MAX(p2.precio) FROM proyectos p2);

/* Si queremos saber cual es el proyecto mas barato que ha realizado la empresa, cambiaremos el MAX por el MIN */
SELECT p1.id, p1.nombre FROM proyectos p1 
	WHERE p1.precio = (SELECT MIN(p2.precio) FROM proyectos p2);
    
/* Como podemos ver el mas alto es solo un proyecto, mientras el mas barato son 2*/