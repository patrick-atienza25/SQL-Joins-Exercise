/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT categories.Name, products.Name
FROM categories
INNER JOIN products
ON products.CategoryID = categories.CategoryID
WHERE categories.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS 'Total'
FROM employees
JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY Total desc;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS "Departments Name", categories.Name AS "Categories Name"
FROM departments
LEFT JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT products.Name, SUM(sales.Quantity) AS 'Quantity sold', (products.Price * SUM(sales.Quantity)) AS Total
FROM products
JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.Lastname, p.Name, s.Quantity
FROM employees AS e, products AS p
JOIN sales AS s
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY p.Name, e.FirstName, e.LastName;