/* 
Cuando creamos esta BBDD creamos un usario llamado ROOT, es quien tiene acceso a todos los datos

Tambien podemos crear usurios que no tengan tantos permimos 
*/

/*
Crear un usuario para la base de datos
======================================
Cuando creamos esta BBDD creamos un usario llamado ROOT, es quien tiene acceso a todos los datos
Tambien podemos crear usurios que no tengan tantos permimos, pero antes, partiremos con la sintaxis de la creacion de usuarios

CREATE USER 'nombre_de_usuario'@'ip_base_de_datos' IDENTIFIED BY 'password';
*/
CREATE USER 'danilo'@'localhost' IDENTIFIED BY '1234';

/* Ahora podemos crear una nueva conexion a la BBDD con este usuario y contraseña, cabe destacar que esta BBDD no tiene esquemas aun*/