#1. Create a table called employees with the following structure:
    # emp_id(integer, should not be NULL and should be a primary key.
    # emp_name(text, should not be NULL).
    # age(integer, should have a check constraint to ensure the age is at least 18)
    # email(text, should be unique for each employee).
    # salary(decimal, with a default value of 30,000).
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
# Constraints help maintain data integrity by ensuring that only valid data is entered.

# Common Constraints:

# NOT NULL - Ensures a column cannot have NULL values.
# UNIQUE - Ensures all values in a column are unique.
# PRIMARY KEY - Ensures uniqueness and is a unique identifier.
# FOREIGN KEY - Establishes relationships between tables.
# CHECK - Ensures values meet a specific condition.
# DEFAULT - Assigns a default value if none is provided.

#3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
#ans.
# NOT NULL ensures a column always has a value.
# A Primary Key cannot contain NULL values because it uniquely identifies records.

#4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
#ans. 
# Add a constraint:
ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 20000);

#Remove a constraint:
ALTER TABLE employees DROP CONSTRAINT check_salary;

#5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
#ans.
# Trying to insert a record that violates constraints results in errors.
# Example:
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (1, 'Chandan Singh', 16, 'chandansingh@gmail.com', 30000);

# ERROR: CHECK constraint failed: age >= 18.

#6. 




