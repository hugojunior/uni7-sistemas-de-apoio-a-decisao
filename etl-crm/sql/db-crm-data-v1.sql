-- Inserindo dados na tabela CustomerData
INSERT INTO CustomerData (idCliente, nomeComp, email, telefone, endRua, endCid, endEst, endCEP)
VALUES
    (1, 'João Silva', 'joao.silva@drogasil.com.br', '(11) 99999-1111', 'Rua A, 123', 'São Paulo', 'SP', '01234567'),
    (2, 'Maria Souza', 'maria.souza@lanlink.com.br', '(85) 88888-2222', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '23456789'),
    (3, 'Pedro Oliveira', 'pedro.oliveira@gmail.com', '(31) 77777-3333', 'Rua C, 789', 'Belo Horizonte', 'MG', '34567890'),
    (4, 'Ana Santos', 'ana.santos@uni7.edu.br', '(85) 66666-4444', 'Av. D, 321', 'Porto Alegre', 'RS', '45678901');

-- Inserindo dados na tabela ProdInfos
INSERT INTO ProdInfos (prodID, prodNome, prodDesc, prodPreco, categoriaID)
VALUES
    (1, 'Perseu', 'Experiência satisfatória', 350.00, 1),
    (2, 'Zeus', 'Experiência convincente', 600.00, 2),
    (3, 'Atlas', 'Crie sua experiência', 900.00, 3);

-- Inserindo dados na tabela CatTabela
INSERT INTO CatTabela (catID, catNome)
VALUES
    (1, 'Standard'),
    (2, 'Premium'),
    (3, 'OdysseyCraft');

-- Inserindo dados na tabela EmployeePessoas
INSERT INTO EmployeePessoas (funcID, firstName, lastName, email, tel, cargo)
VALUES
    (1, 'Hugo', 'Júnior', 'contato@hugojunior.com', '(85) 98874-7938', 'Especialista em BI'),
    (2, 'Arturia', 'Queiroz', 'artlqueiroz@gmail.com', '(85) 99901-4224', 'Cientista de dados'),
    (3, 'Jonas', 'Rocha', 'jonas.rocha@gmail.com', '(85) 98765-2243', 'Técnico de Montagem');

-- Inserindo dados na tabela OrdensTrans
INSERT INTO OrdensTrans (ordensID, clienteID, dataOrdens, statusPedido)
VALUES
    (1, 2, '2024-04-01', 'Cancelado'),
    (2, 1, '2024-04-08', 'Aguardando Pagamento'),
    (3, 4, '2024-04-25', 'Enviado'),
    (4, 3, '2024-05-05', 'Entregue');

-- Inserindo dados na tabela PedidoItens
INSERT INTO PedidoItens (itemID, pedidoID, prodID, qtd, precoUnit)
VALUES
    (1, 1, 1, 100, 350.00),
    (2, 1, 2, 10, 600.00),
    (3, 2, 1, 200, 350.00),
    (4, 2, 2, 50, 600.00),
    (5, 3, 1, 50, 350.00),
    (6, 3, 3, 1, 900.00),
    (7, 4, 3, 1, 900.00);

-- Inserindo dados na tabela InteracLogs
INSERT INTO InteracLogs (logID, clienteID, funcID, dataInter, tipo, anot)
VALUES
    (1, 1, 2, '2024-04-08', 'Chat', 'Foi feito contato via chat bot e feito o pedido de 200 unidades do modelo Perseu e 50 unidade do modelo Zeus. Aguardando pagamento.'),
    (2, 2, 1, '2024-04-01', 'Email', 'Foi feito contato via Email para o cancelamento do pedido de 100 modelos Perseus e 10 modelos Zeus.'),
    (3, 3, 3, '2024-05-05', 'Telefone', 'Foi feito contato via central de atendimento e feita solicitação de avaliação de um projeto Atlas. Pedido finalizado.'),
    (4, 4, 2, '2024-04-25', 'Chat', 'Foi feito o pedido via site de 50 modelos Perseus e 1 modelo Atlas. Em envio para cliente.');