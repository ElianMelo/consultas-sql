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

-- Exibe as informações da tabela pessoas --
DESCRIBE pessoas;
DESC pessoas;

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

-- Altera a tabela gafanhotos removendo a coluna codigo --
ALTER TABLE gafanhotos
DROP codigo;

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

-- Apaga o campo id da tabela teste --
ALTER TABLE teste
DROP id;

-- Apaga a tabela alunos se ela existir --
DROP TABLE IF EXISTS alunos;

-- Apaga a tabela teste se ela existir --
DROP TABLE IF EXISTS teste;

-- Exibe todos os campos e registros da tabela gafanhotos -- 
SELECT * FROM gafanhotos;

-- Insere diversos valores na tabela cursos --
INSERT INTO cursos VALUES
	('1','HTML4','Curso de HTML5', '40','37','2014'),
	('2','Algoritmos','Lógica de Programação','20','15','2014'),
	('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
	('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
	('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
	('6','MySQL','Banco de Dados MySQL','30','15','2016'),
	('7','Word','Curso completo de Word','40','30','2016'),
	('8','Sapateado','Danças Rítmicas','40','30','2018'),
	('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
	('10','Youtuber','Gerar polêmica e ganhar inscritos','5','2','2018');

-- Exibe todos os campos e registros da tabela cursos -- 
SELECT * FROM cursos;

-- Atualiza o nome do registro para HTML5 na tabela cursos onde o idcurso é 1 --
UPDATE cursos
SET nome = 'HTML5' 
WHERE idcurso = '1';

-- Atualiza o nome e o ano do registro para PHP e 2015 na tabela cursos onde o idcurso é 4 --
UPDATE cursos
SET nome = 'PHP', ano = '2015'
WHERE idcurso = '4';

-- Atualiza o nome, a carga e o ano do registro para Java, 40 e 2015 na tabela cursos onde o idcurso é 5, limitando a 1 linha --
UPDATE cursos
SET nome = 'Java', carga = '40', ano = '2015'
WHERE idcurso = '5'
LIMIT 1;

-- Altera a carga e o ano de cursos inválidos --
UPDATE cursos
SET ano = '2050', carga = '800'
WHERE ano = '2018'
LIMIT 2;

-- Desativa o SAFE UPDATES --
SET SQL_SAFE_UPDATES = 0;

-- Ativa o SAFE UPDATES --
SET SQL_SAFE_UPDATES = 1;

-- Deleta da tabela cursos o registro que tiver idcurso igual a 8 --
DELETE FROM cursos
WHERE idcurso = '8';

-- Deleta da tabela cursos dois registros que estiverem no ano de 2050 --
DELETE FROM cursos
WHERE ano = '2050'
LIMIT 2;

-- Deleta todos os registros da tabela cursos --
TRUNCATE /* TABLE */ cursos;

-- Informações do Banco de Dados --
SELECT * FROM cursos;
SELECT * FROM gafanhotos;
DESCRIBE gafanhotos;
DESC cursos;
SHOW TABLES;

-- Apaga o Banco de Dados cadastro --
DROP DATABASE cadastro;
