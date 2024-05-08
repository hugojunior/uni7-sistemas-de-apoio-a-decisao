-- IMPORTANDO OS DADOS PARA TABELA DE FUNCIONÁRIOS
SET IDENTITY_INSERT dbo.ODS_Funcionarios ON;
INSERT INTO ODS_Funcionarios(FuncionarioID, Nome, Sobrenome, Email, Telefone, Cargo)
SELECT DISTINCT
    funcID,
    firstName,
    lastName,
    email,
    tel,
    cargo
FROM EmployeePessoas;
SET IDENTITY_INSERT dbo.ODS_Funcionarios OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE CLIENTES
SET IDENTITY_INSERT dbo.ODS_Clientes ON;
INSERT INTO ODS_Clientes (Nome, Sobrenome, Email, Telefone, Endereco, Cidade, Estado, CEP)
SELECT DISTINCT
    PARSENAME(REPLACE(nomeComp, ' ', '.'), 2) AS primeiro_nome,
    PARSENAME(REPLACE(nomeComp, ' ', '.'), 1) AS ultimo_nome,
    email,
    telefone,
    endRua,
    endCid,
    endEst,
    endCEP
FROM CustomerData;
SET IDENTITY_INSERT dbo.ODS_Clientes OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE INTERAÇÕES
SET IDENTITY_INSERT dbo.ODS_Interacoes ON;
INSERT INTO ODS_Interacoes(InteracaoID, ClienteID, FuncionarioID, Data, Tipo, Anotacoes)
SELECT DISTINCT
    logID,
    clienteID,
    funcID,
    dataInter,
    tipo,
    anot
FROM InteracLogs;
SET IDENTITY_INSERT dbo.ODS_Interacoes OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE CATEGORIAS
SET IDENTITY_INSERT dbo.ODS_Categorias ON;
INSERT INTO ODS_Categorias(CategoriaID, Nome)
SELECT DISTINCT
    catID,
    catNome
FROM CatTabela;
SET IDENTITY_INSERT dbo.ODS_Categorias OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE PRODUTOS
SET IDENTITY_INSERT dbo.ODS_Produtos ON;
INSERT INTO ODS_Produtos(ProdutoID, Nome, Descricao, Preco)
SELECT DISTINCT
    prodID,
    prodNome,
    prodDesc,
    prodPreco
FROM ProdInfos;
SET IDENTITY_INSERT dbo.ODS_Produtos OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE CATEGORIAS DE PRODUTO
INSERT INTO ODS_ProdutoCategoria(ProdutoID, CategoriaID)
SELECT DISTINCT
    prodID,
    categoriaID
FROM ProdInfos;

-- IMPORTANDO OS DADOS PARA TABELA DE PEDIDOS
SET IDENTITY_INSERT dbo.ODS_Pedidos ON;
INSERT INTO ODS_Pedidos(PedidoID, ClienteID, DataPedido, StatusPedido)
SELECT DISTINCT
    ordensID,
    clienteID,
    dataOrdens,
    statusPedido
FROM OrdensTrans;
SET IDENTITY_INSERT dbo.ODS_Pedidos OFF;

-- IMPORTANDO OS DADOS PARA TABELA DE ITENS DO PEDIDO
SET IDENTITY_INSERT dbo.ODS_ItensPedido ON;
INSERT INTO ODS_ItensPedido(ItemPedidoID ,PedidoID, ProdutoID, Quantidade, PrecoUnitario)
SELECT DISTINCT
    itemID,
    pedidoID,
    prodID,
    qtd,
    precoUnit
FROM PedidoItens;
SET IDENTITY_INSERT dbo.ODS_ItensPedido OFF;