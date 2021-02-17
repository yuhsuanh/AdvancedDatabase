USE AP;

SELECT * FROM Vendors;
SELECT * FROM Invoices;

-- 1. Cross Join (Cartisian)
SELECT VendorName, InvoiceNumber
FROM Vendors, Invoices;


-- 2. Inner Join (Implicit)
SELECT VendorName, InvoiceNumber
FROM Vendors, Invoices
WHERE Vendors.VendorID = Invoices.VendorID;


-- 3. 
SELECT VendorName, InvoiceNumber
FROM Vendors, Invoices
WHERE Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName;


-- 4. Inner Join (Explictic)
SELECT VendorName, InvoiceNumber
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName;


-- 5. Inner Join (Explictic)
SELECT VendorName, InvoiceNumber
FROM Vendors INNER JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName;


-- 5. Inner Join (Explictic)
SELECT VendorName, InvoiceNumber
FROM Vendors AS V JOIN Invoices AS I
ON V.VendorID = I.VendorID
ORDER BY VendorName;


-- 5. Inner Join (Explictic)
SELECT VendorName, InvoiceNumber
FROM Vendors V JOIN Invoices I
ON V.VendorID = I.VendorID
ORDER BY VendorName;


-- 6. Inner Join (Explictic)
SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Vendors V JOIN Invoices I
ON V.VendorID = I.VendorID
	AND InvoiceTotal > 2500
ORDER BY VendorName;


-- 7. Inner Join (Explictic)
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal
FROM Vendors V JOIN Invoices I
ON V.VendorID = I.VendorID
WHERE InvoiceTotal > 2500
ORDER BY VendorName;


-- 8. Inner Join (Explictic)
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal, AccountNo
FROM Vendors V JOIN Invoices I 
ON V.VendorID = I.VendorID
	JOIN InvoiceLineItems L
	ON L.InvoiceID = I.InvoiceID;


-- 9. Left Outer Join
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal
FROM Vendors V LEFT JOIN Invoices I 
ON V.VendorID = I.VendorID;


-- 9. Left Outer Join
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal
FROM Vendors V LEFT OUTER JOIN Invoices I 
ON V.VendorID = I.VendorID;


-- 10. Right Outer Join
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal
FROM Vendors V RIGHT JOIN Invoices I 
ON V.VendorID = I.VendorID;


-- 10. FULL Join
SELECT V.VendorID, V.VendorName, I.InvoiceNumber, I.InvoiceTotal
FROM Vendors V FULL JOIN Invoices I 
ON V.VendorID = I.VendorID;


-- 11. UNION
SELECT Invoicetotal
FROM Invoices
WHERE InvoiceTotal > 20000
	UNION
SELECT Invoicetotal
FROM Invoices
WHERE InvoiceTotal < 20;


-- 11. UNION
SELECT DISTINCT Invoicetotal
FROM Invoices
WHERE InvoiceTotal > 20000 OR InvoiceTotal < 20;
