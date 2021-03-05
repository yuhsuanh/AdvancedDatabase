Use AdventureWorks2017;

Print 'YH-Hsuan Huang, Caio Carminatti Pantaleao';
Print 'Student Number: 200443723, 200437139';
Print 'Advanced Database - 02 - Assignemnt 2';
Print '';
Print '';

Print 'Question 1
The Query shows how many products in the Purchase Order Detail.

SELECT COUNT(DISTINCT ProductID) AS NumberOfProduct
	FROM Purchasing.PurchaseOrderDetail;
';
Print '';
SELECT COUNT(DISTINCT ProductID) AS NumberOfProduct
	FROM Purchasing.PurchaseOrderDetail;




Print '';
Print '';
Print 'Question 2
The Query shows the most profitable product in Purchase Order Detail.

SELECT TOP 1 ProductID , SUM(UnitPrice*OrderQty) AS Profit	FROM Purchasing.PurchaseOrderDetail 	GROUP BY ProductID	ORDER BY Profit DESC;
';
Print '';
SELECT TOP 1 ProductID , SUM(UnitPrice*OrderQty) AS Profit	FROM Purchasing.PurchaseOrderDetail 	GROUP BY ProductID	ORDER BY Profit DESC;Print '';
Print '';
Print 'Question 3
The query shows the product name and their profit which have top 5 profitable product.

SELECT TOP 5 P.Name, SUM(UnitPrice*OrderQty) AS Profit	FROM Purchasing.PurchaseOrderDetail AS D JOIN Production.Product AS P	ON D.ProductID = P.ProductID	GROUP BY P.Name	ORDER BY Profit DESC;
';
Print '';
SELECT TOP 5 P.Name, SUM(UnitPrice*OrderQty) AS Profit	FROM Purchasing.PurchaseOrderDetail AS D JOIN Production.Product AS P	ON D.ProductID = P.ProductID	GROUP BY P.Name	ORDER BY Profit DESC;Print '';
Print '';
Print 'Question 4
The query shows number of products with the stock quantity more than the average stock quantity.

SELECT COUNT(*) AS Amount
	FROM Purchasing.PurchaseOrderDetail
	WHERE StockedQty > (SELECT AVG(StockedQty)
						FROM Purchasing.PurchaseOrderDetail);
';
Print '';
SELECT COUNT(*) AS Amount
	FROM Purchasing.PurchaseOrderDetail
	WHERE StockedQty > (SELECT AVG(StockedQty)
						FROM Purchasing.PurchaseOrderDetail);

Print '';
Print '';
Print 'Question 5
The query shows the product id and the modified date of the products which product''s description with special offer ¡§Half-Price Pedal Sale¡¨.

SELECT ProductID, ModifiedDate
	FROM Sales.SpecialOfferProduct
	WHERE SpecialOfferID = (SELECT SpecialOfferID
							FROM Sales.SpecialOffer
							WHERE Description = ''Half-Price Pedal Sale'');
';
Print '';
SELECT ProductID, ModifiedDate
	FROM Sales.SpecialOfferProduct
	WHERE SpecialOfferID = (SELECT SpecialOfferID
							FROM Sales.SpecialOffer
							WHERE Description = 'Half-Price Pedal Sale');


Print '';
Print '';
Print 'Question 6
The query shows all the product name with ¡¥seat Assembly¡¦ and no value in their PurchaseOrderDetailID.

SELECT P.ProductID AS ProductID, Name, PurchaseOrderDetailID
	FROM Production.Product AS P LEFT JOIN Purchasing.PurchaseOrderDetail AS D
	ON P.ProductID = D.ProductID
	WHERE P.Name LIKE ''%Seat Assembly%'' AND 
		  D.PurchaseOrderDetailID IS NULL
	ORDER BY P.ProductID;
';
Print '';
SELECT P.ProductID AS ProductID, Name, PurchaseOrderDetailID
	FROM Production.Product AS P LEFT JOIN Purchasing.PurchaseOrderDetail AS D
	ON P.ProductID = D.ProductID
	WHERE P.Name LIKE '%Seat Assembly%' AND 
		  D.PurchaseOrderDetailID IS NULL
	ORDER BY P.ProductID;


Print '';
Print '';
Print 'Question 7
Using CTE(Common Table Expression) to create a temporary named result set. Then, using the query shows the total number of sales orders per year for each sales representative. 

WITH SalesOrderHeader_CTE(SalesPersonID, SalesOrderID, SalesYear)
AS (SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL)

SELECT SalesYear, SalesPersonID, COUNT(SalesOrderID) AS TotalNumber
	FROM SalesOrderHeader_CTE
	GROUP BY SalesPersonID, SalesYear
	ORDER BY SalesYear, SalesPersonID, TotalNumber;
';
Print '';
WITH SalesOrderHeader_CTE(SalesPersonID, SalesOrderID, SalesYear)
AS (SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL)

SELECT SalesYear, SalesPersonID, COUNT(SalesOrderID) AS TotalNumber
	FROM SalesOrderHeader_CTE
	GROUP BY SalesPersonID, SalesYear
	ORDER BY SalesYear, SalesPersonID, TotalNumber;



Print '';
Print '';
Print 'Question 8
The query shows the five products which with highest total StockedQty.

SELECT TOP 5 ProductID, SUM(StockedQty) AS TotalNumber
	FROM Purchasing.PurchaseOrderDetail
	GROUP BY ProductID
	ORDER BY TotalNumber DESC;
';
Print '';
SELECT TOP 5 ProductID, SUM(StockedQty) AS TotalNumber
	FROM Purchasing.PurchaseOrderDetail
	GROUP BY ProductID
	ORDER BY TotalNumber DESC;



Print '';
Print '';
Print 'Question 9
Compare the StandardCost between Production.Product table and Production.ProductCostHistory table to show which modified date is the newest.
(Show only the non-similar modified dates)

a) The Production.Product table is the newest. When looking at the modified dates from the Product table they are more recent when compared with
the modified dates from the ProductCostHistory table for the same ProductID.

b)
SELECT P.ProductID, P.StandardCost AS ProductStandardCost, p.ModifiedDate AS ProductModifiedDate, H.StandardCost AS ProductHistoryStandardCost, H.ModifiedDate AS ProductHistoryModifiedDate
	FROM Production.Product AS P JOIN Production.ProductCostHistory AS H
	ON P.ProductID = H.ProductID
	WHERE P.ModifiedDate != H.ModifiedDate;
';
Print '';
SELECT P.ProductID, P.StandardCost AS ProductStandardCost, p.ModifiedDate AS ProductModifiedDate, H.StandardCost AS ProductHistoryStandardCost, H.ModifiedDate AS ProductHistoryModifiedDate
	FROM Production.Product AS P JOIN Production.ProductCostHistory AS H
	ON P.ProductID = H.ProductID
	WHERE P.ModifiedDate != H.ModifiedDate;