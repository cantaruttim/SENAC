create database aula_comandos;
use aula_comandos;

drop table if exists funcionarios;
create table funcionarios (
	matricula varchar(100) not null,
	nome varchar(100) not null,
	data_nascimento varchar(100) not null,
	sexo char(1) not null,
	id_departamento int not null,
	foreign key (id_departamento) references departamento(id_departamento) on delete cascade
);


drop table if exists departamento;
create table departamento (
	id_departamento int primary key,
	nome_departamento varchar(150) not null,
	predio varchar(100) not null,
	andar varchar(10) not null
);

insert
	into departamento (id_departamento, nome_departamento, predio, andar)
		values (1, 'finanças', 'prédio 2', 'térreo'), 
			   (2, 'tecnologia', 'prédio 2', 'segundo'),
			   (3, 'Human Resources', 'prédio 2', 'terceiro');

select * from departamento;

insert 
	into funcionarios 
		(matricula, nome, data_nascimento, sexo, id_departamento) 
		values
			('XXX1025', 'Matheus da Silva', '1994-07-20', 'M', 2),
			('XXX1026','Fernanda Oliveira','1994-07-20','F', 1),
			('XXX1027','Fernando Oliveira','1994-07-20','M', 1),
			('XXX1028','Cáudio Oliveira','1994-07-20','M', 3),
			('XXX1029','Douglas','1994-07-20','M', 3),
			('XXX1030','Zé labubu','1994-07-20','M', 3),
			('XXX1031','Kevyn Doom','1994-07-20','M', 1);		

select * from funcionarios;

-- um comentários
/*
 *  
 * */


-- ================ Clausula WHERE e IN/NOT IN ================ 
select 
	* 
from funcionarios
where sexo not in ('F') -- o 'not in' é igual ao <>
;


select 
	* 
from funcionarios
where sexo in ('F') -- o 'in' é igual ao =
;

select 
	* 
from funcionarios
where sexo <> 'F' -- o comando <> representa 'diferente'
;

select 
	* 
from funcionarios
where sexo = 'F'
;

-- ================ Selecionando colunas específicas ================ 
select 
	-- * -- pelas colunas
	nome, data_nascimento
from funcionarios
;

select 
	-- * -- pelas colunas
	nome, data_nascimento
from funcionarios
;

-- exemplo de como podemos extrair as partes de uma data com o SQL
select 
	-- * -- pelas colunas
	nome, 
	DATE_FORMAT(data_nascimento, '%Y-%m-%d') as data_formatada, 
	DATE_FORMAT(data_nascimento, '%Y') as ano,
	DATE_FORMAT(data_nascimento, '%M') as nome_mes,
	CURRENT_DATE()
from funcionarios
;

-- ================ LIKE ================ 
/*
 * Diferença entre os Likes
 * M% = Termina com M e tem qualquer outra letra depois
 * %M = Começa com M e termina com qualquer outra letra
 * %M% = Contem M em qualquer parte do texto
 */

select 
	*
from funcionarios
where nome like 'M%' 
;

select 
	*
from funcionarios
where nome like '%M' 
;

select 
	*
from funcionarios
where nome like '%M%' 
;

-- ================ CLÁUSULA CASE/WHEN ================ 

select
	matricula, nome, data_nascimento, sexo,
	case 
		when sexo = 'M'
		-- when trim(lower(sexo)) = 'm'
			then 'Masculino' else 'Feminino'
	end as sexo_tratado
from funcionarios
;

-- ================ FUNÇÕES DE AGREGAÇÃO ================ 
-- SUBQUERY
-- consulta externa
select
	a.matricula, a.nome,
	avg(a.idade) as idade_media
from 
(
	-- consulta interna
	select
		matricula, nome, data_nascimento,
		case 
			when sexo = 'M'
				then 'Masculino' else 'Feminino'
		end as sexo_tratado,
		DATE_FORMAT(data_nascimento, '%Y') as ano_nascimento,
		DATE_FORMAT(CURRENT_DATE(), '%Y') as ano_atual,
		DATE_FORMAT(CURRENT_DATE(), '%Y') - DATE_FORMAT(data_nascimento, '%Y') as idade
	from funcionarios
) a
group by a.matricula, a.nome
;


select 
	a.*,
	sum(a.quantidade) over () as quantidade_total
from
(
	select
		matricula, count(*) as quantidade
	from funcionarios
	group by matricula
) a
group by a.matricula
;


select
	matricula, nome, data_nascimento,
	case 
		when sexo = 'M'
			then 'Masculino' else 'Feminino'
	end as sexo_tratado,
	DATE_FORMAT(data_nascimento, '%Y') as ano_nascimento,
	DATE_FORMAT(CURRENT_DATE(), '%Y') as ano_atual,
	DATE_FORMAT(CURRENT_DATE(), '%Y') - DATE_FORMAT(data_nascimento, '%Y') as idade
from funcionarios
;

-- ================ FUNCIONÁRIOS QUE TRABALHAM EM UM DEPARTAMENTO ESPECÍFICO ================


select
	a.id_departamento,
	a.qtdFuncionarios,
	sum(a.qtdFuncionarios) over () as totalFuncionarios,
	concat(a.qtdfuncionarios / sum(a.qtdFuncionarios) over () * 100, '%') as perc_funcionarios
from
(
	select
		id_departamento, count(*) as qtdFuncionarios
	from funcionarios
	group by id_departamento

) a
group by a.id_departamento
;

select  
		funcionarios.id_departamento, funcionarios.nome, departamento.nome_departamento 
from funcionarios 
inner join departamento 
	on funcionarios.id_departamento = funcionarios.id_departamento
;

select
	id_departamento,
	case
		when id_departamento = 1 then 'Finanças' else '' 
	end as departamento,
	case 
		when id_departamento = 2 then 'Tecnologia' else ''
	end as departamento,
	case
		when id_departamento = 3 then 'RH' else ''
	end as departamento
from funcionarios
;


