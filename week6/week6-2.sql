
--decalre variable Called X1 and X2
declare @X1 INT, @X2 INT
SELECT 1 + 2;

--Give value to the variable
SELECT @X1 = 1000;
SELECT @X2 = 500;
SELECT @X1 + @X2;


Print 'This is a message';


USE AdventureWorks2017;  
GO  
DECLARE @MyMsg1 VARCHAR(50)  
DECLARE @MyMsg2 VARCHAR(50)  

SELECT @MyMsg1 = 'Hello, World.'  
PRINT  @MyMsg1  
SELECT @MyMsg2 = 'Hello, College Students.'  
GO -- @MyMsg2 and  @MyMsg1 are not valid after this GO ends the batch.  

-- Yields an error because @MyMsg2 not declared in this batch.  
PRINT @MyMsg2  
GO




select * from Colors;


create table Colors (