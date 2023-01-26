# Susikuriu naują duombazę ir susikuriu naują userį

CREATE DATABASE ASSIGNMENT;     #Duombazės sukūrimas
Create USER ViliusS, `@`,`%` IDENTIFIED BY 'pass';  #Userio sukūrimas
GRANT ALL PRIVILEGES ON ASSIGNMENT.* TO 'ViliusS'@'%';  #Privilegijų priskyrimas
flush privileges;   # Privilegijų updeitinimas

#Nurodau kokioje duombazėje dirbsiu ir kursiu lenteles bei kitus dalykus

use ASSIGNMENT;


#-------------------------------Pirma užduotis: Parašykite užklausą, kuri ištrauktų visus įrašus iš lentelės "Employees" ir atvaizduotų jų vardus ir pavardes.


#Sukuriu lentelę Employees ir nurodau vardui bei pavardei varchar duomenų tipą su Lenght 20

CREATE TABLE Employees
(
    `vardas`  varchar(20),
    `pavarde` varchar(20)
);

#Ištrinu lentelę nes neįdėjau ID

DROP TABLE Employees;

#Sukuriu lentelę tokia pat tik su nurodytu ID

CREATE TABLE Employees(
                          `id`      INT NOT NULL AUTO_INCREMENT, #Nurodau kad PHPStorm automatiškai priskirtų id
        `vardas`  varchar(20),
                          `pavarde` varchar(20),
                          PRIMARY KEY (`id`));    #Nustatau pagrindinį raktą id

#Įvedu į table duomenis vardas pavarde

INSERT INTO Employees(`vardas`, pavarde) #Duomenys sugeneruoti naudojant https://www.mockaroo.com
VALUES ('Rubetta', 'Teare'),
       ('Pennie', 'Bogaert'),
       ('Ronni', 'Ingilson'),
       ('Devin', 'Drohun'),
       ('Cathe', 'Corrin'),
       ('Britni', 'Geeves'),
       ('Alfonse', 'Boyde'),
       ('Kylen', 'Ahmed'),
       ('Dani', 'Escritt'),
       ('Raphael', 'Oloshin'),
       ('Inger', 'Pearcey'),
       ('Annetta', 'Sammes'),
       ('Benito', 'Godsafe'),
       ('Burtie', 'Surcomb'),
       ('Linnea', 'Carnall'),
       ('Merola', 'Bartkowiak'),
       ('Gavrielle', 'Kitcher'),
       ('Sonnie', 'Vallery'),
       ('Mildred', 'Bezant'),
       ('Morry', 'Kestell'),
       ('Rudolph', 'Bratch'),
       ('Carolina', 'Bern'),
       ('Morgen', 'Chedgey'),
       ('Gayel', 'Leicester'),
       ('Reinald', 'Bartens'),
       ('Addie', 'Koubek'),
       ('Bertha', 'Schukraft'),
       ('Dael', 'Liddon'),
       ('Hatty', 'Cowhig'),
       ('Abbe', 'Crannach'),
       ('Maggi', 'Estcot'),
       ('Rafaela', 'Finci'),
       ('Andris', 'Brandon'),
       ('Sebastian', 'Diggell'),
       ('Barny', 'Siggery'),
       ('Tillie', 'Tracey'),
       ('Viola', 'Derricoat'),
       ('Augustus', 'Messenbird'),
       ('Martin', 'Lowther'),
       ('Ricca', 'MacCaughey'),
       ('Leola', 'Mangam'),
       ('Ally', 'Wyllis'),
       ('Nyssa', ' Beche'),
       ('Dawna', 'Wyrall'),
       ('Jasun', 'Skillington'),
       ('Clyde', 'Goodman'),
       ('Maddie', 'McLaren'),
       ('Cort', 'Kyme');

#Atvaizduoju visus duomenis iš employees lentelės

SELECT * from Employees;

#----------Antra užduotis--Parašykite užklausą, kuri atnaujintų darbuotojo algas lentelėje "Employees", kurio ID yra "123", į 10% didesnę nei dabartinė alga.

#Pridedu naują stulpelį 'alga' Emplyees table viduje

ALTER TABLE Employees
    ADD `Alga` int;
#Duomenis į lentelės vidų ranka suvedžiau


#Pas mane nėra 123id, tad renkuosi id=35
SELECT Alga FROM Employees WHERE id LIKE 35;
UPDATE Employees    #Pasirenku kokią lentelę updeitinsiu
SET Alga=Alga*1.1    #Naudoju 1.1 nes tai yra 10% vertė
WHERE id=35;        #Nurodau kokį id pasirinksiu


