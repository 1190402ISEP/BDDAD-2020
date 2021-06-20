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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP2/Resoluções + ScreenShots com OUTPUT/Aluno C/Exercício7.sql
 * Ficheiro:  Exercício7.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: Exercício7.sql
 */

--7.Implementar uma fun��o designada fncDisponibilidadeReserva que permita verificar a
--disponibilidade para uma poss�vel reserva. A fun��o deve receber, por par�metro, o tipo
--de quarto, a data pretendida, a dura��o (dias), o n�mero de pessoas e tem de retornar
--um valor booleano, true ou false. Se um dos par�metros fornecidos for inv�lido, a fun��o
--deve retornar o valor Null, usando o mecanismo de exce��es. A fun��o tem que tirar o
--m�ximo proveito do c�digo SQL. Testar adequadamente a fun��o implementada, atrav�s
--de blocos an�nimos.

CREATE OR REPLACE FUNCTION fncDisponibilidadeReserva(Tquarto reserva.id_tipo_quarto%TYPE , dia reserva.DATA_ENTRADA %TYPE , dura reserva.nr_pessoas%TYPE , nump reserva.nr_pessoas%TYPE) return boolean
is
v_count int;
begin
Select COUNT(ID_TIPO_QUARTO) into v_count from reserva where  ID_TIPO_QUARTO = Tquarto;

if (v_count > 0)  THEN
 
  select count (DATA_ENTRADA)  into v_count from reserva  where DATA_ENTRADA != dia  and ID_TIPO_QUARTO = Tquarto ;
 
 
       if (v_count> 0) then

         select count( DATA_ENTRADA)  into v_count  from Reserva where DATA_ENTRADA != (DATA_ENTRADA + dura) and  DATA_ENTRADA != dia  and ID_TIPO_QUARTO = Tquarto;

        
             
             if (v_count > 0) then
             
            select count(LOTACAO_MAXIMA) into v_count from QUARTO where LOTACAO_MAXIMA >= nump ;
             
            

                    if  (v_count  > 0) then
                    
                   
                    return true;
                    end if ;
              end if ;
         end if ;  
end if ;
return null;
end;