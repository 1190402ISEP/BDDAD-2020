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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP1/SQL/IT1-EXERCICIOS.sql
 * Ficheiro:  IT1-EXERCICIOS.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: IT1-EXERCICIOS.sql
 */

-- PARTE I
-- a) Apresentar todos os pedidos de interven��o em aberto (interven��o ainda n�o 
--registada) alocados a funcion�rios de manuten��o que n�o fizeram nenhuma
--interven��o (registo) nas �ltimas 48 hora;
------------------------------------------------
-- Resolu��o:
SELECT
    inter.*
FROM intervencao inter
WHERE UPPER(inter.estadoIntervencao) LIKE 'NAO RESOLVIDO'
    AND UPPER(inter.realizacao) LIKE 'REPARACAO'
    AND inter.funcionarionif NOT IN (SELECT 
                                        DISTINCT i.funcionarionif
                                    FROM intervencao i
                                    WHERE i.estadoIntervencao LIKE 'Resolvido'
                                        AND i.dataintervencao>(SELECT systimestamp-3 FROM dual));

-- b) Apresentar a data, a hora e o nome dos clientes que reservaram quartos
--somente durante o m�s de Abril e Junho deste ano. No caso de algum cliente ter
--reservado um quarto do tipo suite, dever� apresentar a localidade desse cliente
--numa coluna intitulada �Zona do Pa�s�. O resultado dever� ser apresentado por
--ordem alfab�tica do nome de cliente e por ordem descendente da data e hora da
--reserva;
------------------------------------------------
-- Resolu��o:
SELECT DISTINCT
    c.nome,
    r.datareserva,
    r.horareserva,
    CASE
        WHEN r.idquarto
            IN (SELECT idquarto FROM Quarto WHERE idtipoquarto LIKE 'Suite')
            THEN (SELECT e.localidade FROM endereco e WHERE c.idendereco=e.idendereco) 
        ELSE ' '
    END AS localidade
FROM reserva r INNER JOIN cliente c ON r.nif=c.nif
WHERE EXTRACT(MONTH FROM r.datareserva)>3
    AND EXTRACT(MONTH FROM r.datareserva)<7
ORDER BY c.nome, r.datareserva desc;

-- PARTE II
-- a) Apresentar o nome, a localidade e o nome do concelho dos clientes que j�
--estiveram alojados nos quartos j� reservados pelo cliente cujo nome � Jos� Silva,
--que � do concelho de Vila Real. Considere s� as reservas �finalizadas� do cliente
--Jos� Silva;
------------------------------------------------
-- Resolu��o:
SELECT
    c.nome,
    e.localidade,
    e.concelho
FROM cliente c INNER JOIN endereco e ON c.idendereco=e.idendereco
WHERE c.nome IN (SELECT
                    c.nome
                FROM cliente c INNER JOIN reserva r ON c.nif=r.nif
                WHERE r.datasaida<(select systimestamp from dual)
                    AND r.idreserva IN (SELECT 
                                            r.idreserva
                                        FROM reserva r 
                                        WHERE r.idquarto IN (SELECT 
                                                                r.idquarto 
                                                            FROM reserva r 
                                                            WHERE r.nif=(SELECT 
                                                                            c.nif 
                                                                        FROM cliente c
                                                                        WHERE UPPER(c.nome) LIKE 'JOSE SILVA'))))
    AND UPPER(c.nome) NOT LIKE 'JOSE SILVA';

-- b) Apresentar por cada m�s, apenas para os �ltimos 6 meses anteriores � data
--atual, qual a camareira que mais interven��es fez em quartos cuja dura��o de
--estadia foi superior � m�dia das estadias agrupadas por tipo de quarto;
------------------------------------------------
-- Resolu��o:

Select
  c.NIF 
 FROM camareira c inner join Intervencao w on c.Nif = w.funcionarioNIF
 ;


-- PARTE III
-- a) Apresentar por andar, o quarto e o tipo de quarto, que teve o maior n�mero de
--reservas. Dever�o ser exclu�dos todos os quartos em que o n�mero de reservas
--� inferior a 2 e s�o do tipo �single�. N�o incluir reservas canceladas;
------------------------------------------------
-- Resolu��o:
SELECT 
    a.idandar,
    q.idquarto,
    q.idtipoquarto
FROM andar a, quarto q
WHERE a.idandar = q.idandar
    AND UPPER(q.idtipoquarto) NOT LIKE 'SINGLE'
    AND (SELECT 
            COUNT(*) AS QUANTIDADE
        FROM reserva r
        WHERE r.idquarto=q.idquarto)/*-(SELECT
                                            COUNT(*)
                                        FROM (SELECT
                                                    er.idreserva
                                                FROM estadoreserva er
                                                INNER JOIN reserva r ON er.idreserva=r.idreserva
                                                                        AND r.idquarto=q.idquarto
                                                                        AND UPPER(er.descricaoestado) LIKE 'CANCELADA'))*/
        =(SELECT
            MAX(soma) AS MAXIMO
        FROM (SELECT
                r.idquarto,
                COUNT(*) AS SOMA
            FROM reserva r INNER JOIN quarto q ON UPPER(q.idtipoquarto) NOT LIKE 'SINGLE'
                                                AND r.idquarto=q.idquarto
                                                AND q.idandar=a.idandar
            GROUP BY r.idquarto))/*-(SELECT
                                        COUNT(*)
                                    FROM (SELECT
                                                er.idreserva
                                            FROM estadoreserva er
                                            INNER JOIN reserva r ON er.idreserva=r.idreserva
                                                                    AND r.idquarto=q.idquarto
                                                                    AND UPPER(er.descricaoestado) LIKE 'CANCELADA'))*/
    AND (SELECT 
            COUNT(*) AS QUANTIDADE
        FROM reserva r
        WHERE r.idquarto=q.idquarto)/*-(SELECT
                                        er.idreserva
                                    FROM estadoreserva er
                                    INNER JOIN reserva r ON er.idreserva=r.idreserva
                                                            AND r.idquarto=q.idquarto
                                                            AND UPPER(er.descricaoestado) LIKE 'CANCELADA')*/>2;

-- b) Apresentar os clientes que ocuparam quartos do tipo suite na �ltima �poca alta
--e consumiram os dois produtos com maior consumo nos �ltimos dois anos. O
--resultado deve ser ordenado por ordem decrescente do valor total do consumo;
------------------------------------------------
-- Resolu��o:
select 
    c.*,
    tab2.* 
from Cliente c inner join (select 
                                r.nif,
                                r.idreserva,
                                r.idconta,
                                tab1.* 
                            from Reserva r inner join (select 
                                                            q.idquarto,
                                                            tq.idtipoquarto 
                                                        from Quarto q inner join TipoQuarto tq on q.idtipoquarto=tq.idtipoquarto 
                                                        where upper(tq.idtipoquarto) like 'SUITE'
                                                        
                                                        )tab1
                            on r.idquarto = tab1.idquarto where  r.dataEntrada >(select eano.datainicio from EpocaAno eano where upper(eano.descricaoepoca) like 'ALTA')
                                                        and r.dataSaida < (select eano.dataFim from EpocaAno eano where upper(eano.descricaoepoca) like 'ALTA')
                                                        ) tab2 
on c.nif=tab2.nif where tab2.idconta in 
(select c.idConta from Consumo c where c.descproduto in 
(SELECT * FROM (SELECT c.descproduto from Consumo c group by c.descproduto order by count (c.descproduto)desc) where ROWNUM < 3) )
;





