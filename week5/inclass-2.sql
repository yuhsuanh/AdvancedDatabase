USE Subqueries;

SELECT * 
FROM Sales;

SELECT * 
FROM SalesPerson;

-- USE Distinct keyword
SELECT DISTINCT ProductID, Price
FROM Sales;

-- USE Count function
SELECT count(*) 
FROM SalesPerson;

SELECT * 
FROM Sales
order by 2;
--
SELECT count(DISTINCT productID) 
FROM Sales;

SELECT count(*) 
FROM (SELECT DISTINCT ProductID FROM Sales) as Sales;



SELECT AVG(Price)
FROM Sales;

SELECT SalesID, ProductID, Price, SalesDate, EmpID
FROM Sales
WHERE Price > (SELECT AVG(Price) FROM Sales)
ORDER BY Price;

SELECT AVG(Price), MIN(Price), MAX(Price), SUM(Price), count(Price)
FROM Sales;



-- USE Group By
SELECT EmpID, Price
FROM Sales
ORDER BY 1;

SELECT EmpID, SUM(Price)
FROM Sales
GROUP BY EmpID
ORDER BY 1;

--If I want to know the highest number of sales of Employee
SELECT TOP 1 EmpID, SUM(Price)
FROM Sales
GROUP BY EmpID
ORDER BY 2 DESC;


--USE Having keyword for Group By
SELECT EmpID, SUM (Price) As TotalFROM SalesGROUP BY EmpIDHAVING SUM (Price) > 3000 ;SELECT top 5 First_Name, Last_Name, SUM (S.Price) AS TotalFROM Sales AS S , SalesPerson AS SPWHERE S.EmpID = SP.EmpID group by SP.First_Name , SP.Last_NameORDER BY SUM (S.Price) DESC;