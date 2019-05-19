-- 1
-- CREAR LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS lab_mysql;

-- 3
-- USAR LA BASE DE DATOS
USE lab_mysql;


-- 2
-- CREAR TABLA Cars
CREATE TABLE IF NOT EXISTS Cars (
    vim INT NOT NULL,
    manufacturer VARCHAR(45) NULL,
    model VARCHAR(45) NULL,
    year INT NULL,
    color VARCHAR(45) NULL
);
-- CREAR TABLA Customers
CREATE TABLE IF NOT EXISTS Customers (
    idCustomers INT NOT NULL,
    name VARCHAR(45) NULL,
    phone_number INT NULL,
    email VARCHAR(45) NULL,
    address VARCHAR(45) NULL,
    city VARCHAR(45) NULL,
    state VARCHAR(45) NULL,
    country VARCHAR(45) NULL,
    postal_code INT NULL
);
-- CREAR TABLA Salespersons
CREATE TABLE IF NOT EXISTS Salespersons (
    idSalespersons INT NOT NULL,
    name VARCHAR(45) NULL,
    store VARCHAR(45) NULL
);
-- CREAR TABLA Invoices
CREATE TABLE IF NOT EXISTS Invoices (
    number INT NOT NULL,
    date DATE NULL,
    car VARCHAR(45) NULL,
    customer VARCHAR(45) NULL,
    salesperson VARCHAR(45) NULL
);
  
  