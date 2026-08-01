/* ================
 	crear a la Base de datos
 ================== */

CREATE DATABASE hospital;

/* ==================
	usar la base de datos
===================== */

USE hospital;

/* ==================
	crear la tabla paciente
===================== */

CREATE TABLE paciente(
	id_paciente INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NULL,
	fecha_nacimiento DATE NOT NULL ,
	
	CONSTRAINT pk_paciente
	PRIMARY KEY (id_paciente)
);

/* ==================
	crear la tabla expediente_medico
===================== */

CREATE TABLE expediente_medico(
	id_expediente INT NOT NULL IDENTITY(1,1),
	numero_expediente VARCHAR(20) NOT NULL,
	fecha_apertura DATE NOT NULL
	CONSTRAINT df_expediente_medico_fecha
	DEFAULT (CAST(SYSDATETIME() AS DATE)),
	tipo_sangre VARCHAR(5) NOT NULL,
	id_paciente INT NOT NULL,
	
	CONSTRAINT pk_expediente_medico
	PRIMARY KEY (id_expediente),
	CONSTRAINT uq_expediente_medico_numero_expediente
	UNIQUE (numero_expediente),
	CONSTRAINT uq_expediente_medico_id_paciente
	UNIQUE (id_paciente),
	CONSTRAINT fk_expediente_medico_paciente
	FOREIGN KEY (id_paciente)
	REFERENCES paciente(id_paciente)
);