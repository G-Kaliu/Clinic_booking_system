
-- Clinic Booking System SQL Schema
-- Author: [Your Name]
-- Date: [2025-06-07]
-- Description: SQL script to create a relational database for a Clinic Booking System.

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS ClinicBookingDB;
USE ClinicBookingDB;

-- 2. Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 3. Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 4. Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 5. Treatments Table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    method ENUM('Cash', 'Mpesa', 'Card') NOT NULL,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);
