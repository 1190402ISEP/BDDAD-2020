-- ** inserir dados nas tabelas **

-- ## tabela TipoQuarto ##
INSERT INTO tipoquarto(idTipoQuarto,descTipoQuarto,valorPorNoite) VALUES ('Single','single',100  );
INSERT INTO tipoquarto(idTipoQuarto,descTipoQuarto,valorPorNoite) VALUES ('Twin','dois',150);
INSERT INTO tipoquarto(idTipoQuarto,descTipoQuarto,valorPorNoite) VALUES ('Superior','cool',250);
INSERT INTO tipoquarto(idTipoQuarto,descTipoQuarto,valorPorNoite) VALUES ('Suite','Mega cool',300);

-- ## tabela Andar ##
INSERT INTO andar(idAndar,nrAndar) VALUES('doze',1);
INSERT INTO andar(idAndar,nrAndar) VALUES('nap',2);
INSERT INTO andar(idAndar,nrAndar) VALUES('siesta',3);
INSERT INTO andar(idAndar,nrAndar) VALUES('dream',4);
INSERT INTO andar(idAndar,nrAndar) VALUES('ambition',5);

-- ## tabela Quarto ##
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(34 ,'doze','Single',1,'Aberto'); 
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(133,'doze','Twin',2,'Reservado'); 
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(21,'doze','Suite',10,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(145,'doze','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(123,'doze','Single',1,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(53,'doze','Twin',2,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(43,'doze','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(4,'doze','Single',1,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(46,'doze','Twin',2,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(2,'doze','Single',1,'Aberto');   
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(13,'doze','Twin',2,'Aberto');
--##
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(923,'ambition','Suite',10,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(888,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(999,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(995,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(882,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(874,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(843,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(801,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(912,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(911,'ambition','Suite',10,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(811,'ambition','Suite',10,'Aberto');
--##
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(461,'nap','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(234,'nap','Single',1,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(421,'nap','Superior',4,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(452,'nap','Twin',2,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(345,'nap','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(435,'nap','Single',1,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(424,'nap','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(467,'nap','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(489,'nap','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(401,'nap','Superior',4,'Aberto');
--##
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(523,'siesta','Superior',4,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(579,'siesta','Single',1,'Aberto');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(601,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(669,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(666,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(555,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(501,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(574,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(572,'siesta','Single',1,'Reservado');
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(571,'siesta','Single',1,'Reservado');
--##
INSERT INTO quarto(idQuarto,idAndar,idTipoQuarto,lotacaoMaxima,disponibilidade) VALUES(785,'dream','Twin',2,'Reservado');

-- ## tabela Funcionario ##
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (511064551,'Rosa Reis','Porto',96856562,'rmr@isep.ipp.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (974317764,'Nelson Freire','Gaia',967543345,'nmf@isep.ipp.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (514464551,'Jose','Vale do Sousa',967556647,'jose@isep.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (508264049,'Manuel','Guarda',968785543,'manu@pporto.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (502162147,'Joana','Chaves',968897788,'joana@porto.pt');
-- ##came
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (545784628,'Pedro','Guimar�es',963224856,'pedo@tech.com');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (592883949,'Ana','Alentejo',919994433,'ana@isep.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (684728434,'Rui','Alcoba�a',968565307,'ruip@isep.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (673956759,'Guilherme','Vale do Tejo',968787995,'g@porto.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (383498340,'Paulo','Vizela',962435865,'pm@isep.ipp.pt');
INSERT INTO  funcionario(NIF,nome,morada,telefone,email) VALUES (246593759,'Bill Gates','Viseu',967564776,'microsoft@world.pt');

-- ## tabela Camareira ##
INSERT INTO camareira(NIF) VALUES (511064551);
INSERT INTO camareira(NIF) VALUES (974317764);
INSERT INTO camareira(NIF) VALUES (514464551);
INSERT INTO camareira(NIF) VALUES (508264049);
INSERT INTO camareira(NIF) VALUES (502162147);
INSERT INTO camareira(NIF) VALUES (545784628);

-- ## tabela FuncManutencao ##
INSERT INTO funcmanutencao(NIF,chefeNIF,telefoneServico) VALUES(592883949,246593759,918405834);
INSERT INTO funcmanutencao(NIF,chefeNIF,telefoneServico) VALUES(684728434,383498340,917519391);
INSERT INTO funcmanutencao(NIF,chefeNIF,telefoneServico) VALUES(673956759,673956759,966596848);
INSERT INTO funcmanutencao(NIF,chefeNIF,telefoneServico) VALUES(383498340,684728434,911048154);
INSERT INTO funcmanutencao(NIF,chefeNIF,telefoneServico) VALUES(246593759,592883949,914600957);

-- ## tabela EpocaAno ##
INSERT INTO  epocaano(idEpoca,dataInicio,dataFim,valorEpoca,descricaoEpoca) VALUES(1,TO_DATE('01/Janeiro/2020','DD/MON/YYYY'),TO_DATE('31/Mar�o/2020','DD/MON/YYYY'),50,'Baixa');
INSERT INTO  epocaano(idEpoca,dataInicio,dataFim,valorEpoca,descricaoEpoca) VALUES(2,TO_DATE('01/Abril/2020','DD/MON/YYYY'),TO_DATE('31/Agosto/2020','DD/MON/YYYY'),75,'Media');
INSERT INTO  epocaano(idEpoca,dataInicio,dataFim,valorEpoca,descricaoEpoca) VALUES(3,TO_DATE('01/Setembro/2020','DD/MON/YYYY'),TO_DATE('31/Dezembro/2020','DD/MON/YYYY'),100,'Alta');

-- ## tabela Endereco ##
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(4567,'Vila Real',5400765,'Chaves');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(2341,'Porto',4564909,'PENAFIEL');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(2312,'Madeira',9360217,'PONTA DO SOL');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(1234,'Beja',7940461,'VILA RUIVA');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9834,'Lisboa',1100610,'LISBOA');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(4312,'Coimbra',3361909,'Penacova');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(7812,'Faro',8600022,'Lagos');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9302,'Guarda',6300015,'Vale de Azares');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(2314,'Viana do Castelo',4980312,'Ponte da Barca');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9842,'Viana do Castelo',4980451,'Lindoso');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(8554,'Faro',8670064,'Aljezur');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(4235,'Aveiro',4550372,'Castelo de Paiva');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(8523,'Braga',4820141,'Fafe');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9123,'Aveiro',3865011,'Estarreja');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(5681,'Porto',4250035,'Trofa');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9852,'Viseu',5100417,'Lamego');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(9835,'Beja',7940017,'Cuba');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(8423,'Aveiro',3780054,'Anadia');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(3213,'Faro',8201901,'Albufeira');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(7832,'Evora',704003,'Arraiolos');--## 20
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(6043,'Porto',4564908,'Penafiel');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(7263,'Viseu',3460059,'Tondela');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(8425,'Beja',7830503,'Serpa');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(8424,'Castelo Branco',6225283,'Covilha');
INSERT INTO endereco(idEndereco,localidade,codPostal,concelho) VALUES(5423,'Castelo Branco',6251909,'Belmonte');

-- ## tabela Cliente ##
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(746754328,4567,'Jose silva','918445234');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(727415385,2341,'Chico','hico@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(338589294,2312,'Piere','923567123');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(424871850,1234,'Dex','952890432');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(951234534,9834,'Jose','sid34@hotmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(568909876,4312,'Costa','914614950');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(124265825,7812,'Caylee','912456923');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(971238124,9302,'Josh','9456130');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(481203780,2314,'Dias','Dis<3@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(791284701,9842,'Esteves','912235676');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(128913679,2312,'Luis','Gamer56@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(569823792,8554,'Kevin','912234789');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(418757891,4235,'Tay','tatie@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(345902142,8523,'Nelson','912451243');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(341124569,9123,'Bob','942423789');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(581298988,5681,'Kyle','Cartmansucks@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(298747897,9852,'Cartman','Kylesucks@gmail.com');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(294142524,4235,'Cyle','912345980');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(612451244,8423,'Kenny','912356352');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(631245123,3213,'Hyde','Hydeiskoll@gmail.com');--##20
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(734803948,6043,'Joao','912356332');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(456783567,7263,'GilBerto','938426234');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(612453294,8423,'Aldelaide','923456123');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(612451214,8424,'Rubien','912356342');
INSERT INTO cliente(NIF,idEndereco,nome,contacto) VALUES(612451243,5423,'Jose','912354352');

-- ## tabela Conta ##
INSERT INTO conta (idConta,dataAbertura) VALUES(1,TO_DATE('23/Maio/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(2,TO_DATE('14/julho/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(3,TO_DATE('4/abril/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(4,TO_DATE('24/Janeiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(5,TO_DATE('21/Fevereiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(6,TO_DATE('5/Janeiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(7,TO_DATE('29/Agosto/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(8,TO_DATE('5/Novembro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(9,TO_DATE('30/Abril/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(10,TO_DATE('5/Agosto/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(11,TO_DATE('6/Janeiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(12,TO_DATE('30/Novembro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(13,TO_DATE('30/Abril/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(14,TO_DATE('3/Novembro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(15,TO_DATE('1/fevereiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(16,TO_DATE('2/fevereiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(17,TO_DATE('1/Maio/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(18,TO_DATE('1/fevereiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(19,TO_DATE('20/agosto/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(20,TO_DATE('4/fevereiro/2020','DD/MON/YYYY'));
INSERT INTO conta (idConta,dataAbertura) VALUES(21,TO_DATE('19/fevereiro/2020','DD/MON/YYYY'));

-- ## tabela Consumo ##
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(1,1,511064551,2,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(2,2,974317764,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(3,3,514464551,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(4,4,508264049,1,'Coke Cola');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(5,5,502162147,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(22,5,502162147,5,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(21,5,502162147,5,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(6,6,545784628,2,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(7,7,511064551,5,'7 Up');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(8,8,974317764,5,'Coke Cola');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(9,9,514464551,2,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(10,10,508264049,1,'7 Up');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(11,11,502162147,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(12,12,545784628,2,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(13,13,511064551,1,'Fruita');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(14,14,974317764,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(15,15,514464551,2,'KitKat');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(16,16,508264049,5,'Milka');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(17,17,502162147,1,'Fruita');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(18,18,545784628,1,'Coke Cola');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(19,19,545784628,1,'Fruita');
INSERT INTO consumo(idConsumo,idConta,camareiraNIF,valorAssociado,descProduto) VALUES(20,20,511064551,2,'KitKat');

-- ## tabela Intervencao ##
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(1,34,246593759,TO_DATE('17/Novembro/2020','DD/MON/YYYY'),'Reparacao','Nao Resolvido','Frigobar');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(2,923,673956759,TO_DATE('17/Novembro/2020','DD/MON/YYYY'),'Reparacao','Resolvido','TV');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(3,34,511064551,TO_DATE('01/Abril/2020','DD/MON/YYYY'),'Limpeza','Resolvido','Limpar o Quarto');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(23,923,508264049,TO_DATE('26/Agosto/2020','DD/MON/YYYY'),'Limpeza','Resolvido','Limpar o Quarto');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(56,523,673956759,TO_DATE('22/Junho/2020','DD/MON/YYYY'),'Reparacao','Nao Resolvido','Frigobar');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(12,571,246593759,TO_DATE('14/Novembro/2020','DD/MON/YYYY'),'Reparacao','Nao Resolvido','Ar Condicionado');
INSERT INTO intervencao(idIntervencao,idQuarto,funcionarioNIF,dataIntervencao,realizacao,estadoIntervencao,descricao) VALUES(45,785,545784628,TO_DATE('29/Janeiro/2020','DD/MON/YYYY'),'Limpeza','Resolvido','Limpar o Quarto');

-- ## tabela Reserva ##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(123,746754328,34,1,1,4,TO_DATE('21/Maio/2020','DD/MON/YYYY'),TO_DATE('5/Julho/2020','DD/MON/YYYY'),TO_DATE('10/Janeiro/2020','DD/MON/YYYY'),9);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(234,727415385,34,1,2,2,TO_DATE('12/julho/2020','DD/MON/YYYY'),TO_DATE('6/Agosto/2020','DD/MON/YYYY'),TO_DATE('5/Maio/2020','DD/MON/YYYY'),10);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(567,338589294,523,1,3,2,TO_DATE('2/abril/2020','DD/MON/YYYY'),TO_DATE('25/Maio/2020','DD/MON/YYYY'),TO_DATE('12/Fevereiro/2020','DD/MON/YYYY'),11);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(789,424871850,435,1,4,3,TO_DATE('15/janeiro/2020','DD/MON/YYYY'),TO_DATE('3/Mar�o/2020','DD/MON/YYYY'),TO_DATE('5/Janeiro/2020','DD/MON/YYYY'),12);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(346,612451244,21,1,5,4,TO_DATE('23/Novembro/2020','DD/MON/YYYY'),TO_DATE('21/Dezembro/2020','DD/MON/YYYY'),TO_DATE('9/Junho/2020','DD/MON/YYYY'),13);--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(312,631245123,21,1,6,3,TO_DATE('27/Julho/2020','DD/MON/YYYY'),TO_DATE('17/Dezembro/2020','DD/MON/YYYY'),TO_DATE('18/Abril/2020','DD/MON/YYYY'),14);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(446,734803948,21,1,7,1,TO_DATE('18/agosto/2020','DD/MON/YYYY'),TO_DATE('12/Dezembro/2020','DD/MON/YYYY'),TO_DATE('25/Julho/2020','DD/MON/YYYY'),13);
--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(863,568909876,34,2,4,2,TO_DATE('2/Janeiro/2020','DD/MON/YYYY'),TO_DATE('4/Janeiro/2020','DD/MON/YYYY'),TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),10);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(23,124265825,579,2,4,3,TO_DATE('26/Agosto/2020','DD/MON/YYYY'),TO_DATE('29/Agosto/2020','DD/MON/YYYY'),TO_DATE('20/Agosto/2020','DD/MON/YYYY'),11);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(286,971238124,923,2,3,1,TO_DATE('3/Novembro/2020','DD/MON/YYYY'),TO_DATE('3/Dezembro/2020','DD/MON/YYYY'),TO_DATE('1/Julho/2020','DD/MON/YYYY'),12);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(783,481203780,145,2,3,2,TO_DATE('30/Abril/2020','DD/MON/YYYY'),TO_DATE('6/Maio/2020','DD/MON/YYYY'),TO_DATE('5/Mar�o/2020','DD/MON/YYYY'),15);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(527,791284701,461,2,2,4,TO_DATE('5/Agosto/2020','DD/MON/YYYY'),TO_DATE('8/Agosto/2020','DD/MON/YYYY'),TO_DATE('1/Agosto/2020','DD/MON/YYYY'),16);--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(547,456783567,34,2,2,5,TO_DATE('31/Janeiro/2020','DD/MON/YYYY'),TO_DATE('5/fevereiro/2020','DD/MON/YYYY'),TO_DATE('3/Janeiro/2020','DD/MON/YYYY'),18);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(529,612453294,461,2,1,2,TO_DATE('31/Janeiro/2020','DD/MON/YYYY'),TO_DATE('6/fevereiro/2020','DD/MON/YYYY'),TO_DATE('3/Janeiro/2020','DD/MON/YYYY'),20);
--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(428,128913679,234,3,4,1,TO_DATE('5/Junho/2020','DD/MON/YYYY'),TO_DATE('9/Junho/2020','DD/MON/YYYY'),TO_DATE('5/Maio/2020','DD/MON/YYYY'),20);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(420,569823792,421,3,4,2,TO_DATE('30/Novembro/2020','DD/MON/YYYY'),TO_DATE('6/Dezembro/2020','DD/MON/YYYY'),TO_DATE('10/Julho/2020','DD/MON/YYYY'),18);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(660,418757891,452,3,3,3,TO_DATE('30/Abril/2020','DD/MON/YYYY'),TO_DATE('7/Maio/2020','DD/MON/YYYY'),TO_DATE('5/Janeiro/2020','DD/MON/YYYY'),16);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(666,345902142,34,3,2,3,TO_DATE('3/Novembro/2020','DD/MON/YYYY'),TO_DATE('5/Dezembro/2020','DD/MON/YYYY'),TO_DATE('5/Fevereiro/2020','DD/MON/YYYY'),14);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(669,341124569,123,3,2,2,TO_DATE('31/Janeiro/2020','DD/MON/YYYY'),TO_DATE('2/fevereiro/2020','DD/MON/YYYY'),TO_DATE('5/Janeiro/2020','DD/MON/YYYY'),12);--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(827,612451214,461,2,1,4,TO_DATE('31/Janeiro/2020','DD/MON/YYYY'),TO_DATE('3/Maio/2020','DD/MON/YYYY'),TO_DATE('5/Janeiro/2020','DD/MON/YYYY'),10);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(999,345902142,923,2,1,4,TO_DATE('12/maio/2020','DD/MON/YYYY'),TO_DATE('3/junho/2020','DD/MON/YYYY'),TO_DATE('5/Mar�o/2020','DD/MON/YYYY'),8);
--##
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(4,568909876,133,2,4,2,TO_DATE('2/Janeiro/2020','DD/MON/YYYY'),TO_DATE('4/Janeiro/2020','DD/MON/YYYY'),TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),10);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(5,124265825,133,2,4,3,TO_DATE('26/Agosto/2020','DD/MON/YYYY'),TO_DATE('29/Agosto/2020','DD/MON/YYYY'),TO_DATE('20/Agosto/2020','DD/MON/YYYY'),11);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(6,971238124,133,2,3,1,TO_DATE('3/Novembro/2020','DD/MON/YYYY'),TO_DATE('3/Dezembro/2020','DD/MON/YYYY'),TO_DATE('1/Julho/2020','DD/MON/YYYY'),12);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(7,481203780,21,2,3,2,TO_DATE('30/Abril/2020','DD/MON/YYYY'),TO_DATE('6/Maio/2020','DD/MON/YYYY'),TO_DATE('5/Mar�o/2020','DD/MON/YYYY'),15);
INSERT INTO reserva(idReserva,NIF,idQuarto,idEpoca,idConta,nrPessoas,dataEntrada,dataSaida,datareserva,horareserva) VALUES(8,791284701,21,2,2,4,TO_DATE('5/Agosto/2020','DD/MON/YYYY'),TO_DATE('8/Agosto/2020','DD/MON/YYYY'),TO_DATE('1/Agosto/2020','DD/MON/YYYY'),16);

-- ## tabela Fatura ##
INSERT INTO fatura (idReserva,idConta) VALUES(123,1);
INSERT INTO fatura (idReserva,idConta) VALUES(234,2);
INSERT INTO fatura (idReserva,idConta) VALUES(567,3);
INSERT INTO fatura (idReserva,idConta) VALUES(789,4);
INSERT INTO fatura (idReserva,idConta) VALUES(346,5);
INSERT INTO fatura (idReserva,idConta) VALUES(863,6);
INSERT INTO fatura (idReserva,idConta) VALUES(23,7);
INSERT INTO fatura (idReserva,idConta) VALUES(286,8);
INSERT INTO fatura (idReserva,idConta) VALUES(783,9);
INSERT INTO fatura (idReserva,idConta) VALUES(527,10);
INSERT INTO fatura (idReserva,idConta) VALUES(428,11);
INSERT INTO fatura (idReserva,idConta) VALUES(420,12);
INSERT INTO fatura (idReserva,idConta) VALUES(660,13);
INSERT INTO fatura (idReserva,idConta) VALUES(666,14);
INSERT INTO fatura (idReserva,idConta) VALUES(669,15);
INSERT INTO fatura (idReserva,idConta) VALUES(312,16);
INSERT INTO fatura (idReserva,idConta) VALUES(446,17);
INSERT INTO fatura (idReserva,idConta) VALUES(547,18);
INSERT INTO fatura (idReserva,idConta) VALUES(529,19);
INSERT INTO fatura (idReserva,idConta) VALUES(827,20);
INSERT INTO fatura (idReserva,idConta) VALUES(999,21);

-- ## tabela FormaPagamento ##
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(123,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(234,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(567,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(789,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(346,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(863,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(23,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(286,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(783,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(527,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(428,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(420,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(660,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(666,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(669,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(312,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(446,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(547,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(529,'Dinheiro');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(827,'Cart�o');
INSERT INTO formapagamento(idReserva,descFormaPagam) VALUES(999,'Dinheiro');

-- ## tabela EstadoReserva ##
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(8,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),'Cancelada');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(312,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(7,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(446,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(346,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(4,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(5,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(6,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(783,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(420,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(660,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(827,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(529,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(527,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(567,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(286,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(999,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(123,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(234,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(666,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(547,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(863,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(669,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(428,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(789,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
INSERT INTO estadoreserva(idReserva,custo,dataAlteracao,descricaoEstado) VALUES(23,100,TO_DATE('1/Janeiro/2020','DD/MON/YYYY'),' ');
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
 * Caminho: E:/GITHUB 1190402/Licenciatura/2ºANO/1ºSEMESTRE/BDDAD/Trabalhos Práticos/TP1/SQL/IT1-INSERT.sql
 * Ficheiro:  IT1-INSERT.sql
 * Última Edição: 18/05/21, 19:15
 * Nome da Classe: IT1-INSERT.sql
 */

-- ** guardar em DEFINITIVO as altera��es na base de dados, se a op��o Autocommit do SQL Developer n�o estiver ativada **
-- COMMIT;