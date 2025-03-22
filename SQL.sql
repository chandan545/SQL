#1. Create a table called employees with the following structure:
    -- emp_id(integer, should not be NULL and should be a primary key.
    -- emp_name(text, should not be NULL).
    -- age(integer, should have a check constraint to ensure the age is at least 18)
    -- email(text, should be unique for each employee).
    -- salary(decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraints.
#ans.
CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL DEFAULT 30000
);


#2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common type of constraints.
#ans.
-- Constraints help maintain data integrity by ensuring that only valid data is entered.

-- Common Constraints:

-- NOT NULL - Ensures a column cannot have NULL values.
CREATE TABLE example_not_null (
	id INT PRIMARY KEY,
    email TEXT NOT NULL
);
-- UNIQUE - Ensures all values in a column are unique.
CREATE TABLE example_unique (
    id INT PRIMARY KEY,
    username TEXT UNIQUE
);
-- PRIMARY KEY - Ensures uniqueness and is a unique identifier.
CREATE TABLE example_primary_key (
	id INT PRIMARY KEY,
    name TEXT NOT NULL
);
-- FOREIGN KEY - Establishes relationships between tables.
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name TEXT NOT NULL
);
-- CHECK - Ensures values meet a specific condition.
CREATE TABLE example_check (
    id INT PRIMARY KEY,
    age INT CHECK (age >= 18)
);
-- DEFAULT - Assigns a default value if none is provided.
CREATE TABLE example_default (
	id INT PRIMARY KEY,
    salary DECIMAL DEFAULT 30000
);


#3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
#ans.
-- NOT NULL ensures a column always has a value.
-- A Primary Key cannot contain NULL values because it uniquely identifies records.


#4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
#ans. 
-- Add a constraint:
ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 20000);

-- Remove a constraint:
ALTER TABLE employees DROP CONSTRAINT check_salary;


#5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
#ans.
-- Trying to insert a record that violates constraints results in errors.
-- Example:
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (1, 'Rahul Singh', 16, 'rahulsingh@gmail.com', 30000);

-- ERROR: CHECK constraint failed: age >= 18.


#6. You created a products table without constraints as follows:
CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(50),
    price DECIMAL (10, 2));
    
-- Now, you realise that:
  -- The product_id should be a primary key.
  -- The price should have a default value of 50.00
#ans. 
ALTER TABLE products ADD CONSTRAINT pk_product PRIMARY KEY (product_id);
ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;


#7. You have two tables, Students and Classes. Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
#ans.
SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;


#8. Consider the following three tables; Orders, Customers and Products. Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order.
# Hint:(use INNER JOIN and LEFT JOIN).
#ans.
SELECT orders.order_id, customers.customer_name, COALESCE(products.product_name, 'No Product') AS product_name
FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id;


#9. Given the following tables; Sales and Products. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
#ans.
SELECT products.product_name, SUM(order_details.quantity * products.price) AS total_sales
FROM order_details
INNER JOIN products ON order_details.product_id = products.product_id
GROUP BY products.product_name;


#10. You are given three tables; Orders, Customers and Order_Details. Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all the three tables.
#ans.
SELECT orders.order_id, customers.customer_name, SUM(order_details.quanity) AS total_quantity
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_id, customers.customer.name;





