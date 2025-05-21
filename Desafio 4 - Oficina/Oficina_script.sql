-- Criando o banco de dados Oficina
Create database Oficina;

Use Oficina;

-- Criando a Tabela Cliente
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Telefone VARCHAR(12),
    Endereco VARCHAR(45),
    CPF_CNPJ VARCHAR(18)
);

-- Criando a Tabela Mão de obra
create table Mao_de_obra (
idMao_de_obra int primary key auto_increment,
Tipo_de_serviço varchar (45),
Descricao_do_servico varchar (500)
);


-- Criando a Tabela Equipe de mecânicos
create table Equipe_de_mecanicos (
idEquipe_de_Mecanicos int primary key auto_increment,
Codigo varchar (45),
Nome varchar (45),
Endereco varchar (45),
Especialidade varchar (45)
);

-- Criando a Tabela Peças consumidas
create table Pecas_consumidas (
idPecas_consumidas int primary key auto_increment,
nome_peca varchar (45),
Valor_unitario float,
Quantidade int
);

-- Criando a Tabela Forma de pagamento 
create table Forma_de_pagamento (
idForma_de_pagamento  int primary key auto_increment,
Dinheiro float,
Cartão_de_crédito varchar (16),
cartão_de_débito varchar (16),
Boleto varchar (50),
Transferência varchar (45),
Pix varchar (40)
);

-- Criando a Tabela Veículo
create table Veiculo (
idVeiculo int primary key auto_increment,
Nome varchar (45),
Tipo Enum ('2x2', '2x4', '4x2', '4x4'),
Placa varchar (8),
Descricao varchar (45)
);

