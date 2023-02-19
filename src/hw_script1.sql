\c skypro
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Ivan', 'Petrov', 'male', 35);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Sergey', 'Vasilyev', 'male', 29);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Anton', 'Alexeev', 'male', 30);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Maria      | Ivanova   | female |  27
  3 | Natalia    | Semenova  | female |  25
  4 | Ivan       | Petrov    | male   |  35
  5 | Sergey     | Vasilyev  | male   |  29
  6 | Anton      | Alexeev   | male   |  30
    skypro=# SELECT first_name AS Имя FROM employee GROUP BY Имя;
   Имя
---------
 Anton
 Ivan
 Maria
 Natalia
 Sergey
(5 строк)
    skypro=# SELECT last_name AS Фамилия FROM employee GROUP BY Фамилия;
 Фамилия
----------
 Vasilyev
 Petrov
 Semenova
 Ivanova
 Alexeev
(5 строк)


skypro=# SELECT * FROM employee WHERE age < 30 OR age > 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Maria      | Ivanova   | female |  27
  3 | Natalia    | Semenova  | female |  25
  5 | Sergey     | Vasilyev  | male   |  29
(3 строки)


skypro=# SELECT * FROM employee WHERE age BETWEEN 30 AND 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Ivan       | Petrov    | male   |  35
  6 | Anton      | Alexeev   | male   |  30
(2 строки)

    skypro=# SELECT * FROM employee ORDER BY last_name DESC;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Sergey     | Vasilyev  | male   |  29
  3 | Natalia    | Semenova  | female |  25
  4 | Ivan       | Petrov    | male   |  35
  1 | Maria      | Ivanova   | female |  27
  6 | Anton      | Alexeev   | male   |  30
(5 строк)


skypro=# SELECT * FROM employee WHERE first_name LIKE '____%';
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Maria      | Ivanova   | female |  27
  3 | Natalia    | Semenova  | female |  25
  4 | Ivan       | Petrov    | male   |  35
  5 | Sergey     | Vasilyev  | male   |  29
  6 | Anton      | Alexeev   | male   |  30
(5 строк)


skypro=# UPDATE employee SET first_name = 'Maria' WHERE id = 3;
UPDATE 1
skypro=# UPDATE employee SET first_name = 'Ivan' WHERE id = 6;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Maria      | Ivanova   | female |  27
  4 | Ivan       | Petrov    | male   |  35
  5 | Sergey     | Vasilyev  | male   |  29
  3 | Maria      | Semenova  | female |  25
  6 | Ivan       | Alexeev   | male   |  30
(5 строк)


skypro=# SELECT first_name AS Имя,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee GROUP BY Имя;
  Имя   | Суммарный_возраст
--------+-------------------
 Ivan   |                65
 Maria  |                52
 Sergey |                29
(3 строки)


skypro=# SELECT first_name AS Имя,
skypro-# MIN(age) AS Самый_юный_возраст
skypro-# FROM employee GROUP BY Имя;
  Имя   | Самый_юный_возраст
--------+--------------------
 Ivan   |                 30
 Maria  |                 25
 Sergey |                 29
(3 строки)

    skypro=# SELECT first_name AS Имя,
skypro-# MAX(age) AS Максимальный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя
skypro-# HAVING count(first_name) > 1
skypro-# ORDER BY Максимальный_возраст;
  Имя  | Максимальный_возраст
-------+----------------------
 Maria |                   27
 Ivan  |                   35
(2 строки)

    //Задание 1

    postgres=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# CREATE TABLE city (
skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
skypro(# city_name VARCHAR(50)
skypro(# );
CREATE TABLE
skypro=# ALTER TABLE employee ADD COLUMN city_id INT;
ALTER TABLE
skypro=# INSERT INTO city (city_name) VALUES ('Москва');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Орел');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Санкт-Петербург');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Казань');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Самара');
INSERT 0 1
skypro=# SELECT * FROM city;
 city_id |    city_name
---------+-----------------
       1 | Москва
       2 | Орел
       3 | Санкт-Петербург
       4 | Казань
       5 | Самара
(5 ёЄЁюъ)


skypro=# INSERT INTO city (city_name) VALUES ('Владивосток');
INSERT 0 1
skypro=# ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);
ALTER TABLE
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Maria      | Ivanova   | female |  27 |
  4 | Ivan       | Petrov    | male   |  35 |
  5 | Sergey     | Vasilyev  | male   |  29 |
  3 | Maria      | Semenova  | female |  25 |
  6 | Ivan       | Alexeev   | male   |  30 |
(5 ёЄЁюъ)


skypro=# UPDATE employee SET city_id = 1 WHERE id = 1;
UPDATE 1
skypro=# UPDATE employee SET city_id = 1 WHERE id = 4;
UPDATE 1
skypro=# UPDATE employee SET city_id = 2 WHERE id = 5;
UPDATE 1
skypro=# UPDATE employee SET city_id = 3 WHERE id = 3;
UPDATE 1
skypro=# UPDATE employee SET city_id = 4 WHERE id = 6;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Maria      | Ivanova   | female |  27 |       1
  4 | Ivan       | Petrov    | male   |  35 |       1
  5 | Sergey     | Vasilyev  | male   |  29 |       2
  3 | Maria      | Semenova  | female |  25 |       3
  6 | Ivan       | Alexeev   | male   |  30 |       4

        //Задание 2

        // пункт 1

skypro=# SELECT employee.first_name, employee.last_name, city.city_name
skypro-# FROM employee
skypro-# JOIN city
skypro-# ON employee.city_id = city.city_id;
 first_name | last_name |    city_name
------------+-----------+-----------------
 Ivan       | Petrov    | Москва
 Maria      | Ivanova   | Москва
 Sergey     | Vasilyev  | Орел
 Maria      | Semenova  | Санкт-Петербург
 Ivan       | Alexeev   | Казань
(5 ёЄЁюъ)

        // пункт 2

skypro=# SELECT city.city_name, employee.first_name, employee.last_name
skypro-# FROM employee RIGHT JOIN city
skypro-# ON employee.city_id = city.city_id;
    city_name    | first_name | last_name
-----------------+------------+-----------
 Москва          | Ivan       | Petrov
 Москва          | Maria      | Ivanova
 Орел            | Sergey     | Vasilyev
 Санкт-Петербург | Maria      | Semenova
 Казань          | Ivan       | Alexeev
 Самара          |            |
 Владивосток     |            |
(7 ёЄЁюъ)

 // добавила сотрудника без указания id города для наглядности и вывела таблицу сотрудников для самопроверки

skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Anna', 'Petrova', 'female', 18);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Maria      | Ivanova   | female |  27 |       1
  4 | Ivan       | Petrov    | male   |  35 |       1
  5 | Sergey     | Vasilyev  | male   |  29 |       2
  3 | Maria      | Semenova  | female |  25 |       3
  6 | Ivan       | Alexeev   | male   |  30 |       4
  7 | Anna       | Petrova   | female |  18 |
(6 ёЄЁюъ)

        // а это уже пункт 3 задания 2

skypro=# SELECT employee.first_name, city.city_name
skypro-# FROM employee FULL OUTER JOIN city
skypro-# ON employee.city_id = city.city_id;
 first_name |    city_name
------------+-----------------
 Ivan       | Москва
 Maria      | Москва
 Sergey     | Орел
 Maria      | Санкт-Петербург
 Ivan       | Казань
            | Самара
            | Владивосток
 Anna       |
(8 ёЄЁюъ)

        //пункт 4

        skypro=# SELECT employee.first_name, city.city_name
skypro-# FROM employee CROSS JOIN city;
 first_name |    city_name
------------+-----------------
 Maria      | Москва
 Ivan       | Москва
 Sergey     | Москва
 Maria      | Москва
 Ivan       | Москва
 Anna       | Москва
 Maria      | Орел
 Ivan       | Орел
 Sergey     | Орел
 Maria      | Орел
 Ivan       | Орел
 Anna       | Орел
 Maria      | Санкт-Петербург
 Ivan       | Санкт-Петербург
 Sergey     | Санкт-Петербург
 Maria      | Санкт-Петербург
 Ivan       | Санкт-Петербург
 Anna       | Санкт-Петербург
 Maria      | Казань
 Ivan       | Казань
 Sergey     | Казань
 Maria      | Казань
 Ivan       | Казань
 Anna       | Казань
 Maria      | Самара
 Ivan       | Самара
 Sergey     | Самара
 Maria      | Самара
 Ivan       | Самара
 Anna       | Самара
 Maria      | Владивосток
 Ivan       | Владивосток
 Sergey     | Владивосток
 Maria      | Владивосток
 Ivan       | Владивосток
 Anna       | Владивосток
(36 ёЄЁюъ)