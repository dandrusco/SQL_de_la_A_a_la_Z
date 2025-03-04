/*
Desautorizar usuarios
=====================

REVOKE [GRANT OPTION FOR] privilegios ON objeto FROM usuarios [RESTRICT | CASCADE];
*/

REVOKE SELECT ON bdinfo.clientes FROM 'danilo'@'localhost';
/*NOTA: En MySQL Workbench no permite ejecutar esta linea */

/* Tambien lo podemos hacer manualmente mediante una actualizacion */
UPDATE mysql.user SET Select_priv = "N" 
WHERE user = "danilo" AND host = "localhost";
FLUSH PRIVILEGES;

/* Si ahora volvemos a entrar en la Conexion Danilo, vemos que ya no tenemos acceso al esquema bdinfo */