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