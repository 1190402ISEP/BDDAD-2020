--A.1)	Obter o produto cartesiano (i.e. CROSS JOIN) entre as tabelas Empregado e 
--EmpregadoEfetivo, de acordo com a Figura 2. 
SELECT e.idempregado, ee.idempregado from EMPREGADO e CROSS JOIN EMPREGADOEFETIVO ee;

--A.2)	Obter toda a informação dos empregados efetivos, por ordem alfabética dos 
--nomes e de acordo com a Figura 3. 
SELECT * from Empregado e inner join EMPREGADOEFETIVO ee on e.idempregado = ee.idempregado order by e.nome;

NELSON:
- mais simples com natural join

--A.3)	Obter as faltas dos empregados efetivos, de acordo com a Figura 4.
Select f.* from falta f inner join EmpregadoEfetivo ee on f.idempregado = ee.idempregado;

--A.4)	Obter as faltas dos empregados temporários, de acordo com a Figura 5.
Select  e.nome,e.nridentificacaocivil,f.* from Empregado e,falta f inner join empregadoTemporario ee on f.idempregado = ee.idempregado order by e.nome ASC,e.idempregado ASC;

NELSON:
- todas as junções de tabelas têm de ser realizadas com cláusulas JOIN. Assim não está bem: ... from empregado, falta ...

--A.5)	Obter as avaliações dos empregados temporários, de acordo com a Figura 6.
select e.nome, e.nridentificacaocivil,ed.iddepartamento, ed.datainicio,ed.datafim,a.descricao FROM empregadodepartamento ed 
INNER JOIN empregado e ON ed.idempregado = e.idempregado
INNER JOIN avaliacaoTemporario av ON ed.dataInicio = av.datainicio 
INNER JOIN avaliacao a ON av.idavaliacao = a.idavaliacao
ORDER BY e.nome asc; 

NELSON:
- a junção das tabelas avaliacaoTemporario e empregadodepartamento requer três condições de junção. Reparar que as chaves são triplas.

--A.6)	Obter o nome e o número de identificação civil de todos empregados que 
--nunca faltaram, de acordo com a Figura 7.
SELECT e.nome , e.nrIdentificacaoCivil
FROM empregado e
LEFT OUTER JOIN falta f
ON f.idempregado = e.idempregado
WHERE f.idempregado is null
ORDER BY e.nome;  

NELSON:
- LEFT OUTER JOIN ou LEFT JOIN 

--A.7)	Obter o identificador e a designação de todos os departamentos juntamente 
--com a designação do respetivo departamento do nível hierárquico superior. 
--O resultado apresentado deve estar de acordo com a Figura 8. 
SELECT d.idDepartamento, d.designacao, NVL (dns.designacao,' ') AS DEPARTAMENTO_NIVEL_SUPERIOR
From departamento d
FULL OUTER JOIN departamento dns ON dns.idDepartamento = d.idDepartamentoSuperior
WHERE d.idDepartamento IS NOT NULL
ORDER BY d.designacao desc;

NELSON:
- FULL JOIN não se justifica.
 
--A.8)	Obter pares de empregados distintos e com idades diferentes, de acordo 
--com a Figura 9. 
SELECT e.idEmpregado, e.nome, en.idEmpregado, en.nome
FROM empregado e
INNER JOIN empregado en ON EXTRACT(YEAR FROM e.dataNascimento) > EXTRACT(YEAR FROM en.datanascimento)
ORDER BY e.idEmpregado asc, en.idEmpregado asc;

NELSON:
 - idade = TRUNC(MONTHS_BETWEEN(SYSDATE-dataNascimento)/12)
 
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL08-Ex Empregados-Resolução Grupo.sql
 * Ficheiro:  PL08-Ex Empregados-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL08-Ex Empregados-Resolução Grupo.sql
 */

--B.1)	Obter o nome e o número de identificação civil de todos os empregados que
--tiveram pelo menos uma avaliação "MUITO BOM". O resultado apresentado deve estar de acordo com a Figura 10.
SELECT DISTINCT e.nome, e.nridentificacaocivil from avaliacao a INNER JOIN avaliacaoTemporario ats ON a.idavaliacao=ats.idavaliacao
INNER JOIN avaliacaoefetivo aes ON a.idavaliacao= aes.idavaliacao 
INNER JOIN empregado e ON e.idempregado = ats.idempregado OR e.idempregado = aes.idempregado WHERE a.descricao = 'MUITO BOM' 
ORDER BY e.nridentificacaocivil asc;

NELSON:
- devia ser case insensitive - upper(a.descricao) ... ou lower(descricao)
- NATURAL JOIN em vez de INNER JOIN simplifica
- com operador UNION a query é mais fácil de compreeender 
 
--B.2)	Obter a descrição das avaliações que são comuns a empregados efetivos e 
--temporários, de acordo com a Figura 11.
SELECT DISTINCT a.descricao
FROM avaliacao a
INNER JOIN avaliacaoTemporario at
ON a.idAvaliacao = at.idAvaliacao
INNER JOIN avaliacaoefetivo ae
ON a.idavaliacao = ae.idavaliacao
ORDER BY a.descricao asc;

NELSON:
- NATURAL JOIN em vez de INNER JOIN simplifica
- com operador INTERSECT a query é mais fácil de compreeender 
 
--B.3)	Obter o nome e o número de identificação civil dos empregados efetivos que 
--tiveram sempre classificação “MUITO BOM”, de acordo com a Figura 12.
/* proposta de solução */

NELSON:
- com operador MINUS
 
--B.4)	Obter o nome e o número de identificação civil dos empregados efetivos 
--cujas férias têm todas duração superior a 15 dias. 
--O resultado apresentado deve estar de acordo com a Figura 13.
SELECT DISTINCT e.nome, e.nridentificacaocivil from ferias fe
        inner join empregado e on fe.idempregado = e.idempregado 
        where ((select count(fe.idempregado) from ferias fe where fe.idempregado=e.idempregado)=(select count(fe.idempregado) from ferias fe where fe.datafim-fe.datainicio>15 and fe.idempregado=e.idempregado))
        order by e.nome asc;

NELSON: 
 - enunciado pede para não usar subqueries!
