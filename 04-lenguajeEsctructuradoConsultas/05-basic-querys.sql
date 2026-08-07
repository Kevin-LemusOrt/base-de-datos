/*

SQL (data query lenguaje) en SQLSERVER

Archivo: 05-basic-querys.sql

Descripcion: Aqui se realizan consultas basicas con select
*/

USE comercial_db;

-- uso de SELECT *

/* Sintaxis

    SELECT * 
    FROM nombre_tabla;

Nota: el * significa todas las columnas de la tabla

No se recomineda usarla siempre :

1- reduce la claridad de la consulta
2- Puede aumentar el consumo de recursos del servidor
3- Puede afectar aplicaciones futuras

*/

SELECT * 
FROM productos;

-- proyecion de la tabla productos
SELECT 
    codigo, 
    nombre, 
    precio
FROM productos;

SELECT 
    nombre, 
    codigo, 
    precio
FROM productos;

-- Alias de columna (Sobre nombre que se le pone a un campo)

SELECT
    codigo AS codigo_producto, 
    nombre AS nombre_producto, 
    precio AS precio_unitario
FROM productos;

SELECT
    codigo codigo_producto, 
    nombre nombre_producto, 
    precio precio_unitario
FROM productos;

SELECT
    codigo AS 'codigo_producto', 
    nombre AS 'nombre_producto', 
    precio AS 'precio_unitario'
FROM productos;

SELECT
    codigo [codigo_producto], 
    nombre [nombre_producto], 
    precio [precio_unitario]
FROM productos;

-- Alias de tabla (Sobre nombre que se le pone a una tabla), es util en los JOINS o en nombres ambiguos 

SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p;

SELECT 
    categorias.id_categoria, 
    categorias.nombre,
    productos.id_producto, 
    productos.nombre,
    productos.precio   
FROM categorias
INNER JOIN
productos
ON categorias.id_categoria = productos.id_categoria;



SELECT 
    c.id_categoria, 
    c.nombre,
    p.id_producto, 
    p.nombre,
    p.precio   
FROM categorias as c
INNER JOIN
productos as p
ON c.id_categoria = p.id_categoria;
GO

SELECT
    p.codigo as Código,
    p.nombre as [nombre producto],
    p.precio as 'precio unitario'
FROM productos AS p;

-- columnas calculadas (operaciones aritmeticas con columnas), Campos calculados y E-R (Atributo derivado)

-- seleccionar el codigo, nombre, precio, existencia y el valor del inventario (precio * existencia) de la tabla productos

SELECT
    p.codigo AS codigo_producto,
    p.nombre AS nombre_prducto,
    p.precio AS precio_unitario,
    p.existencia,
    (p.precio * p.existencia) as precio_inventario
FROM productos AS p;

-- TODO: operadores aritmeticos  
/*

+: SUMA
-: RESTA
*: MULTIPLICACION
/: DIVICION
%: MODULO O RESIDUO DE LA DIVISION

*/

-- seleccionar los empleados y calcular su salario anual --

SELECT
    e.nombre,
    e.apellido_paterno,
    e.salario,
    (salario * 12) AS salario_anual

FROM empleado AS e;

-- seleccionar el detalle de las ventas mostrando 
-- el numero de venta, la cantidad que se vendio, el precio, el descuento
-- calcular el importe bruto (cantidad * precio)
-- calcular el importe con descuento ((importe_bruto * descuento) / 100)
-- calcular el importe_neto (((importe_bruto * 1) - descuento) / 100 )

SELECT
    dv.id_ventas AS #venta,
    dv.cantidad AS cantidad_vendido,
    dv.precio AS [precio de venta],
    dv.descuento AS 'descuento de venta',

    (dv.cantidad * dv.precio) AS importe_bruto,
    (dv.cantidad * dv.precio / 100) AS importe_descuento,
    dv.cantidad * dv.precio * (1.0 - descuento / 100.0) AS importe_neto
FROM detalle_ventas AS dv;


