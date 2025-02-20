/*
En este ejercicio realiza la creación de la tabla de clientes que deberá tener:

Código de Cliente
Nombre de Cliente
DNI del Cliente
Dirección
Ciudad
Teléfono
Email

Piensa qué campos deberían usarse para clave primario, cuales son convenientes que sean únicos, y el que obligatoriamente debería 
tener una restricción de No Nulo.
*/

CREATE SCHEMA test;
USE test;

CREATE TABLE Clientes
	(codigo INTEGER,
    nombre CHAR(30) NOT NULL,
    dni CHAR(10),
	dirección CHAR(50),
	ciudad CHAR(20),
	telefono CHAR(12),
	email CHAR(30),
    PRIMARY KEY (codigo),
    UNIQUE (dni)
    )