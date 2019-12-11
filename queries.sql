-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.productname
    , cat.CategoryName
from Product as p
join Category as cat
    on p.CategoryId = cat.id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id -- GET 429
    , sh.CompanyName
from [Order] as o
join Shipper as sh
    on o.ShipVia = sh.Id
where o.OrderDate < date('2012-08-09');


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select ProductName, Quantity from OrderDetail
    join Product on OrderDetail.ProductId = Product.Id
    where OrderId = 10251
	order by ProductName
;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select Id, CompanyName, LastName from [Order]
    join Customer on [Order].CustomerId = Customer.Id
    join Employee on [Order].EmployeeId = Employee.Id
;



MAPS: 
Single Join

SELECT <origin data>, <foreign data>
from <origin tablename> as <origin alias>
join <foreign tablename> as <foreign alias>
	on <origin alias>.<foreign key on origin table> = <foreign alias>.<primary key on foreign table>



select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice as Price
    , (od.Quantity * p.UnitPrice) as LineTotal  
    , s.CompanyName  as SoldBy  
from [Order] as o
join OrderDetail as od
    on o.id = od.OrderId
join Product as p
    on od.productId = p.id
join Supplier as s
    on s.id = p.SupplierId
;