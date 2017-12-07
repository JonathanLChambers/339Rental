USE RENTAL;
GO

--Query 1
--Objective: Find all employees who make more than $55000.
SELECT F_Name, L_Name
FROM EMPLOYEE
WHERE Salary > 55000;

--Query 2
--Objective: Find the phone numbers of all managers first priority dependent as to speak with them about suprise bonuses;
SELECT EMPLOYEE.F_Name, EMPLOYEE.L_Name, DEPENDENTS.F_Name, DEPENDENTS.L_Name, DEPENDENTS.Phone_no
FROM EMPLOYEE, DEPENDENTS, MANAGERS
WHERE EMPLOYEE.SSN = DEPENDENTS.E_SSN AND DEPENDENTS.priority=1 AND EMPLOYEE.SSN=MANAGERS.M_SSN;

