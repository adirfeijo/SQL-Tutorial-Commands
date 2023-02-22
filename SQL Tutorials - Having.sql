-- HAVING clause 
-- example 1
SELECT JobTitle, COUNT(JobTitle)
FROM employeedemographics
INNER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1;

-- example 2
SELECT JobTitle, AVG(Salary)
FROM employeedemographics
INNER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary);