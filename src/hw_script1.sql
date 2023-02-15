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