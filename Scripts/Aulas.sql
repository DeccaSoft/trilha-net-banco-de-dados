/*
CREATE TABLE [dbo].[Clientes](			--Cria Tabela Clientes
	[Id] [int] IDENTITY(1,1) NOT NULL,	--Campo Id do Tipo Inteiro NÃO NULO(ou seja, Preenchimento Obrigatório) e IDENTITY = AutoIncrementável
	[Nome] [varchar](255) NULL,			--Campo Nome do Tipo Varchar e Tamanho de 255 Caracteres e NULLABLE(ou seja, Aceita Valores NULL - NÃO Obrigatório)
	[Sobrenome] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[AceitaComunicados] [bit] NULL,		--Tipo Bit(Aceita só 0 ou 1 ou NULL
	[DataCadastro] [datetime2](7) NULL	--Tipo DateTime
) ON [PRIMARY]							
GO
*/

--USE ExemploDB
/*
--Cláusula SELECT--

SELECT Nome, Sobrenome, Email FROM Clientes			--Lista apenas colunas 'Nome, Sobrenome e Email' (* = Lista todos as Colunas/Registros) da Tabela 'Clientes'
WHERE Nome = 'Andrew' AND Email = 'email@email.com'	--Filtra Nome = 'Andrew"(Enquanto Nome = 'Andrew') E Email = 'email@email.com' (OR = OU)
ORDER BY Nome, Sobrenome DESC						--Ordena por Nome de Forma Crescente(ASC = Ascendente = Padrão) e Sobrenome de Forma Decrescente
*/

/*
SELECT * FROM Clientes		--Lista TODOS os Registros
WHERE Nome LIKE 'G%'		--Filtra Nome que Começam com a letra 'G'(% = Coringa)
ORDER BY Nome, Sobrenome	--Ordena por Nome e Sobrenome
*/

/*
--Cláusula INSERT--

INSERT INTO Clientes (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro)	--Inere na Tabela Clientes e nas Colunas(Nome, Sobrenome, etc.)
VALUES ('André', 'Morais', 'a@a.com', 1, GETDATE())								--os Valores('André', 'Morais', etc.) / GETDATE() = Data Atual do Sistema
SELECT * FROM Clientes WHERE Nome = 'André'

--OBS.: O Id NÃO foi passado pois ele é AutoIncrementável (Chave Primaria) e NUNCA se repete

INSERT INTO Clientes (Sobrenome, Nome, Email, AceitaComunicados, DataCadastro)	--Pode ser Fora de Ordem...
VALUES ('Morais', 'Daniella', 'a@a.com', 1, GETDATE())							--Desde que os Valores Também o estejam
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'

INSERT INTO Clientes									--As Colunas podem ser Suprimidas...
VALUES ('Mateus', 'Morais', 'a@a.com', 1, GETDATE())	--Desde que os Valores na Ordem das Colunas da Tabela
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'
*/

/*
--Cláusula UPDATE--

BEGIN TRAN								--Inicia uma Transação que pode ser REVERTIDA com o ROLLBACK

SELECT * FROM Clientes WHERE Id = 1031	--TODO UPDATE DEVE SEMPRE ser Utilizado com um SELECT ANTERIORMENTE para GARANTIA da Alteração da Tupla Correta
UPDATE Clientes							--Altera na Tabela 'Clientes'
SET Nome = 'Davi',						--SETA o Campo 'Nome' com o Valor 'Davi'(Alterando-o)
	AceitaComunicados = 0				--',' = Seta TAMBÉM 'AceitaComunicados' como 0
WHERE Id = 1031							--Enquanto o Id = 1031(Cláusula 'WHERE' DEVE SEMPRE ser Utilizada; Id GARANTE que SOMENTE essa Tupla será Alterada)
SELECT * FROM Clientes WHERE Sobrenome = 'Morais'

--ROLLBACK								--Reverte a Transação caso tenha sido errada (Como dar um UPDATE SEM WHERE)
*/

/*
--Cláusula DELETE--

SELECT * FROM Clientes
BEGIN TRAN
DELETE Clientes							--DELETA da Tabela Clientes
WHERE Id=7 OR Id= 8 OR Id=9 OR Id=10	--Enquanto os Campos Id = ... (ATENÇÃO: NUNCA esqueça do WHERE)
--ROLLBACK
*/


--Criação de Tabelas--

--DROP TABLE IF EXISTS dbo.Produtos				--Apaga a Tabela se já Existir
/*
CREATE TABLE Produtos (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,	--Seta Id como Chave Primária
	Nome varchar(255) NOT NULL,
	Cor varchar(50) NULL,
	Preco decimal(13, 2) NOT NULL,
	Tamanho varchar(5) NULL,
	Genero char(1) NULL
)
*/