use AdventureWorks2017;

-- use variable
declare @variable int = 123

select *
from Person.Address
where AddressID = @variable;




select AddressID, AddressLine1, City
from Person.Address
order by city;

-- offset only use after order by
-- Get 10 rows from row no.8
select AddressID, AddressLine1, City
from Person.Address
order by city
offset 7 rows
fetch next 10 rows only;



-- You can try to do something if you are not pretty sure.
begin tran --transaction
--update somthing / do something
rollback;


