
use AdventureWorks2017;

select * from Person.PersonPhone ;
select * from Person.Person;


SELECT FirstName, LastName, PhoneNumber, E.ModifiedDate AS ModifiedDate
INTO YH_MID2
FROM Person.Person P join Person.PersonPhone E
ON P.BusinessEntityID = E.BusinessEntityID
WHERE YEAR(E.ModifiedDate) < 2008
ORDER BY ModifiedDate;


select * from YH_MID2;

select count(distinct city) from person.address where StateProvinceID = 9;

SELECT StateProvinceID, COUNT(DISTINCT City) AS NumberOfCity
FROM Person.Address
GROUP BY StateProvinceID
ORDER BY NumberOfCity DESC;




select * from Production.Location;

SELECT COUNT(DISTINCT Name)
FROM Production.Location;


-- YH_Mid
CREATE TABLE YH_Mid(
	ID int IDENTITY(1,1) PRIMARY KEY,
	PersonID INT,
	AcNo NVARCHAR(10)
);

INSERT INTO YH_Mid(PersonID, AcNo)
SELECT PersonID, AccountNumber
FROM Sales.Customer
WHERE PersonID IS NOT NULL;

select * from sales.customer;
select * from YH_Mid;




select * from person.person;
select * from person.address;
select * from person.businessentityaddress;

SELECT CONCAT(P.FirstName, ' ', P.LastName) AS FullName
FROM Person.Person P 
JOIN Person.BusinessEntityAddress B
	ON P.BusinessEntityID = B.BusinessEntityID
JOIN Person.Address A 
	ON B.AddressID = A.AddressID
WHERE A.City = 'Kenmore'
ORDER BY FullName;



select * from sales.personcreditcard where CreditCardID = 5857;

SELECT CreditCardID
FROM Sales.PersonCreditCard
WHERE YEAR(ModifiedDate) = 2011 AND MONTH(ModifiedDate) = 11
ORDER BY CreditCardID;





select * from person.address;
select DATEDIFF(DAY, '2021-03-01', GETDATE()) ;


SELECT TOP 10 AddressID, PostalCode, ModifiedDate, DATEDIFF(DAY, ModifiedDate, GETDATE()) 'Days past since update'
FROM Person.Address
ORDER BY ModifiedDate ASC;







