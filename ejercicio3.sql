-- Nivel de dificultad: Difícil

-- 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE Productos2(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
)

-- 2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO public.productos2(id, nombre, precio)
VALUES
(1, 'Camisetas', 50),
(2, 'Chaquetas', 30),
(3, 'Pantalones', 25),
(4, 'Zapatillas', 70),
(5, 'Gorras', 20)

-- 3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE public.productos2
SET precio = 55
WHERE id = 1

-- 4. Elimina un producto de la tabla "Productos".
DELETE FROM public.productos2
WHERE id = 5

-- 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").
SELECT Usuarios.nombre_usuario, Productos.nombre_producto
FROM Usuarios
INNER JOIN Compras ON Usuarios.id_usuario = Compras.id_usuario
INNER JOIN Productos ON Compras.id_producto = Productos.id_producto;