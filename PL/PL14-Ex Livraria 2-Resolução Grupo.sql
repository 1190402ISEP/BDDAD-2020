--5. Criar um script com código PL/SQL para implementar um procedimento, designado prcUniformizarStockMinEditora, 
--   para nivelar, pelo maior valor, o stock mínimo de todas as edições de livros de uma dada editora. O procedimento 
--   deve receber por parâmetro o identificador da Editora e tirar o máximo proveito do SQL. Testar adequadamente o 
--   procedimento implementado através de blocos anónimos.
CREATE OR REPLACE FUNCTION fncTotalClientes return integer
is  
    vNRTotalClientes integer;

begin
    SELECT count(*) into vNRTotalClientes 
    FROM CLIENTE ;
    if vNRTotalClientes =0 then
        return null;
    else
        return vNRTotalClientes;
    end if;
end;
/
--
begin
dbms_output.put_line(fncTotalClientes);
end;
/



--6. Criar um novo script com código PL/SQL para implementar um procedimento, designado prcNovoPrecoProximaSemanaLivrosEmIngles, 
     para inserir um novo preço nas edições de livros em idioma inglês, a aplicar a partir de um dado dia da próxima semana 
     (i.e. semana a seguir à semana da data atual). O procedimento deve receber por parâmetro, o dia de semana (e.g. 4) e a 
     percentagem de redução (e.g. -20) ou aumento (e.g. 20) do preço atual. O dia de semana deve ser representado por um número 
     inteiro entre um (i.e. domingo) e sete (i.e. sábado). A data desse dia da semana pode ser obtida através da função NEXT_DAY. 
     O procedimento deve validar o dia da semana e, no caso de ser inválido, deve levantar uma exceção própria e fornecer uma 
     mensagem apropriada. O procedimento deve recorrer a um CURSOR explícito e às instruções OPEN, FETCH e CLOSE para processar 
     o CURSOR, devendo tirar o máximo proveito do SQL. Testar adequadamente o procedimento implementado através de blocos anónimos.
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL14-Ex Livraria 2-Resolução Grupo.sql
 * Ficheiro:  PL14-Ex Livraria 2-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL14-Ex Livraria 2-Resolução Grupo.sql
 */

/* proposta de solução */



--7. Duplicar o script anterior e alterar o código de modo a processar o CURSOR com uma instrução FOR de CURSOR. 
--   Testar adequadamente o procedimento implementado através de blocos anónimos.
/* proposta de solução */



--8. Duplicar o script anterior e substituir a instrução FOR de CURSOR por uma instrução FOR de QUERY. 
--   Testar adequadamente o procedimento implementado através de blocos anónimos.
/* proposta de solução */

 












