-- Nivel de dificultad: Difícil
-- Ejercicios 3
-- 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE IF NOT EXISTS productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
	precio INT
);

-- 2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO mibasededatos.public.productos (nombre, precio) VALUES ('Guantes', 30);
INSERT INTO mibasededatos.public.productos (nombre, precio) VALUES ('Calcetines', 15);
INSERT INTO mibasededatos.public.productos (nombre, precio) VALUES ('Gorros', 8);
INSERT INTO mibasededatos.public.productos (nombre, precio) VALUES ('Bufandas', 23);
INSERT INTO mibasededatos.public.productos (nombre, precio) VALUES ('Orejeras', 40);

-- 3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE public.productos SET precio = 24 WHERE nombre = 'Bufandas';

-- 4. Elimina un producto de la tabla "Productos".
DELETE FROM public.productos WHERE nombre = 'Bufandas';

-- 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").
SELECT 
	usuarios.name,
	productos.nombre
FROM usuarios 
INNER JOIN productos ON productos.id = usuarios.id_producto
ORDER BY usuarios.id;
