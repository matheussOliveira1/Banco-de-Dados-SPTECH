create database sprint2;

drop database sprint2;

use sprint2;

create table Curso(
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(50)
);

insert into Curso values
(null, 'Inglês', 'ING', 'Marcos'),
(null, 'Matemática', 'MAT', 'Vivian'),
(null, 'Português', 'PT', 'Leonardo');

create table Sala(
idSala int primary key auto_increment,
numeroSala int,
andar int,
fkCurso int, foreign key (fkCurso) references Curso (idCurso)
);

insert into Sala values
(null, 1, 2, 1),
(null, 2, 2, 1),
(null, 3, 2, 2),
(null, 4, 3, 2),
(null, 5, 3, 3),
(null, 6, 3, 3);

select * from Curso;
select * from Sala;

select Curso.nome, Sala.andar from Curso join Sala on idCurso = fkCurso;

select Curso.*, Sala.* from Curso join Sala on idCurso = fkCurso where andar = 3;

alter table Sala add constraint chkandar check (andar = 2 or andar = 3);

-- teste:
insert into Sala values
(null, 1, 4, 1);
-- andar é o numero 4