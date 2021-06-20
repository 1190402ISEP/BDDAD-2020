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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL09-Ex Cd de Musica 2-Resolução Grupo.sql
 * Ficheiro:  PL09-Ex Cd de Musica 2-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL09-Ex Cd de Musica 2-Resolução Grupo.sql
 */

-- 1) Mostrar a quantidade de CD comprados em cada um dos locais de compra registados, de acordo com a Figura 2.
select  nvl(cd.localcompra,'desconhecido') as LOCAL_COMPRA, count (*) as QUANTIDADE_CD 
from cd 
group by localcompra;
  
-- 2) Copiar e alterar o comando da alínea anterior, de forma a mostrar o resultado por ordem decrescente da 
--    quantidade de CD comprados.
select  nvl(cd.localcompra,'desconhecido') as "LOCAL_COMPRA", (count (CODCD)) as "QUANTIDADE_CD"
from cd
group by localcompra
order by count (CODCD) desc;

NELSON;
- ou order by 2 desc;
- aspas são necessárias quando há espeços em branco

--3) Mostrar a quantidade de editoras diferentes que produziram os CD comprados, em cada um dos locais de compra. 
--   O resultado apresentado deve estar de acordo com a Figura 4. 
select nvl(cd.localcompra,'desconhecido') as LOCAL_COMPRA,
(count (distinct idEditora)) as QUANTIDADE_EDITORAS
from cd
group by localcompra
order by count (distinct idEditora);

NELSON:
select 
    nvl(cd.localcompra,'desconhecido') as LOCAL_COMPRA,
    count (distinct idEditora) as QUANTIDADE_EDITORAS
from cd
group by localcompra
order by 2;


--4) Copiar e alterar o comando da alínea 2, de forma a mostrar também, para cada local de compra conhecido, o valor 
--   total pago e o maior valor pago. O resultado apresentado deve estar de acordo com a Figura 5.
select
    cd.localcompra as LOCAL_COMPRA, 
    count (distinct idEditora) as QUANTIDADE_EDITORAS, 
    sum(valorpago) as "VALOR TOTAL PAGO", 
    max(valorpago) as "Maior valor Pago"
from cd
group by localcompra
having cd.localcompra<>'null'
order by max(valorpago) desc;

NELSON:
select 
    localcompra as LOCAL_COMPRA, 
    count (distinct idEditora) as QUANTIDADE_EDITORAS, 
    sum(valorpago) as "VALOR TOTAL PAGO",
    max(valorpago) as "Maior valor Pago" 
from cd 
where localcompra is not null 
group by localcompra  
order by 2 desc;


--5) Mostrar, para cada CD e respetivos intérpretes, a quantidade de músicas do CD em que o intérprete participa. Além 
--   da quantidade referida, também deve ser apresentado o código do CD e o intérprete, de acordo com a Figura 6.
select
    m.codCd as COD_CD,
    m.interprete as INTERPRETE,
    count (m.interprete) as QUANTIDADE_MUSICAS
from musica m
group by interprete, codcd
order by m.codcd;

--6) Copiar o comando da alínea 1 e alterar de modo a mostrar apenas os locais de compra com a quantidade superior a 2.
/* proposta de solução */  
select
    nvl(cd.localcompra,'desconhecido') as LOCAL_COMPRA,
    count (CODCD) as QUANTIDADE_CD
from cd group 
by localcompra 
having count (CODCD)>2;

--7) Mostrar os locais de compra, cuja média do valor pago por CD é inferior a 10, juntamente com o respetivo total do 
--   valor pago.  
select
    cd.localcompra as LOCAL_COMPRA,
    avg(valorpago) as "VALOR TOTAL PAGO"
from cd 
group by localcompra 
having cd.localcompra<>'null' and avg(valorpago)<10 
order by max(valorpago) desc;

NELSON:
select
    cd.localcompra as LOCAL_COMPRA,
    sum(valorpago) as "VALOR TOTAL PAGO"
from cd 
where localcompra is not null
group by localcompra 
having avg(valorpago)<10;

--8) Mostrar o valor total pago nos locais de compra, cuja quantidade de CD comprados é superior a 2. O local de compra 
--   também deve ser visualizado.
select
    cd.localcompra as LOCAL_COMPRA, 
    sum(valorpago) as TOTAL 
from cd 
group by localcompra 
having cd.localcompra<>'null' and count(codcd)>2;

NELSON:
select
    cd.localcompra as LOCAL_COMPRA, 
    sum(valorpago) as TOTAL 
from cd 
group by localcompra 
having count(*)>2;

--9) Copiar o comando da alínea 5 e alterar de modo a mostrar apenas o intérprete e o código do CD em que o intérprete 
--   participa apenas em 1 música. O resultado deve ser apresentado por ordem crescente do código do CD e, em caso de 
--   igualdade, por ordem alfabética do intérprete.
select
    m.codCd as COD_CD,
    m.interprete as INTERPRETE 
from musica m 
group by interprete, codcd 
having count (interprete)=1 
order by m.codcd, m.interprete;

NELSON:
- ou having count(*)=1
- ou order by 1,2

--10) Copiar o comando da alínea anterior e alterar de modo a mostrar apenas os intérpretes começados por E ou L 
--    (letras maiúsculas ou minúsculas).
select
    distinct m.interprete as INTERPRETE
from musica m 
where REGEXP_LIKE (interprete, '^[:EL:]') 
group by interprete, codcd 
having count (interprete)=1
order by m.interprete;

