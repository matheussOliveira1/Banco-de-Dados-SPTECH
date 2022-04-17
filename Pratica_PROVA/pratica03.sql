CREATE DATABASE praticaProva2;
USE praticaProva2;
DROP DATABASE praticaProva2;

CREATE TABLE Organizador(
    idOrganizador INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(90),
    rua VARCHAR(90),
    bairro VARCHAR(90),
    email VARCHAR(90),
    orgExperiente INT, 
    FOREIGN KEY (orgExperiente) REFERENCES Organizador (idOrganizador)
)AUTO_INCREMENT = 30;

CREATE TABLE Campanha(
    idCampanha INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    categoria VARCHAR(60),
    instituicao VARCHAR(90),
    instituicao2 VARCHAR(90),
    dataFinal DATE,
    fkOrganizador INT,
    FOREIGN KEY (fkOrganizador) REFERENCES Organizador (idOrganizador)
)AUTO_INCREMENT = 500;

INSERT INTO Organizador VALUES
(NULL, 'Junior', 'R.Juni', 'Jd.Marcelina', 'junior@prova.com', NULL),
(NULL, 'Marcela', 'R.Kindu', 'Jd.Terezina', 'marcela@prova.com', 30),
(NULL, 'Emanuely' 'R.Andre', 'Jd.Barcelona' 'emanuely@prova.com', 30),
(NULL, 'Pedro', 'R.Joaquim', 'Jd.Nazare', 'pedro@prova.com', NULL),
(NULL, 'Thomas', 'R.Chigaco', 'Jd.Estados Unidos', 'thomas@prova.com', 33),
(NULL, 'Felipe', 'R.Ponte', 'Jd.Grama alta', 'felipe@prova.com', 33);

INSERT INTO Campanha VALUES
(NULL, 'Higiene', 'HigieneSempre', NULL, '2022-06-12', 30),
(NULL, 'Alimento', 'AlimentoParaTodos', 'ComidaFeliz', '2022-08-15', 30),
(NULL, 'Diversão', 'BrinquedoParaTodos', 'CriançaFeliz', '2022-05-20', 31),
(NULL, 'Saude', 'SaudeNoTopo', 'SempreSaudavel', '2022-07-10', 32),
(NULL, 'Máscaras', 'ProtegendoTodos', NULL, '2022-05-05', 33);

SELECT * FROM Organizador;
SELECT * FROM Campanha;

-- G
SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador;

-- H
SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador WHERE Organizador.nome = 'Emanuely';

-- I 
SELECT * FROM Organizador JOIN Organizador AS Experiente ON Experiente.idOrganizador = Organizador.fkOrganizador;

-- J
SELECT * FROM Organizador JOIN Organizador AS Experiente ON Experiente.idOrganizador = Organizador.fkOrganizador WHERE Organizador.nome = 'Junior';

-- L
SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador JOIN Organizador AS Experiente ON Experiente.idOrganizador = Organizador.fkOrganizador;

-- M
SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador JOIN Organizador AS Experiente ON Experiente.idOrganizador = Organizador.fkOrganizador WHERE Organizador.nome = 'Thomas'