/*
En el siguiente ejercicio, vas a modificar la tabla de clientes que creamos en el ejercicio anterior. 

Para ello, quiero que indiques el código necesario para:
1. Añadir una columna código_país que guarde las iniciales del país en cuestión (dos letras por país)
2. Modifique la columna código_país añadiendo la restricción de que el valor por defecto del país será 'ES' (España).
3. Elimine la columna código_país que hemos creado. Elige el formato de borrado que quieras
4. Elimine toda la tabla clientes ahora que hemos terminado el ejercicio
5. Como extra, puedes añadir una restricción a la tabla adicional, pero no es obligatorio.
*/

USE test;
ALTER TABLE clientes ADD COLUMN codigo_pais VARCHAR(2);
ALTER TABLE clientes ALTER COLUMN codigo_pais SET DEFAULT 'ES';
ALTER TABLE clientes DROP COLUMN codigo_pais RESTRICT;
DROP TABLE clientes CASCADE;