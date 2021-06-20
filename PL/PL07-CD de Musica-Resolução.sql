--Resolução

-- 1) Mostrar todos os dados da tabela CD;
select * from CD;

-- 2) Mostrar todos os dados da tabela Musica.
select * from MUSICA;
--#### A.Projeção ####################################################################################################################

-- 1) Mostrar o título e a data de compra de todos os CD;
select TITULO , DATACOMPRA from CD;

-- 2) Mostrar a data de compra de todos os CD;
select DATACOMPRA from CD;
-- 3) Mostrar o resultado da alínea anterior, mas sem registos repetidos;
select DISTINCT DATACOMPRA from CD;
-- 4) Mostrar o código dos CD e os respetivos intérpretes, sem registos repetidos;
select DISTINCT CODCD, INTERPRETE from MUSICA;

-- 5) Mostrar o resultado anterior com a primeira coluna intitulada "Código do CD"; 
select DISTINCT CODCD  "Código do CD", INTERPRETE from MUSICA;

-- 6) Mostrar o título, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA é calculado de acordo com a 
--    seguinte fórmula: valor do IVA = (valor pago * 0.23)/1.23.   
select TITULO,VALORPAGO,round((VALORPAGO*0.23)/1.23 ,2) "Valor do IVA" from CD; 


--#### B.Seleção #####################################################################################################################

--1) Mostrar todos os dados das músicas do CD com o código 2;
select * from MUSICA where codcd =2;
--2) Mostrar todos os dados das músicas que não pertencem ao CD com o código 2;
select * from MUSICA where codcd !=2;

--3) Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja superior a 5;
select * from MUSICA where codcd =2 and duracao >5;

--4) Mostrar todos os dados das músicas do CD com o código 2 cuja duração pertença ao intervalo [4,6];
select * from MUSICA where codcd =2 and duracao between 4 AND 6;

--5) Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja inferior a 4 ou superior a 6;
select * from MUSICA where codcd =2 and duracao NOT between 4 AND 6;

--6) Mostrar todos os dados das músicas com o número: 1, 3, 5 ou 6;
select * from MUSICA where NRMUSICA IN (1,3,5,6);

--7) Mostrar todos os dados das músicas com o número diferente de 1, 3, 5 e 6;
select * from MUSICA where NRMUSICA NOT IN(1,3,5,6);

--8) Mostrar todos os dados das músicas cujo intérprete é uma orquestra;
select * from MUSICA where upper(interprete) like 'ORQUESTRA%';
--9) Mostrar todos os dados das músicas cujo nome do intérprete tem a letra Y;
select * from MUSICA where upper(interprete) LIKE '%Y%';

--10) Mostrar todos os dados das músicas cujo nome termina com DAL?, sendo ? qualquer caráter;
select * from MUSICA where upper(titulo) LIKE '%DAL_';

--11) Mostrar todos os dados das músicas cujo título tem o caráter %;
select * from MUSICA where upper(titulo) like '%@%%' ESCAPE '@';

--12) Mostrar todos os dados das músicas cujo título é iniciado pela letra B, D ou H;
/* solução aqui*/
select * from MUSICA where REGEXP_LIKE(titulo,'^[:BDH:]') ;

NELSON: where regexp_like(titulo, '^[bdh]', 'i')


--13) Mostrar todos os dados dos CD sem o local de compra registado;
select * from CD where LOCALCOMPRA  IS null;
--14) Mostrar todos os dados dos CD com o local de compra registado.
select * from CD where LOCALCOMPRA  IS NOT null;	

--#### C.Projeção e Seleção ##########################################################################################################

--1) Mostrar os títulos dos CD comprados na FNAC;
select * from CD where upper(LOCALCOMPRA) like 'FNAC';	

--2) Mostrar os títulos dos CD que não foram comprados na FNAC.
select * from CD where upper(LOCALCOMPRA)  NOT like 'FNAC' or LOCALCOMPRA is null ;	

--#### D.Ordenação ###################################################################################################################

--1) Mostrar os títulos dos CD que não foram comprados na FNAC, por ordem alfabética inversa; 
SELECT titulo FROM cd WHERE localcompra NOT like 'FNAC' or localCompra IS NULL ORDER BY titulo DESC; 

NELSON: ou - order by 1 desc

--2) Mostrar o título e a data de compra dos CD, por ordem alfabética do título do CD;
SELECT titulo,dataCompra FROM cd ORDER BY titulo ASC;

--3) Mostrar o título e a data de compra dos CD, por ordem descendente da data de compra do CD;
SELECT titulo,dataCompra FROM cd ORDER BY dataCompra DESC;

--4) Mostrar o título e o local de compra dos CD, por ordem ascendente do local de compra do CD;
SELECT titulo,localCompra FROM cd ORDER BY localCompra ASC;

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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL07-CD de Musica-Resolução.sql
 * Ficheiro:  PL07-CD de Musica-Resolução.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL07-CD de Musica-Resolução.sql
 */

--5) Mostrar o resultado da alínea anterior, mas por ordem descendente do local de compra do CD;
SELECT titulo,localCompra FROM cd ORDER BY localCompra DESC;

--6) Mostrar o título, o valor pago e o respetivo valor do IVA dos CD, por ordem decrescente do IVA;
SELECT titulo,valorPago,trunc((valorPago*0.23)/1.23,2) IVA_PAGO FROM cd ORDER BY IVA_PAGO DESC;

--7) Mostrar o título do CD por ordem descendente da data de compra e, no caso da igualdade de datas, por ordem alfabética do título.
SELECT titulo,dataCompra FROM cd ORDER BY dataCompra DESC;

--#### E.Funções de Agregação #######################################################################################################

--1) Mostrar a quantidade de músicas;
SELECT COUNT(*) "QTD MÚSICAS" FROM musica;

--2) Mostrar a quantidade de locais de compra distintos;
SELECT COUNT(DISTINCT localCompra) "QTD_LOCAIS_COMPRA" FROM CD;

NELSON: aspas obrigatórias apenas quando o novo nome da coluna tem espaços em branco.

--3) Mostrar o total gasto com a compra de todos os CD, o maior e o menor valor pago por um CD;
SELECT SUM(valorPago) "TOTAL",MAX(valorPago) "MAIOR",MIN(ValorPago) "MENOR" FROM CD;

--4) Mostrar a média da duração de todas as músicas;
SELECT TRUNC(AVG(duracao),2) "DURAÇÃO_MÉDIA" FROM musica;

--5) Mostrar o total do valor pago na FNAC;
SELECT SUM(valorPago)"TOTAL_FNAC" FROM cd WHERE (localCompra LIKE 'FNAC');

NELSON: WHERE UPPER(localCompra) LIKE 'FNAC'

--6) Mostrar a diferença entre o maior e o menor valor pago na FNAC.
SELECT max(valorPago)-min(valorPago) "DIFERENÇA_FNAC" FROM cd WHERE (localCompra LIKE 'FNAC');


