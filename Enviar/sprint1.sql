create database sprint1;

use sprint1;

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
sobrenome VARCHAR(30),
especialidade VARCHAR(40),
especialidade2 VARCHAR(40)
);

CREATE TABLE Disciplina (
idDisc INT PRIMARY KEY AUTO_INCREMENT,
nomeDisc VARCHAR(45),
fkProfessor INT, FOREIGN KEY (fkProfessor) REFERENCES Professor (idProfessor)
);

INSERT INTO Professor values
(null, 'Vivian', 'Santos', 'Banco de Dados', 'Gestão de segurança'),
(null, 'Rogerio', 'Chola', 'Desenvolvedor de API', 'Tecnico de TI'),
(null, 'Caio', 'Santos', 'Desenvolvedor', 'Analista'),
(null, 'Dan', 'Josua', 'Desenvolvimento Socioemocional', 'Psicologia'),
(null, 'Monica', 'Herrero', 'Tecnica de TI', 'Gestão Empresarial'),
(null, 'Fernando', 'Brandão', 'Desenvolvimento Profissional', 'Administração');

INSERT INTO Disciplina values
(null, 'Banco de Dados', 1),
(null, 'Arquitetura Computacional', 2),
(null, 'Algoritmos', 3),
(null, 'Socioemocional', 4),
(null, 'Tecnologia da Informação', 5),
(null, 'Projeto e Inovação', 6);

select Professor.*, Disciplina.* from Professor join Disciplina on idProfessor = fkProfessor; 

select Disciplina.nomeDisc, Professor.nome from Professor join Disciplina on idProfessor = fkProfessor;

select Professor.*, Disciplina.* from Professor join Disciplina on idProfessor = fkProfessor where sobrenome = 'Santos';

select Professor.especialidade, Disciplina.nomeDisc from Professor join Disciplina on idProfessor = fkProfessor where nome = 'Caio' order by especialidade;

