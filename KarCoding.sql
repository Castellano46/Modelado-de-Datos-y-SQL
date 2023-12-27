create schema KarCoding;

create table KarCoding.vehiculo(
	matricula VARCHAR(10) primary key,
	km int not null,
	fecha_compra date not null,
	id_modelo int not null,
	id_color int not null
);

create table KarCoding.revision(
	id serial primary key,
	matricula varchar(10) not null,
	id_moneda smallint not null,
	km int not null,
	fecha_revision date not null,
	importe float not null
);

create table KarCoding.moneda(
	id serial primary key,
	nombre varchar(50) not null
);

create table KarCoding.modelo(
	id serial primary key,
	id_marca int not null,
	nombre varchar(80) not null
);

create table KarCoding.marca(
	id serial primary key,
	id_grupo int not null,
	nombre varchar(80) not null
);

create table KarCoding.grupo(
	id serial primary key,
	nombre varchar(80) not null
);

create table KarCoding.color(
	id serial primary key,
	nombre varchar(50) not null
);

create table KarCoding.poliza(
	id serial primary key,
	id_aseguradora smallint not null,
	matricula varchar(10) not null,
	fecha_alta date not null,
	en_vigor boolean not null
);

create table KarCoding.aseguradora(
	id serial primary key,
	nombre varchar(80) not null
);

alter table KarCoding.poliza add constraint fk_poliza_aseguradora foreign key (id_aseguradora) references KarCoding.aseguradora(id);
alter table KarCoding.poliza add constraint fk_poliza_vehiculo foreign key (matricula) references KarCoding.vehiculo(matricula);

alter table KarCoding.marca add constraint fk_marca_grupo foreign key (id_grupo) references KarCoding.grupo(id);

alter table KarCoding.modelo add constraint fk_modelo_marca foreign key (id_marca) references KarCoding.marca(id);

alter table KarCoding.vehiculo add constraint fk_vehiculo_modelo foreign key (id_modelo) references KarCoding.modelo(id);
alter table KarCoding.vehiculo add constraint fk_vehiculo_color foreign key (id_color) references KarCoding.color(id);

alter table KarCoding.revision add constraint fk_revision_vehiculo foreign key (matricula) references KarCoding.vehiculo(matricula);
alter table KarCoding.revision add constraint fk_revision_moneda foreign key (id_moneda) references KarCoding.moneda(id);

CREATE TABLE KarCoding.tmp_coches (
	matricula varchar(50) NULL,
	grupo varchar(50) NULL,
	marca varchar(50) NULL,
	modelo varchar(50) NULL,
	fecha_compra date NULL,
	color varchar(50) NULL,
	aseguradora varchar(50) NULL,
	n_poliza int4 NULL,
	fecha_alta_seguro date NULL,
	importe_revision float4 NULL,
	moneda varchar(50) NULL,
	kms_revision int4 NULL,
	fecha_revision date NULL,
	kms_totales int4 NULL
);