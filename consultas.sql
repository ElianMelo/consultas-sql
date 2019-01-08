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

-- Atualiza o nome do registro para HTML5 na tabela cursos em que o idcurso é 1 --
UPDATE cursos
SET nome = 'HTML5'
WHERE idcurso = '1';

-- Atualiza o nome e o ano do registro para PHP e 2015 na tabela cursos em que o idcurso é 4 --
UPDATE cursos
SET nome = 'PHP', ano = '2015'
WHERE idcurso = '4';

-- Atualiza o nome, a carga e o ano do registro para Java, 40 e 2015 na tabela cursos em que o idcurso é 5, limitando a 1 linha --
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

-- Exibe todos os campos e registros da tabela gafanhotos --
SELECT * FROM gafanhotos;

-- Exibe todos os campos e registros da tabela cursos --
SELECT * FROM cursos;

-- Exibe todos os campos e registros da tabela cursos ordenados pelo nome de forma crescente --
SELECT * FROM cursos
ORDER BY nome /* ASC */;

-- Exibe todos os campos e registros da tabela cursos ordenados pelo nome de forma decrescente --
SELECT * FROM cursos
ORDER BY nome DESC;

-- Exibe os campos nome, carga e ano da tabela cursos ordenados pelo nome --
SELECT nome, carga, ano FROM cursos
ORDER BY nome;

-- Exibe os campos ano, nome e carga da tabela cursos ordenados pelo nome --
SELECT ano, nome, carga FROM cursos
ORDER BY nome;

-- Exibe os campos ano, nome e carga da tabela cursos ordenados pelo ano --
SELECT ano, nome, carga FROM cursos
ORDER BY ano;

-- Exibe os campos ano, nome e carga da tabela cursos ordenados pelo ano e depois por nome --
SELECT ano, nome, carga FROM cursos
ORDER BY ano, nome;

-- Exibe todos os campos da tabela cursos em que o ano é 2016 ordenados pelo nome --
SELECT * FROM cursos
WHERE ano = '2016'
ORDER BY nome;

-- Exibe os campos nome e carga da tabela cursos em que o ano é 2016 ordenados pelo nome --
SELECT nome, carga FROM cursos
WHERE ano = '2016'
ORDER BY nome;

-- Exibe os campos nome, descrição e ano da tabela cursos em que o ano é menor ou igual a 2015 ordenados pelo ano e depois pelo nome --
SELECT nome, descricao, ano FROM cursos
WHERE ano <= /* = != <> < > >= */ 2015
ORDER BY ano, nome;

-- Exibe todos os campos da tabela cursos em que o total de aulas está entre 20 e 30 ordenados pelo nome --
SELECT * FROM cursos
WHERE totaulas BETWEEN '20' AND '30'
ORDER BY nome;

-- Exibe os campos nome e ano da tabela cursos em que o ano está entre 2014 e 2016, ordenando o ano de forma decrescente e depois o nome de forma ascendente --
SELECT nome, ano FROM cursos
WHERE ano BETWEEN 2014 AND 2016
ORDER BY ano DESC, nome ASC;

-- Exibe os campos idcurso e nome da tabela cursos em que o ano pode ser 2014, 2016 ou 2018 ordenados pelo nome --
SELECT idcurso, nome FROM cursos
WHERE ano IN ('2014', '2016', '2018')
ORDER BY nome;

-- Exibe os campos nome, descricao e ano da tabela cursos em que o ano pode ser 2014, 2016 ou 2020 ordenados pelo ano --
SELECT nome, descricao, ano FROM cursos
WHERE ano IN (2014, 2016, 2020)
ORDER BY ano;

-- Exibe os campos nome, carga e total de aulas da tabela cursos em que a carga é maior que 35 e o total de aulas menor que 30 --
SELECT nome, carga, totaulas FROM cursos
WHERE carga > 35 AND totaulas < 30
ORDER BY nome;

