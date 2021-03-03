Use AdventureWorks2017;

Print 'YH-Hsuan Huang, Caio Carminatti Pantaleao';
Print 'Student Number: 200443723, 200437139';
Print 'Advanced Database - 02 - Assignemnt 1';
Print '';
Print '';

Print 'Question 1
Select the records where the peson lives in Los Angeles and also has information in the AddessLine2

SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City = ''Los Angeles'' AND AddressLine2 IS NOT NULL;
';
Print '';
SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City = 'Los Angeles' AND AddressLine2 IS NOT NULL;



Print '';
Print '';
Print 'Question 2
Select the records where the peson lives in Los Angeles or Toronto and also has information in the AddessLine2

SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City in(''Los Angeles'', ''Toronto'') AND AddressLine2 IS NOT NULL;
';
Print '';
SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City in('Los Angeles', 'Toronto') AND AddressLine2 IS NOT NULL;


Print '';
Print '';
Print 'Question 3
Select the records where the peson lives in Los Angeles or Toronto and also has information in the AddessLine2

SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City in(''Los Angeles'', ''Toronto'', ''Downey'') AND AddressLine2 IS NOT NULL;
';
Print '';
SELECT [AddressID], [AddressLine1], [AddressLine2], [City]
	FROM [Person].[Address]
	WHERE City in('Los Angeles', 'Toronto', 'Downey') AND AddressLine2 IS NOT NULL;


Print '';
Print '';
Print 'Question 4 - A
Select the Product Cost History which Standard Cost between 100 and 120 sorts according to modified date.

SELECT * 
	FROM [Production].[ProductCostHistory]
	WHERE StandardCost BETWEEN 100 AND 120
	ORDER BY ModifiedDate;
';
Print '';
SELECT * 
	FROM [Production].[ProductCostHistory]
	WHERE StandardCost BETWEEN 100 AND 120
	ORDER BY ModifiedDate;

Print '';
Print 'Question 4 - B
Select the Product Cost History which Standard Cost greater than 2000.

SELECT * 
	FROM [Production].[ProductCostHistory]
	WHERE StandardCost > 2000
	ORDER BY ModifiedDate;
';
Print '';
SELECT * 
	FROM [Production].[ProductCostHistory]
	WHERE StandardCost > 2000
	ORDER BY ModifiedDate;


Print '';
Print '';
Print 'Question 5
Select the person who first name start with B and Last name start with RU, end with LL

SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate]
	FROM [Person].[Person]
	WHERE LastName LIKE ''RU%LL'' AND FirstName LIKE ''B%'';
';
Print '';
SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate]
FROM [Person].[Person]
WHERE LastName LIKE 'RU%LL' AND FirstName LIKE 'B%';


Print '';
Print '';
Print 'Question 6
Select the person who first name only three characters and Last name end with LL

SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate]
	FROM [Person].[Person]
	WHERE LastName LIKE ''%LL'' AND FirstName LIKE ''___'';
';
Print '';
SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate]
	FROM [Person].[Person]
	WHERE LastName LIKE '%LL' AND FirstName LIKE '___';


Print '';
Print '';
Print 'Question 7
Select the person who first name only three characters and Last name end with LL (also show the two columns: today''s day and total days past from the modified date)

SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate], getdate() AS Today, CAST(GETDATE() - [ModifiedDate] AS INT) AS ''Days Past''
	FROM [Person].[Person]
	WHERE LastName LIKE ''%LL'' AND FirstName LIKE ''___'';
';
Print '';
SELECT TOP 10 [BusinessEntityID], [FirstName], [LastName], [ModifiedDate], getdate() AS Today, CAST(GETDATE() - [ModifiedDate] AS INT) AS 'Days Past'
	FROM [Person].[Person]
	WHERE LastName LIKE '%LL' AND FirstName LIKE '___';


