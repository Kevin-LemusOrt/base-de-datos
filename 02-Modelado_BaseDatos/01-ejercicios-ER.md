# ejercicios entidad relacion

### 1.  ejercicio 1
---
en un hospital se registra informacion de sus pacientes, de cada paciente se decea almacenal:
## De cada paciente paciente se decea almacenar
    
-   algo que lo identifique
-   su nombre
-   fecha de nacimiento

## de un expeciente medico se almacena:
    
-   numero de expediente
-   fecha de apertura
-   tipo de sangre

## reglas del negocio:

1. cada paciente debe tener exactamente un expediente medico
2. cada expediente pertenece a un unico paciente
3. no puede existir algun expediente medico sin paciente
4. no puede existir un paciente sin un expediente

## resultado modelo entidad relacion

![Ejercicio1](../img/E-R/Diagrama1_E-R.png)

### 2. ejercicio 2
---
una univercidad administra profesores y cursos

> de cada profesor se almacena
- clave profesor
- nombre
- especialidad - multivalor 

> de cada curso se almacena:
- identificacion del curso
- nombre del curso
- creditos


> reglas del negocio
1. un profesor puede impartir varior cursos
2. un curso solamente puede ser impartido por un profesor
3. puede existir un profesor que actualmente no imprata cursos
4. todo curso debe ser asignado a un profesor 

se debe realizar lo sigueinte 
- entidades
- identificar la relacion **IMPARTE**
- determinar la cardinalidad
- determinar la participacion 

## resultado modelo entidad relacion

![Ejercicio2](../img/E-R/Diagrama2_E-R.drawio.png)

### 3. ejercicio 3
---
una escuela administra alumnos y materias
> de cada alumno almacena
- matricula
- nombre
- semestre

> de cada materia se almacena
- clave de la materia
- nombre de la materia
- creditos

> reglas del negocio
1. un alumno puede inscribirse en varias materia
2. una materia puede tener muchos alumnos inscritos
3. puede existir una materia sin alumnos inscritos
4. todo alumno debe estar inscrito en al menos una materia
5. de cada inscripcion se debe almacenar:
    - fecha de inscripcion
    - calificacion final

>relacion
-   **inscribe**

## resultado modelo entidad relacion

![Ejercicio3](../img/E-R/Diagrama3_E-R.drawio.png)


### 4. ejercicio 4
---
una empresa encargada de realizar venta de productos:
> de cada cliente almacena:
- numero de cliente que lo identifique
- su nombre de cliente el cual es una persona molar
- RFC

> la empresa realiza pedidos en los cuales almacena lo siguente 
- numero de pedido
- fecha

> la empresa almacena productos de los cuales registra lo siguiente
- numero de producto
- nombre
- precio

> al realizar los pedidos deben registrar la cantidad de productos vendidos y su precio

>reglas del negocio 
1. un cliente puede realizar muchos pedidos
2. cada pedido pertenece a un solo cliente
3. un pedido puede contener varios productos
4. un producto puede aparecer en varios pedidos
5. un pedido debe contener al menos un producto
6. un producto puede no haber sido vendido
7. el detalle del pedido no existe sin pedido
8. el detalle de pedido no existe sin producto
9. el detalle almacena cantidad y precio de venta

## resultado modelo entidad relacion

![Ejercicio4](../img/E-R/Diagrama4_E-R.drawio.png)

### 5. ejercicio 5
---

1. The company is organized into departments. Each department has a unique name, a 
unique number, and a particular employee who manages the department.We keep track 
of the start date when that employee began managing the department. A department 
may have several locations. 
2. A department controls a number of projects, each of which has a unique name, a unique 
number, and a single location. 
3. We store each employee's name, Social Security number, address, salary, sex (gender), 
and birth date. An employee is assigned to one department, but may work on several 
projects, which are not necessarily controlled by the same department. We keep track of 
the current number of hours per week that an employee works on each project. We also 
keep track of the direct supervisor of each employee (who is another employee). 
4. We want to keep track of the dependents of each employee for insurance purposes.We 
keep each dependent's first name, sex, birth date, and relationship to the employee. 

## resultado modelo entidad relacion

![Ejercicio5](../img/E-R/Diagrama5_E-R.drawio.png)