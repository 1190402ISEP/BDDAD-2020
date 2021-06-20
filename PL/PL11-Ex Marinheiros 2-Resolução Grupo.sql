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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL11-Ex Marinheiros 2-Resolução Grupo.sql
 * Ficheiro:  PL11-Ex Marinheiros 2-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL11-Ex Marinheiros 2-Resolução Grupo.sql
 */

-- 1) Mostrar o id, o nome e a quantidade de reservas de barcos dos marinheiros registados na BD, por ordem decrescente da quantidade de reservas (Figura 2). Resolver usando duas estratégias diferentes, nomeadamente:
-- a) Com junção de tabelas e sem subqueries;
select m.idmarinheiro, m.nome, COUNT(r.idmarinheiro) qtd
from marinheiro m full join reserva r on m.idmarinheiro=r.idmarinheiro
group by m.idmarinheiro, m.nome
order by qtd desc;

-- b) Sem junção de tabelas. 
select m.idMarinheiro, m.nome, (select count(*) from Reserva r where r.idmarinheiro=m.idmarinheiro) Qtd
from Marinheiro m
group by m.idMarinheiro, m.nome
order by Qtd desc;

    
--2) Mostrar o id dos marinheiros cuja quantidade de reservas de um barco seja superior à quantidade média de reservas desse barco (Figura 3). Além disso, o resultado deve também incluir o id do barco e a quantidade de reservas.
/* proposta de solução */


--3) Copiar e alterar o comando do ponto 1b) de modo a mostrar o id e o nome dos marinheiros cuja quantidade de reservas está no top 3 do ranking dessa quantidade. O resultado apresentado deve estar de acordo com a Figura 4.
/* proposta de solução */

--4) Mostrar o nome dos marinheiros que reservaram todos os barcos com a designação Interlake (Figura 5), usando três estratégias diferentes, nomeadamente:
--a) Inclusão de conjuntos (i.e. diferença de conjuntos igual a vazio);
/* proposta de solução */

     
--b) Comparação de cardinalidades (i.e. quantidades);
/* proposta de solução */


--c) Quantificação (i.e. com operador EXISTS).
/* proposta de solução */
