/*
Nome do autor: Elian Melo Morais
Data de criação do arquivo: 26/12/2018
Objetivo sucinto do arquivo: Demonstrar operações na linguagem SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
*/
USE cadastro;

DROP DATABASE cadastro; 

CREATE DATABASE cadastro 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci; 

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

DESCRIBE pessoas;
