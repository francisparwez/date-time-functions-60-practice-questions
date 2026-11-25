-- Module 1 ‒ Retrieving and Component Functions
-- Intermediate ‒ Questions 11‒20

--Q11. Extract the hour of every appointment

--The hospital wants to analyse appointment scheduling patterns throughout the day.
--Retrieve the appointment ID, appointment timestamp, and hour of the appointment in 24-hour format

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    DATEPART (HOUR, AppointmentDateTime) AS HourOfAppointment,
    DATENAME (HOUR, AppointmentDateTime) AS HourOfAppointmentUsingDATENAME
FROM Appointments;

--Q12. Extract minutes and seconds from appointment timestamps

--Retrieve the appointment ID and extract the hour, minute, and second components from AppointmentDateTime into separate columns.

USE HospitalDB;

SELECT
    AppointmentID,
    DATEPART (HOUR, AppointmentDateTime) AS HourOfAppointment,
    DATEPART (MINUTE, AppointmentDateTime) AS MinuteOfAppointment,
    DATEPART (SECOND, AppointmentDateTime) AS SecondOfAppointment
FROM Appointments;

--Q13. Identify appointments scheduled during the morning, afternoon, and evening

--Create a report displaying the appointment ID, appointment timestamp, and a new column categorising appointments into:
--Morning: Before 12 PM
--Afternoon: 12 PM to 5:59 PM
--Evening: 6 PM onwards.

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    CASE
        WHEN DATEPART (HOUR, AppointmentDateTime) < 12 THEN 'Morning'
        WHEN DATEPART (HOUR, AppointmentDateTime) BETWEEN 12 AND 17  THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM Appointments;

-- Q14. Extract the day number of the year for each appointment

-- Retrieve each appointment's ID, appointment date, and the numerical day of the year (1‒366) on which it occurs.

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    DATEPART (
        DAYOFYEAR,
        AppointmentDateTime
    ) AS NumericalDayOfYear
FROM Appointments;

-- Q15. Identify appointments scheduled on weekends
-- Retrieve appointments scheduled on Saturdays and Sundays. Display the appointment ID, appointment timestamp, and weekday name.

-- METHOD 1: Using DATENAME to filter for weekend appointments

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    DATENAME (WEEKDAY, AppointmentDateTime) AS day_of_week
FROM Appointments
WHERE
    DATENAME (WEEKDAY, AppointmentDateTime) IN ('Saturday', 'Sunday');

-- METHOD 2: Using DATEPART to filter for weekend appointments

SELECT @@DATEFIRST AS first_day_of_week;

USE HospitalDB;

SELECT
    AppointmentID,
    AppointmentDateTime,
    DATENAME (WEEKDAY, AppointmentDateTime) AS day_of_week
FROM Appointments
WHERE
    DATEPART (WEEKDAY, AppointmentDateTime) IN (1, 7);