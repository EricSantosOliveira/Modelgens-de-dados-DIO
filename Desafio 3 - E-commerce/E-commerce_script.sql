-- Criando banco de dados E-commerce

create database Ecommerce;

USE Ecommerce;

-- Criando a tabela Fornecedor
create table Fornecedor (
	idFornecedor int,
    Razao_social varchar(45),
    CNPJ varchar(45)
    );


-- Criando a tabela Terceiro - Vendedor
create table Terceiro_vendedor (
	idTerceiro_vendedor int primary key auto_increment,
	Razao_social varchar(45),
	localizacao varchar (45),
    Nome_fantasia varchar(45)
     );
     
     drop table Terceiro_vendedor;
-- Criando a tabela Cliente
create table Cliente (
	idCliente INT auto_increment primary key,
    Pnome VARCHAR (10),
    Nome_do_meio VARCHAR (3),
    Sobrenome VARCHAR (20),
    CPF VARCHAR (11) not null,
    Endereço VARCHAR (45),
    Data_de_nascimento Date
    );

-- Criando a tabela Pedido
create table Pedido (
	idPedido int primary key auto_increment,
    idPedido_cliente int,
	Status_do_pedido ENUM ("Em andamento", "Processando", "Enviado", "Entregue") default ('Em processamento'),
	descricao VARCHAR(45),
	Frete FLOAT,
    Valor_vendido float,
    Paymentcash bool default false,
	constraint fk_pedido_cliente foreign key (idPedido_cliente) references Cliente(idCliente)
    );

-- Criando a tabela Produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Pname VARCHAR(45) NOT NULL,
    Classificacao_crianca BOOL DEFAULT FALSE,
    Categoria VARCHAR(45),
    Avaliacao FLOAT DEFAULT 0,
    Tamanho VARCHAR(10),
    Valor FLOAT
);
ALTER TABLE Produto MODIFY COLUMN Pname VARCHAR(45) NOT NULL;

DESCRIBE Produto;

-- Criando a tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT
);

-- Criando a tabela Pagamento
create table Pagamento (
	idPagamento int auto_increment not null,
    idCliente INT,
	primary key(idPagamento),
	typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
	constraint fk_idcliente foreign key (idCliente) references cliente(idCliente)
	);

-- Criando a tabela Produto_em_Estoque
CREATE TABLE Produto_em_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    CONSTRAINT fk_idProduto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_idEstoque FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- Criando a tabela Produto_Vendedor
create table Produto_Vendedor as PV (
	PV_Produto_idProduto int, 
    PV_idTerceiro_vendedor int,
    Quantidade int,
    constraint fk_idProduto_vendedor foreign key (PV_Produto_idProduto) references Produto (idProduto),
	constraint fk_idTerceiro_vendedor foreign key (PV_idTerceiro_vendedor) references  Terceiro_vendedor
    (idTerceiro_vendedor)
    );

-- Criando a tabela Relação de Produto_pedido
create table Produto_pedido (
	Produto_pedido_idProduto INT,
	Produto_pedido_idPedido INT,
	Quantidade INT,
    constraint fk_Produto_pedido_idProduto foreign key (Produto_pedido_idProduto) references Produto (idProduto),
	constraint fk_Produto_pedido_idPedido foreign key (Produto_pedido_idPedido) references  Pedido (idPedido)
    );

-- Inserindo os dados dentro das tabelas 

