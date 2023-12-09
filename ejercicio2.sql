-- Nivel de dificultad: Fácil
-- 1. Crea una base de datos llamada "MiBaseDeDatos".
CREATE DATABASE MiBaseDeDatos

-- 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE Usuarios (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

-- 3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO public.usuarios(id, nombre, edad)
VALUES
(1, 'Daniel', 21),
(2, 'Juan', 19)

-- 4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE public.usuarios
SET edad = 22
WHERE id = 1

-- 5. Elimina un usuario de la tabla "Usuarios".
DELETE FROM public.usuarios
WHERE id = 2

-- Nivel de dificultad: Moderado
-- 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE Ciudades (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

-- 2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO public.ciudades(id, nombre, pais)
VALUES
(1, 'Madrid', 'España'),
(2, 'Paris', 'Francia'),
(3, 'Roma', 'Italia')

-- 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT;  

ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
    FOREIGN KEY (ciudad_id)
    REFERENCES Ciudades(id);

-- 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).
SELECT Usuarios.nombre AS nombre_usuario, Ciudades.nombre, Ciudades.pais
FROM Usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

-- 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
SELECT Usuarios.nombre AS nombre_usuario, Ciudades.nombre, Ciudades.pais
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;