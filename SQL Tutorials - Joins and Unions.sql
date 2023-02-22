SELECT * 
FROM employeedemographics;

SELECT * 
FROM employeesalary;

SELECT employeedemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID;

-- in MySQL, the FULL OUTER JOIN syntax is not supported. Use the UNION to achieve the same result :operator as shown above.
SELECT *
FROM employeedemographics
LEFT OUTER JOIN warehouseemployeedemographics ON employeedemographics.EmployeeID = warehouseemployeedemographics.EmployeeID
UNION
SELECT *
FROM employeedemographics
RIGHT OUTER JOIN warehouseemployeedemographics ON employeedemographics.EmployeeID = warehouseemployeedemographics.EmployeeID
WHERE employeedemographics.EmployeeID IS NULL;

-- Use case 1
-- Now we want to identify the person who makes the most money besides Michael Scott

SELECT employeedemographics.EmployeeID, FirstName, LastName, Salary
FROM employeedemographics
INNER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID
WHERE FirstName != "Michael"
ORDER BY Salary DESC;

-- Use case 2
-- Calculate the average salary for a salesman

SELECT JobTitle, avg(Salary) as AverageSalary
FROM employeedemographics
INNER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID
WHERE JobTitle = "Salesman";

-- Using Unions
-- Union removes duplicates, like a DISTINCT statement
SELECT * 
FROM employeedemographics
UNION
SELECT * 
FROM warehouseemployeedemographics;