/*
Encontrar cadenas de caracteres que empiezan/terminan/contienen caracteres
--------------------------------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE columna LIKE característica;
 
- % para expresar una secuencia de caracteres
- _ para caracteres indivuals presentes en la búsqueda
*/

/* Buscaremos los empleados que comiencen por la letra J y le agregaremos % para indiarle que lo que venga despues de la J nos da igual*/
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "J%";

/* Buscaremos los empleados que contengan la letra O y le agregaremos % para indiarle que lo que venga antes o despues nos da igual*/
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%O%";

/* Buscaremos los empleados que terminen por la letra A*/
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%A";

/* Buscaremos en los proyectos el nombre de un proyecto que empieze por la M y que contiene 6 letras mas*/
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "M______";

/* Buscaremos en los proyectos el nombre de un proyecto que contienen 5 letras*/
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_____";

/* O que el nombre de un proyecto que contienen 5 letras pero la segunda sea una E*/
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_E___";