/*
Crear un dominio (hoy esta descontinuado)
=========================================
 CREATE DOMAIN nombreDelDominio
	[AS] tipoDatos [def_defecto]
    [restriccionesDelDominio]; 
    
restriccionesDelDominio :=
	CONSTRAINT nombreDeLaRestriccion CHECK (condiciones)
*/

/* Ejemplo de creaciion de un Dominio
-------------------------------------
CREATE DOMAIN dominioCiudades AS CHAR(20)
	CONSTRAINT ciudadesValidas
    CHECK (VALUE IN ('Valparaiso', 'Santiago', 'Valdivia', 'Arica'));
*/

/*
Borrado de un Dominio
=====================
DROP DOMAIN nombreDelDominio {RESTRICT | CASCADE}; 
*/

/* Ejemplo de borrado de un Dominio
-------------------------------------
CREATE DOMAIN dominioCiudades RESTRICT;
*/

/*
Modificar un dominio
====================
 ALTER DOMAIN nombreDelDominio
	{accionModificarDominio | accionModificarRestriccionDominio};
    
accionModificarDominio := {SET def_defecto | DROP DEFAULT};
accionModificarRestriccionDominio := {ADD nombreRestriccion | DROP CONSTRAINT nombreRestriccion};
*/

/* Ejemplo de borrado de un Dominio
-------------------------------------
ALTER DOMAIN dominioCiudades DROP CONSTRAINT ciudadesValidas;
ALTER DOMAIN dominioCiudades ADD CONSTRAINT ciudadesValidas;
	CHECK (VALUE IN ('Puerto Montt', 'Iquique', 'La Serena'));
*/