-- Inserindo os dados dentro da tabela Fornecedor
Insert into Fornecedor (idFornecedor, Razao_Social, CNPJ) Values 
	(1, 'Fornecedor A Ltda', '12.345.678/0001-90'),
	(2, 'Empresa de Suprimentos XYZ', '98.765.432/0001-12'),
	(3, 'Distribuidora Omega SA', '54.321.987/0001-54'),
	(4, 'Comercial Estrela LTDA', '09.876.543/0001-21'),
	(5, 'Atacado Vida Saudável', '65.432.109/0001-87'),
	(6, 'Cia Produtos Diversos', '43.210.987/0001-65'),
	(7, 'Suprimentos Gerais LTDA', '78.901.234/0001-43'),
	(8, 'Fornecedor Multimarcas', '56.789.012/0001-98'),
	(9, 'Distribuidora Mega Varejo', '23.456.789/0001-76'),
	(10, 'Cia Atacadista Padrão', '87.654.321/0001-09'),
    (11, 'Fornecedor Eco Sustentável', '12.345.678/0002-70'),
	(12, 'Empresa de Produtos Naturais', '98.765.432/0002-92'),
	(13, 'Distribuidora Vital Saúde', '54.321.987/0002-34'),
	(14, 'Comercial Bem-Estar LTDA', '09.876.543/0002-01'),
	(15, 'Atacado Vida Plena', '65.432.109/0002-67'),
	(16, 'Cia Produtos Essenciais', '43.210.987/0002-45'),
	(17, 'Suprimentos Modernos LTDA', '78.901.234/0002-23'),
	(18, 'Fornecedor Multimarcas Premium', '56.789.012/0002-78'),
	(19, 'Distribuidora Mega Varejo Plus', '23.456.789/0002-56'),
	(20, 'Cia Atacadista Padrão Excelência', '87.654.321/0002-89');

-- Inserindo os dados dentro da tabela Terceiro_Vendedor
INSERT INTO Terceiro_Vendedor (idTerceiro_vendedor, Razao_social, localizacao, Nome_fantasia) VALUES
	(1, 'Distribuidora ABC Ltda', 'São Paulo, SP', 'ABC Distribuidora'),
	(2, 'Comércio de Produtos XYZ', 'Rio de Janeiro, RJ', 'XYZ Comércio'),
	(3, 'Atacado Estrela EIRELI', 'Belo Horizonte, MG', 'Estrela Atacado'),
	(4, 'Fornecedora Omega SA', 'Curitiba, PR', 'Omega Fornecedora'),
	(5, 'Varejo Vida Saudável ME', 'Porto Alegre, RS', 'Vida Saudável'),
	(6, 'Empresa Diversificada LTDA', 'Brasília, DF', 'Diversificada Cia'),
	(7, 'Suprimentos Gerais EIRELI', 'Manaus, AM', 'Gerais Suprimentos'),
	(8, 'Comercial Multimarcas Ltda', 'Salvador, BA', 'Multimarcas Comercial'),
	(9, 'Distribuidora Mega Varejo SA', 'Fortaleza, CE', 'Mega Varejo'),
	(10, 'Atacadista Padrão EIRELI', 'Recife, PE', 'Padrão Atacadista'),
	(11, 'Fornecedora Alfa Ltda', 'Florianópolis, SC', 'Alfa Fornecedora'),
	(12, 'Comércio Beta EIRELI', 'Vitória, ES', 'Beta Comércio'),
	(13, 'Atacado Gama SA', 'Goiânia, GO', 'Gama Atacado'),
	(14, 'Distribuidora Delta LTDA', 'Campo Grande, MS', 'Delta Distribuidora'),
	(15, 'Varejo Épsilon ME', 'Aracaju, SE', 'Épsilon Varejo'),
	(16, 'Empresa Zeta EIRELI', 'Maceió, AL', 'Zeta Empresa'),
	(17, 'Suprimentos Eta LTDA', 'João Pessoa, PB', 'Eta Suprimentos'),
	(18, 'Comercial Theta Ltda', 'Natal, RN', 'Theta Comercial'),
	(19, 'Distribuidora Iota SA', 'Teresina, PI', 'Iota Distribuidora'),
	(20, 'Atacadista Kappa EIRELI', 'São Luís, MA', 'Kappa Atacadista');

