#užduotys iš https://docs.google.com/document/d/1eamKFdfN_yJR8sNL5QRRRqAM2bgF-zU3uyb3wmZVfYo/edit#

use Vilius_db;

                        #Pirma užduotis

SELECT first_name FROM persons;

SELECT address_id FROM persons;

SELECT email FROM persons;


#Antra užduotis

SELECT *
FROM `groups`
WHERE title in ('IT1','LT1');

SELECT *
FROM `groups`
WHERE code IN (18,23);

#Trečia užduotis

SELECT MAX(`code`)
FROM `groups`;

SELECT MIN(`code`)
FROM `groups`;

#Ketvirta užduotis

SELECT first_name FROM persons WHERE first_name LIKE '%on%' LIMIT 5;

#Penkta užduotis

INSERT INTO persons(first_name, last_name, personal_code, email, phone, address_id)
VALUES ('Lizardo','Underwater',39210182458,'Lizardoooo@yahoo.com',863259874,16),
       ('Garry','Johonson',38308253674,'JohansonCoop@draugas.lt',863214521,16),
       ('Jerry','NotMouse',38906301596,'NotMouse@microsoft.com',863596872,16),
       ('Marry','Livingston',49112124528,'MarryLiv@hotmail.com',865219856,16),
       ('Linkde','Linkdooo',38607214523,'LinkdLin@gmail.com',863295471,16);

SELECT address_id FROM persons WHERE address_id LIKE 16;

#Šešta užduotis

SELECT COUNT(DISTINCT code) AS Skirtingu_grupiu_skaicius FROM `groups`;

#Septinta užduotis

SELECT COUNT(address_id) AS Gyvena,address_id
FROM persons
GROUP BY address_id
HAVING COUNT(address_id) >2
ORDER BY COUNT(address_id) ASC;


#UPDATE UŽDUOTYS
                    #---------------------------------------------------------------------------------
                    #Pirma užduotis
INSERT INTO persons(first_name, last_name, personal_code, email, phone, address_id)
VALUES ('Argjon', 'Notjon',39511305627,'JonAndJon@yahoo.com',865214896,15),
       ('Oblijon', 'Oblivion',39604251468,'ObliObli@gmail.com',869523478,18);


SELECT `first_name` FROM persons WHERE first_name LIKE '%jon%';
UPDATE `persons` SET `first_name`='Jonas' WHERE first_name Like '%jon%';

#Atsakymas: šiuo metu yra trys

                    #Antra užduotis

SELECT type FROM states WHERE id=3;

UPDATE `persons` SET address_id=-1 WHERE address_id>=15 AND address_id <=30;
Select address_id From persons WHERE address_id=-1;

# Atsakymas 23 eilutės

                    #Trečia užduotis

ALTER TABLE `groups`
    RENAME COLUMN code TO state_id;

ALTER TABLE `groups`
    ADD `address_id` int;

SELECT state_id FROM `groups`;
UPDATE `groups` SET `groups`.state_id=-1 WHERE state_id=0;
SELECT COUNT(state_id),state_id From `groups` WHERE state_id=-1;
#Atsakymas 6

                    #Ketvirta užduotis
                # Vietoj 'H' Raidės naudoju 'L' raidę

SELECT `first_name` FROM persons WHERE first_name LIKE 'L%' ORDER BY  first_name ASC LIMIT 10;
UPDATE persons SET first_name='LRaide' WHERE first_name Like 'L%' ORDER BY first_name ASC Limit 10;
# Atsakymas 10 įrašų pakeista į LRaide

                    #Penkta užduotis

ALTER TABLE states
    MODIFY title varchar(50);


#BONUS užduotis
SELECT state_id FROM `groups` WHERE state_id=1;
SELECT type FROM states WHERE type=1;


UPDATE users SET state_id =(SELECT type FROM states WHERE users.state_id=states.type);


#DELETE užduotis

SELECT id FROM persons WHERE id=1;

DELETE FROM persons WHERE id IN (1,10,20,30);


#----------------------------------------------Constraints užduotys--------------------------------------


use akademija;

ALTER TABLE users ADD FOREIGN KEY (person_id) REFERENCES persons(id);

SELECT DISTINCT person_id FROM users;

SELECT * FROM persons WHERE id NOT IN (SELECT DISTINCT person_id FROM users); #pasitikrinti kurie žmonės neturi priskirto id arba buvo pašalinti

