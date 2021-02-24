USE AdventureWorks2017;

GO

WITH Employee_CTE (EmployeeNumber, Title)
AS
	(SELECT NationalIDNumber, JobTitle
	FROM HumanResources.Employee)
SELECT EmployeeNumber, Title
FROM Employee_CTE