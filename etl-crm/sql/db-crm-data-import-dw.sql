-- IMPORTANDO OS DADOS PARA DIMENSÃO CLIENTE
INSERT INTO DimensaoCliente(ClienteID, Nome, Sobrenome, Email, Telefone, Endereco, Cidade, Estado, CEP)
SELECT DISTINCT
    ClienteID,
    Nome,
    Sobrenome,
    Email,
    Telefone,
    Endereco,
    Cidade,
    Estado,
    CEP
FROM ODS_Clientes;

-- IMPORTANDO OS DADOS PARA DIMENSÃO CATEGORIA
INSERT INTO DimensaoCategoria(CategoriaID, Nome)
SELECT DISTINCT
    CategoriaID,
    Nome
FROM ODS_Categorias;

-- IMPORTANDO OS DADOS PARA DIMENSÃO PRODUTO
INSERT INTO DimensaoProduto(ProdutoID, Nome, Descricao, CategoriaID)
SELECT DISTINCT
    OP.ProdutoID,
    OP.Nome,
    OP.Descricao,
    OPC.CategoriaID
FROM ODS_Produtos OP JOIN ODS_ProdutoCategoria OPC ON OP.ProdutoID = OPC.ProdutoID;

-- IMPORTANDO OS DADOS PARA DIMENSÃO FUNCIONÁRIO
INSERT INTO DimensaoFuncionario(FuncionarioID, Nome, Sobrenome, Email, Telefone, Cargo)
SELECT DISTINCT
    FuncionarioID,
    Nome,
    Sobrenome,
    Email,
    Telefone,
    Cargo
FROM ODS_Funcionarios;

-- IMPORTANDO OS DADOS PARA DIMENSÃO INTERAÇÃO
INSERT INTO DimensaoInteracao(InteracaoID, Tipo)
SELECT DISTINCT
    InteracaoID,
    Tipo
FROM ODS_Interacoes;

-- IMPORTANDO OS DADOS PARA DIMENSÃO TEMPO
INSERT INTO DimensaoTempo(Data, Ano, Mes, Dia, DiaSemana, DiaAno)
SELECT DISTINCT
    CONVERT(DATE, DataPedido),
    YEAR(DataPedido),
    MONTH(DataPedido),
    DAY(DataPedido),
    DATEPART(WEEKDAY, DataPedido),
    DATEPART(DAYOFYEAR, DataPedido)
FROM ODS_Pedidos;

-- IMPORTANDO OS DADOS PARA FATO PEDIDO
INSERT INTO FatoPedido(ClienteID, FuncionarioID, DataID, InteracaoID, StatusPedido, ProdutoID, Quantidade, PrecoUnitario)
SELECT DISTINCT
    OC.ClienteID,
    OI.FuncionarioID,
    DT.DataID,
    OI.InteracaoID,
    OP.StatusPedido,
    OIP.ProdutoID,
    OIP.Quantidade,
    OIP.PrecoUnitario
FROM
    ODS_Pedidos OP
JOIN ODS_Clientes OC ON OP.ClienteID = OC.ClienteID
JOIN DimensaoTempo DT ON OP.DataPedido = DT.Data
JOIN ODS_Interacoes OI ON OP.ClienteID = OI.ClienteID
JOIN ODS_ItensPedido OIP ON OP.PedidoID = OIP.PedidoID;