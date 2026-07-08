--construccion de base de datos con SQL-LDD(CREATE, ALTER, DROP)
--crear una base de datos
CREATE DATABASE empresa_patito;
GO

--utilizar la base de datos
USE empresa_patito;
GO

--Crear tabla
CREATE TABLE alumno(
    alimno_id INT,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES (1, "Domingo", "Sarabia", "Mendez", "1942-03-14", "domingo@gomingo.com");

INSERT INTO alumno
VALUES (1, "Patricio", "Pineda", "Robles", "1912-05-14", "patricio@patito.com");
GO

SELECT *
FROM alumno
DROP TABLE alumno;
GO

-- REstricciones
--Primary key
CREATE TABLE alumno(
    alimno_id INT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES (1, "Domingo", "Sarabia", "Mendez", "1942-03-14", "domingo@gomingo.com");

INSERT INTO alumno
VALUES (2, "Patricio", "Pineda", "Robles", "1912-05-14", "patricio@patito.com");
GO

DROP TABLE alumno;
GO

CREATE TABLE alumno(
    alimno_id INT NOT NULL,
    CONSTRAINT pk_alumno
    PRIMARY KEY (alimno_id)
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES (1, "Domingo", "Sarabia", "Mendez", "1942-03-14", "domingo@gomingo.com");

INSERT INTO alumno
VALUES (2, "Patricio", "Pineda", "Robles", "1912-05-14", "patricio@patito.com");
GO

DROP TABLE alumno;
GO

CREATE TABLE alumno(
    alimno_id INT NOT NULL,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
    CONSTRAINT pk_alumno
    PRIMARY KEY (alumno)
);
GO

INSERT INTO alumno
VALUES (1, "Domingo", "Sarabia", "Mendez", "1942-03-14", "domingo@gomingo.com");

INSERT INTO alumno
VALUES (2, "Patricio", "Pineda", "Robles", "1912-05-14", "patricio@patito.com");
GO

SELECT *
FROM alumno

--Primary key con IDENTITY

CREATE TABLE categoria(
    categoria_id INT IDENTITY (1,1) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    activo bit NOT NULL
);
GO

INSERT INTO categoria
VALUES ('Carnes frias',1);

INSERT INTO categoria
VALUES ('Carnes frias',1);

SELECT *
FROM categoria

DROP TABLE categoria

--Restricciones check

CREATE TABLE categoria(
    categoria_id INT IDENTITY (1,1),
    CONSTRAINT pk_categoria
    PRIMARY KEY (categoria_id),
    nombre VARCHAR(25) NOT NULL UNIQUE,
    activo bit NOT NULL
);
GO

INSERT INTO categoria
VALUES ('Carnes frias',1);

INSERT INTO categoria
VALUES ('Carnes frias',1);

DROP TABLE categoria

CREATE TABLE categoria(
    categoria_id INT IDENTITY (1,1),
    CONSTRAINT pk_categoria
    PRIMARY KEY (categoria_id),
    nombre VARCHAR(25) NOT NULL
    CONSTRAINT uq_categoria_nombre
    UNIQUE,
    activo bit NOT NULL
);
GO

INSERT INTO categoria
VALUES ('Carnes frias',1);

INSERT INTO categoria
VALUES ('Carnes frias',1);

DROP TABLE categoria

CREATE TABLE categoria(
    categoria_id INT IDENTITY (1,1),
    nombre VARCHAR(25) NOT NULL
    activo bit NOT NULL
    CONSTRAINT pk_categoria
    PRIMARY KEY(categoria_id),
    CONSTRAINT uq_categoria_nombre
    UNIQUE(nombre)
);
GO