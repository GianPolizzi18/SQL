CREATE TABLE Documentos(
cod_documento INT PRIMARY KEY,
descripcion VARCHAR (40)
);

INSERT INTO Documentos (cod_documento, descripcion) VALUES
(1, 'DNI'),
(2, 'Pasaporte'),
(3, 'CUIL');



CREATE TABLE Oficinas(
cod_oficina INT PRIMARY KEY,
codigo_director INT,
descripcion VARCHAR (40)
);

INSERT INTO Oficinas (cod_oficina, codigo_director, descripcion) VALUES
(1, NULL, 'Oficina Central'),
(2, 1002, 'Sucursal Norte'),
(3, 1003, 'Sucursal Sur');


CREATE TABLE Empleados(
cod_empleado INT PRIMARY KEY,
apellido VARCHAR (40),
nombre VARCHAR (40),
fecha_nacimiento DATE,
num_doc INT,
cod_jefe INT,
cod_oficina INT,
cod_documento INT,
FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleado),
FOREIGN KEY (cod_oficina) REFERENCES Oficinas(cod_oficina),
FOREIGN KEY (cod_documento) REFERENCES Documentos(cod_documento)
);

INSERT INTO Empleados (cod_empleado, apellido, nombre, fecha_nacimiento, num_doc, cod_jefe, cod_oficina, cod_documento) VALUES
(1001, 'Gomez', 'Maria', '1986-06-29', '29630778', NULL, 1, 1),
(1002, 'García', 'Juan', '1978-07-21', '23665871', 1001, 2, 2),
(1003, 'Rodríguez', 'Roberto', '1990-11-30', '31543851', 1001, 3, 1);


CREATE TABLE Datos_contratos(
cod_empleado INT,
fecha_contrato DATE,
cuota INT,
ventas INT,
PRIMARY KEY(cod_empleado,fecha_contrato),
FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado)
);

INSERT INTO Datos_contratos (cod_empleado, fecha_contrato, cuota, ventas) VALUES
(1001, '2012-03-18', 60000, 75000),
(1002, '2014-04-16', 45000, 50000),
(1003, '2020-05-06', 30000, 31000);



CREATE TABLE Fabricantes(
cod_fabricante INT PRIMARY KEY,
razon_social VARCHAR (40)
);

INSERT INTO Fabricantes (cod_fabricante, razon_social) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Motorola');



CREATE TABLE Listas(
cod_lista INT PRIMARY KEY,
descripcion VARCHAR (50),
ganancia INT
);

INSERT INTO Listas (cod_lista, descripcion, ganancia) VALUES
(1, 'Mayorista', 30),
(2, 'Minorista', 50);



CREATE TABLE Productos(
cod_producto INT PRIMARY KEY,
descripcion VARCHAR (50),
precio INT,
cantidad_stock INT,
punto_reposicion INT,
cod_fabricante INT,
FOREIGN KEY (cod_fabricante) REFERENCES Fabricantes(cod_fabricante)
);

INSERT INTO Productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) VALUES
(101, 'S25+ 512gb', 1600000, 10, 5, 1),
(102, 'Iphone 15 Pro 256gb', 800000, 3, 10, 2),
(103, 'Monitor 24 144Hz', 250000, 7, 5, 1),
(104, 'Motorola Razr 60 Ultra', 1100000, 2, 4, 3);



CREATE TABLE Precios(
cod_producto INT,
cod_lista INT,
precio INT,
PRIMARY KEY(cod_producto,cod_lista),
FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto),
FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);

INSERT INTO Precios (cod_producto, cod_lista, precio) VALUES
(101, 1, 2080000),
(102, 1, 1040000),
(103, 1, 325000),
(104, 1, 1430000),
(101, 2, 2400000),
(102, 2, 1200000);



CREATE TABLE Clientes(
cod_cliente INT PRIMARY KEY,
cod_lista INT,
razon_social VARCHAR (50),
FOREIGN KEY (cod_lista) REFERENCES Listas(cod_lista)
);

INSERT INTO Clientes (cod_cliente, cod_lista, razon_social) VALUES
(1, 1, 'Fravega'),
(2, 2, 'CompuCel'),
(3, 1, 'Tecno Compro');
INSERT INTO clientes (cod_cliente, cod_lista, razon_social) VALUES 
(4, 2, 'Lenovo');



CREATE TABLE Pedidos(
cod_pedido INT PRIMARY KEY,
fecha_pedido DATE,
cod_empleado INT,
cod_cliente INT,
FOREIGN KEY (cod_empleado) REFERENCES Empleados (cod_empleado),
FOREIGN KEY (cod_cliente) REFERENCES Clientes (cod_cliente)
);

INSERT INTO Pedidos (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) VALUES
(1, '2025-03-10', 1002, 1),
(2, '2025-04-05', 1003, 2),
(3, '2025-04-15', 1001, 3);



CREATE TABLE Detalle_pedidos(
cod_pedido INT,
numero_linea INT,
cod_producto INT,
cantidad INT,
PRIMARY KEY (cod_pedido,numero_linea),
FOREIGN KEY (cod_pedido) REFERENCES Pedidos (cod_pedido),
FOREIGN KEY (cod_producto) REFERENCES Productos (cod_producto)
);

