CREATE DATABASE ventas;
USE ventas;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
 INSERT INTO Clientes (nombre, correo)
VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María García', 'maria.garcia@example.com'),
('Luis López', 'luis.lopez@example.com');

INSERT INTO Ventas (cliente_id, fecha, monto)
VALUES
(1, '2024-01-15', 150.00),
(2, '2024-01-20', 200.00),
(1, '2024-01-22', 100.00),
(3, '2024-02-01', 250.00),
(2, '2024-02-15', 300.00),
(1, '2024-02-20', 150.00);

SELECT clientes.nombre, ventas.fecha, ventas.monto
FROM ventas INNER JOIN clientes on clientes.id = ventas.cliente_id;

SELECT SUM(monto) FROM ventas GROUP BY cliente_id;

SELECT clientes.nombre, AVG(ventas.monto) 
FROM ventas INNER JOIN clientes ON clientes.id = ventas.cliente_id
GROUP BY ventas.cliente_id;

SELECT clientes.nombre, MIN(ventas.monto) as venta_minima, MAX(ventas.monto) as venta_maxima 
FROM ventas INNER JOIN clientes ON clientes.id = ventas.cliente_id
GROUP BY ventas.cliente_id;

-- promedio de clientes que tengan un promedio mayor de 150
SELECT cliente_id, AVG(monto)
FROM ventas
GROUP BY cliente_id
HAVING AVG(monto) > 150;

-- nombre de clientes con al menos 3 ventas
SELECT clientes.nombre, count(*) as numero_ventas
FROM clientes inner join ventas on clientes.id = ventas.cliente_id
GROUP BY ventas.cliente_id
HAVING count(*) >= 3;

SELECT clientes.nombre, ventas.fecha, ventas.monto,
CASE 
	WHEN ventas.monto <= 100 THEN "tiene poco dinero"
    WHEN ventas.monto <= 250 THEN "normal"
    WHEN ventas.monto <= 300 THEN "tiene mucho dinero"
    ELSE "x"
END as tipo_venta
FROM ventas inner join clientes on clientes.id = ventas.cliente_id;