SELECT * FROM users WHERE person_id NOT IN (SELECT id From persons);

SELECT * FROM persons WHERE id = 5;

DELETE FROM akademija.users WHERE id IN (661);   #pašalina userį

SELECT id FROM users WHERE person_id NOT IN (SELECT id From persons);


#-----------------------------Antra užduotis---------------------------------------------

alter TABLE `groups`
    ADD FOREIGN KEY (address_id) REFERENCES addresses(id);


alter TABLE `groups`
    ADD FOREIGN KEY (state) REFERENCES states(id);

ALTER TABLE persons
    ADD FOREIGN KEY (address_id) REFERENCES addresses(id);

ALTER TABLE addresses
    ADD FOREIGN KEY (country_iso) REFERENCES countries(iso) ;

ALTER TABLE users
    ADD FOREIGN KEY (person_id) REFERENCES persons(id);

ALTER TABLE person2gruop
    ADD FOREIGN KEY (person_id) REFERENCES persons(id);

ALTER TABLE person2gruop
    ADD FOREIGN KEY (groups_id) REFERENCES `groups`(id);


#--------------------------------------Trečia užduotis----------------------------------------

CREATE TABLE Students(
                         id int NOT NULL AUTO_INCREMENT,
                         `Name` varchar(30),
                         `Age` int,
                         `ClassID` int,
                         PRIMARY KEY (id)
);

CREATE TABLE Classes(
                        id int not null auto_increment,
                        `Name` varchar(50),
                        PRIMARY KEY (id)

);



ALTER TABLE Students
    ADD FOREIGN KEY (ClassID) REFERENCES Classes(id);


#----------------------------------Ketvirta užduotis------------------------------------

CREATE TABLE Orders(
                       `id` int not null auto_increment,
                       `Product` varchar(50),
                       `Quantity` int,
                       `Price` int,
                       check ( Quantity >0 ), #Tiesiog checkina ar daugiau už 0
                           check ( Price>10 ),    #Tiesiog checkina ar daugiau už 10
                           PRIMARY KEY (id)
);


#----------------------------------Penkta užduotis-------------------------------------

CREATE TABLE Employees(
                          `id` int not null auto_increment,
                          `Name` varchar(30),
                          `Email` varchar(45),
                          `Salary` int,
                          unique (Email),  #Uždedamas unique constraint ant EMAIL
                              PRIMARY KEY (id)
);

#--------------------------------Šešta užduotis-----------------------------------------

CREATE TABLE Cities(
                       `id` int not null auto_increment,
                       `Name` varchar(60) not null ,
                       `Country` varchar(50) not null ,
                       PRIMARY KEY (id)

);


#--------------------------------Spetinta užduotis-------------------------------------------


CREATE TABLE Products(
                         `Product ID` int,
                         `Name` varchar(60),
                         `Description` varchar(255) DEFAULT 'N/A',
                         `Price` int

);

#--------------------------------Aštunta užduotis---------------------------------------------

CREATE TABLE Transactions(
                             `id` int not null auto_increment,
                             `AccountNumber` int,
                             `TransactionType` varchar(50),
                             `Amount` int,
                             `TransactionDate` date,
                             PRIMARY KEY (id)
);

# Sukuriamas Triggeris, kad atnaujintų TransactionDate kai updeitinimas Transaction lentelė

CREATE TRIGGER atnaujinti_TransactionDate
    AFTER UPDATE ON Transactions
    FOR EACH ROW
BEGIN
    UPDATE Transactions
    SET TransactionDate=NOW()
    WHERE id=OLD.id;
end;


#---------------------------------------Devinta užduotis---------------------------------------
CREATE TABLE Inventory(
                          `ItemID` int,
                          `ItemName` varchar(60),
                          `Quantity` int,
                          `ReorderLevel` int
);

ALTER TABLE Inventory
    ADD CHECK ( Quantity>ReorderLevel );


#-------------------------------------Dešimta užduotis--------------------------------------------

CREATE TABLE Customers(
                          `CustomerID` int,
                          `Name` varchar(60),
                          `Phone` int (15),
                          `Email` varchar(60)
);
ALTER TABLE Customers
    ADD FULLTEXT INDEX (Name,Email);

show INDEX FROM Customers; #Parodo kokie indexai yra uždėti

ALTER TABLE Customers
DROP INDEX Name_2; #Pašalina tam tikrą indexą, Name_2 tai indexo pavadinimas