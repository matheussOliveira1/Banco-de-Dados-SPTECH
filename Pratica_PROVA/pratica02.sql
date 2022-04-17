CREATE DATABASE OrganizadorCampanha;
USE OrganizadorCampanha;
DROP DATABASE OrganizadorCampanha;

CREATE TABLE Organizador(
    idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90),
    rua VARCHAR(90),
    bairro VARCHAR(90),
    email VARCHAR(90),
    organizadorExperiente INT,
    FOREIGN KEY (organizadorExperiente) REFERENCES Organizador (idOrganizador)
)AUTO_INCREMENT = 30;

CREATE TABLE Campanha(
    idCamapnha INT PRIMARY KEY AUTO_INCREMENT,
    categoriaDoacao VARCHAR(90),
    instituicao VARCHAR(90),
    instituicao2 VARCHAR(90),
    dataFinal DATE,
    fkOrganizador INT,
    FOREIGN KEY (fkOrganizador) REFERENCES Organizador (idOrganizador)
)AUTO_INCREMENT = 500;

INSERT INTO Organizador VALUES
(NULL, 'Mauricio', 'Marcelina', 'Julinete', 'mauricio@gmail.com', null),
(NULL, 'Marcelo', 'Pedreste Feliz', 'Rua Do Lado', 'marcelo@gmail.com', 30),
(NULL, 'Ricardo', 'Calçada Doce', 'Salgado', 'ricardo@gmail.com', 30),
(NULL, 'Julia', 'Pontinho Azul', 'Lugar Vermelho', 'julia@gmail.com', null),
(NULL, 'Fernanda', 'Casinha Rosa', 'Jardim Florescente', 'fernanda@gmail.com', 33),
(NULL, 'Junior', 'Virgina', 'Soninho Feliz', 'junior@gmail.com', 33);

INSERT INTO Campanha VALUES
(NULL, 'Alimento', 'AlimentoParaTodos', 'BarrigaCheia', '2022-07-13', 30),
(NULL, 'Vestimenta', 'RoupasCuidadora', null, '2022-05-15', 30),
(NULL, 'Cobertores', 'CalorGentil', 'CobertaQuentinha', '2022-05-25', 31),
(NULL, 'Colchões', 'CamaDoBem', null, '2022-06-09', 32),
(NULL, 'Brinquedo', 'SorrisoCriança', 'BrinquedoAnimado', '2022-06-19', 33),
(NULL, 'Tecnologia', 'NossaTecnologia', 'TecnologiaDeTodos', '2022-06-30', 34);


-- Inserções:

SELECT * FROM Organizador;
SELECT * FROM Campanha;

SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador;

SELECT * FROM Organizador  JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador WHERE nome = "Mauricio";

SELECT * FROM Organizador JOIN Organizador AS OrgNovato ON OrgNovato.organizadorExperiente = Organizador.idOrganizador;
-- vendo se aprendi:
SELECT * FROM Organizador LEFT JOIN Organizador AS OrgNovato ON OrgNovato.organizadorExperiente = Organizador.idOrganizador;

SELECT * FROM Organizador JOIN Organizador AS OrgNovato ON OrgNovato.organizadorExperiente = Organizador.idOrganizador WHERE Organizador.nome = 'Julia';

SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador JOIN Organizador AS OrgNovato ON OrgNovato.organizadorExperiente = Organizador.idOrganizador;

SELECT * FROM Organizador JOIN Campanha ON Campanha.fkOrganizador = Organizador.idOrganizador JOIN Organizador AS OrgExperiente ON OrgExperiente.idOrganizador = Organizador.organizadorExperiente WHERE Organizador.nome = 'Ricardo';