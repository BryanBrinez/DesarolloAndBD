create table ordenDeServicio(
codigo varchar primary key,
fecha date NOT NULL,
nombreMedico varchar NOT NULL,
diagnostico varchar NOT NULL,
descpServicio varchar NOT NULL,
nitIps varchar NOT NULL,
nitAfiliado varchar not null);

create table ips(
nit varchar primary key,
razonSocial varchar not null unique,
nivelAtencion int not null,
serviciosPrestados varchar not null);

create table afiliado (
dni varchar primary key,
tipoDoc varchar not null,
nombre varchar not null,
apellido varchar not null,
fNacimiento date not null,
genero varchar not null,
direccion varchar not null,
ciudadResidencia varchar not null,
telefono varchar not null,
estadoCivil varchar not null,
Correo varchar not null,
nitIps varchar not null);

create table beneficiario(
dniCotizante varchar primary key,
dniAfiliado varchar not null,
parentezco varchar not null
);

create table cotizante(
DNIAfiliado varchar primary key , 
fecha1Afiliacion date not null, 
estadoAfiliado boolean not null, 
salario integer not null, 
rangoSalarial char not null);

create table contrato(
numContrato  varchar primary key,
estado boolean not null,
codVinculacion varchar not null);

create table aportes(
codAporte varchar primary key, 
fechaPago date not null, 
valorPagado integer not null, 
numcontrato varchar not null);

create table vinculacion (
numRadicoRecibido varchar primary key,
salarioBase int not null);

create table dependiente
(dniCotizante varchar primary key);

create table retiro(
numRadicado varchar primary key, 
fechaRetiro date not null, 
numContrato varchar not null);

create table labora (
    nitEmpresa varchar not null,
    dniDependiente varchar not null,
	primary key (nitEmpresa, dniDependiente)
);

create table empresa(
NIT varchar primary key, 
razonSocial varchar not null, 
ciudad varchar not null, 
direccion varchar not null, 
telefono varchar not null, 
nombreContacto varchar not null);

create table independiente(
RUT varchar primary key,
razonSocial varchar not null,
ciudad varchar not null,
direccion varchar not null,
telefono varchar not null,
nombreContacto varchar not null,
DNICotizante varchar not null);

alter table ordendeservicio
  add constraint fkips
  foreign key (nitips)
  references ips (nit);

alter table ordendeservicio
  add constraint fkafiliado
  foreign key (nitafiliado)
  references afiliado (dni);

alter table afiliado
  add constraint fkips
  foreign key (nitips)
  references ips (nit);
  
alter table beneficiario
  add constraint fkcotizante
  foreign key (dnicotizante)
  references cotizante (dniafiliado);
  
alter table beneficiario
  add constraint fkafiliado
  foreign key (dniafiliado)
  references afiliado (dni);

alter table cotizante
  add constraint fkafilaido
  foreign key (dniafiliado)
  references afiliado (dni);

alter table aportes
  add constraint fkcontrato
  foreign key (numcontrato)
  references contrato (numcontrato);
  
alter table contrato
  add constraint fkvinculacion
  foreign key (codvinculacion)
  references vinculacion (numradicadorecibido);
  
alter table retiro
  add constraint fkcontrato
  foreign key (numcontrato)
  references contrato (numcontrato);

alter table dependiente
  add constraint fkcotizante
  foreign key (dnicotizante)
  references cotizante (dniafiliado);
  
alter table labora
  add constraint fkempresa
  foreign key (nitempresa)
  references empresa (nit);
  
alter table labora
  add constraint fkdependiente
  foreign key (dnidependiente)
  references dependiente (dnicotizante);
  
alter table independiente
  add constraint fkcotizante
  foreign key (dnicotizante)
  references cotizante (dniafiliado);

