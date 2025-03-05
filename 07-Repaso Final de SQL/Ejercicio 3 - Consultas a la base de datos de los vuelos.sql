/*
A partir de la base de datos obtenida en el ejercicio anterior, genera el código MySQL que permite hacer las siguientes consultas:

1.  Mostrar la lista de compañías aéreas de España.
2.  Mostrar la lista de compañías aéreas que tienen algún vuelo con salida del aeropuerto Son Sant Joan.
3.  Mostrar la lista de vuelos de la compañía British Airways.
4.  Mostrar la lista de vuelos que tienen llegada a un aeropuerto del Reino Unido.
5.  Mostrar la lista de vuelos que tienen salida o llegada a un aeropuerto del Reino Unido.
6.  Mostrar la lista de vuelos (NumVol, Día y Hora) que tienen llegada a Londres.
7.  Mostrar la lista de pasajeros (nombre y apellidos) del vuelo 777.
8.  Mostrar la lista de reservas (número de vuelo) que ha hecho la persona de nombre Aina.
9.  Mostrar la lista de reservas (número de vuelo, aeropuerto de salida y de llegada) que ha hacer la persona de nombre Aina.
10. Mostrar la lista de personas (ID y nombre y apellidos) que tienen un vuelo que sale del aeropuerto Son Sant Joan.
11. Mostrar la lista de personas (ID y nombre y apellidos) que tienen un vuelo que sale de Londres.
12. Mostrar la lista de compañías aéreas que salen de Londres.
13. Mostrar la lista de compañías aéreas que operan en Londres (llegada o salida).
14. Mostrar la lista de personas (nombre y apellidos) que salen de España.
15. Calcular el número de plazas que ha reservado Aina.
16. Contar el número de reservas de vuelo ha hecho Aina.
17. Calcular la capacidad total de los vuelos que salen de Londres.
18. Mostrar la lista de ciudades que no tienen aeropuerto
19. Mostrar la lista de compañías aéreas sin vuelos programados
20. Mostrar la lista de países sin aeropuerto
21. Mostrar la lista de vuelos sin reservas
22. Mostrar una lista de las capacidades de las compañías aéreas que tienen vuelos programados
23. Mostrar un resumen que indique el total de vuelos que tenemos de cada una de las compañías aéreas
24. Mostrar un resumen que indique el total de vuelos de la compañía "Iberia" con salida del aeropuerto "El Prat"
*/

-- Consultas solicitadas

-- 1. Compañías aéreas de España:
SELECT NombreCompañia 
FROM Compania 
WHERE Pais = 'ES';

-- 2. Compañías con vuelos desde Son San Juan:
SELECT DISTINCT c.NombreCompañia 
FROM Compania c 
JOIN Vuelo v ON c.NombreCompañia = v.NomComp 
WHERE v.NomAerOrigen = 'Son San Juan';

-- 3. Vuelos de British Airways:
SELECT * 
FROM Vuelo 
WHERE NomComp = 'British Airways';

-- 4. Vuelos llegando a Reino Unido:
SELECT v.* 
FROM Vuelo v 
JOIN Aeropuerto a ON v.NomAerDest = a.NombreAeropuerto 
JOIN Ciudad ci ON a.Ciudad = ci.Ciudad 
WHERE ci.Pais = 'UK';

-- 5. Vuelos con salida o llegada a UK:
SELECT v.* 
FROM Vuelo v 
JOIN Aeropuerto ao ON v.NomAerOrigen = ao.NombreAeropuerto 
JOIN Ciudad co ON ao.Ciudad = co.Ciudad 
JOIN Aeropuerto ad ON v.NomAerDest = ad.NombreAeropuerto 
JOIN Ciudad cd ON ad.Ciudad = cd.Ciudad 
WHERE co.Pais = 'UK' OR cd.Pais = 'UK';

-- 6. Vuelos llegando a Londres:
SELECT v.NumVuelo, v.Dia, v.Hora 
FROM Vuelo v 
JOIN Aeropuerto a ON v.NomAerDest = a.NombreAeropuerto 
WHERE a.Ciudad = 'Londres';

-- 7. Pasajeros del vuelo 777
SELECT p.NombrePasajero 
FROM Pasajero p 
JOIN Reserva r ON p.ID = r.ID 
WHERE r.NumVuelo = 777;

-- 8. Reservas de Aina:
SELECT r.NumVuelo 
FROM Reserva r 
JOIN Pasajero p ON r.ID = p.ID 
WHERE p.NombrePasajero = 'Aina';

