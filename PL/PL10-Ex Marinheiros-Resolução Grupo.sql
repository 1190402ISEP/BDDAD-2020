
--1) Mostrar o id, o nome e a classificação dos marinheiros com a melhor classificação (Figura 2), usando três estratégias diferentes, nomeadamente:
----a) Sem junção de tabelas e com função de agregação;
SELECT 
    m.idmarinheiro, 
    m.nome, 
    m.classificacao 
from  Marinheiro m 
where classificacao=
    (select 
        max(classificacao)
    from marinheiro)
order by m.classificacao DESC, m.idmarinheiro ASC;

----b) Sem junção de tabelas e sem função de agregação;
select 
    m.idmarinheiro, 
    m.nome, 
    m.classificacao
from  Marinheiro m
where m.classificacao>=all(select classificacao from Marinheiro);

----c) Com junção de tabelas.
select distinct m1.idMarinheiro, m1.nome, m2.classificacao 
from Marinheiro m1
inner join Marinheiro m2 
on m1.idMarinheiro = m2.idMarinheiro and m2.classificacao = (select max(classificacao) from Marinheiro);

-- ou 
select distinct m1.idMarinheiro, m1.nome, m2.classificacao 
from Marinheiro m1
inner join (select idMarinheiro, nome, classificacao from Marinheiro where classificacao >=  all(select (classificacao) from Marinheiro)) m2 
on m1.idMarinheiro = m2.idMarinheiro;

--2) Mostrar o id, o nome, a classificação dos marinheiros e o comentário “Superior à média” associado apenas aos marinheiros que têm classificação superior à média (Figura 3). Resolver usando três estratégias diferentes, nomeadamente:

----a) Sem junção de tabelas;
select idMarinheiro, nome, classificacao, 
Case
    when classificacao > (select avg(classificacao) from Marinheiro) then 'Superior à média'
    else ' '
end as observacao
from Marinheiro;

----b) Com junção de tabelas e sem cláusula WITH;
select a.idmarinheiro, a.nome, a.classificacao,
case when b.media is not null then 'Superior à media' else ' ' end obs
from marinheiro a
left join(select avg(classificacao) media from marinheiro) b
on ( a.classificacao > b.media );

----c) Com junção de tabelas e com cláusula WITH.
with b as (select avg(classificacao) media from marinheiro)
select a.idmarinheiro, a.classificacao, a.nome,
case when b.media
is not null then 'Superior à media' else ' ' end obs
from marinheiro a 
left join(select avg(classificacao) media from marinheiro) b
on ( a.classificacao > b.media );

--3) Mostrar o id e o nome dos marinheiros que não reservaram barcos (Figura 4), usando quatro estratégias diferentes, nomeadamente:  
----a) Com operador IN;
select idmarinheiro, nome
from marinheiro
where idmarinheiro not in (select idmarinheiro from reserva)
order by idmarinheiro;

----b) Com condição ANY; 
select idmarinheiro, nome
from marinheiro
where not idmarinheiro = any (select idmarinheiro from reserva) 
order by idmarinheiro;
 
----c) Com operador de conjuntos; 
select a.idmarinheiro, nome
from (select idmarinheiro from marinheiro minus select idmarinheiro from reserva) a
join marinheiro b on (a.idmarinheiro = b.idmarinheiro)
order by 1;

/*
 * António Daniel Barbosa Fernandes, [17.05.21 19:26]
 * Copyright (c) 2021.
 *
 * Programador: António Daniel Barbosa Fernandes
 *
 * UserName: anton
 * ----------------
 * INFORMAÇÕES:
 * Nome do Projeto: GITHUB 1190402
 * Módulo: GITHUB 1190402
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL10-Ex Marinheiros-Resolução Grupo.sql
 * Ficheiro:  PL10-Ex Marinheiros-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL10-Ex Marinheiros-Resolução Grupo.sql
 */

----d) Sem subqueries.
select distinct m.idmarinheiro, m.nome
from marinheiro m 
left join reserva r on m.idmarinheiro = r.idmarinheiro
where r.idmarinheiro is null
order by idmarinheiro;

--4) Mostrar as datas com mais reservas de barcos (Figura 5).
select reserva.data
from reserva
group by reserva.data
having count(*) = (select max(qtd)
from (select data, count(data) as qtd
from reserva group by data));

--5) Mostrar o número total de marinheiros que reservaram barcos com a cor vermelho e barcos com a cor verde (Figura 6).
select count(distinct a.idmarinheiro) as qtd_marinheiros
from (select *
from reserva a
join barco b on ( a.idbarco = b.idbarco )
where cor = 'verde')  a,
(select *
from reserva a
join barco b on (a.idbarco = b.idbarco) where cor = 'vermelho')  b
where a.idmarinheiro = b.idmarinheiro;