#-------------Trečia užduotis---Parašykite užklausą, kuri ištrintų visus įrašus iš lentelės "Orders", kurie yra senesni nei 1 metai.


#Sukuriu lentelę Orders kurioje nurodau id, produktą ir pirkimo datą

CREATE TABLE Orders
(
    `id` int NOT NULL AUTO_INCREMENT, #Visad sukurs id
    `Produktas` varchar(40),          #Produktas kurio pavadinimas limituotas 40 simbolių
        `Pirkimo_Data` date,              # Pirkimo data kuri yra Date formatu
        PRIMARY KEY (`id`));              #Nurodomas id kaip primary key

#Sukuriu 100 naujų produktų su pavadinimu bei pirkimo data TABLE Orders [Duomenys sugeneruoti iš https://www.mockaroo.com

INSERT INTO Orders (`Produktas`,`Pirkimo_Data`)
VALUES
    ('Anchovy In Oil', '2020-01-27'),
    ('Skewers - Bamboo', '2019-01-29'),
    ('Puree - Raspberry', '2019-11-16'),
    ('Cake Slab', '2021-03-03'),
    ('Beef - Sushi Flat Iron Steak', '2022-10-12'),
    ('Oranges - Navel, 72', '2019-06-23'),
    ('Beer - Corona', '2021-06-11'),
    ('Island Oasis - Peach Daiquiri', '2020-02-20'),
    ('Sauce - Cranberry', '2021-05-01'),
    ('Sauce - Gravy, Au Jus, Mix', '2019-09-14'),
    ('Wine - Malbec Trapiche Reserve', '2022-03-19'),
    ('Dehydrated Kelp Kombo', '2020-05-02'),
    ('Sprouts - Pea', '2020-12-14'),
    ('Lettuce - Green Leaf', '2021-07-27'),
    ('Beef - Outside, Round', '2022-10-04'),
    ('Fish - Scallops, Cold Smoked', '2022-01-14'),
    ('Shrimp - Baby, Warm Water', '2019-05-21'),
    ('Pasta - Cheese / Spinach Bauletti', '2019-01-06'),
    ('Cream - 10%', '2021-03-04'),
    ('Onions - White', '2020-02-25'),
    ('Kiwi Gold Zespri', '2022-09-12'),
    ('Bar - Sweet And Salty Chocolate', '2021-05-02'),
    ('Sprouts - Baby Pea Tendrils', '2021-12-25'),
    ('Cod - Black Whole Fillet', '2021-04-26'),
    ('Pastry - Key Limepoppy Seed Tea', '2019-08-11'),
    ('Red Cod Fillets - 225g', '2019-03-18'),
    ('Sage - Fresh', '2022-02-25'),
    ('Coffee - Beans, Whole', '2019-01-10'),
    ('Buttons', '2021-12-16'),
    ('Wine - Two Oceans Cabernet', '2022-01-18'),
    ('Tuna - Yellowfin', '2021-09-12'),
    ('Seabream Whole Farmed', '2020-02-26'),
    ('Peach - Fresh', '2019-04-24'),
    ('Beer - Creemore', '2022-09-04'),
    ('Cheese - La Sauvagine', '2019-03-20'),
    ('Cranberry Foccacia', '2021-05-25'),
    ('Wine - Prosecco Valdobienne', '2019-12-02'),
    ('Danishes - Mini Cheese', '2021-07-29'),
    ('Oil - Shortening,liqud, Fry', '2021-12-01'),
    ('Pastry - Lemon Danish - Mini', '2020-07-29'),
    ('Tortillas - Flour, 12', '2022-08-10'),
    ('Lettuce - Romaine, Heart', '2019-02-28'),
    ('Bag - Regular Kraft 20 Lb', '2020-07-10'),
    ('Turkey - Breast, Double', '2019-06-19'),
    ('Muffins - Assorted', '2020-02-26'),
    ('Pie Filling - Pumpkin', '2021-09-26'),
    ('Sugar - Crumb', '2020-03-26'),
    ('Carbonated Water - Raspberry', '2021-10-07'),
    ('Guinea Fowl', '2019-10-31'),
    ('Onion Powder', '2019-11-03'),
    ('Cheese - Havarti, Salsa', '2019-12-17'),
    ('Dc Hikiage Hira Huba', '2022-03-02'),
    ('Sauce - Thousand Island', '2021-04-03'),
    ('Turkey - Breast, Smoked', '2020-10-15'),
    ('Table Cloth 54x54 Colour', '2020-06-06'),
    ('Veal - Leg, Provimi - 50 Lb Max', '2020-05-06'),
    ('Sun - Dried Tomatoes', '2020-01-07'),
    ('Cookies - Englishbay Oatmeal', '2022-10-21'),
    ('Jolt Cola - Red Eye', '2020-08-01'),
    ('Cheese - Brie,danish', '2021-04-08'),
    ('Pork - Smoked Kassler', '2020-08-23'),
    ('Foam Cup 6 Oz', '2021-08-26'),
    ('Wine - Fat Bastard Merlot', '2022-08-31'),
    ('Beef - Texas Style Burger', '2022-08-13'),
    ('Truffle Cups - Red', '2021-08-12'),
    ('Glass - Wine, Plastic, Clear 5 Oz', '2021-02-20'),
    ('Juice - Apple 284ml', '2022-06-22'),
    ('Bar Nature Valley', '2021-03-22'),
    ('Juice - Apple 284ml', '2019-11-19'),
    ('Muffin Mix - Carrot', '2022-05-27'),
    ('Ginger - Pickled', '2020-04-25'),
    ('Dates', '2020-02-07'),
    ('Goldschalger', '2021-05-04'),
    ('Bamboo Shoots - Sliced', '2019-03-26'),
    ('Muffin Mix - Morning Glory', '2020-03-26'),
    ('Bagels Poppyseed', '2020-04-28'),
    ('Pasta - Fett Alfredo, Single Serve', '2022-12-26'),
    ('Quiche Assorted', '2020-02-23'),
    ('Oranges', '2022-08-05'),
    ('Wine - Jafflin Bourgongone', '2022-02-15'),
    ('Onion - Dried', '2019-05-30'),
    ('Soup - Base Broth Chix', '2020-07-10'),
    ('Tomatoes - Diced, Canned', '2021-12-04'),
    ('Bread - Olive', '2019-12-08'),
    ('Sobe - Orange Carrot', '2019-11-26'),
    ('Red Pepper Paste', '2019-09-12'),
    ('Onions - Pearl', '2022-09-04'),
    ('Soup - Campbells, Creamy', '2020-12-04'),
    ('Cauliflower', '2020-02-19'),
    ('Gelatine Powder', '2021-05-01'),
    ('Mushroom - Porcini, Dry', '2019-03-02'),
    ('Pie Box - Cello Window 2.5', '2019-11-24'),
    ('Bread - Focaccia Quarter', '2019-12-10'),
    ('Dried Peach', '2019-06-24'),
    ('Tray - 12in Rnd Blk', '2020-04-15'),
    ('Alize Sunset', '2019-10-22'),
    ('Beef - Ox Tongue', '2020-06-11'),
    ('Cup - 8oz Coffee Perforated', '2021-03-03'),
    ('Wine - Manischewitz Concord', '2019-10-29'),
    ('Mushroom - King Eryingii', '2019-08-13');


