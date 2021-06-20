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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno B/EXERCÍCIO 4/Exercício 4.sql
 * Ficheiro:  Exercício 4.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 4.sql
 */

SET SERVEROUTPUT ON;
-----------------------------------------------------------------------------------
-- Exercicio 4:
CREATE OR REPLACE FUNCTION fncObterRegistoMensalCamareira(pMes INTEGER, pAno INTEGER DEFAULT EXTRACT(YEAR FROM SYSDATE)-1) RETURN SYS_REFCURSOR 
IS
    vMinYear INTEGER;
    vDados SYS_REFCURSOR;
BEGIN
    IF(0 > pMes OR pMes > 12) THEN
        raise_application_error(-20001, 'M�s inv�lido!');
    END IF;
    
    SELECT EXTRACT(YEAR FROM aux.data) INTO vMinYear
    FROM (SELECT MIN(lcc.data_registo) AS data
            FROM linha_conta_consumo lcc) aux;
    
    IF(vMinYear > pAno OR pAno > EXTRACT(YEAR FROM SYSDATE)) THEN
        raise_application_error(-20001, 'Ano inv�lido!');
    END IF;
    
    OPEN vDados FOR
        SELECT 
            lcc.id_camareira as ID, 
            func.nome, 
            SUM(lcc.quantidade * lcc.preco_unitario) as Valor, 
            MIN(lcc.data_registo) as Primeiro_Registo, 
            MAX(lcc.data_registo) as Ultimo_Registo,
            EXTRACT(DAY FROM LAST_DAY(MAX(lcc.data_registo))) - COUNT(*) as Dias_Sem_Registo
        FROM linha_conta_consumo lcc, funcionario func
        WHERE lcc.id_camareira = func.id AND EXTRACT(MONTH FROM lcc.data_registo) = pMes AND EXTRACT(YEAR FROM lcc.data_registo) = pANo
        GROUP BY lcc.id_camareira, func.nome;
    RETURN (vDados);
END;
/

-----------------------------------------------------------------------------------
-- Testes
-- Mes inv�lido
DECLARE
  v_list SYS_REFCURSOR;
  v_camareira_id   camareira.id%TYPE;
  v_name funcionario.nome%TYPE;
  v_total NUMBER;
  v_data_primeiro DATE;
  v_data_ultimo DATE;
  v_total_dias NUMBER;
BEGIN 
  v_list := fncObterRegistoMensalCamareira(15, 2020);
  LOOP 
    FETCH v_list
    INTO  v_camareira_id, v_name, v_total, v_data_primeiro, v_data_ultimo, v_total_dias;
    EXIT WHEN v_list%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_camareira_id || ' |-| ' || v_name || ' |-| ' || v_total || ' |-| ' || v_data_primeiro || ' |-| ' || v_data_ultimo || ' |-| ' || v_total_dias);
  END LOOP;
  CLOSE v_list; 
END;
/

-- Ano inv�lido
DECLARE
  v_list SYS_REFCURSOR;
  v_camareira_id   camareira.id%TYPE;
  v_name funcionario.nome%TYPE;
  v_total NUMBER;
  v_data_primeiro DATE;
  v_data_ultimo DATE;
  v_total_dias NUMBER;
BEGIN 
  v_list := fncObterRegistoMensalCamareira(3, 2021);
  LOOP 
    FETCH v_list
    INTO  v_camareira_id, v_name, v_total, v_data_primeiro, v_data_ultimo, v_total_dias;
    EXIT WHEN v_list%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_camareira_id || ' |-| ' || v_name || ' |-| ' || v_total || ' |-| ' || v_data_primeiro || ' |-| ' || v_data_ultimo || ' |-| ' || v_total_dias);
  END LOOP;
  CLOSE v_list;  
END;
/

--Ano e mes v�lido
DECLARE
  v_list SYS_REFCURSOR;
  v_camareira_id   camareira.id%TYPE;
  v_name funcionario.nome%TYPE;
  v_total NUMBER;
  v_data_primeiro DATE;
  v_data_ultimo DATE;
  v_total_dias NUMBER;
BEGIN 
  v_list := fncObterRegistoMensalCamareira(3, 2020);
  LOOP 
    FETCH v_list
    INTO  v_camareira_id, v_name, v_total, v_data_primeiro, v_data_ultimo, v_total_dias;
    EXIT WHEN v_list%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_camareira_id || ' |-| ' || v_name || ' |-| ' || v_total || ' |-| ' || v_data_primeiro || ' |-| ' || v_data_ultimo || ' |-| ' || v_total_dias);
  END LOOP;
  CLOSE v_list;  
END;
/

-- Apenas mes v�lido introduzido
DECLARE
  v_list SYS_REFCURSOR;
  v_camareira_id   camareira.id%TYPE;
  v_name funcionario.nome%TYPE;
  v_total NUMBER;
  v_data_primeiro DATE;
  v_data_ultimo DATE;
  v_total_dias NUMBER;
BEGIN 
  v_list := fncObterRegistoMensalCamareira(3);
  LOOP 
    FETCH v_list
    INTO  v_camareira_id, v_name, v_total, v_data_primeiro, v_data_ultimo, v_total_dias;
    EXIT WHEN v_list%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_camareira_id || ' |-| ' || v_name || ' |-| ' || v_total || ' |-| ' || v_data_primeiro || ' |-| ' || v_data_ultimo || ' |-| ' || v_total_dias);
  END LOOP;
  CLOSE v_list;  
END;
/