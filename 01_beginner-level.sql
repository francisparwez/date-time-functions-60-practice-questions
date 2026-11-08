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