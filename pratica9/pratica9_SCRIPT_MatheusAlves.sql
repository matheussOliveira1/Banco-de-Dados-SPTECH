create database pratica9;
use pratica9;

create table aluno(
	ra CHAR(8) PRIMARY KEY,
    nomeAluno VARCHAR(45),
    emailAluno VARCHAR(45)
);

ALTER TABLE aluno ADD COLUMN fkGrupo INT, ADD CONSTRAINT fkGrupo FOREIGN KEY (fkGrupo) REFERENCES Grupo(idGrupo);

create table grupo(
	idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nomeGrupo VARCHAR(45),
    descProjeto VARCHAR(100)
);

create table professor(
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(45),
    disciplina VARCHAR(45)
)AUTO_INCREMENT = 10000;

create table avaliacao(
	idAvaliacao INT AUTO_INCREMENT,
    nota DECIMAL(4,2),
    dataAvaliacao DATETIME,
    fkProfessor INT,
    FOREIGN KEY (fkProfessor) REFERENCES Professor(idProfessor),
    fkGrupo INT, 
    FOREIGN KEY (fkGrupo) REFERENCES Grupo(idGrupo),
    PRIMARY KEY (idAvaliacao, fkProfessor, fkGrupo)
);

INSERT INTO grupo values
(NULL, 'ClimaTech', 'Trazer dados meteorológicos mais confiavel com sensores'),
(NULL, 'Luminus', 'Dimunir gastos de energia nos postes de luz com sensores'),
(NULL, 'Secure Lock', 'Acionar alarme quando cadeados e trancas forem abertos a força');

INSERT INTO aluno values
('01234567', 'Lua', 'lua@estudando.com', 1),
('0124456', 'Sol', 'sol@estudando.com', 1),
('0123345', 'Estrela', 'estrela@estudando.com', 2),
('01222345', 'Quasar', 'quasar@estudando.com', 2),
('01255678', 'Meteoro', 'meteoro@estudando.com', 3),
('01266789', 'Cometa', 'cometa@estudando.com', 3);

INSERT INTO professor values
(NULL, 'Protoestrela', 'Arquitetura computacional'),
(NULL, 'Nebulosa', 'Banco de dados'),
(NULL, 'Pulsar', 'Projeto e Inovação');

INSERT INTO avaliacao values
(NULL, 9.80, '2022-05-20 12:20:10', 10000, 1),
(NULL, 8.97, '2022-05-20 12:25:13', 10001, 1),
(NULL, 7.55, '2022-05-20 12:23:22', 10002, 1),
(NULL, 10.00, '2022-05-20 14:30:33', 10000, 2),
(NULL, 9.60, '2022-05-20 14:29:10', 10001, 2),
(NULL, 8.98, '2022-05-20 14:34:15', 10002, 2),
(NULL, 6.90, '2022-05-20 16:15:12', 10000, 3),
(NULL, 7.00, '2022-05-20 16:19:25', 10001, 3),
(NULL, 8.20, '2022-05-20 16:23:39', 10002, 3);

SELECT * FROM grupo;
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM avaliacao;

-- 5 
SELECT * FROM grupo JOIN aluno ON aluno.fkGrupo = grupo.idGrupo;

-- 6 
SELECT * FROM grupo JOIN aluno ON aluno.fkGrupo = grupo.idGrupo WHERE idGrupo = 1;

-- 7
SELECT avg(nota) as mediaGrupos FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo;

-- 8
SELECT min(nota) as notaMinima, max(nota) as notaMaxima FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo; 

-- 9
SELECT sum(nota) as somaNotas FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo;

-- 10
SELECT professor.*, grupo.*, dataAvaliacao FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo JOIN professor ON avaliacao.fkProfessor = professor.idProfessor; 

-- 11
SELECT professor.*, grupo.*, dataAvaliacao FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo JOIN professor ON avaliacao.fkProfessor = professor.idProfessor WHERE idGrupo = 3; 

-- 12
SELECT grupo.nomeGrupo FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo JOIN professor ON avaliacao.fkProfessor = professor.idProfessor WHERE nomeProfessor LIKE "Pulsar";

-- 13
SELECT * FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo JOIN aluno ON aluno.fkGrupo = grupo.idGrupo JOIN professor ON avaliacao.fkProfessor = professor.idProfessor;

-- 14
SELECT sum(distinct nota) FROM avaliacao;
SELECT distinct nota FROM avaliacao;

-- 15
SELECT nomeProfessor, avg(nota) as mediaNotas, sum(nota) as somaNotas FROM avaliacao JOIN professor ON avaliacao.fkProfessor = professor.idProfessor GROUP BY nomeProfessor;

-- 16
SELECT nomeGrupo, avg(nota) as mediaNotas, sum(nota) as somaNotas FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo GROUP BY nomeGrupo;

-- 17
SELECT nomeProfessor, min(nota) as notaMinima, max(nota) as notaMaxima FROM avaliacao JOIN professor ON avaliacao.fkProfessor = professor.idProfessor GROUP BY nomeProfessor;

-- 18
SELECT nomeGrupo, min(nota) as notaMinima, max(nota) as notaMaxima FROM avaliacao JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo GROUP BY nomeGrupo;