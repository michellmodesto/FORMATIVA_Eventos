create database 0_agenda_eventos;

use 0_agenda_eventos;

##############################################################################################

# TABELA 1 - NÍVEL DE PERMISSÕES PARA USUÁRIOS

#Lista Mestre para NÍVEL DE PERMISSÕES dos usuários (table NivelUser)
#Cada NÍVEL DE USUÁRIO recebe um número (Id_Nivel)PK, 
#Cada NÍVEL DE USUÁRIO recebe uma descrição do nível (TipoUser), 
#Se o nível pode cadastrar novos usuários recebe "1" se não "0" (CadUser)
#Se o nível pode cadastrar novos ambientes recebe "1" se não "0" (CadAmbiente)
#Se o nível pode cadastrar novos eventos recebe "1" se não "0" (CadEvento)
#Se o nível pode imprimir relatório recebe "1" se não "0" (ImpRelatorio)
#Se o nível pode reservar ambiente recebe "1" se não "0" (ResAmbiente)
#Se o nível pode inscrever evento recebe "1" se não "0" (ResAmbiente)


create table NivelUser(
Id_Nivel bigint auto_increment not null,
TipoUser varchar (50) not null,
CadUser boolean not null,
CadAmbiente boolean not null,
CadEvento boolean not null,
ImpRelatorio boolean not null,
ResAmbiente boolean not null,
InscricaoEvento boolean not null,
primary key (Id_Nivel)
);

#TESTE PARA VISUALIZAR A TABELA DE NÍVEIS DE USUÁRIOS
select * from NivelUser;

#INSERÇÃO DAS AUTORIZAÇÕES DOS USUARIOS

#AUTORIZAÇÕES DO USUÁRIO DO ADMIN
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InscricaoEvento) 
values ("ADMIN", "1", "1", "1", "1", "1", "1");

#AUTORIZAÇÕES DO USUÁRIO DO GESTOR
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InscricaoEvento) 
values ("GESTOR", "0", "0", "1", "1", "1", "1");

#AUTORIZAÇÕES DO USUÁRIO DO USUÁRIO
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InscricaoEvento) 
values ("USUÁRIO", "0", "0", "0", "0", "1", "1");

#AUTORIZAÇÕES DO USUÁRIO DO VISTANTE
insert into NivelUser (TipoUser, CadUser, CadAmbiente, CadEvento, ImpRelatorio, ResAmbiente, InscricaoEvento) 
values ("VISTANTE", "0", "0", "0", "0", "0", "1");

#VISUALIZAR TABELA - NIVEL USUÁRIO
select * from NivelUser;

##############################################################################################
# TABELA 2 - CARGO USUÁRIOS

#Lista Mestre para CARGO dos usuários (table Cargo_User)
#Cada CARGO recebe um número (Id_Cargo) PK, descrição da função (DescCargo)

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

#Lista Mestre para cadastro de usuários (table usuarios)
#Cada Usuário recebe um número (id_User), nome do usuário (nameUser), email (EmailUser), data de nascimento (BirthUser), 
#nível de permissões do usuário (TipoUser_FK), senha de acesso (Password), data de cadastro do usuário (DtCadastro)
#Id_User / NameUser / EmailUser / BirthUser / DescCargo_FK / TipoUser_FK / Password / DtCadastro

Create table usuarios(
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
foreign key (TipoUser_FK) references  NivelUser (Id_Nivel)
);

#INSERIR DADOS NA TABELA DE CADASTRO DOS USUÁRIOS
insert into usuarios (NameUser, EmailUser, BirthUser, DescCargo_FK, TipoUser_FK, Password)
values ("Michel Modesto", "michellmodesto1986@gmail.com", "1986-05-19", "6", "1", "123");

select * from usuarios;

##################################################################################

#TABELA 4 - CADASTRO DE RECURSOS

#Lista Mestre para cadastro de recursos dos ambientes (TABELA - RECURSO)
#Cada equipamento recebe um número (id_recurso) e descrição (descRecurso)

 create table recurso(
 Id_Recurso bigint not null auto_increment,   #Id do recurso
 DescRecurso varchar(200) not null,           #Descrição do recuros
 primary key(id_recurso)
 );

#INSERIR DADOS NA TABELA RECURSOS
insert into recurso (DescRecurso) values ("Projetor");
insert into recurso (DescRecurso) values ("TV SMART");
insert into recurso (DescRecurso) values ("Ar Condicionado");
insert into recurso (DescRecurso) values ("WorkStation");

select * from recurso;

##################################################################################

#TABELA 5 - CADASTRO DE AMBIENTES

