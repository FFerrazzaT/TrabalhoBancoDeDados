/*
Integrantes:
--Fernando Ferrazza Toniolo
--Otávio Costa de Oliveira

Video: https://drive.google.com/file/d/1G9j1n2du9R5zGFMXE0LpIPabahC2Kf3B/view?usp=sharing

*/

DROP SCHEMA IF EXISTS projetodb;

CREATE SCHEMA projetodb;

USE projetodb;
--
-- //TABELAS
--

CREATE TABLE CIDADAO(
	CPF varchar(50) unique not null,
	nome varchar(50),
	idade int,
	endereco varchar(50),
	contato varchar(11),
    
    PRIMARY KEY(CPF),
    UNIQUE (CPF)
);

CREATE TABLE TRIAGEM(
	CPF varchar(50) not null,
	comorbidade varchar(50),
	sintoma varchar(50),
	data_registro varchar(10),
    registroID int
    
	/*PRIMARY KEY(CPF),
    UNIQUE (CPF)*/
);

CREATE TABLE COMORBIDADE(
	comorbidade varchar(50),
	tipo_teste varchar(3),
	sintoma varchar(50)
    
	/*PRIMARY KEY (tipo_teste)*/
);

CREATE TABLE BANCOTESTE(
    CPF varchar(50) unique not null,
	tipo_teste varchar(3),
	data_registro varchar(10),
	horario varchar(5),
	resultado boolean,
    
    PRIMARY KEY (CPF),
	UNIQUE (CPF)
);

--
--
-- // TABELAS
--
--

-- //Tabela(cpf,  nome, idade, endereço, contato)
INSERT INTO CIDADAO 
(CPF, nome, idade, endereco, contato) VALUES
	( '52049816815','JOÃO DA CUNHA FILHO', 25,'RUA DAS FLORES-PO, 180', '99534-5068'),
	( '34044615678','MARIA MEDEIROS APARECIDA', 49,'RUA CURRALINHO-PO, 940', '98434-3591'),
	( '18073518473','CARMINHA ROCHA DA GUERRA', 35,'RUA BATIMAN-PO, 756', '99518-5357'),
	( '49847655502','MARIA DO CARMO BENEDITA', 60,'AVENIDA ALCENO-PO, 170', '98354-0750'),
	( '48627543178','MAURO DA ROSA AMARAL', 65,'TRAVESSA BOMFIM-PO, 957', '99563-1845'),
	( '18684678214','EDIMAR PEREIRA DA GUERRA', 38,'RUA BATIMAN-PO, 756', '98365-4205'),
	( '49957255152','EDINA SIRIA DOS PAMPAS', 32,'AVENIDA ALCENO-PO, 195', '98607-5750'),
	( '38516575502','EUCÍRIO DA ROSA PEREIRA', 73,'RUA DAS FLORES-PO, 158', '98683-5487'),
	( '04217865178','CARLA MEDEIROS FILHO', 24,'RUA DAS FLORES-PO, 180', '99550-4245'),
	( '75284664305','JOSE BARROS VIDEIRA', 84,'RUA BATIMAN-PO, 140', '99763-6299'),
	( '06477784522','GUAITACA PAMPAS NETO', 32,'RUA CURRALINHO-PO, 930', '98699-8667');