-- Inserindo os dados dentro da tabela Cliente
INSERT INTO Cliente (idCliente, Pnome, Nome_do_meio, Sobrenome, CPF, Endereço, Data_de_nascimento) VALUES
(1, 'João', 'A', 'Silva', '12345678901', 'Rua das Flores, 123 - São Paulo, SP', '1985-05-12'),
(2, 'Maria', 'B', 'Oliveira', '23456789012', 'Avenida Central, 456 - Rio de Janeiro, RJ', '1992-11-20'),
(3, 'Pedro', 'C', 'Santos', '34567890123', 'Praça da Liberdade, 789 - Belo Horizonte, MG', '1978-03-07'),
(4, 'Ana', 'D', 'Souza', '45678901234', 'Rua do Comércio, 321 - Curitiba, PR', '1990-08-15'),
(5, 'Lucas', 'E', 'Fernandes', '56789012345', 'Avenida Paulista, 654 - São Paulo, SP', '1983-12-01'),
(6, 'Fernanda', 'F', 'Rodrigues', '67890123456', 'Rua das Palmeiras, 987 - Porto Alegre, RS', '1995-06-25'),
(7, 'Gustavo', 'G', 'Almeida', '78901234567', 'Quadra 103, 147 - Brasília, DF', '1987-09-18'),
(8, 'Isabela', 'H', 'Pereira', '89012345678', 'Avenida Beira Mar, 258 - Florianópolis, SC', '1991-04-30'),
(9, 'Marcos', 'I', 'Cardoso', '90123456789', 'Rua do Comércio, 741 - Vitória, ES', '1980-02-14'),
(10, 'Camila', 'J', 'Gomes', '01234567890', 'Avenida Paulista, 963 - São Paulo, SP', '1993-07-22'),
(11, 'Rafael', 'K', 'Barbosa', '12345678901', 'Rua das Flores, 321 - Rio de Janeiro, RJ', '1988-11-05'),
(12, 'Juliana', 'L', 'Dias', '23456789012', 'Praça da Liberdade, 654 - Belo Horizonte, MG', '1996-02-28'),
(13, 'Matheus', 'M', 'Costa', '34567890123', 'Avenida Central, 987 - Curitiba, PR', '1982-08-10'),
(14, 'Gabriela', 'N', 'Ferreira', '45678901234', 'Rua do Comércio, 258 - Porto Alegre, RS', '1989-03-15'),
(15, 'Leonardo', 'O', 'Alves', '56789012345', 'Quadra 103, 741 - Brasília, DF', '1994-09-01'),
(16, 'Beatriz', 'P', 'Moreira', '67890123456', 'Avenida Beira Mar, 963 - Florianópolis, SC', '1997-04-20'),
(17, 'Thiago', 'Q', 'Nunes', '78901234567', 'Rua das Palmeiras, 321 - Vitória, ES', '1986-12-07'),
(18, 'Larissa', 'R', 'Souza', '89012345678', 'Avenida Paulista, 654 - São Paulo, SP', '1991-06-18'),
(19, 'Guilherme', 'S', 'Oliveira', '90123456789', 'Rua das Flores, 987 - Rio de Janeiro, RJ', '1983-10-23'),
(20, 'Isabela', 'T', 'Santos', '01234567890', 'Praça da Liberdade, 258 - Belo Horizonte, MG', '1995-05-12'),
(21, 'Rodrigo', 'U', 'Ferreira', '12345678901', 'Avenida Central, 741 - Curitiba, PR', '1990-01-30'),
(22, 'Mariana', 'V', 'Almeida', '23456789012', 'Rua do Comércio, 963 - Porto Alegre, RS', '1988-07-05'),
(23, 'Felipe', 'W', 'Cardoso', '34567890123', 'Quadra 103, 321 - Brasília, DF', '1993-11-18'),
(24, 'Letícia', 'X', 'Pereira', '45678901234', 'Avenida Beira Mar, 654 - Florianópolis, SC', '1992-04-27'),
(25, 'Henrique', 'Y', 'Gomes', '56789012345', 'Rua das Palmeiras, 987 - Vitória, ES', '1986-09-14'),
(26, 'Bruna', 'Z', 'Barbosa', '67890123456', 'Avenida Paulista, 258 - São Paulo, SP', '1997-02-03'),
(27, 'Vitor', 'AA', 'Dias', '78901234567', 'Rua das Flores, 741 - Rio de Janeiro, RJ', '1991-08-19'),
(28, 'Amanda', 'BB', 'Costa', '89012345678', 'Praça da Liberdade, 963 - Belo Horizonte, MG', '1994-12-11'),
(29, 'Lucas', 'CC', 'Ferreira', '90123456789', 'Avenida Central, 321 - Curitiba, PR', '1989-03-28'),
(30, 'Fernanda', 'DD', 'Alves', '01234567890', 'Rua do Comércio, 654 - Porto Alegre, RS', '1996-06-09');

