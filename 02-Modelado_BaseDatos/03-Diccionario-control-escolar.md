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
| correo | DATE | - | NN | Correo del alumno |
| fecha_nacimiento | VARCHAR | 100 | NULL | Fecha de nacimieto |
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
| Alumno | id_carrera | Carrera(id_carrera) |