-- //Tabela(cpf, comorbidade, sintoma, data_registro)
INSERT INTO TRIAGEM
(registroID, CPF, comorbidade, sintoma, data_registro) VALUES 
	('01', '52049816815', 'DIABETE', 'FALTA DE AR', '10/12/2020'),
	('02', '52049816815', 'PNEUMONIA', 'FEBRE', '10/12/2020'),
	('03', '52049816815', 'DIABETE', 'CORIZA', '17/08/2020'),
	('04', '34044615678', 'DIABETE', 'FEBRE','15/08/2020'),
	('05', '34044615678', 'DOWN', 'CORIZA', '15/08/2020'),
	('06', '18073518473', 'CARDIOPATIA', 'CANSAÇO', '15/06/2020'),
	('07', '49847655502', 'DIABETE', 'DIARREIA', '15/06/2020'),
	('08', '49847655502', 'PENUMONIA', 'FALTA DE AR','15/09/2020'),
	('09', '49847655502', 'PNEUMONIA', 'FALTA DE AR','15/04/2020'),
	('10', '49847655502', 'DIABETE', 'FEBRE', '15/05/2020'),
	('11', '48627543178', 'HIPERTENSÃO', 'DIARREIA', '15/11/2020'),
	('12', '18684678214', 'HIPERTENSÃO', 'FADIGA', '15/10/2020'),
	('13', '49957255152', 'DIABETE', 'FEBRE', '15/07/2020'),
	('14', '49957255152', 'DOWN', 'CANSAÇO', '15/08/2020'),
	('15', '38516575502', 'DOWN', 'TOSSE', '15/07/2020'),
	('16', '38516575502', 'CARDIOPATIA', 'DIARREIA', '30/09/2020'),
	('17', '38516575502', 'PENUMONIA', 'CONGESTÃO NASAL', '13/07/2020'),
	('18', '38516575502', 'PENUMONIA', 'DORES', '06/10/2020'),
	('19', '38516575502', 'DIABETE', 'FADIGA', '05/11/2020'),
	('20', '38516575502', 'CARDIOPATIA', 'DOR', '04/07/2020'),
	('21', '04217865178', 'CARDIOPATIA', 'FALTA DE AR', '01/08/2020'),
	('22', '04217865178', 'DOWN', 'DIARREIA', '10/04/2020'),
	('23', '04217865178', 'DOWN', 'FEBRE', '22/06/2020'),
	('24', '75284664305', 'HIPERTENSÃO', 'FADIGA', '24/05/2020'),
	('25', '75284664305', 'HIPERTENSÃO', 'FEBRE', '19/07/2020'),
	('26', '75284664305', 'HIPERTENSÃO', 'FALTA DE AR', '10/08/2021'),
	('27', '06477784522', 'CARDIOPATIA', 'FALTA DE AR', '02/08/2021');

-- //Tabela(comorbidade, tipo_teste, sintoma)
INSERT INTO COMORBIDADE
(comorbidade, tipo_teste) VALUES 
	('HIPERTENSÃO', 'PCR'),
	('DOWN', 'PCR'),
	('PNEUMONIA', 'TR'),
	('CARDIOPATIA', 'PCR'),
	('DIABETE', 'TR');
	
-- //Tabela(tipoteste, data, horario, resultado) <FALSE para resultado negativo>
INSERT INTO BANCOTESTE 
(CPF, tipo_teste, data_registro, horario, resultado) VALUES 
	('18684678214','PCR', '25/06/2021','15:45', FALSE),
	('49957255152','PCR', '25/04/2021','08:20', TRUE),
	('38516575502','PCR', '30/05/2021','09:35', FALSE),
	('04217865178','TR', '26/05/2021','15:40', TRUE),
	('75284664305','TR', '27/08/2021','17:45', TRUE),
	('06477784522','PCR', '1/12/2021','13:30', TRUE);

--
--
-- //CONSULTAS
--
--

-- //Consulta que recupera o número de de cidadãos atendidos que relataram pelo menos dois sintomas

WITH tabela AS(
SELECT 
  CPF, COUNT(registroID) > 1 AS contagem
FROM 
  TRIAGEM
WHERE
  registroID
GROUP BY CPF)
 SELECT 
   sum(contagem) AS contagem_resultante
 FROM 
   tabela;


-- //Consulta que retorna a quantidade de pacientes testados positivos, agrupados por nome do tipo de teste
-- realizado
SELECT 
  tipo_teste,
  COUNT(resultado) AS quantidade_de_positivos
FROM 
  BANCOTESTE
WHERE 
  resultado IS NOT FALSE
GROUP BY tipo_teste; 


-- //Consulta com uma listagem de notificação, que informa o nome do paciente, a idade, o tipo de teste
-- e a data de testagem de todos os pacientes testados positivos
SELECT CIDADAO.nome, CIDADAO.idade, BANCOTESTE.tipo_teste, BANCOTESTE.data_registro
FROM BANCOTESTE INNER JOIN CIDADAO
ON BANCOTESTE.CPF = CIDADAO.CPF
WHERE BancoTeste.resultado IS NOT FALSE
ORDER BY idade ASC;


-- //Consulta que retorna a quantidade de pacientes testados negativos
SELECT
  COUNT(resultado) AS quantidade_de_negativos
FROM 
  BANCOTESTE
WHERE 
  resultado IS FALSE
ORDER BY tipo_teste; 


-- //Consulta que retorna o paciente mais novo que testou positivo
SELECT CIDADAO.idade, CIDADAO.nome
FROM CIDADAO INNER JOIN BANCOTESTE
WHERE BANCOTESTE.resultado IS NOT NULL
ORDER BY CIDADAO.idade ASC LIMIT 1;
