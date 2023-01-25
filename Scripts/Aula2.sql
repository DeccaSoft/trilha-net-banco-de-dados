--Constraints, Funções e Procedures

/*
--Constraints
SELECT * FROM Produtos

--INSERT INTO Produtos (Nome, Cor, Tamanho, Genero, DataCadastro) VALUES ('Teste', 'Azul', 'G', 'M', GETDATE())	--Não aceita, pois valor do Produto Não pode ser Nulo
INSERT INTO Produtos (Nome, Preco, Tamanho, Genero, DataCadastro) VALUES ('Teste', 10, 'G', 'M', GETDATE())		--Aceita, pois cor pode ser Nulo

--ALTER TABLE Produtos ADD UNIQUE(Nome)	--Altera a Tabela Transformando o Campo Nome em UNIQUE, ou seja, NÃO Aceita valores Repetidos

ALTER TABLE Produtos ADD CONSTRAINT Chk_Preco CHECK(Preco >= 0)	--Contraint que checa um condição antes alterar a tabela
--INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero, DataCadastro) VALUES ('Teste', 'Azul', -10, 'G', 'M', GETDATE())	--Não Aceita, pois Preco < 0

ALTER TABLE Produtos ADD DEFAULT GETDATE() FOR DataCadastro		--Define GETDATE() como Default
INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero) VALUES ('Teste3', 'Verde', 0, 'G', 'M')

--ALTER TABLE Produtos DROP CONSTRAINT Chk_Preco	--Apaga Constraint
*/

/*
--Stored Procedures
--SELECT * FROM Produtos

--INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero) VALUES ('Teste4', 'Roxo', 10, 'P', 'F')

CREATE PROCEDURE InserirProdutoNovo
@Nome varchar(255),
@Cor varchar(50),
@Preco decimal,
@Tamanho varchar(5),
@Genero char(1)
AS
INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero)
VALUES (@Nome, @Cor, @Preco, @Tamanho, @Genero)


EXECUTE InserirProdutoNovo 'Teste 6', 'Vermelho', 11.99, 'M', 'U'

SELECT * FROM Produtos

SELECT * FROM Produtos WHERE Tamanho = 'M'

CREATE PROCEDURE ObterProdutosPorTamanho
@TamanhoProduto VARCHAR(5)
AS
SELECT * FROM Produtos WHERE Tamanho = @TamanhoProduto

EXEC ObterProdutosPorTamanho 'P'

EXEC ObterProdutosPorTamanho 'M'

EXEC ObterProdutosPorTamanho 'G'

CREATE PROCEDURE ObterTodosProdutos
AS
SELECT * FROM Produtos

EXEC ObterTodosProdutos
*/


--Functions

SELECT
	Nome, 
	Preco,
	FORMAT(Preco - Preco / 100 * 10, 'N2') PrecoComDesconto
FROM Produtos WHERE Tamanho = 'M'

CREATE FUNCTION CalcularDesconto(@Preco DECIMAL(13, 2), @Porcentagem INT)
RETURNS DECIMAL(13, 2)														--Tipo de Retorno (DEcimal com 2 casas)
BEGIN
	RETURN @Preco - @Preco / 100 * @Porcentagem								--Retorno Propriamente dito
END

SELECT
	Nome, 
	Preco,
	dbo.CalcularDesconto(Preco, 10) PrecoComDesconto
FROM Produtos WHERE Tamanho = 'M'