/*
Seguro que siempre has querido saber dónde teníais aquella película de vídeo/DVD que nunca encontrabas. Por ello os proponemos crear 
una base de datos para organizar las cintas de vídeo y localizarlas rápidamente cuando os apetezca utilizarlas. 
Tendréis que crear la base de datos y las tablas; también deberéis decidir las claves primarias e insertar filas. 

Para almacenar las cintas de vídeo, tendremos que crear las siguientes tablas:

1. Las cintas/DVDs: querremos saber su código, la estantería donde se encuentran, el estante y la fila, suponiendo que en un estante 
haya más de una fila. Tendremos que poner nosotros el código de las cintas, con un rotulador, en el lomo de cada una.
2. Las películas: querremos saber su código, título, director principal (en el caso de que haya más de uno) y el tema. El código de 
las películas también lo tendremos que escribir nosotros con un rotulador para distinguir películas que tienen el mismo nombre.
3. Los actores: sólo querremos saber de ellos un código, el nombre y el apellido y, si somos aficionados al cine, otros datos que nos 
pueda interesar almacenar. El código de los actores, que inventaremos nosotros, nos permitirá distinguir entre actores que se llaman igual.
4. Películas que hay en cada cinta: en esta tabla pondremos el código de la cinta y el código de la película. En una cinta puede haber más 
de una película, y podemos tener una película repetida en más de una cinta; se debe tener en cuenta este hecho en el momento de elegir la 
clave primaria.
5. Actores que aparecen en las películas: en esta tabla indicaremos el código de la película y el código del actor. En una película puede 
participar más de un actor y un actor puede aparecer en más de una película; hay que tener presente este hecho cuando se elige la clave 
primaria.
*/

-- Crear la base de datos
CREATE DATABASE Videoteca;
USE Videoteca;

-- Tabla para almacenar cintas/DVDs
CREATE TABLE Cintas (
    codigo VARCHAR(10) PRIMARY KEY,
    estanteria VARCHAR(10) NOT NULL,
    estante VARCHAR(10) NOT NULL,
    fila VARCHAR(10) NOT NULL
);

-- Tabla para películas
CREATE TABLE Peliculas (
    codigo VARCHAR(10) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    director_principal VARCHAR(255) NOT NULL,
    tema VARCHAR(100)
);

-- Tabla para actores
CREATE TABLE Actores (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    otros_datos TEXT
);

-- Tabla intermedia para películas en cintas (relación N:M)
CREATE TABLE PeliculasEnCinta (
    codigo_cinta VARCHAR(10),
    codigo_pelicula VARCHAR(10),
    PRIMARY KEY (codigo_cinta, codigo_pelicula),
    FOREIGN KEY (codigo_cinta) REFERENCES Cintas(codigo),
    FOREIGN KEY (codigo_pelicula) REFERENCES Peliculas(codigo)
);

-- Tabla intermedia para actores en películas (relación N:M)
CREATE TABLE ActoresEnPeliculas (
    codigo_pelicula VARCHAR(10),
    codigo_actor VARCHAR(10),
    PRIMARY KEY (codigo_pelicula, codigo_actor),
    FOREIGN KEY (codigo_pelicula) REFERENCES Peliculas(codigo),
    FOREIGN KEY (codigo_actor) REFERENCES Actores(codigo)
);

-- Insertar datos de ejemplo
INSERT INTO Cintas (codigo, estanteria, estante, fila) VALUES
('C001', 'A', '1', '1'),
('C002', 'B', '2', '3'),
('C003', 'C', '3', '2');

INSERT INTO Peliculas (codigo, titulo, director_principal, tema) VALUES
('P001', 'El Padrino', 'Francis Ford Coppola', 'Drama'),
('P002', 'Interestelar', 'Christopher Nolan', 'Ciencia Ficción'),
('P003', 'Parásitos', 'Bong Joon-ho', 'Suspense');

INSERT INTO Actores (codigo, nombre, apellido, otros_datos) VALUES
('A001', 'Marlon', 'Brando', 'Premio Oscar 1973'),
('A002', 'Matthew', 'McConaughey', 'Mejor actor 2014'),
('A003', 'Song', 'Kang-ho', 'Mejor actor de reparto 2020');

INSERT INTO PeliculasEnCinta (codigo_cinta, codigo_pelicula) VALUES
('C001', 'P001'),
('C002', 'P002'),
('C003', 'P003'),
('C002', 'P001');

INSERT INTO ActoresEnPeliculas (codigo_pelicula, codigo_actor) VALUES
('P001', 'A001'),
('P002', 'A002'),
('P003', 'A003');