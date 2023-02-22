-- Using CASE Statements

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN "Old"
    ELSE "Young"
END as Young_or_Old
FROM employeedemographics
WHERE AGE IS NOT NULL
ORDER BY AGE;

-- Calculate what salary employees will have after a raise

SELECT FirstName, LastName, JobTitle, Salary,
CASE 
	WHEN JobTitle = "Salesman" THEN Salary + (Salary * 0.10)
    WHEN JobTitle = "Accountant" THEN Salary + (Salary * 0.05)
    WHEN JobTitle = "HR" THEN Salary + (Salary * 0.000001)
    ELSE Salary + (Salary * 0.03)
END as SalaryAfterRaise
FROM employeedemographics
INNER JOIN employeesalary
ON employeedemographics.EmployeeID = employeesalary.EmployeeID;