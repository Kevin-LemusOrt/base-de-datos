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

/*=========================operador like=====================================
	Permite buscar buscar patrones dentro de valores de texto
	sintaxis
	WHERE columna LIKE patron
	los patrones pueden contener comodines

 	comodin	Significado
	 %		cero, wo o varias columna
	 _		exactamente un caracter
	 [abc]	un caracter incluido en la lista
	 [a-f] 	un caracter incluido en el rango
	 [^abc]	un caracter no incluido en la lista
=============================================================*/

-- comodin %
-- el simbolo representa cualquier cantidad de caracteres incluyendo 0 caracteres

--comienza
--WHERE nombre LIKE ´Cliente%´
--valores que comienzan con cliente

--termina
--WHERE correo LIKE ´%mail.com´
--valores que terminan con mail.com

--contiene
--WHERE nombre Like ´%a%´
--valores que contienen el caracter a en cualquier posicion

-- buscar codigos de productos que comiencen con P001

SELECT
	p.codigos,
	p.nombre,
	p.precio,
FROM productos AS p
WHERE p.codigos LIKE `P001%`;

--patrones con corchetes
SELECT
	P.Codigo,
	P.nombre,
	P.Precio
FROM productos AS p
WHERE P.codigos LIKE `P000[1-5]`;

-- buscar los correos de los clientes que terminen exactamente con 10@mail.com
SELECT 
	c.id_cliente;
	c.nombre;
	c.correo
FROM clientes AS c
WHERE c.correo LIKE `%10@mail.com`;

--mostrar los nombres que contiene el caracter 1

SELECT 
	p.codigos;
	p.nombre;
	p.precio
FROM producto AS p
WHERE p.nombre LIKE `%1%`;

--comodin de un caracter
-- el guino bajo representa exactamente un caracter

--Mostrar los codigos con P00 y exactamente un caracter adicionar

SELECT 
	p.codigos;
	p.nombre;
	p.precio
FROM producto AS p
WHERE p.codigos LIKE `P000_`;

SELECT
	P.Codigo,
	P.nombre,
	P.Precio
FROM productos AS p
WHERE P.codigos LIKE `P000[^1-5]`;

--buscar un guion bajo

--en LIKE - es un comodin
--las ciudades de esta base de datos contienen guiones bajo por ejemplo:

--Ciudad_1_1
--para buscar un guion bajo literar mediente corchetes se utiliza :

SELECT *
FROM ciudades
WHERE nombre LIKE ``