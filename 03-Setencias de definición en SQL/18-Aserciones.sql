/*
Como crear Aserciones (No disponible en MySQL)
==============================================
CREATE ASSERTION nombreDeLaAsercion CHECK (condiciones);
*/

/*
Ejemplo de Aserciones, supongamos que tenemos una BBDD de empleados y queremos asegurarnos que ningun trabajador gane mas de 800.000 pesos
---------------------
CREATE ASSERTION restriccionFrogames 
	CHECK (NO EXISTS (SELECT * 
						FROM proyectos p, empleados e
                        WHERE p.codigoProyecto = e.nomProyecto
                        AND e.sueldo >= 800000
                        AND p.nomProyecto = "Frogames"
					)
		);
*/

/*
Como eliminar Aserciones
========================
DROP ASSERTION nombreDeLaAsercion;
*/

/*
Ejemplo de eliminar Aserciones
--------------------------------
DROP ASSERTION restriccionFrogames;
*/