#Lista Mestre para cadastro dos ambientes (table ambientes)
#Cada AMBIENTE recebe um número (Id_Ambiente), local ambiente (LocalAmb), bloco (BlocoAmb), capacidade ambiente (CapacidadeAmb), registro de eventos (EventoAmb) 

Create table ambientes(
Id_Ambiente int auto_increment not null,
LocalAmb varchar (50) not null,
NameAmb_FK varchar (100) not null,
BlocoAmb varchar (10) not null,
CapacidadeAmb int not null,
EventoAmb_FK varchar (150) not null,
primary key (id_Ambiente)
#foreign key (eventoAmb_FK) references registro (id_evento)
);

select * from ambientes;

#INSERIR DADOS NA TABELA AMBIENTE
insert into ambientes (LocalAmb, NameAmb_FK, BlocoAmb, CapacidadeAmb, EventoAmb_FK )
values ("SENAI 5.01", "Lab_Eletrônica", "A", "20", "Curso Banco Dados");

insert into ambientes (LocalAmb, NameAmb_FK, BlocoAmb, CapacidadeAmb, EventoAmb_FK )
values ("SENAI 5.01", "Lab_Eletrônica", "A", "20", " Arduino");

##################################################################################

#TABELA 6 - RECURSOS E AMBIENTE
#Lista mestre dos ambientes e respectivos recursos disponiveis

 create table recurso_disponivel(
 Id_Disponivel bigint not null auto_increment,
 LocalAmb_FK int not null,
 DescRecurso_FK  bigint not null,
 primary key(Id_Disponivel),
 foreign key (LocalAmb_FK) references ambientes(Id_Ambiente),
 foreign key(DescRecurso_FK) references recurso(Id_Recurso)
 );
 
 select * from recurso_disponivel;

##################################################################################

#TABELA 7 - CADASTRO DE EVENTOS

#Lista Mestre para EVENTOS CADASTRADOS (table eventos)
#Cada EVENTO recebe um número (Id_Evento) PK, local do evento (LocalAmb_Fk), Vagas_Disponiveis (TotalVagas), 
#Vagas_Disponiveis (VagasOcupadas), Data e horário do INICIO do evento (InicioEvento), Data e horário do FIM do evento (FinalEvento)
#Data e hora Limite de check-in (FinalCheckin)

create table eventos(
 Id_Evento bigint not null auto_increment,
 NomeEvento varchar(200) not null,
 LocalAmb_Fk bigint not null,
 TotalVagas int not null,
 VagasOcupadas int not null,
 InicioEvento datetime not null,
 FinalEvento datetime not null,
 FinalCheckin datetime not null,
 primary key(Id_Evento),
 foreign key(LocalAmb_Fk) references ambientes (Id_Ambiente)
 );

##################################################################################

#TABELA 8 - BILHETE

#Lista Mestre para impressao BILHETES (table bilhete)
#Cada BILHETE recebe um número (Id_Bilhete), nome do usuario (NameUser_FK),  nome do evento (NomeEvento_FK), horario do bilhete (HorarioDeEmissão)

create table bilhete(
Id_Bilhete bigint not null auto_increment,
NameUser_FK bigint not null,
NomeEvento_FK bigint not null,
HorarioDeEmissão datetime not null default now(),
primary key(Id_Bilhete),
foreign key(NameUser_FK) references usuarios (Id_User),
foreign	key(NomeEvento_FK) references eventos (Id_Evento)
);

######################### PARTE 2 #############################

-- PARTE 2
-- Faça a importação do arquivo .zip DumpIDESP, referente ao Indice de desenvolvimento das escolas de SP;

use ok;
select * from escola;

-- Crie uma consulta para mostrar qual a média por municipio da nota idesp_ef_iniciais, nota_idesp_ef_finais e nota_idesp_em;
select id_municipio, AVG(nota_idesp_ef_iniciais) as MEDIA_INICIAIS, AVG(nota_idesp_ef_finais) as MEDIA_FINAIS, AVG(nota_idesp_em) as MEDIA_EM from escola
GROUP by id_municipio;

-- Crie uma consulta para mostrar qual a média por municipio e por ano da nota idesp_ef_iniciais, nota_idesp_ef_finais e nota_idesp_em;
select ano, id_municipio, AVG(nota_idesp_ef_iniciais) as MEDIA_INICIAIS, AVG(nota_idesp_ef_finais) as MEDIA_FINAIS, AVG(nota_idesp_em) as MEDIA_EM from escola
GROUP by id_municipio, ano;

-- Crie uma consulta para mostrar qual a média da composição conjunta por municipio da nota idesp_ef_iniciais, nota_idesp_ef_finais e nota_idesp_em;
select id_municipio, AVG(nota_idesp_ef_iniciais + nota_idesp_ef_finais + nota_idesp_em) as MEDIA_GERAL from escola
GROUP by id_municipio;


