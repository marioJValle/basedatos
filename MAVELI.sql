CREATE DATABASE MAVELI
USE MAVELI
SELECT '------------CREANDO LA TABLA USUARIOS DE VEHICULOS------------';

Create Table Usuario_Vehi (
Id_User Int not null auto_increment Primary Key, -- Restriccion llave primaria, autoincrementada
Nombre1 Varchar (50) not null,
Nombre2 Varchar (50) null,
Apellido1 Varchar (50) not null,
Apellido2 Varchar (50) null,
Email Varchar (80) not null,
Num_celular int

);
SELECT '------------SE CREO LA TABLA USUARIOS DE VEHICULOS------------';

SELECT '------------CREANDO LA TABLA AFILIADOS------------';
CREATE TABLE Afiliados(
Id_Negocio Int not null auto_increment Primary Key , -- Restriccion llave primaria, autoincrementada
Nombre_Negocio Varchar (80) not null,
Nombre_Propiet Varchar (80) not null,
Num_cel_negoc Int not null,
Email_negocio Varchar (80) not null,
Direccion Varchar (100) not null

);
SELECT '------------SE CREO LA TABLA AFILIADO------------';

SELECT '------------CREANDO LA TABLA SERVICIOS------------';
CREATE TABLE SERVICIOS (
Id_Servicios Int not null auto_increment Primary Key, -- Restriccion llave primaria, autoincrementada
NombreServ Varchar (100) not null,
Id_User Int not null,
FOREIGN KEY (Id_User) REFERENCES Usuario_Vehi (Id_User), -- Crea relacion (restriccion) con tabla Usuario de Vehiculos
Id_Negocio Int not null,
FOREIGN KEY (Id_Negocio) REFERENCES Afiliados (Id_Negocio) -- Crea relacion (restriccion) con tabla Afiliados
);
SELECT '------------SE CREO LA TABLA SERVICIOS------------';

SELECT'------------INSERTANDO LOS REGISTROS...------------';

SELECT'INSERTANDO LOS RESGISTROS EN TABLA USUARIO DE VEHICULO';
INSERT INTO Usuario_Vehi (Nombre1 , Nombre2 , Apellido1, Apellido2, Email, Num_Celular)
VALUES ('Juan' , 'Andres', 'Gaitan', 'Perez', 'juanG@gmail.com', 77891256);
INSERT INTO Usuario_Vehi (Nombre1 , Nombre2 , Apellido1, Apellido2, Email, Num_Celular)
VALUES ('Pedro', 'Fernando','Arauz','Martinez' , 'pedroFer@hotmail.com', 88907612);

SELECT'------------REGISTROS INSERTADOS------------';

SELECT * FROM Usuario_Vehi;
Select 'SE ESTAN MOSTRANDO LOS DATOS';