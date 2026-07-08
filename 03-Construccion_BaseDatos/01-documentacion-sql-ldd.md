# construccion d eBase de datoc con SQL-LDD

SQL (Structured Query Lenguaje) se divide en cinco grandes categorias:

1. DDL (Data Definition Lenguaje)
2. DML (Data Manipulation Lenguaje)
3. DQL (Data Query Lenguaje)
4. DCL (Data COntrol Lenguaje)
5. TCL (Transaction Control Lenguaje)

## SQL-DDL
**Lenguaje de definicion de datos**
Se utiliza para **crear y modificar la estructura** de una base de datos

con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos
- Tablas
- Vistas
- Indices
- Restricciones
- Esquemas
- Trigger
- Funtions

**Comandos principales**

| Comando | Funcion |
|||
| CREATE | Crear objetos |
| ALTER | Modificar objetos |
| DROP | Eliminar objetos |
| TRUNCATE | Vaciar objetos |

## SQL-DML
**Lenguaje de manipulacion de datos**
Sirve para **trabajar con la informacion almacenada** aqui no cambia la estructura, sino los registros

**Comandos principales**

| Comando | Funcion |
|:---|:---|
| INSERT | Insertar Registros |
| UPDATE | Actualizar Registros |
| DELETE | Eliminar Registros |

## SQL-DQL
**Lenguaje de consulta de datos**

**Comandos principales**

| Comando | Funcion |
|:---|:---|
| SELECT | Consultar Informacion |

Generalmente se combina con:

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGTH, INNER, CROSS Y FULL)
- DISTRINCT
- TOP / LIMIT
- funciones de agregado (SUM, AVG, MIN, COUNT)
- funciones de ventas (Window funcion)

## Nomenclatura snake_case

**sneke_case** es la convencion mas recomendada de ahora si se busca una nomenclatura moderna, portable, y alineada con buenas practicas en distintos motores de bases de datos

La razon es que funciona de manera consistente en **SQLServer**, **Mysql** y especialmente en **PostgreSQL**. Con snake se evitna problemas de mayusculas y se hacen las consultas sean mas legibles.

**Estandar de construccion**

| Objeto | Convencion | Ejemplo |
| :--- | :--- | :--- |
| Base de datos | sneak_case | control_escolar |
| Esquema | sneak_case | ventas, rh, seguridad |
| Tabla | singular en sneak_case | cliente, pedido, detalle_pedido |
| Columna | sneak_case | cliente_id, fecha_registro, nombre, correo_electronico |
| PK | <tabla>_id | cliente_id, categoria_id |
| FK | igual que la PK referenciada | cliente_id, producto_id |
| Tabla puente | <tabla1>_<tabla2> | alumno_curo, provedor_producto |

**NOmbrar las restricciones**

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tablareferenciada
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
