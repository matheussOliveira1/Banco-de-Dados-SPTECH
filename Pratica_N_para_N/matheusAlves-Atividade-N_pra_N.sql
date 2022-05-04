CREATE DATABASE Venda;
USE Venda;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(90),
email VARCHAR(90),
bairro VARCHAR(90),
cep CHAR(8),
fkClienteIndicado INT,
FOREIGN KEY (fkClienteIndicado) REFERENCES Cliente (idCliente)
)AUTO_INCREMENT = 100;

CREATE TABLE Produto (
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
descricao VARCHAR(100),
preco DECIMAL(6,2)
);

CREATE TABLE Venda (
idVenda INT AUTO_INCREMENT,
fkCliente INT,
PRIMARY KEY (idVenda, fkCliente),
FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente),
dtVenda DATE
);

CREATE TABLE notaFiscal(
idnotaFiscal INT AUTO_INCREMENT,
fkProduto INT,
FOREIGN KEY (fkProduto) REFERENCES Produto(idProduto),
fkVenda INT,
FOREIGN KEY (fkVenda) REFERENCES Venda(idVenda),
PRIMARY KEY (idnotaFiscal, fkProduto, fkVenda)
);

INSERT INTO Cliente VALUES
(NULL, 'Fernando', 'fernando@gmail.com', 'Joaquina', '05125019', NULL),
(NULL, 'Joana', 'joana@gmail.com', 'Fracionada', '03351250', 100),
(NULL, 'Lucas', 'lucas@gmail.com', 'Marcelina', '01283113', 101),
(NULL, 'Joh', 'joh@gmail.com', 'Jorbetina', '01283113', 102),
(NULL, 'Gilberto', 'gil@gmail.com', 'Viloes Unidos', '03355110', 103);

INSERT INTO Produto VALUES
(NULL, 'Papel-Higienico', 'Para higiene', '15.00'),
(NULL, 'Notebook Gamer', 'Tecnologia', '4500.00'),
(NULL, 'Teclado', 'Periférico para computador', '250.00'),
(NULL, 'Camisa', 'Roupa', '57.99'),
(NULL, 'Computador Gamer', 'Tecnologia', '7000.00'),
(NULL, 'Tenis', 'NMD Preto', '500.00');

INSERT INTO Venda VALUES
(NULL, 100, '2021-10-06'),
(NULL, 100, '2021-10-06'),
(NULL, 101, '2022-01-01'),
(NULL, 102, '2022-02-18'),
(NULL, 103, '2021-12-20'),
(NULL, 104, '2021-10-04');

INSERT INTO notaFiscal VALUES
(NULL, 1, 1),
(NULL, 2, 2),
(NULL, 3, 3),
(NULL, 4, 4),
(NULL, 5, 5),
(NULL, 6, 6);

-- E) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM Cliente;
SELECT * FROM Produto;
SELECT * FROM Venda;
SELECT * FROM notaFiscal;

-- G) Exibir os dados dos clientes e os dados de suas respectivas vendas.
SELECT * FROM Cliente JOIN Venda ON Venda.fkCliente = Cliente.idCliente;

-- H) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
SELECT * FROM Cliente JOIN Venda ON Venda.fkCliente = Cliente.idCliente WHERE nome = "Fernando";

-- I) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM Cliente JOIN Cliente as clienteIndic on clienteIndic.fkClienteIndicado = Cliente.idCliente;

-- J) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
SELECT * FROM Cliente JOIN Cliente as clienteIndic on clienteIndic.fkClienteIndicado = Cliente.idCliente WHERE Cliente.nome = "Lucas";

-- L) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
SELECT Cliente.*, Produto.*, Venda.*, notaFiscal.* FROM Cliente JOIN Cliente as clienteIndic ON clienteIndic.fkClienteIndicado = Cliente.idCliente JOIN Venda ON Venda.fkCliente = clienteIndic.idCliente JOIN notaFiscal ON notaFiscal.fkVenda = Venda.idVenda JOIN Produto ON Produto.idProduto = notaFiscal.fkProduto;

-- M) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
SELECT Produto.nome, Venda.dtVenda, notaFiscal.idnotafiscal FROM Venda JOIN notaFiscal ON notaFiscal.fkVenda = Venda.idVenda JOIN Produto ON notaFiscal.fkProduto = Produto.idProduto WHERE Venda.idVenda = 2;

-- N) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
SELECT Produto.nome, Produto.preco FROM Produto WHERE Produto.nome LIKE 'Computador Gamer';

-- O) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO Cliente VALUES
(NULL, 'Jaberto', 'jaberto@gmail.com', 'Fogo Azul', '04227020', 103),
(NULL, 'Jerédih', 'jeredih@gmail.com', 'Agua Limpa', '03558025', 104);

SELECT * FROM Cliente LEFT JOIN Venda ON Venda.fkCliente = Cliente.idCliente;
SELECT * FROM Cliente LEFT JOIN Venda ON Venda.fkCliente = Cliente.idCliente WHERE Venda.idVenda IS NULL;