-- 9. Reservas de Aina con aeropuertos:
SELECT r.NumVuelo, v.NomAerOrigen, v.NomAerDest 
FROM Reserva r 
JOIN Vuelo v ON r.NumVuelo = v.NumVuelo 
JOIN Pasajero p ON r.ID = p.ID 
WHERE p.NombrePasajero = 'Aina';

-- 10. Personas que salen de Son San Juan:
SELECT DISTINCT p.ID, p.NombrePasajero 
FROM Pasajero p 
JOIN Reserva r ON p.ID = r.ID 
JOIN Vuelo v ON r.NumVuelo = v.NumVuelo 
WHERE v.NomAerOrigen = 'Son San Juan';

-- 11. Personas que salen de Londres:
SELECT DISTINCT p.ID, p.NombrePasajero 
FROM Pasajero p 
JOIN Reserva r ON p.ID = r.ID 
JOIN Vuelo v ON r.NumVuelo = v.NumVuelo 
JOIN Aeropuerto a ON v.NomAerOrigen = a.NombreAeropuerto 
WHERE a.Ciudad = 'Londres';

-- 12. Compañías que salen de Londres:
SELECT DISTINCT v.NomComp 
FROM Vuelo v 
JOIN Aeropuerto a ON v.NomAerOrigen = a.NombreAeropuerto 
WHERE a.Ciudad = 'Londres';

-- 13. Compañías operando en Londres:
SELECT DISTINCT v.NomComp 
FROM Vuelo v 
JOIN Aeropuerto ao ON v.NomAerOrigen = ao.NombreAeropuerto 
JOIN Aeropuerto ad ON v.NomAerDest = ad.NombreAeropuerto 
WHERE ao.Ciudad = 'Londres' OR ad.Ciudad = 'Londres';

-- 14. Personas saliendo de España:
SELECT DISTINCT p.NombrePasajero 
FROM Pasajero p 
JOIN Reserva r ON p.ID = r.ID 
JOIN Vuelo v ON r.NumVuelo = v.NumVuelo 
JOIN Aeropuerto a ON v.NomAerOrigen = a.NombreAeropuerto 
JOIN Ciudad c ON a.Ciudad = c.Ciudad 
WHERE c.Pais = 'ES';

-- 15. Plazas reservadas por Aina:
SELECT SUM(r.Plazas) 
FROM Reserva r 
JOIN Pasajero p ON r.ID = p.ID 
WHERE p.NombrePasajero = 'Aina';

-- 16. Número de reservas de Aina:
SELECT COUNT(*) 
FROM Reserva r 
JOIN Pasajero p ON r.ID = p.ID 
WHERE p.NombrePasajero = 'Aina';

-- 17. Capacidad total desde Londres:
SELECT SUM(v.Capacidad) 
FROM Vuelo v 
JOIN Aeropuerto a ON v.NomAerOrigen = a.NombreAeropuerto 
WHERE a.Ciudad = 'Londres';

-- 18. Ciudades sin aeropuerto:
SELECT c.Ciudad 
FROM Ciudad c 
LEFT JOIN Aeropuerto a ON c.Ciudad = a.Ciudad 
WHERE a.NombreAeropuerto IS NULL;

-- 19. Compañías sin vuelos:
SELECT c.NombreCompañia 
FROM Compania c 
LEFT JOIN Vuelo v ON c.NombreCompañia = v.NomComp 
WHERE v.NumVuelo IS NULL;

-- 20. Países sin aeropuerto:
SELECT p.* 
FROM Pais p 
LEFT JOIN Ciudad c ON p.Codigo = c.Pais 
LEFT JOIN Aeropuerto a ON c.Ciudad = a.Ciudad 
WHERE a.NombreAeropuerto IS NULL;

-- 21. Vuelos sin reservas:
SELECT v.* 
FROM Vuelo v 
LEFT JOIN Reserva r ON v.NumVuelo = r.NumVuelo 
WHERE r.NumVuelo IS NULL;

-- 22. Capacidades por compañía:
SELECT NomComp, Capacidad 
FROM Vuelo 
GROUP BY NomComp, Capacidad;

-- 23. Total vuelos por compañía:
SELECT NomComp, COUNT(*) AS Total_Vuelos 
FROM Vuelo 
GROUP BY NomComp;

-- 24. Vuelos de Iberia desde El Prat:
SELECT COUNT(*) 
FROM Vuelo 
WHERE NomComp = 'Iberia' 
AND NomAerOrigen = 'El Prat';