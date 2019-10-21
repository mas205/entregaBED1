# Creacion de base
CREATE DATABASE IF NOT EXISTS hoteles;
USE hoteles;

# Creacion de tablas sobre habitaciones
CREATE TABLE tipoHabitacion (
	idTipoHabitacion tinyint primary key auto_increment,
    nombreTipoHabitacion varchar(50) not null
);
CREATE TABLE habitacion (
	idHabitacion int primary key auto_increment,
    numeroHabitacion int not null,
    descHabitacion varchar(128),
    costoHabitacion int(64),
    idTipoHabitacion tinyint not null,
	foreign key (idTipoHabitacion) references tipoHabitacion(idTipoHabitacion),
    habilitada boolean not null
);

# Creacion de tablas sobre usuarios/empleados
CREATE TABLE usuarios (
	idUsuario int primary key auto_increment,
    nombre varchar (50) not null,
    apellido varchar (50) not null,
    email varchar (90) not null,
    validado boolean not null
);

CREATE TABLE rolEmpleado (
	idRol tinyint primary key auto_increment,
    nombreRol varchar(50) not null
);

CREATE TABLE empleado (
	idEmpleado int primary key auto_increment,
    nombreEmpleado varchar (50) not null,
    idRol tinyint,
    foreign key (idRol) references rolEmpleado(idRol)
);

# Creacion de tablas sobre pagos/reservas
CREATE TABLE reservas (
	idReserva int primary key auto_increment,
	idHabitacion int,
    foreign key (idHabitacion) references habitacion(idHabitacion),
    idUsuario int,
    foreign key (idUsuario) references usuarios(idUsuario),
    fechaInicioReserva datetime default current_timestamp not null,
    fechaFinReserva datetime not null
);

CREATE TABLE pagos (
	idPago int primary key auto_increment,
    idReserva int,
    foreign key (idReserva) references reservas(idReserva),
    montoPago int not null,
    fechaCreadoPago datetime default current_timestamp not null,
    fechaPagadoPago datetime
);

# Para borrar
USE hoteles;
DROP DATABASE hoteles;