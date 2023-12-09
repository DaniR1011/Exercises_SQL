-- Nivel de dificultad: Experto

-- 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
CREATE TABLE Pedidos(
	id INT PRIMARY KEY,
	id_usuario INT,
	id_producto INT,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (is_producto) REFERENCES Productos(id_producto)
)

-- 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.
INSERT INTO public.pedidos(id, id_usuario, id_producto)
VALUES
(1,1,2),
(2,2,3),
(3,3,1)

-- 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).
SELECT Usuarios.nombre_usuario, COALESCE(Productos.nombre_producto, 'Sin pedido') AS nombre_producto
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.id_usuario = Pedidos.id_usuario
LEFT JOIN Productos ON Pedidos.id_producto = Productos.id_producto;

-- 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).
SELECT Usuarios.nombre_usuario
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.id_usuario = Pedidos.id_usuario
WHERE Pedidos.id IS NOT NULL OR Pedidos.id IS NULL;

-- 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
ALTER TABLE Pedidos
ADD COLUMN cantidad INT

UPDATE Pedidos
SET cantidad = 5