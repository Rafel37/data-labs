-- 1
-- CREAR LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS lab_mysql;

-- 3
-- USAR LA BASE DE DATOS
USE lab_mysql;


-- 2
-- CREAR TABLA Cars
CREATE TABLE IF NOT EXISTS Cars (
    car_id INT NOT NULL AUTO_INCREMENT,
    vim VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45) NULL,
    model VARCHAR(45) NULL,
    year INT NULL,
    color VARCHAR(45) NULL,
    PRIMARY KEY (car_id)
);
-- CREAR TABLA Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_id_number INT NOT NULL,
    name VARCHAR(45) NULL,
    phone_number VARCHAR(45) NULL,
    email VARCHAR(45) NULL,
    address VARCHAR(45) NULL,
    city VARCHAR(45) NULL,
    state VARCHAR(45) NULL,
    country VARCHAR(45) NULL,
    postal_code INT NULL,
    PRIMARY KEY (customer_id)
);
-- CREAR TABLA Salespersons
CREATE TABLE IF NOT EXISTS Salespersons (
    salesperson_id INT NOT NULL AUTO_INCREMENT,
    salesperson_id_number INT NOT NULL,
    name VARCHAR(45) NULL,
    store VARCHAR(45) NULL,
    PRIMARY KEY (salesperson_id)
);
-- CREAR TABLA Invoices
CREATE TABLE IF NOT EXISTS Invoices (
    invoices_id INT NOT NULL AUTO_INCREMENT,
    number INT NOT NULL,
    date VARCHAR(20) NULL,
    car_id INT NOT NULL,
    customer_id INT NOT NULL,
    salesperson_id INT NOT NULL,
    PRIMARY KEY (invoices_id)
);
  