#išsifiltruoju pagal datą, pasitikrint kiek duomenų tokių yra (81)

SELECT Pirkimo_Data FROM Orders WHERE Pirkimo_Data<'2023-01-12';

#Ištrinu duomenis iš Orders lentelės kurioje Pirkimo data yra senesnė nei vieneri metai
DELETE FROM Orders WHERE Pirkimo_Data<'2022-01-12';

# Pasitikrinu ar teisingai liko 19 eilučių.
SELECT Pirkimo_Data FROM Orders;

#---------------4Užduotis---Parašykite užklausą, kuri į lentelę "Customers" įterptų naują įrašą su vardu "John", pavarde "Doe" ir el. pašto adresu "john.doe@email.com".

# Pirma sukuriu Employees lentelėje el pašto stulpelį su varchar duomenų tipu kurio ilgis 45 simboliai, nes tokio neturėjau

ALTER TABLE Employees
    ADD `e-mail` varchar(45);

#Įterpiu naują asmenį vardas= John, Pavarde = Doe, alga=0, e-mail=john,doe@email.com

INSERT INTO Employees (`vardas`,`pavarde`,`Alga`,`e-mail`)
VALUES ('John','Doe',0,'john.doe@email.com');

#Patikrinu ar tikrai susikūrė toks vartotojas su tokiu elektorinio pašto adresu

SELECT `e-mail` FROM Employees Where `e-mail`='john.doe@email.com';