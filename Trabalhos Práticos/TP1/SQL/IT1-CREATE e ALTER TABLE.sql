-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restri��es de integridade das chaves prim�rias e chaves �nicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE tipoquarto         CASCADE CONSTRAINTS PURGE;
DROP TABLE andar              CASCADE CONSTRAINTS PURGE;
DROP TABLE quarto             CASCADE CONSTRAINTS PURGE;
DROP TABLE intervencao        CASCADE CONSTRAINTS PURGE;
DROP TABLE funcmanutencao     CASCADE CONSTRAINTS PURGE;
DROP TABLE funcrestaurante    CASCADE CONSTRAINTS PURGE;
DROP TABLE funcrececao        CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario        CASCADE CONSTRAINTS PURGE;
DROP TABLE camareira          CASCADE CONSTRAINTS PURGE;
DROP TABLE epocaano           CASCADE CONSTRAINTS PURGE;
DROP TABLE reserva            CASCADE CONSTRAINTS PURGE;
DROP TABLE estadoreserva      CASCADE CONSTRAINTS PURGE;
DROP TABLE cliente            CASCADE CONSTRAINTS PURGE;
DROP TABLE endereco           CASCADE CONSTRAINTS PURGE;
DROP TABLE conta              CASCADE CONSTRAINTS PURGE;
DROP TABLE fatura             CASCADE CONSTRAINTS PURGE;
DROP TABLE consumo            CASCADE CONSTRAINTS PURGE;
DROP TABLE formapagamento     CASCADE CONSTRAINTS PURGE;

-- ## tabela TipoQuarto ##
CREATE TABLE tipoquarto(
  idTipoQuarto 	    VARCHAR(30)	CONSTRAINT pkTipoQuartoIdTipoQuarto     PRIMARY KEY,
  descTipoQuarto    VARCHAR(30)	CONSTRAINT nnDescTipoQuarto             NOT NULL,
  valorPorNoite     INTEGER 	CONSTRAINT nnValorPorNoite              NOT NULL
);

-- ## tabela Andar ##
CREATE TABLE andar(
  idAndar 	        VARCHAR(30)	CONSTRAINT pkAndarIdAndar               PRIMARY KEY,
  nrAndar           INTEGER 	CONSTRAINT nnNrAndar                    NOT NULL
);

-- ## tabela Quarto ##
CREATE TABLE quarto(
  idQuarto 	        INTEGER 	CONSTRAINT pkQuartoIdQuarto             PRIMARY KEY,
  idAndar 	        VARCHAR(30)	CONSTRAINT nnIdAndar                    NOT NULL,
  idTipoQuarto 	    VARCHAR(30)	CONSTRAINT nnIdTipoQuarto               NOT NULL,
  lotacaoMaxima     INTEGER 	CONSTRAINT nnLotacaoMaxima              NOT NULL,
  disponibilidade   VARCHAR(30)	CONSTRAINT nnDisponibilidade            NOT NULL
);

-- ## tabela Intervencao ##
CREATE TABLE intervencao(
  idIntervencao 	INTEGER 	CONSTRAINT pkIntervencaoIdIntervencao   PRIMARY KEY,
  idQuarto 	        INTEGER 	CONSTRAINT nnIdQuarto                   NOT NULL,
  funcionarioNIF 	INTEGER 	CONSTRAINT nnFuncionarioNIF             NOT NULL,
  dataIntervencao   DATE     	CONSTRAINT nnDataIntervencao            NOT NULL,
  realizacao        VARCHAR(30) 	CONSTRAINT nnRealizacao                 NOT NULL,
  estadoIntervencao VARCHAR(30) 	CONSTRAINT nnEstadoIntervencao          NOT NULL,
  descricao         VARCHAR(30) CONSTRAINT nnDescricao                  NOT NULL
);

-- ## tabela FuncManutencao ##
CREATE TABLE funcmanutencao(
  NIF 	            INTEGER 	CONSTRAINT pkFuncManutencaoNIF          PRIMARY KEY,
  chefeNIF 	        INTEGER 	CONSTRAINT nnChefeNIF                   NOT NULL,
  telefoneServico   INTEGER 	CONSTRAINT nnTelefoneServico            NOT NULL
);

-- ## tabela FuncRestaurante ##
CREATE TABLE funcrestaurante(
  NIF 	            INTEGER 	CONSTRAINT pkFuncRestauranteNIF         PRIMARY KEY
);
-- ## tabela FuncRececao ##
CREATE TABLE funcrececao(
  NIF 	            INTEGER 	CONSTRAINT pkFuncRececaoNIF             PRIMARY KEY
);

