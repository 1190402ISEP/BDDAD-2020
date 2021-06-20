
SET SERVEROUTPUT ON;

-- 5. Criar um script com código PL/SQL para implementar uma função, designada fncTotalClientes, para retornar o número total de clientes. 
--    Caso não existam clientes registados, a função deve retornar o valor NULL. Testar adequadamente a função implementada, através de blocos anónimos. 
--    Para visualizar o resultado, executar o comando SET SERVEROUTPUT ON.

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

-- 6. Criar um novo script PL/SQL para implementar uma função, designada fncTemLivrosEditora, para verificar se existem livros de uma dada editora em stock. 
--    A função deve receber, por parâmetro, o identificador da editora e tem de retornar um valor booleano, true ou false. Se o parâmetro fornecido for inválido, 
--    a função deve retornar o valor NULL, usando o mecanismo de exceções. Testar adequadamente a função implementada, através de blocos anónimos.

CREATE OR REPLACE FUNCTION fncTemLivrosEditora(pIdEditora Editora.idEditora%TYPE) return boolean
is  
    vContagem integer;
    vIdEditora Editora.ideditora%TYPE;
    
begin
   
    SELECT ideditora into vIdEditora from Editora  where ideditora = pIdEditora;
    
    SELECT count(*) into vContagem
    FROM EDICAOLIVRO el where el.ideditora= pIdEditora  ;

    return vContagem>0;
    
EXCEPTION
    when No_Data_Found then 
        return null;
end;
/
--
begin
-- Test Null
    if (fncTemLivrosEditora(3000) is null) then
        dbms_output.put_line('Nulo');
    elsif (fncTemLivrosEditora(3000))then
        dbms_output.put_line('True');
    else
        dbms_output.put_line('False');

    end if;
 --Test True   
     if (fncTemLivrosEditora(1500) is null) then
        dbms_output.put_line('Nulo');
    elsif (fncTemLivrosEditora(1500))then
        dbms_output.put_line('True');
    else
        dbms_output.put_line('False');

    end if;
    
--Test False
 if (fncTemLivrosEditora(1700) is null) then
        dbms_output.put_line('Nulo');
    elsif (fncTemLivrosEditora(1700))then
        dbms_output.put_line('True');
    else
        dbms_output.put_line('False');

    end if;

end;
/


-- 7. Criar um novo script PL/SQL para implementar uma função, designada fncClienteInfo, para retornar a informação pessoal de um dado cliente, recebido por parâmetro. 
--    Se o parâmetro fornecido for inválido, a função deve retornar o valor NULL, usando o mecanismo de exceções. Testar adequadamente a função implementada, através 
--    de blocos anónimos.
CREATE OR REPLACE FUNCTION fncClienteInfo(pNifClienteProcura Cliente.nifcliente%TYPE) return  cliente%ROWTYPE
is  
    vInfo  cliente%ROWTYPE;
begin
    
    SELECT * into vInfo
    FROM CLIENTE where NIFCLIENTE= pNifClienteProcura ;
    
    return vInfo;
   

EXCEPTION
    when No_Data_Found then 
        return null;
        
end;
/
--

begin
-- Test Null
    if (fncClienteInfo(900800100).nome  is null) then
        dbms_output.put_line('Nulo');
    else 
            dbms_output.put_line(fncClienteInfo(900800100).nome);

    end if;
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/PL/PL13-Ex Livraria-Resolução Grupo.sql
 * Ficheiro:  PL13-Ex Livraria-Resolução Grupo.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: PL13-Ex Livraria-Resolução Grupo.sql
 */






-- 8. Criar um novo script PL/SQL para implementar uma função, designada fncStockAnoEditora, para retornar o stock dos livros editados por uma dada editora num dado ano.
--    A função deve receber, por parâmetro, o identificador da editora e o ano. Este último parâmetro deve ser opcional na invocação da função e o seu valor por omissão 
--    deve ser o ano atual. Se qualquer parâmetro fornecido for inválido, a função deve retornar o valor NULL, usando o mecanismo de exceções. Testar adequadamente a função 
--    implementada, através de blocos anónimos.
/* proposta de solução */




-- 9. Criar um novo script PL/SQL para implementar uma função, designada fncPrecoVenda, para retornar o preço aplicado a uma dada venda, recebida por parâmetro. Se o 
--    parâmetro fornecido for inválido, a função deve retornar o valor NULL, usando o mecanismo de exceções. Testar adequadamente a função implementada, através de 
--    blocos anónimos.
/* proposta de solução */


 




 












