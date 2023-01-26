use Vilius_db;

ALTER TABLE persons
    RENAME COLUMN `code` TO `personal_code`;

ALTER TABLE persons
    ADD email varchar(50);

ALTER TABLE persons
    ADD phone int;

ALTER TABLE persons
    DROP group_id;

ALTER TABLE persons
    ADD address_id int;

CREATE TABLE adresses
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `country_iso` char,
    `city` varchar(40),
    `street` varchar(50),
    `postcode` varchar(20),
    PRIMARY KEY (`id`)
);

CREATE TABLE users
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `person_id` int,
    `password`  varchar(20), #asmens slaptazodis
    `name` varchar(20), #Pseudonimas zmogaus
    `state_id` int,
    PRIMARY KEY (`id`)
);

CREATE TABLE countries
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` varchar(50),
    `iso` varchar(10),
    PRIMARY KEY (`id`)
);

CREATE TABLE states
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` varchar(50),
    `code` varchar(25),
    PRIMARY KEY (`id`)
);

CREATE TABLE person2group
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `person_id` int,
    `group_id` int,
    PRIMARY KEY (`id`)
);