CREATE TABLE CustomerData (
    idCliente INT PRIMARY KEY,
    nomeComp VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NULL,
    endRua VARCHAR(200) NULL,
    endCid VARCHAR(50) NULL,
    endEst CHAR(2) NULL,
    endCEP CHAR(8) NULL
);

CREATE TABLE ProdInfos (
    prodID INT PRIMARY KEY,
    prodNome VARCHAR(100) NOT NULL,
    prodDesc VARCHAR(MAX) NULL,
    prodPreco DECIMAL(10,2) NOT NULL,
    categoriaID INT NOT NULL
);

CREATE TABLE CatTabela (
    catID INT PRIMARY KEY,
    catNome VARCHAR(50) NOT NULL
);

CREATE TABLE EmployeePessoas (
    funcID INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tel VARCHAR(20) NULL,
    cargo VARCHAR(50) NOT NULL
);

CREATE TABLE OrdensTrans (
    ordensID INT PRIMARY KEY,
    clienteID INT NOT NULL,
    dataOrdens DATETIME NOT NULL,
    statusPedido VARCHAR(20) NOT NULL
);

CREATE TABLE PedidoItens (
    itemID INT PRIMARY KEY,
    pedidoID INT NOT NULL,
    prodID INT NOT NULL,
    qtd INT NOT NULL,
    precoUnit DECIMAL(10,2) NOT NULL
);

CREATE TABLE InteracLogs (
    logID INT PRIMARY KEY,
    clienteID INT NOT NULL,
    funcID INT NOT NULL,
    dataInter DATETIME NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    anot VARCHAR(MAX) NULL
);