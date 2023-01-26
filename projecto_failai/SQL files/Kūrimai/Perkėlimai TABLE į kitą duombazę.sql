CREATE TABLE eshop.products  #Sukuriu table duombazėje eshop
AS SELECT * FROM akademija.Products; #Sukuriu tokią pat kaip kad akademija.products

DROP TABLE akademija.Products; #Ištrinu iš akademija table products

CREATE TABLE eshop.students
AS SELECT * FROM akademija.Students;
DROP TABLE akademija.Students;

CREATE TABLE eshop.orders
AS SELECT * FROM akademija.Orders;
Drop TABLE akademija.Orders;

CREATE TABLE eshop.employees
AS SELECT * FROM akademija.Employees;
DROP TABLE akademija.Employees;

CREATE TABLE eshop.cities
AS SELECT * FROM akademija.Cities;
DROP TABLE akademija.Cities;

CREATE TABLE eshop.transactions
AS SELECT * FROM akademija.Transactions;

DROP TABLE akademija.Transactions;

CREATE TABLE eshop.inventory
AS SELECT * FROM akademija.Inventory;
Drop TABLE akademija.Inventory;

CREATE TABLE eshop.customers
AS SELECT * FROM akademija.Customers;
DROP TABLE akademija.Customers;