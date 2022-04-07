create database pet;

use pet;

create table Pet(
idPet int primary key auto_increment,
tipoDeAnimal varchar(45),
nome varchar(45),
dtNasc date
)auto_increment = 101;

create table Cliente(
idCliente int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
telefoneFixo char(9),
telefoneCelular char(12),
fkPet int,
foreign key (fkPet) references Pet (idPet),
fkEndereco int,
foreign key (fkEndereco) references Endereco (idEndereco)
);

create table Endereco(
idEndereco int primary key auto_increment,
bairro varchar(45), 
rua varchar(45),
cep char(9)
);


insert into Pet values
(null, 'Gato', 'Balder', '2020-06-12'),
(null, 'Cachorro', 'Ralph', '2019-12-12'),
(null, 'Furao', 'Furinho', '2021-02-18'),
(null, 'Aranha', 'Pernoca', '2021-01-01'),
(null, 'Cachorro', 'Bolinha', '2020-03-12');

insert into Endereco values
(null, 'JD.Nazareth', 'Virgina', '00032-150'),
(null, 'JD.YPE', 'Lasalle', '01043-120'),
(null, 'JD.Robru', 'Teodoro Nascimento', '11044-240');

insert into Cliente values
(null, 'Matheus', 'Alves', '2020-4050', '1194829-3416', 101, 1),
(null, 'Matheus', 'Alves', '2020-4050', '1194829-3416', 102, 1),
(null, 'Maria', 'Fernandes', '2000-1520', '1199445-1123', 103, 2),
(null, 'Norman', 'Fernandes', '2010-1616', '1199446-5511', 104,3),
(null, 'Norman', 'Fernandes', '2010-1616', '1199446-5511', 105, 3);

select * from Pet;
select * from Cliente;
select * from Endereco;

alter table Cliente modify column nome varchar(50);
desc Cliente;

select * from Pet where tipoDeAnimal like 'cachorro';

select Pet.nome, Pet.dtNasc from Pet;

select Pet.nome from Pet order by nome;

select Cliente.*, Endereco.* from Cliente join Endereco on Cliente.fkEndereco = Endereco.idEndereco order by bairro desc;

select * from Pet where nome like 'B%';

select * from Cliente where sobrenome like 'Fernandes';

update Cliente set telefoneFixo = '2021-2322' where idCliente between 1 and 2;
select * from Cliente where idCliente between 1 and 2;

select Cliente.*, Pet.* from Cliente join Pet on Cliente.fkPet = Pet.idPet;

select Cliente.*, Pet.* from Cliente join Pet on Cliente.fkPet = Pet.idPet where idCliente in (1, 2);

delete from Cliente where idCliente = 3;
delete from Pet where idPet = 103;

select * from Pet;
select * from Cliente;
select * from Endereco;

drop table Cliente;
drop table Pet;
drop table Endereco;

drop database pet;

-- --------------------------------------------------------------------------------------------------------
truncate Pessoa;
truncate Gastos;

drop table Pessoa;
drop table Gastos;


create database gasto;

use gasto;

create table Pessoa(
idPessoa int primary key auto_increment,
nome varchar(50),
dtNasc date,
profissao varchar(50)
);

create table Gastos(
idGastos int primary key auto_increment,
dataGasto date,
valor decimal(5,2),
descricao varchar(45),
fkPessoa int,
foreign key (fkPessoa) references Pessoa (idPessoa)
);

insert into Pessoa values
(null, 'Matheus', '2000-03-20', 'Desenvolvedor'),
(null, 'Maria', '2000-05-19', 'Administração'),
(null, 'Pedro', '1998-07-23', 'Engenheiro civil'),
(null, 'Fernanda', '1997-09-15', 'Modelo');

