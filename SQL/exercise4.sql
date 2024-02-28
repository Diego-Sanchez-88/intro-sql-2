-- Nivel de dificultad: Experto
-- 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
CREATE TABLE IF NOT EXISTS pedidos(
    id SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id),
    CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id)
);

-- 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.
INSERT INTO mibasededatos.public.pedidos (id_usuario, id_producto) VALUES (1, 3);
INSERT INTO mibasededatos.public.pedidos (id_usuario, id_producto) VALUES (4, 1);
INSERT INTO mibasededatos.public.pedidos (id_usuario, id_producto) VALUES (4, 5);
INSERT INTO mibasededatos.public.pedidos (id_usuario, id_producto) VALUES (3, 2);
INSERT INTO mibasededatos.public.pedidos (id_usuario, id_producto) VALUES (5, 1);

-- 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).
SELECT 
	usuarios.name,
	productos.nombre
FROM usuarios 
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario
LEFT JOIN productos ON pedidos.id_producto = productos.id;

-- 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).
SELECT 
	usuarios.name
FROM usuarios 
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario;

-- 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
ALTER TABLE public.pedidos 
    ADD COLUMN cantidad INT;
UPDATE pedidos SET cantidad = 3 WHERE id_usuario = 1;
UPDATE pedidos SET cantidad = 1 WHERE id_usuario = 4;
UPDATE pedidos SET cantidad = 10 WHERE id_usuario = 3;
UPDATE pedidos SET cantidad = 4 WHERE id_usuario = 5;