Use AdventureWorks2017;

-- This is the comment
/*
# hashtag cannot use in MS SQL SMS
Multi-line comments
*/

Print 'YH-Hsuan Huang';
Print 'Student Number: 200443723';
Print 'Advanced Database-02';
Print '';
Print '';

Print 'Question 1
SELECT * 
FROM [Production].[Product];
';
Print '';
-- 1--------------
SELECT * 
FROM [Production].[Product];

-- 2--------------
SELECT ProductID, [Name], Color
FROM Production.Product;

-- 3--------------
SELECT ProductID, [Name], Color, ListPrice, ListPrice*10 AS 'New Price'
FROM Production.Product;

-- 4--------------
SELECT DISTINCT Color
FROM Production.Product;

-- 5--------------
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color DESC; --ASC/DESC

-- 6--------------
SELECT DISTINCT Color
FROM Production.Product
ORDER BY 1; -- Color/1 (Index Number)

-- 7--------------
SELECT [Name], Color
FROM Production.Product
ORDER BY 1 DESC, 2; -- Color/1 (Index Number) --ASC/DESC

-- 8--------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE ListPrice > 2000;

-- 9--------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE ListPrice = 3578.27; -- <>/!= (not equal to)

-- 10-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE Name = 'blade';

-- 11-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE Name < 'blade';

-- 12-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE Name LIKE 'b%';

-- 13-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE Name LIKE 'b_ade';

-- 14-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE Name > 'b' AND Name < 'g';

-- 15-------------
SELECT [Name], Color, [ListPrice]
FROM Production.Product
WHERE NOT(Name < 'b' OR Name > 'g');
