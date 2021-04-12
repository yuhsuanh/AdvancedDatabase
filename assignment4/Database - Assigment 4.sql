USE AdventureWorks2017

Print 'YH-Hsuan Huang, Caio Carminatti Pantaleao';
Print 'Student Number: 200443723, 200437139';
Print 'Advanced Database - 02 - Assignemnt 4';

Print '';
Print '';
Print 'Question 1
Delete Adventureworks and create it again (Restore). 

DROP DATABASE Adventureworks2017;

Show the first and last names of the persons in the Person.Person table. We need the one with the first names staring with ‘Amb?without any middle name.

SELECT FirstName, LastName 
FROM Person.Person
WHERE FirstName LIKE "Amb%" AND MiddleName IS NULL;';
Print '';

SELECT FirstName, LastName 
FROM Person.Person
WHERE FirstName LIKE 'Amb%' AND MiddleName IS NULL;

Print '';
Print '';
Print 'Question 2
Update the Title and the ModifiedDate of all records that have the full name equal Amy Alberts.

UPDATE Person.Person
SET Title = "Ms.",
	ModifiedDate = GETDATE()
WHERE FirstName = "Amy" AND LastName = "Alberts" AND Title IS NULL';
Print '';

UPDATE Person.Person
SET Title = 'Ms.',
	ModifiedDate = GETDATE()
WHERE FirstName = 'Amy' AND LastName = 'Alberts' AND Title IS NULL

Print '';
Print '';
Print 'Question 3
Join three tabels in order to retrieve all the information needed.

SELECT TOP (20) FirstName, LastName, Title,  BE.BusinessEntityID, AddressID
FROM Person.person P JOIN Person.BusinessEntity BE
ON P.BusinessEntityID = BE.BusinessEntityID
JOIN Person.BusinessEntityAddress BEA
ON P.BusinessEntityID = BEA.BusinessEntityID;L';
Print '';

SELECT TOP (20) FirstName, LastName, Title,  BE.BusinessEntityID, AddressID
FROM Person.person P JOIN Person.BusinessEntity BE
ON P.BusinessEntityID = BE.BusinessEntityID
JOIN Person.BusinessEntityAddress BEA
ON P.BusinessEntityID = BEA.BusinessEntityID;

Print '';
Print '';
Print 'Question 5
Create a View with 5 columns.

CREATE VIEW PurchaseView
AS
SELECT TOP (10) POH.PurchaseOrderID, VendorID, OrderQty, UnitPrice, OrderDate
FROM Purchasing.PurchaseOrderHeader POH JOIN Purchasing.PurchaseOrderDetail POD
ON POH.PurchaseOrderID = POD.PurchaseOrderID';
Print '';

GO --
CREATE VIEW PurchaseView
AS
SELECT TOP (10) POH.PurchaseOrderID, VendorID, OrderQty, UnitPrice, OrderDate
FROM Purchasing.PurchaseOrderHeader POH JOIN Purchasing.PurchaseOrderDetail POD
ON POH.PurchaseOrderID = POD.PurchaseOrderID
GO --

Print '';
Print '
SELECT *
FROM PurchaseView';

SELECT *
FROM PurchaseView

Print '';
Print '';
Print 'Question 6
A) Create a trigger.
CREATE TRIGGER PurchaseOrderDetail_UPDATE
ON Purchasing.PurchaseOrderDetail
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PurchaseOrderDetailID INT
	
	SELECT @PurchaseOrderDetailID = INSERTED.PurchaseOrderDetailID
	FROM INSERTED

	UPDATE Purchasing.PurchaseOrderDetail
	SET ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = @PurchaseOrderDetailID

	PRINT("The PurchaseOrderDetail with PurchaseOrderDetailID has been update")
END
';
Print '';
GO --

CREATE TRIGGER PurchaseOrderDetail_UPDATE
ON Purchasing.PurchaseOrderDetail
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PurchaseOrderDetailID INT
	
	SELECT @PurchaseOrderDetailID = INSERTED.PurchaseOrderDetailID
	FROM INSERTED

	UPDATE Purchasing.PurchaseOrderDetail
	SET ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = @PurchaseOrderDetailID

	PRINT('The PurchaseOrderDetail has been update')
END
GO --

Print '
Question 6
B) Update all the modified date and show results.

UPDATE Purchasing.PurchaseOrderDetail
SET RejectedQty = 0.0;

SELECT TOP (20) *
FROM Purchasing.PurchaseOrderDetail;
';

UPDATE Purchasing.PurchaseOrderDetail
SET ModifiedDate = GETDATE()

SELECT TOP (20) *
FROM Purchasing.PurchaseOrderDetail;

Print '';
Print '';
Print 'Question 7
Compare tables information using CASE and JOIN.

SELECT FirstName, 
	   LastName, 
	   SalesYTD,  
	   SalesLastYear, 
	   (SalesYTD-SalesLastYear) AS Compare, 
	   CASE WHEN (SalesYTD-SalesLastYear) > 0 THEN "Need more bonus" ELSE "No bonus" END AS Bonus
FROM Sales.SalesPerson SP JOIN Person.Person P
ON SP.BusinessEntityID = P.BusinessEntityID;
';
Print '';

SELECT FirstName, 
	   LastName, 
	   SalesYTD,  
	   SalesLastYear, 
	   (SalesYTD-SalesLastYear) AS Compare, 
	   CASE WHEN (SalesYTD-SalesLastYear) > 0 THEN 'Need more bonus' ELSE 'No bonus' END AS Bonus
FROM Sales.SalesPerson SP JOIN Person.Person P
ON SP.BusinessEntityID = P.BusinessEntityID;

