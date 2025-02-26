/*
En este ejercicio realiza la inserción de dos clientes en nuestra base de datos:

1. Frogames Formación, cliente número 10 con NIF B-1234567, residente en la Calle Móstoles 22 de Palma de Mallorca y con email de contacto 
juangabriel@frogames.es
2. Juan Gabriel Gomila, cliente número 20 con NIF 43123456, residente en la Calle Cartagena 24 de Palma de Mallorca y sin datos de contacto.
*/

USE bdinfo; 

INSERT INTO clientes 
VALUES (10, 'Frogames Formación', 'B-1234567', 'Calle Móstoles 22', 
'Palma de Mallorca', DEFAULT, 'juangabriel@frogames.es' );

INSERT INTO clientes 
(nif, nombre, id, telefono, email, direccion, ciudad)
VALUES ('43123456', 'Juan Gabriel Gomila', 20, DEFAULT, DEFAULT,
 'Calle Cartagena 24', 'Palma de Mallorca');
 