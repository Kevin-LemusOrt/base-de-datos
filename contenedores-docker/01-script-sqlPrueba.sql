-- crear base de datos pruebaG1

-- permite crear una base de datos (SQL-LDD)
CREATE DATABASE prueba1;

-- utiliza la base de datos
USE prueba1;

-- crear una tabla (SQL-LDD)
CREATE TABLE alumno(
id int NOT NULL,
nombre VARCHAR(20) NOT NULL,
edad INT NOT NULL,
matricula INT NOT NULL,
direccion VARCHAR(30) NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);

-- agregar dos alumnos (SQL-LMD)
INSERT INTO alumno(id, nombre, edad, matricula, direccion)
VALUES (1, 'Kevin', 19, 25300771, 'Tatooine'),
	(2, 'Patricio', 27, 25700721, 'Mustafar');

-- seleccionar los alunos (SQL-LMD)
SELECT *
FROM alumno;

-- cambiar el nombre de tatooine a Monico (SQL-LMD)
UPDATE alumno
SET nombre = "Monico"
WHERE id = 1;