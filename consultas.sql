/*
Nome do autor: Elian Melo Morais
Data de criação do arquivo: 26/12/2018
Objetivo sucinto do arquivo: Demonstrar operações na linguagem SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
*/
-- Usa o banco de dados cadastro -- 
USE cadastro;

-- Deleta o banco de dados cadastro --
DROP DATABASE cadastro; 

-- Cria o banco de dados cadastro --
CREATE DATABASE cadastro 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci; 

-- Cria a tabela pessoas --
CREATE TABLE pessoas(
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(30) NOT NULL, 
    nascimento date,
    sexo enum('M', 'F'),
    peso decimal(5, 2),
    altura decimal(3, 2),
    nacionalidade varchar(20) DEFAULT 'Brasil',
    PRIMARY KEY(id)
)DEFAULT CHARSET = utf8;

-- Exibe as informações da tabela pessoas/gafanhotos --
DESCRIBE pessoas;
DESC pessoas;
DESC gafanhotos;

-- Insere valores na tabela pessoas -- 
INSERT INTO pessoas VALUES
(DEFAULT, 'Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil'),
(DEFAULT, 'Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal'),
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT),
(DEFAULT, 'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda'),
(DEFAULT, 'Cláudio', '1975-04-22', 'M', '99.0', '2.15', 'Brasil'),
(DEFAULT, 'Pedro', '1999-12-03', 'M', '87', '2', DEFAULT),
(DEFAULT, 'Janaína', '1987-11-12', 'F', '75.4', '1.66', 'EUA');

-- Exibe todos os campos e registros da tabela pessoas -- 
SELECT * FROM pessoas;

-- Altera a tabela pessoas adicionando a coluna profissao -- 
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10); 

-- Altera a tabela pessoas removendo a coluna profissao --
ALTER TABLE pessoas
DROP COLUMN profissao;

-- Altera a tabela pessoas adicionando a coluna profissao após da coluna nome --
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) AFTER nome;

-- Altera a tabela pessoas adicionando a coluna codigo na primeira posição --
ALTER TABLE pessoas
ADD /* COLUMN */ codigo int FIRST;

-- Altera a tabela pessoas modificando a coluna profissao --
ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(20) NOT NULL DEFAULT ''; 

-- Altera a tabela pessoas modificando o nome da coluna profissao --
ALTER TABLE pessoas
CHANGE COLUMN profissao prof varchar(20);

-- Altera a tabela pessoas modificando o seu nome para gafanhotos --
ALTER TABLE pessoas
RENAME TO gafanhotos;

-- Cria a tabela cursos --
CREATE TABLE IF NOT EXISTS cursos(
	nome varchar(30) NOT NULL UNIQUE,
	descricao text,
	carga int UNSIGNED,
    totaulas int UNSIGNED,
    ano year DEFAULT '2016'
)DEFAULT CHARSET = utf8;

-- Exibe as informações da tabela cursos --
DESC cursos;

-- Adiciona a coluna idcurso na primeira posição --
ALTER TABLE cursos
ADD COLUMN idcurso int FIRST;

-- Define a coluna idcurso como a chave primária --
ALTER TABLE cursos
ADD PRIMARY KEY(idcurso);

-- Exibe todos os campos e registros da tabela cursos -- 
SELECT * FROM cursos;

-- Cria uma tabela teste --
CREATE TABLE IF NOT EXISTS teste(
	id int,
    nome varchar(10),
	idade int
);

-- Insere valores na tabela teste --
INSERT INTO teste VALUES
('1', 'Pedro', '22'),
('2', 'Maria', '12'),
('3', 'Maricota', '77');

-- Exibe todos os campos e registros da tabela teste -- 
SELECT * FROM teste;

-- Apaga um campo da tabela teste
ALTER TABLE teste
DROP id;

-- Apaga a tabela alunos se ela existir
DROP TABLE IF EXISTS alunos;

-- Apaga a tabela teste se ela existir
DROP TABLE IF EXISTS teste;