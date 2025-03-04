/* Estando dentro de Conexion Danilo vamos a consultar las tabla clientes */
USE bdinfo;
SELECT * FROM clientes;

/* Vemos que obtenemos todos los datos pero no podemos hacer una UPDATE*/
UPDATE clientes set nombre = "Juan" WHERE id = 10;

/* 
Al compilar esta linea nos devuelve un error:
	UPDATE command denied to user 'danilo'@'localhost' for table 'clientes'	0.000 sec
Esto es por que no tenemos acceso, ya que solo le dimos permiso de SELECT y no de UPDATE 
*/