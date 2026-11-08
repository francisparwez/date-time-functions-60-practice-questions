# 60 SQL Server Date & Time Functions Practice Questions

A structured collection of **60 beginner-to-intermediate T-SQL practice questions** focused on SQL Server date and time functions. The exercises use a realistic **Hospital Booking and Management System** to explore date extraction, date arithmetic, formatting, conversions, and time-zone handling in practical reporting scenarios.

## Project Overview

This project is designed to strengthen SQL Server skills through hands-on exercises involving patient registrations, doctor joining dates, appointment scheduling, and billing records.

- **Database:** Microsoft SQL Server (`HospitalDB`)
- **Language:** Transact-SQL (T-SQL)
- **Practice questions:** 60 (30 beginner, 30 intermediate)
- **Modules:** 3, with 20 questions each
- **Practice environment:** SQL Server Management Studio (SSMS) or another SQL Server client

The question bank is provided without solutions to encourage independent problem-solving. SQL solution files can be added as the exercises are completed.

## Learning Objectives

- Retrieve current server dates and timestamps and extract individual date components.
- Calculate elapsed time, deadlines, anniversaries, and reporting periods.
- Work with month boundaries, NULL payment dates, and date validation.
- Convert and format dates for reporting and presentation.
- Interpret timestamps across time zones and build date-based analytical reports.

## Practice Modules

| Module                                             | Level                   | Questions | Topics                                                                                 |
| -------------------------------------------------- | ----------------------- | --------- | -------------------------------------------------------------------------------------- |
| **1. Retrieving and Component Functions**          | Beginner / Intermediate | 1–20      | `GETDATE()`, `SYSDATETIME()`, `YEAR()`, `MONTH()`, `DAY()`, `DATEPART()`, `DATENAME()` |
| **2. Math and Modification Functions**             | Beginner / Intermediate | 21–40     | `DATEADD()`, `DATEDIFF()`, `EOMONTH()`, `ISDATE()`                                     |
| **3. Formatting, Conversions, and Advanced Logic** | Beginner / Intermediate | 41–60     | `CAST()`, `CONVERT()`, `TRY_CONVERT()`, `FORMAT()`, `AT TIME ZONE`                     |

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
├── 60 Date & Time Functions PRACTICE QUESTIONS 01.pdf
└── 60 Date & Time Functions PRACTICE QUESTIONS 02.pdf
```

**Planned solution files** (add as you complete the modules):

```text
01_retrieving_component_functions.sql
02_math_modification_functions.sql
03_formatting_conversions_advanced_logic.sql
```

The first PDF contains the database walkthrough and initial guided exercises; the second contains the complete 60-question practice workbook without solutions.

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
5. Save your solutions in separate `.sql` files, grouped by module, as you progress.

> **Note:** Questions using `GETDATE()` or `SYSDATETIME()` produce results relative to the SQL Server system clock. Date parsing, weekday names, and `ISDATE()` results may depend on session language and date-format settings. Time-zone questions state assumptions about the source timestamps.

## Progress Tracker

- [ ] **Module 1:** Retrieving and Component Functions (Q1–Q20)
- [ ] **Module 2:** Math and Modification Functions (Q21–Q40)
- [ ] **Module 3:** Formatting, Conversions, and Advanced Logic (Q41–Q60)

**Current status:** Database setup and practice materials prepared; SQL solutions to be added progressively.

## Project Purpose

This repository documents hands-on T-SQL learning through realistic, date-driven hospital operations. It is intended to build confidence in writing SQL queries for data analysis, operational reporting, and business scenarios.
