Use Subqueries;

SELECT *
FROM Sales
ORDER BY SalesID DESC;


-- First Insert 
INSERT INTO Sales (ProductID, Price, SalesDate, EmpID)
VALUES (733, 356.898, GETDATE(), 17);

-- Insert without column name
INSERT INTO Sales
VALUES (733, 356.898, GETDATE(), 15);

-- Insert Something without some columns
INSERT INTO Sales (ProductID, EmpID, Price)
VALUES (733, 11, 399.99);




SELECT *
FROM Sales
WHERE SalesID = 54;

-- Update
UPDATE Sales
SET EmpID = 15
WHERE SalesID = 54;

--DELETE
DELETE FROM Sales
WHERE SalesID >50;
--TRUNCATE ??!!
