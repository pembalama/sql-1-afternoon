-- Table-person:
-- 1. Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
CREATE TABLE person(
    id SERIAL PRIMARY KEY,
    name VARCHAR(250),
    age INTEGER,
    height INTEGER,
    city VARCHAR(200),
    favorite_color VARCHAR(200));


-- 2. Add 5 different people into the person database.
INSERT INTO person
(name, age, height, city, favorite_color)
VALUES
('Tom Hanks', 53, 165, 'Dallas', 'Blue'),
('Bob Marley', 65, 170, 'Los Angeles', 'Green'),
('Roberto Gonzales', 34, 155, 'Irving', 'Black'),
('Maya Angelou', 55, 135, 'Grand Prairie', 'Yellow'),
('Andrew Yang', 45, 185, 'Schenectady', 'Blue');

-- 3. List all the people in the person table by height from tallest to shortest.
SELECT * FROM person ORDER BY height DESC;

-- 4. List all the people in the person table by height from shortest to tallest.
SELECT * FROM person ORDER BY height ASC;

-- 5. List all the people in the person table by age from oldest to youngest.
SELECT * FROM person ORDER BY age DESC;

-- 6. List all the people in the person table older than age 20.
SELECT * FROM person WHERE age > 20;

-- 7. List all the people in the person table that are exactly 18.
SELECT * FROM person WHERE age = 18;

-- 8. List all the people in the person table that are less than 20 and older than 30.
SELECT * FROM person WHERE age < 20 OR age > 30;

-- 9. List all the people in the person table that are not 27 (Use not equals).
SELECT * FROM person WHERE age != 27;

-- 10. List all the people in the person table where their favorite color is not red.
SELECT * FROM person WHERE favorite_color != 'Red';

-- 11. List all the people in the person table where their favorite color is not red and is not blue.
SELECT * FROM person WHERE favorite_color != 'Red' AND favorite_color != 'Blue';

-- 12. List all the people in the person table where their favorite color is orange or green.
SELECT * FROM person WHERE favorite_color = 'Orange' OR favorite_color = 'Green';

-- 13. List all the people in the person table where their favorite color is orange, green or blue (use IN).
SELECT * FROM person WHERE favorite_color IN ('Orange', 'Green', 'Blue');

-- 14. List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT * FROM person WHERE favorite_color IN ('Yellow', 'Purple');

--Table-Orders:

-- 1. Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    product_name VARCHAR(150),
    product_price NUMERIC,
    quantity INTEGER
);

-- 2.Add 5 orders to the orders table.
INSERT INTO orders (person_id, product_name, product_price, quantity)
VALUES
(0, 'Laptop', 900, 2),
(1, 'Monitor', 300, 4),
(2, 'Mouse', 70, 6),
(3, 'Pen', 20, 50),
(4, 'Notebook', 15, 105);

-- 3. Select all the records from the orders table.
SELECT * FROM orders;


-- 4. Calculate the total number of products ordered.
SELECT SUM(quantity) FROM orders;

-- 5. Calculate the total order price.
SELECT SUM(product_price * quantity) FROM orders;

-- 6. Calculate the total order price by a single person_id.
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 0;



--Table - artist:

-- 1. Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist (name)
VALUES
('John Mayer'),
('Bruno Mars'),
('Kanye West');


-- 2. Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;

-- 3. Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name ASC LIMIT 5;

-- 4. Select all artists that start with the word 'Black'.
SELECT * FROM artist WHERE name LIKE 'Black%';

-- 5. Select all artists that contain the word 'Black'.
SELECT * FROM artist WHERE name LIKE '%Black%';

--Table - employee:
-- 1. List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee WHERE city = 'Calgary';

-- 2. Find the birthdate for the youngest employee.
SELECT MAX(birth_date) from employee;

-- 3. Find the birthdate for the oldest employee.
SELECT MIN(birth_date) from employee;

-- 4. Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
SELECT * FROM employee WHERE reports_to = 2;

-- 5. Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';


--Table - invoice:

-- 1. Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA';

-- 2. Find the largest order total amount.
SELECT MAX(total) FROM invoice;

-- 3. Find the smallest order total amount.
SELECT MIN(total) FROM invoice;

-- 4. Find all orders bigger than $5.
SELECT * FROM invoice WHERE total > 5;

-- 5. Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice WHERE total < 5;

-- 6. Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ');

-- 7. Get the average total of the orders.
SELECT AVG(total) FROM invoice;

-- 8. Get the total sum of the orders.
SELECT SUM(total) FROM invoice;