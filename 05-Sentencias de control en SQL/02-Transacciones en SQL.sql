/*
Transacciones
=============

SET TRANSACTION {READ ONLY | READ WRITE}
sentencia1;
sentencia2;
...
sentenicaN;
{COMMIT | ROLLBACK} [WORK];
*/

USE bdinfo;

/* Vamos a consultar los proyectos*/
SELECT * FROM proyectos;

/* Consultaremos la tabla empleados*/
SELECT * FROM empleados;

/*
1. Vamos a descontarle 1.000 euros de sueldo a los empleados del proyecto 3 MOPATEX y se los pasaremos a los empleados que estan 
trabajando el el proyecto 1 GESCOM:
2. Vemos que los asociados al proyecto 3 es Alberto con 70.000 y Jose con 30.000
3. Los asociados al proyecto 1 es Maria con 100.000 y Ricardo con 40.000
4. Como son dos sentencias que queremos que se realizen a la vez, lo programaremos como TRANSACTION e indicandole READ WRITE ya que 
modificaremos la BBDD
2. Actualizaremos la tabla empleados descontandole 1.000 euros al sueldo y traspasandolo a otros empleados, este metodo lo hacemos
con UPDATE
3. Seleccionamos las 4 lineas y le damos al RAYO de color AMARILLO para ejecutar estas lineas
*/
SET TRANSACTION READ WRITE;
UPDATE empleados SET sueldo = sueldo - 1000 WHERE id_proyecto = 3;
UPDATE empleados SET sueldo = sueldo + 1000 WHERE id_proyecto = 1;
COMMIT;

/* Consultaremos la tabla empleados*/
SELECT * FROM empleados;

/*
Vemos que los asociados al proyecto 3: 
	- Alberto paso de ganar 70.000 a 69.000 
    - Jose paso de ganar 30.000 a 29.000
Los asociados al proyecto 1: 
	- Maria de 100.000 a 101.000 
    - Ricardo de 40.000 41.000
*/