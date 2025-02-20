/*
Restricciones de la tabla
=========================
- UNIQUE (columna [, columna,....]): El conjunto de columnas especificadas, no pueden tener valores repetidos (son claves aternativas)
- PRIMARY KEY (columna [, columna,....]): El conjunto de columnas que no pueden tener valores repetidos ni nulos (clave primarias)
- FOREIGN KEY (columna [, columna,....])
  REFERENCES tabla2 [(columna2, [, columna2,...])]: Las columnas especificadas son claves foraneas que referencian las claves primarias 
												de la segunda tabla dada. Si las columnas de la tabla1 y tabla2 se llaman igual, no es 
                                                necesario poner el nombre de las columnas2.
- CHECK (condiciones): La tabla tiene que cumplir con las condiciones especificadas
*/