insert into Gastos values
(null, '2022-01-22', 500.00, 'Teclado e mouse gamer', 1),
(null, '2021-12-29', 250.00, 'Cadeira escritório', 1),
(null, '2022-02-18', 180.00, 'Tênis All Star', 2),
(null, '2019-12-29', 600.00, 'Tênis puma suede', 3),
(null, '2020-05-31', 100.00, '3 camisetas', 3),
(null, '2022-03-29', 300.00, '3 tênis Adidas', 4);


select * from Pessoa;
select * from Gastos;

select Pessoa.*, Gastos.* from Pessoa join Gastos on Pessoa.idPessoa = Gastos.fkPessoa;

select Pessoa.*, Gastos.* from Pessoa join Gastos on Pessoa.idPessoa = Gastos.fkPessoa where nome like 'Matheus';

update Pessoa set nome = 'Alice' where idPessoa = 2; -- Maria
update Gastos set valor = 195.00 where idGastos = 2; -- Matheus

select * from Pessoa;
select Pessoa.*, Gastos.* from Pessoa join Gastos on Pessoa.idPessoa = Gastos.fkPessoa where nome like 'Matheus';

delete from Pessoa where idPessoa = 4; -- Fernanda
delete from Gastos where idGastos = 6; -- Fernanda

select * from Pessoa;
select * from Gastos;

-- ------------------------------------------------------------------------------------

create database praticaFuncionario;

use praticaFuncionario;

create table Setor(
idSetor int primary key auto_increment,
nome varchar(45),
numeroAndar int
);

create table Funcionario(
idFuncionario int primary key auto_increment,
nome varchar(45),
telefone char(12),
salario decimal(6,2),
fkSetor int, foreign key (fkSetor) references setor (idSetor)
);

create table Acompanhantes(
idAcompanhantes int,
nome varchar(45),
dtNasc date,
tipoRelacao varchar(45),
fkFuncionario int, 
primary key (idAcompanhantes, fkFuncionario),
foreign key (fkFuncionario) references Funcionario(idFuncionario)
);

insert into Setor values
(null, 'Algoritmos', 1),
(null, 'Banco de Dados', 2),
(null, 'Arquitetura computacional', 3);

insert into Funcionario values
(null, 'Ingrid', '1194829-3416', 5000.00, 1),
(null, 'Julio', '1199441-1216', 3500.00, 2),
(null, 'Marcelo', '1195813-2516', 2500.00, 3),
(null, 'Nicolas', '1197788-1316', 3900.00, 1),
(null, 'Jonathan', '1198991-3125', 2500.00, 2),
(null, 'Marcos', '1195532-2122', 3000.00, 3);

insert into Acompanhantes values
(1, 'Matheus', '1999-02-18', 'Namorado', 1),
(2, 'Ysadora', '1998-05-19', 'Amiga', 2),
(3, 'Fernando', '1997-08-16', 'Amigo', 3),
(4, 'Maria', '1995-12-11', 'Esposa', 4),
(5, 'Felipe', '1996-06-12', 'Amigo', 5),
(6, 'Harry', '1994-09-15', 'Esposo', 6),
(7, 'Yuri', '1999-03-18', 'Amigo', 1),
(8, 'Melissa', '1998-04-29', 'Namorada', 2),
(9, 'Lucas', '1997-03-16', 'Amigo', 3),
(10, 'Lili', '1995-07-11', 'Amiga', 4),
(11, 'Sol', '1996-04-12', 'Amigo', 5),
(12, 'Lua', '1994-03-15', 'Amigo', 6);

select * from Setor;
select * from Funcionario;
select * from Acompanhantes;

select Setor.*, Funcionario.* from Funcionario join Setor on Setor.idSetor = Funcionario.fkSetor;
select Setor.*, Funcionario.* from Funcionario join Setor on Setor.idSetor = Funcionario.fkSetor where idSetor = 1;
select Funcionario.*, Acompanhantes.* from Funcionario join Acompanhantes on Funcionario.idFuncionario = Acompanhantes.fkFuncionario;
select Funcionario.*, Acompanhantes.* from Funcionario join Acompanhantes on Funcionario.idFuncionario = Acompanhantes.fkFuncionario where idFuncionario = 2;
select Funcionario.*, Setor.*, Acompanhantes.* from Funcionario join Setor on Funcionario.fkSetor = Setor.idSetor join Acompanhantes on Acompanhantes.fkFuncionario = Funcionario.idFuncionario;

