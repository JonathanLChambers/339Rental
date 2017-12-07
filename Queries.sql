USE RENTAL;
GO

--Query 1
--Objective: Find all employees who make more than $68000.
SELECT F_Name, L_Name
FROM EMPLOYEE
WHERE Salary > 68000;

--Query 2
--Objective: Find the phone numbers of all managers first priority dependent as to speak with them about suprise bonuses; The phone numbers must be local as to not run up long distance billing.
SELECT EMPLOYEE.F_Name, EMPLOYEE.L_Name, DEPENDENTS.F_Name, DEPENDENTS.L_Name, DEPENDENTS.Phone_no
FROM EMPLOYEE, DEPENDENTS, MANAGERS
WHERE EMPLOYEE.SSN = DEPENDENTS.E_SSN AND DEPENDENTS.priority=1 AND EMPLOYEE.SSN=MANAGERS.M_SSN AND (LEFT(DEPENDENTS.Phone_no,1)IN(9));

--Query 3
--Objective: Find all the drivers who are avaliable in Maine
SELECT EMPLOYEE.F_Name, EMPLOYEE.L_Name
FROM EMPLOYEE
INNER JOIN DRIVERS ON EMPLOYEE.SSN = DRIVERS.D_SSN
WHERE (EMPLOYEE.Loc_no=1 OR EMPLOYEE.Loc_no=2) AND DRIVERS.isAvail=1
ORDER BY EMPLOYEE.L_Name ASC;

--Query 4
--Objective: Find the vin number of all vehicles that need to been sold.
SELECT VIN, VEHICLES.Miles, VEH_LIFESPAN.Miles
FROM VEHICLES
RIGHT JOIN VEH_LIFESPAN ON VEHICLES.Miles > VEH_LIFESPAN.Miles
WHERE VEHICLES.Type=VEH_LIFESPAN.Type;

--Query 5
--Objective: Find all employees who do not have More than one dependent
SELECT DISTINCT EMPLOYEE.F_Name, EMPLOYEE.L_Name
FROM EMPLOYEE
INNER JOIN DEPENDENTS ON EMPLOYEE.SSN=DEPENDENTS.E_SSN 
WHERE DEPENDENTS.priority<2;

--Query 6
--Objective: Find all vehicle types who can last more than 100000 miles.
SELECT DISTINCT Type
FROM VEHICLES
WHERE Type IN (SELECT Type FROM VEH_LIFESPAN WHERE Miles>10000);

--Query 7
--Objective: Find all customers whos last name starts with M.
SELECT CUSTOMER.F_Name,CUSTOMER.L_Name
FROM CUSTOMER
WHERE (LEFT(CUSTOMER.L_Name,1)='M');

--Query 8
--Objective: Find all employees who make less than $15000.
SELECT F_Name, L_Name
FROM EMPLOYEE
WHERE Salary < 15000;

--Query 9
--Objective: List all the branches.
SELECT *
FROM LOC;

--Query 10
--Objective: List the first 10 problems.
SELECT *
FROM PROBLEMS
WHERE P_ID < 11;



