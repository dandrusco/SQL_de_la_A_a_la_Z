/*
A partir de la base de datos genera el código MySQL que permite realizar las siguientes acciones:

1. Crear una vista con los registros de España de la tabla Aeropuerto.
2. Crea una vista con los pasajeros de la tabla Pasajero.

EXTRA:

3. Crea un evento que incremente la capacidad de los vuelos de la tabla Vuelo, cada 30 segundos.
4. Muestra la lista de los eventos definidos.
5. Crea un trigger que inserte un nuevo registro cada vez que se modifique un vuelo.
*/

-- 1. Vista de aeropuertos españoles:
CREATE OR REPLACE VIEW VistaAeropuertosEspaña AS
SELECT a.NombreAeropuerto, a.Ciudad 
FROM Aeropuerto a
JOIN Ciudad c ON a.Ciudad = c.Ciudad
WHERE c.Pais = 'ES';

-- 2. Vista de pasajeros:
CREATE OR REPLACE VIEW VistaPasajeros AS
SELECT * FROM Pasajero;

-- 3. Evento para incrementar capacidad de vuelos:
DELIMITER //
CREATE EVENT IncrementarCapacidadVuelos
ON SCHEDULE EVERY 30 SECOND
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE Vuelo SET Capacidad = Capacidad + 10;
END //
DELIMITER ;

-- 4. Listar eventos definidos:
SHOW EVENTS FROM CentralReservas;

-- 5. Trigger para registrar modificaciones de vuelos (primero necesitamos crear tabla de registro):
-- Crear tabla de auditoría
CREATE TABLE IF NOT EXISTS Vuelo_Modificaciones (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NumVuelo INT,
    CapacidadAnterior INT,
    CapacidadNueva INT,
    FechaModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Usuario VARCHAR(100)
);

-- Crear trigger
DELIMITER //
CREATE TRIGGER RegistroModificacionVuelo
AFTER UPDATE ON Vuelo
FOR EACH ROW
BEGIN
    IF OLD.Capacidad <> NEW.Capacidad THEN
        INSERT INTO Vuelo_Modificaciones(NumVuelo, CapacidadAnterior, CapacidadNueva, Usuario)
        VALUES (OLD.NumVuelo, OLD.Capacidad, NEW.Capacidad, CURRENT_USER());
    END IF;
END //
DELIMITER ;

/*
Notas importantes:
-----------------
Para que los eventos funcionen, debe estar activado el planificador de eventos:
*/
SET GLOBAL event_scheduler = ON;