-- Exibe os campos nome, carga e total de aulas da tabela cursos em que a carga é maior que 35 ou o total de aulas menor que 30 --
SELECT nome, carga, totaulas FROM cursos
WHERE carga > 35 OR totaulas < 30
ORDER BY nome;

-- Exibe todos os campos da tabela cursos em que o nome começa com P --
SELECT * FROM cursos
WHERE nome LIKE 'P%';

-- Exibe todos os campos da tabela cursos em que o nome termina com A --
SELECT * FROM cursos
WHERE nome LIKE '%A';

-- Exibe todos os campos da tabela cursos em que o nome tenha a letra A --
SELECT * FROM cursos
WHERE nome LIKE '%A%';

-- Exibe todos os campos da tabela cursos em que o nome não tenha a letra A --
SELECT * FROM cursos
WHERE nome NOT LIKE '%A%';

-- Exibe todos os campos da tabela cursos em que o nome comece com PH e termine com P --
SELECT * FROM cursos
WHERE nome LIKE 'PH%P';

-- Exibe todos os campos da tabela cursos em que o nome comece com PH, termine com P e tenha mais alguma coisa --
SELECT * FROM cursos
WHERE nome LIKE 'PH%P_';

-- Exibe todos os campos da tabela cursos em que o nome comece com p, tenha alguma coisa, tenha p e tenha algo ou nada --
SELECT * FROM cursos
WHERE nome LIKE 'p_p%';

-- Exibe todos os campos da tabela gafanhotos em que no nome tenha silva --
SELECT * FROM gafanhotos
WHERE nome LIKE '%silva%';

-- Exibe as nacionalidades da tabela gafanhotos sem que haja repetições ordenando pelo nacionalidade --
SELECT DISTINCT nacionalidade FROM gafanhotos
ORDER BY nacionalidade;

-- Exibe as cargas da tabela cursos sem que haja repetições ordenando pela carga --
SELECT DISTINCT carga FROM cursos
ORDER BY carga;

-- Exibe a quantidade de nomes registrados na tabela cursos --
SELECT COUNT(nome) FROM cursos;

-- Exibe a quantidade de cursos da tabela cursos que possuem carga acima de 40 horas --
SELECT COUNT(*) FROM cursos WHERE carga > 40;

-- Exibe o maior total de aulas da tabela cursos --
SELECT MAX(totaulas) FROM cursos;

-- Exibe a maior carga da tabela cursos --
SELECT MAX(carga) FROM cursos;

-- Exibe o máximo do total de aulas que aconteceram em 2016 da tabela cursos --
SELECT MAX(totaulas) FROM cursos WHERE ano = '2016';

-- Exibe o mínimo do total de aulas da tabela cursos --
SELECT MIN(totaulas) FROM cursos;

-- Exibe a soma do total de aulas de todos os cursos da tabela cursos --
SELECT SUM(totaulas) FROM cursos;

-- Exibe a soma do total de aulas de todos os cursos de 2016 da tabela cursos --
SELECT SUM(totaulas) FROM cursos WHERE ano = '2016';

-- Exibe a média do total de aulas de todos os cursos da tabela cursos --
SELECT AVG(totaulas) FROM cursos;

-- Exibe a média do total de aulas de todos os cursos de 2016 da tabela cursos --
SELECT AVG(totaulas) FROM cursos WHERE ano = '2016';

-- Exibe as cargas da tabela cursos agrupadas pela carga --
SELECT carga FROM cursos
GROUP BY carga;

-- Exibe as cargas e uma contagem nos nomes da tabela cursos agrupadas pela carga --
-- Exibe as cargas agrupadas e a quantidade em cada grupo --
SELECT carga, COUNT(nome) FROM cursos
GROUP BY carga;

-- Exibe o total de aulas agrupadas e a quantidade de cursos em cada grupo --
SELECT totaulas, COUNT(*) FROM cursos
GROUP BY totaulas
ORDER BY totaulas;

