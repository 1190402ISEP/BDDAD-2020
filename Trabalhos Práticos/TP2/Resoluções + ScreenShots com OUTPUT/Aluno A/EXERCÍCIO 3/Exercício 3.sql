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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno A/EXERCÍCIO 3/Exercício 3.sql
 * Ficheiro:  Exercício 3.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 3.sql
 */

SET SERVEROUTPUT ON;
--3.Implementar um trigger designado trgEpocasNaoSobrepostas que garanta que a
--inser��o/altera��o de uma �poca n�o conduz a sobreposi��o entre �pocas. Testar
--adequadamente o trigger implementado.
create or replace TRIGGER trgEpocasNaoSobrepostas

    BEFORE INSERT OR UPDATE ON Epoca
    
FOR EACH ROW
    DECLARE
    PRAGMA autonomous_transaction;
    
BEGIN

for r
in (SELECT * FROM epoca where epoca.id!=:new.id)
    loop
    if ((:new.data_ini >= r.data_ini and :new.data_ini <=r.data_fim ) or (:new.data_fim >= r.data_ini and :new.data_ini <=r.data_fim ))THEN
    --Se a nova data estiver entre datas j� existentes � lan�ada a exce��o e n�o � permitido atualizar/inserir a nova informa��o
            raise_application_error(-20007,'N�o podem existir sobreposi��es de �pocas!');
END IF;
    end loop;
    
END trgEpocasNaoSobrepostas ;
/
ALTER TRIGGER trgEpocasNaoSobrepostas ENABLE;
SELECT * from Epoca;

--TESTAR INSERT FAIL
begin
insert into epoca(id, nome, data_ini, data_fim) values(6, '�poca 1', to_date('2020-01-01', 'yyyy-mm-dd'), to_date('2020-03-31', 'yyyy-mm-dd'));
end ;
/
--TESTAR UPDATE FAIL
begin
UPDATE EPOCA SET DATA_INI = (to_date('2020-01-02', 'yyyy-mm-dd')) WHERE ID=3;
end ;
/

--TESTAR INSERT CORRECT
begin
insert into epoca(id, nome, data_ini, data_fim) values(40, '�poca 1', to_date('2023-01-01', 'yyyy-mm-dd'), to_date('2023-03-31', 'yyyy-mm-dd'));
end ;
/
--TESTAR UPDATE CORRECT
begin
UPDATE EPOCA SET DATA_INI = (to_date('2019-01-02', 'yyyy-mm-dd')) WHERE ID=4;
end ;
/

SELECT * FROM EPOCA;

ALTER TRIGGER trgEpocasNaoSobrepostas DISABLE;

