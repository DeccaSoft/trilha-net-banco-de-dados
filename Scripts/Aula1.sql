/*
CREATE TABLE [dbo].[Clientes](			--Cria Tabela Clientes
	[Id] [int] IDENTITY(1,1) NOT NULL,	--Campo Id do Tipo Inteiro N�O NULO(ou seja, Preenchimento Obrigat�rio) e IDENTITY = AutoIncrement�vel
	[Nome] [varchar](255) NULL,			--Campo Nome do Tipo Varchar e Tamanho de 255 Caracteres e NULLABLE(ou seja, Aceita Valores NULL - N�O Obrigat�rio)
	[Sobrenome] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[AceitaComunicados] [bit] NULL,		--Tipo Bit(Aceita s� 0 ou 1 ou NULL
	[DataCadastro] [datetime2](7) NULL	--Tipo DateTime
) ON [PRIMARY]							
GO
*/

--USE ExemploDB
/*
--Cl�usula SELECT--

SELECT Nome, Sobrenome, Email FROM Clientes			--Lista apenas colunas 'Nome, Sobrenome e Email' (* = Lista todos as Colunas/Registros) da Tabela 'Clientes'
WHERE Nome = 'Andrew' AND Email = 'email@email.com'	--Filtra Nome = 'Andrew"(Enquanto Nome = 'Andrew') E Email = 'email@email.com' (OR = OU)
ORDER BY Nome, Sobrenome DESC						--Ordena por Nome de Forma Crescente(ASC = Ascendente = Padr�o) e Sobrenome de Forma Decrescente
*/

/*
SELECT * FROM Clientes		--Lista TODOS os Registros
WHERE Nome LIKE 'G%'		--Filtra Nome que Come�am com a letra 'G'(% = Coringa)
ORDER BY Nome, Sobrenome	--Ordena por Nome e Sobrenome
*/

/*
--Cl�usula INSERT--

INSERT INTO Clientes (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro)	--Inere na Tabela Clientes e nas Colunas(Nome, Sobrenome, etc.)
VALUES ('Andr�', 'Morais', 'a@a.com', 1, GETDATE())								--os Valores('Andr�', 'Morais', etc.) / GETDATE() = Data Atual do Sistema
SELECT * FROM Clientes WHERE Nome = 'Andr�'

--OBS.: O Id N�O foi passado pois ele � AutoIncrement�vel (Chave Primaria) e NUNCA se repete

INSERT INTO Clientes (Sobrenome, Nome, Email, AceitaComunicados, DataCadastro)	--Pode ser Fora de Ordem...
VALUES ('Morais', 'Daniella', 'a@a.com', 1, GETDATE())							--Desde que os Valores Tamb�m o estejam
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'

INSERT INTO Clientes									--As Colunas podem ser Suprimidas...
VALUES ('Mateus', 'Morais', 'a@a.com', 1, GETDATE())	--Desde que os Valores na Ordem das Colunas da Tabela
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'
*/

/*
--Cl�usula UPDATE--

BEGIN TRAN								--Inicia uma Transa��o que pode ser REVERTIDA com o ROLLBACK

SELECT * FROM Clientes WHERE Id = 1031	--TODO UPDATE DEVE SEMPRE ser Utilizado com um SELECT ANTERIORMENTE para GARANTIA da Altera��o da Tupla Correta
UPDATE Clientes							--Altera na Tabela 'Clientes'
SET Nome = 'Davi',						--SETA o Campo 'Nome' com o Valor 'Davi'(Alterando-o)
	AceitaComunicados = 0				--',' = Seta TAMB�M 'AceitaComunicados' como 0
WHERE Id = 1031							--Enquanto o Id = 1031(Cl�usula 'WHERE' DEVE SEMPRE ser Utilizada; Id GARANTE que SOMENTE essa Tupla ser� Alterada)
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'

--ROLLBACK								--Reverte a Transa��o caso tenha sido errada (Como dar um UPDATE SEM WHERE)
*/

/*
--Cl�usula DELETE--

SELECT * FROM Clientes
BEGIN TRAN
DELETE Clientes							--DELETA da Tabela Clientes
WHERE Id=7 OR Id= 8 OR Id=9 OR Id=10	--Enquanto os Campos Id = ... (ATEN��O: NUNCA esque�a do WHERE)
--ROLLBACK
*/


--Cria��o de Tabelas--

