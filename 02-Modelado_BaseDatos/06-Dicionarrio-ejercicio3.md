# Diccionario de datos de la base de datos del control escolar de una escuela

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

- Alumnos
- Materias
- Inscripciones

El sistema administra la información de los alumnos, las materias y las inscripciones realizadas.

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

## Tabla: Alumno
**Descripcion**
Almacena la información de los alumnos.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador único del alumno. |
| matricula | VARCHAR | 15 | UQ, NN | Matrícula institucional del alumno. |
| nombre |  | VARCHAR | 30 | NN | Nombre completo del alumno. |
| apellido1 | VARCHAR | 50 | NN | Apellido paterno |
| apellido2 | VARCHAR | 50 | NULL | Apellido materno |
| semestre | INT | - | NN, CK (>0) | Semestre que cursa el alumno. |


## Tabla:Materia
**Descripcion**
Almacena la información de las materias.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_materia | INT |  | - | PK, AI, NN | Identificador único de la materia. |
| clave_materia | VARCHAR | 15 | UQ, NN | Clave oficial de la materia. |
| nombre_materia | VARCHAR | 100 | NN | Nombre de la materia. |
| creditos | INT | - | NN, CK (>0) | Número de créditos de la materia. |


## Tabla: Inscripcion
**Descripcion**

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_inscripcion | INT | - | PK, AI, NN | Identificador único de la inscripción. |
| fecha_inscripcion | DATE | - | NN | Fecha en que el alumno realizó la inscripción. |
| calificacion_final | DECIMAL | 3,2 | NN, CK (>=0 AND <=10) | Calificación final obtenida por el alumno. |
| id_alumno | INT | - | FK, NN | Alumno inscrito. |
| id_materia | INT | - | FK, NN | Materia en la que se inscribió el alumno. |


5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- |
| Alumno → Inscripción | 1:N | Un alumno puede tener varias inscripciones. |
| Materia → Inscripción | 1:N | Una materia puede tener muchas inscripciones. |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Inscripcion | id_alumno | Alumno(id_alumno) |
| Inscripcion | id_materia | Materia(id_materia) |

7. Integridad referencial

| Codigo | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar una inscripción para un alumno inexistente. |
| IR-02 | No se puede registrar una inscripción para una materia inexistente. |
| IR-03 | No se puede eliminar un alumno mientras tenga inscripciones registradas. |
| IR-04 | No se puede eliminar una materia mientras tenga alumnos inscritos. |

8. reglas del nogocio

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en varias materias. |
| RN-02 | Una materia puede tener muchos alumnos inscritos. |
| RN-03 | Puede existir una materia sin alumnos inscritos. |
| RN-04 | Todo alumno debe estar inscrito en al menos una materia. |
| RN-05 | En cada inscripción se debe registrar la fecha de inscripción. |
| RN-06 | En cada inscripción se debe registrar la calificación final, la cual debe estar entre 0.0 y 10.0. |