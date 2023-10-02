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
Contra varchar (20) not null,
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
Contra varchar (30) not null,
Direccion Varchar (100) not null
);
SELECT '------------CREANDO LA TABLA SERVICIOS------------';

SELECT '------------SE ESTA CREANDO LA TABLA AUTOMOVIL------------';
CREATE TABLE AUTOMOVIL(
Id_Auto Int not null auto_increment Primary Key, -- Restriccion llave primaria, autoincrementada
Modelo Varchar (50) not null,
Marca Varchar (20) not null,
Anios Int, 
Regis_Gastos Float,
Id_User Int,
FOREIGN KEY (Id_User) REFERENCES Usuario_Vehi (Id_User) -- Crea relacion (restriccion) con tabla Usuario_Vehi
);
SELECT '------------SE CREO LA TABLA AUTOMOVIL------------';

SELECT '------------SE CREO LA TABLA AFILIADO------------';

CREATE TABLE SERVICIOS (
Id_Servicios Int not null auto_increment Primary Key, -- Restriccion llave primaria, autoincrementada
NombreServ Varchar (100) not null,
Id_User Int not null,
FOREIGN KEY (Id_User) REFERENCES Usuario_Vehi (Id_User), -- Crea relacion (restriccion) con tabla Usuario de Vehiculos
Id_Negocio Int not null,
FOREIGN KEY (Id_Negocio) REFERENCES Afiliados (Id_Negocio) -- Crea relacion (restriccion) con tabla Afiliados
);
SELECT '------------SE CREO LA TABLA SERVICIOS------------';

SELECT '------------CREANDO TABLA REGISTRO DE GASTOS------------';

CREATE TABLE REGIST_GASTOS(
Id_Gasto Int not null auto_increment Primary Key, -- Restriccion llave primaria, autoincrementada
Cambio_Pieza float,
Cambio_Aceit float,
FiltrAire float,
CambioLlanta float,
Alineacion float,
CambioBat float,
CambioLiquido_frenos FLoat,
CambioCorrea float,
Id_Auto int,
FOREIGN KEY (Id_Auto) REFERENCES AUTOMOVIL (Id_Auto) -- Crea relacion (restriccion) con tabla Afiliados
);
SELECT '------------SE ESTA CREANDO UN ALTER TABLE PARA LA TABLA SERVICIOS';
ALTER TABLE SERVICIOS ADD(
Fecha DATE,
Descripcion Varchar (100),
Costo Float,
Id_Auto Int,
FOREIGN KEY (Id_Auto) REFERENCES AUTOMOVIL (Id_Auto) -- Crea relacion (restriccion) con tabla SERVICIOS
);

CREATE TABLE Usuario_Servicios(
Id_User int,
Id_Servicios int,
FOREIGN KEY (Id_Servicios) REFERENCES SERVICIOS (Id_Servicios), 
FOREIGN KEY (Id_User) REFERENCES Usuario_Vehi (Id_User) 
);
CREATE TABLE Servicios_Afiliados(
Id_Servicios int,
FOREIGN KEY (Id_Servicios) REFERENCES SERVICIOS (Id_Servicios), 
Id_Negocio int,
FOREIGN KEY (Id_Negocio) REFERENCES Afiliados (Id_Negocio) 
);
SELECT '------------ SE CREO LA ALTERACION DE LA TABLA SERVICIOS';

ALTER TABLE SERVICIOS DROP foreign key servicios_ibfk_3;
ALTER TABLE SERVICIOS DROP COLUMN Id_Auto;
ALTER TABLE SERVICIOS DROP foreign key servicios_ibfk_1;
ALTER TABLE SERVICIOS DROP COLUMN Id_User;
ALTER TABLE SERVICIOS DROP FOREIGN KEY servicios_ibfk_2;
ALTER TABLE Afiliados DROP COLUMN Id_Negocio;

CREATE TABLE user_auto(
Id_User int,
Id_Auto int,
FOREIGN KEY (Id_User) REFERENCES Usuario_Vehi (Id_User),
FOREIGN KEY (Id_Auto) REFERENCES AUTOMOVIL (Id_Auto) 
);
ALTER TABLE AUTOMOVIL DROP foreign key automovil_ibfk_1;
ALTER TABLE AUTOMOVIL DROP COLUMN Id_User;

CREATE TABLE Autom_Regist(
Id_Auto Int,
Id_Gasto Int,
FOREIGN KEY (Id_Auto) REFERENCES AUTOMOVIL (Id_Auto),
FOREIGN KEY (Id_Gasto) REFERENCES REGIST_GASTOS (Id_Gasto)
);

ALTER TABLE REGIST_GASTOS DROP FOREIGN KEY regist_gastos_ibfk_1;
ALTER TABLE REGIST_GASTOS DROP COLUMN Id_Auto;

select * from Usuario_Vehi
DESCRIBE REGIST_GASTOS;

GRANT SELECT, INSERT, UPDATE, DELETE ON MAVELI.* TO 'jeysonh_dev'@'%';
REVOKE DROP ON MAVELI.* FROM 'jeysonh_dev'@'%';s