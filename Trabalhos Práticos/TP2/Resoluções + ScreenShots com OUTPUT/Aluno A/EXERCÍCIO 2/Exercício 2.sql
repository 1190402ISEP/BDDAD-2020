SET SERVEROUTPUT ON;
--2.Implementar um procedimento designado prcCheckOut para efetuar o check-out de um
--quarto, incluindo a gera��o da fatura. O procedimento deve receber por par�metro a
--linha da tabela reserva correspondente � reserva do quarto. 
--Se o par�metro fornecido for
--inv�lido, o procedimento deve levantar uma exce��o com uma mensagem apropriada. O
--procedimento tem que tirar o m�ximo proveito do c�digo SQL. Testar adequadamente o
--procedimento implementado, atrav�s de blocos an�nimos.
CREATE SEQUENCE seq_fatura START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEQ_LINHA_FATURA start with 1 increment by 1;

create or replace procedure prcCheckOut(pLinhaTabelaDaReserva RESERVA.ID%TYPE)
is
    vReserva RESERVA%ROWTYPE;
    vAReservaTemCheckIn int;
    vAReservaTemCheckOut int;
    vConta CONTA_CONSUMO.id%TYPE;
    vValorFaturadoConsumo INTEGER;
    vNrFatura int;
    vConsumoParcial INT;
    vCheckAccount int;
begin

SELECT R.* INTO vReserva 
FROM RESERVA R 
WHERE r.id = pLinhaTabelaDaReserva;


--Verificar se existe check IN

SELECT count(*) INTO vAReservaTemCheckIn
FROM CheckIn ci 
WHERE ci.ID_RESERVA=vReserva.id;

if(vAReservaTemCheckIn=0)then
 raise_application_error(-20004, 'N�o pode ser feito um Check Out sem um Check In!');
end if;


--Verificar se o check out j� foi efetuado

SELECT count(*) INTO vAReservaTemCheckOut
FROM CheckOut co 
WHERE co.ID_RESERVA=vReserva.id;

if(vAReservaTemCheckOut>0)then
 raise_application_error(-20005, 'O CHECK OUT j� foi efetuado!');
end if;

--Efetuar Check Out
INSERT INTO CHECKOUT (ID_RESERVA,DATA,OBSERVACOES,VALOR_EXTRA) 
values(vReserva.id,(SELECT SYSDATE FROM DUAL),'Obs 1',vReserva.custo_extra);

UPDATE RESERVA SET ID_ESTADO_RESERVA = 3 WHERE ID=vReserva.ID;
vNrFatura:=seq_fatura.NEXTVAL;



--SELECIONAR CONTA

--Criar Fatura

INSERT INTO FATURA(ID,NUMERO,DATA,ID_CLIENTE,ID_RESERVA,VALOR_FATURADO_RESERVA,VALOR_FATURADO_CONSUMO)
VALUES (vNrFatura,vNrFatura,(select sysdate from dual),vReserva.ID_CLIENTE,vReserva.ID,vReserva.preco,0);

SELECT count(*)into vCheckAccount
from Conta_Consumo cs where cs.id_reserva=vReserva.id;


if(vCheckAccount=0)then
    vValorFaturadoConsumo:=0;
else
    SELECT cs.id into vConta
    from Conta_Consumo cs where cs.id_reserva=vReserva.id;
--Criar linhas Fatura
    for r in (SELECT * from Linha_Conta_Consumo lcc  where lcc.id_conta_consumo=vConta)
        loop

            vConsumoParcial:= (r.quantidade * r.preco_unitario);
   INSERT INTO LINHA_FATURA(ID_FATURA,LINHA,ID_CONTA_CONSUMO,LINHA_CONTA_CONSUMO,VALOR_CONSUMO)      
   VALUES (vNrFatura,SEQ_LINHA_FATURA.nextval,vConta,r.linha,vConsumoParcial);

        end loop;
        
    SELECT sum(TRUNC(lf.valor_consumo))INTO vValorFaturadoConsumo
    from Linha_Fatura lf
    where lf.id_conta_consumo=vConta;
end if; 

    UPDATE FATURA  SET VALOR_FATURADO_CONSUMO = vValorFaturadoConsumo where FATURA.ID_RESERVA=vReserva.id;  

end;
/
--Gerar Check Out e Fatura onde n�o foi efetuado checkin - erro
call prcCheckOut(1151);
--Gerar Check Out e Fatura onde tudo � leg�vel
call prcCheckOut(43);
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno A/EXERCÍCIO 2/Exercício 2.sql
 * Ficheiro:  Exercício 2.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício 2.sql
 */

--Gerar Check Out e Fatura com Check Out j� efetuado- erro
call prcCheckOut(1150);