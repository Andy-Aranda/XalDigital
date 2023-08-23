/*Para este ejercicio, creamos las tablas previamente*/
CREATE TABLE aerolineas (
    id_aerolinea INT PRIMARY KEY,
    nombre_aerolinea VARCHAR(255)
);

INSERT INTO aerolineas (id_aerolinea, nombre_aerolinea) VALUES
(1, 'Volaris'),
(2, 'Aeromar'),
(3, 'Interjet'),
(4, 'Aeromexico');

CREATE TABLE aeropuertos (
    id_aeropuerto INT PRIMARY KEY,
    nombre_aeropuerto VARCHAR(255)
);

INSERT INTO aeropuertos (id_aeropuerto, nombre_aeropuerto) VALUES
(1, 'Benito Juárez'),
(2, 'Guanajuato'),
(3, 'La Paz'),
(4, 'Oaxaca');

CREATE TABLE movimientos (
    id_movimiento INT PRIMARY KEY,
    descripcion VARCHAR(255)
);

INSERT INTO movimientos (id_movimiento, descripcion) VALUES
(1, 'Salida'),
(2, 'Llegada');

CREATE TABLE vuelos (
    id_vuelo INT PRIMARY KEY,
    id_aerolinea INT,
    id_aeropuerto INT,
    id_movimiento INT,
    dia DATE
);

INSERT INTO vuelos (id_vuelo, id_aerolinea, id_aeropuerto, id_movimiento, dia) VALUES
(1, 1, 1, 1, '2021-05-02'),
(2, 1, 1, 1, '2021-05-02'),
(3, 2, 2, 2, '2021-05-02'),
(4, 3, 3, 2, '2021-05-02'),
(5, 1, 3, 2, '2021-05-02'),
(6, 2, 1, 1, '2021-05-02'),
(7, 2, 3, 1, '2021-05-04'),
(8, 3, 4, 1, '2021-05-04'),
(9, 3, 4, 1, '2021-05-04');


/*Respondemos las preguntas planteadas:
1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?*/
SELECT aeropuertos.nombre_aeropuerto, COUNT(*) AS cantidad_movimientos
FROM vuelos
JOIN aeropuertos
ON vuelos.id_aeropuerto = aeropuertos.id_aeropuerto
GROUP BY aeropuertos.nombre_aeropuerto
ORDER BY cantidad_movimientos DESC
LIMIT 2;


/*2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante
el año?*/
SELECT aerolineas.nombre_aerolinea, COUNT(*) AS cantidad_vuelos
FROM vuelos
JOIN aerolineas
ON vuelos.id_aerolinea = aerolineas.id_aerolinea
GROUP BY aerolineas.nombre_aerolinea
ORDER BY cantidad_vuelos DESC
LIMIT 2;


/*3. ¿En qué día se han tenido mayor número de vuelos?*/
SELECT dia, COUNT(*) AS cantidad_vuelos
FROM vuelos
GROUP BY dia
ORDER BY cantidad_vuelos DESC
LIMIT 1;


/*4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?*/
SELECT aerolineas.nombre_aerolinea, COUNT(*) AS cantidad_vuelos
FROM vuelos
JOIN aerolineas
ON vuelos.id_aerolinea = aerolineas.id_aerolinea
GROUP BY aerolineas.nombre_aerolinea
HAVING COUNT(*) > 2
LIMIT 2;