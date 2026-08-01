/* =====================
    Crear base de datos
===================== */

CREATE DATABASE compañia;

/* =====================
    Usar base de datos
===================== */

USE compañia;

/* =====================
    Crear tabla employer
===================== */

CREATE TABLE employee(
	ssn VARCHAR(11) NOT NULL,
	name VARCHAR(30) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(200) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	sex CHAR(1) NOT NULL,
	birthday DATETIME2 NOT NULL
	CONSTRAINT df_employee_birthday
	DEFAULT SYSDATETIME(),
	number_departament INT NOT NULL,
	boss VARCHAR(11) NOT NULL,
	
	CONSTRAINT pk_employee
	PRIMARY KEY (ssn),
	CONSTRAINT ck_employee_salary
	CHECK (salary > 0.0),
	CONSTRAINT fk_employee_boss
	FOREIGN KEY (boss)
	REFERENCES employee(ssn)
);

/* =====================
    Crear tabla departament
===================== */

CREATE TABLE departament(
	number_departament INT NOT NULL,
	name_departament VARCHAR(100) NOT NULL,
	manager_ssn VARCHAR(11) NOT NULL,
	start_date DATETIME2 NOT NULL
	CONSTRAINT df_departament_start_date
	DEFAULT SYSDATETIME(),
	
	CONSTRAINT pk_departament
	PRIMARY KEY (number_departament),
	CONSTRAINT uq_departament_name_departament
	UNIQUE (name_departament),
	CONSTRAINT fk_departament_manager
	FOREIGN KEY (manager_ssn)
	REFERENCES employee(ssn)
);

/* =====================
    Agregar FK de employee
===================== */

ALTER TABLE employee
ADD CONSTRAINT fk_employee_departament
FOREIGN KEY (number_departament)
REFERENCES departament(number_departament);

/* =====================
    Crear tabla location
===================== */

CREATE TABLE location(
    number_departament INT NOT NULL,
    name_location VARCHAR(100) NOT NULL,

    CONSTRAINT pk_location
    PRIMARY KEY (number_departament, name_location),
    CONSTRAINT fk_location_departament
    FOREIGN KEY (number_departament)
    REFERENCES departament(number_departament)
);

/* =====================
    Crear tabla projec
===================== */

CREATE TABLE projec(
    number_projec INT NOT NULL,
    name_projec VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    number_departament INT NOT NULL,

    CONSTRAINT pk_projec
    PRIMARY KEY (number_projec, name_projec),
    CONSTRAINT fk_projec_departament
    FOREIGN KEY (number_departament)
    REFERENCES departament(number_departament)
);

/* =====================
    Crear tabla work_on
===================== */

CREATE TABLE work_on(
    ssn VARCHAR(11) NOT NULL,
    number_projec INT NOT NULL,
    name_projec VARCHAR(100) NOT NULL,
    hours DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_work_on
    PRIMARY KEY (ssn, number_projec, name_projec),
    CONSTRAINT ck_work_on_hours
    CHECK (hours > 0),
    CONSTRAINT fk_work_on_employee
    FOREIGN KEY (ssn)
    REFERENCES employee(ssn),
    CONSTRAINT fk_work_on_projec
    FOREIGN KEY (number_projec, name_projec)
    REFERENCES projec(number_projec, name_projec)
);

/* =====================
    Crear tabla dependet
===================== */

CREATE TABLE dependet(
    ssn VARCHAR(11) NOT NULL,
    name VARCHAR(100) NOT NULL,
    sex CHAR(1) NOT NULL,
    birthday DATETIME2 NOT NULL
    CONSTRAINT df_dependet_birthday
	DEFAULT SYSDATETIME(),
    relationship VARCHAR(50) NOT NULL,

    CONSTRAINT pk_dependet
    PRIMARY KEY (ssn, name),
    CONSTRAINT fk_dependet_employer
    FOREIGN KEY (ssn)
    REFERENCES employee(ssn)
);


