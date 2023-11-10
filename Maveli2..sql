create database Maveli
use Maveli

create table Usuario(
Id_Usuario int auto_increment primary key,
Nombre1 varchar(50) not null,
Nombre2 varchar(50), 
Apellido1 varchar(50) not null, 
Apellido2 varchar(50),
Telefono Int,
Email varchar(250) not null,
Clave_acceso varchar(250) not null
);

create table Negocio(
Id_Negocio Int not null auto_increment Primary Key , -- Restriccion llave primaria, autoincrementada
Nombre_negocio Varchar (80) not null,
Nombre_propiet Varchar (80) not null,
Telefono_negoc Int not null,
Email Varchar (80) not null,
Clave_acceso varchar (30) not null,
direccion Varchar (100) not null
);

create table Afiliados (
Id_afiliado Int auto_increment primary key,
Id_Negocio Int not null,
Tipo Varchar(50) not null,
foreign key(Id_Negocio) references Negocio(Id_Negocio)
);

create table Vehiculo(
Id_vehiculo int auto_increment primary key,
Marca varchar(75) not null,
Modelo varchar(75) not null,
Anio int,
Id_Usuario int not null,
foreign key(Id_Usuario) references Usuario(Id_Usuario)
);

create table Gastos(
Id_Gasto int auto_increment primary key,
Descripcion varchar(100) not null,
Monto float not null,
Id_vehiculo int not null,
foreign key(Id_vehiculo) references Vehiculo(Id_vehiculo)
);

create table Tipo_Servicio(
Id_tipoServicio int auto_increment primary key, 
Tipo_servicio varchar(50) not null,
Descripcion varchar(150) not null,
Costo float not null,
Id_afiliado int not null,
foreign key(Id_afiliado) references Afiliados(Id_afiliado)
);

create table Servicio(
Id_servicio int auto_increment primary key,
Id_tipoServicio int not null, 
Id_vehiculo int not null, 
fecha datetime not null,
foreign key(Id_tipoServicio) references Tipo_Servicio(Id_tipoServicio),
foreign key(Id_vehiculo) references Vehiculo(Id_vehiculo)
);

create table Producto(
Id_producto int auto_increment primary key,
Nombre varchar(100) not null,
Marca varchar(50) not null, 
Numero_parte varchar(50),
Categoria varchar(50) not null,
Costo float not null,
Cantidad_Stock int not null,
anio_fabricacion int,
Modelo_auto varchar(75) not null,
Id_afiliado int not null,
foreign key(Id_afiliado) references Afiliados(Id_afiliado)
);

create table compra_producto(
Id_compra int auto_increment primary key,
Id_producto int not null,
Id_Usuario int not null, 
Fecha date not null, 
foreign key(Id_Usuario) references Usuario(Id_Usuario),
foreign key(Id_producto) references Producto(Id_producto)
);