-- Exibe as cargas agrupadas em que o total de aulas é 30 e a quantidade em cada grupo --
SELECT carga, COUNT(nome) FROM cursos
WHERE totaulas = 30
GROUP BY carga;

-- Exibe as cargas agrupadas e a quantidade em cada grupo, caso o grupo tenha mais de 3 registros --
SELECT carga, COUNT(nome) FROM cursos
GROUP BY carga
HAVING COUNT(nome) > 3;

-- Exibe os anos agrupados e a quantidade em cada grupo ordenando de forma decrescente a quantidade --
-- em cada grupo caso haja uma quantidade maior ou igual a 5 --
SELECT ano, COUNT(*) FROM cursos
GROUP BY ano
HAVING COUNT(*) >= 5
ORDER BY COUNT(*) desc;

-- Exibe os anos agrupados e a quantidade em cada grupo, em que o total de aulas é maior que 30 --
-- e que haja apenas grupos com ano superior a 2013, ordenando a quantidade de forma decrescente --
SELECT ano, COUNT(*) FROM cursos
WHERE totaulas > 30
GROUP BY ano
HAVING ano > 2013
ORDER BY COUNT(*) desc;

-- Exibe a carga agrupada e a quantidade em cada grupo, em que o ano seja maior que 2015 --
-- e que a carga seja maior que a média das cargas --
SELECT carga, COUNT(*) FROM cursos
WHERE ano > 2015
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos);

-- Exercícios Curso em Vídeo MySQL #12 - SELECT (Parte 2) --

-- Exercício 01 --
SELECT * FROM gafanhotos
WHERE sexo = 'F';

-- Exercício 02 --
SELECT * FROM gafanhotos
WHERE nascimento > '2000-01-01' AND nascimento < '2015-12-31';

-- Exercício 03 --
SELECT * FROM gafanhotos
WHERE sexo = 'M' AND profissao = 'Programador';

-- Exercício 04 --
SELECT * FROM gafanhotos
WHERE sexo = 'F' AND nacionalidade = 'Brasil' AND nome LIKE'J%';

-- Exercício 05 --
SELECT nome, nacionalidade FROM gafanhotos
WHERE nome LIKE '%Silva%' AND nacionalidade != 'Brasil' AND peso < '100';

-- Exercício 06 --
SELECT MAX(altura) FROM gafanhotos
WHERE sexo = 'M' AND nacionalidade = 'Brasil';

-- Exercício 07 --
SELECT AVG(peso) FROM gafanhotos;

-- Exercício 08 --
SELECT MIN(peso) FROM gafanhotos
WHERE sexo = 'F' AND nacionalidade != 'Brasil' AND nascimento > '1990-01-01' AND nascimento < '2000-12-31';

-- Exercício 09 --
SELECT COUNT(*) FROM gafanhotos
WHERE sexo = 'F' AND altura > '1.90';

-- Exercícios Curso em Vídeo MySQL #13 - SELECT (Parte 3) --

-- Exercício 01 --
SELECT profissao, COUNT(*) FROM gafanhotos
GROUP BY profissao
ORDER BY profissao;

-- Exercício 02 --
SELECT sexo, COUNT(*) FROM gafanhotos
WHERE nascimento > '2005-01-01'
GROUP BY sexo;

-- Exercício 03 --
SELECT nacionalidade, COUNT(*) FROM gafanhotos
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING COUNT(*) > 3;

-- Exercício 04 --
SELECT altura, COUNT(*) FROM gafanhotos
WHERE peso > '100'
GROUP BY altura
HAVING altura > (SELECT AVG(altura) FROM gafanhotos);

-- Lista de exercícios SQL Teaching --
-- https://www.sqlteaching.com/ --

-- Lição 1: SELECT * --
SELECT * FROM family_members;

-- Lição 2: SELECT colunas específicas --
SELECT name, species FROM family_members;

-- Lição 3: WHERE ... igual --
SELECT * FROM family_members
WHERE species = 'dog';

