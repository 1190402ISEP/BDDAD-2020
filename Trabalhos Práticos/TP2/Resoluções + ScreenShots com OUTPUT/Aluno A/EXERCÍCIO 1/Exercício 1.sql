SET SERVEROUTPUT ON;
--1.Implementar uma fun��o designada fncGetQuartoReserva que, dado o ID de uma
--reserva, retorne o quarto a alocar. Havendo mais que um quarto, pretende-se o que
--estiver no andar mais baixo e, depois, que tenha tido menos dias de ocupa��o no �ltimo
--ano (para promover a distribui��o da utiliza��o pelos diversos quartos). No caso de o
--par�metro ser inv�lido ou n�o haver quarto dispon�vel, a fun��o deve retornar o valor
--NULL atrav�s do mecanismo de exce��es. O par�metro � inv�lido quando: a) � null, b)
--n�o existe, c) a reserva j� tem um quarto associado, d) o estado da reserva n�o � o
--adequado (e.g. est� fechada). A fun��o tem que tirar o m�ximo proveito do c�digo SQL.
--Testar adequadamente a fun��o implementada, atrav�s de blocos an�nimos.

CREATE OR REPLACE FUNCTION fncGetQuartoReserva(pIdReserva in RESERVA.ID%TYPE) return QUARTO%ROWTYPE
    is
    vReserva                RESERVA%ROWTYPE;
    vQuarto                 QUARTO%ROWTYPE;
    vReservaQuarto          CHECKIN.ID_QUARTO%TYPE;
    vId_quarto   int;
    vReservaExiste  int;
    vTotalQuartosLivres int;


BEGIN
    --verifica se o id da reserva � null
        IF pIdReserva IS NULL THEN
            raise_application_error(-20022, 'Input Nulo!');
        END IF;
        
        --verifica se a reserva est� registada no sistema
        SELECT COUNT(*) INTO vReservaExiste
        FROM reserva
            WHERE id = pIdReserva;
        if(vReservaExiste=0)then
            raise_application_error(-20202, 'A reserva n�o est� registada!');
        end if;
--Verifica qual a reserva pelo ID
    SELECT r.*
    into vReserva
    from Reserva r
    where r.id = pIdReserva;

--Se a reserva estiver num estado ilegal para a opera��oo lan�a erro
    if (vReserva.id_estado_reserva > 1) then
        raise_application_error(-20002, 'A reserva est� num estado ilegal para esta opera��o!');
    end if;

--Verifica se j� h� um quarto associado � reserva e caso haja retorna
    SELECT count(*)
    into vReservaQuarto
    from CheckIn c
    where c.id_reserva = pIdReserva;

    if (vReservaQuarto > 0) then
        raise_application_error(-20003, 'J� h� quarto associado!');
    end if;

    --Selecionar o quarto a retornar



---------------------------