-- ## tabela Funcionario ##
CREATE TABLE funcionario(
  NIF 	            INTEGER 	CONSTRAINT pkFuncionarioNIF             PRIMARY KEY,
  nome              VARCHAR(30) CONSTRAINT nnNome                       NOT NULL,
  morada 	        VARCHAR(30) CONSTRAINT nnMorada                     NOT NULL,
  telefone          INTEGER    	CONSTRAINT nnTelefone                   NOT NULL,
  email             VARCHAR(30) CONSTRAINT nnEmail                      NOT NULL
);

-- ## tabela Camareira ##
CREATE TABLE camareira(
  NIF 	            INTEGER 	CONSTRAINT pkCamareiraNIF               PRIMARY KEY
);

-- ## tabela EpocaAno ##
CREATE TABLE epocaano(
  idEpoca        	INTEGER 	CONSTRAINT pkEpocaIdEpoca               PRIMARY KEY,
  dataInicio        DATE     	CONSTRAINT nnDataInicio                 NOT NULL,
  dataFim           DATE     	CONSTRAINT nnDataFim                    NOT NULL,
  valorEpoca        INTEGER 	CONSTRAINT nnValorEpoca                 NOT NULL,
  descricaoEpoca    VARCHAR(30) CONSTRAINT nnDescricaoEpoca             NOT NULL
);

-- ## tabela Reserva ##
CREATE TABLE reserva(
  idReserva      	INTEGER 	CONSTRAINT pkReservaIdReserva           PRIMARY KEY,
  NIF    	        INTEGER 	CONSTRAINT nnNIFCliente                 NOT NULL,
  idQuarto      	INTEGER 	CONSTRAINT nnIdQuartoReserva            NOT NULL,
  idEpoca        	INTEGER 	CONSTRAINT nnIdEpocaReserva             NOT NULL,
  idConta   	    INTEGER 	CONSTRAINT nnIdContaReserva             NOT NULL,
  nrPessoas         INTEGER 	CONSTRAINT nnNrPessoasReserva           NOT NULL,
  dataEntrada       DATE     	CONSTRAINT nnDataEntradaReserva         NOT NULL,
  dataSaida         DATE     	CONSTRAINT nnDataSaidaReserva           NOT NULL,
  dataReserva       DATE        CONSTRAINT nnDataReserva                NOT NULL,
  horaReserva       INTEGER     CONSTRAINT nnHoraReserva                NOT NULL
);

-- ## tabela EstadoReserva ##
CREATE TABLE estadoreserva(
  idReserva        	INTEGER 	CONSTRAINT pkEstadoReservaIdReservaEstado     PRIMARY KEY,
  custo             INTEGER 	CONSTRAINT nncustoEstado                      NOT NULL,
  dataAlteracao     DATE     	CONSTRAINT nnDataAlteracaoEstado              NOT NULL,
  descricaoEstado   VARCHAR(30) CONSTRAINT nnDescricaoEpocEstadoa             NOT NULL
);

-- ## tabela Cliente ##
CREATE TABLE cliente(
  NIF 	            INTEGER 	CONSTRAINT pkClienteNIFCliente                 PRIMARY KEY,
  idEndereco        INTEGER     CONSTRAINT nnIdEnderecoCliente                 NOT NULL,
  nome              VARCHAR(30) CONSTRAINT nnNomeCliente                       NOT NULL,
  contacto 	        VARCHAR(30) CONSTRAINT nnContactoCliente                   NOT NULL
);

-- ## tabela Endereco ##
CREATE TABLE endereco(
  idEndereco 	    INTEGER 	CONSTRAINT pkEnderecoIdEnderecoEndereco         PRIMARY KEY,
  localidade        VARCHAR(30) CONSTRAINT nnLocalidadeEndereco                 NOT NULL,
  codPostal         INTEGER     CONSTRAINT nnCodPostalEndereco                  NOT NULL,
  concelho 	        VARCHAR(30) CONSTRAINT nnConcelhoEndereco                   NOT NULL
);

-- ## tabela Conta ##
CREATE TABLE conta(
  idConta   	    INTEGER 	CONSTRAINT pkContaIdConta_Conta               PRIMARY KEY,
  dataAbertura      DATE        CONSTRAINT nnDataAberturaConta               NOT NULL
);

-- ## tabela Fatura ##
CREATE TABLE fatura(
  idReserva   	    INTEGER 	CONSTRAINT pkFaturaIdReservaFatura            PRIMARY KEY,
  idConta           INTEGER     CONSTRAINT nnIdContaFatura                    NOT NULL
);

