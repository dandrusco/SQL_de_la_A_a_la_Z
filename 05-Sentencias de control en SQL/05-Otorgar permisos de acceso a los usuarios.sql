/*
Autorizaciones
==============

GRANT privilegios ON objeto TO usuario
[WITH GRANT OPTION];

Privilegios
-----------
- ALL PRIVILEGES: todos los permisos sobre el objeto
- USAGE: usar el objeto especificado
- SELECT: consultas
- INSERT[(columnas)]: inserciones
- UPDATE[(columnas)]: modificaciones
- DELETE: borrados
- REFERENCES[(columnas)]: referencias del objeto en restricciones

Objeto
------
- DOMAIN: dominio
- TABLE: tabla
- VIEW: vista

Usuario
-------
- PUBLIC: todo el mundo
- lista de usuarios a los que se quiere autorizar

- WITH GRANT OPTION: permite al usuario otorgar nuevas autoriaciones de acceso, con
las mismas condiciones (o menores) de los objetos a los que ha sido asignado.
*/

/* 
Vamos a darle acceso al usuario danilo a la tabla clientes de la BBDD o esquema bdinfo, si quiereamos darle acceso a todas 
las tablas debemos poner un asterisco: 
	GRANT SELECT ON bdinfo.* TO 'danilo'
*/

/* Por el momento no podemos asignar tablas a usuarios con este metodo en MySQL Workbench*/
GRANT SELECT ON bdinfo.clientes TO 'danilo';

/*
Ademas de las BBDD que vemos en los SCHEMAS, existe una BBDD oculta llamada mysql, dentro de este esquema hay una tabla llamada user
Utilizando la palabra reservada DESC describe el esquema los atributos de esa tabla 
*/
DESC mysql.user;

/* Vamos a ver todos los usuarios que estan en mysql.user */
SELECT * FROM mysql.user;

/* 
Podemos ver que root tiene todo en Y (que singifica YES) por lo tanto tiene acceso a todo, mientras que danilo esta todo en N
(NO tiene permisos)
*/

/*
Modo Alternativo de otorgar permisos
------------------------------------

UPDATE mysql.user SET XXX_priv = 'Y' WHERE user = 'nombre_del_usuario' AND host = 'base_de_datos';
*/

/* 
Por lo tanto para cambiar el privilegio de seleccionar, deberemos actualizar el usuario danilo 
Cambiando Select_priv = 'N' por 'Y'
*/
UPDATE mysql.user SET Select_priv = 'Y' WHERE user = 'danilo' AND host = 'localhost';

/* Ahora deberemos hacer una actualizacion de los privilegios con FLUSH*/
FLUSH PRIVILEGES;

/* 
NOTA:
A partir de MySQL 8.0, los cambios en los privilegios se aplican automáticamente sin necesidad de este comando: FLUSH PRIVILEGES;
*/

/* Ahora podemos ir a la otra conexion que creamos "Conexion Danilo" y ver si nos aparece este esquema*/