/*
Creación de Vistas
==================
CREATE VIEW nombre_vista
 [(lista_de_columnas)] AS (consulta)
 [WITH CHECK OPTIONS];
*/

/*
Borrar Vistas
==================
 DROP VIEW nombre_vista {RESTRICT | CASCADE};
*/

/* Si un cliente intenta agregar datos en la vista, este no se podra*/
CREATE VIEW proyectos_por_cliente
 (id_cliente, num_proyectos) AS
 (SELECT c.id, COUNT(*) 
 FROM proyectos p, clientes c
 WHERE p.id_cliente = c.id
 GROUP BY c.id
 );
 
 /* Si un cliente intenta agregar datos en la vista, este SI se podra gracias al WITH CHECK OPTION*/
 CREATE VIEW clientes_palma_valencia AS
 (SELECT * 
 FROM clientes c
 WHERE c.ciudad IN ('Palma', 'Valencia'))
 WITH CHECK OPTION;
 
 /*Eliminamos una vista*/
  DROP VIEW clientes_palma_valencia RESTRICT;