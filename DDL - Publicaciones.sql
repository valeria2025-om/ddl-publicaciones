create database bibliotecaDB;

use bibliotecaDB;

create table ubicacionGeografica(Id int identity not null primary key, ciudad nvarchar(50) not null, pais nvarchar(50) not null, direccion nvarchar(100) not null)

create table autores (Id int identity not null primary key, nombre nvarchar(100) not null, tipoAutor nvarchar(50) not null)

create table tipos(Id int identity not null primary key, nombre nvarchar(100) not null)

create table editoriales(Id int identity not null primary key, nombre nvarchar(100) not null, ubicacionGeograficaId int not null, 
constraint fk_ubicacionGeografica foreign key (ubicacionGeograficaId) references dbo.ubicacionGeografica(Id) on delete cascade on update cascade)



create table publicaciones(Id int identity not null primary key, nombre nvarchar(100) not null, 
tiposId int not null, editorialId int not null, descriptores nvarchar(1000) not null,
serie int not null, volumen int,
constraint fk_editorial foreign key (editorialId) 
references editoriales(Id) on delete cascade on update cascade,
constraint fk_tipos foreign key (tiposId) references tipos(Id) on delete cascade on update cascade)

CREATE UNIQUE INDEX ix_descriptores
	ON publicaciones(descriptores)



create table publicacionesAutores (publicacionId int not null, autoresId int not null,
			constraint pk_publicacionesAutores primary key (publicacionId, autoresId),
			constraint fk_publicaciones foreign key (publicacionId)
			references publicaciones(Id) on delete cascade on update cascade,
			constraint fk_Autores foreign key (autoresId)
			references autores(Id) on delete cascade on update cascade)











