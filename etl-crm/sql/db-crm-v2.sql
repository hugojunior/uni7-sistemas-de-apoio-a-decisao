-- Criando a tabela ODS_Clientes
CREATE TABLE ODS_Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NULL,
    Endereco VARCHAR(200) NULL,
    Cidade VARCHAR(50) NULL,
    Estado CHAR(2) NULL,
    CEP CHAR(8) NULL
);

-- Criando a tabela ODS_Pedidos
CREATE TABLE ODS_Pedidos (
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL FOREIGN KEY REFERENCES ODS_Clientes(ClienteID),
    DataPedido DATETIME NOT NULL,
    StatusPedido VARCHAR(20) NOT NULL
);

-- Criando a tabela ODS_Produtos
CREATE TABLE ODS_Produtos (
    ProdutoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(MAX) NULL,
    Preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela ODS_ItensPedido
CREATE TABLE ODS_ItensPedido (
    ItemPedidoID INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID INT NOT NULL FOREIGN KEY REFERENCES ODS_Pedidos(PedidoID),
    ProdutoID INT NOT NULL FOREIGN KEY REFERENCES ODS_Produtos(ProdutoID),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL
);

-- Criando a tabela ODS_Categorias
CREATE TABLE ODS_Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Criando a tabela ODS_ProdutoCategoria
CREATE TABLE ODS_ProdutoCategoria (
    ProdutoID INT NOT NULL FOREIGN KEY REFERENCES ODS_Produtos(ProdutoID),
    CategoriaID INT NOT NULL FOREIGN KEY REFERENCES ODS_Categorias(CategoriaID),
    PRIMARY KEY (ProdutoID, CategoriaID)
);

-- Criando a tabela ODS_Funcionarios
CREATE TABLE ODS_Funcionarios (
    FuncionarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NULL,
    Cargo VARCHAR(50) NOT NULL
);

-- Criando a tabela ODS_Interacoes
CREATE TABLE ODS_Interacoes (
    InteracaoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL FOREIGN KEY REFERENCES ODS_Clientes(ClienteID),
    FuncionarioID INT NOT NULL FOREIGN KEY REFERENCES ODS_Funcionarios(FuncionarioID),
    Data DATETIME NOT NULL,
    Tipo VARCHAR(20) NOT NULL,
    Anotacoes VARCHAR(MAX) NULL
);