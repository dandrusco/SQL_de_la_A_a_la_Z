/* 
Creación de Esquemas
========================

CREATE SCHEMA 
{[nombre_del_esquema] | [AUTHORIZATION usuario]}
[lista_de_elementos_del_esquema]; 
*/ 

/* 
Eliminar el Esquemas
========================

DROP SCHEMA 
nombre_del_esquema
{RESTRIC | CASCADE}; 
*/ 

/* 
RESTRIC: Solo se puede borrar si el esquema no tiene elementos en su interior
CASCADE: Lo borra aun que tenga elementos en su interior
*/