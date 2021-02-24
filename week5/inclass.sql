Use AP;

SELECT * 
FROM Invoices;

-- Subquery
SELECT AVG(InvoiceTotal) 
FROM Invoices; --1879.7413

SELECT InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 1879.7413;

SELECT InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > (SELECT AVG(InvoiceTotal)
						FROM Invoices);

-- Query Subquery
SELECT VendorID
FROM Vendors
WHERE VendorState = 'CA'

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE VendorID IN 
	(SELECT VendorID
	FROM Vendors
	WHERE VendorState = 'CA')
ORDER BY InvoiceDate;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices i JOIN Vendors v
ON i.VendorID = v.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

-- USE NOT
SELECT VendorID, VendorName, VendorState
FROM Vendors
WHERE VendorID NOT IN
	(SELECT DISTINCT VendorID
	FROM Invoices);

-- USE ANY / ALL Keyword
SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Invoices i JOIN Vendors v
ON i.VendorID = v.VendorID
WHERE InvoiceTotal > ALL 
	(SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID = 34)
ORDER BY VendorName;

SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Invoices i JOIN Vendors v
ON i.VendorID = v.VendorID
WHERE InvoiceTotal < ANY 
	(SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID = 115);

-- USE EXISTS
SELECT VendorID, VendorName, VendorState
FROM Vendors
WHERE EXISTS 
	(SELECT *
	FROM Invoices
	WHERE Invoices.VendorID = Vendors.VendorID);

--