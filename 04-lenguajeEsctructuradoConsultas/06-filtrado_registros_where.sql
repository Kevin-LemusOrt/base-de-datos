/*

SQL (Data Query Lenguaje) en SQLServer
Archivo 04-filtrado_registros_where.sql
Descripciom: Se recuperan inicamente las filas que cumplen determinadas condiciones
mediante la clausura WHERE  

Orden sintactico

SELECT / TOP / DISTINCT
FROM
JOIN / ON
WHERE
GROUP BY
HAVING
ORDER BY

ORDEN DE EJECUCION
FORM / JOIN (existe el INNER, LEFT, WHITH, COROOS, FULL, SELF)
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
TOP

*/

/* ===================================
 *  Sintaxis
 
 *  SELECT
 *		columna_1
 *		columna_2
 *		columna_n
 *	FROM nombre_tabla
 *	WHERE condicion;
 
 *	Nota: condicion puede ser relacionar y a combinacion de esta con logica
 *	Nota: el SELECT mo filtra registros 
 =====================================*/

-- seleccionar el producto cuyo precio es $200

SELECT
	p.codigos AS [Codigo],
	P.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos AS p
WHERE precio = 200;

-- seleccionar al cliente cuyo identificador es 25

SELECT 
	c.id_cliente,
	CONCAT(c.nombre, ' ',
		c.apellido_paterno, ' ',
		c.apellido_materno) AS nombre_completo,
	c.correo
FROM cliente AS c
WHERE c.id_cliente = 25;

-- comparacion de cadenas de texto
-- los valores de texto deben escribirse entre comillas simples 

SELECT 
	ct.nombre AS [Categoria]
FROM categorias AS ct
WHERE ct.nombre= 'Cómputo';

-- seleccionar los datos del cliente con nombre Cliente1
-- seleccionar los datos delempleado que no pertenecan al departamento 1
-- seleccionar los datos de los productos donde sea superior a $490
-- seleccionar los datos de los productos con existencia critica a 10 unidades
-- seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante

SELECT 
	e.id_empleado,
	e.nombre,
	e.id_departamento,
	e.salario 
FROM empleados AS e
WHERE salario >= 30000; 
-- seleccionar los datos datos de los productos donde sus precios sen de $10 o menos
-- comparacion de fechas
-- las fechas deben escribirse entre comillas simples, se recomienda el formato AAAA-MM-DD
-- seleccionar los datos de las ventas realizadas el 24 de diciembre de 2025

SELECT 
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado 
FROM ventas AS v 
WHERE fecha = '2005-12-24'

-- seleccionar los datos de las ventas realizadas en el mes de abril

SELECT 
	v.id_venta,
	v.fecha,
	v.fecha ,
	YEAR(v.fecha) AS [Año],
	MONTH(v.fecha ) AS [Mes],
	DAT(v.fecha ) AS [Dia],
	v.id_cliente,
	v.id_empleado 
FROM ventas AS v 
WHERE MONTH(fecha) = 4;

-- seleccionar todas las ventas anteriores al 1 de febrero de 2025