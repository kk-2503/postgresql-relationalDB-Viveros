DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS zona_almac_producto;
DROP TABLE IF EXISTS pedido_cont_producto;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS zona;
DROP TABLE IF EXISTS vivero;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS cliente_P_fidelizacion;
DROP TABLE IF EXISTS cliente_Sin_P_fidelizacion;

CREATE TABLE vivero (
	vivero_id INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR(300) NOT NULL
);

INSERT INTO vivero
VALUES(11, 'VIVERO1', 'DIRECCION1');


INSERT INTO vivero
VALUES(NULL, 'VIVERO2', 'DIRECCION2');

INSERT INTO vivero
VALUES(22, NULL, 'DIRECCION2');

INSERT INTO vivero
VALUES(33, 'VIVERO3', NULL);

INSERT INTO vivero
VALUES(55, 'VIVERO5', 'DIRECCION5');


SELECT *
FROM vivero;

CREATE TABLE zona (
	zona_id INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	vivero_id INT NOT NULL,
	CONSTRAINT fk_vivero
	FOREIGN KEY(vivero_id)
	REFERENCES vivero(vivero_id)
);

INSERT INTO zona
VALUES(1, 'ALMACEN', 11);

INSERT INTO zona
VALUES(2, NULL, 22);

INSERT INTO zona
VALUES(2, 'TIENDA', NULL);

INSERT INTO zona
VALUES(NULL, 'ALMACEN', 44);

INSERT INTO zona
VALUES(NULL, 'TIENDA', NULL);

SELECT *
FROM zona;


CREATE TABLE empleado (
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	puesto VARCHAR(150) NOT NULL,
	inicio DATE NOT NULL CHECK (inicio > '1900-01-01'),
	fin DATE,
	zona_id INT NOT NULL,
	CONSTRAINT fk_zona
	FOREIGN KEY(zona_id)
	REFERENCES zona(zona_id)
);

INSERT INTO empleado
VALUES('12345678Z', 'PEPE', 'ABC', '2022-11-01', NULL,1);


INSERT INTO empleado
VALUES('12345678X', 'JOSE', 'ABC', '2021-11-01', '2022-11-01',1);

INSERT INTO empleado
VALUES('12345679K', 'MARIA', 'ABC', '2021-11-01', '2022-11-01',2);

INSERT INTO empleado
VALUES('12345679P', 'LAURA', 'ABC', '2021-11-01', NULL,1);

INSERT INTO empleado
VALUES('12345639A', 'ANDRES', 'ABC', '2021-11-01', '2022-11-01',1);

SELECT *
FROM empleado;

CREATE TABLE cliente (
	dni_cliente VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
);

INSERT INTO cliente
VALUES('12345J', 'PACO');

INSERT INTO cliente
VALUES('12346x', 'PAULA');

SELECT * 
FROM cliente;

CREATE TABLE cliente_P_fidelizacion (
	dni_cliente VARCHAR(9) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	inicio DATE NOT NULL,
	CONSTRAINT fk_fidel
	FOREIGN KEY(dni_cliente)
	REFERENCES cliente(dni_cliente)
);

INSERT INTO cliente_P_fidelizacion
VALUES('12345J', 'PACO', '2021-12-07');

INSERT INTO cliente_P_fidelizacion
VALUES('12345567S', 'SAUL', '2021-09-02');

INSERT INTO cliente_P_fidelizacion
VALUES('12345567Q', 'ANDREA', NULL);

INSERT INTO cliente_P_fidelizacion
VALUES(NULL, 'LUCIA', '2021-09-02');

INSERT INTO cliente_P_fidelizacion
VALUES('1234598W', NULL, '2021-09-02');


SELECT * 
FROM cliente_P_fidelizacion;

CREATE TABLE cliente_Sin_P_fidelizacion (
	dni_cliente VARCHAR(9) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	CONSTRAINT fk_fidel
	FOREIGN KEY(dni_cliente)
	REFERENCES cliente(dni_cliente)
);

