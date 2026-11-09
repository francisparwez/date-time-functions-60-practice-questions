-- Q1. Retrieve the current date and time

-- The hospital management system needs to display the current server date and time. Write a
-- query to retrieve the current date and time.

SELECT CURRENT_TIMESTAMP AS CurrentDateTime;

-- Q2. Retrieve the current date and time with higher precision

-- The technical team wants a more precise timestamp for system auditing. Retrieve the
-- current system date and time using the appropriate high-precision function

SELECT
    SYSDATETIME () AS HighPrecisionDateTime,
    SYSUTCDATETIME () AS HighPrecisionUTCTime;

-- Q3. Extract patients' birth years

-- Retrieve each patient's PatientID , FirstName , LastName , and year of birth.

USE HospitalDB;

SELECT
    PatientID,
    FirstName,
    LastName,
    YEAR(DateOfBirth) AS BirthYear,
    DATEPART (year, DateOfBirth) AS BirthYear
FROM Patients;

--Q4. Extract patients' birth months

--Retrieve each patient's name and the numerical month in which they were born.

SELECT
    CONCAT(FirstName, ' ', LastName) AS PatientName,
    MONTH(DateOfBirth) AS BirthMonth,
    DATEPART (MONTH, DateOfBirth) AS BirthMonthUsingDatePart
FROM Patients;

--Q5. Extract patients' birth days

--Retrieve each patient's name and the day of the month on which they were born.

USE HospitalDB;

SELECT
    CONCAT(FirstName, ' ', LastName) AS PatientsName,
    DAY(DateOfBirth) AS DayOfBirth,
    DATEPART (DAY, DateOfBirth) AS DayOfBirthUsingDatePart
FROM Patients;