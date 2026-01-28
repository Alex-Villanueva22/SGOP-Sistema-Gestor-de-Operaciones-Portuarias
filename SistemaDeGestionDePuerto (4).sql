drop database if exists SistemaDeGestionDePuerto;
create database SistemaDeGestionDePuerto;
use SistemaDeGestionDePuerto;

create table ZonaDeAlmacenamiento(
	idZonaDeAlmacenamiento int,
    nombreZonaDeAlmacenamiento varchar(20),
	TipoDeCarga varchar(20),
    CapacidadMaxima int,
    CantidadActual int,
    primary key (idZonaDeAlmacenamiento)
);

CREATE INDEX idx_tipo_de_carga ON ZonaDeAlmacenamiento (TipoDeCarga);

create table Contenedor(
	idContenedor int,
    TipoDeCarga varchar(20),
    UbicacionContenedor varchar(20),
    ValidezDeCarga varchar(20),
    DestinoContenedor varchar(20),
    propietarioContenedor varchar(20),
    idZonaDeAlmacenamiento int,
    estadoContenedor varchar(20),
    idBarco int,
    primary key (idContenedor),
    foreign key (TipoDeCarga) references ZonaDeAlmacenamiento (TipoDeCarga)
);

create table Muelle(
	idMuelle int auto_increment,
    EstadoDeMuelle enum ('Disponible', 'No Disponible') default 'Disponible',
    primary key (idMuelle)
);

CREATE INDEX idx_destino_barco ON Contenedor (DestinoContenedor);

create table Barco(
	idBarco int,
    DestinoBarco varchar(20),
    CantidadDescargable int,
    CapacidadMaxima int,
    OperacionesBarco enum ('Aprobado', 'Finalizado') default 'Aprobado',
    idMuelle int,
    estadoFisico enum ('Buen estado', 'Dañado'),
    aprobacionAutoridades enum ('Aprobado', 'Desaprobado'),
    estadoSalida enum ('Aprobado', 'Derivado a puerto de reparación', 'Derivado a autoridades'),
    primary key (idBarco),
    foreign key (idMuelle) references Muelle (idMuelle)
);

create table Usuario(
	TipoDeUsuario varchar(30),
    idUsuario int,
    NombreUsuario varchar(20),
    ApellidoUsuario varchar(20),
    Contraseña varchar(20),
    primary key (idUsuario)
);

create table Reporte (
	idReporte int auto_increment,
    tiempoAsignado int,
    tiempoEmbarque int,
    idBarco int,
	CumplirEstibas enum ('si','no'),
    idContenedor int,
    TipoDeCarga varchar(20),
    DestinoContenedor varchar(20),
    primary key (idReporte),
    foreign key (idBarco) references Barco (idBarco),
    foreign key (idContenedor) references Contenedor (idContenedor),
    foreign key (TipoDeCarga) references Contenedor (TipoDeCarga),
    foreign key (DestinoContenedor) references Contenedor (DestinoContenedor)
);

insert into muelle (EstadoDeMuelle) values ('Disponible');
insert into muelle (EstadoDeMuelle) values ('Disponible');
insert into muelle (EstadoDeMuelle) values ('Disponible');
insert into muelle (EstadoDeMuelle) values ('Disponible');
insert into muelle (EstadoDeMuelle) values ('Disponible');

insert into usuario values
	('OperadorAtraque','100','Valentina','López','opera111'),
   	('OperadorEmbarque','200','Gabriel','Martínez','opera222'),
   	('OperadorAlmacenamiento','300','Sofía','Rodríguez','opera333'),
   	('AdministradorSistema','400','Mateo','Fernández','admin123');
    
insert into zonadealmacenamiento values
	('200101','ZonaDeEntrada','ProductosCongelados',40,0),
    ('200102','ZonaDeEntrada','ProductosSinCongelar',40,0),
    ('200103','ZonaDeEntrada','ProductoQuimicos',40,0),
    ('200104','ZonaDeEntrada','ProductosGranel',40,0),
    ('200105','ZonaDeEntrada','ProductosGenericos',40,0),
    ('200201','ZonaDeSalida','ProductosCongelados',40,0),
    ('200202','ZonaDeSalida','ProductosSinCongelar',40,0),
    ('200203','ZonaDeSalida','ProductoQuimicos',40,0),
    ('200204','ZonaDeSalida','ProductosGranel',40,0),
    ('200205','ZonaDeSalida','ProductosGenericos',40,0),
    ('200301','ZonaStandBy','ProductosCongelados',40,0),
    ('200302','ZonaStandBy','ProductosSinCongelar',40,0),
    ('200303','ZonaStandBy','ProductoQuimicos',40,0),
    ('200304','ZonaStandBy','ProductosGranel',40,0),
    ('200305','ZonaStandBy','ProductosGenericos',40,0);
    
insert into contenedor values
	('100101','ProductosCongelados','zonaDeSalida',NULL,'Colombia','Martin Vizcarra',NULL,NULL,NULL),
    ('100102','ProductosGenericos','zonaDeEntrada',NULL,'Peru','Dina Paucar',NULL,NULL,NULL);

insert into barco values 
	('301111','Mexico','5','40','Aprobado','3','Buen estado','Aprobado','Aprobado'),
    ('301112','Chile','7','30','Aprobado','1','Buen estado','Aprobado','Aprobado'),
    ('301116','España','3','40','Aprobado','4','Buen estado','Aprobado','Aprobado'),
    ('301117','Brasil','8','40','Aprobado','5','Buen estado','Aprobado','Aprobado'),
    ('301213','China','9','40','Finalizado','3','Buen estado','Aprobado','Aprobado'),
    ('301214','Japon','8','40','Finalizado','4','Buen estado','Aprobado','Aprobado'),
    ('301215','USA','6','40','Finalizado','5','Buen estado','Aprobado','Aprobado'),
    ('301216','Mexico','3','40','Finalizado','4','Buen estado','Aprobado','Aprobado'),
    ('301217','Brasil','8','40','Finalizado','3','Buen estado','Aprobado','Aprobado'),
    ('301218','España','4','40','Finalizado','2','Buen estado','Aprobado','Aprobado'),
    ('301219','Japon','7','40','Finalizado','1','Buen estado','Aprobado','Aprobado'),
    ('301310','China','2','40','Finalizado','2','Buen estado','Aprobado','Aprobado'),
    ('301311','USA','5','40','Finalizado','3','Buen estado','Aprobado','Aprobado');