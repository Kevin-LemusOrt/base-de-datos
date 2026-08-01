/* =====================
    Crear base de datos
===================== */

CREATE DATABASE empresa;

/* =====================
    Usar base de datos
===================== */

USE empresa;

/* =====================
    Crear tabla cliente
===================== */

CREATE TABLE cliente(
	id_cliente INT NOT NULL IDENTITY(1,1),
	numero_cliente VARCHAR(15) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NULL,
	rfc VARCHAR(13) NOT NULL,
	
	CONSTRAINT pk_cliente
	PRIMARY KEY (id_cliente),
	CONSTRAINT uq_cliente_numero_cliente
	UNIQUE (numero_cliente),
	CONSTRAINT uq_cliente_rfc
	UNIQUE (rfc),
);

/* =====================
    Crear tabla producto
===================== */

CREATE TABLE producto(
	id_producto INT NOT NULL IDENTITY(1,1),
	numero_producto VARCHAR(15) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	
	CONSTRAINT pk_producto
	PRIMARY KEY (id_producto),
	CONSTRAINT uq_producto_numero_producto
	UNIQUE (numero_producto),
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0)
);

/* =====================
    Crear tabla pedido
===================== */

CREATE TABLE pedido(
	id_pedido INT NOT NULL IDENTITY(1,1),
	numero_pedido VARCHAR(15) NOT NULL,
	fecha DATETIME2 NOT NULL
	CONSTRAINT df_pedido_fecha
	DEFAULT SYSDATETIME(),
	id_cliente INT NOT NULL,
	
	CONSTRAINT pk_pedido
	PRIMARY KEY (id_pedido),
	CONSTRAINT uq_pedido_numero_pedido
	UNIQUE (numero_pedido),
	CONSTRAINT fk_pedido_id_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente(id_cliente)
);

/* =====================
    Crear tabla detalle_pedido
===================== */

CREATE TABLE detalle_pedido(
	id_detalle INT NOT NULL IDENTITY(1,1),
	cantidad INT NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	id_pedido INT NOT NULL,
	id_producto INT NOT NULL,
	
	CONSTRAINT pk_detalle_pedido
	PRIMARY KEY (id_detalle),
	CONSTRAINT ck_detalle_pedido_cantidad
	CHECK (cantidad > 0),
	CONSTRAINT ck_detalle_pedido_precio_venta
	CHECK (precio > 0.0),
	CONSTRAINT fk_detalle_pedido_pedido
	FOREIGN KEY (id_pedido)
	REFERENCES pedido(id_pedido),
	CONSTRAINT fk_detalle_pedido_producto
	FOREIGN KEY (id_producto)
	REFERENCES producto(id_producto)
);