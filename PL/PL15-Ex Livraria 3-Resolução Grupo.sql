-- 1) Criar um script para implementar um trigger sobre a tabela Cliente, designado trgClienteImpedirEliminacaoRegistos, 
--    para impedir a eliminação de registos de clientes durante o fim de semana. Numa perspetiva de legibilidade do código, 
--    todas as mensagens de erro devem ser definidas na secção EXCEPTION. Compilar e testar adequadamente o trigger implementado.
create or replace trigger trgClienteImpedirEliminacaoRegistos
    before delete on Cliente
        for each row

    declare day number;
            begin
            SELECT TO_CHAR(sysdate, 'D') into day FROM dual;
            if (day = 1 OR day=7) then
    raise_application_error(-20001,'Nao pode eliminar clientes ao fins de semana');
    END IF;
    end;
/
begin
DELETE FROM CLIENTE WHERE NIFCLIENTE=900800100;
end;
/



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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL15-Ex Livraria 3-Resolução Grupo.sql
 * Ficheiro:  PL15-Ex Livraria 3-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL15-Ex Livraria 3-Resolução Grupo.sql
 */



-- 2) Criar um novo script para implementar um trigger sobre a tabela Venda, designado trgVendaImpedirAlteracoesForaExpediente,
--    para impedir a adição ou atualização de registos com dataHora fora do horário de funcionamento da livraria. A livraria 
--    funciona de segunda a sexta, das 9H00 às 19H00. A mensagem de erro deve ser: ‘Horário de fim de semana’ ou ‘Fora do horário permitido’. 
--    Numerar adequadamente as mensagens de erro (não esquecer que já foi usado um valor no trigger implementado anteriormente). 
--    Compilar e testar adequadamente o trigger implementado.
/* proposta de solução */



-- 3) Criar um novo script para corrigir todos os registos que tenham sido registados fora do horário permitido, colocando a hora 
--    nas 18:59:59, mantendo o dia. Para tal deve escrever apenas um comando SQL. A lógica deverá ser a seguinte:
--	a) Obter a data/hora da venda sem a parte horária, ou seja, às 0 horas;
--	b) Somar a essa data um valor que represente as 18 horas 59 minutos e 59 segundos.
--    Exemplo: 2018-02-02 18:59:59; 18 horas correspondem a 18*60*60 segundos (64800s), 59 minutos correspondem a 59*60 segundos (3540s), 
--             logo, 18:59:59 correspondem a 64800+3540+59 = 68399 segundos, ou 68399/60 minutos, ou 68399/60/60 horas, ou 68399/60/60/24 dias.
/* proposta de solução */


-- 4) Criar um novo script para corrigir todos os registos que tenham sido registados no fim de semana, colocando a data na sexta-feira 
--    anterior, mantendo a hora. Para tal deve escrever apenas um comando SQL. A lógica deverá ser a obtenção da data da venda, e, no caso 
--    de ser um sábado recuar 1 dia, e se for domingo recuar 2 dias.
/* proposta de solução */



-- 5) Criar um novo script para implementar um trigger sobre a tabela PrecoEdicaoLivro, designado trgPrecoEdicaoLivroImpedirRegisto, para 
--    impedir o registo ou a alteração de um preço de uma edição de um livro, se a data inicial (dataIInicio) for anterior ou igual à data 
--    atual. Todas as eliminações devem ser impedidas. Compilar e testar adequadamente o trigger implementado.
/* proposta de solução */



-- 6) Acrescentar um novo atributo à tabela PrecoEdicaoLivro que permita representar o instante da criação/alteração de preços. Esse novo 
--    atributo é representado por uma nova coluna (a criar) chamada dataHora. Alterar o trigger desenvolvido na alínea anterior 5) para 
--    que passe a registar automaticamente o instante da criação/alteração de preços. Se um comando DML que inicia o trigger explicitar 
--    um valor para o instante da criação/alteração de preços, este deve ser ignorado pelo trigger, associando-lhe sempre a data do sistema. 
--    Compilar e testar adequadamente o trigger implementado.
/* proposta de solução */



-- 7) Criar um novo script para implementar um trigger, designado trgVendaAtualizarSaldosCartaoCliente, para atualizar o saldo atual e o 
--    saldo acumulado de um determinado cartão de cliente, quando é adicionado ou eliminado um registo na tabela Venda. Nas vendas 
--    relacionadas com os clientes que têm cartão e que são realizadas apenas durante terça ou quarta, é adicionado o valor de 5% das 
--    vendas a cada um dos saldos do cartão. Compilar e testar adequadamente o trigger implementado.
/* proposta de solução */





 