-- Lição 4: WHERE ... maior que --
SELECT * FROM family_members
WHERE num_books_read > 190;

-- Lição 5: WHERE ... maior ou igual que --
SELECT * FROM family_members
WHERE num_books_read >= 180;

-- Lição 6: AND --
SELECT * FROM friends_of_pickles
WHERE species = 'dog' AND height_cm < 45;

-- Liçãp 7: OR --
SELECT * FROM friends_of_pickles
WHERE species = 'dog' OR height_cm < 45;

-- Lição 8: IN --
SELECT * FROM friends_of_pickles
WHERE species NOT IN ('cat', 'dog');

-- Lição 9: DISTINCT --
SELECT DISTINCT species FROM friends_of_pickles
WHERE height_cm > 50;

-- Lição 10: ORDER BY --
SELECT * FROM friends_of_pickles
ORDER BY height_cm DESC;

-- Lição 11: LIMIT # de linhas retornadas; --
SELECT * FROM friends_of_pickles
LIMIT 1;

-- Lição 12: COUNT(*) --
SELECT COUNT(*) FROM friends_of_pickles;

-- Lição 13: COUNT(*) ... WHERE --
SELECT COUNT(*) FROM friends_of_pickles
WHERE species = 'dog';

-- Lição 14: SUM --
SELECT SUM(num_books_read) FROM family_members;

-- Lição 15: AVG --
SELECT AVG(num_books_read) FROM family_members;

-- Lição 16: MAX e MIN --
SELECT MAX(num_books_read) FROM family_members;

-- Lição 17: GROUP BY --
SELECT MAX(height_cm), species FROM friends_of_pickles
GROUP BY species;

-- Lição 18: Consultas aninhadas --
SELECT * FROM family_members
WHERE num_books_read = (SELECT MAX(num_books_read) FROM family_members);

-- Lição 19: NULL --
SELECT * FROM family_members
WHERE favorite_book IS NOT NULL;

-- Lição 20: Data --
SELECT * FROM celebs_born
WHERE birthdate > '1980-09-01';

-- Relacionamento entre tabelas --
DESCRIBE gafanhotos;

-- Adiciona a coluna cursopreferido na tabela gafanhotos --
ALTER TABLE gafanhotos
ADD COLUMN cursopreferido int;

-- Transforma a coluna cursopreferido em uma chave estrangeira --
ALTER TABLE gafanhotos
ADD FOREIGN KEY(cursopreferido)
REFERENCES cursos(idcurso);

-- Exibe todos os campos e registros da tabela gafanhotos e cursos --
SELECT * FROM gafanhotos;
SELECT * FROM cursos;

-- Faz o Daniel preferir o curso MySQL --
UPDATE gafanhotos
SET cursopreferido = '6'
WHERE id = '1';

-- Tenta apagar da tabela cursos o curso com id igual a 6 --
-- Resultara em um erro de referência --
DELETE FROM cursos
WHERE idcurso = '6';

-- Apaga da tabela cursos o curso com id igual a 28 --
-- Como o curso não há refência, ele será apagado --
DELETE FROM cursos
WHERE idcurso = '28';

-- Seleciona as colunas nome e curso preferido da tabela gafanhotos --
SELECT nome, cursopreferido FROM gafanhotos;

-- Seleciona as colunas nome e ano da tabela cursos --
SELECT nome, ano FROM cursos;

-- Seleciona todos os gafanhotos unidos a todos os cursos --
SELECT gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
FROM gafanhotos JOIN cursos;

-- Seleciona os gafanhotos ligados a seu curso favorito --
SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos JOIN cursos
ON cursos.idcurso = gafanhotos.cursopreferido;

-- Seleciona os gafanhotos ligados a seu curso favorito utilizando apelidos de coluna --
SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY g.nome;

-- Seleciona todos os gafanhotos ligados ou não a seu curso favorito utilizando apelidos de coluna --
SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g LEFT OUTER JOIN cursos AS c
ON c.idcurso = g.cursopreferido;

