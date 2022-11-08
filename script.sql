DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS zona_almac_producto;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS zona;
DROP TABLE IF EXISTS vivero;

CREATE TABLE vivero (
	vivero_id INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR(300) NOT NULL
);

INSERT INTO vivero
VALUES(11, 'VIVERO1', 'DIRECCION1');

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

SELECT *
FROM zona;

CREATE TABLE producto (
	producto_id INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	precio NUMERIC(6,2)
);

INSERT INTO producto
VALUES(111, 'PRODUCTO1', 21.50);

SELECT *
FROM producto;

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

SELECT *
FROM empleado;
