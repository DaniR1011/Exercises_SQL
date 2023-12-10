-- Enunciado ejercicio

-- 1. El esquema de base de datos resultante debe tener 4 tablas, con identificadores únicos y las referencias entre sí mismas.
-- 2. La base de datos debe ser modificable y adjuntar consultas que permitan la alteración de las columnas por cada tabla.
-- 3. La tabla participaciones debe tener un valor de datos acotado, es decir, debe ser un valor de cadena de caracteres dentro de las opciones mencionadas en el enunciado.
-- 4. Se poblará la base de datos inicialmente con dos juegos de valores por tabla, para demostrar su funcionalidad.
-- 5. Se requiere que se adjunten 5 consultas tipo SELECT en las que se pueda demostrar que los datos cumplen con las restricciones anteriores y el esquema. Es decir, que se vean todas las tablas, sus datos y las relaciones entre las mismas.

CREATE TABLE Alumnos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(25),
	apellido VARCHAR(25)
);
CREATE TABLE Cursos(
	id SERIAL PRIMARY KEY,
	nombre_curso VARCHAR(25),
	duracion_semanas INTEGER,
	fecha_inicio DATE
);
CREATE TABLE Inscripciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id),
	fecha DATE
);
CREATE TABLE Participaciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id),
	tipo VARCHAR(10) CHECK (tipo IN('Foro','Clase','Tareas')),
	fecha DATE
);

ALTER TABLE Inscripciones
ADD COLUMN fecha DATE;

INSERT INTO Alumnos(nombre, apellido)
VALUES 
('Daniel', 'Recio'),
('Pedro', 'Ruiz');

INSERT INTO Cursos(nombre_curso, duracion_semanas, fecha_inicio)
VALUES 
('Python', 12, '2023-02-01'),
('SQL', 8, '2023-03-02');

INSERT INTO Inscripciones(id_alumno, id_curso, fecha)
VALUES 
(1, 1, '2023-02-05'),
(2, 1, '2023-05-03');

INSERT INTO Participaciones(id_alumno, id_curso, tipo, fecha)
VALUES 
(1, 1, 'Foro', '2023-04-01'),
(2, 1, 'Clase', '2023-05-05');

SELECT alumnos.nombre, alumnos.apellido, inscripciones.fecha AS fecha_inicio, participaciones.fecha AS fecha_participacion, participaciones.tipo, cursos.nombre_curso
FROM alumnos
INNER JOIN inscripciones ON alumnos.id = inscripciones.id_alumno
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
INNER JOIN cursos ON cursos.id = participaciones.id_curso
WHERE alumnos.nombre = 'Daniel' AND alumnos.apellido = 'Recio';

SELECT alumnos.nombre, alumnos.apellido, inscripciones.fecha AS fecha_inicio, participaciones.fecha AS fecha_participacion, participaciones.tipo, cursos.nombre_curso
FROM alumnos
INNER JOIN inscripciones ON alumnos.id = inscripciones.id_alumno
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
INNER JOIN cursos ON cursos.id = participaciones.id_curso
WHERE alumnos.nombre = 'Pedro' AND alumnos.apellido = 'Ruiz';

SELECT alumnos.nombre, alumnos.apellido, cursos.nombre_curso
FROM alumnos
INNER JOIN cursos ON cursos.id = alumnos.id
WHERE alumnos.nombre = 'Daniel' AND alumnos.apellido = 'Recio';

SELECT alumnos.nombre, alumnos.apellido, participaciones.tipo, participaciones.fecha AS fecha_participacion
FROM alumnos
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
WHERE alumnos.nombre = 'Pedro' AND alumnos.apellido = 'Ruiz';

SELECT alumnos.nombre, alumnos.apellido, cursos.nombre_curso, participaciones.tipo
FROM alumnos
INNER JOIN cursos ON cursos.id = alumnos.id
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
WHERE alumnos.nombre = 'Daniel' AND alumnos.apellido = 'Recio';