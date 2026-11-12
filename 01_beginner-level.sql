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
    DATEPART (MONTH, DateOfBirth) AS BirthMonthUsingDATEPART
FROM Patients;

--Q5. Extract patients' birth days

--Retrieve each patient's name and the day of the month on which they were born.

USE HospitalDB;

SELECT
    CONCAT(FirstName, ' ', LastName) AS PatientsName,
    DAY(DateOfBirth) AS DayOfBirth,
    DATEPART (DAY, DateOfBirth) AS DayOfBirthUsingDATEPART
FROM Patients;

-- Q6. Extract appointment years

-- Retrieve each appointment's ID, patient ID, and appointment year.

USE HospitalDB;

SELECT
    AppointmentID,
    PatientID,
    YEAR(AppointmentDateTime) AS AppointmentYear,
    DATEPART (YEAR, AppointmentDateTime) AS AppointmentYearUsingDATEPART
FROM Appointments;

-- Q7. Extract multiple appointment date components

-- Retrieve the appointment ID and appointment date, along with its year, month, and day as
-- separate columns

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    YEAR(AppointmentDateTime) AS AppointmentYear,
    MONTH(AppointmentDateTime) AS AppointmentMonth,
    DAY(AppointmentDateTime) AS AppointmentDay
FROM Appointments;

-- Q8. Identify the calendar quarter of appointments

-- Retrieve each appointment's ID, appointment date, and calendar quarter (Q1, Q2, Q3, or Q4).

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    CONCAT(
        'Q',
        DATEPART (QUARTER, AppointmentDateTime)
    ) AS CalendarQuarter
FROM Appointments;

-- Q9. Retrieve patients' birth month names

-- Retrieve each patient's name, date of birth, and full month name instead of a numerical
-- month.

USE HospitalDB;

SELECT
    CONCAT(FirstName, ' ', LastName) AS PatientName,
	DateOfBirth,
    DATENAME(MONTH, DateOfBirth) AS [MonthName]
FROM Patients;