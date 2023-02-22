-- Updating/Deleting data 

SELECT *
FROM employeedemographics;

UPDATE employeedemographics
SET EmployeeId = 1012
WHERE FirstName = "Holly";

UPDATE employeedemographics
SET Age = 31, Gender = "Female"
WHERE FirstName = "Holly";

-- DELETE statement -> removes an entire row of a table

DELETE FROM employeedemographics
WHERE EmployeeID = 1005;