-- Inserindo os dados dentro da tabela Pedido
INSERT INTO Pedido (idPedido, idPedido_cliente, Status_do_pedido, descricao, Frete, Valor_vendido, Paymentcash) VALUES
(1, 1, 'Em andamento', 'Compra de produtos diversos', 15.50, 250.00, 0),
(2, 2, 'Processando', 'Pedido de material de escritório', 8.90, 120.75, 0),
(3, 3, 'Enviado', 'Aquisição de eletrodomésticos', 22.30, 480.00, 1),
(4, 4, 'Entregue', 'Compra de itens de papelaria', 6.70, 78.90, 0),
(5, 5, 'Em andamento', 'Pedido de suprimentos de limpeza', 12.00, 190.50, 1),
(6, 6, 'Processando', 'Aquisição de artigos de informática', 18.40, 360.00, 0),
(7, 7, 'Enviado', 'Compra de material de construção', 25.80, 540.00, 1),
(8, 8, 'Entregue', 'Pedido de produtos de beleza', 9.50, 105.30, 0),
(9, 9, 'Em andamento', 'Aquisição de utensílios domésticos', 14.20, 230.00, 1),
(10, 10, 'Processando', 'Compra de artigos de vestuário', 11.60, 170.00, 0),
(11, 1, 'Enviado', 'Pedido de material escolar', 7.80, 92.50, 1),
(12, 2, 'Entregue', 'Aquisição de ferramentas', 20.00, 400.00, 0),
(13, 3, 'Em andamento', 'Compra de produtos de jardinagem', 13.90, 260.00, 1),
(14, 4, 'Processando', 'Pedido de acessórios automotivos', 16.30, 320.00, 0),
(15, 5, 'Enviado', 'Aquisição de brinquedos', 8.20, 130.00, 1),
(16, 6, 'Entregue', 'Compra de livros', 5.50, 65.00, 0),
(17, 7, 'Em andamento', 'Pedido de produtos esportivos', 19.70, 380.00, 1),
(18, 8, 'Processando', 'Aquisição de artigos de decoração', 12.40, 210.00, 0),
(19, 9, 'Enviado', 'Compra de roupas de cama', 10.80, 160.00, 1),
(20, 10, 'Entregue', 'Pedido de eletrônicos', 23.60, 500.00, 0),
(21, 1, 'Em andamento', 'Aquisição de brinquedos educativos', 9.00, 140.00, 1),
(22, 2, 'Processando', 'Compra de jogos', 6.30, 75.00, 0),
(23, 3, 'Enviado', 'Pedido de produtos de saúde', 15.20, 290.00, 1),
(24, 4, 'Entregue', 'Aquisição de artigos de cozinha', 11.50, 180.00, 0),
(25, 5, 'Em andamento', 'Compra de móveis', 28.00, 600.00, 1),
(26, 6, 'Processando', 'Pedido de roupas infantis', 8.70, 120.00, 0),
(27, 7, 'Enviado', 'Aquisição de produtos de beleza', 13.10, 240.00, 1),
(28, 8, 'Entregue', 'Compra de itens de papelaria', 6.00, 70.00, 0),
(29, 9, 'Em andamento', 'Pedido de material de escritório', 10.40, 150.00, 1),
(30, 10, 'Processando', 'Aquisição de artigos de jardinagem', 17.80, 350.00, 0);


