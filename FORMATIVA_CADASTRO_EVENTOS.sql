create database 0_agenda_eventos;

use 0_agenda_eventos;

##############################################################################################

# Tabela 1 - Nível_Usuários
#Id_User / TipoUser / CadUser / CadAmbiente / CadEvento / ImpRelatorio / ResAmbiente / InsCurso

create table NivelUser(
Id_User bigint auto_increment not null,
TipoUser varchar (50) not null,
CadUser boolean not null,
CadAmbiente boolean not null,
CadEvento boolean not null,
ImpRelatorio boolean not null,
ResAmbiente boolean not null,
InsCurso boolean not null,
primary key (Id_User)
);

#INSERÇÃO DAS AUTORIZAÇÕES DOS USUARIOS

#AUTORIZAÇÕES DO USUÁRIO DO ADMIN
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InsCurso) 
values ("ADMIN", 1, 1, 1, 1, 1, 1);

#AUTORIZAÇÕES DO USUÁRIO DO GESTOR
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InsCurso) 
values ("GESTOR", "0", "0", "1", "1", "1", "1");

#AUTORIZAÇÕES DO USUÁRIO DO USUÁRIO
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InsCurso) 
values ("USUÁRIO", "0", "0", "0", "1", "1", "1");

#AUTORIZAÇÕES DO USUÁRIO DO VISTANTE
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InsCurso) 
values ("VISTANTE", "0", "0", "0", "0", "0", "1");

#VISUALIZAR TABELA - NIVEL USUÁRIO
select * from NivelUser;
drop table NivelUser;

##############################################################################################

# Tabela 2 - Cargo_Usuários
#Id_Cargo / DescCargo

Create table Cargo_User(
Id_Cargo int auto_increment not null,
DescCargo varchar (50) not null,
primary key (Id_Cargo)
);

#INSERÇÃO DOS CARGOS
#DESCRIÇÃO_CARGOS
insert into Cargo_User (DescCargo) values ("Diretor");
insert into Cargo_User (DescCargo) values ("Coordenador");
insert into Cargo_User (DescCargo) values ("Orientador");
insert into Cargo_User (DescCargo) values ("Assit_Social");
insert into Cargo_User (DescCargo) values ("Secretária");
insert into Cargo_User (DescCargo) values ("Professor");

#VISUALIZAR TABELA - NIVEL USUÁRIO
select * from Cargo_User;

##############################################################################################

#TABELA 3 - CADASTRO DE USUÁRIOS
#Id_User / NameUser / EmailUser / BirthUser / DescCargo_FK / TipoUser_FK / Password / DtCadastro

Create table Add_User (
Id_User int auto_increment not null,
NameUser varchar (150) not null,
EmailUser varchar (100) not null,
BirthUser date not null,
DescCargo_FK int not null,
TipoUser_FK bigint not null,
Password varchar (10) not null,
DtCadastro datetime not null default now(),
primary key (Id_User),
foreign key (DescCargo_FK) references  Cargo_User (Id_Cargo),
foreign key (TipoUser_FK) references  NivelUser (Id_User)
);

#INSERIR DADOS NA TABELA DE CADASTRO DOS USUÁRIOS
insert into Add_User (NameUser, EmailUser, BirthUser, DescCargo_FK, TipoUser_FK, Password)
values ("Michel Modesto", "michellmodesto1986@gmail.com", "1986-05-19", "6", "1", "123");

select * from Add_User;

##################################################################################

#TABELA 4 - CADASTRO DE AMBIENTES
#Id_Amb / NameAmb / LocalAmb / BlocoAmb / CapacidadeAmb / OcupAmb 

Create table ambientes (
Id_local int auto_increment not null,
NameAmb_FK varchar (100) not null,
LocalAmb varchar (50) not null,
BlocoAmb varchar (10) not null,
CapacidadeAmbK int not null,
#OcupAmb_FK date not null,
primary key (Id_Ambiente)
#foreign key (OcupAmb_FK) references  registro (DateReserv)
);

select * from ambientes;

#INSERIR DADOS NA TABELA AMBIENTE
insert into ambientes (NameAmb, LocalAmb, BlocoAmb, CapacidadeAmbK)
values ("Lab_Eletrônica", "Oficina", "A", "20");

select * from ambientes;

##################################################################################

#TABELA 5 - CADASTRO DE ITENS
#Id_Amb / NameAmb / Projetor / TV_Smart / Ar / Workstation

Create table recursosAmb (
Id_Amb int auto_increment not null,
NameAmb varchar (100) not null,
Projetor boolean not null,
TV_Smart boolean not null,
Ar boolean not null,
Workstation boolean not null,
primary key (Id_Amb, NameAmb)
);

select * from recursosAmb;

#INSERIR DADOS NA TABELA RECURSOS AMBIENTE
insert into recursosAmb (NameAmb, Projetor, TV_Smart, Ar, Workstation)
values ("Lab_Eletrônica", "1", "1", "1", "1");

select * from recursosamb;

