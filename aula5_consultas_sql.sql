Create database escolarDB04
;

use escolarDB04
;

CREATE TABLE ALUNO (
id_aluno INT NOT NULL auto_increment primary key,
nome_aluno VARCHAR(50),
sobrenome_aluno VARCHAR(100),
login_aluno CHAR(8),
datanasc_aluno date
)
;

CREATE TABLE DISCIPLINA (
id_disc INT NOT NULL auto_increment primary key,
nome_disc VARCHAR(50),
cargahoraria_disc int
)
;

CREATE TABLE CURSO (
id_curso INT NOT NULL auto_increment primary key,
nome_curso VARCHAR(50),
cargahoraria_curso int )
;

CREATE TABLE DISCIPLINACURSO (
id_curso INT not null,
id_disc INT not null,
data_assoc datetime default current_timestamp
)
;


-- alter table ALUNO add primary key (id_aluno);
-- alter table CURSO add primary key (id_curso);
-- alter table DISCIPLINA add primary key (id_disc);
-- alter table DISCIPLINACURSO add primary key (id_disccur);

-- alter table ALUNO add constraint fk_curso_aluno foreign key (id_curso) references curso(id_curso)
alter table DISCIPLINACURSO add constraint fk_curso_curso foreign key (id_curso) references curso(id_curso);
alter table DISCIPLINACURSO add constraint fk_curso_disc foreign key (id_disc) references disciplina(id_disc);
ALTER TABLE ALUNO ADD CPF VARCHAR(10) NOT NULL UNIQUE;
ALTER TABLE ALUNO MODIFY column CPF CHAR(11);

insert into curso (nome_curso, cargahoraria_curso) values('Sistemas para Internet', 3600);
insert into curso (nome_curso, cargahoraria_curso) values('Tecnólogo em Alimentos', 3600);
insert into curso (nome_curso, cargahoraria_curso) values('Técnico em Informática', 1600);
insert into curso (nome_curso, cargahoraria_curso) values('Técnico em Agropecuária', 1600);
insert into curso (nome_curso, cargahoraria_curso) values('Sistemas de Informação', 5600);

insert into aluno values
    (1, 'Jose', 'Alves','00001', '1990-10-10', '000121212'),
    (2, 'Maria', 'Aparecida', '00002','1990-08-06', '000121412'),
    (3, 'João', 'Paulo', '00003', '1991-03-08','000124512'),
    (4, 'Larisa', 'Tmes', '00004', '1992-03-09', '0001218812'),
    (5, 'Wilmar', 'Lima', '00005', '1990-01-02', '004121212'),
    (6, 'Douglas', 'Araujo', '000006','1986-10-12', '002021212'),
    (7, 'Armindo', 'Sousa', '00007', '1988-12-12', '000691212'),
    (8, 'Coves', 'Ferreira', '00008', '1991-08-11', '0001211212'),
    (9, 'Elena', 'Matos', '00009', '1992-07-03', '000131212'),
    (10, 'Daiane', 'Buck', '000010', '1990-05-06','0001213212')
;

insert into disciplina values(1,'Algoritmo', 60);
insert into disciplina values(2,'Programação para Internet', 60);
insert into disciplina values(3,'Microbiologia', 60);
insert into disciplina values(4, 'Quimica I', 60);
insert into disciplina values(5, 'Banco I tec',60);
insert into disciplina values(6, 'Programação comercial',60);
insert into disciplina values(7, 'Solo', 60);
insert into disciplina values(8, 'Plantio Direto', 60);
insert into disciplina values(9, 'Web Designer', 60);
insert into disciplina values(10, 'Calculo I', 60);

insert into disciplinacurso values(1,1,default);
insert into disciplinacurso values(1,2,default);
insert into disciplinacurso values(2,3,default);
insert into disciplinacurso values(2,4,default);
insert into disciplinacurso values(3,5,default);
insert into disciplinacurso values(3,6,default);
insert into disciplinacurso values(4,7,default);
insert into disciplinacurso values(4,8,default);
insert into disciplinacurso values(5,9,default);
insert into disciplinacurso values(5,10,default);

create table MATRICULA
(
id_mat int not null primary key auto_increment,
id_curso int not null,
id_aluno int not null,
data_mat date not null default current_timestamp,
ano_letivo char(4) not null,
situacao char(1) not null,
constraint fk_mat_aluno foreign key (id_aluno) references aluno(id_aluno),
constraint fk_curso_aluno foreign key (id_curso) references curso(id_curso)
);

-- alter table MATRICULA add primary key (id_mat);
-- alter table MATRICULA add constraint fk_mat_aluno foreign key (id_aluno) references aluno(id_aluno);

-- alter table MATRICULA add id_curso int not null;
-- alter table MATRICULA add constraint fk_curso_aluno 
-- foreign key (id_curso) references curso(id_curso);


select * from MATRICULA;
select * from ALUNO;
select * from CURSO;
select * from DISCIPLINACURSO;
select * from DISCIPLINA;

insert MATRICULA values(123,1,3,DEFAULT,'2024','A');
insert MATRICULA values(124,2,2,DEFAULT,'2024','A');
insert MATRICULA values(125,5,1,DEFAULT,'2024','A');


select count(*) as quantidade from MATRICULA where id_curso = (select id_curso from curso where nome_curso = "Sistemas para Internet");

-- subquery 