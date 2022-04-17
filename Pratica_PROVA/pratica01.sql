CREATE DATABASE AlunoProjeto;
drop database AlunoProjeto;
USE AlunoProjeto;

CREATE TABLE Projeto(
    idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    descricao VARCHAR(100)
);

CREATE TABLE Aluno(
    raAluno CHAR(8) PRIMARY KEY,
    nome VARCHAR(90),
    telefoneCelular CHAR(12),
    fkRepresentante CHAR(8),
    FOREIGN KEY (fkRepresentante) REFERENCES Aluno(raAluno),
    fkProjeto INT, 
    FOREIGN KEY (fkProjeto) REFERENCES Projeto(idProjeto)
);

CREATE TABLE Acompanhantes(
    idAcompanhantes INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    tipoRelacao VARCHAR(60),
    fkAluno CHAR(8),
    FOREIGN KEY (fkAluno) REFERENCES Aluno(raAluno)
);

INSERT INTO Projeto VALUES
(NULL, 'Tecnologia++', 'Aumentar a quantidade de tecnologia no mundo'),
(NULL, 'Saude Verde', 'Manter nossas floras saúdaveis'),
(NULL, 'PetFeliz', 'Cuidar de pets que foram abandonados');

INSERT INTO Aluno VALUES
('01221221', 'Mauricio', '1195544-1212', null, 1),
('01221292', 'Fernando', '1191320-5728', '01221221', 1),
('01220123', 'Lucas', '1196643-5555', '01221221', 1),
('01228994', 'Debora', '1199595-2020', null, 2),
('01227655', 'Catarina', '1195050-7475', '01228994', 2),
('01221236', 'Joao', '1192728-3031', '01228994', 2),
('01223217', 'Pedro', '1191516-2122', null, 3),
('01221618', 'Matheus', '1192327-9055', '01223217', 3),
('01221219', 'Paloma', '1192326-3016', '01223217', 3);

INSERT INTO Acompanhantes VALUES
(NULL, 'Bruna', 'Amiga', '01221221'),
(NULL, 'Larissa', 'Amiga', '01221292'),
(NULL, 'Vitória', 'Namorada', '01220123'),
(NULL, 'Paulo', 'Namorado', '01228994'),
(NULL, 'Gabriela', 'Irmã', '01227655'),
(NULL, 'Gustavo', 'Irmão', '01221236'),
(NULL, 'Ricardo', 'Amigo', '01223217'),
(NULL, 'Wesley', 'Amigo', '01221618'),
(NULL, 'Eduarda', 'Namorada', '01221219');

-- Inserção

SELECT * FROM Projeto;
SELECT * FROM Aluno;
SELECT * FROM Acompanhantes;


SELECT Aluno.*, Projeto.* FROM Aluno join Projeto on Aluno.fkProjeto = Projeto.idProjeto;

SELECT Aluno.*, Acompanhantes.* FROM Aluno JOIN Acompanhantes ON Acompanhantes.fkAluno = Aluno.raAluno;

SELECT * FROM Aluno JOIN Aluno as Representante ON Representante.fkRepresentante = Aluno.raAluno;

SELECT * FROM Aluno JOIN Projeto ON Aluno.fkProjeto = Projeto.idProjeto WHERE Projeto.nome = 'Saude Verde';

SELECT * FROM Aluno JOIN Projeto ON Aluno.fkProjeto = Projeto.idProjeto JOIN Acompanhantes ON Acompanhantes.fkAluno = Aluno.raAluno;