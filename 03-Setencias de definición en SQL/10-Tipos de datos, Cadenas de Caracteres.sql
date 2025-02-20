/* 
Crear una tabla
===================

CREATE TABLE nombreDeLaTabla
(definicionDeLaColumna
[, definicionDeLaColumna...]
[, restriccionesDeLaTabla]
);


definicionDeLaColumna := 
	nombreDeLaColumna {tipoDeDato | dominio}
	[definicionDelValorPorDefecto]
    [restriccionDeLaColumna]
*/

/*
Tipos de Datos
==============

Numeros Exactos:
- TINYINT							(1 byte)			[0, 255]
- SMALLINT							(2 bytes)			[-32.766, 32.767] 				(16bits)
- INT								(4 bytes)			[-2.147.483.648, 2.147.483.647] (32bits)
- BIGINT							(8 bytes)			[-2e63, 2e63-1] 				(64bits)
- DECIMAL(precision, escala)		(de 5 a 17 bytes)	[-10e38, 10e38-1]
- NUMERIC(precision, escala) es equivalente al DECIMAL

Numeros Aproximados:
- FLOAT		(n<=24)		(4 bytes) [-3.40e38, -1.18e-38] {0} [1.18e-38, 3.40e38]			(32bits)
- DOUBLE 	(24<n<=53)	(8 bytes) [-1.79e308, -2.23e-308] {0} [-2.23e-308, 1.79e308]	(64bits)
- REAL					FLOAT(24)

Caracteres:
- CHARACTER (longitud)
- CHARACTER (max, min)
- BIT		(longitud)
- BIT		(max, min)
- BOOL
*/