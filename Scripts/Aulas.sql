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
*/