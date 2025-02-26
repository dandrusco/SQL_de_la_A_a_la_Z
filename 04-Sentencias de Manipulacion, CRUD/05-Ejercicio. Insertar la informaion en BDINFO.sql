/*
Vamos a insertar toda la información a la base de datos de ejemplo del curso, recuerda que se trata de una empresa de informática que 
realiza proyectos tecnológicos para clientes dividida en varios departamentos. Para ello necesitas insertar la siguiente información 
en el esquema que creamos al final del tema anterior:

=============================================
Tabla departamentos:
departamentos
nombre
ciudad
telefono
Email

DIR
Barcelona
93.422.60.70 
dirb@frogames.es

DIR
Palma
972.23.89.70 
dirp@frogames.es 

DIS
Valencia
973.23.50.40 
disv@frogames.es

DIS
Barcelona
93.224.85.23 
disb@frogames.es

PRO
Madrid
977.33.38.52 
prom@frogames.es

PRO
Palma
972.23.50.91 
prop@frogames.es

==========================================
Tabla clientes:
clientes
id
nombre
nif
direccion
ciudad
telefono
Email

10
GESCO
38.567.893-C
Diagonal 11
Barcelona
NULL
admin@gesco.com 

20
DUBVI
38.123.898-E
Paseo Marítimo 22
Palma
972.23.57.21
admin@dubvi.com 

30
ACME
36.432.127-A
Avenida del Cid 33
Valencia
973.22.45.67
admin@acme.com 

40
JFK
38.782.345-B 
Gran Vía 44
Madrid
977.33.71.43 
admin@jfk.com


==========================================
Tabla empleados:
empleados

id
nombre
apellido
sueldo
nombre_dep
ciudad_dep
id_proyecto

1
María
Santos
100.000
DIR
Palma
1

2
Juan Gabriel
Gomila
90.000
DIR
Barcelona
4

3
Alberto
Valls
70.000
DIS
Valencia
3

4
Arnau
Mir
70.000
DIS
Barcelona
4

5
Ricardo
Alberich
40.000
PRO
Madrid
1

6
Jose
García
30.000
PRO
Madrid
3

7
Carlos
Bastida
40.000
NULL
NULL
4

8
Ana
Martínez
30.000
PRO
Madrid
NULL

===========================================
Tabla proyectos:
proyectos

id
nombre
precio
fecha_inicio
fecha_prev_fin
fecha_fin
codigo_cliente

1
GESCOM
1.000.000
1-1-2024
1-1-2026
NULL
10

2
PETSI
2.000.000
1-10-2022
31-3-2024
1-5-2024
10

3
MOPATEX
1.000.000
10-2-2024
1-2-2026
NULL
20

4
UNIPOT
4.000.000
1-1-2023
1-12-2026
NULL
30
*/

/* Nos conectamos a la BBDD */
USE bdinfo;

/* Vamos a borrar los datos agregados en las clases anteriores */
DELETE FROM clientes WHERE id = 10;
DELETE FROM clientes WHERE id = 20;

/* Tabla departamentos: */
INSERT INTO departamentos (nombre, ciudad, telefono, email)
 VALUES 
 ("DIR", "Barcelona", "93.422.60.70", "dirb@frogames.es"),
 ("DIR", "Palma",     "972.23.89.70", "dirp@frogames.es"),
 ("DIS", "Valencia",  "973.23.50.40", "disv@frogames.es"),
 ("DIS", "Barcelona", "93.224.85.23", "disb@frogames.es"),
 ("PRO", "Madrid",    "977.33.38.52", "prom@frogames.es"),
 ("PRO", "Palma",     "972.23.50.91", "prop@frogames.es");
 
/* Tabla clientes: */
INSERT INTO clientes (id, nombre, nif, direccion, ciudad, telefono, email)
 VALUES
 (10, "GESCO", "38.567.893-C", "Diagonal 11",        "Barcelona", NULL,          "admin@gesco.com"), 
 (20, "DUBVI", "38.123.898-E", "Paseo Marítimo 22",  "Palma",    "972.23.57.21", "admin@dubvi.com"),
 (30, "ACME",  "36.432.127-A", "Avenida del Cid 33", "Valencia", "973.22.45.67", "admin@acme.com"),
 (40, "JFK",   "38.782.345-B", "Gran Via 44",        "Madrid",   "977.33.71.43", "admin@jfk.com");
 
/* Tabla proyectos: */
INSERT INTO proyectos (id, nombre, precio, fecha_inicio, fecha_fin_prevista, fecha_fin_real, id_cliente)
 VALUES
 (1, "GESCOM",  1000000, "2024-01-01", "2026-01-01", NULL,         10),
 (2, "PETSI",   2000000, "2022-10-01", "2024-03-31", "2024-05-01", 10),
 (3, "MOPATEX", 1000000, "2024-02-10", "2026-02-01", NULL,         20),
 (4, "UNIPOT",  4000000, "2023-01-01", "2026-12-01", NULL,         30);
 
 /* Tabla empleados: */
INSERT INTO empleados (id, nombre, apellido, sueldo, nombre_departamento, ciudad_departamento, id_proyecto)
 VALUES
 (1, "María",        "Santos",  100000, "DIR", "Palma",     1),
 (2, "Juan Gabriel", "Gomila",   90000, "DIR", "Barcelona", 4),
 (3, "Alberto",      "Valls",    70000, "DIS", "Valencia",  3),
 (4, "Arnau",        "Mir",      70000, "DIS", "Barcelona", 4),
 (5, "Ricardo",      "Alberich", 40000, "PRO", "Madrid",    1),
 (6, "Jose",         "García",   30000, "PRO", "Madrid",    3),
 (7, "Carlos",       "Bastida",  40000,  NULL,  NULL,       4),
 (8, "Ana",          "Martínez", 30000, "PRO", "Madrid", NULL);