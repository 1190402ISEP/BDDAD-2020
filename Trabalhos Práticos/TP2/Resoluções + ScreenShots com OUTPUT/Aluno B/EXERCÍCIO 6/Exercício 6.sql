SET SERVEROUTPUT ON;
-----------------------------------------------------------------------------------
ALTER TABLE camareira
ADD Bonus INTEGER
DEFAULT '0';

SELECT * FROM camareira;
-----------------------------------------------------------------------------------
-- Exercicio 6:
CREATE OR REPLACE TRIGGER trgCorrigirAlteracaoBonus
BEFORE
    UPDATE OF bonus
    ON camareira
    
FOR EACH ROW
BEGIN
    IF (:OLD.bonus = 0) THEN
        :NEW.bonus := :NEW.bonus;
    ELSIF (:NEW.bonus < :OLD.bonus) THEN
        :NEW.bonus := :OLD.bonus;
    ELSIF (:NEW.bonus < :OLD.bonus + (:OLD.bonus*0.5)) THEN
        :NEW.bonus := :NEW.bonus;
    ELSE
        :NEW.bonus := :OLD.bonus + (:OLD.bonus*0.5);
    END IF;
END trgCorrigirAlteracaoBonus;
/

-----------------------------------------------------------------------------------
-- Teste
ALTER TRIGGER trgCorrigirAlteracaoBonus ENABLE;

SELECT * FROM CAMAREIRA;

-- Bonus com inicio 0
UPDATE CAMAREIRA
    SET BONUS = 10
WHERE ID=12;

SELECT * FROM CAMAREIRA;

-- Bonus menor
UPDATE CAMAREIRA
    SET BONUS = 0
WHERE ID=12;

SELECT * FROM CAMAREIRA;

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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno B/EXERCÍCIO 6/Exercício 6.sql
 * Ficheiro:  Exercício 6.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 6.sql
 */

-- Bonus pouco maior
UPDATE CAMAREIRA
    SET BONUS = 12
WHERE ID=12;

SELECT * FROM CAMAREIRA;

-- Bonus muito maior
UPDATE CAMAREIRA
    SET BONUS = 90
WHERE ID=12;

SELECT * FROM CAMAREIRA;

ALTER TRIGGER trgCorrigirAlteracaoBonus DISABLE;

-----------------------------------------------------------------------------------
-- Camareira original
ALTER TABLE camareira
DROP COLUMN Bonus;

SELECT * FROM camareira;