-- ----------------------------------------------------------------------------
create database praticaTreinador;
use praticaTreinador;
drop database praticaTreinador;

create table Treinador(
idTreinador int primary key auto_increment,
nomeTreinador varchar(60),
telefone char(12),
email varchar(90),
fkTreinadorEXP int, foreign key (fkTreinadorEXP) references Treinador (idTreinador)
)auto_increment = 10;

create table Nadador(
idNadador int primary key auto_increment,
nomeNadador varchar(60),
estado varchar(30),
dtNasc date,
fktreinadorEXP int, 
foreign key (fktreinadorEXP) references Treinador (idTreinador)
)auto_increment = 100;

insert into Treinador values
(null, 'Marcos', '1191231-3020', 'marcostreinador@gmail.com', null),
(null, 'Fernanda', '1195611-1200', 'fernandatreinadora@gmail.com', null),
(null, 'Alice', '1191212-2535', 'alicetreinadora@gmail.com', null),
(null, 'Matheus', '1191315-4070', 'matheustreinador@gmail.com', null),
(null, 'Ezequiel', '1191141-3020', 'ezequieltreinador@gmail.com', null),
(null, 'Marcelo', '1198787-1325', 'marcelonovato@gmail.com', 10),
(null, 'Daniel', '1199582-1015', 'danielnovato@gmail.com', 11),
(null, 'Caio', '1191213-4055', 'caionovato@gmail.com', 12),
(null, 'Caique', '1198145-4317', 'caiquenotavo@gmail.com', 13),
(null, 'Yuri', '1193663-2516', 'yurinovato@gmail.com', 14);

insert into Nadador values
(null, 'Julio', 'São Paulo', '1999-03-12', 10),
(null, 'Pedro', 'São Paulo', '1997-02-11', 10),
(null, 'Lucas', 'Belo Horizonte', '1995-05-05', 11),
(null, 'Julia', 'Rio de Janeiro', '1998-09-14', 12),
(null, 'Maria', 'Fortaleza', '1999-10-23', 13),
(null, 'Fernando', 'Fortaleza', '1996-12-31', 13);

select * from Treinador; 
select * from Nadador;

select Treinador.*, Nadador.* from Treinador join Nadador on Treinador.idTreinador = Nadador.fkTreinador;

select Treinador.*, Nadador.* from Treinador join Nadador on Treinador.idTreinador = Nadador.fkTreinador where nomeTreinador like 'Matheus';

select Treinador.nomeTreinador as Experiente, Novato.nomeTreinador as Novato from Treinador join Treinador as Novato on Novato.fktreinadorEXP = Treinador.idTreinador;

select Treinador.nomeTreinador as Experiente, Novato.nomeTreinador as Novato from Treinador left join Treinador as novato on novato.idTreinador = treinador.fkTreinadorEXP;

select Treinador.nomeTreinador as Experiente, Novato.nomeTreinador as Novato from Treinador join Treinador as Novato on Novato.fktreinadorEXP = Treinador.idTreinador where Treinador.nomeTreinador like 'Alice';

select Treinador.nomeTreinador as Experiente, Nadador.*, Novato.nomeTreinador as Novato  from Treinador join Nadador on Treinador.idTreinador = Nadador.fkTreinadorEXP join Treinador as Novato on Novato.fktreinadorEXP = Treinador.idTreinador;

select Treinador.nomeTreinador as Experiente, Nadador.*, Novato.nomeTreinador as Novato  from Treinador join Nadador on Treinador.idTreinador = Nadador.fkTreinadorEXP join Treinador as Novato on Novato.fktreinadorEXP = Treinador.idTreinador where Treinador.nomeTreinador like 'Matheus';
