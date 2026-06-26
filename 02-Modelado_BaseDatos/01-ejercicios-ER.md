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

![Ejercicio1](../img/E-R/)

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

![Ejercicio3](../img/E-R/DIagrama3.drawio.png)


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

