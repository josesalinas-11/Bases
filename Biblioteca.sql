USE master
GO

CREATE DATABASE [Biblioteca]
GO
--DROP DATABASE [Biblioteca]
USE [Biblioteca]
GO

CREATE TABLE [Persona]
(
	Codigo INT IDENTITY PRIMARY KEY NOT NULL
	,Nombre VARCHAR(50) NOT NULL	
	,PrimerApellido VARCHAR(50) NOT NULL
	,SegundoApellido VARCHAR(50) NULL
	,DNI VARCHAR(15) NOT NULL
	,Direccion VARCHAR(50) NOT NULL
	,Telefono VARCHAR(50) NOT NULL
)
GO


CREATE TABLE [Libro]
(	
	Id INT PRIMARY KEY NOT NULL
	,ISBN VARCHAR(50) NOT NULL
	,Titulo VARCHAR(50) NOT NULL
	,Editorial INT NOT NULL
	,FechaPublicacion DATE NOT NULL
	,Autor INT NOT NULL
	--,Edicion INT NOT NULL
	,Deteriorado BIT NOT NULL DEFAULT(0) 
)
GO

CREATE TABLE [Autor]
(	
	Id INT IDENTITY PRIMARY KEY NOT NULL
	,Nombre VARCHAR(50)
)
GO

CREATE TABLE [Editorial]
(
	Id INT IDENTITY PRIMARY KEY NOT NULL
	,Nombre VARCHAR(50)
)
GO

CREATE TABLE [Edicion]
(
	Id INT IDENTITY PRIMARY KEY NOT NULL
	,Fecha DATE NOT NULL
	,Editorial INT NOT NULL
	,Libro INT NOT NULL
)
GO

CREATE TABLE [AutorLibro]
(
	Id INT IDENTITY PRIMARY KEY NOT NULL
	,Autor INT NOT NULL
	,Libro INT NOT NULL
)
GO


CREATE TABLE [Prestamo]
(
	Id INT PRIMARY KEY NOT NULL
	,Persona INT NOT NULL
	,Libro INT NOT NULL
	,FechaPrestamo DATE NOT NULL
	,FechaDevolucion DATE NOT NULL
	,FechaDevolucionReal DATE NOT NULL
)
GO


ALTER TABLE [Libro] ADD FOREIGN KEY (Editorial) REFERENCES [Editorial](Id)
ALTER TABLE [Edicion] ADD FOREIGN KEY (Libro) REFERENCES [Libro](Id)
ALTER TABLE [Edicion] ADD FOREIGN KEY (Editorial) REFERENCES [Editorial](Id)
ALTER TABLE [AutorLibro] ADD FOREIGN KEY (Libro) REFERENCES [Libro](Id)
ALTER TABLE [AutorLibro] ADD FOREIGN KEY (Autor) REFERENCES [Autor](Id)
ALTER TABLE [Prestamo] ADD FOREIGN KEY (Persona) REFERENCES [Persona](Codigo)
ALTER TABLE [Prestamo] ADD FOREIGN KEY (Libro) REFERENCES [Libro](Id)