-- ## tabela Consumo ##
CREATE TABLE consumo(
  idConsumo      	INTEGER 	CONSTRAINT pkConsumoIdConsumo_Consumo           PRIMARY KEY,
  idConta           INTEGER     CONSTRAINT nnIdContaConsumo                    NOT NULL,
  camareiraNIF    	INTEGER 	CONSTRAINT nnCamareiraNIFConsumo               NOT NULL,
  valorAssociado  	INTEGER 	CONSTRAINT nnValorAssociadoConsumo             NOT NULL,
  descProduto  	    VARCHAR(30)	CONSTRAINT nnDescProdutoConsumo                NOT NULL
);

-- ## tabela FormaPagamento ##
CREATE TABLE formapagamento(
  idReserva   	    INTEGER 	CONSTRAINT pkFormaPagamentoIdReservaFormaPagamento    PRIMARY KEY,
  descFormaPagam    VARCHAR(30) CONSTRAINT nnDescFormaPagamFormaPagamento             NOT NULL
);

-- ** alterar tabelas para defini��o de chaves estrangeiras **
ALTER TABLE Quarto      ADD CONSTRAINT fkIdAndar    FOREIGN KEY (idAndar)      REFERENCES Andar (idAndar);
ALTER TABLE Quarto      ADD CONSTRAINT fkTipoQuarto FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuarto(idTipoQuarto);

ALTER TABLE Reserva ADD CONSTRAINT fkNIFClienteReserva    FOREIGN KEY (NIF)      REFERENCES Cliente (NIF);
ALTER TABLE Reserva ADD CONSTRAINT fkIdQuartoReserva    FOREIGN KEY (idQuarto)      REFERENCES Quarto (idQuarto);
ALTER TABLE Reserva ADD CONSTRAINT fkidEpocaReserva    FOREIGN KEY (idEpoca)      REFERENCES EpocaAno (idEpoca);
ALTER TABLE Reserva ADD CONSTRAINT fkidContaReserva    FOREIGN KEY (idConta)      REFERENCES Conta (idConta);

ALTER TABLE EstadoReserva ADD CONSTRAINT fkidRervaEstadoReserva    FOREIGN KEY (idReserva)      REFERENCES Reserva (idReserva);
ALTER TABLE Cliente ADD CONSTRAINT fkidEnderecoCliente    FOREIGN KEY (idEndereco)      REFERENCES Endereco (idEndereco);

ALTER TABLE Fatura ADD CONSTRAINT fkidFaturaReserva    FOREIGN KEY (idReserva)      REFERENCES Reserva (idReserva);
ALTER TABLE Fatura ADD CONSTRAINT fkidFaturaConta    FOREIGN KEY (idConta)      REFERENCES Conta (idConta);

ALTER TABLE FormaPagamento ADD CONSTRAINT fkidFormaPagamentoReserva    FOREIGN KEY (idReserva)      REFERENCES Fatura (idReserva);

ALTER TABLE Consumo ADD CONSTRAINT fkidConsumoidConta    FOREIGN KEY (idConta)      REFERENCES Conta (idConta);
ALTER TABLE Consumo ADD CONSTRAINT fkidConsumoNifCamareira    FOREIGN KEY (CAMAREIRANIF)      REFERENCES Camareira (NIF);

ALTER TABLE FuncManutencao ADD CONSTRAINT fkNIFFuncionarioManutencao    FOREIGN KEY (NIF)      REFERENCES Funcionario (NIF);
ALTER TABLE FuncManutencao ADD CONSTRAINT fkNIFFuncionarioManutencaoChefe    FOREIGN KEY (chefeNIF)      REFERENCES Funcionario (NIF);
ALTER TABLE FuncRestaurante ADD CONSTRAINT fkNIFFuncionarioRestaurante    FOREIGN KEY (NIF)      REFERENCES Funcionario (NIF);
ALTER TABLE FuncRececao ADD CONSTRAINT fkNIFFuncionarioRececao   FOREIGN KEY (NIF)      REFERENCES Funcionario (NIF);
ALTER TABLE Camareira ADD CONSTRAINT fkNIFFuncionarioCamareira    FOREIGN KEY (NIF)      REFERENCES Funcionario (NIF);
ALTER TABLE Intervencao ADD CONSTRAINT fkIdQuartoIntervencao    FOREIGN KEY (idQuarto)      REFERENCES Quarto (idQuarto);
ALTER TABLE Intervencao      ADD CONSTRAINT fkFuncionarioNifIntervencao FOREIGN KEY (funcionarioNIF) REFERENCES Funcionario(NIF);
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP1/SQL/IT1-CREATE e ALTER TABLE.sql
 * Ficheiro:  IT1-CREATE e ALTER TABLE.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: IT1-CREATE e ALTER TABLE.sql
 */

--

-- ** guardar em DEFINITIVO as altera��es na base de dados, se a op��o Autocommit do SQL Developer n�o estiver ativada **
-- COMMIT;