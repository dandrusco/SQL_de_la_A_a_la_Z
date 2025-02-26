/*
Eliminar filas de una tabla
===========================

DELETE FROM nombre_tabla [WHERE condiciones];
*/

DELETE FROM proyectos; # Desactivar Safe Mode en MySQL Workbench

DELETE FROM proyectos WHERE id_cliente = 20;

DELETE FROM clientes WHERE id = 20;