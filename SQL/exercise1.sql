-- 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).
CREATE TABLE IF NOT EXISTS clients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y mail="juan@example.com".
INSERT INTO public.clients (name, email) 
    VALUES ('Juan', 'juan@example.com');

-- 3. Actualizar el email del cliente con id=1 a "juan@gmail.com".
UPDATE public.clients SET email = 'juan@gmail.com';

-- 4. Eliminar el cliente con id=1 de la tabla "Clientes".
DELETE FROM public.clients WHERE id = 1;

-- 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).
CREATE TABLE IF NOT EXISTS orders(
    id SERIAL PRIMARY KEY,
    id_client INT,
    product VARCHAR(255),
	amount INT,
	CONSTRAINT FK_id_client FOREIGN KEY (id_client) REFERENCES public.clients(id)
);

-- 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.
-- COMENTARIO: Debido a que se ha eliminado el único cliente de la tabla 'clients' en un ejercicio anterior, para que no dé error de clave foránea, se vuelve a insertar el cliente y se actualiza el id a 1.
INSERT INTO public.clients (name, email) 
    VALUES ('Juan', 'juan@example.com');
UPDATE public.clients SET id = 1 WHERE id = 2;
INSERT INTO public.orders (id_client, product, amount) 
    VALUES (1, 'Camiseta', 2);

-- 7. Actualizar la cantidad del pedido con id=1 a 3.
UPDATE public.orders SET amount = 3 WHERE id = 1; 

-- 8. Eliminar el pedido con id=1 de la tabla "Pedidos".
DELETE FROM public.orders WHERE id = 1;

-- 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).
CREATE TABLE IF NOT EXISTS products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
	price DECIMAL
);

-- 10. Insertar varios productos en la tabla "Productos" con diferentes valores.
INSERT INTO public.products (name, price) 
    VALUES ('Casco de bici', 24.40);
INSERT INTO public.products (name, price) 
    VALUES ('Casco de moto', 80.00);
INSERT INTO public.products (name, price) 
    VALUES ('Casco de equitación', 45.98);
INSERT INTO public.products (name, price) 
    VALUES ('Casco de patinaje', 31.00);
INSERT INTO public.products (name, price) 
    VALUES ('Casco de esquí', 95.65);
INSERT INTO public.products (name, price) 
    VALUES ('Casco de juguete', 8.99);

-- 11. Consultar todos los clientes de la tabla "Clientes".
SELECT * FROM public.clients
ORDER BY id ASC;

-- 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.
SELECT 
	o.*, 
	c.name 
FROM public.orders o
LEFT JOIN public.clients c ON o.id_client = c.id
ORDER BY o.id ASC;

-- 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
SELECT *
FROM public.products 
WHERE price > 50;

-- 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.
SELECT *
FROM public.orders 
WHERE amount >= 5;

-- 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".
SELECT * 
FROM public.clients
WHERE name LIKE 'A%';

-- 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.
SELECT 
	c.name, 
	COUNT(o.id) AS total_pedidos 
FROM public.clients c
INNER JOIN public.orders o ON o.id_client = c.id
GROUP BY c.id;

-- 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.
SELECT 
	p.name, 
	COUNT(o.id) AS total_pedidos 
FROM public.products p
INNER JOIN public.orders o ON p.id_order = o.id
GROUP BY p.id;

-- 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
ALTER TABLE public.orders 
    ADD COLUMN date DATE;

-- 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".
ALTER TABLE public.orders 
    ADD COLUMN id_product INT;
ALTER TABLE public.orders 
    ADD CONSTRAINT FK_id_product FOREIGN KEY (id_product) REFERENCES public.products(id);

-- 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.
SELECT 
	c.name, 
	p.name,
	o.amount
FROM public.clients c
LEFT JOIN public.orders o ON o.id_client = c.id
LEFT JOIN public.products p ON p.id = o.id_product;