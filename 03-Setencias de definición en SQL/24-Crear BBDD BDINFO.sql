/*
Vamos a crear la base de datos de ejemplo del curso, recuerda que se trata de una empresa de informática que realiza proyectos tecnológicos 
para clientes dividida en varios departamentos. Para ello necesitas crear:

1. Un esquema llamado bdinfo
2. La tabla clientes que guarde información del código del cliente, nombre, NIF, dirección, ciudad, teléfono e email. Selecciona las 
restricciones de clave primaria y unicidad que consideres adecuadas.
3. La tabla departamentos de la empresa, que guarde el nombre del departamento (marketing, programación, etc..), la ciudad en la que se 
encuentra, el teléfono de contacto y un email. Cuidado al elegir la clave primaria pues cada departamento puede estar en varias ciudades 
y una ciudad puede tener más de un departamento.
4. La tabla de los proyectos, con el código, nombre, el precio, la fecha de inicio, la fecha de fin prevista, la fecha de fin real, y a 
qué cliente pertenece. Añade las claves foráneas necesarias para referenciar al cliente del proyecto, y las restricciones que consideres 
(la fecha de inicio es siempre anterior a la fecha fin, la fecha de fin real por defecto es NULL hasta que se termina el proyecto, etc...)
5. La tabla de los empleados, con el código de empleado, el nombre, el apellido, el sueldo (comprueba que el sueldo es inferior al SMI de 
España, de 11.580€ anuales), en qué departamento y ciudad trabaja y en qué proyecto está trabajando. Ten en cuenta que muchos de estos 
campos son claves foráneas a otras de las tablas creadas anteriormente.
*/
CREATE DATABASE bdinfo;

USE bdinfo;

CREATE TABLE clientes
 (id INTEGER PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  nif VARCHAR(12) UNIQUE,
  direccion VARCHAR(50), 
  ciudad VARCHAR(20),
  telefono VARCHAR(12),
  email VARCHAR(30)
 );
 
 CREATE TABLE departamentos
  (nombre VARCHAR(20),
   ciudad VARCHAR(20),
   telefono VARCHAR(12),
   email VARCHAR(30),
   PRIMARY KEY (nombre, ciudad)
  );
  
  CREATE TABLE proyectos
   (id INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    precio REAL,
    fecha_inicio DATE,
    fecha_fin_prevista DATE,
    fecha_fin_real DATE DEFAULT NULL,
    id_cliente INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    CHECK (fecha_inicio < fecha_fin_prevista),
    CHECK (fecha_inicio < fecha_fin_real)
   );
  
  CREATE TABLE empleados
   (id INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    sueldo REAL CHECK (sueldo > 11580),
    nombre_departamento VARCHAR(20),
    ciudad_departamento VARCHAR(20),
    id_proyecto INTEGER,
    FOREIGN KEY (nombre_departamento, ciudad_departamento) REFERENCES departamentos (nombre, ciudad),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos (id)
   );