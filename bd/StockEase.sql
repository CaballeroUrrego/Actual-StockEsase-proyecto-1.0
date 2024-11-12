-- Crear la base de datos StockEase
CREATE DATABASE StockEase; -- Se crea una nueva base de datos llamada StockEase
GO

USE StockEase; -- Cambiar el contexto a la base de datos StockEase
GO

-- Tabla de Roles: Almacena los diferentes roles de usuario
CREATE TABLE Roles (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada rol, se incrementa automáticamente
    nombre NVARCHAR(50) NOT NULL -- Nombre del rol (Gerente, Encargado de almacén)
);

-- Tabla de Usuarios: Almacena información sobre los usuarios del sistema
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada usuario, se incrementa automáticamente
    nombre NVARCHAR(100) NOT NULL, -- Nombre del usuario
    rol_id INT NOT NULL FOREIGN KEY REFERENCES Roles(id), -- Referencia al rol del usuario (relación con la tabla Roles)
    email NVARCHAR(100) NOT NULL UNIQUE, -- Correo electrónico del usuario, debe ser único
    contraseña NVARCHAR(100) NOT NULL -- Contraseña del usuario
);

-- Tabla de Productos: Almacena información sobre los productos disponibles
CREATE TABLE Productos (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada producto
    nombre NVARCHAR(100) NOT NULL, -- Nombre del producto
    descripcion NVARCHAR(255), -- Descripción del producto
    precio DECIMAL(10, 2) NOT NULL, -- Precio del producto con dos decimales
    categoria NVARCHAR(50) -- Categoría a la que pertenece el producto
);

-- Tabla de Referencia: Almacena información sobre el inventario de productos
CREATE TABLE Referencia (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada registro de inventario
    producto_id INT NOT NULL FOREIGN KEY REFERENCES Productos(id), -- Referencia al producto (relación con la tabla Productos)
    cantidad INT NOT NULL, -- Cantidad disponible en inventario
    ubicacion NVARCHAR(100), -- Ubicación del producto en el almacén
    tipo NVARCHAR(50) -- Tipo de acuerdo con la orden de compra o venta
);

-- Tabla de Ordenes de Compra: Almacena información sobre las órdenes de compra
CREATE TABLE OrdenesCompra (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada orden de compra
    usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuarios(id), -- Referencia al usuario que realizó la orden (relación con la tabla Usuarios)
    fecha DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de la orden, por defecto se establece la fecha actual
    estado NVARCHAR(50) NOT NULL -- Estado de la orden (Pendiente, Completada)
);

-- Tabla de Detalle de Orden de Compra: Almacena los detalles de cada orden de compra
CREATE TABLE DetalleOrdenCompra (
    id INT PRIMARY KEY IDENTITY, -- Identificador único para cada detalle de orden
    orden_compra_id INT NOT NULL FOREIGN KEY REFERENCES OrdenesCompra(id), -- Referencia a la orden de compra (relación con la tabla OrdenesCompra)
    producto_id INT NOT NULL FOREIGN KEY REFERENCES Productos(id), -- Referencia al producto (relación con la tabla Productos)
    cantidad INT NOT NULL, -- Cantidad del producto en la orden
    precio_unitario DECIMAL(10, 2) NOT NULL -- Precio unitario del producto en la orden
);

-- Insertar datos en la tabla Roles
INSERT INTO Roles (nombre)
VALUES 
('Gerente'), -- Rol para el gerente
('Encargado de almacén'); -- Rol para el encargado de almacén

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, rol_id, email, contraseña)
VALUES 
('Juan Pérez', 1, 'juan.perez@empresa.com', 'password123'), -- Juan Pérez es un Gerente
('Ana Gómez', 2, 'ana.gomez@empresa.com', 'password456'); -- Ana Gómez es la Encargada de almacén

-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombre, descripcion, precio, categoria)
VALUES 
('Laptop', 'Laptop de 15 pulgadas', 1200.00, 'Electrónica'), -- Producto: Laptop
('Mouse', 'Mouse inalámbrico', 25.00, 'Accesorios'); -- Producto: Mouse

-- Insertar datos en la tabla Referencia
INSERT INTO Referencia (producto_id, cantidad, ubicacion, tipo)
VALUES 
(1, 50, 'Almacén A', 'Compra'), -- 50 Laptops en Almacén A (tipo: Compra)
(2, 200, 'Almacén B', 'Compra'); -- 200 Mouse en Almacén B (tipo: Compra)

-- Insertar datos en la tabla Roles
INSERT INTO Roles (nombre)
VALUES 
('Gerente'), -- Rol para el gerente
('Encargado de almacén'), -- Rol para el encargado de almacén
('Proveedores'); -- Nuevo rol para los proveedores

 select * from Roles

 DELETE FROM Roles WHERE id = 4;

 
