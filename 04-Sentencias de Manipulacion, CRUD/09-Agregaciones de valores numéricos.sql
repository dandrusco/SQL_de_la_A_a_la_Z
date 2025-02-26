/*
Funciones de Agregación
-----------------------
- COUNT: Nos da el número total de filas seleccionadas
- SUM: Suma los valores de una columna
- MIN/MAX: Mínimo/Máximo de una columna
- AVG: Calcula el valor medio de una columna
*/

/* Si tomamos la tabla departamente y le indicamos un COUNT(*), nos devolvera que tenemos 6 departamentos, 
lo que significa que tenemos 6 filas*/
SELECT COUNT(*) FROM departamentos;

/* Como podemos observar la columna se llama COUNT(*), una forma mas amigable es crear un alias como por ejemplo numero_departamentos*/
SELECT COUNT(*) AS numero_departamentos FROM departamentos;

/* Tomando el mismo ejemplo ahora podriamos filtrar solo los departamento que pertenezcan a la ciudad de Palma, nos devolvera 2
lo que indica es que hay 2 filas con la ciudad de Palma*/
SELECT COUNT(*) AS numero_departamentos FROM departamentos WHERE ciudad = "Palma";

/* Vamos a la tabla empleados, le pediremos que nos cuente cuantas ciudades hay en la columna ciudad_departamento
Nos devolvera 7, pero si revisamos nos percatamos que los datos Null no son contados*/
SELECT COUNT(e.ciudad_departamento) FROM empleados AS e;

/* Ahora si a la consulta le agregamos el DISTINCT, nos devolvera solo 4, lo que quiere decir que solo tenemos 4 ciudades diferentes*/
SELECT COUNT(DISTINCT e.ciudad_departamento) FROM empleados AS e;

/* Otro ejmplo, seleccionaremos cual es el sueldo minimo, maximo y promedio de un empleado*/
SELECT MIN(e.sueldo) AS minimo, MAX(e.sueldo) AS maximo, AVG(e.sueldo) AS promedio FROM empleados e;

/* Adicionalmente podemos agregar la suma de todos los sueldos para obtener un gasto mensual*/
SELECT SUM(e.sueldo) AS gasto_mensual, MIN(e.sueldo) AS minimo, MAX(e.sueldo) AS maximo, AVG(e.sueldo) AS promedio FROM empleados e;