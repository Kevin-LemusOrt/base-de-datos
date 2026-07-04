# Diccionario de datos de la base de datos de una compañia

1. Informacion General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control escolar|
| Version | 1.0 |
| Fecha | junio 26
| Elaboro | Ign. Jose Luis Herrera Gallardo, MIT |
| SGDB | SQLServer |

2. Descripcion del sistema de base de datos

El sistema administra
- Empleados (Employer)
- Departamentos (Departament)
- Proyectos (Projec)
- Ubicaciones (Location)
- Dependientes (Dependet)
- Asignaciones de empleados a proyectos (work_on)

3. catalogo de restricciones utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreing key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Chek |
| DF | Default |

4. Diccionario de datos

## Tabla: Employer

**Descripción**
Almacena la información de los empleados de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | VARCHAR | 11 | PK, NN | Número de Seguro Social del empleado. |
| name | VARCHAR | 30 | NN | Nombre completo del empleado. |
| last_name | VARCHAR | 50 | NN | Apellido del empleado |
| address | VARCHAR | 200 | NN | Dirección del empleado. |
| salary | DECIMAL | 10,2 | NN, CK (>0) | Salario del empleado. |
| sex | CHAR | 1 | NN | Sexo del empleado. |
| birthdate | DATE | - | NN | Fecha de nacimiento. |
| numberdep | INT | - | FK, NN | Departamento al que pertenece. |
| boss | VARCHAR | 11 | FK, NULL | Supervisor directo del empleado. |

## Tabla: Departament

**Descripción**
Almacena la información de los departamentos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numberdep | INT | - | PK, NN | Número del departamento. |
| namedep | VARCHAR | 100 | UQ, NN | Nombre del departamento. |
| managerssn | VARCHAR | 11 | FK, NN | Empleado que administra el departamento. |
| startdate | DATE | - | NN | Fecha de inicio de la gerencia. |

## Tabla: Location

**Descripción**
Almacena las ubicaciones de los departamentos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numberdep | INT | - | PK, FK, NN | Departamento al que pertenece la ubicación. |
| namelocation | VARCHAR | 100 | PK, NN | Nombre de la ubicación del departamento. |

## Tabla: Projec

**Descripción**
Almacena la información de los proyectos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numberprojec | INT | - | PK, NN | Número del proyecto. |
| nameprojec | VARCHAR | 100 | PK, NN | Nombre del proyecto. |
| location | VARCHAR | 100 | NN | Ubicación donde se desarrolla el proyecto. |
| numberdep | INT | - | FK, NN | Departamento responsable del proyecto. |

## Tabla: work_on

**Descripción**
Registra la participación de los empleados en los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | VARCHAR | 11 | PK, FK, NN | Empleado asignado al proyecto. |
| numberprojec | INT | - | PK, FK, NN | Proyecto asignado. |
| nameprojec | VARCHAR | 100 | PK, FK, NN | Nombre del proyecto. |
| hours | DECIMAL | 5,2 | NN, CK (>0) | Horas trabajadas por semana. |

## Tabla: Dependet

**Descripción**
Almacena la información de los dependientes de cada empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | VARCHAR | 11 | PK, FK, NN | Empleado al que pertenece el dependiente. |
| name | VARCHAR | 100 | PK, NN | Nombre del dependiente. |
| sex | CHAR | 1 | NN | Sexo del dependiente. |
| birthdate | DATE | - | NN | Fecha de nacimiento. |
| relationship | VARCHAR | 50 | NN | Parentesco con el empleado. |

5. Relaciones en la base de datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Departament → Employer | 1:N | Un departamento tiene varios empleados. |
| Departament → Projec | 1:N | Un departamento controla varios proyectos. |
| Departament → Location | 1:N | Un departamento puede tener varias ubicaciones. |
| Employer → Employer | 1:N | Un empleado puede supervisar a varios empleados. |
| Employer → Dependet | 1:N | Un empleado puede tener varios dependientes. |
| Employer → work_on | 1:N | Un empleado puede participar en varios proyectos. |
| Projec → work_on | 1:N | Un proyecto puede tener varios empleados asignados. |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employer | numberdep | Departament(numberdep) |
| Employer | boss | Employer(ssn) |
| Departament | managerssn | Employer(ssn) |
| Location | numberdep | Departament(numberdep) |
| Projec | numberdep | Departament(numberdep) |
| work_on | ssn | Employer(ssn) |
| work_on | numberprojec, nameprojec | Projec(numberprojec, nameprojec) |
| Dependet | ssn | Employer(ssn) |

7. Integridad referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado en un departamento inexistente. |
| IR-02 | No se puede registrar un proyecto para un departamento inexistente. |
| IR-03 | Todo gerente debe ser un empleado registrado. |
| IR-04 | Todo supervisor debe ser un empleado registrado. |
| IR-05 | No se puede registrar un dependiente para un empleado inexistente. |
| IR-06 | No se puede registrar una asignación de trabajo para un empleado o proyecto inexistente. |
| IR-07 | No se puede registrar una ubicación para un departamento inexistente. |

8. reglas del nogocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada departamento tiene un nombre y un número únicos. |
| RN-02 | Cada departamento es administrado por un solo empleado. |
| RN-03 | Un departamento puede tener varias ubicaciones. |
| RN-04 | Un departamento controla varios proyectos. |
| RN-05 | Cada empleado pertenece a un solo departamento. |
| RN-06 | Un empleado puede trabajar en varios proyectos. |
| RN-07 | Un proyecto puede tener varios empleados asignados. |
| RN-08 | Se registran las horas trabajadas por semana de cada empleado en cada proyecto. |
| RN-09 | Un empleado puede supervisar a otros empleados. |
| RN-10 | Un empleado puede tener varios dependientes. |