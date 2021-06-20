SET SERVEROUTPUT ON;
-----------------------------------------------------------------------------------
-- Exercicio 5:
-- Indique todas as altera��es que t�m que ser feitas no modelo relacional.
-- R: Introduzir a vari�vel Bonus Integer na tabela Camareira
ALTER TABLE camareira
ADD Bonus INTEGER
DEFAULT '0';

SELECT * FROM camareira;
-----------------------------------------------------------------------------------
-- Procedure
CREATE OR REPLACE PROCEDURE prcAtualizarBonusCamareiras(pMes INTEGER, pAno INTEGER DEFAULT EXTRACT(YEAR FROM SYSDATE))
IS
    
BEGIN    
    FOR r 
    IN (SELECT
            lcc.id_camareira as ID,
            SUM(lcc.quantidade * lcc.preco_unitario) as Valor 
        FROM linha_conta_consumo lcc
        WHERE EXTRACT(MONTH FROM lcc.data_registo) = pMes AND EXTRACT(YEAR FROM lcc.data_registo) = pANo
        GROUP BY lcc.id_camareira)
    LOOP
        FOR i 
        IN (SELECT 
                id 
            FROM camareira)
        LOOP
            IF(r.Valor <= 100 AND i.id=r.id) THEN
                UPDATE CAMAREIRA
                    SET BONUS = 0
                WHERE ID=i.id;
            ELSIF (r.Valor < 500 AND i.id=r.id) THEN
                UPDATE CAMAREIRA
                    SET BONUS = r.Valor*0.05
                WHERE ID=i.id;
            ELSIF (r.Valor <= 1000 AND i.id=r.id) THEN
                UPDATE CAMAREIRA
                    SET BONUS = r.Valor*0.1
                WHERE ID=i.id;
            ELSIF (i.id=r.id) THEN
                UPDATE CAMAREIRA
                    SET BONUS = r.Valor*0.15
                WHERE ID=i.id;
            END IF;
        END LOOP;
    END LOOP;
END;
/

-----------------------------------------------------------------------------------
-- Teste
call prcAtualizarBonusCamareiras(3);

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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno B/EXERCÍCIO 5/Exercício 5.sql
 * Ficheiro:  Exercício 5.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 5.sql
 */

-- Visualiza��o
SELECT * FROM CAMAREIRA;

-----------------------------------------------------------------------------------
-- Camareira original
ALTER TABLE camareira
DROP COLUMN Bonus;

SELECT * FROM camareira;