-- DATA ANALYST SQL PROJECT
-- Employee Performance Analysis
-- SQLite / SQL Fiddle

-- 1. CREATE TABLE
CREATE TABLE employees (
    Name TEXT,
    Age INTEGER,
    Gender TEXT,
    Department TEXT,
    Salary INTEGER,
    Performance INTEGER
);

-- 2. INSERT EMPLOYEE DATA
INSERT INTO employees (Name, Age, Gender, Department, Salary, Performance) VALUES
('Aishat', 24, 'Female', 'HR', 150000, 85),
('John', 31, 'Male', 'IT', 300000, 88),
('Mary', 26, 'Female', 'Finance', 200000, 78),
('Yusuf', 29, 'Male', 'IT', 250000, 92),
('Fatimah', 23, 'Female', 'HR', 170000, 95),
('Daniel', 28, 'Male', 'Finance', 220000, 81),
('Blessing', 25, 'Female', 'IT', 240000, 90),
('Ibrahim', 30, 'Male', 'HR', 180000, 76);

-- 3. VIEW ALL EMPLOYEES
SELECT * FROM employees;

-- 4. SELECT NAMES
SELECT Name FROM employees;

-- 5. FILTER BY DEPARTMENT
SELECT * FROM employees
WHERE Department = 'IT';

-- 6. SALARY ABOVE 200,000
SELECT * FROM employees
WHERE Salary > 200000;

-- 7. PERFORMANCE 90 OR ABOVE
SELECT * FROM employees
WHERE Performance >= 90;

-- 8. ORDER BY SALARY
SELECT * FROM employees
ORDER BY Salary DESC;

-- 9. SELECT SPECIFIC COLUMNS
SELECT Name, Department, Salary
FROM employees;

-- 10. COUNT EMPLOYEES
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- 11. TOTAL SALARY
SELECT SUM(Salary) AS Total_Salary
FROM employees;

-- 12. AVERAGE SALARY
SELECT AVG(Salary) AS Average_Salary
FROM employees;

-- 13. EMPLOYEES BY DEPARTMENT
SELECT Department, COUNT(*) AS Number_of_Employees
FROM employees
GROUP BY Department;

-- 14. AVERAGE SALARY BY DEPARTMENT
SELECT Department,
       ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees
GROUP BY Department;

-- 15. HIGHEST SALARY
SELECT MAX(Salary) AS Highest_Salary
FROM employees;

-- 16. LOWEST SALARY
SELECT MIN(Salary) AS Lowest_Salary
FROM employees;

-- 17. PERFORMANCE LEVEL WITH CASE WHEN
SELECT
    Name,
    Performance,
    CASE
        WHEN Performance >= 80 THEN 'Excellent'
        WHEN Performance >= 70 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS Performance_Level
FROM employees;

-- 18. AND CONDITION
SELECT Name, Department, Salary, Performance
FROM employees
WHERE Salary > 200000
AND Performance >= 80;

-- 19. OR CONDITION
SELECT Name, Department, Salary
FROM employees
WHERE Department = 'HR'
OR Department = 'Finance';

-- 20. OR WITH PERFORMANCE
SELECT Name, Department, Salary, Performance
FROM employees
WHERE Department = 'IT'
OR Performance >= 95;

-- 21. IN
SELECT Name, Department, Salary
FROM employees
WHERE Department IN ('HR', 'Finance');

-- 22. LIKE - NAMES STARTING WITH A
SELECT Name
FROM employees
WHERE Name LIKE 'A%';

-- 23. LIKE - NAMES ENDING WITH H
SELECT Name
FROM employees
WHERE Name LIKE '%h';

-- 24. LIKE - NAMES CONTAINING I
SELECT Name
FROM employees
WHERE Name LIKE '%i%';

-- 25. DISTINCT DEPARTMENTS
SELECT DISTINCT Department
FROM employees;

-- 26. HAVING
SELECT Department, COUNT(*) AS Number_of_Employees
FROM employees
GROUP BY Department
HAVING COUNT(*) > 2;

-- 27. TOTAL SALARY BY DEPARTMENT
SELECT Department, SUM(Salary) AS Total_Salary
FROM employees
GROUP BY Department;

-- 28. AVERAGE SALARY BY DEPARTMENT, ROUNDED
SELECT Department,
       ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees
GROUP BY Department;

-- 29. DEPARTMENTS ORDERED BY TOTAL SALARY
SELECT Department, SUM(Salary) AS Total_Salary
FROM employees
GROUP BY Department
ORDER BY Total_Salary DESC;

-- 30. DEPARTMENTS ORDERED BY AVERAGE SALARY
SELECT Department,
       ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Salary DESC;

-- 31. MINI-PROJECT: PERFORMANCE >= 80 AND SALARY > 200,000
SELECT Name, Department, Salary, Performance
FROM employees
WHERE Performance >= 80
AND Salary > 200000;

-- 32. DEPARTMENTS WITH AVERAGE PERFORMANCE >= 85
SELECT Department,
       ROUND(AVG(Performance), 2) AS Average_Performance
FROM employees
GROUP BY Department
HAVING AVG(Performance) >= 85;

-- 33. HIGHEST-PERFORMING EMPLOYEE
SELECT Name, Department, Performance
FROM employees
ORDER BY Performance DESC
LIMIT 1;

-- 34. DEPARTMENT WITH MOST EMPLOYEES
SELECT Department,
       COUNT(*) AS Number_of_Employees
FROM employees
GROUP BY Department
ORDER BY Number_of_Employees DESC
LIMIT 1;

-- 35. EMPLOYEES BELOW PERFORMANCE 80
SELECT COUNT(*) AS Employees_Below_80
FROM employees
WHERE Performance < 80;

-- 36. TOTAL IT SALARY
SELECT SUM(Salary) AS IT_Total_Salary
FROM employees
WHERE Department = 'IT';

-- 37. AVERAGE PERFORMANCE BY DEPARTMENT
SELECT Department,
       ROUND(AVG(Performance), 2) AS Average_Performance
FROM employees
GROUP BY Department
ORDER BY Average_Performance DESC;

-- 38. AVERAGE PERFORMANCE BY DEPARTMENT
SELECT Department,
       ROUND(AVG(Performance), 2) AS Average_Performance
FROM employees
GROUP BY Department;

-- 39. EMPLOYEES BELOW THEIR DEPARTMENT'S AVERAGE
SELECT Name,
       Department,
       Performance
FROM employees
WHERE Performance < (
    SELECT AVG(e2.Performance)
    FROM employees e2
    WHERE e2.Department = employees.Department
);

-- 40. DEPARTMENT WITH HIGHEST AVERAGE SALARY
SELECT Department,
       ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Salary DESC
LIMIT 1;

-- 41. PASS PERCENTAGE (PERFORMANCE >= 80)
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Performance >= 80 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Pass_Percentage
FROM employees;

-- KEY PROJECT RESULTS
-- Total employees: 8
-- Total salary: 1,710,000
-- Average salary: 213,750
-- Highest salary: 300,000 (John)
-- Lowest salary: 150,000
-- Highest performance: 95 (Fatimah)
-- Employees below 80 performance: 2
-- IT total salary: 790,000
-- IT average salary: 263,333.33
-- IT average performance: 90.00
-- HR average performance: 85.33
-- Finance average performance: 79.50
-- Pass percentage: 75%
