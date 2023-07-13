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
-- Crear la tabla marca 
create table marca (
	idmarca int primary key auto_increment,
    marca varchar(60) not null
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
    idmarca int,
    precio float not null,
    stock int not null,
    imagen longblob,
    idcategoria int,
    foreign key (idcategoria) references categoria(idcategoria),
    foreign key (idmarca) references marca(idmarca)
);
-- Crear la tabla distrito
create table distrito (
	iddistrito int primary key auto_increment,
    distrito varchar(60) not null
);
-- Crear la tabla tienda
create table tienda (
	idtienda int primary key auto_increment,
    tienda varchar(60) not null
);
-- Crear la tabla entrega
create table entrega (
	identrega int primary key auto_increment,
    entrega varchar(60) not null
);
-- Crear la tabla pago
create table pago (
	idpago int primary key auto_increment,
    pago varchar(60) not null
);
-- Crear la tabla pedido 
create table pedido (
	codigo varchar(7) primary key,
    fecha date not null,
    total float not null,
    idcliente varchar(8),
    iddistrito int,
    idtienda int,
    identrega int,
    idpago int,
    direccion varchar(240),
    foreign key (idcliente) references cliente(idcliente),
    foreign key (iddistrito) references distrito(iddistrito),
    foreign key (idtienda) references tienda(idtienda),
    foreign key (identrega) references entrega(identrega),
    foreign key (idpago) references pago(idpago)
);
-- Crear la tabla pedido_detalle 
create table pedido_detalle (
	idpedido_detalle int primary key auto_increment,
    cantidad int not null,
    subtotal float not null,
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
('Bolígrafos y lápices'),
('Papel y sobres'),
('Cuadernos y libretas'),
('Manualidades'),
('Dibujo y Arte'),
('Escolar'),
('Oficina'),
('Libros');
-- Insertar registros a la tabla marca
INSERT INTO marca(marca) VALUES 
('Faber-Castell'),
('Artesco'),
('Layconsa'),
('3M'),
('Pilot'),
('Pelican'),
('Justus'),
('Staedtler'),
('Stabilo'),
('Surco'),
('Alpha'),
('Ove'),
('Otros');
-- Insertar datos a la tabla personal
INSERT INTO personal (nombre, apaterno, amaterno, telefono, edad, profesion) 
VALUES ('Brian', 'Inca', 'Huamani', '911275987', '20', 'Ingeniero de Sistemas'),
	   ('Josue', 'Caman', 'Aguirre', '934419031', '20', 'Ingeniero de Software'),
	   ('Nick', 'Rimache', 'Oropeza', '955922381', '20', 'Ingeniero Informático');
-- Insertar datos a la tabla administrador
INSERT INTO administrador (user, password, estado, idrol, idpersonal) 
VALUES ('binca', 'binca', '1', 1, 1),
	   ('jcaman', 'jcaman', '1', 2, 2),
	   ('nrimache', 'nrimache', '1', 3, 3);
INSERT INTO distrito (distrito) VALUES
('Ancón'),
('Ate'),
('Barranco'),
('Breña'),
('Carabayllo'),
('Cercado de Lima'),
('Chaclacayo'),
('Chorrillos'),
('Cieneguilla'),
('Comas'),
('El Agustino'),
('Independencia'),
('Jesús María'),
('La Molina'),
('La Victoria'),
('Lince'),
('Los Olivos'),
('Lurigancho'),
('Lurín'),
('Magdalena del Mar'),
('Miraflores'),
('Pachacámac'),
('Pucusana'),
('Pueblo Libre'),
('Puente Piedra'),
('Punta Hermosa'),
('Punta Negra'),
('Rímac'),
('San Bartolo'),
('San Borja'),
('San Isidro'),
('San Juan de Lurigancho'),
('San Juan de Miraflores'),
('San Luis'),
('San Martín de Porres'),
('San Miguel'),
('Santa Anita'),
('Santa María del Mar'),
('Santa Rosa'),
('Santiago de Surco'),
('Surquillo'),
('Villa El Salvador'),
('Villa María del Triunfo');
INSERT INTO tienda(tienda) values 
('TechOffice Surco'),
('TechOffice Jockey Plaza'),
('TechOffice San Isidro'),
('TechOffice Plaza Lima Sur'),
('TechOffice Miraflores'),
('TechOffice Mall del Sur'),
('TechOffice La Molina'),
('TechOffice San Miguel');
INSERT INTO entrega(entrega) values
('Recojo en tienda'),
('Delivery');
INSERT INTO pago(pago) values 
('Tarjeta de crédito/débito'),
('Transferencia bancaria');