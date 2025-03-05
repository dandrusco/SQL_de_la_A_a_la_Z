/*
Supongamos el sistema de información de una central de reservas de vuelos que pretende construir una base de datos accesible desde una 
red pública, como Internet. En particular, se quiere mantener información sobre los vuelos genéricos (número de vuelo, compañía aérea, 
ciudad de origen y ciudad destino) y el estado de las reservas de plazas (número de plazas libres). Recordemos que una ciudad puede 
tener más de un aeropuerto, por lo tanto, tenemos que saber a qué aeropuerto opera cada vuelo.

Todos los vuelos son diarios y sin escalas y en un día no puede haber dos vuelos con los mismo número. Lo que sí puede pasar es 
tener más de un vuelo diario entre las mismas ciudades, con un horario diferente, de la misma o distinta compañía aérea.

El sistema de información debe contener información sobre las reservas hechas a cada uno de los vuelos. Esta información debe contener 
la identificación de la persona (NIF o Pasaporte, etc) y los datos personales.

Algunas consultas típicas serán:
• Dadas dos ciudades, mostrar la lista de vuelos que las unen.
• Dado un número de vuelo y una fecha, mostrar el número de plazas libres 

Se pide con los requisitos anteriores:
• Generar el modelo de datos del sistema de información anterior.
• Generar el modelo relacional que corresponde al modelo de datos anterior.
• Generar el código SQL que permite crear la base de datos MySQL, y hacer una creación real
*/

-- Modelo relacional y creación de la base de datos en MySQL
CREATE DATABASE IF NOT EXISTS CentralReservas;
USE CentralReservas;

-- Tabla de Aeropuertos
CREATE TABLE Aeropuerto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Tabla de Vuelos Genéricos
CREATE TABLE Vuelo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_vuelo VARCHAR(10) NOT NULL,
    compania VARCHAR(100) NOT NULL,
    aeropuerto_origen_id INT NOT NULL,
    aeropuerto_destino_id INT NOT NULL,
    FOREIGN KEY (aeropuerto_origen_id) REFERENCES Aeropuerto(id),
    FOREIGN KEY (aeropuerto_destino_id) REFERENCES Aeropuerto(id)
);

-- Tabla de Vuelos Diarios
CREATE TABLE VueloDiario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vuelo_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    plazas_totales INT NOT NULL,
    plazas_libres INT NOT NULL,
    UNIQUE (vuelo_id, fecha),
    FOREIGN KEY (vuelo_id) REFERENCES Vuelo(id)
);

-- Tabla de Pasajeros
CREATE TABLE Pasajero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identificacion VARCHAR(50) UNIQUE NOT NULL, -- Puede ser NIF, Pasaporte, etc.
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de Reservas
CREATE TABLE Reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pasajero_id INT NOT NULL,
    vuelo_diario_id INT NOT NULL,
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pasajero_id) REFERENCES Pasajero(id),
    FOREIGN KEY (vuelo_diario_id) REFERENCES VueloDiario(id)
);

-- Consultas típicas

-- Dadas dos ciudades, mostrar la lista de vuelos que las unen
SELECT v.numero_vuelo, v.compania, ao.nombre AS aeropuerto_origen, ad.nombre AS aeropuerto_destino 
FROM Vuelo v
JOIN Aeropuerto ao ON v.aeropuerto_origen_id = ao.id
JOIN Aeropuerto ad ON v.aeropuerto_destino_id = ad.id
WHERE ao.ciudad = 'CiudadOrigen' AND ad.ciudad = 'CiudadDestino';

-- Dado un número de vuelo y una fecha, mostrar el número de plazas libres
SELECT vd.plazas_libres 
FROM VueloDiario vd
JOIN Vuelo v ON vd.vuelo_id = v.id
WHERE v.numero_vuelo = '1234' AND vd.fecha = '2025-03-10';
