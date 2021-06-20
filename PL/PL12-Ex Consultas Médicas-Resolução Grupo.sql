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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL12-Ex Consultas Médicas-Resolução Grupo.sql
 * Ficheiro:  PL12-Ex Consultas Médicas-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL12-Ex Consultas Médicas-Resolução Grupo.sql
 */

-- 1) Mostrar o nome dos médicos que receitaram mais de três medicamentos em cada uma das suas consultas (Figura 2).
--    O resultado deve ser apresentado por ordem alfabética do nome dos médicos.
Select m.nome from Medico m
where m.idMedico IN (select distinct idmedico from consulta c 
            where (select count(*) from Medicamentoreceitado mr where mr.idconsulta = c.idconsulta) > 3
            and (select count(c.idmedico) from Consulta) > 1);


--2) Mostrar o nome dos médicos, que receitaram sempre o mesmo número de medicamentos em todas as suas consultas, 
--   juntamente com esse número (Figura 3). O resultado deve ser apresentado por ordem alfabética do nome dos médicos.
/* proposta de solução */



--3) Mostrar a designação das especialidades juntamente com a respetiva data de consultas em que tiveram, há mais de 
--   dois anos, o maior número de consultas depois das 14H30. Apresentar também as respetivas horas da primeira e da 
--   última consulta, bem como o intervalo de tempo entre essas duas consultas. O resultado deve ser apresentado por 
--   ordem alfabética da designação da especialidade e por ordem ascendente da data, de acordo com a Figura 4.
/* proposta de solução */



--4) Mostrar o id e o nome dos médicos que são chefes, juntamente com o seu número total de médicos subordinados e 
--   número médio de consultas dos médicos subordinados. Apresentar o resultado ordenado pelo nome, de acordo com a Figura 5.
/* proposta de solução */



--5) Mostrar as localidades onde o respetivo número de médicos residentes é superior à média e onde cada um desses médicos 
--   consultou pacientes residentes na sua localidade. Apresentar também a correspondente percentagem do número de médicos 
--   relativa ao número total de médicos, de acordo com a Figura 6.
/* proposta de solução */