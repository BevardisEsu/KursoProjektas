use eshop;

#------Pirma užduotis (pirmoji dalis išsitrynė išjungus console netyčia-----Sukurkite užklausą, kuri susieja lenteles "employees" ir "departments" pagal "department_id" ir atvaizduoja visus "Employees" vardus, pavardes ir susijusias "departments" pavadinimus.

SELECT concat(employees.name,employees.last_name)as Vardai, d.name
FROM employees
         LEFT JOIN departament d on d.id = employees.departament_id;

#------ Antra užduotis-----Sukurkite užklausą, kuri susieja lenteles "customers" ir "orders" pagal "customer_id" ir atvaizduoja visus "Customers" vardus, pavardes ir susijusias "orders" sumas.


ALTER TABLE customers
    modify Phone varchar(20); #Pakeičiu į varcharą, nes neradau kaip per mackaroo generuot be kabučių telefono numerį

ALTER TABLE orders ADD customer_id int;

INSERT INTO orders(id, Product, Quantity, Price, customer_id)
VALUES (); #duomenys patys yra Joins bonus užduoty

ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customerid); #Sujungiu customer id ir orders
alter table customers modify CustomerID int not null auto_increment primary key; #nurodau primary key customerid

#Atspausdina asmens varda ir kaina jo uzsakyto produkto

SELECT customers.Name, o.price
FROM customers
         left join orders o on customers.CustomerID = o.customer_id;

#------------------Trečia užduotis------------Sukurkite užklausą, kuri susieja lenteles "products", inventory" ir "suppliers" pagal "productI_id, "item_id" ir "supplier_id" ir atvaizduoja visus "products" pavadinimus, susijusias "inventory" kiekius ir "suppliers" pavadinimus.

CREATE TABLE suppliers(
                          `id` int not null auto_increment,
                          `name` varchar(50),
                          `product_id` varchar(50),
                          `city` varchar(60),
                          `street` varchar(60),
                          PRIMARY KEY (id)
);

ALTER TABLE inventory ADD `id` int not null auto_increment primary key;

