-- CTE : Common Table Expression
-- A CTE is not stored anywhere

WITH CTE_Employee as
(SELECT FirstName, LastName, Gender, Salary, count(Gender) OVER (partition by Gender) as TotalGender, avg(Salary) over (partition by Salary) as AvgSalary
FROM employeedemographics as emp
INNER JOIN employeesalary as sal
ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > "45000")
SELECT FirstName, AvgSalary
FROM CTE_Employee;

-- Temp tables

CREATE TEMPORARY TABLE temp_Employee 
(
EmployeeID int,
JobTitle varchar(100),
Salary int
);

SELECT *
FROM temp_Employee;

INSERT INTO temp_Employee
VALUES (
"1001", "HR", "45000"
);

INSERT INTO temp_Employee
SELECT *
FROM employeesalary;

DELETE FROM temp_Employee
WHERE EmployeeID = 1001 AND JobTitle ="HR";

CREATE TEMPORARY TABLE temp_Employee2 
(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
);

INSERT INTO temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM employeedemographics as emp
INNER JOIN employeesalary as sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle;

SELECT *
FROM temp_Employee2;