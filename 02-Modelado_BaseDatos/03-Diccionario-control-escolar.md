# Diccionario de datos de la base de datos del control escolar

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
- Carreras
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones

Permite controlar la oferta academica y la instcripcion de estudiantes

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

## Tabla: Carrera
**Descripcion**

Almacena las carreras ofertadas por la universidad

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| ID_carrera | INT | - | PK, AI, NN | Identificador unico de la carrera |
| Nombre | VARCHAR | 100 | UQ, NN | Nombre de la carrera |
| Duraccion_cuatrimestre | INT | - | NN, CK( >0 ) |  cuanto duran los cuatrimestres |

---

## Tabla: Alumno
**Descripcion**

Almacena los datos de los estudiantes

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador unico del alumno |
| matricula | VARCHAR | 10 | UQ, NN | Matricula institucional |
| nombre | VARCHAR | 30 | NN |  Nombre del alumno |
| apellido_paterno | VARCHAR | 50 | NN |  Apellido paterno |
| apellido_materno | VARCHAR| 50 | NULL | Apellido materno |
| correo | VARCHAR | 100 | NN | Correo del alumno |
| fecha_nacimiento | DATE | - | NULL | Fecha de nacimieto |
| id_carrera | INT | - | FK, NN | Carrera de la persona |

---

5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Una Profesor puede impartir varios grupos |
| Materia -> Grupo | 1:N | Una materia puede abrirse en varios grupos |
| Aumno -> Inscripcion | 1:N | Una alumno puede tener varias inscripciones |
| grupo -> Inscripcion | 1:N | UN grupo puede tener muchos alumno |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno | id_carrera | Carrera(id_carrera) |
| Materia | id_carrera | Carrera(id_carrera) |
| Grupo | id_profesor | prfesor(id_profesor) |
| Grupo | id_materia | materia(id_materia) |
| Inscripcion | id_alumno | alumno(id_alumno) |
| Inscripcion | id_grupo | grupo(id_grupo) |

7. Integridad referencial

| Codigo | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno sin una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |
| IR-04 | No se puede inscribir un alumno en un grupo inexistente |
| IR-05 | No se puede eliminar una carrera que tenga alumnos sin antes registrarlos o eliminarlos |

8. reglas del nogocio

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un profesor puede impartir varios grupos |
| RN-05 | un grupo solo puede tener un profesor asignado |
| RN-06 | La calificacion debe estar entre 0.0 y 10.0 |