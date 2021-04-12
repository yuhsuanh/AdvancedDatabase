Use AdventureWorks2017;

Print 'YH-Hsuan Huang, Caio Carminatti Pantaleao';
Print 'Student Number: 200443723, 200437139';
Print 'Advanced Database - 02 - Assignemnt 4';
Print '';
Print '';

Print 'Question 1
Delete Adventureworks and create it again (Restore). 

DROP DATABASE Adventureworks2017;

Show the first and last names of the persons in the Person.Person table. We need the one with the first names staring with ''Amb'' without any middle name.

SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName LIKE ''Amb%'' AND MiddleName IS NULL;
';
Print '';

SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName LIKE 'Amb%' AND MiddleName IS NULL;



Print '';
Print '';
Print 'Question 2
Update the person title of Amy Alberts to ''Ms.'' and Modify the date (modifieddate) to the current date. Only update the ones without any title.

UPDATE Person.Person
SET Title = ''Ms.'',
	ModifiedDate = GETDATE()
WHERE FirstName = ''Amy'' AND LastName = ''Alberts'' AND Title IS NULL;
';

UPDATE Person.Person
SET Title = 'Ms.',
	ModifiedDate = GETDATE()
WHERE FirstName = 'Amy' AND LastName = 'Alberts' AND Title IS NULL;

Print '
SELECT *
FROM Person.Person
WHERE FirstName = ''Amy'' AND LastName = ''Alberts'';

';

SELECT *
FROM Person.Person
WHERE FirstName = 'Amy' AND LastName = 'Alberts';



Print '';
Print '';
Print 'Question 3
We need several items from 3 tables.
1. we need First name, Last name and title from Person.person.
2. we need businessEntityID from Person.BusinessEntity.
3. we need the AddressID from person.BusinessEntityAddress.

SELECT TOP 20 P.FirstName, P.LastName, P.Title, B.BusinessEntityID, A.AddressID
FROM Person.Person P 
	JOIN Person.BusinessEntity B
		ON P.BusinessEntityID = B.BusinessEntityID
	JOIN Person.BusinessEntityAddress A
		ON B.BusinessEntityID = A.BusinessEntityID;

';

SELECT TOP 20 P.FirstName, P.LastName, P.Title, B.BusinessEntityID, A.AddressID
FROM Person.Person P 
	JOIN Person.BusinessEntity B
		ON P.BusinessEntityID = B.BusinessEntityID
	JOIN Person.BusinessEntityAddress A
		ON B.BusinessEntityID = A.BusinessEntityID;

Print '';
Print '';
Print 'Question 5
Create a view only display first 10 rows with 5 columns from 2 tables.
1. OrderQty, UnitPrice, PurchaseOrderID colums from PurchaseOrderDetail table 
2. OrderDate, VendorID colums from PurchaseOrderHeader table

CREATE VIEW Purchase_View 
AS 
SELECT TOP 10 H.VendorID, H.OrderDate, D.PurchaseOrderID, D.OrderQty, D.UnitPrice
FROM Purchasing.PurchaseOrderHeader H
	JOIN Purchasing.PurchaseOrderDetail D
		ON H.PurchaseOrderID = D.PurchaseOrderID;
';


GO --

CREATE VIEW Purchase_View 
AS 
SELECT TOP 10 H.VendorID, H.OrderDate, D.PurchaseOrderID, D.OrderQty, D.UnitPrice
FROM Purchasing.PurchaseOrderHeader H
	JOIN Purchasing.PurchaseOrderDetail D
		ON H.PurchaseOrderID = D.PurchaseOrderID;

GO --

Print '
SELECT * 
FROM Purchase_View;

';

SELECT * 
FROM Purchase_View;



Print '';
Print '';
Print 'Question 6
Create a trigger to fire when a row is going to be updated. 
1. show a message to indicate that an update happened with the update・s date
2. Update all the modified date with the current date and show the results

CREATE TRIGGER PurchaseOrderDetail_Reminder
ON Purchasing.PurchaseOrderDetail
AFTER UPDATE
AS
	SET NOCOUNT ON;
	DECLARE @PurchaseOrderDetailID INT
	
	SELECT @PurchaseOrderDetailID = INSERTED.PurchaseOrderDetailID
	FROM INSERTED

	UPDATE Purchasing.PurchaseOrderDetail
	SET ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = @PurchaseOrderDetailID

	PRINT(''The PurchaseOrderDetail has been update at'' +  + ''!!!'')
';

GO --

CREATE TRIGGER PurchaseOrderDetail_Reminder
ON Purchasing.PurchaseOrderDetail
AFTER UPDATE
AS
	SET NOCOUNT ON;
	DECLARE @PurchaseOrderDetailID INT
	
	SELECT @PurchaseOrderDetailID = INSERTED.PurchaseOrderDetailID
	FROM INSERTED

	UPDATE Purchasing.PurchaseOrderDetail
	SET ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = @PurchaseOrderDetailID

	PRINT('The PurchaseOrderDetail has been update at' +  + '!!!')

GO --

Print '
UPDATE Purchasing.PurchaseOrderDetail
SET RejectedQty = 0.0
WHERE PurchaseOrderDetailID = 1;

';
UPDATE Purchasing.PurchaseOrderDetail
SET RejectedQty = 0.0
WHERE PurchaseOrderDetailID = 1;


Print '';
Print '';
Print 'Question 7
In the sales person・s table, we need to compare the values of last year and recent sale of the sale persons. 
If they have sold more than last year, write ''Need more bonus''. Otherwise, write ．No bonus・. Name the column as ''Bonus''

SELECT P.FirstName, P.LastName, S.SalesYTD, S.SalesLastYear, (S.SalesYTD - S.SalesLastYear) AS Compare, 
CASE
	WHEN (S.SalesYTD - S.SalesLastYear) > 0 THEN ''Need more bouns''
ELSE ''No bouns''
END AS Bouns
FROM Person.Person P
	JOIN Sales.SalesPerson S
		ON P.BusinessEntityID = S.BusinessEntityID;
';
Print '';

SELECT P.FirstName, P.LastName, S.SalesYTD, S.SalesLastYear, (S.SalesYTD - S.SalesLastYear) AS Compare, 
CASE
	WHEN (S.SalesYTD - S.SalesLastYear) > 0 THEN 'Need more bouns'
ELSE 'No bouns'
END AS Bouns
FROM Person.Person P
	JOIN Sales.SalesPerson S
		ON P.BusinessEntityID = S.BusinessEntityID;