INSERT INTO cliente_Sin_P_fidelizacion
VALUES('12346x', 'PAULA');

INSERT INTO cliente_Sin_P_fidelizacion
VALUES(NULL, 'LUIS');

INSERT INTO cliente_Sin_P_fidelizacion
VALUES('12346P', NULL);

INSERT INTO cliente_Sin_P_fidelizacion
VALUES('12346Q', 'SANDRO');

INSERT INTO cliente_Sin_P_fidelizacion
VALUES('54374K', 'ANA');


SELECT *
FROM cliente_Sin_P_fidelizacion;

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY,
	fecha DATE NOT NULL,
	importe NUMERIC(8,2),
	dni_emple VARCHAR(9) NOT NULL,
	dni_cliente VARCHAR(9) NOT NULL,
	CONSTRAINT fk_emple
	FOREIGN KEY(dni_emple)
	REFERENCES empleado(dni)
	ON DELETE RESTRICT
	ON UPDATE CASCADE,
	CONSTRAINT fk_cliente
	FOREIGN KEY(dni_cliente)
	REFERENCES cliente(dni_cliente)
);

INSERT INTO pedido
VALUES(12, '2022-04-12', 100.40, '12345678Z', '12346x');

INSERT INTO pedido
VALUES(11, '2022-04-10', 61.40, '12345678Z', '12345J');

INSERT INTO pedido
VALUES(NULL, '2022-04-09', 23.40, '12345678F');

INSERT INTO pedido
VALUES(11, NULL, 1.40, '12145678L');

INSERT INTO pedido
VALUES(22, '2022-04-10', 21.90, NULL);

SELECT *
FROM pedido;


CREATE TABLE producto (
	producto_id INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	precio NUMERIC(6,2)
);

INSERT INTO producto
VALUES(111, 'PRODUCTO1', 21.50);

INSERT INTO producto
VALUES(222, 'PRODUCTO2', 13.50);

INSERT INTO producto
VALUES(333, 'PRODUCTO3', 19.34);

INSERT INTO producto
VALUES(444, 'PRODUCTO4', 98.78);

INSERT INTO producto
VALUES(NULL, 'PRODUCTO5', 1.50);

SELECT *
FROM producto;

CREATE TABLE pedido_cont_producto (
	id_pedido INT NOT NULL,
	producto_id INT NOT NULL,
	CONSTRAINT fk_pedido
	FOREIGN KEY(id_pedido)
	REFERENCES pedido(id_pedido),
	CONSTRAINT fk_producto
	FOREIGN KEY(producto_id)
	REFERENCES producto(producto_id)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

INSERT INTO pedido_cont_producto
VALUES(12, 333);

INSERT INTO pedido_cont_producto
VALUES(12, 222);

INSERT INTO pedido_cont_producto
VALUES(11, 222);


INSERT INTO pedido_cont_producto
VALUES(NULL, 222);

INSERT INTO pedido_cont_producto
VALUES(11, 22);


SELECT *
FROM pedido_cont_producto;

CREATE TABLE zona_almac_producto (
	zona_id INT NOT NULL,
	producto_id INT NOT NULL,
	stock INT NOT NULL,
	CONSTRAINT fk_zona1
	FOREIGN KEY(zona_id)
	REFERENCES zona(zona_id),
	CONSTRAINT fk_producto
	FOREIGN KEY(producto_id)
	REFERENCES producto(producto_id)
);

INSERT INTO zona_almac_producto
VALUES(1, 111, 54);


INSERT INTO zona_almac_producto
VALUES(1, 222, 34);

INSERT INTO zona_almac_producto
VALUES(NULL, 111, 54);

INSERT INTO zona_almac_producto
VALUES(1, NULL, 54);

INSERT INTO zona_almac_producto
VALUES(2, 333, 24);


SELECT *
FROM zona_almac_producto;

