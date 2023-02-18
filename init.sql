CREATE DATABASE MITIENDITA;
USE MITIENDITA;

CREATE TABLE empleados(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40));

CREATE TABLE checador(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT,
    entrada DATETIME,
    salida DATETIME,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id));

CREATE TABLE productos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40));

CREATE TABLE inventario(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id));

CREATE TABLE ventas(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id));

INSERT INTO empleados (name)
VALUES	('Ian'), ('Yassin'), ('Patricio'), ('Luciano'), ('Delfina'), ('Pelayo'), ('Karina'), ('Irune');

INSERT INTO checador (empleado_id, entrada, salida)
VALUES	(1, '2023-02-18 07:15:00', '2023-02-18 17:46:00'),
        (2, '2023-02-18 08:12:00', '2023-02-18 16:31:00'),
        (3, '2023-02-18 09:01:00', '2023-02-18 17:11:00'),
        (4, '2023-02-18 06:33:00', '2023-02-18 18:55:00'),
        (1, '2023-02-17 08:09:00', '2023-02-17 15:53:00'),
        (1, '2023-02-19 07:23:00', '2023-02-19 16:45:00'),
        (7, '2023-02-18 07:45:00', '2023-02-18 17:02:00'),
        (8, '2023-02-18 08:00:00', '2023-02-18 17:03:00');

INSERT INTO productos (name)
VALUES	('Huevo'), ('Pan'), ('Aceite'), ('Manzana'), ('Naranja'), ('Refresco'), ('Agua'), ('Crema');

INSERT INTO inventario (producto_id, cantidad)
VALUES	(1, 25),
        (2, 30),
        (3, 35),
        (4, 40),
        (5, 45),
        (6, 50),
        (7, 55),
        (8, 60);

INSERT INTO ventas (producto_id, cantidad)
VALUES	(1, 12),
        (2, 16),
        (3, 13),
        (4, 9),
        (4, 2),
        (4, 1),
        (5, 30),
        (6, 15),
        (7, 25),
        (8, 1);