Drop TABLE inventory;
CREATE TABLE inventory(
                          `id` int not null auto_increment primary key ,
                          `ItemID` int,
                          `ItemName` varchar(60),
                          `Quantity` int,
                          `ReorderLevel` int
);
Drop TABLE products;
CREATE TABLE products(`Product_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,`Name` varchar(60), `Description` varchar(255),`Price` int);

INSERT INTO Inventory ( `ItemID`,`ItemName`,`Quantity`)
SELECT
    `orders`.id,
    `orders`.Product,
    `orders`.Quantity

FROM orders;

INSERT INTO suppliers (id, name, city, street)
VALUES (); #duomenys yra Joins bonus užduotyje

Create VIEW Employees_atvaizdavimas AS
SELECT employees.name, employees.email, employees.salary, departament_id
From employees
         JOIN departament d on d.id = employees.departament_id; # Sukuriu naują view, kuris vaizduoja darbuotojų vardą, algą, paštą ir departamentą kuriame dirba

Select * FROM Employees_atvaizdavimas; #iškviečiu View funkciją

ALTER TABLE employees ADD FOREIGN KEY (departament_id) REFERENCES departament(id);

Drop view employees_atvaizdavimas; #Ištrinamas view

ALTER View employees_atvaizdavimas AS
SELECT employees.Name, employees.Email, employees.Salary,d.department_Name, d.city, d.street as Employees_Department
FROM employees
         Join departament d on employees.departament_id =d.id; #Bandau permodifikuoti View funkciją

ALTER TABLE departament RENAME COLUMN `name` TO `department_Name`;


Create VIEW Avarage_Salary AS  #Sukuriu view funkciją vidutinei algai apskaičiuoti
SELECT AVG(Salary) FROM employees;

SELECT * FROM Avarage_Salary; # Iškviečiu apskaičiavimo sąlygą

CREATE VIEW employees_atvaizdavimas_Pagal_ID AS
SELECT employees.id FROM employees WHERE id= 2;

drop view employees_atvaizdavimas_Pagal_ID;



use eshop;

CREATE PROCEDURE DeleteFromCertainDate(IN data DATE)
BEGIN
INSERT INTO customers(CustomerID, LastPurchaseDate)
SELECT CustomerID, NULL
FROM customers
WHERE LastPurchaseDate < data
    ON DUPLICATE KEY UPDATE LastPurchaseDate = NULL;
END;
Call DeleteFromCertainDate('2021-05-15');

Drop procedure DeleteFromCertainDate;

use eshop;

#------Pirma užduotis (pirmoji dalis išsitrynė išjungus console netyčia-----Sukurkite užklausą, kuri susieja lenteles "employees" ir "departments" pagal "department_id" ir atvaizduoja visus "Employees" vardus, pavardes ir susijusias "departments" pavadinimus.

SELECT concat(employees.name,employees.last_name)as Vardai, d.name
FROM employees
         LEFT JOIN departament d on d.id = employees.departament_id;

#------ Antra užduotis-----Sukurkite užklausą, kuri susieja lenteles "customers" ir "orders" pagal "customer_id" ir atvaizduoja visus "Customers" vardus, pavardes ir susijusias "orders" sumas.


ALTER TABLE customers
    modify Phone varchar(20); #Pakeičiu į varcharą, nes neradau kaip per mackaroo generuot be kabučių telefono numerį

ALTER TABLE orders ADD customer_id int;

INSERT INTO orders(id, Product, Quantity, Price, customer_id)
VALUES (); #duomenys patys yra Joins bonus užduoty

ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customerid); #Sujungiu customer id ir orders
alter table customers modify CustomerID int not null auto_increment primary key; #nurodau primary key customerid

#Atspausdina asmens varda ir kaina jo uzsakyto produkto

SELECT customers.Name, o.price
FROM customers
         left join orders o on customers.CustomerID = o.customer_id;

#------------------Trečia užduotis------------Sukurkite užklausą, kuri susieja lenteles "products", inventory" ir "suppliers" pagal "productI_id, "item_id" ir "supplier_id" ir atvaizduoja visus "products" pavadinimus, susijusias "inventory" kiekius ir "suppliers" pavadinimus.

CREATE TABLE suppliers(
                          `id` int not null auto_increment,
                          `name` varchar(50),
                          `product_id` varchar(50),
                          `city` varchar(60),
                          `street` varchar(60),
                          PRIMARY KEY (id)
);

ALTER TABLE inventory ADD `id` int not null auto_increment primary key;

Drop TABLE inventory;
CREATE TABLE inventory(
                          `id` int not null auto_increment primary key ,
                          `ItemID` int,
                          `ItemName` varchar(60),
                          `Quantity` int,
                          `ReorderLevel` int
);
Drop TABLE products;
CREATE TABLE products(`Product_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,`Name` varchar(60), `Description` varchar(255),`Price` int);

INSERT INTO Inventory ( `ItemID`,`ItemName`,`Quantity`)
SELECT
    `orders`.id,
    `orders`.Product,
    `orders`.Quantity

FROM orders;

INSERT INTO suppliers (id, name, city, street)
VALUES (); #duomenys yra Joins bonus užduotyje


#-----Pirma užduotis-----Sukurkite view lentelę, kuri susieja lenteles `employees` ir `departments` pagal `departments`.`id` ir atvaizduoja visus `employees` vardus, pavardes ir susijusias `departments` pavadinimus.


Create VIEW Employees_atvaizdavimas AS
SELECT employees.name, employees.email, employees.salary, departament_id
From employees
         JOIN departament d on d.id = employees.departament_id; # Sukuriu naują view, kuris vaizduoja darbuotojų vardą, algą, paštą ir departamentą kuriame dirba

Select * FROM Employees_atvaizdavimas; #iškviečiu View funkciją

ALTER TABLE employees ADD FOREIGN KEY (departament_id) REFERENCES departament(id);

Drop view employees_atvaizdavimas; #Ištrinamas view

ALTER View employees_atvaizdavimas AS
SELECT employees.Name, employees.Email, employees.Salary,d.department_Name, d.city, d.street as Employees_Department
FROM employees
         Join departament d on employees.departament_id =d.id; #Bandau permodifikuoti View funkciją

ALTER TABLE departament RENAME COLUMN `name` TO `department_Name`;


Create VIEW Avarage_Salary AS  #Sukuriu view funkciją vidutinei algai apskaičiuoti
SELECT AVG(Salary) FROM employees;

SELECT * FROM Avarage_Salary; # Iškviečiu apskaičiavimo sąlygą

CREATE VIEW employees_atvaizdavimas_Pagal_ID AS
SELECT employees.id FROM employees WHemployees_atvaizdavimasERE id= 2;

drop view employees_atvaizdavimas_Pagal_ID;

