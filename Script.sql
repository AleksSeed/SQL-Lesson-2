--Задание 1
--1)
\c skypro

CREATE TABLE employee (
id BIGSERIAL NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender VARCHAR(6) NOT NULL,
age INT NOT NULL
);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Vasya', 'Pupkin', 'man', 45);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Alenushka', 'Sestricova', 'woman', 18);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Aleksandr', 'Pushkin', 'man', 34);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Misha', 'Agapov', 'man', 22);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Petrushka', 'Kozulin', 'man', 38);

SELECT * FROM employee;

--2)
SELECT first_name AS Имя, last_name AS Фамилия FROM employee;

--3)
SELECT * FROM employee WHERE age < 30 OR age > 50;

--4)
SELECT * FROM employee WHERE age BETWEEN 30 AND 50;

--5)
SELECT * FROM employee ORDER BY last_name DESC;

--6)
SELECT * FROM employee WHERE substring(last_name, 4, 1) > '';


--Задание 2
--1)
UPDATE employee SET first_name = 'Sergey' WHERE id = 1;
UPDATE employee SET first_name = 'Misha' WHERE id = 5;

--2)
SELECT first_name AS "Имя", SUM(age) AS "Суммарный возраст" FROM employee GROUP BY "Имя";

--3)
SELECT first_name AS "Имя", MIN(age) AS "Самый юный возраст" FROM employee GROUP BY "Имя";

--4)
SELECT first_name, MAX(age) AS "Максимальный возраст" FROM employee 
 WHERE first_name IN (SELECT first_name FROM employee GROUP BY first_name HAVING COUNT(*) > 1) 
 GROUP BY first_name ORDER BY "Максимальный возраст" ASC;