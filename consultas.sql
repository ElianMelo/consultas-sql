/*
Nome do autor: Elian Melo Morais
Data de criação do arquivo: 26/12/2018
Objetivo sucinto do arquivo: Demonstrar operações na linguagem SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
*/
USE cadastro;

CREATE DATABASE cadastro;

CREATE TABLE pessoas (
	nome varchar(30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

DESCRIBE pessoas;
