create database aula16;
--criação de tabelas
CREATE TABLE categoria(
categoria_id serial,
nome varchar (20),
ultima_atualizacao timestamp

);
--comando para excluir tabela
--drop table categoria;
CREATE TABLE filme_categoria(
filme_id int,
categoria_id int,
ultima_atualizacao timestamp
);
CREATE TABLE filme (
filme_id serial,
titulo varchar(35),
descricao text,
ano_lacamento char(4),
linguagem_id int,
duracao_aluguel int
preco_aluguel numeric(4,2),
duracao int,
multa NUMERIC (4,2),
classificacao_indicativa int,
ultima_atualizacao timestamp,
ocasiao_especial text,
sinopse text
);
CREATE TABLE linguagem(
linguagem_id serial,
nome varchar (20),
ultima_atualizacao timestamp
);
CREATE TABLE ator_filme(
ator_id int,
filme_id int,
ultima_atualizacao timestamp
);
CREATE TABLE inventario(
inventario_id int,
filme_id int,
loja_id int,
ultima_atualizacao timestamp
);
CREATE TABLE aluguel(
aluguel_id serial,
data_aluguel timestamp,
inventario_id int,
cliente_id int,
data_retorno timestamp,
funcionario_id int,
ultima_atualizacao timestamp
);
CREATE TABLE pagamento(
pagamento_id int,
cliente_id int,
funcionario_id int,
aluguel_id int,
ultima_atualizacao timestamp
);

cREATE TABLE funcionario(
funcionario_id serial,
loja_id timestamp,
inventario_id int,
cliente_id int,
data_retorno timestamp,
funcionario_id int,
ultima_atualizacao timestamp
);

create table cliente (
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar(20),
	ultimo_nome varchar(20),
	endereco_id int,
	email varchar(60),
	data_criacao timestamp,
	ultima_atualizacao timestamp,
	ativo bool
);

create table endereco (
	endereco_id serial,
	endereco varchar(40),
	endereco2 varchar(40),
	distrito varchar(30),
	cidade_id int,
	cep char(8),
	telefone char(11),
	ultima_atualizacao timestamp
);

create table cidade (
	cidade_id serial,
	cidade varchar(30),
	pais_id int,
	ultima_atualizacao timestamp
);

create table pais(
	pais_id serial,
	pais varchar(20),
	ultima_atualizacao timestamp
);

alter table loja drop column ultima atualizacao;

alter table loja drop column ultima atualizacao timestamp;

alter table loja rename column ult_atual;
	to ultima_atualizacao;

alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table linguagem add primary key (linguagem_id);
alter table inventario add primary key (inventario_id);
alter table pais add primary key (pais_id);
alter table ator add primary key (ator_id);
alter table cidade add primary key (cidade_id);
alter table loja add primary key (loja_id);
alter table pagamento add primary key (pagamento_id);
alter table endereco add primary key (endereco_id);
alter table cliente add primary key (cliente_id);
alter table funcionario add primary key (funcionario_id);
alter table aluguel add primary key (aluguel_id);

alter table filme_categoria 
add constraint fk_categoria
foreign key (categoria_id)
references categoria(categoria_id);

alter table filme_categoria 
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table filme
add constraint fk_linguagem
foreign key (linguagem_id)
references linguagem(linguagem_id);

ALTER TABLE ator_filme
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

ALTER TABLE inventario --tabela que possui a chave estrangeira
ADD CONSTRAINT fk_filme --adiciona restrição na tabela a ser alterada
FOREIGN KEY (filme_id) --define a chave estrangeira na tabela a ser alterada
REFERENCES filme(filme_id); --referencia a tabela que possui a chave primaria

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
references inventario(inventario id);



