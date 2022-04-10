CREATE DATABASE AlunoProjeto;

USE AlunoProjeto;

CREATE TABLE Projeto(
    idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    descricao VARCHAR(100)
);

CREATE TABLE Aluno(
    raAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    telefoneCelular CHAR(12),
    fkRepresentante INT,
    FOREIGN KEY (fkRepresentante) REFERENCES Aluno(raAluno),
    fkProjeto INT, 
    FOREIGN KEY (fkProjeto) REFERENCES Projeto(idProjeto)
);

CREATE TABLE Acompanhantes(
    idAcompanhantes INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    tipoRelacao VARCHAR(60),
    fkAluno INT,
    FOREIGN KEY (fkAluno) REFERENCES Aluno(raAluno)
);

INSERT INTO Projeto VALUES
(NULL, 'Tecnologia++', 'Aumentar a quantidade de tecnologia no mundo'),
(NULL, 'Saude Verde', 'Manter nossas floras saúdaveis'),
(NULL, 'PetFeliz', 'Cuidar de pets que foram abandonados'),
(NULL, 'GamersUnidos', 'Conhecer novas pessoas para jogar em equipe');

INSERT INTO Aluno VALUES
(NULL, 'Mauricio', '1195544-1212', null, 1),
(NULL, 'Fernando', '1191320-5728', 1, 1),
(NULL, 'Lucas', '1196643-5555', 1, 1),
(NULL, 'Debora', '1199595-2020', null, 2),
(NULL, 'Catarina', '1195050-7475', 2, 2),
(NULL, 'Joao', '1192728-3031', 2, 2),
(NULL, 'Pedro', '1191516-2122', null, 3),
(NULL, 'Matheus', '1192327-9055', 3, 3),
(NULL, 'Paloma', '1192326-3016', 3, 3),
(NULL, 'Julia', '1192425-7071', null, 4),
(NULL, 'Junior', '1195657-4041', 4, 4),
(NULL, 'Cristina', '1196365-2021', 4, 4);

INSERT INTO Acompanhantes VALUES
(NULL, 'Bruna', 'Amiga', 1),
(NULL, 'Larissa', 'Amiga', 2),
(NULL, 'Vitória', 'Namorada', 3),
(NULL, 'Paulo', 'Namorado', 4),
(NULL, 'Gabriela', 'Irmã', 5),
(NULL, 'Gustavo', 'Irmão', 6),
(NULL, 'Ricardo', 'Amigo', 7),
(NULL, 'Wesley', 'Amigo', 8),
(NULL, 'Eduarda', 'Namorada', 9),
(NULL, 'Aline', 'Amiga', 10),
(NULL, 'Patrick', 'Irmão', 11),
(NULL, 'Fernanda', 'Amiga', 12);

-- 