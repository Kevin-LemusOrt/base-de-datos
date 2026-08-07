/*

SQL (data query lenguaje) en SQLSERVER

Archivo: 01-create-database.sql

Descripcion: Crear la base de datos para la practica de las consultas
*/

USE master;

IF DB_ID('comercial_db') IS NOT NULL
BEGIN
    ALTER DATABASE comercial_db
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE

    DROP DATABASE comercial_db;
END;

CREATE DATABASE comercial_db;

USE comercial_db;

PRINT 'la base de datos comercial_db se creo correctamente';

-- SELECT DB_ID('comercial_db')