-- Inserindo os dados dentro da tabela Produto
INSERT INTO Produto (idProduto, Pname, Classificacao_crianca, Categoria, Avaliacao, Tamanho, Valor) VALUES
(1, 'Bola', 1, 'Brinquedos', 4.8, 'Médio', 29.99),
(2, 'Boneca', 1, 'Brinquedos', 4.5, 'Pequeno', 49.99),
(3, 'Lego', 1, 'Brinquedos', 4.9, 'Médio', 79.99),
(4, 'Camiseta', 0, 'Vestuário', 4.2, 'M', 39.99),
(5, 'Calça', 0, 'Vestuário', 4.6, '38', 59.99),
(6, 'Sapato', 0, 'Vestuário', 4.3, '40', 99.99),
(7, 'Caderno', 1, 'Papelaria', 4.7, 'Médio', 14.99),
(8, 'Caneta', 0, 'Papelaria', 4.1, 'Pequeno', 2.99),
(9, 'Livro', 0, 'Livros', 4.8, 'Médio', 24.99),
(10, 'Mochila', 1, 'Acessórios', 4.4, 'Grande', 69.99),
(11, 'Relógio', 0, 'Acessórios', 4.6, 'Médio', 149.99),
(12, 'Bolsa', 0, 'Acessórios', 4.3, 'Grande', 89.99),
(13, 'Bicicleta', 0, 'Esportes', 4.7, 'Grande', 599.99),
(14, 'Raquete', 0, 'Esportes', 4.5, 'Médio', 79.99),
(15, 'Bola de Futebol', 1, 'Esportes', 4.8, 'Médio', 39.99),
(16, 'Panela', 0, 'Cozinha', 4.6, 'Médio', 69.99),
(17, 'Faca', 0, 'Cozinha', 4.4, 'Pequeno', 24.99),
(18, 'Liquidificador', 0, 'Cozinha', 4.7, 'Grande', 149.99),
(19, 'Cadeira', 0, 'Móveis', 4.5, 'Grande', 199.99),
(20, 'Mesa', 0, 'Móveis', 4.6, 'Grande', 399.99),
(21, 'Armário', 0, 'Móveis', 4.7, 'Grande', 499.99),
(22, 'Televisão', 0, 'Eletrônicos', 4.8, 'Grande', 1499.99),
(23, 'Notebook', 0, 'Eletrônicos', 4.6, 'Médio', 2999.99),
(24, 'Smartphone', 0, 'Eletrônicos', 4.7, 'Pequeno', 1999.99),
(25, 'Garrafa Térmica', 0, 'Utilidades', 4.4, 'Médio', 39.99),
(26, 'Toalha', 0, 'Utilidades', 4.5, 'Grande', 29.99),
(27, 'Lâmpada', 0, 'Utilidades', 4.3, 'Pequeno', 9.99),
(28, 'Bola de Basquete', 1, 'Esportes', 4.7, 'Médio', 59.99),
(29, 'Raquete de Tênis', 0, 'Esportes', 4.6, 'Médio', 99.99),
(30, 'Skate', 1, 'Esportes', 4.8, 'Grande', 249.99);


-- Inserindo os dados dentro da tabela Estoque
INSERT INTO Estoque (idEstoque) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Verificação dos dados inseridos nas tabelas 
Select * from Fornecedor;
Select * from Terceiro_Vendedor;
Select * from Cliente;
Select * from Pedido;
Select * from Produto;
Select * from Estoque;

-- Abaixo segue as funções e queries em cada tabela 
-- para melhor aplicação foi-se adicionado funções em cascata, aumentando a complexidade do código gradativamente.

-- Tabela Fornecedor = Função count
select count(*) from Fornecedor;

-- Tabela Terceiro_Vendedor = Função select + order by (crescente)
select Razao_social, Localizacao from Terceiro_Vendedor
order by localizacao;

-- Tabela cliente = Função concat + aliase
select * from cliente;
select concat(Pnome, ' ',Nome_do_meio,' ', Sobrenome) as Nome_completo, CPF, Data_de_nascimento from cliente
order by Data_de_nascimento;

-- Tabela pedido = Função select + Where + order by (decrescente)
select * from Pedido;
select Status_do_pedido, descricao, Frete, Valor_vendido, Paymentcash from Pedido 
where paymentcash = 1
order by Valor_vendido desc;

-- Tabela produto = Alter table + Função add + select + Update + case + Where + limit + having 
Alter table Produto
Add Classificacao_da_avalicao VARCHAR(50);
select categoria, avaliacao, tamanho, valor, Classificacao_da_avalicao from Produto;
UPDATE Produto 
SET Classificacao_da_avalicao = CASE 
    WHEN Avaliacao <= 4.2 THEN 'Razoável'
    WHEN Avaliacao <= 4.6 THEN 'Bom'
    ELSE 'Ótimo'
END;
select categoria, avaliacao, tamanho, valor, Classificacao_da_avalicao from Produto;

select categoria, avaliacao, Classificacao_da_avalicao from Produto pr, Pedido pe

where (pr.idProduto = pe.idPedido)
having avaliacao >=4.6
order by avaliacao desc
limit 7;

-- Tabela Estoque = Select + Inner Join + order by (crescente)
select * from estoque es Join Produto pr 
on idEstoque = idProduto
order by avaliacao;

-- Tabela Estoque = Select + right outer Join + order by (crescente)
select idEstoque, Pname, Categoria, Avaliacao, Valor from estoque es right outer Join Produto pr 
on idEstoque = idProduto
order by avaliacao;	

