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
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
-- ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil'),
-- ('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal'),
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);

-- Exibe todos os campos e registros da tabela pessoas -- 
SELECT * FROM pessoas; 

