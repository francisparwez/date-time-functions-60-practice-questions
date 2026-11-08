-- =========================================
-- 1. CREATE DATABASE
-- =========================================

CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO

-- =========================================
-- 2. PATIENTS TABLE
-- =========================================

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    RegistrationDate DATETIME2 (0)
);

-- =========================================
-- 3. DOCTORS TABLE
-- =========================================

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialisation VARCHAR(50),
    JoiningDate DATE
);

-- =========================================
-- 4. APPOINTMENTS TABLE
-- =========================================

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME2 (0),
    AppointmentStatus VARCHAR(20),
    BookingDateTime DATETIME2 (0),
    FOREIGN KEY (PatientID) REFERENCES Patients (PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors (DoctorID)
);

-- =========================================
-- 5. BILLING TABLE
-- =========================================

CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    AppointmentID INT,
    BillDate DATETIME2 (0),
    PaymentDate DATETIME2 (0) NULL,
    Amount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments (AppointmentID)
);

-- =========================================
-- PATIENTS
-- =========================================

INSERT INTO
    Patients
VALUES (
        1,
        'Ahmed',
        'Khan',
        'Male',
        '1995-04-15',
        '2024-01-10 09:30:00'
    ),
    (
        2,
        'Sara',
        'Ahmed',
        'Female',
        '1990-08-22',
        '2024-03-15 11:45:00'
    ),
    (
        3,
        'Ali',
        'Hassan',
        'Male',
        '1985-12-05',
        '2024-06-20 14:20:00'
    ),
    (
        4,
        'Fatima',
        'Raza',
        'Female',
        '2000-02-29',
        '2025-01-05 10:15:00'
    ),
    (
        5,
        'Usman',
        'Malik',
        'Male',
        '1978-11-18',
        '2025-02-10 16:30:00'
    ),
    (
        6,
        'Ayesha',
        'Noor',
        'Female',
        '1998-06-12',
        '2025-05-25 08:00:00'
    ),
    (
        7,
        'Bilal',
        'Shah',
        'Male',
        '2002-09-30',
        '2025-08-14 12:10:00'
    ),
    (
        8,
        'Hina',
        'Iqbal',
        'Female',
        '1988-01-07',
        '2025-11-20 13:45:00'
    ),
    (
        9,
        'Zain',
        'Ali',
        'Male',
        '1992-03-19',
        '2026-01-12 09:00:00'
    ),
    (
        10,
        'Maryam',
        'Khan',
        'Female',
        '1996-07-25',
        '2026-04-18 15:30:00'
    );

-- =========================================
-- DOCTORS
-- =========================================

INSERT INTO
    Doctors
VALUES (
        101,
        'Dr. James',
        'Cardiology',
        '2018-03-12'
    ),
    (
        102,
        'Dr. Sarah',
        'Neurology',
        '2019-07-20'
    ),
    (
        103,
        'Dr. Ahmed',
        'Dermatology',
        '2020-01-15'
    ),
    (
        104,
        'Dr. Michael',
        'Orthopaedics',
        '2021-09-01'
    ),
    (
        105,
        'Dr. Emily',
        'Paediatrics',
        '2022-05-10'
    );

-- =========================================
-- APPOINTMENTS
-- =========================================

INSERT INTO
    Appointments
VALUES (
        1001,
        1,
        101,
        '2025-01-15 09:00:00',
        'Completed',
        '2025-01-10 10:00:00'
    ),
    (
        1002,
        2,
        102,
        '2025-02-20 11:30:00',
        'Completed',
        '2025-02-15 14:00:00'
    ),
    (
        1003,
        3,
        103,
        '2025-03-10 14:00:00',
        'Cancelled',
        '2025-03-01 09:30:00'
    ),
    (
        1004,
        4,
        104,
        '2025-04-25 16:00:00',
        'Completed',
        '2025-04-20 12:00:00'
    ),
    (
        1005,
        5,
        105,
        '2025-06-05 10:30:00',
        'Pending',
        '2025-05-30 15:00:00'
    ),
    (
        1006,
        6,
        101,
        '2025-08-12 13:00:00',
        'Completed',
        '2025-08-01 11:00:00'
    ),
    (
        1007,
        7,
        102,
        '2025-10-18 09:30:00',
        'Completed',
        '2025-10-10 16:00:00'
    ),
    (
        1008,
        8,
        103,
        '2025-12-22 15:00:00',
        'Cancelled',
        '2025-12-15 10:00:00'
    ),
    (
        1009,
        9,
        104,
        '2026-02-14 12:00:00',
        'Completed',
        '2026-02-05 13:00:00'
    ),
    (
        1010,
        10,
        105,
        '2026-05-30 17:30:00',
        'Pending',
        '2026-05-20 09:00:00'
    );

-- =========================================
-- BILLING
-- =========================================

INSERT INTO
    Billing
VALUES (
        5001,
        1001,
        '2025-01-15 10:00:00',
        '2025-01-15 10:30:00',
        5000,
        'Paid'
    ),
    (
        5002,
        1002,
        '2025-02-20 12:30:00',
        '2025-02-20 13:00:00',
        7500,
        'Paid'
    ),
    (
        5003,
        1003,
        '2025-03-10 14:30:00',
        NULL,
        3000,
        'Unpaid'
    ),
    (
        5004,
        1004,
        '2025-04-25 16:30:00',
        '2025-04-25 17:00:00',
        6000,
        'Paid'
    ),
    (
        5005,
        1005,
        '2025-06-05 11:00:00',
        NULL,
        4500,
        'Pending'
    ),
    (
        5006,
        1006,
        '2025-08-12 13:30:00',
        '2025-08-12 14:00:00',
        8000,
        'Paid'
    ),
    (
        5007,
        1007,
        '2025-10-18 10:00:00',
        '2025-10-18 10:30:00',
        5500,
        'Paid'
    ),
    (
        5008,
        1008,
        '2025-12-22 15:30:00',
        NULL,
        3500,
        'Unpaid'
    ),
    (
        5009,
        1009,
        '2026-02-14 12:30:00',
        '2026-02-14 13:00:00',
        9000,
        'Paid'
    ),
    (
        5010,
        1010,
        '2026-05-30 18:00:00',
        NULL,
        6500,
        'Pending'
    );

SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Appointments;

SELECT * FROM Billing;