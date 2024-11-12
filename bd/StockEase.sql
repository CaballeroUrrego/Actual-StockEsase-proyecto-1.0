-- Crear la base de datos StockEase
CREATE DATABASE StockEase; -- Se crea una nueva base de datos llamada StockEase
GO

USE StockEase; -- Cambiar el contexto a la base de datos StockEase
GO

-- Tabla de Roles: Almacena los diferentes roles de usuario
CREATE TABLE Roles (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada rol, se incrementa autom�ticamente
    nombre NVARCHAR(50) NOT NULL -- Nombre del rol (Gerente, Encargado de almac�n)
);

-- Tabla de Usuarios: Almacena informaci�n sobre los usuarios del sistema
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada usuario, se incrementa autom�ticamente
    nombre NVARCHAR(100) NOT NULL, -- Nombre del usuario
    rol_id INT NOT NULL FOREIGN KEY REFERENCES Roles(id), -- Referencia al rol del usuario (relaci�n con la tabla Roles)
    email NVARCHAR(100) NOT NULL UNIQUE, -- Correo electr�nico del usuario, debe ser �nico
    contrase�a NVARCHAR(100) NOT NULL -- Contrase�a del usuario
);

-- Tabla de Productos: Almacena informaci�n sobre los productos disponibles
CREATE TABLE Productos (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada producto
    nombre NVARCHAR(100) NOT NULL, -- Nombre del producto
    descripcion NVARCHAR(255), -- Descripci�n del producto
    precio DECIMAL(10, 2) NOT NULL, -- Precio del producto con dos decimales
    categoria NVARCHAR(50) -- Categor�a a la que pertenece el producto
);

-- Tabla de Referencia: Almacena informaci�n sobre el inventario de productos
CREATE TABLE Referencia (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada registro de inventario
    producto_id INT NOT NULL FOREIGN KEY REFERENCES Productos(id), -- Referencia al producto (relaci�n con la tabla Productos)
    cantidad INT NOT NULL, -- Cantidad disponible en inventario
    ubicacion NVARCHAR(100), -- Ubicaci�n del producto en el almac�n
    tipo NVARCHAR(50) -- Tipo de acuerdo con la orden de compra o venta
);

-- Tabla de Ordenes de Compra: Almacena informaci�n sobre las �rdenes de compra
CREATE TABLE OrdenesCompra (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada orden de compra
    usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuarios(id), -- Referencia al usuario que realiz� la orden (relaci�n con la tabla Usuarios)
    fecha DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de la orden, por defecto se establece la fecha actual
    estado NVARCHAR(50) NOT NULL -- Estado de la orden (Pendiente, Completada)
);

-- Tabla de Detalle de Orden de Compra: Almacena los detalles de cada orden de compra
CREATE TABLE DetalleOrdenCompra (
    id INT PRIMARY KEY IDENTITY, -- Identificador �nico para cada detalle de orden
    orden_compra_id INT NOT NULL FOREIGN KEY REFERENCES OrdenesCompra(id), -- Referencia a la orden de compra (relaci�n con la tabla OrdenesCompra)
    producto_id INT NOT NULL FOREIGN KEY REFERENCES Productos(id), -- Referencia al producto (relaci�n con la tabla Productos)
    cantidad INT NOT NULL, -- Cantidad del producto en la orden
    precio_unitario DECIMAL(10, 2) NOT NULL -- Precio unitario del producto en la orden
);

-- Insertar datos en la tabla Roles
INSERT INTO Roles (nombre)
VALUES 
('Gerente'), -- Rol para el gerente
('Encargado de almac�n'); -- Rol para el encargado de almac�n

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, rol_id, email, contrase�a)
VALUES 
('Juan P�rez', 1, 'juan.perez@empresa.com', 'password123'), -- Juan P�rez es un Gerente
('Ana G�mez', 2, 'ana.gomez@empresa.com', 'password456'); -- Ana G�mez es la Encargada de almac�n

-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombre, descripcion, precio, categoria)
VALUES 
('Laptop', 'Laptop de 15 pulgadas', 1200.00, 'Electr�nica'), -- Producto: Laptop
('Mouse', 'Mouse inal�mbrico', 25.00, 'Accesorios'); -- Producto: Mouse

-- Insertar datos en la tabla Referencia
INSERT INTO Referencia (producto_id, cantidad, ubicacion, tipo)
VALUES 
(1, 50, 'Almac�n A', 'Compra'), -- 50 Laptops en Almac�n A (tipo: Compra)
(2, 200, 'Almac�n B', 'Compra'); -- 200 Mouse en Almac�n B (tipo: Compra)

-- Insertar datos en la tabla Roles
INSERT INTO Roles (nombre)
VALUES 
('Gerente'), -- Rol para el gerente
('Encargado de almac�n'), -- Rol para el encargado de almac�n
('Proveedores'); -- Nuevo rol para los proveedores

 select * from Roles

 DELETE FROM Roles WHERE id = 4;

 
