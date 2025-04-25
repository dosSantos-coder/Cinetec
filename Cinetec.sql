create database Cinetec;

Use Cinetec;

create table tbl_diretor (
	cod_diretor int primary key auto_increment,
	nome_diretor varchar(30) not null,
    nacionalidade varchar(30) not null,
	data_de_nascimento date not null,
    sexo ENUM('m','f') not null,
    deletado boolean default false
);

create table tbl_genero(
	cod_genero int primary key auto_increment,
    genero varchar(30) not null,
	deletado boolean default false
);

create table tbl_ator(
	id_ator int primary key auto_increment,
    nome_ator varchar(30) not null,
	sexo varchar(1) not null,
    dt_nascimento date not null,
    deletado boolean default false
);

create table tbl_filme(
	id_filme int primary key auto_increment,
    nome_autor varchar(30) not null,
    ano_lancamento int(4) not null,
    duracao int(4) not null,
    fk_cod_genero int not null,
    fk_cod_diretor int not null,
    deletado boolean default false,
    constraint fk_cod_genero foreign key (fk_cod_genero)references tbl_genero (cod_genero),
    constraint fk_cod_diretor foreign key (fk_cod_diretor)references tbl_diretor(cod_diretor)
);

create table tbl_filme_autor (
	fk_id_ator int,
    fk_id_filme int,
    constraint fk_id_autor foreign key(fk_id_ator) references tbl_ator (id_ator),
    constraint fk_id_filme foreign key(fk_id_filme) references tbl_filme (id_filme)
);

create table usuario(
	cod_usuario int primary key auto_increment,
    nome varchar(30) not null,
    email varchar(30) not null,
	senha varchar (10) not null,
    tipo_usuario ENUM('administrador','comum') not null default 'comum',
    criado_em datetime default now(),
    deletado boolean default false
);

select * from tbl_filme;