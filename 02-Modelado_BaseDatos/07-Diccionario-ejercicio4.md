# Diccionario de datos de la base de datos de una empresa

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
- Clientes
- Pedidos
- Productos
- Detalle de pedidos

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

## Tabla:Cliente
**Descripcion**
Almacena la información de los clientes de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_cliente | INT | - | PK, AI, NN | Identificador único del cliente. |
| numero_cliente | VARCHAR | 15 | UQ, NN | Número asignado al cliente. |
| nombre | VARCHAR | 30 | NN | Nombre completo del cliente. |
| apellido1 | VARCHAR | 50 | NN | Apellido paterno |
| apellido2 | VARCHAR | 50 | NULL | Apellido materno |
| rfc | VARCHAR | 13 | UQ, NN | Registro Federal de Contribuyentes del cliente. |

## Tabla: Pedido

**Descripción**
Almacena la información de los pedidos realizados por los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_pedido | INT | - | PK, AI, NN | Identificador único del pedido. |
| numero_pedido | VARCHAR | 15 | UQ, NN | Número del pedido. |
| fecha | DATE | - | NN | Fecha en que se realizó el pedido. |
| id_cliente | INT | - | FK, NN | Cliente que realizó el pedido. |

## Tabla: Producto

**Descripción**
Almacena la información de los productos disponibles para la venta.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_producto | INT | - | PK, AI, NN | Identificador único del producto. |
| numero_producto | VARCHAR | 15 | UQ, NN | Código o número del producto. |
| nombre | VARCHAR | 100 | NN | Nombre del producto. |
| precio | DECIMAL | 10,2 | NN, CK (>0) | Precio base del producto. |

## Tabla: Detalle_Pedido

**Descripción**

Almacena los productos incluidos en cada pedido y la información de la venta de cada uno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_detalle | INT | - | PK, AI, NN | Identificador único del detalle del pedido. |
| cantidad | INT | - | NN, CK (>0) | Cantidad de productos vendidos. |
| precio_venta | DECIMAL | 10,2 | NN, CK (>0) | Precio al que se vendió el producto. |
| id_pedido | INT | - | FK, NN | Pedido al que pertenece el detalle. |
| id_producto | INT | - | FK, NN | Producto incluido en el pedido. |


5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- |
| Cliente → Pedido | 1:N | Un cliente puede realizar varios pedidos. |
| Pedido → Detalle_Pedido | 1:N | Un pedido puede contener varios productos mediante sus detalles. |
| Producto → Detalle_Pedido | 1:N | Un producto puede aparecer en varios detalles de pedido. |

6. Matriz de claves foraneas FK

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | id_cliente | Cliente(id_cliente) |
| Detalle_Pedido | id_pedido | Pedido(id_pedido) |
| Detalle_Pedido | id_producto | Producto(id_producto) |

7. Integridad referencial

| Codigo | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un pedido para un cliente inexistente. |
| IR-02 | No se puede registrar un detalle para un pedido inexistente. |
| IR-03 | No se puede registrar un detalle para un producto inexistente. |
| IR-04 | No se puede eliminar un pedido mientras tenga detalles registrados. |
| IR-05 | No se puede eliminar un producto mientras esté asociado a un detalle de pedido. |

8. reglas del nogocio

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos. |
| RN-02 | Cada pedido pertenece a un solo cliente. |
| RN-03 | Un pedido puede contener varios productos. |
| RN-04 | Un producto puede aparecer en varios pedidos. |
| RN-05 | Todo pedido debe contener al menos un producto. |
| RN-06 | Un producto puede no haber sido vendido. |
| RN-07 | El detalle del pedido no puede existir sin un pedido asociado. |
| RN-08 | El detalle del pedido no puede existir sin un producto asociado. |
| RN-09 | Cada detalle de pedido debe registrar la cantidad vendida y el precio de venta del producto. |