INSERT INTO Detalle_pedidos (cod_pedido, numero_linea, cod_producto, cantidad) VALUES
(1, 1, 101, 5),
(1, 2, 102, 2),
(2, 1, 103, 1),
(3, 1, 104, 1),
(3, 2, 102, 10);

USE tp2bada;
/*Consultas Simples*/
/* 1)              */
SELECT O.descripcion AS Oficinas
FROM Oficinas O;

/* 2)              */
SELECT P.descripcion,P.precio,P.precio*1.21 AS Precio_con_IVA
FROM Productos P;


/* 3)              */
SELECT 
E.nombre,
E.apellido,
E.fecha_nacimiento,
YEAR(CURDATE()) - YEAR(E.fecha_nacimiento) AS Edad
FROM Empleados E;


/* 4)              */
SELECT * 
FROM Empleados 
WHERE cod_jefe IS NOT NULL;


/* 5)              */
SELECT * 
FROM Empleados 
WHERE nombre LIKE "Maria" ORDER BY apellido;

/* 6)              */
SELECT *
FROM clientes C
WHERE C.razon_social LIKE "L%" ORDER BY cod_cliente;


/* 7)              */
SELECT *
FROM pedidos PE
WHERE MONTH(PE.fecha_pedido) = 3 ORDER BY PE.fecha_pedido;


/* 8)              */
SELECT O.descripcion AS "Oficinas sin Director"
FROM oficinas O
WHERE O.codigo_director IS NULL;


/* 9)              */
SELECT *
FROM Productos
ORDER BY precio ASC LIMIT 4;


/* 10)              */
SELECT DC.cod_empleado
FROM datos_contratos DC
ORDER BY DC.cuota DESC LIMIT 3;


/*Consultas Multitablas*/
/* 1)              */
SELECT P.descripcion AS Producto, F.razon_social AS Fabricante, P.cantidad_stock
FROM productos P, fabricantes F
WHERE P.cod_fabricante = F.cod_fabricante
ORDER BY F.razon_social AND P.descripcion;


/* 2)              */
SELECT PE.cod_pedido, PE.fecha_pedido, E.apellido AS Empleado, C.razon_social AS Cliente 
FROM pedidos PE, empleados E, clientes C
WHERE PE.cod_empleado = E.cod_empleado
AND PE.cod_cliente = C.cod_cliente;


/* 3)              */
SELECT E.apellido AS Empleado, DC.cuota, O.descripcion AS Oficina
FROM empleados E, datos_contratos DC, oficinas O
WHERE E.cod_empleado = DC.cod_empleado
AND E.cod_oficina = O.cod_oficina
ORDER BY DC.cuota DESC;


/* 4)              */
SELECT DISTINCT C.razon_social AS "Clientes Abril"
FROM clientes C, pedidos PE
WHERE C.cod_cliente = PE.cod_cliente
AND MONTH (PE.fecha_pedido) = 4;


/* 5)              */
SELECT DISTINCT P.descripcion AS "Productos Marzo"
FROM productos P, detalle_pedidos DP, pedidos PE
WHERE P.cod_producto = DP.cod_producto
AND DP.cod_pedido = PE.cod_pedido
AND MONTH (PE.fecha_pedido) = 3;


/* 6)              */
SELECT E.cod_empleado, E.nombre, E.apellido, DC.fecha_contrato,
YEAR (CURDATE()) - YEAR (DC.fecha_contrato) AS Años_Contratado
FROM empleados E, datos_contratos DC
WHERE E.cod_empleado = DC.cod_empleado
AND YEAR (CURDATE()) - YEAR (DC.fecha_contrato) > 10
ORDER BY Años_Contratado DESC;


/* 7)              */
SELECT C.razon_social AS "Clientes Mayoristas"
FROM clientes C, listas L
WHERE C.cod_lista = L.cod_lista
AND C.cod_lista = 1
ORDER BY C.razon_social;


/* 8)              */
SELECT DISTINCT P.descripcion AS Producto, C.razon_social AS Cliente
FROM productos P, clientes C, pedidos PE, detalle_pedidos DP
WHERE C.cod_cliente = PE.cod_cliente
AND PE.cod_pedido = DP.cod_pedido
AND P.cod_producto = DP.cod_producto
ORDER BY C.razon_social, P.descripcion;


/* 9)              */
SELECT P.descripcion, F.razon_social,(P.punto_reposicion - P.cantidad_stock) AS Comprar
FROM productos P, fabricantes F
WHERE P.cod_fabricante = F.cod_fabricante
AND P.punto_reposicion > P.cantidad_stock
ORDER BY F.razon_social, P.descripcion;


/* 10)              */
SELECT E.cod_empleado, E.nombre, E.nombre, DC.cuota
FROM empleados E, datos_contratos DC
WHERE E.cod_empleado = DC.cod_empleado
AND (DC.cuota < 50000 OR DC.cuota > 100000);
