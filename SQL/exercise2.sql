-- Nivel de dificultad: Fácil
-- 1. Crea una base de datos llamada "MiBaseDeDatos".
CREATE DATABASE "mibasededatos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE public."usuarios"
(
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    age integer,
    PRIMARY KEY (id)
);
ALTER TABLE IF EXISTS public."usuarios"
    OWNER to postgres;

-- 3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO mibasededatos.public.usuarios (name, age) VALUES ('Selina', 19);
INSERT INTO mibasededatos.public.usuarios (name, age) VALUES ('Lin', 23);

-- 4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE public.usuarios SET age = 24 WHERE name = 'Lin';

-- 5. Elimina un usuario de la tabla "Usuarios".
DELETE FROM public.usuarios WHERE name = 'Lin';


-- Nivel de dificultad: Moderado
-- 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE public."ciudades"
(
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE IF EXISTS public."ciudades"
    OWNER to postgres;

-- 2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO mibasededatos.public.ciudades (name, country) VALUES ('Roma', 'Italia');
INSERT INTO mibasededatos.public.ciudades (name, country) VALUES ('Lisboa', 'Portugal');
INSERT INTO mibasededatos.public.ciudades (name, country) VALUES ('Dublín', 'Irlanda');

-- 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".
ALTER TABLE public.usuarios 
    ADD COLUMN id_ciudad INT;
ALTER TABLE public.usuarios 
    ADD CONSTRAINT FK_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id);

-- 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).
SELECT 
	usuarios.name,
	ciudades.name,
	ciudades.country
FROM usuarios 
LEFT JOIN ciudades ON ciudades.id = usuarios.id_ciudad
ORDER BY usuarios.id;

-- 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
SELECT 
	usuarios.name,
	ciudades.name,
	ciudades.country
FROM usuarios 
INNER JOIN ciudades ON ciudades.id = usuarios.id_ciudad
WHERE ciudades.name IS NOT NULL
ORDER BY usuarios.id;