Use Subqueries;

SELECT * FROM SalesPerson;

INSERT INTO SalesPerson(EmpID, First_Name, Last_Name)
VALUES	(900, 'Maziar', 'Shajari'),
		(901, 'Sean', 'Huang'),
		(902, 'Will', 'Smith');

select count(distinct empid)
from SalesPerson;

delete from SalesPerson where EmpID = 900;

insert into SalesPerson
 values		(723, 'sean', 'Huang');

 update SalesPerson
 set First_Name = 'John'
 where EmpID = 20;

 select * from SalesPerson where EmpID = 20;

  update SalesPerson
 set Last_Name = 'Doe'
 where EmpID = 20;

 select * from SalesPerson where EmpID = 20;

 update SalesPerson
 set First_Name = 'Sara', Last_Name = 'Cyrus'
 where EmpID = 20;
 
 select * from SalesPerson where EmpID = 20;

exec sp_columns salesperson;