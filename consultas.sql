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
CREATE TABLE pessoas (
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

-- Insere valores na tabela pessoas -- 
INSERT INTO pessoas VALUES
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil'),
('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal'),
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT),
(DEFAULT, 'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda'),
(DEFAULT, 'Cláudio', '1975-04-22', 'M', '99.0', '2.15', 'Brasil'),
(DEFAULT, 'Pedro', '1999-12-03', 'M', '87', '2', DEFAULT),
(DEFAULT, 'Janaína', '1987-11-12', 'F', '75.4', '1.66', 'EUA');

-- Exibe todos os campos e registros da tabela pessoas -- 
SELECT * FROM pessoas; 

