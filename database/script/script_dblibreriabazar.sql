-- Eliminar la base de datos dblibreriabazar si existe
drop database dblibreriabazar;
-- Crear la base de datos dblibreriabazar
create database dblibreriabazar;
-- Usar la base de datos dblibreriabazar
use dblibreriabazar;

-- Crear la tabla genero 
create table genero (
	idgenero int primary key auto_increment,
    genero varchar(30) not null
);
-- Crear la tabla categoria 
create table categoria (
	idcategoria int primary key auto_increment,
    categoria varchar(60) not null
);
-- Crear la tabla cliente 
create table cliente (
	idcliente varchar(8) primary key,
    nombre varchar(60) not null,
    apaterno varchar(60) not null,
    amaterno varchar(60),
    telefono varchar(9),
    email varchar(120) not null unique,
    contraseña varchar(120) not null,
    idgenero int,
    foreign key (idgenero) references genero(idgenero)
);
-- Crear la tabla producto 
create table producto (
	SKU varchar(10) primary key,
    nombre varchar(120) not null,
    descripcion text,
    marca varchar(30),
    precio float not null,
    imagen longblob,
    idcategoria int,
    foreign key (idcategoria) references categoria(idcategoria)
);
-- Crear la tabla pedido 
create table pedido (
	codigo varchar(7) primary key,
    fecha date not null,
    total float not null,
    idcliente varchar(8),
    foreign key (idcliente) references cliente(idcliente)
);
-- Crear la tabla pedido_detalle 
create table pedido_detalle (
	idpedido_detalle int primary key auto_increment,
    cantidad int not null,
    subtotal int not null,
    codigo varchar(7),
    SKU varchar(10),
    foreign key (codigo) references pedido(codigo),
    foreign key (SKU) references producto(SKU)
);
-- Crear la tabla rol 
create table rol (
	idrol int primary key auto_increment,
    rol varchar(60) not null
);
-- Crear la tabla personal 
create table personal (
	idpersonal int primary key auto_increment,
    nombre varchar(60) not null,
    apaterno varchar(60) not null,
    amaterno varchar(60),
    telefono varchar(9),
    edad int,
    profesion varchar(60) not null
);
-- Crear la tabla administrador 
create table administrador (
	idadministrador int primary key auto_increment,
    user varchar(60) not null unique,
    password varchar(120) not null,
    estado char(1) not null,
    idrol int,
    idpersonal int,
    foreign key (idrol) references rol(idrol),
    foreign key (idpersonal) references personal(idpersonal)
);
-- Insertar registros a la tabla rol
insert into rol (rol) values 
('Administrador general'),
('Administrador de ventas'),
('Administrador de contenido');
-- Insertar registros a la tabla genero
insert into genero (genero) values 
('Masculino'),
('Femenino'),
('No especificado');
-- Insertar registros a la tabla categoria
insert into categoria(categoria) values 
('Libros'),
('Bolígrafos y lápices'),
('Cuadernos y libretas'),
('Papel y sobres'),
('Dibujo y Arte'),
('Manualidades'),
('Escolar'),
('Oficina');