-- Criando a Tabela Ordem de serviço
DROP TABLE IF EXISTS Ordem_de_servico;
CREATE TABLE Ordem_de_servico (
  idOrdem_de_servico INT PRIMARY KEY AUTO_INCREMENT,
  Data_de_emissão DATE,
  Data_do_agendamento_do_servico DATE,
  Data_de_entrega DATE,
  Valor_das_pecas FLOAT,
  Valor_do_serviço FLOAT,
  Status_do_processo ENUM('Em aguardo', 'Em serviço', 'Aguardando peças', 'Concluído', 'Cancelado'),
  Descricao_dos_serviços_a_serem_realizados VARCHAR(500),

  -- Colunas para armazenar os valores das chaves estrangeiras
  IdCliente INT,
  idMao_de_obra INT,
  idEquipe_de_Mecanicos INT,
  idPecas_consumidas INT,
  idForma_de_pagamento INT,
  idVeiculo INT,

  -- Definindo as chaves estrangeiras corretamente
  CONSTRAINT fk_cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
  CONSTRAINT fk_Mao_de_obra FOREIGN KEY (idMao_de_obra) REFERENCES Mao_de_obra(idMao_de_obra),
  CONSTRAINT fk_Equipe_de_Mecanicos FOREIGN KEY (idEquipe_de_Mecanicos) REFERENCES Equipe_de_Mecanicos(idEquipe_de_Mecanicos),
  CONSTRAINT fk_Pecas_consumidas FOREIGN KEY (idPecas_consumidas) REFERENCES Pecas_consumidas(idPecas_consumidas),
  CONSTRAINT fk_Forma_de_pagamento FOREIGN KEY (idForma_de_pagamento) REFERENCES Forma_de_pagamento(idForma_de_pagamento),
  CONSTRAINT fk_Veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

select * from Ordem_de_servico;

-- INSERINDO VALORES DENTRO DA TABELA CLIENTE
insert into Cliente (Nome, Telefone, Endereco, CPF_CNPJ) values 
('Ana Silva', '11987654321', 'Rua A, 123', '123.456.789-09'),
('Carlos Souza', '21987654321', 'Rua B, 456', '987.654.321-00'),
('Maria Oliveira', '31987654321', 'Rua C, 789', '123.123.123-12'),
('João Santos', '41987654321', 'Rua D, 101', '321.321.321-00'),
('Fernanda Costa', '51987654321', 'Rua E, 202', '456.456.456-45'),
('Pedro Lima', '61987654321', 'Rua F, 303', '654.654.654-32'),
('Julia Pereira', '71987654321', 'Rua G, 404', '789.789.789-01'),
('Lucas Almeida', '81987654321', 'Rua H, 505', '987.987.987-98'),
('Mariana Rocha', '91987654321', 'Rua I, 606', '123.321.123-00'),
('Ricardo Martins', '11976543210', 'Rua J, 707', '321.654.987-65'),
('Tatiane Ferreira', '21976543210', 'Rua K, 808', '456.789.123-45'),
('Gabriel Santos', '31976543210', 'Rua L, 909', '654.321.987-12'),
('Sofia Lima', '41976543210', 'Rua M, 111', '789.123.456-78'),
('Thiago Mendes', '51976543210', 'Rua N, 222', '987.012.345-67'),
('Nathalia Lima', '61976543210', 'Rua O, 333', '123.456.789-00'),
('Vinícius Gomes', '71976543210', 'Rua P, 444', '321.987.654-32'),
('Larissa Costa', '81976543210', 'Rua Q, 555', '456.123.789-21'),
('André Santos', '91976543210', 'Rua R, 666', '654.789.321-10'),
('Bianca Oliveira', '11965432109', 'Rua S, 777', '789.654.123-00'),
('Felipe Rocha', '21965432109', 'Rua T, 888', '123.789.456-12'),
('Tatiane Alves', '31965432109', 'Rua U, 999', '321.123.654-45'),
('Eduardo Dias', '41965432109', 'Rua V, 1000', '456.789.321-98'),
('Clara Martins', '51965432109', 'Rua W, 1100', '654.456.123-67'),
('Rafael Lima', '61965432109', 'Rua X, 1200', '789.321.654-32'),
('Aline Sousa', '71965432109', 'Rua Y, 1300', '987.123.456-21'),
('Felipe Costa', '81965432109', 'Rua Z, 1400', '123.654.789-10'),
('Gustavo Almeida', '91965432109', 'Rua AA, 1500', '321.789.123-45'),
('Patrícia Rocha', '11954321098', 'Rua AB, 1600', '456.321.987-65'),
('Leonardo Ferreira', '21954321098', 'Rua AC, 1700', '654.987.321-12'),
('Jéssica Santos', '31954321098', 'Rua AD, 1800', '789.456.123-78'),
('Bruno Oliveira', '41954321098', 'Rua AE, 1900', '987.321.654-00'),
('Vanessa Costa', '51954321098', 'Rua AF, 2000', '123.456.987-12'),
('Fernando Lima', '61954321098', 'Rua AG, 2100', '321.654.789-45'),
('Amanda Mendes', '71954321098', 'Rua AH, 2200', '456.789.123-67'),
('Marcos Santos', '81954321098', 'Rua AI, 2300', '654.123.456-78'),
('Cíntia Rocha', '91954321098', 'Rua AJ, 2400', '789.987.321-21'),
('Eduarda Almeida', '11943210987', 'Rua AK, 2500', '123.123.321-00'),
('Diego Ferreira', '21943210987', 'Rua AL, 2600', '321.987.654-12'),
('Lívia Santos', '31943210987', 'Rua AM, 2700', '456.654.321-78'),
('Roberto Lima', '41943210987', 'Rua AN, 2800', '654.321.789-00'),
('Sérgio Almeida', '51943210987', 'Rua AO, 2900', '789.456.123-45'),
('Tânia Costa', '61943210987', 'Rua AP, 3000', '987.654.321-65'),
('Vinícius Ferreira', '71943210987', 'Rua AQ, 3100', '123.789.456-78'),
('Renata Santos', '81943210987', 'Rua AR, 3200', '321.654.987-12'),
('Cláudio Oliveira', '91943210987', 'Rua AS, 3300', '456.123.789-00'),
('Miriam Rocha', '11932109876', 'Rua AT, 3400', '654.789.321-32'),
('Gustavo Santos', '21932109876', 'Rua AU, 3500', '789.123.456-21'),
('Fábio Almeida', '31932109876', 'Rua AV, 3600', '987.987.654-10');

-- INSERINDO VALORES DENTRO DA TABELA MÃO DE OBRA
INSERT INTO Mao_de_obra (Tipo_de_serviço, Descricao_do_servico) values
('Troca de óleo', 'Serviço de troca de óleo e filtros do motor.'),
('Revisão geral', 'Revisão completa do veículo, incluindo checagem de todos os sistemas.'),
('Alinhamento', 'Serviço de alinhamento e balanceamento de rodas.'),
('Troca de pneus', 'Substituição de pneus desgastados por novos.'),
('Reparo de freios', 'Verificação e substituição de pastilhas e discos de freio.'),
('Instalação de som', 'Instalação de sistema de som automotivo, incluindo alto-falantes e amplificadores.'),
('Reparo de ar condicionado', 'Diagnóstico e reparo do sistema de ar condicionado do veículo.'),
('Troca de bateria', 'Substituição da bateria do veículo por uma nova.'),
('Limpeza de injetores', 'Limpeza dos bicos injetores para melhorar a performance do motor.'),
('Troca de velas', 'Substituição das velas de ignição para otimizar o funcionamento do motor.'),
('Reparo de suspensão', 'Verificação e reparo do sistema de suspensão do veículo.'),
('Troca de correia dentada', 'Substituição da correia dentada para evitar danos ao motor.'),
('Reparo de direção hidráulica', 'Serviço de reparo e manutenção do sistema de direção hidráulica.'),
('Troca de lâmpadas', 'Substituição de lâmpadas queimadas do veículo.'),
('Revisão de sistema elétrico', 'Verificação e reparo do sistema elétrico do carro.'),
('Reparo de escapamento', 'Manutenção e reparo do sistema de escapamento do veículo.'),
('Troca de filtro de ar', 'Substituição do filtro de ar do motor.'),
('Verificação de fluidos', 'Checagem e reposição de fluidos do veículo.'),
('Reparo de caixa de direção', 'Manutenção da caixa de direção para garantir a dirigibilidade.'),
('Instalação de sensores', 'Instalação de sensores de estacionamento e câmeras de ré.'),
('Troca de coxins', 'Substituição dos coxins do motor e da transmissão.'),
('Limpeza de sistema de arrefecimento', 'Limpeza do radiador e do sistema de arrefecimento.'),
('Reparo de motor de partida', 'Serviço de diagnóstico e reparo do motor de partida.'),
('Troca de mangueiras', 'Substituição de mangueiras danificadas do sistema de arrefecimento.'),
('Instalação de faróis de LED', 'Substituição dos faróis tradicionais por faróis de LED.'),
('Reparo de transmissão', 'Manutenção e reparo do sistema de transmissão do veículo.'),
('Troca de embreagem', 'Substituição do sistema de embreagem do veículo.'),
('Revisão de câmbio', 'Verificação e manutenção do câmbio automático ou manual.'),
('Reparo de injeção eletrônica', 'Diagnóstico e reparo do sistema de injeção eletrônica.'),
('Troca de radiador', 'Substituição do radiador para evitar superaquecimento.'),
('Verificação de freios ABS', 'Diagnóstico e reparo do sistema de freios ABS.'),
('Reparo de vidros elétricos', 'Manutenção do sistema de vidros elétricos do veículo.'),
('Troca de amortecedores', 'Substituição dos amortecedores para melhorar a estabilidade.'),
('Reparo de sistema de escape', 'Manutenção do sistema de escape para reduzir emissões.'),
('Troca de pastilhas de freio', 'Substituição das pastilhas de freio dianteiras e traseiras.'),
('Limpeza de filtros de ar', 'Limpeza dos filtros de ar do motor e do habitáculo.'),
('Verificação de bateria', 'Teste e verificação do estado da bateria do veículo.'),
('Reparo de fechaduras', 'Manutenção das fechaduras e sistemas de segurança do veículo.'),
('Instalação de alarmes', 'Instalação de sistemas de alarme e rastreamento.'),
('Troca de óleo de transmissão', 'Substituição do óleo da transmissão automática ou manual.'),
('Reparo de lanternas', 'Manutenção e reparo das lanternas traseiras e dianteiras.'),
('Troca de filtros de combustível', 'Substituição dos filtros de combustível para garantir eficiência.'),
('Verificação de direção', 'Checagem do sistema de direção e suspensão do veículo.'),
('Reparo de arrefecimento', 'Manutenção do sistema de arrefecimento para evitar superaquecimento.'),
('Instalação de kit de suspensão', 'Instalação de kits de suspensão para melhorar a performance do veículo.'),
('Troca de rolamentos', 'Substituição de rolamentos de rodas para garantir segurança.'),
('Reparo de sistemas de segurança', 'Verificação e reparo dos sistemas de segurança do veículo.'),
('Troca de óleo de motor', 'Substituição do óleo do motor para garantir a lubrificação adequada.');

INSERT INTO Equipe_de_mecanicos (Codigo, Nome, Endereco, Especialidade) VALUES
('MEC001', 'Carlos Silva', 'Rua das Flores, 123', 'Mecânica Geral'),
('MEC002', 'Ana Oliveira', 'Avenida Brasil, 456', 'Eletricidade Automotiva'),
('MEC003', 'João Santos', 'Rua dos Limoeiros, 789', 'Suspensão e Direção'),
('MEC004', 'Fernanda Costa', 'Rua da Paz, 101', 'Refrigeração'),
('MEC005', 'Pedro Almeida', 'Avenida das Américas, 202', 'Transmissão'),
('MEC006', 'Juliana Rocha', 'Rua do Sol, 303', 'Injeção Eletrônica'),
('MEC007', 'Ricardo Lima', 'Avenida do Comércio, 404', 'Freios e Suspensão'),
('MEC008', 'Tatiane Ferreira', 'Rua do Norte, 505', 'Mecânica de Motores'),
('MEC009', 'Lucas Mendes', 'Rua da Liberdade, 606', 'Rodas e Pneus'),
('MEC010', 'Mariana Pereira', 'Avenida do Trabalho, 707', 'Sistema Elétrico'),
('MEC011', 'André Santos', 'Rua dos Três Irmãos, 808', 'Reparo de Ar Condicionado'),
('MEC012', 'Bianca Alves', 'Rua das Palmeiras, 909', 'Revisão Geral'),
('MEC013', 'Gustavo Martins', 'Avenida São João, 111', 'Manutenção Preventiva'),
('MEC014', 'Sofia Lima', 'Rua do Comércio, 222', 'Instalação de Som'),
('MEC015', 'Fernando Dias', 'Rua do Rio, 333', 'Limpeza de Injetores'),
('MEC016', 'Cíntia Rocha', 'Avenida da Saúde, 444', 'Troca de Óleo'),
('MEC017', 'Diego Ferreira', 'Rua da Alegria, 555', 'Verificação de Freios'),
('MEC018', 'Lívia Santos', 'Rua da Esperança, 666', 'Troca de Baterias'),
('MEC019', 'Roberto Souza', 'Avenida do Futuro, 777', 'Reparo de Transmissão'),
('MEC020', 'Amanda Costa', 'Rua da Vitória, 888', 'Troca de Correia Dentada'),
('MEC021', 'Felipe Almeida', 'Rua do Lazer, 999', 'Troca de Velas'),
('MEC022', 'Tatiane Martins', 'Avenida do Sol, 1000', 'Manutenção de Suspensão'),
('MEC023', 'Ricardo Gomes', 'Rua do Parque, 1100', 'Reparo de Direção Hidráulica'),
('MEC024', 'Clara Oliveira', 'Rua do Mar, 1200', 'Instalação de Alarmes'),
('MEC025', 'Vinícius Rocha', 'Avenida da Liberdade, 1300', 'Reparo de Escapamento'),
('MEC026', 'Juliana Alves', 'Rua da Felicidade, 1400', 'Troca de Filtros'),
('MEC027', 'Eduardo Lima', 'Rua do Vale, 1500', 'Revisão de Motor'),
('MEC028', 'Marcos Silva', 'Avenida do Trabalho, 1600', 'Serviços de Pintura'),
('MEC029', 'Gabriel Ferreira', 'Rua da Esperança, 1700', 'Reparo de Vidros Elétricos'),
('MEC030', 'Patrícia Santos', 'Rua do Horizonte, 1800', 'Troca de Amortecedores'),
('MEC031', 'Rafael Costa', 'Avenida das Flores, 1900', 'Reparo de Sistema de Arrefecimento'),
('MEC032', 'Nathalia Lima', 'Rua da Paz, 2000', 'Revisão de Câmbio'),
('MEC033', 'Cláudio Mendes', 'Rua da Rua, 2100', 'Troca de Pneus'),
('MEC034', 'Miriam Rocha', 'Avenida do Comércio, 2200', 'Reparo de Suspensão'),
('MEC035', 'Leonardo Dias', 'Rua das Palmeiras, 2300', 'Reparo de Motor de Partida'),
('MEC036', 'Aline Ferreira', 'Rua da Liberdade, 2400', 'Instalação de Sensores'),
('MEC037', 'Fábio Santos', 'Avenida do Futuro, 2500', 'Troca de Radiador'),
('MEC038', 'Sérgio Almeida', 'Rua do Sol, 2600', 'Limpeza de Filtros de Ar'),
('MEC039', 'Vanessa Lima', 'Rua do Comércio, 2700', 'Verificação de Direção'),
('MEC040', 'Tatiane Martins', 'Avenida da Saúde, 2800', 'Reparo de Sistema Elétrico'),
('MEC041', 'André Costa', 'Rua da Esperança, 2900', 'Troca de Mangueiras'),
('MEC042', 'Felipe Oliveira', 'Rua do Rio, 3000', 'Revisão de Suspensão'),
('MEC043', 'Juliana Rocha', 'Avenida do Trabalho, 3100', 'Troca de Óleo de Transmissão'),
('MEC044', 'Lucas Santos', 'Rua da Alegria, 3200', 'Reparo de Freios ABS'),
('MEC045', 'Mariana Dias', 'Rua das Flores, 3300', 'Troca de Pastilhas de Freio'),
('MEC046', 'Ricardo Lima', 'Avenida da Liberdade, 3400', 'Instalação de Kit de Suspensão'),
('MEC047', 'Cíntia Alves', 'Rua do Comércio, 3500', 'Verificação de Sistemas de Segurança'),
('MEC048', 'Eduardo Ferreira', 'Rua do Vale, 3600', 'Reparo de Lanternas'),
('MEC049', 'Patrícia Martins', 'Avenida do Sol, 3700', 'Revisão de Sistema de Arrefecimento'),
('MEC050', 'Fernando Santos', 'Rua da Vitória, 3800', 'Troca de Rolamentos');

-- INSERINDO DADOS DENTRO DA TABELA PEÇAS CONSUMIDAS
INSERT INTO Pecas_consumidas (nome_peca, Valor_unitario, Quantidade) VALUES
('Óleo de motor', 50.00, 10),
('Filtro de óleo', 15.00, 20),
('Pastilha de freio', 30.00, 15),
('Correia dentada', 75.00, 5),
('Bateria', 200.00, 8),
('Amortecedor', 120.00, 12),
('Filtro de ar', 25.00, 18),
('Velas de ignição', 10.00, 25),
('Pneu', 300.00, 6),
('Lâmpada de farol', 20.00, 30),
('Radiador', 400.00, 4),
('Mangueira de arrefecimento', 35.00, 10),
('Coxim de motor', 45.00, 7),
('Sensor de estacionamento', 80.00, 9),
('Reparo de injetor', 60.00, 11),
('Disco de freio', 100.00, 14),
('Filtro de combustível', 20.00, 22),
('Bico injetor', 90.00, 13),
('Correia de acessórios', 40.00, 10),
('Tampa de válvula', 55.00, 8),
('Cabo de vela', 12.00, 20),
('Cilindro mestre de freio', 110.00, 5),
('Tubo de escape', 150.00, 3),
('Sistema de ar condicionado', 500.00, 2),
('Módulo de injeção', 250.00, 4),
('Cilindro de roda', 70.00, 6),
('Tampa de radiador', 18.00, 15),
('Reparo de direção hidráulica', 95.00, 7),
('Bujão de óleo', 8.00, 30),
('Filtro de cabine', 20.00, 12),
('Cabo de bateria', 25.00, 10),
('Cilindro de embreagem', 85.00, 9),
('Tubo de freio', 30.00, 14),
('Reparo de sistema elétrico', 120.00, 5),
('Rolamento de roda', 45.00, 11),
('Bico do limpador', 15.00, 20),
('Ponto de ignição', 30.00, 12),
('Cabo de freio', 25.00, 8),
('Reparo de sistema de escape', 100.00, 7),
('Cilindro de partida', 60.00, 6),
('Troca de óleo de transmissão', 150.00, 3),
('Filtro de transmissão', 40.00, 9),
('Reparo de injeção eletrônica', 90.00, 5),
('Conector elétrico', 10.00, 15),
('Sistema de iluminação', 80.00, 4),
('Reparo de arrefecimento', 70.00, 6),
('Cabo de embreagem', 35.00, 8),
('Ponteira de escapamento', 50.00, 10),
('Tubo de combustível', 20.00, 12),
('Reparo de motor de partida', 100.00, 5),
('Filtro de óleo de transmissão', 25.00, 9),
('Cilindro de freio', 75.00, 7),
('Reparo de sistema de ar condicionado', 200.00, 2);

-- INSERINDO DADOS DENTRO DA TABELA FORMA DE PAGAMENTO
INSERT INTO Forma_de_pagamento (Dinheiro, Cartão_de_crédito, cartão_de_débito, Boleto, Transferência, Pix) VALUES
(100.00, '1234567890123456', '2345678901234567', 'Boleto001', 'Transferência001', 'pix1234567890'),
(200.00, '3456789012345678', '4567890123456789', 'Boleto002', 'Transferência002', 'pix2345678901'),
(150.00, '5678901234567890', '6789012345678901', 'Boleto003', 'Transferência003', 'pix3456789012'),
(250.00, '7890123456789012', '8901234567890123', 'Boleto004', 'Transferência004', 'pix4567890123'),
(300.00, '8901234567890123', '9012345678901234', 'Boleto005', 'Transferência005', 'pix5678901234'),
(50.00, '0123456789012345', '1234567890123456', 'Boleto006', 'Transferência006', 'pix6789012345'),
(75.00, '1234567890123456', '2345678901234567', 'Boleto007', 'Transferência007', 'pix7890123456'),
(125.00, '2345678901234567', '3456789012345678', 'Boleto008', 'Transferência008', 'pix8901234567'),
(175.00, '3456789012345678', '4567890123456789', 'Boleto009', 'Transferência009', 'pix9012345678'),
(225.00, '4567890123456789', '5678901234567890', 'Boleto010', 'Transferência010', 'pix0123456789'),
(80.00, '5678901234567890', '6789012345678901', 'Boleto011', 'Transferência011', 'pix1234567890'),
(90.00, '6789012345678901', '7890123456789012', 'Boleto012', 'Transferência012', 'pix2345678901'),
(110.00, '7890123456789012', '8901234567890123', 'Boleto013', 'Transferência013', 'pix3456789012'),
(140.00, '8901234567890123', '9012345678901234', 'Boleto014', 'Transferência014', 'pix4567890123'),
(160.00, '9012345678901234', '0123456789012345', 'Boleto015', 'Transferência015', 'pix5678901234'),
(180.00, '0123456789012345', '1234567890123456', 'Boleto016', 'Transferência016', 'pix6789012345'),
(200.00, '1234567890123456', '2345678901234567', 'Boleto017', 'Transferência017', 'pix7890123456'),
(220.00, '2345678901234567', '3456789012345678', 'Boleto018', 'Transferência018', 'pix8901234567'),
(240.00, '3456789012345678', '4567890123456789', 'Boleto019', 'Transferência019', 'pix9012345678'),
(260.00, '4567890123456789', '5678901234567890', 'Boleto020', 'Transferência020', 'pix0123456789'),
(280.00, '5678901234567890', '6789012345678901', 'Boleto021', 'Transferência021', 'pix1234567890'),
(300.00, '6789012345678901', '7890123456789012', 'Boleto022', 'Transferência022', 'pix2345678901'),
(320.00, '7890123456789012', '8901234567890123', 'Boleto023', 'Transferência023', 'pix3456789012'),
(340.00, '8901234567890123', '9012345678901234', 'Boleto024', 'Transferência024', 'pix4567890123'),
(360.00, '9012345678901234', '0123456789012345', 'Boleto025', 'Transferência025', 'pix5678901234'),
(380.00, '0123456789012345', '1234567890123456', 'Boleto026', 'Transferência026', 'pix6789012345'),
(400.00, '1234567890123456', '2345678901234567', 'Boleto027', 'Transferência027', 'pix7890123456'),
(420.00, '2345678901234567', '3456789012345678', 'Boleto028', 'Transferência028', 'pix8901234567'),
(440.00, '3456789012345678', '4567890123456789', 'Boleto029', 'Transferência029', 'pix9012345678'),
(460.00, '4567890123456789', '5678901234567890', 'Boleto030', 'Transferência030', 'pix0123456789'),
(480.00, '5678901234567890', '6789012345678901', 'Boleto031', 'Transferência031', 'pix1234567890'),
(500.00, '6789012345678901', '7890123456789012', 'Boleto032', 'Transferência032', 'pix2345678901'),
(520.00, '7890123456789012', '8901234567890123', 'Boleto033', 'Transferência033', 'pix3456789012'),
(540.00, '8901234567890123', '9012345678901234', 'Boleto034', 'Transferência034', 'pix4567890123'),
(560.00, '9012345678901234', '0123456789012345', 'Boleto035', 'Transferência035', 'pix5678901234'),
(580.00, '0123456789012345', '1234567890123456', 'Boleto036', 'Transferência036', 'pix6789012345'),
(600.00, '1234567890123456', '2345678901234567', 'Boleto037', 'Transferência037', 'pix7890123456'),
(620.00, '2345678901234567', '3456789012345678', 'Boleto038', 'Transferência038', 'pix8901234567'),
(640.00, '3456789012345678', '4567890123456789', 'Boleto039', 'Transferência039', 'pix9012345678'),
(660.00, '4567890123456789', '5678901234567890', 'Boleto040', 'Transferência040', 'pix0123456789'),
(680.00, '5678901234567890', '6789012345678901', 'Boleto041', 'Transferência041', 'pix1234567890'),
(700.00, '6789012345678901', '7890123456789012', 'Boleto042', 'Transferência042', 'pix2345678901'),
(720.00, '7890123456789012', '8901234567890123', 'Boleto043', 'Transferência043', 'pix3456789012'),
(740.00, '8901234567890123', '9012345678901234', 'Boleto044', 'Transferência044', 'pix4567890123'),
(760.00, '9012345678901234', '0123456789012345', 'Boleto045', 'Transferência045', 'pix5678901234'),
(780.00, '0123456789012345', '1234567890123456', 'Boleto046', 'Transferência046', 'pix6789012345'),
(800.00, '1234567890123456', '2345678901234567', 'Boleto047', 'Transferência047', 'pix7890123456'),
(820.00, '2345678901234567', '3456789012345678', 'Boleto048', 'Transferência048', 'pix8901234567'),
(840.00, '3456789012345678', '4567890123456789', 'Boleto049', 'Transferência049', 'pix9012345678'),
(860.00, '4567890123456789', '5678901234567890', 'Boleto050', 'Transferência050', 'pix0123456789');

-- INSERINDO DADOS DENTRO DA TABELA VEÍCULO
INSERT INTO Veiculo (Nome, Tipo, Placa, Descricao) VALUES
('Fusca', '4x2', 'ABC1D23', 'Clássico e econômico'),
('Civic', '4x2', 'XYZ4E56', 'Sedã confortável e potente'),
('Hilux', '4x4', 'LMN7P89', 'Picape robusta para off-road'),
('Fiesta', '2x2', 'OPQ2R34', 'Compacto e ágil na cidade'),
('Ranger', '4x4', 'RST5U67', 'Ideal para aventuras'),
('Corolla', '4x2', 'JKL3M45', 'Confiável e eficiente'),
('Tucson', '4x2', 'GHI8K90', 'SUV espaçoso e confortável'),
('Kwid', '2x2', 'ABC9D01', 'Mini SUV para a cidade'),
('Pajero', '4x4', 'DEF3G57', 'Versátil e potente'),
('Onix', '2x2', 'XYZ2H34', 'Compacto com bom consumo'),
('Tracker', '4x2', 'LMN5J78', 'SUV com tecnologia avançada'),
('C3', '2x2', 'OPQ8K12', 'Compacto e estiloso'),
('Duster', '4x4', 'RST6L89', 'SUV com bom custo-benefício'),
('Jetta', '4x2', 'JKL4M56', 'Sedã com motor potente'),
('Compass', '4x4', 'GHI6N23', 'SUV com tração nas quatro rodas'),
('S10', '4x4', 'ABC3D90', 'Picape forte e resistente'),
('Palio', '2x2', 'XYZ1F45', 'Hatch compacto e econômico'),
('Creta', '4x2', 'LMN0P12', 'SUV com design moderno'),
('Sandero', '2x2', 'OPQ7R89', 'Hatch com bom espaço interno'),
('Celta', '2x2', 'RST2T34', 'Prático e econômico'),
('A3', '4x2', 'JKL8U56', 'Luxuoso e esportivo'),
('Rav4', '4x4', 'GHI1V23', 'SUV com excelente desempenho'),
('Voyage', '4x2', 'ABC4W78', 'Sedã com bom espaço'),
('Fit', '2x2', 'XYZ5X01', 'Compacto com ótimo espaço interno'),
('Captur', '4x2', 'LMN2Y34', 'SUV com design arrojado'),
('Fusion', '4x2', 'OPQ6Z89', 'Sedã híbrido e econômico'),
('Nissan Kicks', '4x2', 'RST3A12', 'SUV com tecnologia avançada'),
('Gol', '2x2', 'JKL1B45', 'Hatch popular e confiável'),
('Canyon', '4x4', 'GHI4C90', 'Picape para off-road'),
('Mobi', '2x2', 'ABC2D12', 'Compacto e prático'),
('Subaru Outback', '4x4', 'XYZ3E67', 'SUV com tração integral'),
('Tiguan', '4x4', 'LMN4F89', 'SUV com ótimo espaço interno'),
('BMW Série 3', '4x2', 'OPQ1G34', 'Sedã esportivo e luxuoso'),
('Mercedes-Benz GLA', '4x2', 'RST7H90', 'SUV de luxo'),
('Renegade', '4x4', 'JKL5I12', 'SUV compacta e robusta'),
('Peugeot 208', '2x2', 'GHI7J45', 'Hatch com design moderno'),
('Audi Q3', '4x2', 'ABC9K78', 'SUV de luxo e conforto'),
('Chrysler 300C', '4x2', 'XYZ0L01', 'Sedã de luxo e performance'),
('Ford EcoSport', '4x2', 'LMN3M34', 'SUV compacta e versátil'),
('Kona', '4x2', 'OPQ5N67', 'SUV com design arrojado'),
('Fiat Argo', '2x2', 'RST4O90', 'Hatch com bom desempenho'),
('Citroen C4', '2x2', 'JKL2P12', 'Hatch confortável e espaçoso'),
('Renault Captur', '4x2', 'GHI8Q45', 'SUV com bom espaço interno'),
('Chevrolet Spin', '4x2', 'ABC7R89', 'Minivan com espaço para a família'),
('Honda HR-V', '4x2', 'XYZ9S01', 'SUV com versatilidade no espaço'),
('Ford Fusion', '4x2', 'LMN6T34', 'Sedã com motor potente e econômico');

-- INSERINDO VALORES DENTRO DA TABELA ORDEM DE SERVIÇO
INSERT INTO Ordem_de_servico (Data_de_emissão, Data_do_agendamento_do_servico, Data_de_entrega, Valor_das_pecas, Valor_do_serviço, Status_do_processo, Descricao_dos_serviços_a_serem_realizados) VALUES
('2025-01-01', '2025-01-05', '2025-01-10', 150.00, 200.00, 'Em aguardo', 'Troca de óleo e filtros'),
('2025-01-02', '2025-01-06', '2025-01-11', 75.00, 100.00, 'Em serviço', 'Revisão geral do veículo'),
('2025-01-03', '2025-01-07', '2025-01-12', 200.00, 250.00, 'Aguardando peças', 'Substituição de pastilhas de freio'),
('2025-01-04', '2025-01-08', '2025-01-13', 50.00, 80.00, 'Concluído', 'Alinhamento e balanceamento'),
('2025-01-05', '2025-01-09', '2025-01-14', 100.00, 150.00, 'Cancelado', 'Troca de bateria'),
('2025-01-06', '2025-01-10', '2025-01-15', 120.00, 180.00, 'Em aguardo', 'Reparo no sistema de ar condicionado'),
('2025-01-07', '2025-01-11', '2025-01-16', 90.00, 120.00, 'Em serviço', 'Troca de lâmpadas'),
('2025-01-08', '2025-01-12', '2025-01-17', 300.00, 400.00, 'Aguardando peças', 'Reforma completa do motor'),
('2025-01-09', '2025-01-13', '2025-01-18', 60.00, 70.00, 'Concluído', 'Troca de óleo de transmissão'),
('2025-01-10', '2025-01-14', '2025-01-19', 80.00, 100.00, 'Cancelado', 'Instalação de som automotivo'),
('2025-01-11', '2025-01-15', '2025-01-20', 110.00, 140.00, 'Em aguardo', 'Reparo na suspensão'),
('2025-01-12', '2025-01-16', '2025-01-21', 250.00, 300.00, 'Em serviço', 'Troca de pneus'),
('2025-01-13', '2025-01-17', '2025-01-22', 45.00, 65.00, 'Aguardando peças', 'Limpeza de injetores'),
('2025-01-14', '2025-01-18', '2025-01-23', 55.00, 85.00, 'Concluído', 'Verificação de freios'),
('2025-01-15', '2025-01-19', '2025-01-24', 95.00, 125.00, 'Cancelado', 'Troca de velas de ignição'),
('2025-01-16', '2025-01-20', '2025-01-25', 130.00, 170.00, 'Em aguardo', 'Instalação de kit de suspensão'),
('2025-01-17', '2025-01-21', '2025-01-26', 140.00, 190.00, 'Em serviço', 'Reparo na direção hidráulica'),
('2025-01-18', '2025-01-22', '2025-01-27', 70.00, 80.00, 'Aguardando peças', 'Troca de correia dentada'),
('2025-01-19', '2025-01-23', '2025-01-28', 160.00, 210.00, 'Concluído', 'Revisão do sistema elétrico'),
('2025-01-20', '2025-01-24', '2025-01-29', 85.00, 115.00, 'Cancelado', 'Troca de radiador'),
('2025-01-21', '2025-01-25', '2025-01-30', 175.00, 225.00, 'Em aguardo', 'Instalação de faróis de LED'),
('2025-01-22', '2025-01-26', '2025-01-31', 200.00, 260.00, 'Em serviço', 'Reparo no sistema de escapamento'),
('2025-01-23', '2025-01-27', '2025-02-01', 300.00, 350.00, 'Aguardando peças', 'Troca de embreagem'),
('2025-01-24', '2025-01-28', '2025-02-02', 90.00, 110.00, 'Concluído', 'Ajuste de carburador'),
('2025-01-25', '2025-01-29', '2025-02-03', 50.00, 70.00, 'Cancelado', 'Limpeza de filtros de ar'),
('2025-01-26', '2025-01-30', '2025-02-04', 120.00, 150.00, 'Em aguardo', 'Troca de juntas'),
('2025-01-27', '2025-01-31', '2025-02-05', 140.00, 190.00, 'Em serviço', 'Reparo de caixa de direção'),
('2025-01-28', '2025-02-01', '2025-02-06', 75.00, 100.00, 'Aguardando peças', 'Substituição de motor de partida'),
('2025-01-29', '2025-02-02', '2025-02-07', 60.00, 80.00, 'Concluído', 'Troca de bomba de combustível'),
('2025-01-30', '2025-02-03', '2025-02-08', 100.00, 130.00, 'Cancelado', 'Instalação de sensor de estacionamento'),
('2025-01-31', '2025-02-04', '2025-02-09', 150.00, 200.00, 'Em aguardo', 'Troca de filtro de combustível'),
('2025-02-01', '2025-02-05', '2025-02-10', 80.00, 110.00, 'Em serviço', 'Reparo de ar-condicionado'),
('2025-02-02', '2025-02-06', '2025-02-11', 130.00, 160.00, 'Aguardando peças', 'Troca de coxins'),
('2025-02-03', '2025-02-07', '2025-02-12', 200.00, 250.00, 'Concluído', 'Revisão de suspensão'),
('2025-02-04', '2025-02-08', '2025-02-13', 90.00, 120.00, 'Cancelado', 'Verificação de alinhamento'),
('2025-02-05', '2025-02-09', '2025-02-14', 160.00, 210.00, 'Em aguardo', 'Troca de óleo de motor'),
('2025-02-06', '2025-02-10', '2025-02-15', 70.00, 90.00, 'Em serviço', 'Limpeza de sistema de arrefecimento'),
('2025-02-07', '2025-02-11', '2025-02-16', 100.00, 130.00, 'Aguardando peças', 'Reparo de sistema de injeção'),
('2025-02-08', '2025-02-12', '2025-02-17', 50.00, 70.00, 'Concluído', 'Troca de mangueiras'),
('2025-02-09', '2025-02-13', '2025-02-18', 110.00, 140.00, 'Cancelado', 'Substituição de rolamentos'),
('2025-02-10', '2025-02-14', '2025-02-19', 150.00, 180.00, 'Em aguardo', 'Reforma de suspensão'),
('2025-02-11', '2025-02-15', '2025-02-20', 200.00, 250.00, 'Em serviço', 'Troca de amortecedores');


-- Tabela Ordem de serviço = Usando as funções: Alter table + Add + Update + Set + Select + Calculo de soma + Like + Order by + Limit
Alter table Ordem_de_servico
Add Valor_total DECIMAL (10,2);
Update Ordem_de_servico 
SET Valor_total = Valor_das_pecas * Valor_do_serviço;
Select Data_de_emissão, Data_de_entrega, Valor_total, Status_do_processo, Descricao_dos_serviços_a_serem_realizados from Ordem_de_servico
Where Descricao_dos_serviços_a_serem_realizados like '%Troca%'
Order by Data_de_entrega
Limit 20;


-- Tabela Peças Mão de obra = Usando as funções: select + Where + Like + Order by
select * from Mao_de_obra
Where Tipo_de_serviço like'%reparo%'
Order by Tipo_de_serviço;

-- Tabela Peças Equipe de mecânicos = Usando as funções: select + Inner Join + Where + Order by + Limit
select * from Equipe_de_mecanicos E_de_m Join Veiculo 
on idEquipe_de_mecanicos = idVeiculo
Where Veiculo.Nome = 'Fusca' or Veiculo.Nome ='Voyage' or Veiculo.Nome ='Civic'
order by placa
limit 20;


-- Tabela Peças consumidas = Usando as funções: select + Alter table + Add + Update + Set
ALTER TABLE Pecas_consumidas
ADD Total_do_valor_das_pecas DECIMAL(10,2);
UPDATE Pecas_consumidas
SET Total_do_valor_das_pecas = Valor_unitario * Quantidade;
SELECT idPecas_consumidas, nome_peca, Valor_unitario, Quantidade, Total_do_valor_das_pecas 
FROM Pecas_consumidas;

-- Tabela Forma de pagamento = Usando as funções: select + Sum
select sum(Dinheiro) from Forma_de_pagamento;

-- Tabela Veiculo = Usando as funções: select + Alter table + Add + Update + Case
Alter table Veiculo
Add Tipo_do_carro VARCHAR (45);
UPDATE Veiculo
set Tipo_do_carro = case
	When Tipo = '4x4' Then 'Carro grande'
	When Tipo = '4x2' Then 'Carro médio grande'
	When Tipo = '2x4' Then 'Carro médio'
	When Tipo = '2x2' Then 'Carro pequeno'
    END;
select idVeiculo, Nome, Tipo, Placa, Descricao, Tipo_do_carro from Veiculo;

-- Tabela cliente = Usando as funções: select + Where + like+ limit  
Select IdCliente, Nome, Telefone, Endereco, CPF_CNPJ from Cliente 
where CPF_CNPJ like '%123%'
limit 15;