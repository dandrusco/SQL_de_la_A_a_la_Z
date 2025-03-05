-- Creación de la base de datos y las tablas

CREATE DATABASE IF NOT EXISTS CentralReservas;
USE CentralReservas;

-- Crear tabla de Países
CREATE TABLE Pais (
    Codigo CHAR(2) PRIMARY KEY,
    NombrePais VARCHAR(100) NOT NULL
);

-- Crear tabla de Compañías
CREATE TABLE Compania (
    NombreCompañia VARCHAR(100) PRIMARY KEY,
    Pais CHAR(2) NOT NULL,
    FOREIGN KEY (Pais) REFERENCES Pais(Codigo)
);

-- Crear tabla de Ciudades
CREATE TABLE Ciudad (
    Ciudad VARCHAR(100) PRIMARY KEY,
    Pais CHAR(2) NOT NULL,
    FOREIGN KEY (Pais) REFERENCES Pais(Codigo)
);

-- Crear tabla de Aeropuertos
CREATE TABLE Aeropuerto (
    NombreAeropuerto VARCHAR(100) PRIMARY KEY,
    Ciudad VARCHAR(100) NOT NULL,
    FOREIGN KEY (Ciudad) REFERENCES Ciudad(Ciudad)
);

-- Crear tabla de Vuelos
CREATE TABLE Vuelo (
    NumVuelo INT PRIMARY KEY,
    Dia DATE NOT NULL,
    Hora TIME NOT NULL,
    Capacidad INT NOT NULL,
    NomComp VARCHAR(100) NOT NULL,
    NomAerOrigen VARCHAR(100) NOT NULL,
    NomAerDest VARCHAR(100) NOT NULL,
    FOREIGN KEY (NomComp) REFERENCES Compania(NombreCompañia),
    FOREIGN KEY (NomAerOrigen) REFERENCES Aeropuerto(NombreAeropuerto),
    FOREIGN KEY (NomAerDest) REFERENCES Aeropuerto(NombreAeropuerto)
);

-- Crear tabla de Pasajeros
CREATE TABLE Pasajero (
    ID VARCHAR(50) PRIMARY KEY,
    NombrePasajero VARCHAR(100) NOT NULL,
    TipoID VARCHAR(20) NOT NULL,
    Genero CHAR(1) NOT NULL
);

-- Crear tabla de Reservas
CREATE TABLE Reserva (
    NumVuelo INT NOT NULL,
    ID VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Plazas INT NOT NULL,
    PRIMARY KEY (NumVuelo, ID, Fecha),
    FOREIGN KEY (NumVuelo) REFERENCES Vuelo(NumVuelo),
    FOREIGN KEY (ID) REFERENCES Pasajero(ID)
);

-- Inserción de datos en la base de datos CentralReservas

-- Insertar países
INSERT INTO Pais (Codigo, NombrePais) VALUES
('ES', 'España'),
('UK', 'Reino Unido'),
('FR', 'Francia'),
('DE', 'Alemania'),
('IT', 'Italia');

-- Insertar compañías
INSERT INTO Compania (NombreCompañia, Pais) VALUES
('Iberia', 'ES'),
('British Airways', 'UK'),
('Air France', 'FR'),
('Air Berlín', 'DE'),
('Spanair', 'ES');

-- Insertar ciudades
INSERT INTO Ciudad (Ciudad, Pais) VALUES
('Palma', 'ES'),
('Londres', 'UK'),
('Leipzig', 'DE'),
('Barcelona', 'ES'),
('Roma', 'IT');

-- Insertar aeropuertos
INSERT INTO Aeropuerto (NombreAeropuerto, Ciudad) VALUES
('Son San Juan', 'Palma'),
('Gatwick', 'Londres'),
('Heathrow', 'Londres'),
('Halle-Leipzig', 'Leipzig'),
('El Prat', 'Barcelona');

-- Insertar vuelos
INSERT INTO Vuelo (NumVuelo, Dia, Hora, Capacidad, NomComp, NomAerOrigen, NomAerDest) VALUES
(111, '2015-11-10', '05:30:00', 100, 'British Airways', 'Son San Juan', 'Gatwick'),
(222, '2015-11-12', '06:22:00', 130, 'Iberia', 'El Prat', 'Heathrow'),
(333, '2015-11-14', '10:00:00', 220, 'Iberia', 'Heathrow', 'El Prat'),
(444, '2015-11-10', '21:30:00', 100, 'British Airways', 'Gatwick', 'Son San Juan'),
(555, '2015-11-22', '07:30:00', 145, 'Iberia', 'El Prat', 'Gatwick'),
(666, '2015-11-30', '09:00:00', 206, 'Air Berlín', 'Halle-Leipzig', 'Heathrow'),
(777, '2015-11-26', '06:22:00', 145, 'Air Berlín', 'Son San Juan', 'Halle-Leipzig'),
(888, '2015-11-10', '07:30:00', 123, 'Air Berlín', 'Halle-Leipzig', 'Son San Juan'),
(999, '2015-11-10', '09:00:00', 99, 'Spanair', 'El Prat', 'Son San Juan');

-- Insertar pasajeros
INSERT INTO Pasajero (NombrePasajero, TipoID, ID, Genero) VALUES
('Aina', 'NIF', '12121212A', 'M'),
('Bernat', 'NIF', '74625381C', 'H'),
('Adrián', 'NIF', '28470198K', 'H'),
('Jose Antonio', 'Pasaporte', 'Z23456K', 'H'),
('David', 'Pasaporte', 'P82736A', 'H');

-- Insertar reservas
INSERT INTO Reserva (NumVuelo, ID, Fecha, Plazas) VALUES
(777, 'Z23456K', '2015-10-26', 1),
(333, '74625381C', '2015-10-26', 2),
(222, '12121212A', '2015-11-06', 1),
(111, '12121212A', '2015-10-16', 3),
(999, '74625381C', '2015-10-28', 1);