--Verificar n�o existem quartos livres
    WITH quartos_Sem_check_out_feito AS 
                                (SELECT QUARTO.ID
                                  FROM QUARTO
                                LEFT JOIN CHECKIN chckI ON QUARTO.ID = chckI.ID_QUARTO
                                           INNER JOIN RESERVA Res ON Res.ID = chckI.ID_RESERVA
                                  WHERE (vReserva.data_saida BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (vReserva.data_entrada BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (Res.DATA_ENTRADA >= vReserva.data_entrada AND vReserva.data_saida >= Res.DATA_SAIDA)),

         QUARTOS_LIVRES AS(SELECT QUARTO.ID
                                FROM QUARTO
                                WHERE QUARTO.ID_TIPO_QUARTO = vReserva.id_tipo_quarto
                                  AND QUARTO.LOTACAO_MAXIMA >= vReserva.NR_PESSOAS
                                MINUS
                                SELECT quartos_Sem_check_out_feito.ID
                                FROM quartos_Sem_check_out_feito)

    SELECT COUNT(QUARTOS_LIVRES.ID) INTO vTotalQuartosLivres 
    FROM QUARTOS_LIVRES;

--caso n�o existam quartos livres lan�a erro
    
    IF (vTotalQuartosLivres  = 0) THEN
        raise_application_error(-20033, 'Sem Quartos Livres!');
    END IF;

--Caso existam quartos livres escolher o de andar mais baixo e menos ocupa��o
-- caso seja 1 podemos retornar de imediato o quarto
    IF (vTotalQuartosLivres  = 1) THEN

        WITH ver_quartos_Sem_check_out_feito AS 
        --ver quartos sem check out feito
                                (SELECT QUARTO.ID
                                  FROM QUARTO
                                LEFT JOIN CHECKIN chckI ON QUARTO.ID = chckI.ID_QUARTO
                                           INNER JOIN RESERVA Res ON Res.ID = chckI.ID_RESERVA
                                  WHERE (vReserva.data_saida BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (vReserva.data_entrada BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (Res.DATA_ENTRADA >= vReserva.data_entrada AND vReserva.data_saida >= Res.DATA_SAIDA)),

         QUARTOS_LIVRES_QUE_PODEM_SER_ALOCADOS AS(SELECT QUARTO.ID
         --ver quartos que podem ser alocados pela fun��o
                                FROM QUARTO
                                WHERE QUARTO.ID_TIPO_QUARTO = vReserva.id_tipo_quarto
                                  AND QUARTO.LOTACAO_MAXIMA >= vReserva.NR_PESSOAS
                                MINUS
                                SELECT ver_quartos_Sem_check_out_feito.ID
                                FROM ver_quartos_Sem_check_out_feito)
                                
        SELECT QUARTOS_LIVRES_QUE_PODEM_SER_ALOCADOS.ID INTO vId_quarto
        FROM QUARTOS_LIVRES_QUE_PODEM_SER_ALOCADOS;
        --retornar o quarto
        SELECT * INTO vQuarto FROM QUARTO  WHERE  quarto.id=vId_quarto;
        return vQuarto;
        

    END IF;

-- se n�o for 1 ent�o temos que ver segundo os m�todos de sele��o- 1� andar mais baixo, 2� menos dias de ocupa��o
        --ver quartos sem check out feito
        WITH ver_quartos_sem_checkout AS 
                                (SELECT QUARTO.ID
                                  FROM QUARTO
                                LEFT JOIN CHECKIN chckI ON QUARTO.ID = chckI.ID_QUARTO
                                           INNER JOIN RESERVA Res ON Res.ID = chckI.ID_RESERVA
                                  WHERE (vReserva.data_saida BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (vReserva.data_entrada BETWEEN Res.DATA_ENTRADA AND Res.DATA_SAIDA)
                                      OR (Res.DATA_ENTRADA >= vReserva.data_entrada AND vReserva.data_saida >= Res.DATA_SAIDA)),
        --ver quais os quartos livres
         QUARTOS_LIVRES AS(SELECT QUARTO.ID, QUARTO.ID_ANDAR
                                FROM QUARTO
                                        INNER JOIN ANDAR andarB on andarB.ID = QUARTO.ID_ANDAR
                                WHERE QUARTO.ID_TIPO_QUARTO = vReserva.id_tipo_quarto
                                  AND QUARTO.LOTACAO_MAXIMA >= vReserva.NR_pessoas
                                MINUS
                                SELECT ver_quartos_sem_checkout.ID, ver_quartos_sem_checkout.ID
                                FROM ver_quartos_sem_checkout),
                                --ver quartos menos ocupados
        CONTAGEM_DE_DIAS_OCUPACAO AS (SELECT ID, SUM(DURATION) as TOTAL
                                FROM (SELECT Q.ID, ((C4.DATA) - (C3.DATA)) as DURATION
                                        FROM QUARTO Q
                                            LEFT JOIN CHECKIN C3 on Q.ID = C3.ID_QUARTO AND EXTRACT(YEAR FROM C3.DATA)=EXTRACT(YEAR FROM SYSDATE)-1
                                            INNER JOIN CHECKOUT C4 on C3.ID_RESERVA = C4.ID_RESERVA AND EXTRACT(YEAR FROM C4.DATA)=EXTRACT(YEAR FROM SYSDATE)-1
                                        GROUP BY Q.ID, ((C4.DATA) - (C3.DATA)))
                                GROUP BY ID 
                                ORDER BY TOTAL)  ,    
                                --ver quartos no andar mais abaixo
         Quartos_com_andar_inferior AS (SELECT QUARTOS_LIVRES.ID
                                FROM QUARTOS_LIVRES
                                WHERE ID_ANDAR = (SELECT MIN(anda.NR_ANDAR)
                                                    FROM ANDAR anda
                                                            INNER JOIN QUARTOS_LIVRES QL ON anda.ID = QL.ID_ANDAR))
                                                            
         --quarto no andar mais abaixo e com menos dias de ocupa��o
    SELECT Quartos_com_andar_inferior.ID INTO vId_quarto
    FROM Quartos_com_andar_inferior
                LEFT JOIN CONTAGEM_DE_DIAS_OCUPACAO ON Quartos_com_andar_inferior.ID = CONTAGEM_DE_DIAS_OCUPACAO.ID
                FETCH NEXT 1 ROWS ONLY;
    --retorna o quarto
    SELECT * into vQuarto from quarto where quarto.id=vId_quarto;
        return vQuarto;


EXCEPTION
    when No_Data_Found then
        return null;
end;
/
--TESTES:
begin
    dbms_output.put_line(fncGetQuartoReserva(1156).id);
end;
/
begin
    --Testar quando a reserva j� tem quarto associado
    dbms_output.put_line(fncGetQuartoReserva(1162).id);
end;
/


begin
    --Testar quando o input � null
    dbms_output.put_line(fncGetQuartoReserva().id);
end;
/
begin
    --Testar quando o estado da reserva � ilegal para a opera��o
    dbms_output.put_line(fncGetQuartoReserva(28).id);
end;
/
begin
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno A/EXERCÍCIO 1/Exercício 1.sql
 * Ficheiro:  Exercício 1.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 1.sql
 */

    --Testar quando Funciona
    dbms_output.put_line(fncGetQuartoReserva(44).id);
end;
/