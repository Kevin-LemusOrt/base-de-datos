# Diccionario de datos de la base de datos de gestion hospitalaria

1. Informacion Gneral

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Expedientes Médicos del Hospital |
| Version | 1.0 |
| Fecha | junio 26
| Elaboro | Ign. Kevin Yair Lemus Ortega |
| SGDB | SQLServer |

2. Descripcion del sistema de base de datos

El sistema administra:

- Pacientes
- Expedientes médicos

Cada paciente posee un único expediente médico, el cual contiene información clínica básica.

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

## Tabla: Paciente
**Descripcion**

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_paciente | INT | - | PK,AINN | Identificador único del paciente.|
| nombre | VARCHAR | 30 | NN | Nombre del paciente|
| apellido1 | VARCHAR | 50 | NN | Apellido paterno |
| apellido2 | VARCHAR | 50 | null | Apellido materno |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento del paciente |

## Tabla: Expediente Medico
**Descripcion**

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_expediente | INT | - | PK, AI, NN | Identificador único del expediente médico. |
| numero_expediente | VARCHAR | 20 | UQ, NN | Número oficial del expediente médico. |
| fecha_apertura | DATE | - | NN | Fecha en que se creó el expediente. |
| tipo_sangre | VARCHAR | 5 | NN | Tipo de sangre del paciente. |
| id_paciente | INT | - | FK, UQ, NN | Paciente al que pertenece el expediente |

5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- |
| Paciente → Expediente_Medico | 1:1 | Cada paciente tiene exactamente un expediente médico y cada expediente pertenece a un solo paciente. |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente_Medico | id_paciente | Paciente(id_paciente) |

7. Integridad referencial

| Codigo | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente médico para un paciente inexistente. |
| IR-02 | No se puede eliminar un paciente mientras exista un expediente médico asociado. |
| IR-03 | Cada expediente médico debe estar asociado a un único paciente. |

8. reglas del nogocio

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener exactamente un expediente médico. |
| RN-02 | Cada expediente médico pertenece a un único paciente. |
| RN-03 | No puede existir un expediente médico sin un paciente registrado. |
| RN-04 | No puede existir un paciente sin un expediente médico. |