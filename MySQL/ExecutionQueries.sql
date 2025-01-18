USE ans0148db;

SELECT DISTINCT s.CategoryName AS SubNames
FROM db_book b
JOIN db_subject s ON b.SubjectID = s.SubjectID
JOIN db_supplier sup ON b.SupplierID = sup.SupplierID
WHERE sup.CompanyName = 'supplier2';
SELECT * FROM db_supplier WHERE CompanyName = 'supplier2';

SELECT b.Title AS BookName, b.UnitPrice AS Price
FROM db_book b
JOIN db_supplier sup ON b.SupplierID = sup.SupplierID
WHERE sup.CompanyName = 'supplier3'
ORDER BY b.UnitPrice DESC
LIMIT 1;


SELECT DISTINCT db_book.Title
FROM db_book
JOIN db_order_detail ON db_book.BookID = db_order_detail.BookID
JOIN db_order ON db_order_detail.OrderID = db_order.OrderID
JOIN db_customer ON db_order.CustomerID = db_customer.CustomerID
WHERE db_customer.FirstName = 'firstname1' AND db_customer.LastName = 'lastname1';

SELECT Title
FROM db_book
WHERE Quantity > 10;

SELECT SUM(db_order_detail.Quantity * db_book.UnitPrice) AS TotalPrice
FROM db_order
JOIN db_customer ON db_order.CustomerID = db_customer.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
WHERE db_customer.FirstName = 'firstname1' AND db_customer.LastName = 'lastname1';

SELECT db_customer.FirstName, db_customer.LastName
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
GROUP BY db_customer.CustomerID
HAVING SUM(db_order_detail.Quantity * db_book.UnitPrice) < 80;

SELECT DISTINCT db_book.Title
FROM db_book
JOIN db_supplier ON db_book.SupplierID = db_supplier.SupplierID
WHERE db_supplier.CompanyName = 'supplier2';

SELECT db_customer.FirstName, db_customer.LastName, 
       SUM(db_order_detail.Quantity * db_book.UnitPrice) AS TotalPrice
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
GROUP BY db_customer.CustomerID
ORDER BY TotalPrice DESC;

SELECT db_book.Title, db_shipper.ShpperName AS ShipperName
FROM db_order
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
JOIN db_shipper ON db_order.ShipperID = db_shipper.ShipperID
WHERE db_order.ShippedDate = '2016-08-04';

SELECT DISTINCT db_book.Title
FROM db_order AS o1
JOIN db_customer AS c1 ON o1.CustomerID = c1.CustomerID
JOIN db_order_detail AS d1 ON o1.OrderID = d1.OrderID
JOIN db_book ON d1.BookID = db_book.BookID
WHERE c1.FirstName = 'firstname1' AND c1.LastName = 'lastname1'
AND db_book.Title IN (
    SELECT DISTINCT db_book.Title
    FROM db_order AS o2
    JOIN db_customer AS c2 ON o2.CustomerID = c2.CustomerID
    JOIN db_order_detail AS d2 ON o2.OrderID = d2.OrderID
    JOIN db_book ON d2.BookID = db_book.BookID
    WHERE c2.FirstName = 'firstname4' AND c2.LastName = 'lastname4'
);
SELECT DISTINCT db_book.Title
FROM db_order
JOIN db_employee ON db_order.EmployeeID = db_employee.EmployeeID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
WHERE db_employee.FirstName = 'firstname6' AND db_employee.LastName = 'lastname6';

SELECT db_book.Title, SUM(db_order_detail.Quantity) AS TotalQuantity
FROM db_order_detail
JOIN db_book ON db_order_detail.BookID = db_book.BookID
GROUP BY db_book.BookID
ORDER BY TotalQuantity ASC;

SELECT DISTINCT db_customer.FirstName, db_customer.LastName
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
GROUP BY db_customer.CustomerID
HAVING SUM(db_order_detail.Quantity) >= 2;

SELECT DISTINCT db_customer.FirstName, db_customer.LastName, db_book.Title
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
JOIN db_subject ON db_book.SubjectID = db_subject.SubjectID
WHERE db_subject.CategoryName IN ('category3', 'category4');

SELECT DISTINCT db_customer.FirstName, db_customer.LastName
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
WHERE db_book.Author = 'author1';

SELECT db_employee.FirstName, db_employee.LastName, 
       SUM(db_order_detail.Quantity * db_book.UnitPrice) AS TotalSales
FROM db_employee
JOIN db_order ON db_employee.EmployeeID = db_order.EmployeeID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
GROUP BY db_employee.EmployeeID;

SELECT db_book.Title, db_order_detail.Quantity
FROM db_order
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
JOIN db_book ON db_order_detail.BookID = db_book.BookID
WHERE db_order.ShippedDate IS NULL AND db_order.OrderDate = '2016-08-04';

SELECT db_customer.FirstName, db_customer.LastName, 
       SUM(db_order_detail.Quantity) AS TotalQuantity
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
GROUP BY db_customer.CustomerID
HAVING SUM(db_order_detail.Quantity) > 1
ORDER BY TotalQuantity DESC;


SELECT db_customer.FirstName, db_customer.LastName, db_customer.Phone, COUNT(db_order_detail.BookID) AS TotalBooks
FROM db_customer
JOIN db_order ON db_customer.CustomerID = db_order.CustomerID
JOIN db_order_detail ON db_order.OrderID = db_order_detail.OrderID
GROUP BY db_customer.CustomerID
HAVING COUNT(db_order_detail.BookID) > 3;






