/* 
Creación de Esquemas
========================

CREATE SCHEMA 
{[nombre_del_esquema] | [AUTHORIZATION usuario]}
[lista_de_elementos_del_esquema]; 
*/ 

/* 
Nomenclatura utilizada
========================

PALABRAS EN MAYUSCULAS: Son palabras reservadas del lenguaje, tambien se pueden poner en minusculas pero se recomiendaescribirlo en 
						mayuzculas como CREATE SCHEMA 
[]: Quiere decir que lo que esta en [] se puede poner, como no poner, por ejemplo [AUTHORIZATION usuario]
{}: Son obligatoria {[nombre_del_esquema] | [AUTHORIZATION usuario]}
|: Se puede elejir uno de los dos [nombre_del_esquema] | [AUTHORIZATION usuario]
*/ 

/*
Para utilizar el esquema debemos escribir
USE test;
*/