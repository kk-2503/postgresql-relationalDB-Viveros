DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS zona;

CREATE TABLE zona (
	zona_id INT PRIMARY KEY,
	nombre VARCHAR(50)
);

INSERT INTO zona
VALUES(1, 'ALMACEN');

SELECT *
FROM zona;

CREATE TABLE empleado (
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(50),
	zona_id INT,
	CONSTRAINT fk_zona
	FOREIGN KEY(zona_id)
	REFERENCES zona(zona_id)
);

INSERT INTO empleado
VALUES('12345678Z', 'PEPE', 1);

SELECT *
FROM empleado;