-- Seleciona todos os cursos ligados ou não a algum gafanhoto utilizando apelidos de coluna --
SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g RIGHT OUTER JOIN cursos AS c
ON c.idcurso = g.cursopreferido;

-- Adiciona a tabela que relaciona gafanhotos e cursos --
CREATE TABLE gafanhoto_assiste_curso (
	id int NOT NULL AUTO_INCREMENT,
    data date,
    idgafanhoto int,
    idcurso int,
    PRIMARY KEY(id),
    FOREIGN KEY(idgafanhoto) REFERENCES gafanhotos(id),
    FOREIGN KEY(idcurso) REFERENCES cursos(idcurso)
) DEFAULT CHARSET = utf8;

-- Insere dados na tabela g_assiste_c --
INSERT INTO gafanhoto_assiste_curso VALUES
(DEFAULT, '2014-03-01', '1', '2');

-- Exibe todos os campos da tabela g_assiste_c --
SELECT * FROM gafanhoto_assiste_curso;

-- Une as tabelas gafanhotos e gafanhoto_assiste_curso pelo id do gafanhoto nas tabelas --
SELECT g.nome, idcurso FROM gafanhotos g
JOIN gafanhoto_assiste_curso a
ON g.id = a.idgafanhoto
ORDER BY g.nome;

-- Une as tabelas gafanhotos, gafanhoto_assiste_curso e cursos pelo id do gafanhoto e do curso nas tabelas --
SELECT g.nome, c.nome FROM gafanhotos g
JOIN gafanhoto_assiste_curso a
ON g.id = a.idgafanhoto
JOIN cursos c
ON c.idcurso = a.idcurso
ORDER BY g.nome;

-- Lista de exercícios SQL Teaching --
-- https://www.sqlteaching.com/ --

-- Lição 21: Inner joins --
SELECT c.name, a.actor_name FROM character c
JOIN character_actor a
ON a.character_id = c.id;

-- Lição 22: Multiplos joins --
SELECT c.name, a.name FROM character_actor ca
JOIN character c
ON ca.character_id = c.id
JOIN actor a
ON ca.actor_id = a.id;

-- Lição 23: Joins com WHERE --
SELECT c.name, s.name FROM character_tv_show cs
JOIN character c
ON cs.character_id = c.id
JOIN tv_show s
ON cs.tv_show_id = s.id
WHERE c.name != 'Willow Rosenberg' AND
s.name != 'How I Met Your Mother';

-- Lição 24: Left joins --
SELECT c.name, a.name FROM character c
LEFT JOIN character_actor ca
ON ca.character_id = c.id
LEFT JOIN actor a
ON ca.actor_id = a.id;

-- Lição 25: Apelido de tabela --
SELECT c.name, a.name FROM character AS c
LEFT JOIN character_actor AS ca
ON ca.character_id = c.id
LEFT JOIN actor AS a
ON ca.actor_id = a.id;

-- Lição 26: Apelido de coluna --
SELECT c.name character, a.name actor FROM character c
LEFT JOIN character_actor ca
ON ca.character_id = c.id
LEFT JOIN actor a
ON ca.actor_id = a.id;

-- Lição 27: Auto joins --
SELECT e.name employee_name, b.name boss_name FROM employees e
JOIN employees b
ON e.boss_id = b.id;

-- Lição 28: LIKE --
SELECT * FROM robots
WHERE name LIKE '%Robot%' AND name LIKE '%20__%';

-- Lição 29: CASE --
SELECT *,CASE WHEN species = 'human' THEN 'talk'
WHEN species = 'dog' THEN 'bark'
WHEN species = 'cat' THEN 'meow' END sound FROM friends_of_pickles;

-- Lição 30: SUBSTR --
SELECT * FROM robots
WHERE SUBSTR(location, -2) LIKE 'NY';

-- Lição 31: COALESCE --
SELECT name, COALESCE(tank, gun, sword) weapon FROM fighters;
