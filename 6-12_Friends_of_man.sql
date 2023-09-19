# В подключенном MySQL репозитории создать базу данных “Друзья человека”
DROP DATABASE IF EXISTS friends_of_man;
CREATE DATABASE `friends_of_man`;

# Создать таблицы с иерархией из диаграммы в БД
USE `friends_of_man`;

DROP TABLE IF EXISTS Dogs;
CREATE TABLE Dogs
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

DROP TABLE IF EXISTS Cats;
CREATE TABLE Cats
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

DROP TABLE IF EXISTS Hamsters;
CREATE TABLE Hamsters
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

DROP TABLE IF EXISTS Horses;
CREATE TABLE Horses
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

DROP TABLE IF EXISTS Donkeys;
CREATE TABLE Donkeys
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

DROP TABLE IF EXISTS Camels;
CREATE TABLE Camels
(
	ID INT,
    Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE
);

# Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения
INSERT INTO `friends_of_man`.`Dogs`(ID, Name, Commands, Birthsday) VALUES
(01,'Рекс', 'Лежать', date'2020-02-23'), 
(02, 'Пуля', 'Лапу', date'2022-01-13'), 
(03,'Мерси', 'Сидеть', date'2019-10-02');

INSERT INTO `friends_of_man`.`Cats`(ID, Name, Commands, Birthsday) VALUES
(04,'Муська', 'Кис-Кис', date'2021-05-18'), 
(05, 'Снежок', 'Ко мне', date'2022-04-23'), 
(06,'Марсель', 'Кушать', date'2022-10-02');

INSERT INTO `friends_of_man`.`Hamsters`(ID, Name, Commands, Birthsday) VALUES
(07,'Олег', 'Стоять', date'2022-09-23'), 
(08, 'Зубастик', 'Ко мне', date'2023-06-21'), 
(09,'Облачко', 'Еда', date'2022-11-03');

INSERT INTO `friends_of_man`.`Horses`(ID, Name, Commands, Birthsday) VALUES
(10,'Джули', 'Рысь', date'2020-12-07'), 
(12, 'Апполон', 'Тише', date'2022-01-23'), 
(13,'Гамлет', 'Шагом', date'2019-11-23');

INSERT INTO `friends_of_man`.`Donkeys`(ID, Name, Commands, Birthsday) VALUES
(14,'Бонд', 'Ко мне', date'2021-05-18'), 
(15, 'Саурон', 'Голос', date'2020-06-11'), 
(16,'Лунтик', 'Вперед', date'2022-10-03');

INSERT INTO `friends_of_man`.`Camels`(ID, Name, Commands, Birthsday) VALUES
(17,'Лила', 'Бегом', date'2021-05-18'), 
(18, 'Миша', 'Подойди', date'2021-06-23'); 

# Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
DROP TABLE IF EXISTS Camels;

SELECT * FROM Horses 
UNION SELECT * FROM Donkeys
AS `Pack animals`;

# Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
# но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице

DROP TABLE IF EXISTS Young_animals;
CREATE TABLE `Young_animals`
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Dogs
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
UNION
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Cats
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
UNION
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Hamsters
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
UNION
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Horses
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
UNION
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Hamsters
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
UNION
SELECT ID, Name, Commands, Birthsday, 
(YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) AS Age
FROM Donkeys
WHERE (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) < 3 
AND (YEAR(CURRENT_DATE)-YEAR(Birthsday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(Birthsday,5)) > 1
ORDER BY id;

ALTER TABLE `Young_animals` ADD COLUMN  FullAge VARCHAR (30);
UPDATE `Young_animals` SET FullAge = (CONCAT(TIMESTAMPDIFF(YEAR, Birthsday, CURRENT_DATE),' года ', 
			TIMESTAMPDIFF(MONTH, Birthsday, CURRENT_DATE) % 12, ' месяцев '));
            
# Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

CREATE TABLE `All_Animals` (
	ID INT,
	Name VARCHAR(45),
    Commands VARCHAR(45),
    Birthsday DATE,
		Animal_species ENUM('Dogs','Cats','Hamsters', 'Horses', 'Donkeys') 
);

INSERT INTO `All_Animals` (ID, Name, Commands, Birthsday, Animal_species)
SELECT ID, Name, Commands, Birthsday, 'Cats'
FROM Cats;

INSERT INTO `All_Animals` (ID, Name, Commands, Birthsday, Animal_species)
SELECT ID, Name, Commands, Birthsday, 'Dogs'
FROM Dogs;

INSERT INTO `All_Animals` (ID, Name, Commands, Birthsday, Animal_species)
SELECT ID, Name, Commands, Birthsday, 'Hamsters'
FROM Hamsters;

INSERT INTO `All_Animals` (ID, Name, Commands, Birthsday, Animal_species)
SELECT ID, Name, Commands, Birthsday, 'Horses'
FROM Horses;

INSERT INTO `All_Animals` (ID, Name, Commands, Birthsday, Animal_species)
SELECT ID, Name, Commands, Birthsday, 'Donkeys'
FROM Donkeys;







