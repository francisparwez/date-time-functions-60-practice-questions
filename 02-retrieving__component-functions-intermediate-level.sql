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