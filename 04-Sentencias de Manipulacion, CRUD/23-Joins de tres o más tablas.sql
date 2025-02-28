/* 
Como ya sabemos que no podemos juntar tanto la derecha como la izquieda con FULL, lo realizaremos de otra forma:
1. Vamos a quedarnos con todas las columnas y mezclaremos las tablas empleados, proyectos y clientes 
2. La condicion sera donde el id del empleado coinsida con el id del proyecto y el cliente asociado al proyecto sea 
igal al id del cliente
*/
SELECT * 
 FROM empleados e, proyectos p, clientes c
 WHERE e.id_proyecto = p.id AND p.id_cliente = c.id;
 
/*
Vemos que hemos unido 3 tablas, algunos valores quedan repetidos como el id_proyecto es igual al id y la del id_cliente con el id
Esto ocurre por que solo las unimos, sin hacer un NATURAL JOIN

Vamos a crear la misma secuencia anterior pero mas completa, haciendo dos JOIN
*/
SELECT * 
 FROM (empleados e JOIN proyectos p ON e.id_proyecto = p.id)
 JOIN clientes c ON p.id_cliente = c.id;