#------Antra užduotis ----Sukurkite view lentelę, kuri susieja lenteles `customers` ir `orders` pagal `customers`.`id` ir atvaizduoja visus `customers` vardus, pavardes ir susijusias `orders` sumas, tik tada kai suma yra didesnė nei 10
#Pas mane Price diapozonas yra nuo 100 iki 200, tad pasirinkau imti nuo 150
CREATE VIEW suma1000 AS
SELECT c.CustomerID, c.name, o.price
FROM customers c
         JOIN orders o on c.CustomerID = o.customer_id
WHERE Price >150;

Select * FROM suma1000; #iškviečiama funkcija kuri surenka sumą nuo 150 ir į viršų

ALTER VIEW suma1000 AS
SELECT c.CustomerID, c.name, o.price as uzsakymo_kaina
FROM customers c
         JOIN orders o on c.CustomerID = o.customer_id
WHERE Price > 150;

#Taip pat sukuriu funkcija kuri surenka suma nuo 150 ir į apačią

CREATE VIEW suma100_150 AS
SELECT c.CustomerID, c.name, o.price
FROM customers c
         JOIN orders o on c.CustomerID = o.customer_id
WHERE Price >150;

ALTER VIEW suma100_150 AS
SELECT c.CustomerID, c.name, o.price
FROM customers c
         JOIN orders o on c.CustomerID = o.customer_id
WHERE Price <150;

SELECT * FROM suma100_150;

#-----Trečia užduotis-----Sukurkite view lentelę, kuri susieja lenteles `products` ir `inventory` pagal `products`.`id` ir atvaizduoja visus `products` pavadinimus, susijusias `inventory` kiekius ir `reorder_level` reikšmes, tik tada kai `quantity` yra mažesnė nei `reorder_level`.
#Neatlikta
CREATE VIEW Produktai as
SELECT product;









#===============================FUNKCIJOS=====================================
CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE eshop.adresess.country_iso = country_iso;
return atsakymas;
end;


CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE eshop.adresess.country_iso = iso;
return atsakymas;
end;

SELECT  * From pasikartojancios_salys(PL);


DROP function pasikartojancios_salys;

CREATE Function pasikartojancios_salys(iso varchar(20))
    returns varchar(20)
    deterministic
BEGIN
    DECLARE atsakymas int;
SELECT COUNT(*) INTO atsakymas FROM eshop.adresess WHERE
        CONVERT(eshop.adresess.country_iso USING utf8mb4) = CONVERT(iso USING utf8mb4);
return atsakymas;
end;


SELECT pasikartojancios_salys('CN');

SELECT COUNT(*) FROM countries where iso='PL';

SELECT pasikartojancios_salys('PL') AS kiekis, iso from countries HAVING kiekis > 0 ORDER BY kiekis DESC;

ALTER TABLE customers
    add `LastPurchaseDate` date;

#==========================Pirma užduotis [Procedures]==============================================


SELECT LastPurchaseDate FROM customers
Where LastPurchaseDate is not null; #Atsiprintinu visas esamas reiksmes




CREATE PROCEDURE DeleteFromCertainDate(IN data DATE) #Sukuriu funkcija i kuria ivesiu data
BEGIN
INSERT INTO customers(CustomerID, LastPurchaseDate) #Pasirenku, kad i tam tikro customerid ir lastpurcahse date irasytu duomenis
SELECT CustomerID, NULL #Selectinu customerid ir data su NULL
FROM customers #Pasirenku customers
WHERE LastPurchaseDate < data #pasirenku kad lastpurchasedate perrasytu kai yra mazesnis uz ivesta data
ON DUPLICATE KEY UPDATE LastPurchaseDate = NULL;
END;
Call DeleteFromCertainDate('2021-05-15'); #Callinu funkcija su ivestais duomenimis

#=========================================Antra uŽduotis======================================

Drop procedure DeleteFromCertainDate;

Create PROCEDURE Payrise10()
BEGIN
UPDATE employees SET Salary = Salary * 1.1; #Parenku, kad pakeltų per 10%
end;

SELECT Salary FROM employees;

call Payrise10();

#Dar funkciją padariau, kad pats galėtum įrašyti procentų kiekį

Create PROCEDURE PayRise(IN procentai int)
BEGIN
UPDATE employees SET Salary= Salary * procentai;
end;

CALL PayRise(11);


#=======================================Trečia užduotis===========================================

Create procedure ChangeOrderName(IN produktas varchar(255))
BEGIN
SELECT orders.


           end;

