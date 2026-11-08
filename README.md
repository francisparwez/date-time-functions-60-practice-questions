# 60 SQL Server Date & Time Functions Practice Questions

A structured collection of **60 beginner-to-intermediate T-SQL practice questions** focused on SQL Server date and time functions. The exercises use a realistic **Hospital Booking and Management System** to explore date extraction, date arithmetic, formatting, conversions, and time-zone handling in practical reporting scenarios.

## Project Overview

This project is designed to strengthen SQL Server skills through hands-on exercises involving patient registrations, doctor joining dates, appointment scheduling, and billing records.

- **Database:** Microsoft SQL Server (`HospitalDB`)
- **Language:** Transact-SQL (T-SQL)
- **Practice questions:** 60 (30 beginner, 30 intermediate)
- **Modules:** 3, with 20 questions each
- **Practice environment:** SQL Server Management Studio (SSMS) or another SQL Server client

The question bank is provided without solutions to encourage independent problem-solving. Completed SQL solutions are maintained in separate `.sql` files and added as the exercises are completed.

## Learning Objectives

- Retrieve current server timestamps, including local server time and high-precision UTC time, and extract individual date components.
- Calculate elapsed time, deadlines, anniversaries, and reporting periods.
- Work with month boundaries, NULL payment dates, and date validation.
- Convert and format dates for reporting and presentation.
- Interpret timestamps across time zones and build date-based analytical reports.

## Practice Modules

| Module                                             | Level                   | Questions | Topics                                                                                                                          |
| -------------------------------------------------- | ----------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **1. Retrieving and Component Functions**          | Beginner / Intermediate | 1–20      | `GETDATE()`, `CURRENT_TIMESTAMP`, `SYSDATETIME()`, `SYSUTCDATETIME()`, `YEAR()`, `MONTH()`, `DAY()`, `DATEPART()`, `DATENAME()` |
| **2. Math and Modification Functions**             | Beginner / Intermediate | 21–40     | `DATEADD()`, `DATEDIFF()`, `EOMONTH()`, `ISDATE()`                                                                              |
| **3. Formatting, Conversions, and Advanced Logic** | Beginner / Intermediate | 41–60     | `CAST()`, `CONVERT()`, `TRY_CONVERT()`, `FORMAT()`, `AT TIME ZONE`                                                              |

Each module contains **10 beginner** and **10 intermediate** exercises. The final question combines multiple techniques into a comprehensive appointment reporting query.

## Database Schema

The `HospitalDB` sample database contains four related tables:

| Table          | Description                              | Key date/time columns                    |
| -------------- | ---------------------------------------- | ---------------------------------------- |
| `Patients`     | Patient details and registration records | `DateOfBirth`, `RegistrationDate`        |
| `Doctors`      | Doctor profiles and employment dates     | `JoiningDate`                            |
| `Appointments` | Patient–doctor appointments and bookings | `AppointmentDateTime`, `BookingDateTime` |
| `Billing`      | Invoices, payments, and payment statuses | `BillDate`, `PaymentDate`                |

**Relationships:**

- `Appointments.PatientID` → `Patients.PatientID`
- `Appointments.DoctorID` → `Doctors.DoctorID`
- `Billing.AppointmentID` → `Appointments.AppointmentID`

The setup script creates the tables with primary and foreign keys and inserts **10 patients, 5 doctors, 10 appointments, and 10 billing records**. Date-only fields use `DATE`, while timestamps use `DATETIME2(0)`. Some billing records have `NULL` payment dates to support missing-value exercises.

## Repository Structure

```text
sql-server-date-time-functions-60-practice-questions/
├── README.md
├── 00_hospital_database_setup.sql
├── 01_beginner-level.sql
├── 60 Date & Time Functions PRACTICE QUESTIONS 01.pdf
└── 60 Date & Time Functions PRACTICE QUESTIONS 02.pdf
```

**Planned solution files** (add as you complete the remaining exercises):

```text
02_math_modification_functions.sql
03_formatting_conversions_advanced_logic.sql
```

The first PDF contains the database walkthrough and initial guided exercises; the second contains the complete 60-question practice workbook without solutions.

## Completed Implementations

The `01_beginner-level.sql` file currently contains the first two beginner exercises from Module 1:

| Question | Objective                                                       | Implementation                                                                                                                    |
| -------- | --------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **Q1**   | Retrieve the current server date and time.                      | Uses `CURRENT_TIMESTAMP` with the `CurrentDateTime` alias.                                                                        |
| **Q2**   | Retrieve current timestamps with higher precision for auditing. | Uses `SYSDATETIME()` for the server's high-precision local timestamp and `SYSUTCDATETIME()` for the high-precision UTC timestamp. |

**Progress:** Module 1 Questions 1–2 have been implemented. Questions 3–20 and Modules 2–3 remain to be completed.

## Getting Started

1. Open **SQL Server Management Studio (SSMS)** and connect to a SQL Server instance.
2. Open `00_hospital_database_setup.sql` and execute it to create `HospitalDB`, its four tables, and the sample records. Run the setup script **once** on a fresh database.
3. Confirm the sample data is available:

   ```sql
   USE HospitalDB;
   GO

   SELECT * FROM Patients;
   SELECT * FROM Doctors;
   SELECT * FROM Appointments;
   SELECT * FROM Billing;
   ```

4. Open `60 Date & Time Functions PRACTICE QUESTIONS 02.pdf` and work through the exercises in numerical order.
5. Write and execute your solutions in the corresponding `.sql` files. The completed Q1 and Q2 queries are in `01_beginner-level.sql`.

> **Note:** `CURRENT_TIMESTAMP` returns the current SQL Server system date and time. `SYSDATETIME()` returns a higher-precision local timestamp, while `SYSUTCDATETIME()` returns a higher-precision UTC timestamp. Questions using current-time functions produce results relative to the SQL Server system clock. Date parsing, weekday names, and `ISDATE()` results may depend on session language and date-format settings. Time-zone questions state assumptions about the source timestamps.

## Progress Tracker

- [ ] **Module 1:** Retrieving and Component Functions (Q1–Q20; Q1–Q2 implemented)
- [ ] **Module 2:** Math and Modification Functions (Q21–Q40)
- [ ] **Module 3:** Formatting, Conversions, and Advanced Logic (Q41–Q60)

**Current status:** Database schema and sample data prepared; Module 1 beginner Questions 1–2 implemented in `01_beginner-level.sql`. Remaining SQL solutions will be added progressively.

## Project Purpose

This repository documents hands-on T-SQL learning through realistic, date-driven hospital operations. It is intended to build confidence in writing SQL queries for data analysis, operational reporting, and business scenarios.
