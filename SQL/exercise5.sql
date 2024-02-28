-- 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).
CREATE TABLE IF NOT EXISTS clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".
INSERT INTO mibasededatos.public.clientes (nombre) VALUES ('John');

-- 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".
UPDATE mibasededatos.public.clientes SET nombre = 'John Doe' WHERE id = 1;

-- 4. Elimina el cliente con id=1 de la tabla "Clientes".
DELETE FROM mibasededatos.public.clientes WHERE id = 1;

-- 5. Lee todos los clientes de la tabla "Clientes".
SELECT * FROM public.clientes
ORDER BY id ASC;

-- 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).
-- COMENTARIO: creo la tabla pedidos2 ya que la tabla pedidos ya existe del ejercicio anterior.
CREATE TABLE IF NOT EXISTS pedidos2(
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL
);

-- 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".
INSERT INTO public.pedidos2 (cliente_id) VALUES (1);

-- 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".
UPDATE public.pedidos2 SET cliente_id = 2 WHERE id = 1;

-- 9. Elimina el pedido con id=1 de la tabla "Pedidos".
DELETE FROM public.pedidos2 WHERE id = 1;

-- 10. Lee todos los pedidos de la tabla "Pedidos".
SELECT * FROM public.pedidos2
ORDER BY id ASC;

-- 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).
-- COMENTARIO: creo la tabla productos2 ya que la tabla productos ya existe del ejercicio anterior.
CREATE TABLE IF NOT EXISTS productos2(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".
INSERT INTO public.productos2 (nombre) VALUES ('Camisa');

-- 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".
UPDATE public.productos2 SET nombre = 'Pantalón' WHERE id = 1;

-- 14. Elimina el producto con id=1 de la tabla "Productos".
DELETE FROM public.productos2 WHERE id = 1;

-- 15. Lee todos los productos de la tabla "Productos".
SELECT * FROM public.productos2
ORDER BY id ASC;

-- 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).
CREATE TABLE IF NOT EXISTS detalles_pedido(
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL, 
    producto_id INT NOT NULL
);

-- 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".
INSERT INTO public.detalles_pedido (pedido_id, producto_id) VALUES (1,1);

-- 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".
UPDATE public.detalles_pedido SET producto_id = 2 WHERE pedido_id = 1;

-- 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".
DELETE FROM public.detalles_pedido WHERE pedido_id = 1;

-- 20. Lee todos los detalles de pedido de la tabla "DetallesPedido".
SELECT * FROM public.detalles_pedido
ORDER BY id ASC;

-- 21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.
SELECT * 
FROM public.clientes
INNER JOIN public.pedidos2 ON clientes.id = pedidos2.cliente_id
ORDER BY public.clientes.id ASC;

-- 22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.
SELECT * 
FROM public.clientes
LEFT JOIN public.pedidos2 ON clientes.id = pedidos2.cliente_id
ORDER BY public.clientes.id ASC;

-- 23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.
SELECT * 
FROM public.productos2
INNER JOIN public.detalles_pedido ON productos2.id = detalles_pedido.producto_id
ORDER BY public.productos2.id ASC;

-- 24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.
SELECT * 
FROM public.productos2
LEFT JOIN public.detalles_pedido ON productos2.id = detalles_pedido.producto_id
ORDER BY public.productos2.id ASC;

-- 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".
ALTER TABLE public.clientes 
    ADD COLUMN telefono VARCHAR(100);

-- 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.
ALTER TABLE public.clientes 
    ALTER COLUMN telefono SET DATA TYPE INT
	USING telefono::integer;

-- 27. Elimina la columna "telefono" de la tabla "Clientes".
ALTER TABLE public.clientes 
    DROP COLUMN telefono;


-- 28. Cambia el nombre de la tabla "Clientes" a "Usuarios".
ALTER TABLE public.clientes RENAME TO usuarios2;

-- 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".
ALTER TABLE usuarios2 
    RENAME COLUMN nombre TO nombre_completo;

-- 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios"
ALTER TABLE public.usuarios2
    ADD CONSTRAINT usuarios2_pk PRIMARY KEY (id);
-- COMENTARIO: ERROR:  no se permiten múltiples llaves primarias para la tabla «usuarios2» 