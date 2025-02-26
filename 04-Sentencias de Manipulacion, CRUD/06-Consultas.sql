/*
Consultas a las tablas de una BDR
=================================

SELECT nombre_columna_a_seleciconar [[AS] columna_renombrada]
	[, nombre_columna_a_seleciconar [[AS] columna_renombrada] ... ]
FROM tabla_a_consultar [[AS] tabla_renombrada]
*/

/* Nos quedaremos con todas las columnas de la tabla clientes*/
SELECT * FROM clientes;

/* Nos quedaremos solo con las tablas de id, nombre, direccion y ciudad de la tabla clientes*/
SELECT id, nombre, direccion, ciudad FROM clientes;

/* Siempre es recomendable ponerle un alias a las tablas, ya que cuando mezclemos tablas deberemos escribir así la consulta:
SELECT clientes.id, clientes.nombre, clientes.direccion, clientes.ciudad FROM clientes;
para hacer referencia de que cada columna corresponde a clientes
 */
SELECT c.id, c.nombre, c.direccion, c.ciudad FROM clientes AS c;

/* Adicionalmente le podemos agregar un alias a la columna:
Por ejemplo la columna nombre de la tabla cliente lo podemos llamar como nombre comercial:
c.nombre AS nombre_comercial

Otra forma es sin el AS pero personalmente no me gusta ya que se vuelve engorroso de leer:
c.nombre nombre_comercial
 */
SELECT c.id, c.nombre AS nombre_comercial, c.direccion, c.ciudad FROM clientes AS c;