NELSON:
where REGEXP_LIKE (interprete, '^[EL]', 'i')

--11) Mostrar os dias de semana em que foram comprados, em locais conhecidos, pelo menos dois CD. O resultado apresentado 
--    deve estar de acordo com a Figura 12.
SELECT 
    TO_CHAR(dataCompra,'day') DIA_SEMANA,
    COUNT (codCD) QTD_CD_COMPRADOS
FROM cd 
WHERE localCompra IS NOT NULL
GROUP BY TO_CHAR(dataCompra,'day') 
HAVING COUNT (codCD) >= 2 
ORDER BY DIA_SEMANA ASC;

--12) Mostrar, para cada CD, o título e a quantidade de músicas.
select 
    cd.titulo, 
    count(*) QUANTIDADE_MUSICA 
from cd 
inner join musica m 
on cd.codcd=m.codcd 
GROUP BY cd.titulo 
ORDER BY quantidade_musica desc;

--13) Mostrar, para cada CD, o código, o título e a quantidade de músicas.
SELECT 
    cd.codcd,
    cd.titulo, 
    COUNT(*)  quantidade_musica 
FROM cd 
INNER JOIN musica mus 
ON cd.codcd=mus.codcd 
GROUP BY cd.titulo,cd.codcd 
ORDER BY quantidade_musica DESC;

--14) Mostrar, para cada CD, o código, o título e a quantidade de músicas cuja duração é superior a 5.
SELECT 
    cd.codcd, 
    cd.titulo, 
    COUNT(*) AS quantidade_musica 
FROM cd 
INNER JOIN musica m 
ON cd.codcd=m.codcd 
WHERE m.duracao > 5 
GROUP BY cd.titulo,cd.codcd 
ORDER BY quantidade_musica desc, cd.titulo;

--15) Mostrar, para cada CD com menos de 6 músicas, o código, o título e a quantidade de músicas do CD.
SELECT 
    cd.codcd, 
    cd.titulo, 
    COUNT(*) quantidade_musica 
FROM cd 
INNER JOIN musica m 
ON cd.codcd=m.codcd 
GROUP BY cd.titulo,cd.codcd 
HAVING COUNT(*) < 6 
ORDER BY quantidade_musica desc, titulo asc;  

--16) Mostrar, para cada CD cujas músicas têm uma duração média superior a 4, o código, o título e a quantidade de músicas do CD.
SELECT 
    cd.codcd, 
    cd.titulo, 
    COUNT(*) quantidade_musica 
FROM cd 
INNER JOIN musica m 
ON cd.codcd=m.codcd 
GROUP BY cd.titulo,cd.codcd 
HAVING avg(m.duracao)> 4 
ORDER BY quantidade_musica DESC;

--17) Mostrar, numa coluna, o título de cada uma das músicas e o título de cada CD que tem pelo menos 3 interpretes. O 
--    resultado apresentado deve estar de acordo com a Figura 18.  
SELECT 
    cd.titulo
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd
GROUP BY cd.titulo 
HAVING COUNT(m.interprete)>2
UNION SELECT titulo 
FROM musica 
GROUP BY titulo 
ORDER BY titulo asc;

NELSON:
SELECT 
    cd.titulo
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd
GROUP BY cd.titulo 
HAVING COUNT(m.interprete)>2
UNION ALL
SELECT titulo 
FROM musica 
ORDER BY 1;

--18) Copiar e alterar o comando da alínea anterior, de modo a não mostrar os registos repetidos.
SELECT 
    cd.titulo 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd 
GROUP BY cd.titulo 
HAVING COUNT(DISTINCT(m.interprete))>2 
UNION SELECT
    titulo 
FROM musica  
GROUP BY titulo 
ORDER BY titulo asc;

NELSON:
SELECT 
    cd.titulo 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd 
GROUP BY cd.titulo 
HAVING COUNT(DISTINCT(m.interprete))>2 
UNION 
SELECT
    titulo 
FROM musica  
ORDER BY 1;

--19) Copiar e alterar o comando da alínea anterior, de modo a apresentar também o comprimento de cada título e por 
--    ordem decrescente.
SELECT 
    cd.titulo,
    LENGTH(cd.titulo)comprimento 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd 
GROUP BY cd.titulo 
HAVING COUNT(DISTINCT(m.interprete))>2 
UNION SELECT 
    titulo, 
    LENGTH(titulo)comprimento 
FROM musica  
GROUP BY titulo 
ORDER BY comprimento desc; 

NELSON:
SELECT 
    cd.titulo,
    LENGTH(cd.titulo)comprimento 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd 
GROUP BY cd.titulo 
HAVING COUNT(DISTINCT m.interprete)>2 
UNION SELECT 
    titulo, 
    LENGTH(titulo)comprimento 
FROM musica  
ORDER BY comprimento desc; 

--20) Mostrar os títulos de músicas que são iguais a títulos de CD cuja maior duração de uma música é 
--    superior a 5. A solução não deve recorrer ao uso de subqueries.
Select
    m.titulo
from Musica m 
inner join cd 
on cd.codcd=m.codcd
where (m.titulo=cd.titulo) 
INTERSECT SELECT 
    cd.titulo 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd 
GROUP BY cd.titulo,cd.codcd 
HAVING max(duracao)>5;

NELSON:
Select
    m.titulo
from Musica
INTERSECT 
SELECT 
    cd.titulo 
FROM cd 
INNER JOIN musica m 
ON cd.codcd = m.codcd  
where m.duracao > 5;