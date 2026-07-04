# Diccionario de datos de la base de datos del control de universidad

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
- Profesores
- Cursos

El sistema administra la información de los profesores y los cursos impartidos en la universidad.

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

## Tabla: Profesor
**Descripcion**
Almacena la información de los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_profesor | INT | - | PK, AI, NN | Identificador único del profesor. |
| clave_profesor | VARCHAR | 15 | UQ, NN | Clave institucional del profesor. |
| nombre | VARCHAR | 30 | NN | Nombre del profesor |
| apellido1 | VARCHAR | 50 | NN | Apellido paterno |
| apellido2 | VARCHAR | 50 | NULL | Apellido materno |

## Tabla: Especialidad
**Descripcion**
Almacena las especialidades asociadas a cada profesor.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_especialidad | INT | - | PK, AI, NN | Identificador único de la especialidad. |
| nombre_especialidad | VARCHAR | 100 | NN | Nombre de la especialidad del profesor. |
| id_profesor | INT | - | FK, NN | Profesor al que pertenece la especialidad. |

## Tabla: Curso
**Descripcion**
Almacena la información de los cursos ofertados por la universidad.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_curso | INT | - | PK, AI, NN | Identificador único del curso. |
| nombre_curso | VARCHAR | 100 | NN | Nombre del curso. |
| creditos | INT | - | NN, CK (>0) | Número de créditos del curso. |
| id_profesor | INT | - | FK, NN | Profesor encargado de impartir el curso. |

5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- |
| Profesor → Curso | 1:N | Un profesor puede impartir varios cursos y cada curso pertenece a un solo profesor. |
| Profesor → Especialidad | 1:N | Un profesor puede tener varias especialidades. |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Curso | id_profesor | Profesor(id_profesor) |
| Especialidad | id_profesor | Profesor(id_profesor) |

7. Integridad referencial

| Codigo | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un curso para un profesor inexistente. |
| IR-02 | No se puede registrar una especialidad para un profesor inexistente. |
| IR-03 | No se puede eliminar un profesor mientras tenga cursos asignados. |
| IR-04 | Toda especialidad debe pertenecer a un profesor registrado. |


8. reglas del nogocio

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos. |
| RN-02 | Cada curso solamente puede ser impartido por un profesor. |
| RN-03 | Puede existir un profesor que actualmente no imparta cursos. |
| RN-04 | Todo curso debe estar asignado a un profesor. |
| RN-05 | Un profesor puede tener una o varias especialidades. |
