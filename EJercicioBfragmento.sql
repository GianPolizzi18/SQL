CREATE TABLE CLIENTES (
cod_cliente INT PRIMARY KEY,
nombre VARCHAR (50),
domicilio VARCHAR (50),
provincia VARCHAR (50)
);

INSERT INTO CLIENTES VALUES (1, 'Juan Pérez', 'Av. MItre 123', 'Córdoba');
INSERT INTO CLIENTES VALUES (2, 'Ana López', 'Av. Callao 456', 'Buenos Aires');
INSERT INTO CLIENTES VALUES (3, 'Carlos Gómez', 'Av. Belgrano 789', 'Santa Fe');


CREATE TABLE PRODUCTOS (
cod_producto INT PRIMARY KEY,
nombre_producto VARCHAR (50)
);

INSERT INTO PRODUCTOS VALUES (100, 'Teclado');
INSERT INTO PRODUCTOS VALUES (101, 'Mouse');
INSERT INTO PRODUCTOS VALUES (102, 'Monitor');
INSERT INTO PRODUCTOS VALUES (103, 'Auriculares');
INSERT INTO PRODUCTOS VALUES (104, 'Webcam');


CREATE TABLE VENTAS (
num_factura INT PRIMARY KEY,
cod_cliente INT,
fecha DATE,
FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
);

INSERT INTO VENTAS VALUES (2000, 1, '2024-05-01');
INSERT INTO VENTAS VALUES (2001, 1, '2024-05-05');
INSERT INTO VENTAS VALUES (2002, 2, '2024-05-03');
INSERT INTO VENTAS VALUES (2003, 3, '2024-05-10');


CREATE TABLE ITEM_VENTAS (
num_factura INT,
cod_producto INT,
cantidad INT,
precio INT,
PRIMARY KEY (num_factura, cod_producto),
FOREIGN KEY (num_factura) REFERENCES ventas(num_factura),
FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto)
);

INSERT INTO ITEM_VENTAS VALUES (2000, 100, 10, 3000); 
INSERT INTO ITEM_VENTAS VALUES (2000, 101, 5, 1500); 
INSERT INTO ITEM_VENTAS VALUES (2001, 100, 25, 2800); 
INSERT INTO ITEM_VENTAS VALUES (2001, 102, 15, 20000);
INSERT INTO ITEM_VENTAS VALUES (2002, 103, 35, 5000); 
INSERT INTO ITEM_VENTAS VALUES (2003, 100, 5, 3200); 
INSERT INTO ITEM_VENTAS VALUES (2003, 104, 20, 8000);



/*1)                */
SELECT IV.cantidad AS max_unidades, P.nombre_producto
FROM item_ventas IV, productos P
WHERE IV.cod_producto=P.cod_producto;

/*2)                */
SELECT SUM(cantidad) AS total_vendido
FROM item_ventas IV
WHERE IV.cod_producto = 102;
