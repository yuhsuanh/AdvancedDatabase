use AdventureWorks2017;


--Q1
SELECT * FROM HumanResources.Employee WHERE MaritalStatus = 'M';

UPDATE HumanResources.Employee
SET VacationHours = VacationHours+5
WHERE MaritalStatus = 'M';

SELECT * FROM HumanResources.Employee WHERE MaritalStatus = 'M';




--Q2

SELECT * FROM Person.PhoneNumberType;
select * from Person.PersonPhone;
select * from Person.Person WHERE BusinessEntityID = 723;

SELECT P.BusinessEntityID 'Business Entity ID', P.FirstName 'First Name', P.LastName 'Last Name', F.PhoneNumber'Phone Number', T.Name 'Phone Type'
FROM Person.Person P
	JOIN Person.PersonPhone F
		ON P.BusinessEntityID = F.BusinessEntityID
	JOIN Person.PhoneNumberType T
		ON F.PhoneNumberTypeID = T.PhoneNumberTypeID
WHERE P.BusinessEntityID = 723;



--Q3
SELECT * FROM Sales.currency;

GO --

IF OBJECT_ID('Sales.CurrencyLog') is null
BEGIN
	PRINT('Sales.CurrencyLog not Exist! Create Table!');
	CREATE TABLE Sales.CurrencyLog (
		ID INT IDENTITY(1,1) PRIMARY KEY ,
		logName VARCHAR(50)
	);
END
ELSE
	PRINT('Sales.CurrencyLog Exist!');
GO --

CREATE TRIGGER Currency_Insert_Trigger
	ON Sales.Currency
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	--CHECK Sales.CurrencyLog EXIST OR NOT
	IF OBJECT_ID('Sales.CurrencyLog') is null
	BEGIN
		PRINT('Sales.CurrencyLog not Exist! Create Table!');
		CREATE TABLE Sales.CurrencyLog (
			ID INT IDENTITY(1,1) PRIMARY KEY ,
			logName VARCHAR(50)
		);
	END
	ELSE
		PRINT('Sales.CurrencyLog Exist!');

	INSERT INTO Sales.CurrencyLog(logName)
	VALUES ('1 row was inserted');
END
GO--

INSERT INTO Sales.Currency(CurrencyCode, Name)
VALUES('BIT', 'Bitcoin');

INSERT INTO Sales.Currency(CurrencyCode, Name)
VALUES('ETH', 'Ethereum');

SELECT * FROM Sales.CurrencyLog;



--Q4
GO--
CREATE PROCEDURE YuHsuanHuang @hours INT
AS
	BEGIN
		PRINT('Top 5 employees have been retrieved...');

		SELECT TOP(5) BusinessEntityID, MaritalStatus, HireDate, SickLeaveHours
		FROM HumanResources.Employee
		WHERE MaritalStatus = 'S' AND YEAR(HireDate) > 2009
			AND VacationHours > @hours
		ORDER BY SickLeaveHours DESC;
	END
GO --

EXEC YuHsuanHuang 60;

GO --




--Q5
CREATE TABLE MyPerson(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	CollegeName NVARCHAR(25) DEFAULT('Georgian College') NOT NULL,
	ProgramName NVARCHAR(30) NOT NULL,
	BusinessEntityID INT NOT NULL,
	
	CONSTRAINT Person_fk FOREIGN KEY (BusinessEntityID) 
	REFERENCES Person.Person ON DELETE NO ACTION
);

INSERT INTO MyPerson (ProgramName, BusinessEntityID)
VALUES  ('Computer Programming', 723),
		('Art', 723),
		('Business', 723);

SELECT * FROM MyPerson WHERE BusinessEntityID = 723;