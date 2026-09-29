CREATE DATABASE IF NOT EXISTS event_ticket_booking;

USE event_ticket_booking;

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Events table
CREATE TABLE IF NOT EXISTS events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    venue VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id VARCHAR(10) PRIMARY KEY,
    customer_id INT,
    event_id INT,
    ticket_type VARCHAR(50),
    tickets INT,
    amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (event_id)
        REFERENCES events(event_id)
);

-- Customer data
INSERT INTO customers
(customer_id, name, email, phone)
VALUES
(101, 'Gayathri', 'gayathri@gmail.com', '9876543210'),
(102, 'Priya', 'priya@gmail.com', '9876543211'),
(103, 'Arun', 'arun@gmail.com', '9876543212'),
(104, 'Rahul', 'rahul@gmail.com', '9876543213'),
(105, 'Divya', 'divya@gmail.com', '9876543214');

-- Event data
INSERT INTO events
(event_id, event_name, venue, event_date)
VALUES
(201, 'Tech Fest 2026', 'Chennai Trade Centre', '2026-10-15'),
(202, 'Music Night', 'Phoenix Arena', '2026-10-20'),
(203, 'AI Conference', 'IIT Madras Research Park', '2026-11-05'),
(204, 'Startup Expo', 'Chennai Convention Centre', '2026-11-15'),
(205, 'Coding Hackathon', 'Anna University', '2026-12-01');

-- Booking data
INSERT INTO bookings
(booking_id, customer_id, event_id, ticket_type, tickets, amount)
VALUES
('B1001', 101, 201, 'VIP', 2, 1500.00),
('B1002', 102, 202, 'Regular', 3, 1200.00),
('B1003', 103, 203, 'VIP', 1, 1000.00),
('B1004', 104, 201, 'Regular', 2, 800.00),
('B1005', 105, 204, 'Premium', 4, 2400.00),
('B1006', 101, 205, 'Regular', 1, 500.00);