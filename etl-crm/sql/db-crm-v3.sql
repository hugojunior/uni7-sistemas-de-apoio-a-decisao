-- Criando a dimensão DimensaoCliente
CREATE TABLE DimensaoCliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NULL,
    Endereco VARCHAR(200) NULL,
    Cidade VARCHAR(50) NULL,
    Estado CHAR(2) NULL,
    CEP CHAR(8) NULL
);

-- Criando a dimensão DimensaoProduto
CREATE TABLE DimensaoProduto (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(MAX) NULL,
    CategoriaID INT FOREIGN KEY REFERENCES DimensaoCategoria(CategoriaID)
);

-- Criando a dimensão DimensaoCategoria
CREATE TABLE DimensaoCategoria (
    CategoriaID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Criando a dimensão DimensaoFuncionario
CREATE TABLE DimensaoFuncionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NULL,
    Cargo VARCHAR(50) NOT NULL
);

-- Criando a dimensão DimensaoTempo
CREATE TABLE DimensaoTempo (
    DataID INT PRIMARY KEY,
    Data DATE NOT NULL,
    Ano INT NOT NULL,
    Mes INT NOT NULL,
    Semana INT NOT NULL
);

-- Criando a dimensão DimensaoInteracao
CREATE TABLE DimensaoInteracao (
    InteracaoID INT PRIMARY KEY,
    Tipo VARCHAR(20) NOT NULL
);

-- Criando a tabela de fatos FatoPedido
CREATE TABLE FatoPedido (
    PedidoID INT PRIMARY KEY,
    ClienteID INT FOREIGN KEY REFERENCES DimensaoCliente(ClienteID),
    FuncionarioID INT FOREIGN KEY REFERENCES DimensaoFuncionario(FuncionarioID),
    DataID INT FOREIGN KEY REFERENCES DimensaoTempo(DataID),
    InteracaoID INT FOREIGN KEY REFERENCES DimensaoInteracao(InteracaoID),
    StatusPedido VARCHAR(20) NOT NULL,
    ProdutoID INT FOREIGN KEY REFERENCES DimensaoProduto(ProdutoID),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL
);