--DROP TABLE IF EXISTS dbo.Produtos				--Apaga a Tabela se j� Existir
/*
CREATE TABLE Produtos (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,	--Seta Id como Chave Prim�ria
	Nome varchar(255) NOT NULL,
	Cor varchar(50) NULL,
	Preco decimal(13, 2) NOT NULL,
	Tamanho varchar(5) NULL,
	Genero char(1) NULL
)

--INSERT INTO Produtos VALUES ('Mountain Bike Socks, M','Branco','9.50','M','U')
*/

/*
--Built-In Functions--

SELECT * FROM Produtos

SELECT COUNT(*) QtdProd FROM Produtos WHERE Tamanho = 'M'	--Conta Quantas Linhas(Produtos) de Tamanho 'M' e Nomeia a Coluna Exibida = 'QtdProd' da tabela Produtos

SELECT SUM(Preco) Total FROM Produtos WHERE Tamanho = 'M'					--Soma a coluna 'Preco'...

SELECT MIN(Preco) Total FROM Produtos WHERE Tamanho = 'M'					--Seleciona o Produto com Menor Pre�o...

SELECT MAX(Preco) Total FROM Produtos WHERE Tamanho = 'M'					--Seleciona o Produto com Menor Pre�o...

SELECT AVG(Preco) Total FROM Produtos WHERE Tamanho = 'M'					--Seleciona a M�dia dos Pre�o dos Produtos...

SELECT 'Produto: ' + Nome + ' Cor: ' + UPPER(Cor) Produto_Cor From Produtos	--Seleciona O Nome e a Cor dos Produtos e Exibe Formatando a Sa�da
*/

/*
--Adicionando e Removendo Colunas & Formatando Datas--

ALTER TABLE Produtos			--Altera a Tabela Produtos...
ADD DataCadastro DATETIME2		--Adicionando uma Coluna de nome 'DataCadastro' do Tipo DateTime2

--ATEN��O: O UPDATE a seguir est� sem WHERE Propositalmente, pois queremos alterar TODOS os Registros
UPDATE Produtos SET DataCadastro = GETDATE()

--Formatando Datas...
SELECT Nome, Preco, FORMAT(DataCadastro, 'dd/MM/yyyy') 'Data de Cadastro' FROM Produtos

SELECT * FROM Produtos

ALTER TABLE Produtos
ADD Teste INT

ALTER TABLE Produtos			--Altera a Tabela Produtos...
DROP COLUMN Teste				--Apagando a Coluna Teste

SELECT * FROM Produtos
*/

/*
--Agrupando Dados--

SELECT Tamanho,				--Selecione o Campo 'Tammanho' e...
	COUNT(*) Quantidade		--selecione a Contagem do Campo Quantidade...
FROM Produtos				--da Tabela Produtos...
WHERE Tamanho <> 'GG'		--Desconsiderando o Tamanho 'GG' (ou seja, Tamanho Diferente de GG)
GROUP BY Tamanho			--Agrupando por Tamanho
ORDER BY Quantidade			--Ordenando por Tamanho
*/

/*
--Chave Estrangeira--

--Criando a Tabela Endere�os com Chave Estrangeira pata Cliente
CREATE TABLE Enderecos(
	Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdCliente int NULL,
	Rua varchar(255) NULL,
	Bairro varchar(255) NULL,
	Cidade varchar(255) NULL,
	Estado char(2) NULL,

	CONSTRAINT FK_Enderecos_Clientes FOREIGN KEY (IdCliente)	--Cria Restri��o de nome FK_Tab_TabReferenciada do tipo Chave Estrangeira na Coluna 'IdCliente'...
	REFERENCES Clientes(Id)										--Referenciando a Tabela 'Clientes'(Coluna Id)
)

INSERT INTO Enderecos VALUES (4, 'Rua Teste', 'Bairro A', 'Fortaleza', 'CE')
INSERT INTO Enderecos VALUES (3, 'Rua 3', 'Bairro 3', 'Fortaleza', 'CE')
INSERT INTO Enderecos VALUES (2, 'Rua 2', 'Bairro 2', 'Fortaleza', 'CE')
INSERT INTO Enderecos VALUES (1, 'Rua 1', 'Bairro 1', 'Fortaleza', 'CE')

SELECT * FROM Enderecos WHERE IdCliente = 4
*/

/*
--Join (Inner Join)

SELECT 
	C.Id, C.Nome, C.Sobrenome, C.Email,
	E.Rua,
	E.Bairro
FROM
	Clientes C			--Apelidando 'Clientes' de 'C' (Alias)
INNER JOIN				--"Juntando" com a Tabela 'Endere�os'
	Enderecos E
ON C.Id = E.IdCliente	--Para o Campo Id da Tabela Cliente = Campo IdCliente (Intersec��o)
WHERE C.Id = 4
*/